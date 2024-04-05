class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, :password_confirmation, presence: true

  private

  def password_changed?
    password.present? || password_confirmation.present?
  end
end
