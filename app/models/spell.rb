class Spell < ApplicationRecord
    validates :name, presence: true, length: { minimum: 4, maximum: 100 }
    validates :description, presence: false
end
