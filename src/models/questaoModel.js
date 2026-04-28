var database = require("../database/config");

function buscarInfoCards() {

    var instrucaoSQL = `
        SELECT
            q.id,
            q.titulo,
            q.categoria,
            q.dificuldade,
            q.resumo,
            JSON_ARRAYAGG(t.nome) AS tags
        FROM questoes q
        JOIN questoes_tags qt ON q.id = qt.questao_id
        JOIN tags t ON qt.tag_id = t.id
        GROUP BY q.id;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSQL);
    return database.executar(instrucaoSQL);

}

function buscarExplicacao(idQuestao) {

    var instrucaoSQL = `
        SELECT
            titulo,
            categoria,
            dificuldade,
            resumo,
            resposta,
            escritura
        FROM questoes
        WHERE id = ${idQuestao};
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSQL);
    return database.executar(instrucaoSQL);

}

module.exports = {
    buscarInfoCards,
    buscarExplicacao
}
