module Rupture
  module Function
    # FIXME isn't totally lazy when working with > 1 collection
    # If the first is empty, the second is still seq'd
    def map(*colls, &f)
      f ||= colls.shift
      lazy_seq do
        seqs = colls.collect(&:seq)
        if seqs.all?
          firsts = seqs.collect(&:first)
          rests  = seqs.collect(&:rest)
          cons(f[*firsts], map(*rests, &f))
        end
      end
    end

    def concat(*colls)
      lazy_seq do
        head, *tail = colls.collect(&:seq)
        if head
          cons(head.first, concat(head.rest, *tail))
        elsif tail.any?
          concat(*tail)
        end
      end
    end

    def mapcat(*colls, &f)
      f ||= colls.shift
      concat(*map(*colls, &f))
    end

    def iterate(*args, &f)
      f ||= args.shift
      x = args.first
      lazy_seq do
        cons(x, iterate(f[x], &f))
      end
    end

    def lazy_seq(f = nil, &fn)
      fn ||= f
      LazySeq.new(&fn)
    end

    def cons(head, tail)
      Cons.new(head, tail)
    end

    def list(*xs)
      List.new(*xs)
    end

    def identity(x)
      x
    end

    def juxt(*fs)
      lambda do |*args|
        fs.collect {|f| f[*args]}
      end
    end

    def decorate(*args)
      juxt(identity, *args)
    end

    extend Function
    F = Function
  end
end
