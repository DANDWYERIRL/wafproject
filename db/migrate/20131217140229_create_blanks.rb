class CreateBlanks < ActiveRecord::Migration
  def change
    create_table :blanks do |t|
      t.string :notneeded

      t.timestamps
    end
  end
end
