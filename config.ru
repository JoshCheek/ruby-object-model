# HOSTED AT:
# hosted at http://quiz-ruby-object-model.herokuapp.com/


require 'redcarpet'
require 'pygments'
# from readme https://github.com/vmg/redcarpet
class HTMLwithPygments < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, lexer: language)
  end
end

def to_html(markdown)
  leading_space = (markdown.lines[1] || '')[/^\s+/]
  markdown      = markdown.gsub(/^ {0,#{leading_space}}/, '')
  Redcarpet::Markdown.new(HTMLwithPygments,
                           space_after_headers: true,
                           fenced_code_blocks:  true,
                           autolink:            true,
                      ).render(markdown)
end

def qa(q, a)
  {question: q, options: {}, answer: a, hint: '', further_thought: ''}
end

questions =
[

qa('classes are containers for what?',   'methods'),
qa('classes have a pointer to what?',    'their superclass'),
qa('instances are containers for what?', 'instance variables'),
qa('instances have a pointer to what?',  'their class'),
qa('We say classes are also instances.... what does this mean?',
   'it means they have instance variables and a class pointer'),
qa('method parameters are what kind of variable?', 'a local variable'),

qa('all code executes in what?',        'a binding'),
qa('where are the bindings?',           'on the stack'),
qa('bindings are containers for what?', 'local variables'),
qa('bindings have a pointer to what?',  'self'),
qa('what does this give them access to?', 'instance variables and private methods'),

qa('Where are methods stored?', 'in classes'),

qa('If I call a method on an instance, where does it look for the method?', 'in its class'),
qa("What if it doesn't find the method there?", 'then it looks in the superclass'),
qa('What if it doesn\'t find the method there?', 'then it looks in the superclass\'s superclass'),

qa('What does it do once it finds the method?', 'it puts a binding on the stack, with self set to the object the method was called on, and then executes the method inside of it'),
qa('I call `"hello world".upcase`, what is `self` inside of the `upcase` method?', 'the string `"hello world"`'),
# Q: If I call `"hello world".upcase`, where is the upcase method found and how did we locate it?
# Q: Something with a sophisticated inheritance hierarchy
#    Identify the correct class diagram
#    Identify which method will be found


# Q: What is self in each of these cases?
#    (self game)
# Q: Can I access the variable here? (examples of each of the above in places they can / can't be seen)

  {question: "What is the colloquial term for an instance?",
  options: {
    a: "a class",
    b: "an object",
    c: "an instance variable",
    d: "a binding",
  },
  answer: :b,
  hint: 'These are the thing we think about most in this type of programming language',
  further_thought: '',
},
{question: <<CODE,
In the code below, which describes what is actually happening?
```ruby
a = "some string"
b = a
```
CODE
  options: {
    a: "a and b are local variables pointing to the same string",
    b: "a is a local variable, b is an alias, pointing to a different string",
    c: 'a and b are local variables, each pointing to their own instance of `"some string"`',
    d: 'a is pointing to `"some string"`, and b is pointing to a',
  },
  answer: :a,
  hint: 'What can variables point at? When you reference a variable, what does it evaluate to?',
  further_thought: '',
},
{question: 'What is `abc`?',
  options: {
    a: "a string",
    b: "a symbol",
    c: 'an instance variable',
    d: 'a local variable',
  },
  answer: :d,
  hint: 'Does it have any adorning marks?',
  further_thought: 'It could also be a method (hence "Undefined local variable or method" errors)',
},
{ question: 'What is `Abc`?',
  options: {
   a: 'a local variable',
   b: 'a constant',
   c: 'an instance variable',
   d: 'a global variable',
 },
 answer: :b,
 hint:'',
 further_thought:''
},
{ question: 'What is `@abc`?',
  options: {
   a: 'a local variable',
   b: 'a constant',
   c: 'an instance variable',
   d: 'a global variable',
 },
 answer: :c,
 hint:'',
 further_thought:''
},
{ question: 'What is `$abc`?',
  options: {
   a: 'a local variable',
   b: 'a constant',
   c: 'an instance variable',
   d: 'a global variable',
 },
 answer: :d,
 hint:'',
 further_thought:''
},
]

html_questions = questions.map { |question|
  q               = question.fetch :question # 'what is...'
  options         = question.fetch :options  # {a: 'abc', b: 'def'}
  answer          = question.fetch :answer   # :a
  hint            = question.fetch :hint     # 'think about such and such'
  further_thought = question.fetch :further_thought # 'lots of further thought, with newlines and such'
  further_thought.gsub! /^\s*/, ''
  hint.gsub!            /^\s*/, ''

  html = ""
  html << %'<div class="question">\n'
    html << "<h3>#{q}</h3>\n"
    html << "\n"

    html << "<div class='body'>\n"
      html << "<div class='options'>\n"
        options.each { |marker, text| html << "<div class='option'><div class='name'>#{marker}</div>\n<div class='value'>\n#{to_html text}\n</div></div>\n" }
      html << "</div>\n"

      html << %'<div class="hint">\n#{to_html hint}\n</div>\n' unless hint.empty?
      html << "\n"

      html << %'<div class="answer">\n<b>#{answer}</b>\n</div>\n'
      html << "\n"

      html << %'<div class="further-thought">\n#{to_html further_thought}\n</div>\n' unless further_thought.empty?
    html << "</div>\n"
  html << "</div>\n"
  html
}

html_intro = %'<div class="intro">\n#{to_html(<<MARKDOWN)}</div>'
# Quiz!

## Explanation

Go through the questions below. The purpose is not to test you, it's to allow you to test yourself.
Your goal isn't to get the answers right, it's to assimilate the knowledge in the questions. That's
why we made them, to give you another opportunity to address and think about things that we've seen
can be unclear for some students.

This is self-scored, it is for you to help push yourself along and address gaps in your knowledge.
It doesn't matter how many you get correct, it matters that you come to learn this information.

## How to take the quiz
* Look at the question, answer it in your head.
* If you need help, click the "hint" option.
* If you don't know the answer, go ahead and look at it, and then read through the further thought to help you understand
  why that is the answer. Come back in a day or two and try to go through the questions again. Your goal
  is to come to understand the answers and the reasoning behind them.
* If you do know the answer, say it to yourself in your head, then look and see that you were correct.
  Go ahead and read the "further thought" to see some of the context and nuance behind the answers that we were
  thinking about as we wrote them.
MARKDOWN

require 'sass'
stylesheet = Sass::Engine.new(<<STYLESHEET, syntax: :sass).render
.container
  padding:   3em
  position:  relative
  font-size: 1.25em

.question
  position:         relative
  background-color: #eee
  margin:           0em
  padding:          0em
  margin-bottom:    2em

  h3
    box-sizing:       border-box
    position:         relative
    padding:          0.5em
    margin:           0em
    width:            100%
    background-color: #858
    font-size:        1.5em
    font-family:      sans-serif
    color:            #fff

  .body
    padding:    1em
    border:     5px solid #858
    border-top: 0px

  .options
    .option
      margin-bottom:  0.5em
    .name
      display:        inline-block
      vertical-align: top
      font-weight:    bold
      margin-right:   0.5em
    .value
      display:        inline-block
      vertical-align: top
    p
      border: 0em
      margin: 0em

  .answer
    padding:          0.5em
    margin-bottom:    0.5em
    background-color: #afa
    font-family:      sans-serif
    font-weight:      bold
    color:            #383

  .hint
    padding:          0.5em
    margin-bottom:    0.5em
    background-color: #fc8
    font-family:      sans-serif
    font-weight:      bold
    color:            #a50

  .further-thought
    padding:          0.5em
    background-color: #aaf
    font-family:      sans-serif
    font-weight:      bold
    color:            #338
STYLESHEET

# based on http://pygments.org/_static/pygments.css
# I can't find the real docs for the styles
# http://pygments.org/docs/styles/ seems to assume you're styling in Python rather than CSS
# For my own stylesheet based on TextMate's EspressoLibre and ported to CodeRay, see /Users/josh/code/joshcheek/app/views/sass/coderay.sass
code_highlighting_stylesheet = Sass::Engine.new(<<STYLESHEET, syntax: :sass).render
pre
  background-color: #ccd
  margin:           0px
  padding:          0.75em
  .hll
    background-color: #ffffcc
  // Error
  .err
    border: 1px solid #FF0000
  .c
    color: #60a0b0
    font-style: italic  /* Comment */
  .k
    color: #007020
    font-weight: bold  /* Keyword */
  .o
    color: #666666  /* Operator */
  .cm
    color: #60a0b0
    font-style: italic  /* Comment.Multiline */
  .cp
    color: #007020  /* Comment.Preproc */
  .c1
    color: #60a0b0
    font-style: italic  /* Comment.Single */
  .cs
    color: #60a0b0
    background-color: #fff0f0  /* Comment.Special */
  .gd
    color: #A00000  /* Generic.Deleted */
  .ge
    font-style: italic  /* Generic.Emph */
  .gr
    color: #FF0000  /* Generic.Error */
  .gh
    color: #000080
    font-weight: bold  /* Generic.Heading */
  .gi
    color: #00A000  /* Generic.Inserted */
  .go
    color: #888888  /* Generic.Output */
  .gp
    color: #c65d09
    font-weight: bold  /* Generic.Prompt */
  .gs
    font-weight: bold  /* Generic.Strong */
  .gu
    color: #800080
    font-weight: bold  /* Generic.Subheading */
  .gt
    color: #0044DD  /* Generic.Traceback */
  .kc
    color: #007020
    font-weight: bold  /* Keyword.Constant */
  .kd
    color: #007020
    font-weight: bold  /* Keyword.Declaration */
  .kn
    color: #007020
    font-weight: bold  /* Keyword.Namespace */
  .kp
    color: #007020  /* Keyword.Pseudo */
  .kr
    color: #007020
    font-weight: bold  /* Keyword.Reserved */
  .kt
    color: #902000  /* Keyword.Type */
  .m
    color: #40a070  /* Literal.Number */
  .s
    color: #4070a0  /* Literal.String */
  .na
    color: #4070a0  /* Name.Attribute */
  .nb
    color: #007020  /* Name.Builtin */
  .nc
    color: #0e84b5
    font-weight: bold  /* Name.Class */
  .no
    color: #60add5  /* Name.Constant */
  .nd
    color: #555555
    font-weight: bold  /* Name.Decorator */
  .ni
    color: #d55537
    font-weight: bold  /* Name.Entity */
  .ne
    color: #007020  /* Name.Exception */
  .nf
    color: #06287e  /* Name.Function */
  .nl
    color: #002070
    font-weight: bold  /* Name.Label */
  .nn
    color: #0e84b5
    font-weight: bold  /* Name.Namespace */
  .nt
    color: #062873
    font-weight: bold  /* Name.Tag */
  .nv
    color: #bb60d5  /* Name.Variable */
  .ow
    color: #007020
    font-weight: bold  /* Operator.Word */
  .w
    color: #bbbbbb  /* Text.Whitespace */
  .mb
    color: #40a070  /* Literal.Number.Bin */
  .mf
    color: #40a070  /* Literal.Number.Float */
  .mh
    color: #40a070  /* Literal.Number.Hex */
  .mi
    color: #40a070  /* Literal.Number.Integer */
  .mo
    color: #40a070  /* Literal.Number.Oct */
  .sb
    color: #4070a0  /* Literal.String.Backtick */
  .sc
    color: #4070a0  /* Literal.String.Char */
  .sd
    color: #4070a0
    font-style: italic  /* Literal.String.Doc */
  .s2
    color: #4070a0  /* Literal.String.Double */
  .se
    color: #4070a0
    font-weight: bold  /* Literal.String.Escape */
  .sh
    color: #4070a0  /* Literal.String.Heredoc */
  .si
    color: #70a0d0
    font-style: italic  /* Literal.String.Interpol */
  .sx
    color: #c65d09  /* Literal.String.Other */
  .sr
    color: #235388  /* Literal.String.Regex */
  .s1
    color: #4070a0  /* Literal.String.Single */
  .ss
    color: #517918  /* Literal.String.Symbol */
  .bp
    color: #007020  /* Name.Builtin.Pseudo */
  .vc
    color: #bb60d5  /* Name.Variable.Class */
  .vg
    color: #bb60d5  /* Name.Variable.Global */
  .vi
    color: #bb60d5  /* Name.Variable.Instance */
  .il
    color: #40a070  /* Literal.Number.Integer.Long */
STYLESHEET

html = <<HTML
<!doctype html>
<html itemscope="" itemtype="http://schema.org/WebPage" lang="en">
  <head>
    <title>Google</title>
    <style type="text/css">
      #{stylesheet}
    </style>
    <style type="text/css">
      #{code_highlighting_stylesheet}
    </style>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  </head>
  <body>
    <div class="container">
      #{to_html html_intro}
      #{html_questions.join("\n")}
    </div>

    <script>
      var Hidable = function(placeholderText, domElement) {
        this.placeholderText = placeholderText
        this.actualText      = domElement.text()
        this.domElement      = domElement
        this.hidden          = false
      }
      Hidable.prototype.toggle = function() {
        if(this.hidden) this.show()
        else            this.hide()
        return this
      }
      Hidable.prototype.hide = function() {
        this.domElement.text(this.placeholderText)
        this.hidden = true
        return this
      }
      Hidable.prototype.show = function() {
        this.domElement.text(this.actualText)
        this.hidden = false
        return this
      }

      jQuery(function() {
        var hideByClass = function(className, placeholderText) {
          jQuery(className).each(function(index, rawDomElement) {
            var domElement = jQuery(rawDomElement)
            var hidable    = new Hidable(placeholderText, domElement).toggle()
            domElement.click(function() { hidable.toggle() })
          })
        }
        hideByClass('.answer',          'See Answer')
        hideByClass('.hint',            'Hint')
        hideByClass('.further-thought', 'Going Deeper')
      })
    </script>
  </body>
</html>
HTML
run lambda { |env|
  [200, {'Content-Type' => 'text/html'}, [html]]
}


# class Wizard
# end
#
# wizard = Wizard.new 'Sarah', false
#
# What's wrong with this code? (local var examples)
#
# Class#instance_method
# Class.method
#
# What exception will be raised?
# What does this exception mean?
# What information is relevant in this exception?
#
# -----
#
# For later:
#
# { version: 1,
#   question: "How do you find the list of an object's instance variables?",
#   metadata: {},
#   options: [
#     "`object.instance_variables`"
#   ],
#   hint: '',
#   further_thought: ''
# },
