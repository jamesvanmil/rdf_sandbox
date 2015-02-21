class Person
  include Tripod::Resource

  # these are the default rdf-type and graph for resources of this class
  rdf_type 'http://example.com/person'
  graph_uri 'http://example.com/people'

  field :name, 'http://example.com/name'
  field :knows, 'http://example.com/knows', :multivalued => true, :is_uri => true
  field :aliases, 'http://example.com/alias', :multivalued => true
  field :age, 'http://example.com/age', :datatype => RDF::XSD.integer
  field :important_dates, 'http://example.com/importantdates', :datatype => RDF::XSD.date, :multivalued => true
end
