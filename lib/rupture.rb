module Rupture; end

require 'rupture/core_ext'
require 'rupture/rails_ext'
require 'rupture/utils'
require 'rupture/function'
require 'rupture/fn'
require 'rupture/lookup'
require 'rupture/symbol'
require 'rupture/meta'
require 'rupture/sequence'
require 'rupture/seq'
require 'rupture/lazy_seq'
require 'rupture/cons'
require 'rupture/array_seq'
require 'rupture/list'

F = Rupture::Function

Object.send(:include, Rupture::Meta)
