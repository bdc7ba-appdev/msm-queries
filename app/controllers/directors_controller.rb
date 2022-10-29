class DirectorsController < ApplicationController
def index
  render({:template => "directors_template/index.html.erb"})
end

end
