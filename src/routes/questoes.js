var express = require("express");
var router = express.Router();

var questaoController = require("../controllers/questaoController");

router.get("/cards", function (req, res) {
    questaoController.buscarInfoCards(req, res);
});

router.get("/contstreak/:idUsuario", function (req, res) {
    questaoController.buscarContagemStreak(req, res);
});

router.post("/cadstreak/", function (req, res) {
    questaoController.cadastrarStreak(req, res);
});

router.get("/explicacao/:idQuestao", function (req, res) {
    questaoController.buscarExplicacao(req, res);
});

router.post("/notaavaliacao", function (req, res) {
    questaoController.cadastrarEstudo(req, res);
})

module.exports = router;