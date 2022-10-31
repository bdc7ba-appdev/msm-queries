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

def bio
  @id = params.fetch("director_id")
  @director_hash = Director.where({:id =>@id}).at(0)
  @name = @director_hash.name
  @dob = @director_hash.dob
  @bio = @director_hash.bio
  @image = @director_hash.image
  @created = @director_hash.created_at.to_s
  @created_date = Date.parse(@created)
  @created_diff = ((Date.today - @created_date)/365).to_i

  @updated = @director_hash.updated_at.to_s
  @updated_date = Date.parse(@updated)
  @updated_diff = ((Date.today - @updated_date)/365).to_i

  @list_of_movies = Movie.where(:director_id => @id)
  # @updated

  render({:template => "directors_template/bios.html.erb"})
end

end
