Author = Struct.new(:email, :first_name, :last_name)

class Author
  def print
    puts ["Email: #{email}","First Name: #{first_name}", "Last Name: #{last_name}"]
  end
end