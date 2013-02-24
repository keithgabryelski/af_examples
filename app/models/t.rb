class T < ::Af::Application
  opt :word, "the word to print", :default => :foo, :choices => [:foo, :bar, :baz, :beltch]
  opt :words, "the words to print", :default => [:foo], :choices => [:foo, :bar, :baz, :beltch]
  opt :numbers, "the number lists", :default => [1,2,3]

  def logger
    super('Process::T')
  end

  def work
    logger.info "WORK STARTED: #{@word}"
    logger.info @words.inspect
    logger.info "NUMBERS: #{@numbers.inspect}"
    x = ::Foo.find(1)
    logger.info x.inspect

    Foo.lock_record(1) do
      logger.info "in lock block: #{@word}"
    end

    logger.info "WORK COMPLETED: #{@word}"
  end
end

