<?php
/**
 * Created by PhpStorm.
 * User: Leonardo Vilarinho
 * Date: 27/05/2016
 * Time: 11:37
 */

require_once 'ModelCurso.aanc';

class ModelCursoTest extends PHPUnit_Framework_TestCase
{

 /**
  * Verifica se houve retorno na listagem dos cursos
  * @test esperado OK
  */
 public function testListagemCursos()
 {
  $model = new ModelCurso();
  $resultado = $model->preparaListagem("cursos");
  $this->assertTrue(count($resultado) > 0 and !empty($resultado));
 }
 /**
  * Tenta buscar um curso inexistente
  * @test esperado OK
  */
 public function testConsultaCursos()
 {
  $model = new ModelCurso();
  $resultado = $model->preparaConsultaId(100, "cursos");
  $this->assertFalse(count($resultado) > 0 and !empty($resultado));
 }

 /**
  * Tenta criar um curso com nome e descricao
  * @test esperado OK
  */
 public function testCriacaoCurso()
 {
  $this->setExpectedException("Exception", "Nome inválido");
  $model = new ModelCurso();
  $dados = array
  (
      "tabela" => "cursos",
      "nome" => "123",
      "descricao" => "blabla"
  );
  $resultado = $model->preparaCriacao($dados);
  $this->assertFalse($resultado);
 }

 /**
  * Tenta editar cursos sem todos os dados necessraio
  * @test esperado OK
  */
 public function testEdicaoCurso()
 {

  $model = new ModelCurso();
  $dados = array
  (
      "tabela" => "cursos",
      "nome" => "informatica"
  );
  $resultado = @$model->preparaEdicao($dados);
  $this->assertFalse($resultado);
 }

}

