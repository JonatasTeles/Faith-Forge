var express = require("express");
var router = express.Router();

var questaoController = require("../controllers/questaoController");

router.get("/cards", function (req, res) {
    questaoController.buscarInfoCards(req, res);
});

router.get("/explicacao/:idQuestao", function (req, res) {
    questaoController.buscarExplicacao(req, res);
});

router.post("/notaavaliacao", function (req, res) {
    questaoController.cadastrarEstudo(req, res);
})

module.exports = router;