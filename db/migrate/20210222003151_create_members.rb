class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string     :name,             null: false
      t.string     :website_url,      null: false
      t.string     :website_short_url
      t.references :user,            foreign_key: true

      t.timestamps
    end

    add_index :members, [:name, :website_url], unique: true
  end
end
