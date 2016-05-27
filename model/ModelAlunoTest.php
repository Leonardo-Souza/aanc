<?php
/**
 * Created by PhpStorm.
 * User: Leonardo Vilarinho
 * Date: 27/05/2016
 * Time: 11:37
 */

require_once 'ModelAluno.aanc';

class ModelAlunoTest extends PHPUnit_Framework_TestCase
{

    /**
     * Verifica se houve retorno na listagem de alunos
     * @test esperado OK
     */
    public function testListagemAlunos()
    {
        $model = new ModelAluno();
        $resultado = $model->preparaListagem("alunos");
        $this->assertTrue(count($resultado) > 0 and !empty($resultado));
    }

    /**
     * Tenta buscar um aluno inexistente
     * @test esperado OK
     */
    public function testConsultaAluno()
    {
        $model = new ModelAluno();
        $resultado = $model->preparaConsultaId(100, "alunos");
        $this->assertFalse(count($resultado) > 0 and !empty($resultado));
    }

    /**
     * Tenta criar um usuario com cpf invalido
     * @test esperado OK
     */
    public function testCriacaoAlunoErro()
    {
        $this->setExpectedException("Exception", "CPF é inválido");
        $model = new ModelAluno();
        $dados = array
        (
            "tabela" => "alunos",
            "consultar" => "cpf",
            "nome" => "Leonardo Vilarinho",
            "cpf" => "12345678901",
            "curso" => 1,
            "email" => "leonardo-i@outlook.com",
            "telefone" => "000000000"
        );
        $resultado = $model->preparaCriacao($dados);
        $this->assertFalse($resultado);
    }

    /**
     * Tenta editar aluno sem todos os dados necessraio
     * @test esperado OK
     */
    public function testEdicaoAluno()
    {
        $model = new ModelAluno();
        $dados = array
        (
            "tabela" => "alunos",
            "consultar" => "cpf",
            "cpf" => "50762556676",
            "id" => 5,
            "email" => "leonardo-i@outlook.com",
            "telefone" => "000000000"
        );
        $resultado = @$model->preparaEdicao($dados);
        $this->assertFalse($resultado);
    }
    
}
