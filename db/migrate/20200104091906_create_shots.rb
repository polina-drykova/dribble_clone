class CreateShots < ActiveRecord::Migration[5.2]
  def change
    create_table :shots do |t|
      t.string :title
      t.text :description
      t.string :user_shot
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
