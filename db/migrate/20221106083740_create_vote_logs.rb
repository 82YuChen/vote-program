class CreateVoteLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :vote_logs do |t|
      t.references :candidate, foreign_key: true
      t.string :ip_address

      t.timestamps
    end
  end
end
