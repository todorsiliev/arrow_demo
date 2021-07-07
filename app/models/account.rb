class Account < ActiveRecord::Base

    validates :sf_id, presence: true
    validates :name, presence: true

    def self.find_by_sf_id(sf_id)
        where(sf_id: sf_id).first
    end

    def update(attributes)
        update_attributes(attributes)
    end
end