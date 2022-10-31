class MoviesController < ApplicationController
  def index
    @list_of_movies = Movie.all
    
    # @director_id = Movies.director_id
    # @director_name = Director.where(:id => @director_id).name.at(0)

    render({:template => "movies_template/index.html.erb"})
  end

  def details
    @id = params.fetch("movies_id")
    @movie_hash = Movie.where({:id =>@id}).at(0)
    @title = @movie_hash.title
    @year = @movie_hash.year
    @duration = @movie_hash.duration
    @description = @movie_hash.description
    @image = @movie_hash.image
    @created = @movie_hash.created_at.to_s
    @created_date = Date.parse(@created)
    @created_diff = ((Date.today - @created_date)/365).to_i

    @updated = @movie_hash.updated_at.to_s
    @updated_date = Date.parse(@updated)
    @updated_diff = ((Date.today - @updated_date)/365).to_i

    @director_id = Movie.where({:id => @id}).at(0).director_id
    @director = Director.where({:id =>@director_id}).at(0).name
    render({:template => "movies_template/info.html.erb"})
  end

end
