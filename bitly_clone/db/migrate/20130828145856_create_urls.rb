class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :name
      t.integer :click_count, default: 0
      t.string :extension
    end
  end
end
