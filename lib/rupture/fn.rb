require 'continuation'
require 'set'

module Rupture
  module Fn
    def complement
      lambda do |*args|
        not call(*args)
      end
    end
    alias -@ complement

    def comp(fn)
      lambda do |*args|
        call(fn[*args])
      end
    end
    alias * comp

    def partial(*partials)
      lambda do |*args, &block|
        call(*(partials + args), &block)
      end
    end

    def rpartial(*partials)
      lambda do |*args, &block|
        call(*(args + partials), &block)
      end
    end

    def <<(partials)
      partial(*partials)
    end

    def >>(partials)
      rpartial(*partials)
    end

    def block(&block)
      lambda do |*args|
        call(*args, &block)
      end
    end

    # def apply(*args)
    #   last = args.pop
    #   call(*F.concat(args, last))
    # end

    def fnil(*defaults)
      lambda do |*args|
        call(*F.map(args, defaults) {|a,d| a.nil? ? d : a})
      end
    end

    def to_proc
      lambda do |key|
        call(key)
      end
    end

    def arity
      -1
    end
  end
end

class Proc
  include Rupture::Fn
end

class Method
  include Rupture::Fn
end

class Symbol
  include Rupture::Fn

  def call(object, *args, &block)
    object.method(self).call(*args, &block)
  end
  alias [] call

  def arity
    -2
  end
end

class Hash
  include Rupture::Fn
  alias call []
end

class Array
  include Rupture::Fn
  alias call []
end

class Set
  include Rupture::Fn

  def [](key)
    key if include?(key)
  end
  alias call []
end

class Module
  def [](method_name, *partials)
    lambda do |*args|
      self.send(method_name, *(partials + args))
    end
  end
end
