class User < ActiveRecord::Base
  has_secure_password

  has_and_belongs_to_many :projects
  has_many :requested_tasks, foreign_key: :requester_id
  has_many :assigned_tasks, foreign_key: :assignee_id
  belongs_to :recent_project, class_name: "Project"

  before_save { email.downcase! }
  before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6, if: :validate_password? },
                       confirmation: { if: :validate_password? }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def validate_password?
      password.present? || password_confirmation.present?
    end

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
