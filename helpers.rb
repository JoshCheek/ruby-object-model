def number_of_objects_in_existence
  ObjectSpace.each_object(BasicObject){}
end

def dont_clean_up_after_me!
  GC.disable
end

def omg_nevermind_please_cleanup_after_me!
  GC.enable
  ObjectSpace.garbage_collect
end

def let_me_make_a_mess!
  dont_clean_up_after_me!
  yield
ensure
  omg_nevermind_please_cleanup_after_me!
end

class Fixnum
  def inspect
    to_s.reverse.gsub(/(...)(?=.)/, '\1_').reverse
  end
end
