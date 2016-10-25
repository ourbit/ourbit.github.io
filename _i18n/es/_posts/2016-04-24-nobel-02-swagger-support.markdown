---
layout: post
title: 'Nobel 0.2 soporta Swagger y RAML'
author: nohorbee
tags: Nobel APIs Arduino IoT codegen RAML Swagger
description: "Nobel: The code generator that exposes a REST API for your Arduino board"
---

Tiempo atrás, cuando trabajaba con el equipo que desarrolló [RAML](http://raml.org), aproveché el tiempo de una *hackathon* para crear una primera versión de [Nobel](https://www.npmjs.com/package/nobel). En pocas palabras, Nobel es una aplicación que utiliza una definición de una API en un lenguaje de alto nivel ([Swagger](http://swagger.io/) o [RAML](http://raml.org)) para generar el código [Arduino](http://www.arduino.cc/) que implementa dicha API. Esta primera versión solo soportaba RAML como lenguaje de definición. Recientemente, habiendo podido investigar un poco más Swagger y sus herramientas, pude agregar soporte para este lenguaje también.
<!--MORE-->

## Swagger o RAML

Creo haber visto más de 25 posts que hablan de esta temática (aquí comparto algunos links con ustedes: [1](http://modeling-languages.com/modeling-web-api-comparing/) [2](http://iasaglobal.org/swagger-vs-raml/) [3](https://www.ibm.com/developerworks/community/blogs/c06ef551-0127-483d-a104-cdd02b1cee31/entry/swagger_apiary_raml_versus_rest?lang=en)).
Independientemente de los resultados de estos análisis, tengo una pequeña lista de propios pensamientos al respecto habiéndo trabajado con ambos:

- RAML me resulta más fácil de entender y de escribir. Considero que la expresividad del lenguaje es superior.
- RAML introdujo YAML desde el comienzo, mientras que swagger nos pedía que escribiéramos la definición directamente en JSON.
- Swagger tiene mayor comunidad y sus herramientas parecen más completas y robustas.
- Con el lanzamiento de Swagger 2.0, la capacidad expresiva del lenguaje mejoró notablemente, aunque la tendencia a traducir 1:1 el antiguo JSON al nuevo YAML no lo pone a la altura de RAML.
- Mientras que el lanzamiento de RAML 1.0 trajo novedades más que interesantes (Noviembre 2015), el parser para Node.js sigue en “beta”, lo que hace que la piedra angular de una gran rama de herramientas pueda no ser lo suficientemente robusta para ser lanzada a producción.
- El objeto que devuelve el parser de RAML (0.8) es realmente mucho más intuitivo y fácil de “navegar” que el que devuelve el parser de Swagger (2.0).

Independientemente de todo análisis, nada me impide hacer que la herramienta soporte ambos lenguajes y esto se debe principalmente a la capacidad de crear un objeto intermedio que es el que será utilizado para generar el código fuente. El siguiente diagrama representa dicho comportamiento.

![Nobel - Flujo de la aplicación](/img/posts/nobel-flow.png)

## Cómo comenzar

El principal objetivo de Nobel es que cualquier persona con mínimos conocimientos sobre programación en Arduino, pueda desarrollar su propio dispositivo controlado remotamente vía HTTP. Habiendo dicho esto, es necesario: - Contar con una placa Arduino y las herramientas de desarrollo instaladas. - Contar con un [Ethernet Shield](https://www.arduino.cc/en/Main/ArduinoEthernetShield). - Contar con conocimientos básicos de Swagger o RAML. - Tener instalado [Node.js](https://nodejs.org/).

En la [documentación de Nobel](https://www.npmjs.com/package/nobel) se puede encontrar toda la información necesaria para entender su funcionamiento en profundidad, así como un [ejemplo práctico](https://www.npmjs.com/package/nobel#hands-on-example) para tener nuestro primer dispositivo funcionando en minutos.

## Para qué

La intención de Nobel es solucionar una problemática relativamente compleja: Exponer una API REST utilizando una placa Arduino. De esta forma, los desarrolladores pueden concentrarse en construir sus propios dispositivos. Ahora podés pensar en aquellos proyectos que venías postergando y comenzar a controlar tus propios dispositivos de forma remota.

## Contribuir

Nobel es una aplicación Open Source. Podés contribuir mejorando el código, incorporando nuevas funcionalidades, probando y reportando errores. En este link podés encontrar el [repositorio GitHub](https://github.com/nohorbee/nobel)

