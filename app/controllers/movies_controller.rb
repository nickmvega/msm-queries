class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render({ :template => "movies_template/index" })
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Movie.where({ :id => the_id })

    @the_movie = matching_records.at(0)

    render({ :template => "movies_template/details" })
  end
end
