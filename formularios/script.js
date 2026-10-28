const inputEmail = document.querySelector("#email");
const inputSenha = document.querySelector("#senha")
const buttonEnviar = document.querySelector("#btn-enviar")

buttonEnviar.addEventListener("click",login)

function login(event){
    event.preventDefault();

    const email = "fulano@gmail.com"
    const senha = "senha123"

    if(email != inputEmail.value || senha != inputSenha.value)
        alert("Usuário ou senha incorretos")
    else alert("Bem-vindo!")
}

// O ID é sempre buscado com #
// Uma Classe é sempre buscada por um .
// Podemos buscar diretamente as TAGS