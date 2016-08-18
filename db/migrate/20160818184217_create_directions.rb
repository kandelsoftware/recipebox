class CreateDirections < ActiveRecord::Migration[5.0]
  def change
    create_table :directions do |t|
      t.text :step
      t.belongs_to :recipe

      t.timestamps
    end
  end
end
