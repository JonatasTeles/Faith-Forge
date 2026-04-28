var questaoModel = require("../models/questaoModel");

function buscarInfoCards(req, res) {

    console.log("Buscando informações dos cards");

    questaoModel.buscarInfoCards()
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send('Nenhum resultado encontrado');
            }
        }).catch(function (erro) {
            console.log(erro);
            console.log('Houve um erro ao buscar informações dos cards', erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarExplicacao(req, res) {

    var idQuestao = req.params.idQuestao;

    console.log(`Buscando explicação da questao ${idQuestao}`);

    questaoModel.buscarExplicacao(idQuestao)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send('Nenhum resultado encontrado');
            }
        }).catch(function (erro) {
            console.log(erro);
            console.log('Houve um erro ao buscar explicação da questao', erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    buscarInfoCards,
    buscarExplicacao
}