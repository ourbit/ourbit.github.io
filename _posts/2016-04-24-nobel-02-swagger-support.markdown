---
layout: post
title: 'Nobel 0.2 supports Swagger and RAML'
ref: Nobel02Swagger
lang: en
author: Norberto Herz
tags: Nobel APIs Arduino IoT codegen RAML Swagger
description: "Nobel: The code generator that exposes a REST API for your Arduino board"
---

Time ago, while I was working with the team building [RAML](http://raml.org), I took advantage of a hackathon to build the first version of [Nobel](https://www.npmjs.com/package/nobel). Briefly, Nobel is an application that uses an API high level definition written with ([Swagger](http://swagger.io/) or [RAML](http://raml.org) to generate the [Arduino](http://www.arduino.cc/) code implementing that API. That first version only supported RAML as the definition language. Recently working and researching a bit more about Swagger and its toolset, I was able to add support for this language as well.
<!--MORE-->

## Swagger or RAML

I think I’ve seen more than 25 posts talking about this (here I share a couple of links with you: [1](http://modeling-languages.com/modeling-web-api-comparing/) [2](http://iasaglobal.org/swagger-vs-raml/) [3](https://www.ibm.com/developerworks/community/blogs/c06ef551-0127-483d-a104-cdd02b1cee31/entry/swagger_apiary_raml_versus_rest?lang=en)). Regardless of these analysis results, I’ve a short list of self opinions after having been working with both:

- I find RAML easier to understand and write. I consider that the language expressivity is higher.
- RAML used YAML from the beginning, while Swagger requested us to write the definition with plain JSON.
- Swagger has a greater community and its toolset seem to be more complete and robust.
- When Swagger 2.0 was launched, the improvement of the language expressivity was remarkable . Though, the trend of translating the old JSON to the new YAML 1:1 stops from making it comparable to RAML.
- While RAML 1.0 release brought interesting news to the table (on November 2015), the Node.js parser is still “beta” which makes that the cornerstone for writing a great branch of tools is not robust enough for being production ready.
- The object returned by the RAML (0.8) parser is much more intuitive and easy to “browse” than the one returned by the Swagger (2.0) parser.

Regardless of this analysis, nothing stops me from making the tool support both language. This is due to the capacity of creating an intermediate object that is the one used for generating the Arduino source code. The next diagram shows that behavior

![Nobel - Application Flow](/img/posts/nobel-flow.png)

## Getting started

Nobel’s main goal is to give people with a minimum knowledge on Arduino coding the chance of building their own device controlled remotely via HTTP. That said, it is required: - An Arduino board and the development toolset installed. - An [Ethernet Shield](https://www.arduino.cc/en/Main/ArduinoEthernetShield). - Basic knowledge of Swagger or RAML. - [Node.js](https://nodejs.org/) installed.

Reading the [Nobel’s documentation](https://www.npmjs.com/package/nobel) you will find all the information needed to deeply understand its behavior. You will also find a [walkthrough example](https://www.npmjs.com/package/nobel#hands-on-example) for having your first device working in minutes.

## What for

The goal of Nobel is to solve a relatively complex problem: Exposing a REST API over an Arduino board. This way developers can focus on building their own devices. Now you can think about those projects you have been delaying, and start controlling your own devices remotely.

## Contribute

Nobel is an Open Source application. You can contribute by improving the code, adding new features, testing and reporting bugs. Here is the link to the [GitHub repository](https://github.com/nohorbee/nobel).
