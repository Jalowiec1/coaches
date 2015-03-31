class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
    has_secure_password
    validates :password, length: { minimum: 6 }
    has_many :coachings_as_student, foreign_key: :student_id, class_name: 'Coaching'
    has_many :coaches, through: :coachings_as_student
    has_many :coachings_as_coach, foreign_key: :coach_id, class_name: 'Coaching'
    has_many :students, through: :coachings_as_coach
    has_many :abilities
    acts_as_messageable
    def mailboxer_email(object)
        email
    end
end