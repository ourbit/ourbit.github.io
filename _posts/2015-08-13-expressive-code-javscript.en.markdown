---
layout: post
title: 'Expressive code in Javascript'
subtitle: High order functions
author: nohorbee
tags: javascript expressive code array prototype functions forEach map reduce filter every some
---

There are many (maybe too many) aspects to take care of when writing a piece of code: *performance, maintainability and readability*, for mentioning a few of them.  
One aspect I find particularly interesting is "expressiveness" which means "the ability of enunciate what is being done".

Since I am a *Javascript Hipster ("I loved it before it was catching on")* I would like to show some examples of how *Javascript* lets us be really expressive working with *arrays* (and some particular functions): *forEach, filter, map, reduce, every* and *some*.
<!--MORE-->

Even though "Expressiveness" is an attribute often associated to the language, all of them let us be more or less expressive when writing different pieces of code that do the same. Because of that, it would be more precise to say that a piece of code is "expressive" if it is capable of really enunciate what is it doing.

Let's consider, for example, this group of people:

{% highlight javascript %}
var persons = [
  {"name": "John Doe", "age": 27, "weight": 176},
  {"name": "John Doe Jr.", "age": 3, "weight": 22},
  {"name": "Jane Doe", "age": 24, "weight": 127},
  {"name": "Julian Doe", "age": 32, "weight": 160}
];
{% endhighlight %}

Now, let's traverse this *array* and, for each person, print "*Name* is *age* years old".

{% highlight javascript %}
for(var i=0;i<persons.length;i++) {
  console.log(persons[i].name + " - " + persons[i].age);
}
{% endhighlight %}

This piece of code is fairly straightforward, short and readable enough. Though, that doesn't make it necessarily **expressive**. What we were trying to do: Print "*Name* is *age* years old" per each person. This is what our code is actually saying:

1. Initialize a variable named *i* with the value *0*.
2. As long as the variable is lower than the persons quantity, increment it and run the following code block:  
  2.1. Get the name of the person at the index equals to the previously initialized variable.  
  2.2. Concatenate a space, a hyphen and then another space.  
  2.3. Concatenate the age of the person at the index equals to the previously initialized variable.  
  2.4. Log the result on the console.  

Let's start by extracting the code inside the *for* to a function receiving a *person* as parameter. The function prints the specified pattern.

{% highlight javascript %}
var printPattern = function(person) {
  console.log(person.name + " - " + person.age)
}

for(var i=0;i<persons.length;i++) {
  printPattern(persons[i]);
}
{% endhighlight %}
If you are now thinking "this is not even related to *Javascript* and its *arrays* functions", you are right. *All you need is to have a little patience*.  
We just *encapsulated* a functionality in order to hide it complexity. Even though *encapsulation* is a concept mainly related to the Object Oriented Programming paradigm, it can be achieved in so many different ways and *functions* are an ancient way of doing it. The goal of *encapsulating* code is not to make it more expressive, but it does it in most of the cases as a collateral effect.

If we read the new code (skipping the new function description):

1. Initialize a variable named  *i* with the value *0*.
2. As long as the variable is lower to the persons quantity, increment it and
 1. Print the pattern for the person at the index equals to the previously initialized variable.

### Array.Prototype.forEach  
Though the code has turned into something a little bit more expressive, it seems to be more concerned for the variable *i*, its initialization and limit than focused on the person itself.
Fortunately, there are other ways of traversing an *array*. For example, the  ```Array.prototype.forEach(function)``` method.

{% highlight javascript %}
persons.forEach(printPattern);
{% endhighlight %}

If we read this new code:

1. For each person, print the pattern.

This way, this piece of code *does* and *expresses* exactly what we want it to.
However, regardless reading it is much simpler, it's necessary to understand what's going on behind the curtain.  
For starter, something to highlight about *Javascript* is that *everything (or almost everything) is a message.* This means that objects, functions, methods and values are messages (or expressions) and hence, can be passed as parameters.
Unlike the *for* that is a statement, the *forEach* is a method belonging to the object *Array* (or its *prototype*). Combining these concepts, *forEach* traverses the *array* and invokes the function it received as parameter, on each iteration. During that invocation *forEach* passes to the other function, the element that is being iterated.
This could be a homemade *forEach* impleentation:

{% highlight javascript %}
Array.prototype.forEach = function(func) {
  for(var i=0;i<this.length;i++) {
    func(this[i]);
  }
}
{% endhighlight %}

Additionally *forEach* receives a second (and optional) parameter that represents a function that will be invoked when the *array* traversing is over.
This could look useless for the examples we are working on, however, it becomes essential when working on an asynchronous development scenario (as you would have working with [NodeJS](http://nodejs.org)).

There are 2 other parameters that ***forEach*** *passes to the other function*:

- *index*: The index of the element being iterated.
- *array*: The full *array*.

*forEach* does not return any result, but it's possible to modify the *array* being iterated inside the function it calls (we will learn that it must be done carefully).

### Not suitable for under 25s
Let's suppose that a really exclusive bar is not suitable for under 25s. We could try to write a piece of code that removes from the *array* those people that don't match that criteria. The piece of code looks like:

{% highlight javascript %}
persons.forEach(function(person, index, arr) {
  if(person.age<25) {
    arr.splice(index, 1);
  }
});
persons.forEach(printPattern);
{% endhighlight %}
**Note**: [*splice*](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice) is useful for removing elements from an *array*.

If we run this code, we will get the following output:

{% highlight console %}
John Doe - 27
Jane Doe - 24
Julian Doe - 32
{% endhighlight %}

For some reason, Jane Doe successfully beat our bar's security and slunk. That reason is cause of countless *bugs* on countless pieces of code.  
On each iteration *index* is incremented by 1. First time (*index=0*) we find John Doe, 27 years old. It is kept in the *array*. Second time (*index=1*) we find John Doe Jr, 3 years old (who, of course, *shall not pass*). When we remove him from the *array* Jane Doe is moved to the *index 1* and Julian Doe to the *index 2*. Third time (*index=2*) Julian Doe appears. This means that Jane Doe has been skipped. **It's like if the security guy turned away each time he pull someone away from the bar, and at that moment let anybody go in regardless its age.**
It's usually not a good idea to modify the *array* being iterated. As a workaround we could use an auxiliary *array* and overwrite the original once the iteration is over.

Regardless of the previous code malfunctioning, let's analyze its **expressivity**:

1. For each person:  
  1.1. Check if it's age is greater or equals than 25.  
  1.2. If it isn't, remove 1 position from the *array* starting at *index*.  
2. For each person, print the pattern (special care to the code in order to understand that it means "for each person that has been kept in the *array*).  

It doesn't seem to be that bad, but we are still aware of the *array*, the *index* and the comparison logic. Furthermore, if we wanted to reuse this code for removing people younger than 18 we would need to duplicate it.
Let's start by tackling this second issue

### Functions creating functions
This is a *Javascript* feature that, properly used, allows us to write expressive and highly reusable code.
Let's take this code as an example:

{% highlight javascript %}
function olderThan25() {
   return function(person) { return !(person.age<25) }
 }
var older = olderThan25();
{% endhighlight %}
*olderThan25* is returning a function that receives a person and returns *true* if that person is older than 25. It means that, when we assign the result of its execution to the *older* variable, ```older(person)``` will perform the previously mentioned evaluation.  
Thus,

{% highlight javascript %}
console.log(older({"name": "John Doe Jr.", "age": 3}));
{% endhighlight %}

outputs ```false```

Applying this same concept we can achieve a more reusable and even more expressive piece of code. Let's pass the "age threshold" we want to evaluate as a parameter
{% highlight javascript %}
function olderThan(threshold) {
   return function(person) { return !(person.age<threshold) }
 }
var olderThan25 = olderThan(25);
var olderThan3 = olderThan(3);
{% endhighlight %}

Now we can create as many functions we want with different thresholds and name these in a way that represent what it's being done.  
Applied to the previous code (that was trying to remove people younger than 25):

{% highlight javascript %}
persons.forEach(function(person, index, arr) {
  if(!olderThan25(person)) {
    arr.splice(index, 1);
  }
});
persons.forEach(printPattern);
{% endhighlight %}

- The code is still not working (the problem described above is still there).
- Even though the readability has improved, it's still being read as "if the person is older than 25, remove 1 position from the *array* starting at *index*". Expressivity is almost the same.

### Array.Prototype.filter

Fortunately *JavaScript* gives us an *array* method that does exactly what we are looking for.
The *filter* method receives 2 parameters:

- *callback*: The function that evaluates the condition that defines if the element being iterated belongs to the set. It needs to return *true* if the element belongs, and *false* otherwise.
- *contextObject* (optional): The object that will be used as *this* inside the *callback* function.

At the same time,  *filter* passes 3 parameters to *callback* (the same way *forEach* does):

- *element*: The element being iterated.
- *index*: The position of that element inside the *array*.
- *array*: The *array* being iterated.

Unlike the *forEach*, *filter* does return a **new** *array* with the elements that match the test performed by *callback*.

Considering this new method, the next piece of code solves the requirement:

{% highlight javascript %}
persons.filter(olderThan25).forEach(printPattern);
{% endhighlight %}

About its expressivity, it could be read as:

1. Filter those persons **not** older than 25 and print the pattern for each one.

An issue about this method expressivity is its name *filter* (and/or the fact that it removes the element when *callback* returns *false*). This would make us to read "filter older than 25", when we are doing exactly the opposite. *Well, nothing is perfect*.

### Watch your weight

We have succeeded at working with each person in our group and performing operations with each one of them. But lot of times we'll need to work with the group as a whole.  
Let's suppose that *our* persons are stepping into an elevator. For security reasons, moderns elevators use a scale in order to make sure that the maximum allowed weight is not exceeded. Let's try to avoid the shame of hearing the buzzer and calculate the total weight in advance:

{% highlight javascript %}
var totalWeight = 0;
persons.forEach(function(person) {
  totalWeight += person.weight ;
});
console.log(totalWeight);
{% endhighlight %}

Some observations about this code:

- As we have seen, *forEach* receives a function as its first parameter. This far, we used to create the function as a previous step and pass its name as parameter. However, since *function* is an expression that returns a function, *Javascript* syntax lets us to define the function in place. This function in particular has no name. These kind of functions are called **anonymous functions**. Functions categorization would worth its own post.
- Since *forEach* is not returning any value, it's necessary to define an external variable that accumulates the successive sums.
- The code we are going to write is not *automatically* more expressive than the one we wrote above (**IMO**), but doubtless, it turns amazingly easy to get when we understand the meaning and importance of *map* and *reduce* methods.

Step by step. Let's first consider how sensitive people are about their weight and let's try to keep it confidential. Let's obtain a new *array* that only contains the weight of the people in our group.

{% highlight javascript %}
var weights = [];
persons.forEach(function(person, index) {
  weights[index] = person.weight;
});
{% endhighlight %}

This code can be read as:

1. Declare an empty *weights* array.
2. For each person, invoke a function that receives the person and its index inside the original *array*.
  1. The function gets the person weight and assign it to that index but in the new *array*.

{% highlight javascript %}
console.log(weights);
{% endhighlight %}
outputs

{% highlight console %}
[ 176, 22, 127, 160 ]
{% endhighlight %}

### Array.prototype.map

In general, we call "[to map](https://en.wikipedia.org/wiki/Map_(mathematics))" to the process of associating elements from one set with elements from a different set. This means that the code above "maps people with/by their corresponding weights".
It would be nice to be able to write that same thing in *Javascript* the following way:
{% highlight javascript %}
persons.map(weight);
{% endhighlight %}

As a matter of fact, if we defined *weight* as a function that returns the weight of a person, the code above does **exactly** what it says.
{% highlight javascript %}
function weight(person) { return person.weight; }
{% endhighlight %}

The *map* method receives the same 2 parameters than *filter*:

- *callback*: The function that determines the association criteria (it must return the value to map to each element).
- *contextObject* (optional): The object that will be used as *this* inside the *callback* function.

At the same time *map* passes 3 parameters to *callback* (the same way *forEach* and *filter* do):

- *element*: The element being iterated.
- *index*: The *index* of that element in the *array*.
- *array*: The *array* being iterated.

*map* returns a **new** *array* with the elements of the second set. In our case it returns an *array* with people weights.  

Going back to our example, each weight doesn't help us to determine whether is dangerous to activate the elevator or not. We still need to get the total weight.

Following the previous approach, and taking advantage of the *map* function, our code would look like this:
{% highlight javascript %}
var totalWeight = 0;
persons.map(weight).forEach(function(weight) {
  totalWeight += weight ;
});
console.log(totalWeight);
{% endhighlight %}

It means that we first get the weights *array* and then we iterate it performing the sum. This is a small (almost trivial) improvement in comparison with our last version.

### Array.prototype.reduce

The term *reduce* is, IMO, not too much descriptive in regards to the goal of this method. Other languages (associated to the *functional* paradigm) usually refers to this function as [*fold*](https://en.wikipedia.org/wiki/Fold_(higher-order_function)). A good approach to understand it is to think about *reduce* as "summarize". We want to find a single value that *summarizes* every other values. For example, 10 summarizes 4, 3, 2 and 1 if we consider the addition as a way of summarizing. 24 summarizes 4, 3, 2, 1 if we consider multiplication as a way of summarizing.  
So, defining sum as:

{% highlight javascript %}
function sum(a,b) { return a+b; }
{% endhighlight %}
and considering the following piece of code:

{% highlight javascript %}
 persons.map(weight).reduce(sum);
{% endhighlight %}

we could read: summarize by sum the weight of the people. Or, sum the weight of the people.

*reduce* method receives 2 parameters:

- *callback*: The function containing the reduction logic (the way of summarizing).
- *initialValue* (optional): The initial value of the *acummulator*.

At the same time, *reduce* passes 4 parameters to *callback*:

- *previousValue*: The result of *callback* last execution, or *initialValue* (the first time it's executed).
- *currentValue*: The value being iterated.
- *index*: The position of that value inside the *array*.
- *array*: The *array* being iterated.

*reduce* returns an **only** value that matches the result of *callback* last execution.  

There are some qualities of *reduce* that could label it as a recursive method. Instead of thinking *reduce* as a function that iterates the *array* applying *callback*, we could think about it as a function that takes the *array* first position and applies *callback* passing the current position and the result of *reduce* for a second *array* that goes from the original *array* second position to the last one. This is meaningless when using it, but knowing this, will help us to understand how it works, why it **accumulates** and how the *initialValue* works.

### A visit to the drive-in cinema

People get out of the elevator, jumped into the car and drove to the drive-in cinema. They choose a not suitable for under 18s movie. We need to figure out if **every** person in the car matches the criteria.

There are several ways of achieving this. For example:

- Iterate and query  
{% highlight javascript %}
persons.forEach(function(person) {
  areOlder = areOlder && olderThan18(person);
});
{% endhighlight %}
We are using the *olderThan(threshold)* in order to generate the function *olderThan18*.

- Reduce by applying the logical "AND"
{% highlight javascript %}
persons.reduce(function(isPreviousOlder18, person) {
  console.log(person)
  return (isPreviousOlder18 && olderThan18(person));
},true);
{% endhighlight %}


- Mapping the ages *array* and reduce by applying the logical "AND"
{% highlight javascript %}
persons.map(function(person) {
  return person.age;
}).reduce(function(isPreviousGreater18, age) {
  return (isPreviousGreater18 && greaterThan18(age));
},true);
{% endhighlight %}
This one is similar to the previous one, but before *reducing* we get the ages *array* and hence, instead of using a function that receives a person and compares it age, we are now using a similar one that simply compares the age. *greaterThan18* is generated in a similar way than *olderThan18*.

All these solutions have the same problem (or improvement opportunity): These are evaluating the entire *array* regardless what happens with each element. In our case, evaluating the second element we could tell that not every people are older than 18. In *boolean* evaluations, this is known as "short circuit evaluation".
{% highlight javascript %}
true || whatever // -> true
false && whatever // -> false
{% endhighlight %}
In both cases, evaluating *whatever* is useless.

This seems to be meaningless in a 4 elements *array*. However, what would happen if we had a bus, train, or plain trying to enter the drive-in cinema? Aside from the probable venue space issue, our solutions would be using unnecesary processing cycles A.K.A **bad performance**.  
The way of solving this issue is *breaking* the iterations when evaluation is no longer needed. The instruction *break* does exactly that, but is not suitable for the methods we are using (as it is for the classic *for*). There are other "techniques" for quitting these methods, but none of them is smart nor recommended (for example, we could assign 0 to the *array.length* if we didn't need to keep working with the *array*. We could also make a copy of that *array* if we wanted to change its length without any problem. Or we could just *throw an exception* and *catch it* immediately after the method call).

But there is a reason for this problem to appear when using these methods. On the *forEach* case, that reason is even explicit at its name. *For Each* element in the *array* implies that *all* of its elements will be iterated.

### Every-Some

Going back to the **expressiveness** topic, none of our solutions turned to be too much expressive (do the exercise yourselves of identifying what is being said by each one and what is being done). The statement should be simpler. Verify that every person is older than 18.

{% highlight javascript %}
persons.every(olderThan18);
{% endhighlight %}
This solution says and does exactly what we are looking for. It returns *true* if every people in the array are older than 18. Otherwise, it returns *false*.
In addition of being highly expressive, *every* respects the short circuit evaluation. This means that it will stop iterating as soon as it founds a not matching person.

*every* method receives 2 parameters:

- *callback*: The function evaluating the condition to match (it must return *true* or *false*).
- *contextObject* (optional): The object that will be used as *this* inside the *callback* function.

At the same time, *every* passes 3 parameters to *callback* (the same way that the other methods do):

- *element*: The element being iterated.
- *index*: The *index* of that element inside the *array*.
- *array*: The *array* being iterated.

*every* returns *true* if all its elements match the condition, or *false* as soon as it find one element that doesn't.


### Looking for a suitable movie

Movies age restrictions must be observed. Although our people didn't find any "suitable for all audiences", a new release has just appeared and it can be watched even by children with adult supervision. Putting aside these adults criteria, let's write a solution that evaluates if at least one person is older than 18. Before showing all the alternatives (the way we did for the previous scenario *every*), let's think: wouldn't exist any other method capable of saying and doing what we are looking for?
The short answer is **yes**:


{% highlight javascript %}
persons.some(olderThan18);
{% endhighlight %}

*some* method receives 2 parameters:

- *callback*: The function evaluating the condition to match (it must return *true* or *false*).
- *contextObject* (optional): The object that will be used as *this* inside the *callback* function.

At the same time, *every* passes 3 parameters to *callback* (the same way that the other methods do):

- *element*: The element being iterated.
- *index*: The *index* of that element inside the *array*.
- *array*: The *array* being iterated.

*some* returns *false* if none of its elements matches the condition, or *false* as soon as it find one element that does.

### Performance

As I mentioned at the very beginning, *expressivity* is just one of many aspects that must be considered. Many times this aspects run into conflict and it's necessary to evaluate which one is the most important.  
Let's consider the following problem: I must get an *array* with people with weight under 130 pounds and older than 10.
Using what we have seen, we could naturally think that the following solution is the ideal one:

{% highlight javascript %}
persons.filter(olderThan10).filter(softerThan130);
{% endhighlight %}

As a matter of fact, this solution is not ideal. It's just expressive.
When filtering, we are iterating the *array*. When filtering twice, we are iterating 2 *arrays*. If *persons* contains N elements and M are older than 10, the solution will iterate N + M elements. The following solution might be a little bit less expressive, but we can be sure that only N elements will be iterated:

{% highlight javascript %}
persons.filter(olderThan10AndsofterThan130)
{% endhighlight %}
considering
{% highlight javascript %}
function olderThan10AndsofterThan130(person) {
  return olderThan10(person) && softerThan130(person);
}
{% endhighlight %}

When compromising aspects, it's necessary to consider the use case. If our *arrays* are containing families (a few elements), we might allow ourselves to have the most expressive code. But if we were processing the entire electoral roll, we should better worry about the *performance*.

### Summary

*Javascript* syntax is powerful enough to let us work with the good parts of the *procedural*, *object oriented* and *functional* paradigms. Good practices of each paradigm could give us advantages when trying to improve some aspect of our code. Most of the times, when improving one aspect, we will be worsening others (For example: More Expressivity -> Less Performance). In occasions, these aspects will be related in more complex ways (For example: More Performance and Good Expressivity -> Less Flexibility). It's part of our job when writing a piece of code, to evaluate which aspects we want to favor and which ones we will be punishing. Most of the times we will jump into the pitfall and favor those aspects that we like the most. That's something to avoid. In order to know which aspects should be improved, the best option is to consider the use case.
