# Post Lesson Thoughts (mine + student feedback)

## We spent 1 hour on bindings
I think maybe it was unclear what "self" was, and possibly *why* it matters.

I *think* I got through the next day by jumping into pry and showing this code:

    require 'pry'
    class Instructor
      def initialize(name)
        @name = name
      end

      def get_name
        binding.pry
        @name
      end
    end

    josh = Instructor.new 'Josh'
    rachel = Instructor.new 'Rachel'
    josh.get_name
    rachel.get_name

Possibly if I drew the binding on the board and showed the local variables in it
and also drew the self pointer.


## I dislike that we did not address `main`

The giant elephant in the room (to me, anyway), was that main and defining methods in main
seems to contradict the model that I am presenting. We can put modules off, we can put
singleton classes off, but we are currently interacting with main, and it appears to
not follow the rules. Where do methods I define in main wind up (and why)?
What is main? How did I get here?

Annoyingly, I know the answers, but I can't fkn find this in the C code.


## I rushed through variables to compensate for going overtime on bindings
Most of what we discussed wound up being covered in the first two lessons

I don't really know how to organize the lessons since it's like you need a piece
of each (bindings require knowlege of local variables, instances of instance_variables)

Perhaps pieces of it should be extracted and dropped into the first two lessons?

But then IDK what to do with constants.

Maybe my understanding of constants is just shitty, and so I don't immediately see
how what I'm doing uses my knowledge of constants.


## Method lookup was too short

Because I spent so much time on bindings, my method lookup was shorter than I wanted it to be.

Feedback was that the example was somewhat confusing. I felt like it became much
clearer to them when I swapped out the `show_stack` results with just arbitrary
values (e.g. `4`) and asked what would be returned.


## Other student feedback

* Student suggested it might have been more helpful to give them quiz-like pieces of code
where they have to identify things like what is going to be returned from a given method,
what self is, what method is going to be found, etc.
* Student suggested that the importance and density of the material would make it a good
candidate for an all-day lesson
* Both students I was talking to expressed a desire to have a class on feedback tools,
where we could install Seeing Is Believing and Pry, go over how to use them, and then
have example problems where they use the tools to perform some task. It's important to
me to get them thinking scientifically (ie hypothesize what will happen, then prove or
disprove it with an experiment, update hypothesis if necessary,
consider implications of hypothesis if their experiment results support it, draw new
hypotheses from these implications, repeat), and these are the tools that I use
to perform my experiments, so perhaps I could incorporate some sort of "process/thinking"
material into such a lesson. I don't know, though, as I don't really know how to teach
that (it's a behaviour) other than to lead them through it a number of times,
wait for them to get stuck and frustrated on their own problem, then use it to
find the answer to whatever is confusing them, so they see how it took thier confusion
and paralysis (not having any way to figure out what to do next) and gave them options
and ultimately led to a solution. At that point, I think they'll begin to think and
behave this way, which then makes it an easy problem of showing them how to get the
feedback they need in order to perform their experiments, ie the tools.
But IDK how to teach that, even though I think it's the single most important thing
that I do in order to be successful as a developer.
