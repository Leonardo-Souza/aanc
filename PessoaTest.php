<?php

/**
 * Created by PhpStorm.
 * User: Leonardo Vilarinho
 * Date: 26/05/2016
 * Time: 10:08
 */
require_once 'Pessoa.aanc';
class PessoaTest extends PHPUnit_Framework_TestCase
{
    public function testType()
    {
        $pessoa = new Pessoa();
        $this->assertInternalType('int', $pessoa->getIdade());
        $this->assertInternalType('float', $pessoa->getAltura());
    }

    /**
     * @depends testType
     */
    public function testEnvelhecer()
    {
        $pessoa = new Pessoa();
        $pessoa->envelhecer(20);
        $pessoa->envelhecer(5);
        $this->assertEquals(25, $pessoa->getIdade());
    }

    /**
     * @depends testType
     */
    public function testCrescer()
    {
        $pessoa = new Pessoa();
        $pessoa->crescer(1);
        $pessoa->crescer(0.5);
        $this->assertEquals(1.5, $pessoa->getAltura());
    }
}
