class DirectorsController < ApplicationController
def index
  @list_of_directors  = Director.all

  render({:template => "directors_template/index.html.erb"})
end

def eldest

  @eldest_hash = Director.where.not({:dob => nil}).order({:dob => :asc}).at(0)
  @id = @eldest_hash.id
  @name = @eldest_hash.name
  @dob_month = @eldest_hash.dob.strftime("%B")
  @dob_day = @eldest_hash.dob.strftime("%e")
  @dob_year = @eldest_hash.dob.strftime("%Y")

  render({:template => "directors_template/eldest.html.erb"})  
end

def youngest

  @youngest_hash = Director.where.not({:dob => nil}).order({:dob => :desc}).at(0)
  @id = @youngest_hash.id
  @name = @youngest_hash.name
  @dob_month = @youngest_hash.dob.strftime("%B")
  @dob_day = @youngest_hash.dob.strftime("%e")
  @dob_year = @youngest_hash.dob.strftime("%Y")

  render({:template => "directors_template/youngest.html.erb"})  
end
end
