class DirectorsController < ApplicationController
def index
  @list_of_directors  = Director.all

  render({:template => "directors_template/index.html.erb"})
end

end
