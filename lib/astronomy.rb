require 'astronomy/version'
require 'yaml'

module Astronomy
  class Information
    DATA_FILE = File.join(File.dirname(__dir__), 'assets', 'astronomy.yml')

    attr_reader :data

    def initialize
      @data = YAML.load_file(DATA_FILE)
    end

    def categories
      @data.keys
    end

    def topics(category)
      @data[category]
    end

    def search(topic)
      query = topic.downcase
      results = []

      @data.each do |category, array_of_topics|
        array_of_topics.each do |topic|
          results << topic and next if topic['name'].downcase.include?(query)
          results << topic if topic['description'].downcase.include?(query)
        end
      end

      results
    end
  end
end
