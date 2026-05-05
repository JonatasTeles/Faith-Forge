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

function buscarContagemStreak(idUsuario) {

    var instrucaoSQL = `
        SELECT
            TIMESTAMPDIFF(DAY, data_estudo, CURRENT_TIMESTAMP()) as dif_dias
        FROM estudos
        WHERE usuario_id = ${idUsuario}
        ORDER BY data_estudo DESC
        LIMIT 1;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSQL);
    return database.executar(instrucaoSQL);
}

function cadastrarStreak(idUsuario) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", idUsuario, idQuestao, nota);

    var instrucaoSql = `
        UPDATE usuarios SET streak = ;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarExplicacao(idQuestao) {

    var instrucaoSQL = `
        SELECT
            id,
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

function cadastrarEstudo(idUsuario, idQuestao, nota) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", idUsuario, idQuestao, nota);

    var instrucaoSql = `
        INSERT INTO estudos (usuario_id, questao_id, nota_conviccao) VALUES ('${idUsuario}', '${idQuestao}', '${nota}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarInfoCards,
    buscarContagemStreak,
    buscarExplicacao,
    cadastrarEstudo
}
