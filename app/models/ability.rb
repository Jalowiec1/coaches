class Ability < ActiveRecord::Base
    validates :value, presence: true
    validates :name, presence: true
end
