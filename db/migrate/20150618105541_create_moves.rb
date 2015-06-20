class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.belongs_to :game
      t.belongs_to :user
      t.integer :box
    end
  end
end
