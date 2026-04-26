const { json } = require("express");
var estudoModel = require("../models/estudoModel");

function buscarDataInicio(req, res) {

    var idUsuario = req.params.idUsuario;

    console.log("Buscando data inicio");

    estudoModel.buscarDataInicio(idUsuario)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send('Nenhum resultado encontrado');
            }
        }).catch(function (erro) {
            console.log(erro);
            console.log('Houve um erro ao buscar data inicio', erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarKPIs(req, res) {

    var idUsuario = req.params.idUsuario;

    console.log("Buscando KPIs");

    estudoModel.buscarKPIs(idUsuario)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send('Nenhum resultado encontrado');
            }
        }).catch(function (erro) {
            console.log(erro);
            console.log('Houve um erro ao buscar KPIs', erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarEvolucaoDaConviccao(req, res) {

    var idUsuario = req.params.idUsuario;

    console.log("Buscando evolucao da conviccao");

    estudoModel.buscarEvolucaoDaConviccao(idUsuario)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send('Nenhum resultado encontrado');
            }
        }).catch(function (erro) {
            console.log(erro);
            console.log('Houve um erro ao buscar evolucao da conviccao', erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarSessoesPorTopico(req, res) {

    var idUsuario = req.params.idUsuario;

    console.log(`Buscando sessoes por topico`);

    estudoModel.buscarSessoesPorTopico(idUsuario)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhuma sessao por topico encontrada");
            }
        }).catch(function (erro) {
            console.log(erro);
            console.log("Houve um erro ao buscar sessao por topico.", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        })
}

function buscarAtividadeRecente(req, res) {

    var idUsuario = req.params.idUsuario;

    console.log(`Buscando atividade recente`);

    estudoModel.buscarAtividadeRecente(idUsuario)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhuma atividade recente encontrada");
            }
        }).catch(function (erro) {
            console.log(erro);
            console.log("Houve um erro ao buscar atividade recente.", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    buscarDataInicio,
    buscarKPIs,
    buscarEvolucaoDaConviccao,
    buscarSessoesPorTopico,
    buscarAtividadeRecente
}