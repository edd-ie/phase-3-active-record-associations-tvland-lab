class Show < ActiveRecord::Base
    belongs_to :networks
    has_many :characters
    has_many :actors, through: :characters

    def network
        puts self
        Network.find(self.network_id)
    end
    
    def actors_list
        x = Character.where(show_id: self.id).each{|c| 
            y = Actor.find(c.actor_id)
            return "#{y[:first_name]} #{y[:last_name]}"
        }
        return x
    end
end