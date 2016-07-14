---
layout: post
title: 'A Compendium of Software Architects’ Pathologies'
author: nohorbee
tags: Software Architecture Role Management Pitfall
description: "Nobel: The code generator that exposes a REST API for your Arduino board"
---

*By [Marcos Chicote](https://ar.linkedin.com/in/mchicote), [Guido de Caso](https://twitter.com/guidodecaso), and [Norberto Herz](https://twitter.com/nohorbee)*
<br /><br />

Soon after the field of software architectures was formally born thanks to the work of Garlan, Shaw, Notkin and others in the early 90s, the role of the "Software Architect" emerged in the software development landscape. Following the definitions of the Software Architecture community, the architect's job is to define the high level design of a software system or, in other words, make the principal design decisions that build a bridge between requirements and implementation.  
However, in practice things are not that simple, and the architect's job is full of pitfalls and contradictions. We describe what we call are five pathologies that can affect software architects, including symptoms and prognosis, with the goal of sparking more discussions about this role and its desired evolution.

<!--MORE-->

## Introduction

There is no doubt that Software Engineering has been constantly evolving over the last five decades. Operating systems have provided an ever improving layer to abstract us away from the complexities of modern hardware. Lean and agile processes have allowed for faster iteration. Cheaper and more accessible data center technologies have lowered the barrier to entry for high performance computing and opened the gate to tackling more ambitious problems diverse fields such as medicine, the aerospatial industry, academy or e-commerce.

The way engineers organize ourselves to go build software that solves these complex problems has also shifted. From individuals writing programs for mainframes to big corporations with multiple product lines and platforms. The role of Software Architects appeared as such mostly in the context of multi-tier applications where the amount of implementation choices grew exponentially. [[1]](http://dl.acm.org/citation.cfm?id=579257) [[2]](http://www.bredemeyer.com/pdf_files/role.pdf)

Software Architects’ responsibilities and duties are varied and depend heavily on the company and environment. There are slight variations of these responsibilities depending on whether we consider an Application Architect or an Enterprise Architect. But, regardless of such differences we can define the Software Architect’s scope as driven by these areas:

1. Subdividing the design of large applications into smaller and more manageable parts.
2. Identifying technologies, frameworks, patterns, process improvements and best practices that are to be adopted by an organization and communicating these to developers, establishing thus key mentorship relations.

But while this enumeration serves the purpose of a Software Architect’s job description template, it does not answer questions such as what traits or tasks separate the most impactful Software Architects from their peers. How is the Software Architect career path defined and where do Software Architects come from. How can they walk the fine balance between becoming great generalists as opposed to incredible specialists.

In this article we set out to explore and discuss some of these topics. We do so via a series of apparent contradictions or fallacies arising from the tension between driving forces at stake in a Software Architect’s career: to be a mentor vs. to be an evangelist, to be coding vs. to be in meetings and other key dilemmas. 

We introduce these apparent contradictions as pathologies. Pathology is rooted in the Ancient Greek concept of pathos (πάθος), meaning "experience" or "suffering", and -logia (-λογία), "study of". We hope that this article can spark interesting discussions among fellow Software Architects and make us reflect about certain common issues that we face in our professional practice.

The careful reader should be warned that some of the following will be particularly more suited for Software Architects in specific situations such as companies with geographically distributed development teams or companies of medium to large size. In any case, we believe that these encompass various relevant topics when it comes to how we think about Software Architects, their role, their career and, ultimately, their impact.

## The Pathologies 

In the next subsections we will describe some of the aforementioned pathologies in terms of how to detect and how to resolve them.

### The Impactless Best Coder Syndrome
<big><i>“This functionality is extremely complex. I should be coding it myself”</i></big>


#### Description

According to the Pareto Principle we acknowledge that 80% of an application’s complexity comes from the 20% of its functionalities. Being the Software Architect the best coder in the team seems to indicate that a big piece of these functionalities should be written by no one else.

#### Symptoms and Diagnosis


- Stressed Software Architect: “I can never find the time to work on these functionalities”
- Missing or poorly written blueprints: “The high level design is complete, the remaining parts can be inferred”
- Stressed Developer: "The blueprints don't make sense. My peers seem to be writing different applications"
- Uncomfortable Senior Developer: "This functionality could be written by somebody else. I should be coding the top 20%"
<p></p>

#### Prognosis

Before jumping to the correct treatment, we propose to discuss the concept of whether the Software Architect is indeed the best coder on the team. Even though it is true that a good Software Architect should have outstanding coding abilities, the role demands a fairly different and more rounded skillset when compared to that of a developer's. That said, it makes sense that not every Software Architect raised from being the best developer of a team, but a really good one who found a way of growing another skillset as well.

We argue that the best developer should be the one responsible for coding the most complex functionalities, while the Software Architect should be the one making those functionalities easier to code. Putting in place a great high level design tends to simplify things by avoiding ambiguities, and identifying reuse opportunities. In many cases, when these opportunities are clear enough, the benefits of using some libraries and frameworks, or the necessity of writing some new ones rise. That is the job of a good Software Architect too.

So, as a Software Architect, put a great architecture in order: build a great design, write the best blueprints, find the simplification opportunities and execute these by writing or using the proper frameworks, help the definition and adoption of the team’s best practices and development processes. That way you should not have to  think "I should be coding this" as often. Instead you will realize that your contributions are enabling a great part of every single functionality.




### The Know-it-all Specialist Dilemma
<big><i>“The world is too big for me to master it all”</i></big>

#### Description

Front-end, back-end, object oriented, functional, AngularJS, Java, Node.js, REST, Polymer, Machine Learning, IoT, Virtual Reality, COBOL, Mainframes, Docker, APIs, Scala. The list of technologies and frameworks goes on and on. The Software Architect’s bandwidth is not infinite, as it is not the time any human has to spend on any set of tasks. Yet it seems as if Software Architects were demanded to master the entire list. We can not choose both being specialists and generalists, or can we?


#### Symptoms and Diagnosis

- Waverer Software Architect: “Everyone asks me about everything and there is no way I can have a good answer for all the questions”
- Lack of ownership: "I'm not an expert on the subject, so, I simply can't make a decision on this"
- Multi-directional decisions: "I'm not sure why we are doing it this way. It seems like if everyone has made it own call"
<p></p>

#### Prognosis

A Software Architect should be a generalist by nature. Even if she or he possesses deep knowledge about a particular technology, the driver to success is the capability of combining a wide range set of skills that can only be achieved by understanding how far to dig on something. Though, there are a set of areas that a Software Architect should master. The following list includes some of them:

- Software principles: The Software Architect needs to master subjects such as the software quality attributes: scalability, availability, resiliency, securability, maintainability, among others [[1]](https://msdn.microsoft.com/en-us/library/ee658094.aspx) [[2]](https://en.wikipedia.org/wiki/List_of_system_quality_attributes). It is also required to understand and be able to design applications in a way that enables statelessness, layering, decoupling [[3]](https://msdn.microsoft.com/en-us/library/bb402962.aspx). Note that these concepts are technology independent, even though different technologies achieve them in different ways.
- Leadership: Being able to become a Technical Leader for the team is crucial. Mastering principles and behaviors such as coaching and mentoring becomes really handy for Software Architects.
- Communication: Designing is all about making decisions. These decisions should contemplate knowledge and experience, but are also the result of understanding different stakeholders’ needs. The design becomes even richer when key members from the development team provide their input in the form of vision and ideas. Furthermore, once the design is in place, it needs to be shared so it can be built. The Software Architect is the central point where all these ends meet. Mastering communication skills is not optional for their role.
- Research: As said, a Software Architect should be a generalist by nature. Being a good researcher is the perfect way of being up to date with the latest in technology trends. A Software Architect should be able to choose which technologies to know and have a fairly good understanding of these.

With this in mind, it is correct to say that a Software Architect is a specialist in architecture topics, and since architecture is about generalisms, they are specialists in being generalists. 

The reason why the list of technologies mentioned on this pathology’s description is virtually infinite is basically that there are so many professionals developing new and exciting technologies everyday. Thus, the way of running a project from the architectural point of view is to exchange knowledge with a bigger team that will be the real knowledge owner.
So, as a  Software Architect, make sure to master the aforementioned skills and you will be able to:

- Put together an architecture that guarantees high software quality attributes.
- Understand which technologies requires most attention at every moment.
- Incorporate general knowledge of these technologies, and make decisions on which ones are needed for a particular project.
- Conduct investigations to push the team to use these technologies.
- Lead the team to build great applications.
<p></p>

### One Feet on Each Continent
<big><i>“I haven't caught up with all the latest books on soft skills, and I'm already starting to forget what to do after catching an exception”</i></big>

#### Description

The path and first steps for becoming a Software Architect are really exciting. We start getting abstracted from a lot of unnecessary and dirty details, we stop dealing with tedious functionalities, and we start facing more “suitable" challenges. We also start spending more time sketching, talking, teaching, meeting, and less time coding. And suddenly there we are, feeling that we are not yet good enough at the new stuff, and yet too far away from where we started. We journeyed far from home and now we are in the middle of the ocean between a rusty Software Engineer and an inexpert Software Architect.


#### Symptoms and Diagnosis

- Succeed by accident: “I feel that people praise me for things that were just happenstance and not the result of my work”
- Fear of being discovered: “I’m afraid someone is going to find out that I’m not ready to be a Software Architect”.
- Repeatability: "I don't know how I ended up here, and I'm pretty sure I won't be able to grow and level up again"
- Pursuing external validation: “Someone should check that every one of my decisions is correct”.
<p></p>

  
#### Prognosis
It is not easy to cope with these feelings but there is something that can help: you are not alone. Actually, these symptoms (among others) are most common than most of us believe and, on top of that, these are grouped under the name of "Impostor Syndrome"[[1]](https://counseling.caltech.edu/general/InfoandResources/Impostor), that was discovered by Dr. Pauline R. Clance in 1978[[2]](https://en.wikipedia.org/wiki/Impostor_syndrome).

There are several ways to overcome this syndrome, including but not limited to[[3]](http://www.apa.org/gradpsych/2013/11/fraud.aspx):

- Talking to your mentors
- Recognizing your expertise
- Remembering what you do well
- Realizing no one is perfect

But maybe the most difficult part is to defeat the fear of being transparent and reflective about this with somebody, be it a friend, a colleague or your boss. Once that we recognize and make peace with this, everything becomes easier and we are ready to put this behind and unleash our full potential as Software Architects.








### The Unprepared Mentor Conundrum
<big><i>“If you wanted me to mentor others you should have prepared me for that”</i></big>

#### Description

Broad consensus exists on including technical mentoring as part of a Software Architect’s responsibilities. Software Architects are expected to spend time with Software Engineers beneath them in the career path advising them on how to develop key missing skills, learn new programming techniques or frameworks and, generally speaking, preparing them to take the next step in the ladder. However as developers progress in their careers and eventually become Software Architects, they require abilities and skills on which they have not been trained on, such as mentoring itself.



#### Symptoms and Diagnosis

- Mentoring bottleneck: "Everyone wants me to help them grow, what's going on?" most Software Engineers start seeking mentoring from the same Software Architect. 
- Shallow empathy: “I don’t feel connected to those I am mentoring”. Mentoring relationships often generate a close relationship between mentor and protégé. If empathy flattens, mentoring is probably failing. 
- Inefficient communication: "I can't get developers to follow my lead on system design" Software Engineers do not understand a system design or can not see why it was designed that way.

<p></p>

  
#### Prognosis

Software Architects should be encouraged to give mentorship to their protégés on all skills required to climb up the career ladder. Particularly on skills needed on higher positions such as Software Architect itself. If mentoring is limited to  technical skills only, it will quite likely fall short once Software Engineers reach a leading position.

It is worth mentioning that, even though we will not get into anthropological and sociological issues like the human capacity to acquire new skills, we do recognize that some people have a more natural tendency for mentorship. Even when Software Architects should help Software Engineers develop soft skills, anyone aspiring to become a Software Architect should learn about mentorship in general. One possibility is for Software Architects to seek guidance from senior leadership in the engineering organization (e.g., VP or Senior Director level) on how to become great mentors.




### The Lost Focus Syndrome

<big><i>“When I sit and focus for 20 minutes straight I get to build amazing things! How come I am not doing that 8 hours a day?”</i></big>

#### Description

As Paul Graham states on the essay Maker's Schedule, Manager's Schedule while managers are on schedules that can change every hour, for makers having a meeting is like throwing an exception, which can be very expensive in terms of performance. As we study the role and analyze its contradictions we wonder: what schedule do Software Architects follow?




#### Symptoms and Diagnosis

- Adapt to managers: "Managers are dragging me into meetings at any time". 
- Wasted time: "I'm a maker, I build working software that goes into production, that is my main responsibility, not answering managers questions".
- Sparse schedule: "Let me code for four hours straight and I'll blow your mind"

In most organizations Software Architects are not managers and therefore do not live by their schedule. And yet proving that they are in the maker's schedule can encounter some difficulties. 

As mentioned on section "The impactless best coder syndrome", Software Architects should not necessarily be responsible for coding even the most complex functionalities and this could be used to make a case against Software Architects being makers. However, as discussed, Software Architects are responsible for building software in a more transversal manner, defining best practices and development processes, or writing frameworks and blueprints. Such duties are undeniable characteristics of a maker.

Transversal components often affect a variety of different actors and have a profound impact on production environments, new features and complex bugs. Software Architects are recurringly called into meetings to analyze and comment on these different topics, taking them time away from designing and mentoring developers. The more a Software Architect builds the  more meetings she will be pulled into, presenting an interesting dylemma.



  
#### Prognosis

Software Architects are makers and, as such, need time to make. Building software, even at the architectural level, requires concentration and focus. Software Architects, as any prestigious position, are frequently consulted on a wide array of topics and will be summoned into meetings. Instead of fighting against it we propose guidelines to minimize the impact of meetings on your real responsibilities:

- Software Architects are advised to have everyone understand that they are makers and they have to be deeply invested in the process of building great software. Peer’s understanding of the Software Architect position and priorities is crucial to minimize invitations to spurious meetings.
- Office hours: Software Architects should set aside time to be available to others. Instead of having managers push Software Architects into adapting to their schedule we advocate Software Architects to create mechanisms to have managers adapt themselves.
- Delegate: Not every meeting you are invited to needs a Software Architect. Delegation to tech leads or specialists will not only save your precious time, it will also help others grow.
<p></p>

## Final Thoughts

While the analogy with medical pathologies may be a bit farfetched, we do believe that there is a lot of value in studying and reflecting about common pitfalls in the Software Architect role. 

As we discussed when we opened this article, Software Engineering has changed quite dramatically from its humble origins in the last century but it yet remains a pretty novel and somewhat adolescent field of study. It is understandable then that an even newer role such as that of the Software Architect has been yet barely standardized or studied.

We hope that the analysis of the pathologies here presented can help spark more discussion about topics such as how the Software Architect’s role should evolve, how can we evaluate their impact, how can we grow them and coach them. This is our humble yet heartfelt contribution in that spirit.

