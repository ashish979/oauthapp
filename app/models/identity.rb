class Identity < ApplicationRecord
  enum provider: [:system, :google_oauth2, :twitter]

  belongs_to :user, foreign_key: :email, primary_key: :email

  validates :email, uniqueness: { scope: :provider }

  def self.find_or_create(email, auth)
    if auth == nil
      identity = Identity.where(email: email, provider: 0).first_or_create
    else
      identity = Identity.where(email: email, provider: auth.provider).first_or_create(uid: auth.uid)
    end
    identity
  end
end