class User < ApplicationRecord
  has_many :comments
  has_one :profile, dependent: :destroy
  has_many :articles
  has_many :likes
  has_many :l_articles, through: :likes, source: :article
  #, presence: tru Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
         
  def self.find_for_oauth(auth, signed_in_resource = nil)
    # user와 identity가 nil이 아니라면 받는다
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    
    # user가 nil이라면 새로 만든다.
    if user.nil?
      # 이미 있는 이메일인지 확인한다.
      email = auth.info.email
      user = User.where(:email => email).first  
      unless self.where(email: auth.info.email).exists?
        # 없다면 새로운 데이터를 생성한다.
        if user.nil?
          user = User.new(
            name: auth.info.name,
            email: email ? auth.info.email : "#{auth.uid}@#{auth.provider}.com",
            password: Devise.friendly_token[0,20]
          )            
          user.save!
        end
      end
    end
    
    if identity.user != user
      identity.user = user
      identity.uid = (0...8).map { (65 + rand(26)).chr }.join
      identity.save!
    end
    user
    
  end
  
  def email_required?
    false
  end
 
  def email_changed?
    false
  end
  
  # facebook
  def self.find_for_facebook_oauth(auth)
      user = where(auth.slice(:provider, :uid)).first_or_create do |u|
        u.provider = auth.provider
        u.uid = auth.uid
        u.email = auth.info.email
        u.password = Devise.friendly_token[0,20]
        u.name = auth.info.name   # assuming the user model has a name
        u.image = auth.info.image # assuming the user model has an image
      end

    # 이 때는 이상하게도 after_create 콜백이 호출되지 않아서 아래와 같은 조치를 했다.
    user.add_role :user if user.roles.empty?
    user   # 최종 반환값은 user 객체이어야 한다.
  end

    def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
end
