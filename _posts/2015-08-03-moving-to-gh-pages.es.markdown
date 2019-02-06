---
layout: post
title:  "Mudanza a GitHubPages"
ref: MovingGitHub
lang: es
date:   2015-08-03 18:43:21
author: Norberto Herz
categories: jekyll update
---

Con estas (no tan) recientes ganas de volver a escribir en ourBit me di cuenta de que las herramientas provistas por *blogger de Google* no eran suficientes, o al menos, no cumplían los requerimientos que, en mi opinión, una plataforma de *blogging* debe tener.
<!--MORE-->  

Luego de investigar un poco otras herramientas que podían ayudarme en esta tarea (*Wordpress, Joomla*, etc), llegué a la conclusión de que, por diferentes motivos, ninguna de estas iba a cumplir mis expectativas. Y básicamente me inclino a pensar que el motivo es que, si bien son buenas plataformas, apuntan a un usuario general no tan especializado como para utilizar otro tipo de herramientas.  

Es así como recordé haber usado *Jekyll y GitHub Pages* para construir alguna página estática en el pasado, y comencé a evaluarlo como alternativa.  

**Definitivamente, *Jekyll* no provee mejores herramientas que las otras plataformas**. No tiene comentarios, no crea un blog en minutos con sus correspondientes archivos, templates aplicables con solo un click, etc. Lo que termina primando aquí es la **fléxibilidad**, lo cual la convierte en **una herramienta candidata para desarrolladores** (u otros profesionales con conocimientos suficientes de IT) para ser su "plataforma" de *blogging* a la medida.  

El tiempo de adopción fue de apróximadamente 1 hora (si, nada más). En mi caso, ya contaba con algo de experiencia y fue solo cuestión de refrescar algunos conceptos, buscar algunos detalles de configuración y salir andando. Bueno, casi. Una vez que tenía todo funcionando, me puse a pensar en el diseño. No quería nada lujoso, pero si algo que fuera cómodo para el lector (y obviamente, respondiera a mis gustos personales). Pero claro, mis habilidades como diseñador son casi nulas, por lo cual decidí buscar *templates (o themes)* gratuitos y adaptar mínimamente alguno. Me encontré con [CleanBlog](https://github.com/IronSummitMedia/startbootstrap-clean-blog) de [David Miller](https://github.com/davidtmiller) a quien agradezco por haber disponibilizado este material. Adaptarlo y aplicarlo al blog que ya estaba funcionando fue cuestión de minutos.

¿Qué me hace elegir *Jekyll y GitHub Pages*?

- La posibilidad de contar con herramientas *Open Source*.
- Libre de publicidad: Esto es gratuito sin letra chica.
- Flexibilidad y Extensibilidad: Puedo desarrollar plugins y herramientas sobre la plataforma.
- Simpleza: Crear Posts es tan simple como escribir en un archivo de texto y seguir el flujo normal de GitHub para publicar.
- Capacidad de Recibir *Pull Requests*: Me interesa que cualquier lector pueda sugerir correcciones, o incluso, publicar en este blog. **Espero Pull Requests con sus Posts**.
- Soporte a *Markdown*: Esto quizá es un gusto personal. Pero encuentro muy simple y conveniente escribir en *Markdown* en lugar de lidiar con editores *WYSIWYG* que terminan fallando cuando quiero ir más allá que las opciones soportadas.
- *Highlight* de código: Escencial para un Blog dónde haya snippets.  
{% highlight javascript %}
(function(msg) {
  alert(msg);
})("Bienvenidos al nuevo OurBit");
{% endhighlight %}

Estas son solo algunas razones. Pero cada uno debería tener las suyas. Ante la duda, inviertan 1 hora en aprender a usarlo (quizá no los convenza como herramienta de *Blogging*, pero no está demás saber como funciona *Jekyll y GitHub Pages*).



Les dejo algunos links para comenzar:

- [GitHub Pages](https://pages.github.com/)  
- [Jekyll](http://jekyllrb.com/)  
- [Jekyll Themes](http://jekyllthemes.org/)

Si tienen dudas, espero su contacto.
