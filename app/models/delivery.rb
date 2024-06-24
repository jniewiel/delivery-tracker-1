# == Schema Information
#
# Table name: deliveries
#
#  id                    :integer          not null, primary key
#  description           :string
#  details               :text
#  status                :string
#  supposed_to_arrive_on :date
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :integer
#
class Delivery < ApplicationRecord
  belongs_to :user

  validates :description, presence: true
  validates :supposed_to_arrive_on, presence: true
  validates :details, presence: true
end
