class User < ApplicationRecord
        #para gravar emails de maneira formatada
        before_save { self.email = email.downcase }

        #validação de nome
        validates :name, presence: true, length: { maximum: 50 }
        #validação de email
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        validates :email, presence: true, length: { maximum: 255 },
                          format: { with: VALID_EMAIL_REGEX },
                          uniqueness: true
#
#validates :name, presence: true, length: { maximum: 50 }
#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#validates :email, presence: true, length: { maximum: 255 },
#                  format: { with: VALID_EMAIL_REGEX },
#                  uniqueness: true
##para senhas (exige coluna adicional na tabela de usuários)
has_secure_password #(pega a senha e cria um hash de senha; metodo authenticate, atributos virtuais de senha e confirmação de senha; requer coluna adicional password_digest em Users)
validates :password, presence: true, length: { minimum: 6 }

end
