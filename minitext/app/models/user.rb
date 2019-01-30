class User < ApplicationRecord
        #para gravar emails de maneira formatada
        before_save { self.email = email.downcase }

        has_many :microposts, dependent: :destroy #apaga micropost caso usuário seja deletado

        #validação de nome
        validates :name, presence: true, length: { maximum: 50 }
        #validação de email
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        validates :email, presence: true, length: { maximum: 255 },
                          format: { with: VALID_EMAIL_REGEX },
                          uniqueness: true

        #has_many :active_relationships, class_name:  "Relationship",
        #foreign_key: "follower_id",
        #dependent:   :destroy
#
        #has_many :following, through: :active_relationships, source: :followed
        #has_many :passive_relationships, class_name:  "Relationship",
        #                                   foreign_key: "followed_id",
        #                                   dependent:   :destroy
        #has_many :following, through: :active_relationships,  source: :followed
        #has_many :followers, through: :passive_relationships, source: :follower

        #
       
        ##para senhas (exige coluna adicional na tabela de usuários)
        has_secure_password #(pega a senha e cria um hash de senha; metodo authenticate, atributos virtuais de senha e confirmação de senha; requer coluna adicional password_digest em Users)
        validates :password, presence: true, length: { minimum: 6 }



      def feed
        Micropost.where("user_id = ?", id)
      end
    
      # Follows a user.
      def follow(other_user)
        active_relationships.create(followed_id: other_user.id)
      end
    
      # Unfollows a user.
      def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
      end
    
      # Returns true if the current user is following the other user.
      def following?(other_user)
        following.include?(other_user)
      end
end
