require 'spec_helper'

describe Astronomy::Information do
  subject { Astronomy::Information.new }
  describe 'yaml attributes' do
    it 'contains at least one category' do
      expect(subject.categories.count).to be > 0
    end

    it 'has at least one topic per category' do
      categories = subject.categories
      categories.each do |category|
        topics = subject.topics(category)
        expect(topics.size).to be > 0
      end
    end

    it 'has non-nil attributes for each topic for all categories' do
      categories = subject.categories
      categories.each do |category|
        topics = subject.topics(category)
        topics.each do |topic|
          expect(topic['name']).to_not be_nil
          expect(topic['description']).to_not be_nil
          expect(topic['images']).to_not be_nil
          expect(topic['detailed_info']).to_not be_nil
        end
      end
    end

    it 'has at least one image per topic' do
      categories = subject.categories
      categories.each do |category|
        topics = subject.topics(category)
        topics.each do |topic|
          expect(topic['images'].size).to be > 0
        end
      end
    end
  end
end