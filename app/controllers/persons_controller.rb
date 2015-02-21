class PersonsController < ApplicationController
  def index
    return @persons = lookup_resources(
      resources_by_name(params[:search])
      ) if params[:search].present?
    @persons = lookup_resources(Person.all.resources)
  end

  def show
    @person = Person.find(params[:person])
  end

  private

  def lookup_resources(resources)
    resources.collect { |resource| Person.find(resource.uri) }
  end

  def resources_by_name(name)
    Person.where("?uri <http://example.com/name> '#{name}' ").resources
  end
end
