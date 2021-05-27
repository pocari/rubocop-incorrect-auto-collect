module Hoge
  class Foo # rubocop:disable Metrics/ClassLength
    private def hoge
      p :hoge
    end

    def foo
      p :piyo
    end
  end
end

Hoge::Foo.new.foo
