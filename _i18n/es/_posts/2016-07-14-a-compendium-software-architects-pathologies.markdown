---
layout: post
title: 'Una recopilación de patologías de los Arquitectos de Software'
author: nohorbee
tags: Software Arquitercura Rol Management Trampas
description: "El trabajo del arquitecto está lleno de trampas y contradicciones. En este artículo describimos cinco patologías que pueden afectar a los arquitectos de software"
---

*Por [Marcos Chicote](https://ar.linkedin.com/in/mchicote), [Guido de Caso](https://twitter.com/guidodecaso), y [Norberto Herz](https://twitter.com/nohorbee)*
<br /><br />

Poco después de que el campo de las arquitecturas de software naciera formalmente, gracias al trabajo de Garlan, Shaw, Notkin y otros a principios de los 90s, el rol del "Arquitecto de Software" apareció en el área del desarrollo de software. De acuerdo con las definiciones de la comunidad de Arquitectura de Software, el trabajo de un arquitecto es definir el diseño de alto nivel de un sistema de software, o en otras palabras, tomar las principales decisiones de diseño para construir ese puente entre requerimientos e implementación.  
Sin embargo, llevado a la práctica no es tan sencillo. El trabajo del arquitecto está lleno de "trampas" y contradicciones. En este artículo describimos cinco patologías que pueden afectar a los arquitectos de software, incluyendo síntomas y tratamiento, con el objeto de disparar algunas discusiones acerca del rol y su evolución esperada.

<!--MORE-->

## Introducción

No hay duda de que la Ingeniería de Software ha evolucionado constantemente durante las últimas cinco décadas. Los sistemas operativos nos han provisto cada vez mejor de una capa de abstracción de las complejidades del hardware moderno. Los procesos Lean y Agile nos han permitido iterar más velozmente. Tecnologías más económicos y accesibles han disminuido la barrera para obtener equipos de alta performance y han abierto la puerta a solucionar problemas más ambiciosos en diversos campos tales como la medicina, la industria aeroespacial, ámbito académico o comercio electrónico.

La forma en que los ingenieros nos organizamos para construir software que soluciona problemas complejos también ha cambiado. Desde personas escribiendo programas para mainframes hasta grandes empresas con varias líneas de productos y plataformas. El rol del Arquitecto de Software ha aparecido mayormente en el contexto de aplicaciónes multi-capa en las cuales la cantidad de opciones de implementación creció exponencialmente. [[1]](http://dl.acm.org/citation.cfm?id=579257) [[2]](http://www.bredemeyer.com/pdf_files/role.pdf)

Las responsabilidades y tareas de los Arquitectos de Software son variadas y dependen en gran medida de la compañía y el contexto. Hay leves variaciones de estas responsabilidades dependiendo de si nos referimos a un Arquitecto de Aplicación o un Enterprise Architect. Pero, independientemente de dichas diferencias, podemos definir el alcance del Arquitecto de Software mayormente por las siguientes áreas:

1. Subdividir el diseño de aplicaciónes grandes en partes más pequeñas y fáciles de manejar.
2. Identificar tecnologías, frameworks, patrones, mejoras de proceso y mejores prácticas que son adoptadas por una organización y comunicarlas a los desarrolladores, estableciendo relaciones de mentoring. 

Pero, mientras esta enumeración sirve al propósito de describir un *template* de la descripción del trabajo de un Arquitecto de Software, no responde a preguntas tales como qué características o tareas diferencian a los Arquitectos de Software que más impacto generan, de sus colegas. Cómo está definido el Path de carrera de un Arquitecto de Software y de dónde vienen la mayoría de ellos. Cómo pueden encontrar el equilibrio entre convertirse en grandes generalistas en lugar de los mejores especialistas.

En este artículo nos proponemos explorar y discutir algunos de estos temas. Lo hacemos mediante una serie de posibles contradicciones o falacias que surgen de la tensión entre fuerzas opuestas en la vida de un Arquitecto de Software: Ser un mentor vs. evangelizar, escribir código vs. estar en reuniones, entre otros dilemas.

Presentamos estas aparentes contradicciones como patologías. La palabra "patología" tiene su origen en el antiguo Griego en donde pathos (πάθος) significa "experiencia" o "sufrimiento", y -logia (-λογία) significa "estudio de". Esperamos que este artículo dispare discusiones interesantes entre los compañeros Arquitectos de Software y nos haga pensar acerca de algunos problemas frecuentes que enfrentamos en nuestra práctica profesional.

El lector atento debería ser advertido de que algunas de las patologías serán particularmente más acertadas para Arquitectos de Software en situaciones específicas como ser compañías con equipos de desarrollo distribuidos geográficamente, o compañías de tamaño medio a grande. En cualquier caso, creemos que las mismas abarcan temas relevantes a la forma de pensar acerca de los Arquitectos de Software, su rol, su carrera, y finalmente, su impacto.


## Las Patologías

En las siguientes subsecciones describiremos algunas de las patologías mencionadas anteriormente en términos de cómo detectarlas y resolverlas

### El Síndrome del mejor desarrollador sin impacto
<big><i>“Esta funcionalidad es extremadamente compleja. Debería estar escribiéndola yo mismo”</i></big>


#### Descripción

De acuerdo al Principio de Pareto, acordamos que el 80% de la complejidad de una aplicación proviene del 20% de sus funcionalidades. Siendo el Arquitecto de Software el mejor programador del equipo, todo parece indicar que gran parte de estas funcionalidades deberían ser escritas por el.

#### Síntomas y Diagnóstico

- Arquitecto de Software con stress: "Nunca encuentro el tiempo para trabajar en estas funcionalidades"
- Planos faltantes o vagamente definidos: "El diseño de alto nivel está completo, el resto de las partes son deducibles"
- Desarrollador con stress: "Los diseños no tienen sentido. Mis colegas parecen estar escribiendo aplicaciónes diferentes"
- Desarrolladores Senior incómodos: "Esta funcionalidad debería escribirla otra persona. Yo debería estar escribiendo el 20% más complejo"

<p></p>

#### Tratamiento

Antes de hablar del tratamiento, proponemos discutir el concepto de que el Arquitecto de Software es de hecho el mejor desarrollador del equipo. Si bien es cierto que un buen Arquitecto de Software debería tener habilidades de programación sobresalientes, el rol requiere un set de habilidades más pulidas y algo diferentes que las del desarrollador. Habiendo dicho esto, tiene sentido que no todos los Arquitectos de Software surjan del mejor desarrollador de un equipo, sino de uno realmente bueno que encontró la forma de desarrollar otras habilidades.

Creemos que el mejor desarrollador debería ser responsable de escribir las funcionalidades más complejas mientras que el Arquitecto de Software debería estar trabajando en hacer esas funcionalidades más sencillas de escribir. Construir un gran diseño de alto nivel tiende a simplificar las cosas evitando ambigüedades, e identificando oportunidades de reutilización. En muchos casos, cuando esas oportunidades son lo suficientemente claras, surgen los beneficios de utilizar librerías y frameworks existente o la necesidad de escribir nuevos. Este también es el trabajo de un buen Arquitecto de Software.

Entonces, como un Arquitecto de Software, pensá una buena arquitectura para: construir un buen diseño, crear los mejores diseños, encontrar oportunidades de simplificación y ejecutarlas ya sea escribiendo o utilizando los frameworks adecuados, ayudar al equipo a definir y adoptar mejores prácticas y un proceso de desarrollo. De esa forma no vás a estar pensando "Yo debería estar escribiendo este código" tan frecuentemente. En su lugar, vas a notar que tus contribuciones impactan cada una de las funcionalidades.




### El dilema del especialista que todo lo sabe
<big><i>“El mundo es demasiado grande para que yo lo domine totalmente”</i></big>

#### Descripción

Front-end, back-end, orientado a objetos, funcional, AngularJS, Java, Node.js, REST, Polymer, Machine Learning, IoT, Realidad Virtual, COBOL, Mainframes, Docker, APIs, Scala. La lista de tecnologías sigue creciendo. La capacidad del Arquitecto de Software no es infinita, así como tampoco lo es el tiempo que cualquier ser humano puede emplear en un set de tareas. De todos modos, pareciera como si al Arquitecto de Software se le pidiera que domine la lista entera. No podemos elegir ambas: ser especialistas y generalistas, ¿o si? 


#### Síntomas y Diagnóstico

- Arquitecto de Software dubitativo: "Todos me preguntan acerca de todo y no hay forma de tener una buena respuesta a todas las preguntas" 
- Falta de *ownership*: "No soy un experto en la materia. No puedo tomar esa decisión"
- Decisiones en diferentes direcciones: "No estoy seguro de por qué estamos haciendo esto de esta manera. Parece como si todos hubieran tomado sus propias decisiones"
<p></p>

#### Tratamiento

Un Arquitecto de Software debería ser un generalista por naturaleza. Incluso si no posee un gran conocimiento acerca de una tecnología, el camino al éxito es la capacidad de combinar un rango amplio de habilidades que solo pueden ser alcanzadas entendiendo qué tan profundo se debe investigar un determinado tema. De todos modos, hay áreas que un Arquitecto de Software debería dominar. La siguiente lista incluye algunas de estas áreas:

- Principios de Software: El Arquitecto de Software necesita dominar temas tales como los atributos de calidad del software: escalabilidad, disponibilidad, recuperabilidad, seguridad, mantenibilidad, entre otros [[1]](https://msdn.microsoft.com/en-us/library/ee658094.aspx) [[2]](https://en.wikipedia.org/wiki/List_of_system_quality_attributes). También es requerido entender y poder diseñar aplicaciónes de forma en que fomenten no guardar estado, división en capas y desacoplamiento [[3]](https://msdn.microsoft.com/en-us/library/bb402962.aspx). Observen que estos conceptos son independientes de la tecnología, a pesar de que estas los logren de formas diversas.
- Liderazgo: Poder convertirse en un líder técnico para el equipo es vital. Dominar conceptos y conductas tales como coaching y mentoring se vuelve realmente útil para los Arquitectos de Software. 
- Comunicación: Diseñar se trata de tomar decisiones. Estas decisiones deberían incluir conocimiento y experiencia, pero son el resultado de entender las necesidades de los distintos interesados. El diseño se vuelve más completo cuando miembros claves del equipo de desarrollo dan su opinión visión e ideas. Adicionalmente, una vez construido, el diseño debe ser compartido para que pueda ser implementado. El Arquitecto de Software es el punto central en donde todo se conecta. Dominar habilidades de comunicación no es opcional para este rol.
- Investigación: Como se mencionó anteriormente, el Arquitecto de Software debería ser un generalista por naturaleza. Ser un buen investigador es la forma perfecta de estar al día con las últimas tecnologías y tendencias. Un Arquitecto de Software debería poder elegir qué tecnologías aprender y tener un buen entendimiento de las mismas.

Con esto en mente, es correcto decir que un Arquitecto de Software es un especialistas en temas de arquitectura, y como la arquitectura es acerca de los generalismos, los Arquitectos de Software son especialistas en ser generalistas.

La razón por la cual la lista de tecnologías mencionadas en esta patología es virtualmente infinita es básicamente que hay demasiados profesionales desarrollando tecnologías nuevas y fascinantes todos los días. Entonces, la forma de dirigir un proyecto desde el punto de vista arquitectural es intercambiar conocimientos con un equipo mayor que será el verdadero dueño del conocimiento compartido.  
De este modo, como un Arquitecto de Software, asegúrate de dominar las habilidades mencionadas anteriormente y vas a poder:

- Construir una arquitectura que garantice los atributos de calidad del software
- Entender qué tecnologías merecen más atención en cada momento
- Tener un conocimiento general de estas tecnologías y tomar decisiones respecto de cuáles son necesarias para un proyecto particular
- Investigar y empujar al equipo para utilizar estas tecnologías
- Liderar al equipo para construir las mejores aplicaciones
<p></p>

### Un pie en cada continente
<big><i>“Todavía no me pongo al día con todos los libros sobre soft skills y ya me estoy olvidando qué hacer después de atrapar una excepción”</i></big>

#### Descripción

El camino y los primeros pasos para convertirse en un Arquitecto de Software son realmente emocionantes. Empezamos a abstraernos de un montón de detalles innecesarios, dejamos de lidiar con funcionalidades tediosas, y empezamos a encarar desafíos más a la altura. También comenzamos a pasar más tiempo dibujando, hablando, enseñando, reuniéndonos, y menos tiempo escribiendo código. Y de repente, allí estamos, con esa sensación de que aún no somos lo suficientemente buenos en todo lo nuevo pero ya estamos muy lejos de donde empezamos. Viajamos lejos de casa y ahora estamos en el medio del océano. Una mezcla entre un Ingeniero de Software oxidado y un Arquitecto de Software inexperto.


#### Síntomas y Diagnóstico

- Éxito por accidente: "Siento que la gente me elogia por cosas que se dieron por casualidad y no como resultado de mi trabajo"
- Miedo a ser descubiertos: "Me asusta que alguien se de cuenta de que no estoy listo para ser un Arquitecto de Software"
- Repetibilidad: "No se como terminé acá y estoy bastante seguro de que no voy a poder crecer hacia el siguiente nivel"
- Buscando validación externa: "Alguien debería chequear que todas mis decisiones sean correctas"
<p></p>

  
#### Tratamiento

No es fácil lidiar con estos sentimientos pero he aquí algo que siempre puede ayudar: no estás solo. En realidad estos síntomas (entre otros) son más frecuente de lo que la mayoría de nosotros creemos y, además, están agrupados bajo el nombre de "Síndrome del Impostor" [[1]](https://counseling.caltech.edu/general/InfoandResources/Impostor), descubierto por Dr. Pauline R. Clance en 1978[[2]](https://en.wikipedia.org/wiki/Impostor_syndrome).

Hay varias maneras de superar este síndrome, incluyendo[[3]](http://www.apa.org/gradpsych/2013/11/fraud.aspx):

- Hablar con tus mentores
- Reconocer tus habilidades
- Recordando lo hacés bien
- Reconociendo que nadie es perfecto

Quizá la parte más difícil es vencer el miedo de ser transparente y reflexivo acerca de esto con alguien, un amigo, un colega, o un jefe. Una vez que reconocemos y hacemos las paces con estos temas, todo se vuelve más fácil y estamos listos para dejarlo atrás y liberar nuestro potencial como Arquitectos de Software.








### El dilema del mentor sin preparación
<big><i>“Si querías que fuera mentor de otros, deberías haberme preparado para eso”</i></big>

#### Descripción

Incluir "mentoring" como parte de las responsabilidades del Arquitecto de Software tiene amplio consenso. Se espera que los Arquitectos de Software pasen tiempo con los Ingenieros aconsejándolos acerca de cómo desarrollar las habilidades faltantes, aprender nuevas técnicas de programación, frameworks y en general, preparándolos para dar el siguiente paso. Sin embargo a medida que los desarrolladores avanzan en sus carreras y eventualmente se convierten en Arquitectos de Software, empiezan a necesitar habilidades para las cuales no han sido entrenados, como el "mentoring" en sí mismo.


#### Síntomas y Diagnóstico

- Cuello de botella para "mentoring": "Todos quieren que los ayude a crecer ¿Qué está ocurriendo?" La mayoría de los desarrolladores comienzan a buscar "mentoring" en el mismo Arquitecto de Software
- Empatía superficial: "No estoy conectado con aquellos a quien estoy dando mentoring". El mentor y el "mentoreado" suelen generar una relación cercana. Si la empatía flaquea, el mentoring probablemente falle
- Comunicación ineficiente: "No logro que los desarrolladores sigan mi diseño". Los Ingenieros de Software no entienden el diseño o no logran ver por qué se ha realizado de tal manera

<p></p>

  
#### Tratamiento

Los Arquitectos de Software deberían ser alentados a dar mentoreo en todas las habilidades necesarias para crecer en el aspecto de la carrera. Particularmente aquellas habilidades necesitadas para puestos más altos como ser el del Arquitecto de Software. Si el mentoreo se limita a las habilidades técnicas, el Ingeniero en Software probablemente no esté a la altura cuando se encuentre en una posición de liderazgo.

Cabe mencionar que, a pesar de que no entraremos en temas antropológicos o sociológicos tales como la capacidad del ser humano de adquirir nuevos conocimientos, entendemos que algunas personas tienen una tendencia más natural al mentoreo. Incluso cuando un Arquitecto de Software debería ayudar a los Ingenieros de Software a desarrollar sus soft skills, cualquiera que aspire a convertirse en un Arquitecto de Software debería aprender sobre mentoreo en general. Una posibilidad para los Arquitectos de Software es buscar ayuda respecto del mentoreo en el liderazgo más senior de la organización de ingeniería (como ser VPs o Senior Directors).




### El síndrome de la pérdida de enfoque

<big><i>“Cuando me siento y me concentro por 20 minutos sin interrupción, logro construir cosas asombrosas! ¿Cómo no hago esto 8 horas por día?”</i></big>

#### Descripción

Como Paul Graham describe en su ensayo "Maker's Schedule, Manager's Schedule", mientras que la agenda de un manager puede cambiar cada hora, para los constructores ir a una reunión es como arrojar una excepción, lo cual puede ser muy costoso en términos de performance. A medida que estudiamos el rol y analizamos sus contradicciones, nos preguntamos: ¿Qué agenda seguimos los Arquitectos de Software?


#### Síntomas y Diagnóstico

- Adaptarse a los managers: "Los managers me arrastran a reuniones en cualquier momento"
- Tiempo desperdiciado: "Soy un constructor. Construyo software que termina en producción, esa es mi mayor responsabilidad, no estar respondiendo las preguntas de los managers"
- Agenda espaciada: "Déjenme escribir código por 4 horas seguidas y los voy a sorprender"

En la mayoría de las organizaciones, los Arquitectos de Software no son managers y por ende no se rigen por la agenda de un manager, e incluso demostrando que se rigen por la agenda de un constructor, suelen aparecer algunas dificultades.

Como se mencionó en la sección "El Síndrome del mejor desarrollador sin impacto", los Arquitectos de Software no necesariamente deberían ser responsables de escribir las funcionalidades más complejas, y este concepto podría usarse para argumentar que los Arquitectos de Software no son constructores. Sin embargo, como fue discutido, los Arquitectos de Software son los responsables de construir software de forma más transversal, definiendo mejores prácticas y los procesos de desarrollo, escribiendo frameworks o diseñando los planos de la aplicación. Estas tareas son, innegablemente, atribuibles a constructores.

Los componentes transversales a menudo afectan a una gran variedad de actores e impactan en nuevas funcionalidades y bugs complejos. Los Arquitectos de Software son fecuentemente convocados a reuniones para analizar y comentar sobre estos temas, robándoles tiempo de diseño y mentoring. Cuanto más construye un Arquitecto de Software, a más reuniones será convocado, presentando un importante dilema.

  
#### Tratamiento

Los Arquitectos de Software son constructores y, como tales, necesitan tiempo para hacer. Construir software, incluso a niveles de arquitectura, requiere concentración y enfoque. Los Arquitectos de Software, como en cualquier posición prestigiosa, son consultados a menudo sobre un conjunto diverso de temas y son requeridos en reuniones. En lugar de luchar con eso, proponemos algunas ideas para minimizar el impacto que tienen estas reuniones sobre tus responsabilidades:

- Se recomienda a los Arquitectos de Software que expliquen claramente a todos, que son constructores, y que deben estar profundamente involucrados en el proceso de construir software. El entendimiento por parte de los pares acerca de la posición del Arquitecto de Software es vital para minimizar las invitaciones a reuniones innecesarias.
- *Office Hours*: Los Arquitectos de Software deberían apartar algo de tiempo para estar disponibles para otras personas. En lugar de adaptarse a las agendas de los managers, se recomienda que el Arquitecto de Softwarwe cree mecanismos para permitir a los managers adaptarse por su cuenta.
- Delegar: No toda reunión a la que estés invitado necesita un Arquitecto de Software. La delegación a líderes técnicos o especialistas no solo te va a ahorrar tiempo, también va a permitir que otros crezcan.
<p></p>

## Conclusión

Mientras que la analogía con las patologías puede ser algo trillada, creemos que hay valor en estudiarlas como las trampas habituales en el rol del Arquitecto de Software. 

Tal como se discutió en la introducción de este artículo, la Ingeniería de Software ha cambiado dramáticamente desde sus orígenes en el siglo pasado, pero sin duda sigue siendo un campo de estudio joven. Es entendible que un rol más nuevo no haya sido estudiado o estandarizado en profundidad.

Esperamos que el análisis de estas patologías ayude a disparar más discusiones acerca de cómo debería evolucionar el rol del Arquitecto de Software, cómo evaluar su impacto, cómo deben crecer y cómo deben ser *coacheados*. Esta es nuestra humilde pero sentida contribución al respecto.