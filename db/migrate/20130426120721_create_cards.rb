class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :question
      t.text :answer
      t.references :deck
      t.timestamps
    end
  end
end
