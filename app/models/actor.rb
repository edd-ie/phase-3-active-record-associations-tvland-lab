class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    #  an actor has many characters, so write code that creates
    #   an instance method that will return all the characters
    #    that the actor has played. Hint: is there an association
    #     macro you can use to create this method?

    def characters
        Character.all.where(actor_id: self.id)
    end

    def shows
        self.characters.each{ |x|
            return Show.all.where(id: x[:show_id])
        }
    end

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        roles = []
        self.characters.each{ |x|
            Show.all.where(id: x[:show_id]).each{ |role|
                roles << "#{x[:name]} - #{role[:name]}"
            }
        }
        return roles
    end
end

