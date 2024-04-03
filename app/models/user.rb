class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :password, :password_confirmation, presence: true
  #validates :password_confirmation, presence: true, if: :password_changed?

  private

  def password_changed?
    password.present? || password_confirmation.present?
  end
end
