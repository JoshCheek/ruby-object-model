# ===== CREATE OUR OWN NEW =====
#
# SomeClass.new <-- what does it do?
#
# It's not special, it's just a method like any other method.
# We look it up like we look up any other method
# We invoke it on an object like we invoke any other method.
# It just does something particularly useful: instantiate classes
#
# Here's what it does:
#
# 1. allocates the memory for the instance
# 2. sets up the class pointer an instance variable pointers
#    (https://github.com/ruby/ruby/blob/65a5162550f58047974793cdc8067a970b2435c0/ruby.h#L218-233)
# 3. initializes the instance (delegates to our initialize method) <-- Why? What's the point?
# 4. returns us the instance
#
# Lets make our own!

