<?php
/**
 * Created by PhpStorm.
 * User: Leonardo Vilarinho
 * Date: 27/05/2016
 * Time: 11:37
 */

require_once 'ModelFuncionario.aanc';

class ModelFuncionarioTest extends PHPUnit_Framework_TestCase
{

    /**
     * Verifica se houve retorno na listagem de funcionarios
     * @test esperado OK
     */
    public function testListagemFuncionarios()
    {
        $model = new ModelFuncionario();
        $resultado = $model->preparaListagem("funcionarios");
        $this->assertTrue(count($resultado) > 0 and !empty($resultado));
    }

    /**
     * Tenta buscar um funcionario inexistente
     * @test esperado OK
     */
    public function testConsultaFuncionario()
    {
        $model = new ModelFuncionario();
        $resultado = $model->preparaConsultaId(100, "funcionarios");
        $this->assertFalse(count($resultado) > 0 and !empty($resultado));
    }

    /**
     * Tenta criar um funcionario com cpf invalido
     * @test esperado OK
     */
    public function testCriacaoFuncionarioErro()
    {
        $this->setExpectedException("Exception", "CPF é inválido");
        $model = new ModelFuncionario();
        $dados = array
        (
            "tabela" => "funcionarios",
            "consultar" => "cpf",
            "nome" => "Girafales",
            "cpf" => "12345678901",
            "numero" => 3,
            "email" => "girafales@outlook.com",
            "telefone" => "000000000"
        );
        $resultado = $model->preparaCriacao($dados);
        $this->assertFalse($resultado);
    }

    /**
     * Tenta editar funcionario sem todos os dados necessraio
     * @test esperado OK
     */
    public function testEdicaoFuncionario()
    {
        $model = new ModelFuncionario();
        $dados = array
        (
            "tabela" => "funcionarios",
            "consultar" => "cpf",
            "cpf" => "33781172228",
            "id" => 4,
            "email" => "reane-test@outlook.com",
            "telefone" => "000000000"
        );
        $resultado = @$model->preparaEdicao($dados);
        $this->assertFalse($resultado);
    }

}
