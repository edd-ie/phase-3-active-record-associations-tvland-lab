class Character < ActiveRecord::Base
    belongs_to :shows
    belongs_to :actors

    def actor
        Actor.find(self[:actor_id])
    end
    def self.build_show(x)
        show = Show.new(x)
        show.save
    end
    
    def build_show(y)
        show = Show.new(y)
        show.save
    end
    
    def show
        x = Show.find(self[:show_id])
    end

    #say_that_thing_you_say: Define a method in the Character class,
    def say_that_thing_you_say
        "#{self[:name]} always says: #{self[:catchphrase]}"
    end
end