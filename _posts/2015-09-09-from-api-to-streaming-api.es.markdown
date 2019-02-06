---
layout: post
title: 'De una API a una Streaming API'
ref: APIStreaming
lang: es
author: Norberto Herz
tags: API Streaming Long Polling
description: "Entendiendo las diferencias entre una API y una Stremaing API y utilizando streamdata.io para convertir una en la otra sin tocar una sola línea de código"
---

Son muchas las ventajas de desarrollar una *API* que exponga los recursos de nuestra aplicación. En particular, se logra reducir al mínimo el acoplamiento entre *capas*, y mejor aún **permite que distintas aplicaciones accedan a nuestros recursos**. En el caso de *APIs* bien diseñadas, además, esto ocurrirá de una forma intuitiva.  
Pero incluso las mejores *APIs* pueden estar implementadas para que el cliente realice una llamada cada vez que quiere conocer el estado de un recurso. Para este caso, la *API* deberá devolver el recurso entero cada vez que sea solicitado.  
Pero, ¿no sería más eficiente si la *API* solo devolviera lo que cambió desde la última vez que fue consultada? ¿Y no sería incluso más eficiente si el cliente no necesitara llamar a la *API* para chequear si algo cambió?  
***Streaming APIs*** (y su buena implementación) apuntan exactamente a esto. En este *post* veremos cómo pueden ser implementadas, y cómo funciona [streamdata.io](http://streamdata.io) para convertir una *API* tradicional en una *Streaming API*.
<!--MORE-->

## Streaming APIs

**Una *Streaming API* es capaz de enviar notificaciones al cliente.**  
En los esquemas tradicionales de *HTTP* (protocolo en el que se basan las *webAPIs*), el cliente envía un *request* al servidor. El servidor lo recibe, interpreta, incluso llama a los *listeners* correspondientes (si los hubiera) y devuelve un *response* al cliente. Bajo este esquema, una vez que el servidor envió el *response*, no puede enviar nada más al cliente hasta que este último realice un nuevo *request*.

![Traditional HTTP Request](/img/posts/traditional-request.png)

Pero es posible que nuestro servidor reciba el *request*, lo procese, incluso envíe un *response* pero en lugar de cerrarlo, lo deje en un estado *on-hold*. De esta forma, el server podría seguir enviando información al cliente por un período prolongado de tiempo. Esta técnica es conocida como ***long polling***.

![Long Polling HTTP Request](/img/posts/long-polling-request.png)

Mediante *long polling*, nuestra *API* podría recibir una llamada y proveer el recurso que está siendo solicitado como primer *response* pero, en lugar de cerrar la conexión, la *API* podría enviar nuevos *responses* en caso de que el recurso cambie luego del primer *response*.  
Adicionalmente, la *API* podría enviar solo las "novedades" referentes al recurso, o en otras palabras "lo que cambió".  

Analicemos el siguiente ejemplo

![Streaming API example](/img/posts/streaming-API-example.png)

1- El cliente 1 envía un *request* con método *GET* para solicitar el libro con id 123321.  
2- El servidor devuelve un *response* al cliente 1 con código *200 OK* y un *JSON* con la información del libro.
{% highlight javascript %}
{
  "id": 123321,
  "title": "My book",
  "ISBN": 123321,
  "Edition": "4th"
  "Year": 2015,
  ... // Asumamos una estructura compleja y una gran cantidad de campos
}
{% endhighlight %}
3- El cliente 2 envía un *request* con método *PATCH* para modificar la edición (ahora "5th").  
4- El servidor envía un *response* al cliente 2 con código *200 OK*.  
5- El servidor envía un *response* al cliente 1 con código *200 OK* y un *JSON* con la información del libro.  
{% highlight javascript %}
{
  "id": 123321,
  "title": "My book",
  "ISBN": 123321,
  "Edition": "5th"
  "Year": 2015,
  ... // Asumamos una estructura compleja y una gran cantidad de campos
}
{% endhighlight %}


**Nota:** Se deja de lado la discusión acerca de los métodos a utilizar (*PATCH* o *PUT*) y los códigos *HTTP* correspondientes. Esta temática amerita un *post* aparte.

Gracias a que el servidor implementa *long polling*, la *API* puede informar al cliente, que el recurso que había solicitado en primer lugar ha cambiado, sin que el cliente realice una segunda consulta.  
Al proceso por el cual las *APIs* notifican *proactivamente* al cliente sobre cambios en los recursos se lo conoce como *Push Notification*. Cabe aclarar que *long polling* no es la única forma de lograr este comportamiento. [*WebSockets*](https://www.websocket.org/) es otra especificación que logra un comportamiento similar.  

A pesar de que en el ejemplo se puede ver la conveniencia de implementar *Push Notifications* como parte de nuestra *Streaming API*, no se ve un impacto en cuanto a la performance. Si bien es cierto que el cliente no estará enviando un *request* periódicamente para verificar si el recurso cambió, cada vez que la *API* haga un *push* se estará enviando el recurso completo al cliente. Implementando una lógica *diferencial* en el servidor, nuestra *API* podría enviar solo las actualizaciones al momento de realizar un *push*. Para nuestro ejemplo, esto podría ser:

{% highlight javascript %}
{
  "op": "PATCH",
  "/Edition": "5th"
}
{% endhighlight %}

Este *JSON* informa al cliente que se ha modificado el campo "Edition" y su nuevo valor. El cliente podrá actualizar su modelo apropiadamente con esta información. De esta forma, sin importar que tan grande sea el recurso solicitado, el *push* solo envía los campos que han cambiado desde la última actualización.

### Tiempo máximo de request  

Es una buena práctica evitar *requests* de tiempo infinito. Las conexiones pueden tener un *timeout* o incluso podrían perderse por condiciones físicas de los servidores o la red. El impacto en código puede generalizarse:

- Servidor: Chequear que el *response* se encuentre abierto antes de enviar datos.
- Cliente: Chequear que el *request* se encuentre activo. En caso contrario, realizar un nuevo *request*.  

En caso que los *timeout* sean demasiado cortos, cada nuevo *request* estaría recibiendo el recurso entero (nuevamente). Una solución frecuente es enviar al servidor el *timestamp* de la última notificación recibida. De esta manera, en caso de no ser el primer *request*, el servidor podría responder con las novedades ocurridas a partir de ese *timestamp*. Para una correcta implementación, la lógica corriendo del lado del servidor debe guardar un histórico de cambios.  

Hasta aquí hemos visto una explicación de lo que es una *Streaming API* y algunos enfoques de implementación (no es el objetivo de este *post* mostrar un ejemplo concreto).

## Convirtiendo una API en una Streaming API

Ahora ¿Que ocurre cuando una *API* no es una *Streaming API*? La respuesta corta: La utilizamos como una *API* normal. Es decir que, cada vez que necesitemos conocer el estado de un recurso, realizaremos un *request*.  
Una respuesta un poco más completa incluye la implementación de un *proxy* que sea capaz de capturar un *request*, almacenar la respuesta, informarla al cliente y repetir la operación las veces que sea necesario. Este *proxy* implementaría *long polling*, es decir que podría notificar al cliente acerca de los cambios ni bien los los detecte. El siguiente diagrama ilustra este escenario.

![Streaming API proxy](/img/posts/streaming-API-proxy.png)

Veamos lo que ocurre en cada uno de los instantes (1-4):

1. El cliente 1 solicita el recurso "book" con id "123321".  
  1.1 El *request* no es atendido por el servidor sino por un *proxy*.  
  1.2 El *proxy* redirecciona el *request* al servidor.  
  1.3 El servidor devuelve un *response* al *proxy*.  
  1.4 El *proxy* redirecciona el *response* al cliente.  
2. El *proxy* envía un nuevo *request* al servidor (y lo hará cada X segundos).  
  2.1 El servidor devuelve un *response* al *proxy*.  
  2.2 El *proxy* compara el recurso obtenido durante este *request* con el obtenido durante el *request* anterior y detecta que no hubo cambios.  
  2.3 El *proxy* no realiza ningún *Push* hacia el cliente.  
3. El cliente 2 envía un *request* con método *PATCH*.  
  3.1 El cliente envía el request directamente al servidor (no hay motivos para involucrar a **este tipo de** ***proxy*** en una operación de escritura).  
  3.2 El servidor devuelve el *response* confirmando la operación.  
4. El *proxy* envía un nuevo *request* al servidor (uno más de los que envía cada X segundos).  
  4.1 El servidor devuelve un *response* al *proxy*.  
  4.2 El *proxy* compara el recurso obtenido durante este *request* con el obtenido durante el *request* anterior y detecta que hubo cambios.  
  4.3 El *proxy* realiza un *Push* hacia el cliente informando los cambios (idealmente, informa solo las novedades en lugar de reenviar el recurso completo).  

De esta forma, y sin modificar una sola línea del código de la *API*, logramos emular el comportamiento de una *streaming API* (al menos desde el punto de vista del cliente).  

Lo interesante de esta implementación es que no resulta difícil generalizarla para prácticamente cualquier *API* existente. Es decir que se podría implementar una plataforma que ponga esta lógica a disposición de los usuarios de una *API* convirtiéndola en una *streaming API* de manera transparente para el proveedor de la *API* y casi transparente para el cliente.  
Esto es precisamente lo que hace [streamdata.io](http://streamdata.io).

### Ejemplo utilizando streamdata.io

Tomando el servicio provisto por [BitcoinAverage](https://bitcoinaverage.com), y viendo algún método simple de su [*API*](https://bitcoinaverage.com/api), escribimos un código sencillo que nos permita consultar cada 5 segundos, el siguiente reucrso: https://api.bitcoinaverage.com/ticker/global/EUR/

{% highlight html %}
<html>
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script>
      setInterval(function() {
         $.ajax({
          dataType: "json",
          url: "https://api.bitcoinaverage.com/ticker/global/EUR/",
          success: function(data) {
            console.log(data);
          }
        });
      }, 5000)
    </script>
  </head>
</html>
{% endhighlight %}

Utilizando [JQuery](https://jquery.com/) para obtener los beneficios del método ```ajax```, y la función ```setInterval``` que nos permite ejecutar una función repetidas veces espaciadas por un intervalo de tiempo, obtenemos la siguiente respuesta en la consola:

![Streaming API proxy](/img/posts/setIntervalClientConsole.png)

Como se puede ver, los *requests* son enviados cada 5 segundos y el objeto entero es devuelto sin importar si fue modificado o no.

Desde la vista de *Network* también podemos ver algo interesante

![Streaming API proxy](/img/posts/setIntervalClientNetwork.png)

Cada *request* queda evidenciado por un nuevo *GET* al servidor. Además, algunos códigos de respuesta son *200 OK* mientras que otros son *304 Not Modified*. Este último código indica que un recurso no cambió desde la última vez que fue solicitado.

### Utilizando streamdata.io

Los pasos para comenzar a utilizar [streamdata.io](http://streamdata.io) son realmente sencillos y pueden ser encontrados en su web. A modo de resumen:

1. Crear una cuenta.
2. Al acceder a nuestra cuenta veremos la pantalla principal con un *dashboard*.
3. Crear una aplicación (llamémosla "OutBitApp" para el ejemplo).
4. Ingresar en la aplicación.
5. Chequear la configuración y asegurarse que "Client Request Signature" esté desactivado (**solo para este ejemplo, no queremos poner más complejidad de la necesaria**).
6. En esta misma pantalla se puede ver (e incluso renovar) el *App Token* (será necesario para autenticar el código del cliente).
7. Seguir las instrucciones en el [repositorio oficial](https://github.com/streamdataio/streamdataio-js-sdk) para generar la *SDK* que nos permite interactuar con *streamdata.io*.

Con estos pasos cumplidos, el siguiente código accede a la misma *API* del ejemplo anterior pero recibiendo *Push notifications*.

{% highlight html %}
<html>
  <head>
    <script src="./js/streamdataio.min.js"></script>
    <script>
    var myEventSource =
      streamdataio.createEventSource("https://api.bitcoinaverage.com/ticker/global/EUR/",*/APP TOKEN/*);
    myEventSource.onData(function(data){
        console.log("init")
        console.log(data);
    }).onPatch(function(data){
        console.log("update")
        console.log(data);
    }).onError(function(data){
        console.log("error")
        console.log(data);
    }).onOpen(function(data){
        console.log("open")
        console.log(data);
    });
     myEventSource.open();
    </script>
  </head>
  <body>See the console</body>
</html>
{% endhighlight %}

**Nota:** Se debe reemplazar el "APP TOKEN" por el generado para su aplicación. Recuerden que *JavaScript* puede correr en un cliente cualquiera (browser) por lo que no debe incluirse el *Token* en dicho código. Esto es válido solo para pruebas y ejemplos.

Observemos la respuesta obtenida en la consola:

![Streaming API proxy](/img/posts/longPollingClientConsole.png)

- Si bien no se alcanza a ver, los objetos no son *loggeados* en intervalos regulares de tiempo. Esto se debe a que el cliente solo *loggea* cuando recibe una respuesta y esto solo ocurre cuando hay cambios en el recurso *observado*.
- El primer objeto recibido (se distingue porque está acompañado por un "init") es similar al del ejemplo anterior, es decir, el objeto completo. Los demás (acompañados por un "update") son en realidad, *arrays* de objetos.  

Analicemos uno de dichos *arrays*:

![Streaming API proxy](/img/posts/longPollingClientparticularUpdate.png)

Cada objeto del *array* indica que se ha reemplazado un atributo y especifica su nuevo valor. No todos los *arrays* tienen  la misma longitud (4, 1 y 2 como se ve en la imagen anterior). Esto indica la cantidad de cambios que se detectaron en cada respuesta.  

Finalmente, observemos lo que ocurre con la vista *network*:

![Streaming API proxy](/img/posts/longPollingClientNetwork.png)

Se puede observar un solo *request* a una *url* perteneciente a *streamdata* (el *proxy*) y como parámetros, el *token* (sólo aquellos clientes que lo conozcan podrán acceder a la aplicación de *streamdata.io*) y la *url* del *request* original. Ese request estuvo abierto por 2.5 minutos recibiendo notificaciones cada vez que el recurso cambiaba en el servidor.

## Conclusión

Es clara la practicidad e incluso posibles mejoras en *performance* al utilizar una *Stremaing API*. Basta con pensar en las *web applications* actuales para ver la utilidad de recibir notificaciones cuando cambia el modelo en nuestro servidor.  
Pero no siempre contamos con una *Streaming API*. A menudo no estamos consultando una *API* propia y muchas veces, nuestra *API* ya existe y no hay tiempo o dinero para cambiarla (convertirla en una *streaming API*). Mediante un *proxy* se puede emular el comportamiento de una *streaming API* e incluso si no contáramos con el tiempo para implementar esta solución, es posible utilizar una plataforma como *streamdata.io* la cual provee esta funcionalidad como un servicio en la nube.
