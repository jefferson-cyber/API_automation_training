class User
  attr_accessor :first_name, :last_name, :movies, :address, :email, :password, :credentials

  def initialize
    @first_name = 'Test'
    @last_name = 'Tester'
    @address= [UserAddress.new]
  end
end