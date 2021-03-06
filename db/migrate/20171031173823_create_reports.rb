class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.references :user, foreign_key: true
      t.text :reason
      t.references :reportable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
