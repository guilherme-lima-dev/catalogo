<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

date_default_timezone_set('America/Sao_Paulo');

$data = file_get_contents("php://input");
$objData = json_decode($data);

$nome = $objData->nome;
$qtd = $objData->qtd;
//$foto = $objData->foto;
$valor = $objData->valor;
$descricao = $objData->descricao;
//$idempresa = $objData->idempresa;
//$idusuario = $objData->idusuario;

$nome = stripslashes($nome);
$qtd = stripslashes($qtd);
//$foto = stripslashes($foto);
$valor = stripslashes($valor);
$descricao = stripslashes($descricao);
//$status = stripslashes($status);
//$idempresa = stripslashes($idempresa);
//$idusuario = stripslashes($idusuario);

$nome = trim($nome);
$qtd = trim($qtd);
//$foto = trim($foto);
$valor = trim($valor);
$descricao = trim($descricao);
//$idempresa = trim($idempresa);
//$idusuario = trim($idusuario);

$dados; 

require_once 'config.php';


if($conexao){
    $Sql = " insert into produto (nome_prod, quantidade_prod, foto_prod, descricao_prod, valor_prod, status_prod, empresa_idempresa, usuario_idusuario) values('".$nome."',".$qtd.",'https://www.lucasnaves.com.br/wp-content/uploads/2019/08/esgotado-300x238.png','".$descricao."','.$valor.', 'Ativo', 1, 1)";


    $query = $conexao->prepare($Sql);
    $query ->execute();

    echo json_encode('dados inseridos com sucesso');
   
}else{
      $dados = array('mensage' => "Não foi possivel iserir os dados! Tente novamente mais tarde.");
      echo json_encode($dados);
};

?>