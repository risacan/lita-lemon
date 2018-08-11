class Handler < Lita::Handler
  def self.inherited(klass)
    super
    Lita.register_handler(klass)
  end
end
