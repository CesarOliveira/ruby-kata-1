Author = Struct.new(:email, :first_mame, :last_name)

class Author
  def print
    puts ["Email: #{email}","First Name: #{first_mame}", "Last Name: #{last_name}"]
  end
end