# Post Lesson Thoughts

## Takeaways:
* Make them draw these things, too (can I get coloured pens or something?)
* Maybe discuss singleton class on an objects only and not on a class
* If I make them memorize method lookup rules, then when we join class and singleton class, they will have rules to use
* When we have both class and singleton class, make them tell me whether they are using it like a class or like an object
* Give them a quiz that they can take with them?

## My intdended schedule + how well it mapped to reality

```
30
  PLAN                      REALITY
  10 recap               -> 20
  10 singleton class     -> 20
  10 define our own new  -> 0

30
  PLAN           REALITY
  Modules     -> 30
  include     ->
  extend      ->
  namespacing ->

30
  PLAN                  REALITY
  garbage collection -> 17
  memoization        ->
  self game          -> 0
```

## Reflection

The recap was very encouraging, the students were engaged and
did not seem confused by the material from last time.

The Singleton classes went pretty well. I repeatedly made them
tell me the method lookup rules (I should probably make them
memorize them, otherwise class vs superclass will become super
confusing).

We skipped defining our own new, because we didn't have time.
I feel like it is probably necessary, otherwise we go off into Ruby-land
(we call .new, but we come in on #initialize), so for a complete
picture, it is good. And to explain the relationship between the two,
(ie "why do I define initialize whenI call new"), and remove the magic.

I think modules went well, but I probably need to practice and hone this.
I spoiled some of my reveals. No one guessed how they could be implemented.
(if I make the point visually that method tables are independent of the module,
then that might be useful. OTOH, maybe it desn't matter if they can guess
what's happening).

Namespacing felt a little tacked on. I think my understanding of constant lookup
is just not good (I should have constant lookup rules, too).

We hit GC and Memoization in 17 minutes.
It felt a rushed to me, I'm not sure how well they understood it.
I made the example as close to their app as I could.
Maybe that added, or maybe detracted.
Perhaps should show memoization first (in the small),
then show GC and the problem,
then let them apply memoization to fix it, using this thing they just learned about.

I ran out of time and did not get to play the self game.
That's unfortuante, I think that right at the end is the perfect time to play it,
because it has this nice spaced repetition feel to it, IMO.
I did play it with them 2 days later,
but didn't feel especially great about the results.
Then again, it's a lot of weird code they haven't seen before,
and they're probably still in the stage of matching syntactic patterns
rather than thinking in the object model itself.
Also, I wasn't sure with 1406, either, and the feedback about the self game
from them was very positive.
