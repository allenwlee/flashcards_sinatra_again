class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.boolean :attempt, :default => false
      t.references :card
      t.references :round
      t.timestamps
    end
  end
end
