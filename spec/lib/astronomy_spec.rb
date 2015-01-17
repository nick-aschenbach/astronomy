require 'spec_helper'

describe Astronomy::Information do
  subject { Astronomy::Information.new }

  it 'assigns Astronomy::Data::DATA_FILE' do
    expect(Astronomy::Information::DATA_FILE).to_not be_nil
  end

  describe '.initialize' do
    it 'loads the astronomical yaml data' do
      expect(YAML).to receive(:load_file).with(Astronomy::Information::DATA_FILE)

      subject
    end

    it 'stores this data in an instance variable' do
      data = {foo: 'bar'}
      allow(YAML).to receive(:load_file).with(Astronomy::Information::DATA_FILE).and_return(data)
      expect(subject.instance_variable_get('@data')).to eq(data)

      subject
    end
  end

  describe '#data' do
    it 'returns what is stored in the instance variable' do
      data = {bar: 'baz'}
      allow(YAML).to receive(:load_file).with(Astronomy::Information::DATA_FILE).and_return(data)


      expect(subject.data).to eq(data)
    end

    it 'does not allow re-assignment of the astronomical data' do
      allow(YAML).to receive(:load_file).with(Astronomy::Information::DATA_FILE).and_return({bar: 'baz'})

      expect { subject.data = 'foobar' }.to raise_error(NoMethodError)
    end
  end

  describe '#categories' do
    let(:data) { {'Asterism' => [], 'Galaxy' => []} }

    it 'returns a list of top level categories' do
      allow(YAML).to receive(:load_file).with(Astronomy::Information::DATA_FILE).and_return(data)

      expect(subject.categories).to match_array(['Asterism', 'Galaxy'])
    end
  end

  describe '#topics' do
    let(:data) { {'Topic A' => [1, 2, 3], 'Topic B' => %w[a b c]} }

    it 'returns the topics for a specific category' do
      allow(YAML).to receive(:load_file).with(Astronomy::Information::DATA_FILE).and_return(data)

      expect(subject.topics('Topic A')).to match_array([1, 2, 3])
    end

    it 'returns nil when a category is invalid' do
      allow(YAML).to receive(:load_file).with(Astronomy::Information::DATA_FILE).and_return(data)

      expect(subject.topics('Invalid topic')).to be_nil
    end
  end

  describe '#search' do
    let(:data) { {
      'Asterism' =>
        [{'name' => 'Apple', 'description' => 'A lovely fruit'},
         {'name' => 'Squash', 'description' => 'A great sport or fruit'},
         {'name' => 'Squish', 'description' => 'A soft wet sound'}]
    } }

    it 'returns an array of topics with names that match the query' do
      allow(YAML).to receive(:load_file).with(Astronomy::Information::DATA_FILE).and_return(data)

      expect(subject.search('sq')).to match_array([{'name' => 'Squash', 'description' => 'A great sport or fruit'},
                                                   {'name' => 'Squish', 'description' => 'A soft wet sound'}])
    end

    it 'returns an array of topics with descriptions that match the query' do
      allow(YAML).to receive(:load_file).with(Astronomy::Information::DATA_FILE).and_return(data)

      expect(subject.search('fruit')).to match_array([{'name' => 'Apple', 'description' => 'A lovely fruit'},
                                                      {'name' => 'Squash', 'description' => 'A great sport or fruit'}])
    end

    it 'returns a topic once when both the name and description match' do
      allow(YAML).to receive(:load_file).with(Astronomy::Information::DATA_FILE).and_return(data)

      expect(subject.search('A')).to match_array(data['Asterism'])
    end

    it 'returns an empty array when the query does not match anything' do
      allow(YAML).to receive(:load_file).with(Astronomy::Information::DATA_FILE).and_return(data)

      expect(subject.search('zx')).to match_array([])
    end
  end
end