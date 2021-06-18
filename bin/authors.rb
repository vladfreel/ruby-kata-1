class Author
  attr_accessor :email, :firstname, :lastname
  def initialize(email, firstname, lastname)
    @email = email
    @firstname = firstname
    @lastname = lastname
  end
end