<?php
/**
 * Created by PhpStorm.
 * User: Leonardo Vilarinho
 * Date: 27/05/2016
 * Time: 11:37
 */

require_once 'ModelAluno.aanc';

class ModelFuncionarioTest extends PHPUnit_Framework_TestCase
{

    /**
     * Verifica se houve retorno na listagem de funcionarios
     * @test esperado OK
     */
    public function testListagemFuncionarios()
    {
        $model = new ModelAluno();
        $resultado = $model->preparaListagem("funcionarios");
        $this->assertTrue(count($resultado) > 0 and !empty($resultado));
    }


}
