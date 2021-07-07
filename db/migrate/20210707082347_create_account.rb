class CreateAccount < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string      "name",       null: false
      t.boolean     "is_deleted"
      t.string      "clean_status"
      t.string      "owner_id"
    end
  end
end
