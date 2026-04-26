var express = require("express");
var router = express.Router();

var estudoController = require("../controllers/estudoController");

router.get("/datainicio/:idUsuario", function (req, res) {
    estudoController.buscarDataInicio(req, res);
});

router.get("/kpis/:idUsuario", function (req, res) {
    estudoController.buscarKPIs(req, res);
});

router.get("/evodaconvic/:idUsuario", function (req, res) {
    estudoController.buscarEvolucaoDaConviccao(req, res);
});

router.get("/sessoesptop/:idUsuario", function (req, res) {
    estudoController.buscarSessoesPorTopico(req, res);
});

router.get("/atvrecente/:idUsuario", function (req, res) {
    estudoController.buscarAtividadeRecente(req, res);
});

module.exports = router;