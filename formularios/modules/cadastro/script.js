const inputEmail = document.querySelector("#email");
const inputSenha = document.querySelector("#senha")
const inputConfirmarSenha = document.querySelector("#confirmar_senha");
const inputRua = document.querySelector("#rua")
const inputNumero = document.querySelector("#numero");
const inputBairro = document.querySelector("#bairro")
const inputComplemento = document.querySelector("#complemento");
const buttonEnviar = document.querySelector("#btn-enviar")

buttonEnviar.addEventListener("click",confirmarCadastro)

function confirmarCadastro(event){
    event.preventDefault();
    
    if(inputSenha.value != inputConfirmarSenha.value) {
        alert("As senhas não coincidem.");
        return;
    }

    const result = confirm("Deseja confirmar o cadastro?")
    if(result) cadastrar();
}

function cadastrar(){
    console.log(inputEmail.value)
    console.log(inputSenha.value)
    console.log(inputConfirmarSenha.value)
    console.log(inputRua.value)
    console.log(inputNumero.value)
    console.log(inputBairro.value)
    console.log(inputComplemento.value)

    alert("Cadastro realizado com sucesso!")
    location.href = "../../index.html"
    
}

// O ID é sempre buscado com #
// Uma Classe é sempre buscada por um .
// Podemos buscar diretamente as TAGS