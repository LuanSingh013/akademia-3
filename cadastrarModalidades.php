<?php
        include_once('./components/header.php');
    ?>
 <div>
            <h2>Cadastre sua Modalidade</h2>
            <form method="post" id="formCadastro">
                
                <label for="nome">Selecione a modalidade:</label>
                <input type="text" placeholder="Informe sua Modalidade" name="nome" required>
<?php
                    if (isset($_REQUEST["cadastrar"])) {
            
                        $u = new Usuario();
                        $u->create($_REQUEST["nome"];

                        echo $u->inserirUsuario() == true ? "
                        <span class='mensagemSucesso'>Modalidade Cadastrada!</span>" : 
                        "<span class='mensagemErro'>Ocorreu um erro.</span>";
                    }
                ?>
                
                <button type="submit" class="formBotao" name="cadastrar">Cadastrar</button>
            </form>
        </div>

<?php
        include_once('./components/footer.php');
    ?>