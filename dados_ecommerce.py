from faker import Faker
fake = Faker('pt_BR')

with open('clientes_insercao.sql', 'w', encoding='utf-8') as arquivo:
    for i in range(50):
        nome = fake.name().replace("'", "''")
        sexo = fake.random_element(elements=('M', 'F'))
        telefone = fake.phone_number()
        cpf = fake.cpf()
        email = fake.email()
        endereco = fake.address().replace('\n', ', ').replace("'", "''")

        arquivo.write(f"INSERT INTO clientes (nome, sexo, telephone, CPF, email, endereco) VALUES ('{nome}', '{sexo}', '{telefone}', '{cpf}', '{email}', '{endereco}');\n")
