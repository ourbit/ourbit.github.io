---
layout: post
title: "Ese código no es nuestro"
ref: thatsnotourcode
lang: es
author: Norberto Herz
tags: Conway Ownership Organization Encapsulation Autonomy Engineering Culture
description: "The mantra your engineering organization should avoid"
---

La primera vez que leí algo acerca de la "Ley de Conway" fue en el contexto de un excelente libro ["Building Microservices" by Sam Newman](http://shop.oreilly.com/product/0636920033158.do). Esta ley dice que: "Cualquier organización que diseña un sistema (en el sentido amplio de su definición), producirá un diseño cuya estructura es una copia de la estructura comunicacional de la organización".

<!--MORE-->

Cuando hablamos de Microservicios, solemos decir que su implementación no es solo una manera de obtener componentes independientes, sino también equipos autónomos que construyan y operen dichos componentes. Parecería que además estamos diciendo que algunas propiedades de nuestros sistemas (o componentes, servicios, aplicaciones) son también deseables para nuestra organización. Más aún, hablando de equipos y autonomía, podríamos concluir en que, de la misma forma en que los componentes deberían ser altamente cohesivos y ligeramente acoplados, los equipos deberían imitar dicho comportamiento. Mientras que esto parece una buena idea, puede ser un concepto extremadamente peligroso para una organización de Ingeniería.

Para componentes, es cierto que queremos encapsular su comportamiento de una forma en que podamos solicitar que algo se haga tan solo sabiendo cómo pedirlo (recordemos que ligeramente acoplado no significa "totalmente desacoplado"). Un buen nivel de encapsulamiento se suele medir en base a qué tan bien están ocultos los detalles de implementación: El componente A no conoce nada de la implementación del componente B.

Pensemos la misma situación para un par de equipos de trabajo. El equipo A es responsable del componente A y el equipo B del componente B. El componente A solicita un servicio al componente B mediante su API. Todo va bien hasta que el componente B falla. En este momento, el escenario se vuelve más interesante: para el equipo B, el bug es menor, mientras que para el equipo A es crítico. Ahora agreguemos pimienta: El equipo B está trabajando al máximo de su capacidad por lo que, sin importar la criticidad, el bug no se va a corregir en un tiempo aceptable. Instintivamente, cualquiera podría proponer "Pongamos a alguien del equipo A a arreglar el bug del componente del equipo B" y, asumiendo que el equipo A tiene algo de capacidad para ocuparse del tema, sería una solución factible. Sin embargo, esto va en contra del principio de Encapsulamiento a nivel de equipo.

Si tuviéramos una política estricta al respecto, nuestra organización estaría limitada por un dogma ridículamente inflexible. Se debe evitar que un componente conozca los detalles de implementación de sus pares. Eso es buen diseño. Pero a un nivel organizacional, es más bien una falta de criterio. Como desarrollador, no me va a lastimar investigar un poco más y saber como funciona lo que está del otro lado.

Podríamos repensar esta situación considerando que el ***ownership*** **es un concepto organizacional pero no necesariamente operacional**. "Este código es tuyo" funciona perfecto cuando estamos organizando módulos en un monolito, o servicios en aplicaciones distribuidas. Pero, al momento de operar, esto debería ser solo una "recomendación". Tendremos que ser más estrictos con esto cuando se trate de trabajo planificado (como un *roadmap*) y más flexibles para situaciones no planificadas (como *bugs* que van apareciendo).


Podemos aprender de buenas experiencias que involucran librerías *open source*. Cuando empezamos a trabajar con alguna de estas librerías, nos prometen que al hacerlo, vamos a poder enfocarnos en nuestra funcionalidad y olvidarnos de la complejidad de manejar *inserte lo que sea que esa librería se supone que está haciendo de forma transparente*. En algún momento, encontrás un bug en la librería que amenaza toda la arquitectura, salvo que agregues un *workaround* elegante en tu hermoso código, que pueda ser removido una vez que el bug esté arreglado. Pero esa no es la forma en que se trabaja en el mundo *open source*. En lugar de esto, deberías invertir tu tiempo en arreglar el *bug* y mejorar la librería. Al hacerlo:
- Evitás un *hack* en tu código.
- Evitás un *hack* en el código de otras personas (que usan la librería).
- Hacés la librería más robusta.
- Te convertís en un *contributor* e incentivás a otros a que sigan tu ejemplo.
- ~~Ganás un Nobel~~ no tanto, solo estás haciendo tu trabajo, pero podrías obtener algo de crédito por eso también.

Pero, para poder hacerlo, no te va a alcanzar con entender cómo trabaja la librería. Vas a necesitar conocer cómo fue construida.

Volviendo a nuestra organización de Ingeniería, seguramente estás pensando: Somos un par de docenas de equipos con alrededor de diez desarrolladores por equipo. No creo que el mejor uso de mi tiempo sea estar leyendo **todo** el código por si acaso. Correcto. De hecho, si todos los desarrolladores hicieran eso, no habría ni una sola feature nueva ni un bug arreglado. **Nunca**.

Por suerte esto tampoco es necesario. Como una organización de Ingeniería, debemos asegurarnos de que:
- Los equipos responsables de componentes tengan disponibilidad para ayudar a alguien a entender rápidamente partes de los mismos.
- El código sea tan fácil de entender como sea posible. Después de todo, un código limpio y bien hecho, debería ser legible.
- Los líderes técnicos o arquitectos estén involucrados, entiendan y construyan código para varios equipos.
- Los desarrolladores sean curiosos y siempre proactivos: "Este código no es nuestro" debería ser una decisión organizacional y no solamente un mal hábito.
- Esto ocurra tan poco frecuentemente como se pueda: Se debe medir la cantidad de veces que se rompe la política de *ownership*. Deberían identificarse tendencias y se debería tomar acción en base a las mismas. Después de todo, es cierto que esta situación es menos eficiente que trabajar en nuestro propio código (que conocemos mejor).
- Los equipos cambien: La gente tiene que rotar, salir de la zona de confort. La mayoría de las veces, la gente quiere un cambio cada tanto. Si encontrás un grupo de gente que no está dispuesta a rotar, mostrales los beneficios de hacerlo. Si la actitud persistiera, no dudes en ir más lejos.

Hay otras formas en que la "Ley de Conway" puede aparecer, sin ser dañina para tu organización de Ingeniería. Por ejemplo, el escenario descripto podría verse como "balanceo de carga".

Mantener un buen *mindset* y la cultura correcta son puntos cruciales para tener una organización que entienda sus límites y cuándo es correcto ir más allá.
