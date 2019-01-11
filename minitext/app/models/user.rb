class User < ApplicationRecord
        #para gravar emails de maneira formatada
        before_save { self.email = email.downcase }

        #validação de nome
        validates :name, presence: true, length: { maximum: 50 }
        #validação de email
        VALID_EMAIL_REGEX = /A\[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        validates :email, presence: true, length: { maximum: 255 },
                          format: { with: VALID_EMAIL_REGEX },
                          uniqueness: true
        #para senhas (exige coluna adicional na tabela de usuários)
        has_secure_password

end
