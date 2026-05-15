var database = require("../database/config");

function buscarInfoCards(categoria, dificuldade) {

    if (categoria == 'todosCat' && dificuldade == 'todosDif') {

        var instrucaoSQL = `
            SELECT
                id,
                titulo,
                categoria,
                dificuldade,
                resumo
            FROM questoes;
        `;
    } else if (categoria == 'todosCat') {

        var instrucaoSQL = `
            SELECT
                id,
                titulo,
                categoria,
                dificuldade,
                resumo
            FROM questoes
            WHERE dificuldade = '${dificuldade}';
        `;
    } else if (dificuldade == 'todosDif') {

        var instrucaoSQL = `
            SELECT
                id,
                titulo,
                categoria,
                dificuldade,
                resumo
            FROM questoes
            WHERE categoria = '${categoria}';
        `;
    } else {

        var instrucaoSQL = `
            SELECT
                id,
                titulo,
                categoria,
                dificuldade,
                resumo
            FROM questoes
            WHERE categoria = '${categoria}' AND dificuldade = '${dificuldade}';
        `;
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSQL);
    return database.executar(instrucaoSQL);

}

function buscarContagemStreak(idUsuario) {

    var instrucaoSQL = `
        SELECT
            TIMESTAMPDIFF(DAY, e.data_estudo, CURRENT_TIMESTAMP()) as dif_dias,
            u.streak
        FROM estudos e 
        JOIN usuarios u ON e.usuario_id = u.id
        WHERE usuario_id = ${idUsuario}
        ORDER BY data_estudo DESC
        LIMIT 1;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSQL);
    return database.executar(instrucaoSQL);
}

function cadastrarStreak(idUsuario, numStreak) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrarStreak():", idUsuario, numStreak);

    var instrucaoSql = `
        UPDATE usuarios SET streak = ${numStreak + 1} WHERE id = ${idUsuario};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function zerarStreak(idUsuario) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function zerarStreak():", idUsuario);

    var instrucaoSql = `
        UPDATE usuarios SET streak = 0 WHERE id = ${idUsuario};
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
    cadastrarStreak,
    zerarStreak,
    buscarExplicacao,
    cadastrarEstudo
}
