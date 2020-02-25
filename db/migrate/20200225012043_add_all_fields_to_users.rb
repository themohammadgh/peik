class AddAllFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string, limit: 25
    add_column :users, :last_name, :string, limit: 50
    add_column :users, :username, :string, limit: 50
    add_column :users, :phone, :string, limit: 20
    add_column :users, :bio, :text
    add_column :users, :is_traveler, :boolean, default: false
    add_column :users, :is_phone_verified, :boolean, default: false
    add_column :users, :is_email_verified, :boolean, default: false
    add_column :users, :sender_rating, :integer
    add_column :users, :traveler_rating, :integer
    add_column :users, :DOB, :date
    add_column :users, :mailing_address, :string
    add_column :users, :resident_address, :string
    add_column :users, :is_mailing_resident_same, :boolean, default: false
    add_column :users, :ID_number, :string, limit: 25
    add_column :users, :stripe_id, :string
    add_column :users, :stripe_payment_id, :string
    add_column :users, :card_brand, :string
    add_column :users, :card_last_four, :integer
    add_column :users, :card_exp_month, :integer
    add_column :users, :card_exp_year, :integer

    add_index :users, [:username, :phone, :ID_number], unique: true
  end
end

#! Social
#! payment/earn info
