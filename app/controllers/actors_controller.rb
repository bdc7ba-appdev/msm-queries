class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all

    render({:template => "actors_templates/index.html.erb"})
  end

  def biography
    @id = params.fetch("actors_id")
    @actor_hash = Actor.where({:id =>@id}).at(0)
    @name = @actor_hash.name
    @dob = @actor_hash.dob
    @bio = @actor_hash.bio
    @image = @actor_hash.image
    @created = @actor_hash.created_at.to_s
    @created_date = Date.parse(@created)
    @created_diff = ((Date.today - @created_date)/365).to_i

    @updated = @actor_hash.updated_at.to_s
    @updated_date = Date.parse(@updated)
    @updated_diff = ((Date.today - @updated_date)/365).to_i

    @list_of_characters = Character.where(:actor_id => @id)
    render({:template => "actors_templates/bios.html.erb"})
  end 

end
