class DirectorsController < ApplicationController
  def index
    @directors = Director.all
    render({ :template => "directors_templates/index" })
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)

    render({ :template => "directors_templates/details" })
  end

  def youngest
    @the_youngest_director = Director.where.not({ :dob => nil }).order({ :dob => :desc }).first
    render({ :template => "directors_templates/youngest" })
  end

  def eldest
    @the_eldest_director = Director.where.not({ :dob => nil }).order({ :dob => :asc }).first
    render({ :template => "directors_templates/eldest" })
  end
end
