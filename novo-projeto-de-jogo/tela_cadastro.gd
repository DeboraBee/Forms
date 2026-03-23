extends Control


@onready var input_nome: LineEdit = $VBoxContainer/InputNome
@onready var input_email: LineEdit = $VBoxContainer/InputEmail
@onready var input_senha: LineEdit = $VBoxContainer/InputSenha
@onready var input_confirmar_senha: LineEdit = $VBoxContainer/InputConfirmarSenha
@onready var botao_cadastrar: Button = $VBoxContainer/BotaoCadastrar
@onready var label_mensagem: Label = $VBoxContainer/LabelMensagem

func _ready():
	
	label_mensagem.text = ""
	botao_cadastrar.pressed.connect(_on_botao_cadastrar_pressed)

func _on_botao_cadastrar_pressed():
	
	var nome = input_nome.text.strip_edges()
	var email = input_email.text.strip_edges()
	var senha = input_senha.text
	var confirmar = input_confirmar_senha.text




	if nome == "":
		exibir_status("Erro: O nome não pode estar em branco.", Color.RED)
		return


	if not "@" in email or not "." in email:
		exibir_status("Erro: E-mail inválido (deve conter @ e ponto).", Color.RED)
		return


	if senha.length() < 6:
		exibir_status("Erro: A senha deve ter no mínimo 6 caracteres.", Color.RED)
		return


	if senha != confirmar:
		exibir_status("Erro: As senhas não coincidem.", Color.RED)
		return


	exibir_status("Cadastro realizado com sucesso!", Color.GREEN)
	processar_cadastro(nome, email)


func exibir_status(mensagem: String, cor: Color):
	label_mensagem.text = mensagem
	label_mensagem.add_theme_color_override("font_color", cor)


func processar_cadastro(n: String, e: String):
	print("Dados prontos para envio: ", n, " | ", e)
