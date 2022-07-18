require 'elasticsearch/model'

# Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['ELASTICSEARCH_URL'] || "http://localhost:9200
client = Elasticsearch::Client.new host: ENV['ELASTICSEARCH_URL'] || "http://localhost:9200"

pp client.cluster.health
# client = Mongo::Client.new(['127.0.0.1:27017'], :database => 'test')