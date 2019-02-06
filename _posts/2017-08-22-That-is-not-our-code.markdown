---
layout: post
title: "That's not our code"
ref: thatsnotourcode
lang: en
author: Norberto Herz
tags: Conway Ownership Organization Encapsulation Autonomy Engineering Culture
description: "The mantra your engineering organization should avoid"
---

The first time I read about the "Conway's Law" was in the context of an excellent book: ["Building Microservices" by Sam Newman](http://shop.oreilly.com/product/0636920033158.do). The law states that: "Any organization that designs a system (defined broadly) will produce a design whose structure is a copy of the organization's communication structure".

<!--MORE-->

When talking about Microservices, we usually say that not only are these a way to get independent components, but also to have autonomous teams building and operating those components. It seems we are saying that some properties from our systems (or components, or services, or applications) are also desirable for our organization. Furthermore, speaking about teams' autonomy, we could end up saying that the same way components should be highly cohesive and lowly coupled to others, teams should mimic that behavior. Well, while this sounds tempting, it could also be extremely dangerous for an Engineering organization.

For components, it is true that we want to encapsulate behaviors in a way that we can request something to be done by knowing how to ask (let's remember that lowly coupled is not "totally decoupled"). Great encapsulation is usually measured by how good the implementation details are hidden: Component A does not know anything about Component B implementation.

Let's imagine how this could end up being transposed to a couple of teams. Team A owns Component A and Team B owns Component B. Component A requests a service from Component B by hitting its API. Everything goes smoothly until Component B fails. At that stage, the plot thickens: For Team B, the bug is a minor one, while Team A considers it critical. Now let's make it spicy: Imagine Team B is overloaded so, nevermind about the criticality, the bug will not be fixed in an acceptable time. Instinctively, anybody could say "Hey, let's have anybody from Team A fixing this bug on the component owned by Team B" and, assuming that Team A has some capacity to tackle it, that would be a viable solution. However, that would violate the Encapsulation principle at team level.

If we had a strict policy about this, our organization would be limited by a ridiculously inflexible dogma. A component must avoid knowing its peers' implementation details. That's good design. But at an organizational level, it's just poor judgment. As a developer, it won't hurt to go further and see how that works.

We could re-think this by considering **ownership as an organizational concept, but not necessarily an operational one**. "This is mine or yours" works like a charm when organizing modules on a monolith, or services on distributed applications. However, when operating, that should be more like a rule of thumb. We should be more strict when working on something planned (like our roadmap) and more flexible for unplanned situations (like emerging bugs).

We can learn from great experiences involving open source libraries. When we start using one of these libraries, we are promised that by doing so, we will be able to focus on our functionality and forget the complexity of handling *insert whatever thing that library is supposed to do transparently*. Suddenly, you find a bug, and it will kill your architecture unless you hack a smart workaround in your beautiful code that can easily be removed once the bug is fixed. But that's not the way open source works. Instead of that, you should invest that time in fixing the bug and making the library better. If you do so, you will:
- Avoid a hack in your code.
- Avoid a hack in others' code.
- Make the library more robust.
- Become a contributor and encourage others to follow your leads.
- ~~Win a Nobel price~~ just kidding, you are just doing your job, but you might get some recognition for that, too.

However, to do so, you will need to understand more than just how that library works. You will need to know how it is built.

Going back to our Engineering organization, you might be thinking: we are a couple of dozens of teams with around ten devs each. It is not the best use of my time to spend it reading the entire code just in case. That is correct. Actually, if every developer did that, there would not be any new features or bugs fixed. **Ever**.

Luckily, that's not necessary either. As an Engineering organization, we must ensure that:
- Teams that own components are free enough to quickly ramp somebody up on a small piece of them.
- The code is as easy to understand as possible. After all, a good and clean code should be readable.
- Tech-leads or Architects are involved and they understand and build cross-teams code.
- Devs are always curious and eager: "That's not ours" should be an organizational decision and not just a bad habit.
- This happens as little as possible: Breaking the ownership policy should be measured. Tendencies should be identified and acted upon. After all, it is true that this situation is less efficient than working on our own well-known code.
- Teams change: Rotate people, take them outside the comfort zone. Most of the time, people want to change from time to time. If you find a group of people that are not willing to do so, show them how good could it be. If the attitude remains, don't hesitate in going further.

There are other ways Conway's Law will appear that won't be this harmful to your Engineering organization. For instance, the described scenario could be seen as "load balancing".

Keeping the right mindset and the correct culture is key in order to have an organization that understands their boundaries and when it is right to cross them.
