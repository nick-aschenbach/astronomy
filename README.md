# Astronomy

Search or browse the names, descriptions and image URLs for various categories of celestial phenomena including:

- Asterisms
- Celestial Objects
- Stars
- Planets
- Star Systems
- Galaxies
- Moons
- Comets
- Asteroids
- Constellations
- Nebulae
- Astronomical Discoveries
- Clusters
- Meteor Showers

Data source: [Freebase](http://freebase.com)

For example, here is the entry on the Big Dipper:

    {
                 "name" => "Big Dipper",
          "description" => "The Big Dipper, also known as the Plough, is an asterism of seven stars recognized as a distinct grouping in many cultures. These stars are the brightest of the formal constellation Ursa Major; six of them are second magnitude stars, while only Megrez is of third magnitude. The North Star, the current northern pole star on Earth, can be located by extending an imaginary line from Merak through Dubhe. Polaris is part of the \"Little Dipper\", Ursa Minor.",
               "images" => [
            [0] "https://usercontent.googleapis.com/freebase/v1/image/m/02dd6yz",
            [1] "https://usercontent.googleapis.com/freebase/v1/image/m/04shvsk"
        ],
        "detailed_info" => "https://www.googleapis.com/freebase/v1/topic/m/09csbt"
    }

Search over 600K of user curated data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'astronomy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install astronomy

## Usage

Get all of the data as a hash:

```ruby
info = Astronomy::Information.new
info.data
```

Get a full list of categories:

```ruby
info = Astronomy::Information.new
info.categories
```

Get a list of topics from a given category:

```ruby
info = Astronomy::Information.new
info.topics 'Comet'
```

Search both names and descriptions:

```ruby
info = Astronomy::Information.new
info.search 'moon'
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/astronomy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
