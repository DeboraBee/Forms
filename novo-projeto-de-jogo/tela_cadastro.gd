extends Control

# Referências aos nós (Caminhos baseados no seu VBoxContainer)
@onready var input_nome: LineEdit = $VBoxContainer/InputNome
@onready var input_email: LineEdit = $VBoxContainer/InputEmail
@onready var input_senha: LineEdit = $VBoxContainer/InputSenha
@onready var input_confirmar_senha: LineEdit = $VBoxContainer/InputConfirmarSenha
@onready var botao_cadastrar: Button = $VBoxContainer/BotaoCadastrar
@onready var label_mensagem: Label = $VBoxContainer/LabelMensagem

func _ready():
	# Limpa a mensagem ao iniciar e conecta o botão
	label_mensagem.text = ""
	botao_cadastrar.pressed.connect(_on_botao_cadastrar_pressed)

func _on_botao_cadastrar_pressed():
	# 1. Coleta os dados
	var nome = input_nome.text.strip_edges()
	var email = input_email.text.strip_edges()
	var senha = input_senha.text
	var confirmar = input_confirmar_senha.text

	# --- INÍCIO DA SEQUÊNCIA DE VALIDAÇÕES ---

	# Validação de Nome: Não pode estar em branco
	if nome == "":
		exibir_status("Erro: O nome não pode estar em branco.", Color.RED)
		return

	# Validação de E-mail: Presença de @ e .
	if not "@" in email or not "." in email:
		exibir_status("Erro: E-mail inválido (deve conter @ e ponto).", Color.RED)
		return

	# Validação de Senha: Mínimo de 6 caracteres
	if senha.length() < 6:
		exibir_status("Erro: A senha deve ter no mínimo 6 caracteres.", Color.RED)
		return

	# Validação de Confirmação: Devem ser iguais
	if senha != confirmar:
		exibir_status("Erro: As senhas não coincidem.", Color.RED)
		return

	# --- SUCESSO FINAL ---
	# Se o código chegou até aqui, significa que nenhuma validação parou o script
	exibir_status("Cadastro realizado com sucesso!", Color.GREEN)
	processar_cadastro(nome, email)

# Função auxiliar para evitar repetição de código ao mudar a Label
func exibir_status(mensagem: String, cor: Color):
	label_mensagem.text = mensagem
	label_mensagem.add_theme_color_override("font_color", cor)

# Função para o que acontece após o sucesso (ex: salvar no banco ou mudar de cena)
func processar_cadastro(n: String, e: String):
	print("Dados prontos para envio: ", n, " | ", e)
	# Adicione aqui o próximo passo do seu jogo!
