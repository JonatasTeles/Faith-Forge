var database = require("../database/config");

function buscarDataInicio(idUsuario) {

    var instrucaoSQL = `
        SELECT
            CONCAT(
                CASE MONTH(data_cadastro)
                    WHEN 1 THEN 'Janeiro'
                    WHEN 2 THEN 'Fevereiro'
                    WHEN 3 THEN 'Março'
                    WHEN 4 THEN 'Abril'
                    WHEN 5 THEN 'Maio'
                    WHEN 6 THEN 'Junho'
                    WHEN 7 THEN 'Julho'
                    WHEN 8 THEN 'Agosto'
                    WHEN 9 THEN 'Setembro'
                    WHEN 10 THEN 'Outubro'
                    WHEN 11 THEN 'Novembro'
                    WHEN 12 THEN 'Dezembro'
                END,
                ' de ',
                YEAR(data_cadastro)
            ) AS mes_ano
        FROM usuarios
        WHERE id = ${idUsuario};
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSQL);
    return database.executar(instrucaoSQL);
}

function buscarKPIs(idUsuario) {

    var instrucaoSQL = `
        SELECT
	        COUNT(e.id) as total_sessoes,
            ROUND(AVG(e.nota_conviccao), 1) as media_geral,
            MAX(e.nota_conviccao) as maior_nota,
	        u.streak as dias_ofensiva
        FROM usuarios u
        JOIN estudos e ON u.id = e.usuario_id
        WHERE usuario_id = ${idUsuario};
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSQL);
    return database.executar(instrucaoSQL);
}

function buscarEvolucaoDaConviccao(idUsuario) {

    var instrucaoSQL = `
        SELECT 
	        ROUND(AVG(nota_conviccao), 1) as media_conviccao,
            DATE_FORMAT(data_estudo, '%b') as mes,
            MONTH(data_estudo) as mes_num
        FROM estudos
        WHERE usuario_id = ${idUsuario}
        GROUP BY mes_num, mes
        ORDER BY mes_num ASC;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSQL);
    return database.executar(instrucaoSQL);
}

function buscarSessoesPorTopico(idUsuario) {

    var instrucaoSQL = `
        SELECT
	        q.categoria,
            COUNT(e.id) as total_sessoes
        FROM questoes q
        JOIN estudos e ON q.id = e.questao_id
        WHERE e.usuario_id = ${idUsuario}
        GROUP BY q.categoria;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSQL);
    return database.executar(instrucaoSQL);
}

function buscarAtividadeRecente(idUsuario) {

    var instrucaoSql = `
        SELECT
	        q.categoria,
            q.titulo,
            e.nota_conviccao,
            DATE_FORMAT(e.data_estudo, '%d %b') as data_estudo
        FROM estudos e
        JOIN questoes q ON q.id = e.questao_id
        WHERE e.usuario_id = ${idUsuario}
        ORDER BY data_estudo DESC
        LIMIT 8;
    `;

    console.log("Executando a insturção SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarDataInicio,
    buscarKPIs,
    buscarEvolucaoDaConviccao,
    buscarSessoesPorTopico,
    buscarAtividadeRecente
}
