<?php

/**
 * Created by PhpStorm.
 * User: Leonardo Vilarinho
 * Date: 26/05/2016
 * Time: 13:59
 */
require_once 'ModelConta.aanc';
class ModelContaTest extends PHPUnit_Framework_TestCase
{
  
    /**
     * Testa login do administrador;
     * @test esperado OK
     */
    public function testLoginAdministrador()
    {
        $conta = new ModelConta();

        $this->assertEquals(true, $conta->preparaLogin(1, $conta->getAdminCPF(), "admin") );
    }

    /**
     * Testa login do administrador e usuários gerais
     * @test esperado OKS
     */
    public function testLoginsErrados()
    {
        $conta = new ModelConta();
        $this->setExpectedException('Exception');
        $this->assertEquals($this->getExpectedException(), $conta->preparaLogin(2, $conta->getAdminCPF(), "administrador") );

        $this->assertEquals($this->getExpectedException(), $conta->preparaLogin(2, "15471345921", "15471345921") );

        $this->assertEquals($this->getExpectedException(), $conta->preparaLogin(2, "14785236497", "14785236497") );
    }

    /**
     * Testa login do administrador e usuários gerais
     * @test esperado OKS
     */
    public function testLoginsCertos()
    {
        $conta = new ModelConta();

        $this->assertEquals(true, $conta->preparaLogin(2, "134.331.743-69", "admin") );

        $this->assertEquals(true, $conta->preparaLogin(2, "778.742.685-39", "admin") );

        $this->assertEquals(true, $conta->preparaLogin(2, "481.174.861-13", "admin") );
    }

    /**
     * Testa alteração de senha, com senhas diferentes
     * @test esperado FAILURES
     */
    public function testAltSenhasDiferentes()
    {
        $conta = new ModelConta();

        $this->assertEquals(false, $conta->preparaAlteracaoSenha("123", "1452") );

    }

    /**
     * Testa alteração de senha, com senhas diferentes
     * @test esperado OKS
     */
    public function testAltSenhas()
    {
        $conta = new ModelConta();
        $_SESSION['cpf'] = "48117486113";
        $_SESSION['tipo'] = 2;
        $this->assertEquals(true, $conta->preparaAlteracaoSenha("admin", "admin") );

    }
}
