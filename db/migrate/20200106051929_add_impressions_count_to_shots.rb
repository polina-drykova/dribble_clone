class AddImpressionsCountToShots < ActiveRecord::Migration[5.2]
  def change
    add_column :shots, :impressions_count, :integer
  end
end
