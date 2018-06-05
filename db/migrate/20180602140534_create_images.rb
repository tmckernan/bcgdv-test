class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images  do |t|
       # t.primary_key :id, :binary, limit: 16, null: false
       t.string :file
       t.string :file_tmp
       t.string :content_type
       t.timestamps
    end
  end
end

