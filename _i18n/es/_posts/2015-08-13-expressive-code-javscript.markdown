---
layout: post
title: 'Código expresivo en Javascript'
subtitle: Funciones de orden superior
author: nohorbee
tags: javascript expressive code array prototype functions forEach map reduce filter every some
description: "Escribiendo código expresivo en Javascript utilizando los métodos forEach, filter, map, reduce, every y some"
---

Hay varios (si no demasiados) aspectos a tener en cuenta al momento de escribir una pieza de código: *performance, mantenibilidad y legibilidad*, por mencionar algunos.
Un aspecto que me resulta particularmente interesante es el denominado "expresividad" y significa "la habilidad de enunciar lo que se está haciendo".  

Como buen *Javascript Hipster ("A mi me gustaba antes de que fuera popular")* me gustaría mostrar algunos ejemplos de cómo *Javascript* nos permite ser realmente expresivos trabajando con *arrays* (y algunas funciones en particular): *forEach, filter, map, reduce, every* and *some*.
<!--MORE-->

Si bien habitualmente la característica de "Expresivo" se le atribuye al lenguaje, en todos los lenguajes se puede ser más o menos expresivo al escribir diferentes versiones de código que hagan lo mismo. De esta manera, sería más preciso definir a una pieza de código como "expresiva" si realmente es capaz de enunciar lo que está haciendo.

Tomemos como ejemplo un conjunto de personas:

{% highlight javascript %}
var persons = [
  {"name": "John Doe", "age": 27, "weight": 176},
  {"name": "John Doe Jr.", "age": 3, "weight": 22},
  {"name": "Jane Doe", "age": 24, "weight": 127},
  {"name": "Julian Doe", "age": 32, "weight": 160}
];
{% endhighlight %}

Ahora, recorramos este *array* y por cada persona imprimamos "*Name* is *age* years old".

{% highlight javascript %}
for(var i=0;i<persons.length;i++) {
  console.log(persons[i].name + " - " + persons[i].age);
}
{% endhighlight %}

Este código es bastante simple, corto y podríamos decir que es bastante legible. Pero esto no lo hace necesariamente **expresivo**. Lo que queríamos hacer era: Imprimir "*Name* is *age* years old" por cada persona. Esto es lo que dice el código que acabamos de escribir:

1. Inicializar una variable *i* con el valor *0*.
2. Siempre y cuando la variable sea menor a la cantidad de personas, incrementarla y ejecutar el siguiente bloque de código:  
  2.1. Obtener el nombre de la persona en la posición indicada por la variable previamente inicializada.  
  2.2. Concatenarle un espacio, un guión y luego otro espacio.  
  2.3. Concatenarle la edad de la persona en la posición indicada por la variable previamente inicializada.  
  2.4. *Loggear* el resultado en la consola.  

Comencemos por quitar la línea dentro del *for* y ubicarla dentro de una función que reciba una *persona* como parámetro e imprima el patrón especificado.

{% highlight javascript %}
var printPattern = function(person) {
  console.log(person.name + " - " + person.age)
}

for(var i=0;i<persons.length;i++) {
  printPattern(persons[i]);
}
{% endhighlight %}
Si estás pensando "esto no tiene nada que ver con *Javascript* y las funciones de sus *arrays*", estás en lo cierto, pero no te impacientes.  
No hicimos más que *encapsular* una funcionalidad para ocultar su complejidad. *Encapsulamiento* es un concepto habitualmente relacionado al Paradigma de Programación orientada a objetos, pero en realidad puede lograrse de muchas maneras, y las *funciones* son una forma ancestral de lograrlo. El objetivo de *encapsular* código no es el de hacerlo más expresivo, pero en la mayoría de los casos, es un efecto colateral.

Si leemos nuevamente el código (y obviamos describir la nueva función):

1. Inicializar una variable *i* con el valor *0*.
2. Siempre y cuando la variable sea menor a la cantidad de personas, incrementarla e
 1. Imprimir el patrón para la persona en la posición indicada por la variable previamente inicializada.

### Array.Prototype.forEach  
Si bien el código se ha vuelto un poco más expresivo, parece estar más preocupado por la variable *i*, su inicialización, y su cota, que por la persona en sí misma.  
Afortunadamente hay otras formas de recorrer un *array*. Por ejemplo el método ```Array.prototype.forEach(function)```.

{% highlight javascript %}
persons.forEach(printPattern);
{% endhighlight %}

Si leemos nuevamente el código:

1. Por cada persona, imprimir el patrón.

De esta forma, el código *hace* y *expresa* exactamente lo que queremos.  
Pero, si bien la lectura resulta más simple, es necesario comprender que es lo que está ocurriendo detrás del telón.  
En primer lugar, algo a destacar de *Javascript* es que *todo (o casi todo) es un mensaje.* Esto significa que objetos, funciones, métodos y valores son mensajes (o expresiones) y como tales pueden ser pasadas como parámetros.  
A diferencia del *for* que es una instrucción, el *forEach* es un método del objeto *Array* (o de su *prototipo*). Combinando estos conceptos, *forEach* recorre el *array* y en cada iteración invoca a la función que recibió como parámetro. En dicha invocación, *forEach* le pasa como parámetro a la otra función, el elemento que está siendo iterado.  
Una implementación muy básica del *forEach* podría ser:

{% highlight javascript %}
Array.prototype.forEach = function(func) {
  for(var i=0;i<this.length;i++) {
    func(this[i]);
  }
}
{% endhighlight %}

Adicionalmente, el *forEach* recibe un segundo parámetro opcional que representa una función que será invocada cuando se haya finalizado la recorrida del *array*. En los ejemplos que se están mostrando esto puede parecer inútil, pero cuando se está en un entorno de programación *asincrónica* (como [NodeJS](http://nodejs.org)), este tipo de implementaciones se vuelve indispensable.

Aún más útiles quizá resulten 2 parámetros adicionales que **el *forEach* le pasa a la función especificada en el primer parámetro:**  

- *index*: El índice del elemento que está siendo iterado.
- *array*: El *array* completo.

El *forEach* no devuelve ningún resultado, pero entre las acciones realizadas dentro de la función invocada, es posible modificar el *array* que está siendo iterado (lo cual, como veremos, deberá hacerse con cuidado).

### No apto para menores de 25 años
Supongamos que en un bar muy exclusivo no se admiten menores de 25 años. Podríamos intentar escribir un código que elimine del *array* aquellas personas que no alcancen dicha edad. El código podría ser:

{% highlight javascript %}
persons.forEach(function(person, index, arr) {
  if(person.age<25) {
    arr.splice(index, 1);
  }
});
persons.forEach(printPattern);
{% endhighlight %}
**Nota**: [*splice*](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice) es útil para eliminar elementos de un *array*.

Si ejecutamos este código, vamos a obtener el siguiente resultado:

{% highlight console %}
John Doe - 27
Jane Doe - 24
Julian Doe - 32
{% endhighlight %}

Por algún motivo, Jane Doe logró vencer la seguridad de nuestro bar, e ingresar. Dicho motivo es causa de incontables *bugs* en incontables piezas de código.  
En cada iteración, *index* incrementa 1. La primera vez (*index=0*) encontramos a John Doe de 27 años. Queda en el *array*. La segunda vez (*index=1*), encontramos a John Doe Jr de 3 años (quien claramente no debería estar en nuestro bar). Al removerlo del *array* Jane Doe pasa a estar en el *index 1* y Julian Doe en el *index 2*. La tercera iteración (*index=2*) aparece Julian Doe. Es decir que Jane Doe ha sido salteada. **Es como si el guardia de seguridad se diera vuelta cada vez que saca a alguien de la fila del bar y en ese momento dejara pasar a una persona sin importar su edad.**  
No siempre es buena idea modificar el *array* que se está iterando. Como soluciones alternativas, se puede utilizar un *array* auxiliar y sobreescribir el original una vez que ya se haya finalizado la iteración.  

Pero más allá de el mal funcionamiento del código anterior, analicemos su **expresividad**:

1. Por cada persona:  
  1.1. Verificar si supera o iguala los 25 años.  
  1.2. Si no lo hace, remover del *array* 1 posición comenzando en *index*.
2. Por cada persona, imprimir el patrón (hay que prestar atención al código para entender que es "por cada persona que haya quedado en el *array*").  

No parece ser tan grave, pero seguimos teniendo conocimiento del *array*, el *index* y la lógica para realizar la comparación. Además, si quisiéramos reutilizar este código para quitar menores de edad, deberíamos duplicarlo.  
Comencemos por atacar este segundo problema (al menos parte del mismo).

### Funciones que crean funciones
Esta es una característica de *Javascript* que, bien utilizada, nos permite escribir código expresivo y altamente reutilizable.  
Tomemos por ejemplo el siguiente código:

{% highlight javascript %}
function olderThan25() {
   return function(person) { return !(person.age<25) }
 }
var older = olderThan25();
{% endhighlight %}
*olderThan25* está devolviendo una función que recibe una persona y devuelve *true* si la persona es mayor de (o tiene exactos) 25 años. Es decir que, al asignar el resultado de su ejecución a la variable *older*, ```older(person)``` realizará la evaluación antes mencionada.  
Entonces,

{% highlight javascript %}
console.log(older({"name": "John Doe Jr.", "age": 3}));
{% endhighlight %}

imprime ```false```

Siguiendo este mismo concepto, podemos aún lograr un código más reutilizable e incluso más expresivo. Pasemos como parámetro el "umbral" de edad que queremos evaluar.
{% highlight javascript %}
function olderThan(threshold) {
   return function(person) { return !(person.age<threshold) }
 }
var olderThan25 = olderThan(25);
var olderThan3 = olderThan(3);
{% endhighlight %}

Ahora, podemos crear cuantas funciones queramos con diferentes umbrales de edad, y nomenclarlas de forma tal que representen lo que hacen.  
Aplicando al código anterior (que intentaba remover a los menores de 25 años):

{% highlight javascript %}
persons.forEach(function(person, index, arr) {
  if(!olderThan25(person)) {
    arr.splice(index, 1);
  }
});
persons.forEach(printPattern);
{% endhighlight %}

- El código sigue sin funcionar (el problema descripto anteriormente sigue allí).
- Si bien la legibilidad del código mejoró, se sigue leyendo "si la persona es mayor de 25, remover una posición del *array* comenzando en *index*". Es decir que la expresividad sigue siendo similar.

### Array.Prototype.filter

Afortunadamente, *Javascript* nos da un método del *array* que hace exactamente lo que queremos.  
El método *filter* recibe 2 parámetros:

- *callback*: La función que evalua la condición que decide si el elemento que está siendo iterado, debe pertenecer (deberá devolver *true* si el elemento debe pertenecer al nuevo grupo, y *false* en caso contrario).
- *contextObject* (opcional): El objeto que será utilizado como *this* dentro de la función *callback*.

A su vez, *filter* pasa a *callback* 3 parámetros (al igual que lo hacía *forEach*):

- *element*: El elemento que está siendo iterado.
- *index*: La posición de dicho elemento dentro del *array*.
- *array*: El *array* que está siendo iterado.

A diferencia del *forEach*, *filter* devuelve un **nuevo** *array* con los elementos que pasen la prueba evaluada en *callback*.

Teniendo en cuenta este nuevo método, el siguiente código resuelve el requerimiento expresado anteriormente:

{% highlight javascript %}
persons.filter(olderThan25).forEach(printPattern);
{% endhighlight %}

Respecto de su expresividad, puede ser leído como:

1. Filtrar las personas **que no** sean mayores de 25 y por cada una imprimir el patrón.

Un problema de este método (respecto de su expresividad) es el nombre *filter* (y/o el hecho de remueva el elemento cuando *callback* devuelve *false*). Eso haría que sea lea "filtrar los mayores de 25", cuando en realidad se está haciendo lo contrario. *Nada es perfecto*.

### Cuida tu peso

Hemos logrado trabajar con cada persona de nuestro grupo, y realizar operaciones con cada una de ellas. Pero muchas veces, es necesario trabajar con el grupo como un todo.  
Supongamos que *nuestras* personas están subiendo a un ascensor. Por motivos de seguridad, los ascensores más modernos incluyen una balanza para asegurarse de que no se haya superado el peso máximo soportado por el mismo. Intentemos evitar la vergüenza de escuchar la chicharra indicando que nos hemos excedido y calculemos el peso total previamente:

{% highlight javascript %}
var totalWeight = 0;
persons.forEach(function(person) {
  totalWeight += person.weight ;
});
console.log(totalWeight);
{% endhighlight %}

Algunas observaciones acerca de este código:

- Como vimos, *forEach* recibe como primer parámetro una función. Hasta aquí, solíamos crear la función como un paso previo y pasar el nombre de la función como parámetro. Pero, como *function* es una expresión que devuelve una función, la sintaxis de *Javascript* nos permite definir la función directamente en el lugar donde escribiríamos el valor del parámetro. En particular, esta función no tiene nombre, lo que la convierte en una **función anónima**. Los diferentes tipos de funciones y las diferentes formas de definirlas, ameritan un *post* en sí mismo.
- Como *forEach* no devuelve nada, es necesario definir una variable externa que acumule el valor de la suma.
- El código que vamos a generar, **en mi opinión** no es *automáticamente* más expresivo que el que ya generamos. Pero sin duda, se vuelve increíblemente entendible cuando comprendemos el significado e importancia de los métodos *map* y *reduce*.  

Paso a paso. Primero consideremos la sensibilidad de la gente respecto de su peso e intentemos mantener cierta confidencialidad. Obtengamos un nuevo *array* que solo tenga los pesos de las personas de nuestro grupo.

{% highlight javascript %}
var weights = [];
persons.forEach(function(person, index) {
  weights[index] = person.weight;
});
{% endhighlight %}

Este código puede leerse de la siguiente manera:

1. Crear un array vacío llamado *weights*
2. Por cada persona, invocar una función que reciba a dicha persona y el índice de la misma en el *array* original.
  1. La función obtiene el peso de la persona y lo asigna a la posición indicada en el nuevo *array*.

{% highlight javascript %}
console.log(weights);
{% endhighlight %}
imprime

{% highlight console %}
[ 176, 22, 127, 160 ]
{% endhighlight %}

### Array.prototype.map

En general, llamamos al proceso de asociar los elementos de un conjunto, con los elementos de otro conjunto "[mapear](https://en.wikipedia.org/wiki/Map_(mathematics))", y el criterio de dicha asociación puede variar dependiendo la función utilizada.  
Es decir, que el código que escribimos anteriormente "mapea las personas con/por su peso".  
Sería bueno poder escribir eso mismo en *Javascript* de la siguiente manera:
{% highlight javascript %}
persons.map(weight);
{% endhighlight %}

De hecho, definiendo *weight* como una función que dada una persona, devuelva su peso, la línea anterior hace **exactamente** lo que dice.
{% highlight javascript %}
function weight(person) { return person.weight; }
{% endhighlight %}

El método *map*, recibe los mismos 2 parámetros que *filter*:

- *callback*: La función que determina el criterio de asociación (deberá devolver el valor a mapear con cada elemento).
- *contextObject* (opcional): El objeto que será utilizado como *this* dentro de la función *callback*.

A su vez, *map* pasa a *callback* 3 parámetros (al igual que lo hacían *forEach* y *filter*):

- *element*: El elemento que está siendo iterado.
- *index*: La posición de dicho elemento dentro del *array*.
- *array*: El *array* que está siendo iterado.

*map* devuelve un **nuevo** *array* con los elementos del segundo conjunto. En nuestro ejemplo, un *array* con los pesos de las personas.  

Ahora bien, volviendo a nuestro ejemplo, los pesos por separado no nos ayudan a determinar si es peligroso o no activar el ascensor. Aún debemos obtener el peso total.

Si siguiéramos el enfoque anterior, pero aprovechando la función *map*, nuestro código quedaría así:
{% highlight javascript %}
var totalWeight = 0;
persons.map(weight).forEach(function(weight) {
  totalWeight += weight ;
});
console.log(totalWeight);
{% endhighlight %}

Es decir que primero obtenemos el *array* de pesos y luego lo iteramos realizando la acumulación. Es una pequeña (casi insignificante) mejora respecto de nuestra versión anterior.

### Array.prototype.reduce

El término *reduce* resulta, al menos para mi, poco descriptivo respecto del objetivo de este método. Otros lenguajes (asociados al paradigma *funcional*) suelen referirse a esta función como [*fold*](https://en.wikipedia.org/wiki/Fold_(higher-order_function)). Pero una buena forma de entenderlo es pensar en *reduce* como "resumir". Queremos encontrar un solo valor que *resuma* de alguna manera a todos los demás. Por ejemplo, 10 resume a 4, 3, 2 y 1 si consideramos a la suma como forma de resumir. 24 resume a 4, 3, 2, 1 si consideramos a la multiplicación como forma de resumir.  
Entonces, Definiendo *sum* como
{% highlight javascript %}
function sum(a,b) { return a+b; }
{% endhighlight %}
y considerando el siguiente código

{% highlight javascript %}
 persons.map(weight).reduce(sum);
{% endhighlight %}

se podría leer: resumir mediante la suma, el peso de las personas. O, sumar el peso de las personas.

El método *reduce*, recibe 2 parámetros:

- *callback*: La función que contiene la lógica de reducción (la forma de resumir).
- *initialValue* (opcional): El valor inicial del *acumulador*.

A su vez, *reduce* pasa a *callback* 4 parámetros:

- *previousValue*: El resultado de la última ejecución de *callback* o *initialValue* (la primera vez que se ejecuta).
- *currentValue*: El valor que está siendo iterado.
- *index*: La posición de dicho valor dentro del *array*.
- *array*: El *array* que está siendo iterado.

*reduce* devuelve un **único** valor que coincide con el resultado de la última ejecución de *callback*.  

Hay algunas características de *reduce* que podrían catalogarlo como un método recursivo. En lugar de pensar a *reduce* como una función que itera el *array* aplicando *callback*, podríamos pensarlo como una función que toma la primera posición del *array* y aplica *callback* pasando esta posición y el resultado de *reduce* para un segundo *array* que va desde la segunda hasta la última posición del primer *array*. Al usarlo, esto es transparente, pero saberlo nos ayuda a entender cómo funciona, por qué **acumula** y cómo funciona el *initialValue*.

### Una visita al autocine

Las personas salieron del ascensor, subieron al auto y partieron con rumbo al auto-cine. Eligieron una película no apta para menores de 18 años. Al intentar ingresar, debemos preguntar si **todas** las personas en el auto alcanzan dicha edad.  
Hay muchas formas de lograrlo. Entre ellas:

- Iterar y preguntar  
{% highlight javascript %}
persons.forEach(function(person) {
  areOlder = areOlder && olderThan18(person);
});
{% endhighlight %}
Estamos utilizando la función *olderThan(threshold)* para generar la función *olderThan18*.

- Reducir mediante el operador lógico "Y"  
{% highlight javascript %}
persons.reduce(function(isPreviousOlder18, person) {
  console.log(person)
  return (isPreviousOlder18 && olderThan18(person));
},true);
{% endhighlight %}


- Mapear al *array* de edades y reducir mediante el operador lógico "Y"  
{% highlight javascript %}
persons.map(function(person) {
  return person.age;
}).reduce(function(isPreviousGreater18, age) {
  return (isPreviousGreater18 && greaterThan18(age));
},true);
{% endhighlight %}
Es similar a la anterior, pero antes de *reducir*, obtenemos el *array* de edades (y por lo tanto, en lugar de utilizar una función que reciba una persona y compare su edad, utilizamos una similar pero que compare directamente la edad. *greaterThan18* es generada de forma similar que *olderThan18*).

Todas estas soluciones tienen un problema (u oportunidad de mejora): Evalúan todo el *array* sin importar lo que ocurra. En nuestro caso, evaluando el segundo elemento podríamos concluir que no todas las personas son mayores de 18. En evaluaciones de expresiones *booleanas* esto se conoce como "evaluación de cortocircuito".
{% highlight javascript %}
true || whatever // -> true
false && whatever // -> false
{% endhighlight %}
En ambos casos, es innecesario evaluar *whatever*.

Esto parece ser irrelevante en un *array* de 4 elementos. Pero ¿qué pasaría si tuviéramos un colectivo, tren o avión intentando ingresar al auto-cine? Además del posible problema de espacio del predio, nuestras soluciones estarían ocupando ciclos de procesamiento innecesarios, lo que se conoce como **mala performance**.  
La forma de solucionar esto es *rompiendo* las iteraciones cuando no es necesario seguir evaluando. La instrucción *break* hace exactamente eso, pero no es aplicable a los métodos que estamos utilizando (es aplicable al *for* clásico). Existen otras "técnicas" para salir de estos métodos, pero ninguna es elegante ni recomendable (por ejemplo, podríamos asignar "0" a *array.length*, si no necesitaramos seguir trabajando con el *array*. O hacer una copia del mismo, para poder cambiar el *length* sin problemas. También podríamos *lanzar una excepción* y *capturarla* inmediatamente al salir del método).  

Pero hay un motivo por el cual este problema se presenta al utilizar estos métodos. En el caso del *forEach* el motivo es incluso explícito en el nombre de la función. **Por cada** elemento de un *array* implica que **todos** los elementos van a ser iterados.

### Every-Some

Volviendo al tema de la *expresividad*, ninguna de las soluciones resultan demasiado expresivas (hagan el ejercicio de identificar lo que cada una está diciendo y lo que cada una está haciendo). El enunciado debería ser más sencillo. Verificar que todas las personas sean mayores de 18.

{% highlight javascript %}
persons.every(olderThan18);
{% endhighlight %}
Esta solución dice y hace exactamente lo que buscamos. Devuelve *true* si todas las personas son mayores de 18 años. Caso contrario, devuelve *false*.  
Además de ser altamente expresiva, *every* respeta la evaluación de cortocircuito, es decir que dejará de iterar ni bien encuentre una persona que no cumpla la condición.

El método *every* recibe 2 parámetros:

- *callback*: La función que evalua la condición a cumplir (deberá devolver *true* o *false*).
- *contextObject* (opcional): El objeto que será utilizado como *this* dentro de la función *callback*.

A su vez, *every* pasa a *callback* 3 parámetros (al igual que lo hacían los demás métodos):

- *element*: El elemento que está siendo iterado.
- *index*: La posición de dicho elemento dentro del *array*.
- *array*: El *array* que está siendo iterado.

*every* devuelve *true* si todos los elementos iterados cumplieron con la condición, y *false* si al menos un elemento no lo hace (y deja de iterar cuando lo encuentra).


### En busca de una película apta

Las restricciones de edad en las películas deben ser respetadas. Y si bien nuestras personas no  encontraron ninguna película apta para todo público, apareció un nuevo estreno que puede ser vista por menores con la supervisión de un adulto. Dejando de lado el criterio del adulto, escribamos la solución que nos permita evaluar si alguna persona es mayor de 18 años. Pero antes de comenzar a mostrar todas las alternativas (como hicimos con el caso anterior *every*) pensemos ¿no existirá algún otro método que diga y haga lo estamos buscando?  
Mi respuesta rápida es **sí**:

{% highlight javascript %}
persons.some(olderThan18);
{% endhighlight %}

El método *some* recibe 2 parámetros:

- *callback*: La función que evalua la condición a cumplir (deberá devolver *true* o *false*).
- *contextObject* (opcional): El objeto que será utilizado como *this* dentro de la función *callback*.

A su vez, *some* pasa a *callback* 3 parámetros (al igual que lo hacían los demás métodos):

- *element*: El elemento que está siendo iterado.
- *index*: La posición de dicho elemento dentro del *array*.
- *array*: El *array* que está siendo iterado.

*some* devuelve *false* si ningún elemento cumple con la condición, y *true* si al menos un elemento lo hace (y deja de iterar cuando lo encuentra).


### Performance

Como mencioné al comienzo del *post*, la *expresividad* es solo uno de muchos aspectos a considerar. Muchas veces, estos aspectos entran en conflicto y es necesario evaluar cuál prima.  
Consideremos el siguiente problema: Debo obtener un *array* con las personas con peso menor a 130 libras, que tengan más de 10 años.  
Con todo lo que hemos visto, naturalmente podríamos pensar que la siguiente solución es ideal:

{% highlight javascript %}
persons.filter(olderThan10).filter(softerThan130);
{% endhighlight %}

La realidad es que esta solución no es ideal, tan solo es expresiva.  
Al filtrar, estamos iterando el *array*. Al filtrar 2 veces, estamos iterando 2 *arrays*. Si *persons* contiene N elementos y M son mayores de 10, la solución anterior recorrerá N + M elementos. La siguiente solución puede ser un poco menos expresiva pero nos asegura que solo se recorrerán N elementos:

{% highlight javascript %}
persons.filter(olderThan10AndsofterThan130)
{% endhighlight %}
considerando
{% highlight javascript %}
function olderThan10AndsofterThan130(person) {
  return olderThan10(person) && softerThan130(person);
}
{% endhighlight %}

Al negociar un aspecto por otro, es necesario considerar el caso de uso. Si nuestros *arrays* contienen familias (es decir, pocos elementos), quizá podamos darnos el lujo de tener el código más expresivo. Si estamos procesando el padrón electoral completo, mejor preocuparse por la *performance*.

### Conclusión

La misma sintaxis de *Javascript* nos permite trabajar con partes buenas de los paradigmas *estructurado*, *orientado a objetos* y *funcional*. Las buenas prácticas de cada paradigma pueden favorecernos a la hora de mejorar algunos aspectos de nuestro código. En la mayoría de los casos, al mejorar un aspecto, estaremos empeorando otros (Ej: Mayor Expresividad -> Menor Performance). Muchas veces estos aspectos se conjugarán de formas más complejas (Ej: Mayor Performance y Buena Expresividad -> Poca Flexibilidad). Es parte de nuestro trabajo cuando escribimos una pieza de código, evaluar qué aspectos queremos favorecer y cuáles podemos castigar. La mayoría de las veces caeremos en la trampa y favoreceremos los aspectos que más nos gusten. Eso es algo a evitar. Para saber qué aspectos favorecer, la mejor opción es analizar el caso de uso.
