class User < ActiveRecord::Base
  has_many :rounds
  
  validates :email, :uniqueness => true
  validates :name, :email, :password, :presence => true

  validate :valid_email
  validate :min_password_length

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def valid_email
    unless email =~ /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
      errors.add(:email, "Invalid email")
    end
  end

  def min_password_length
    unless password.length > 6
      errors.add(:password, "Password too short, must be at least six characters")
    end
  end

  def round_score(round)
    trues = round.guesses.where("attempt = ?", true).count
    total_guesses = round.guesses.count
    score = (trues.to_f / total_guesses) * 100
  end

end
