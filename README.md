# setup

```
bundle install
```

# Reproduction Procedure
```
% cat main.rb
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

% bundle exec rubocop -A
Inspecting 2 files
.W

Offenses:

main.rb:2:1: C: [Corrected] Layout/IndentationWidth: Use 2 (not 4) spaces for indentation.
    def foo
^^^^
main.rb:6:1: C: [Corrected] Layout/IndentationWidth: Use 2 (not 4) spaces for indentation.
    class Foo # rubocop:disable Metrics/ClassLength
^^^^
main.rb:6:3: C: [Corrected] Layout/IndentationConsistency: Inconsistent indentation detected.
  class Foo # rubocop:disable Metrics/ClassLength ...
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
main.rb:6:5: C: [Corrected] Layout/IndentationConsistency: Inconsistent indentation detected.
    class Foo # rubocop:disable Metrics/ClassLength ...
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
main.rb:6:13: W: [Corrected] Lint/RedundantCopDisableDirective: Unnecessary disabling of Metrics/ClassLength.
  class Foo # rubocop:disable Metrics/ClassLength
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
main.rb:7:5: C: [Corrected] Layout/ClassStructure: public_methods is supposed to appear before private_methods.
    def foo ...
    ^^^^^^^

2 files inspected, 6 offenses detected, 6 offenses corrected
```

Running after auto-collect, the main.rb has been converted to the wrong format as follows:

```
% cat main.rb
module Hoge
  def foo
    p :piyo
  end

  class Foo
    private def hoge
      p :hoge
    end
  end
end

Hoge::Foo.new.foo
```

The problem does not occur in Rubocop versions up to 1.8.1, but in 1.9.0 and later versions.
