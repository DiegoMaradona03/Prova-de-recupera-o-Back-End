const con = require('../connect/connect').con;

const create = (req, res) => {
    let cliente_id = req.body.cliente_id;
    let marca_veiculo = req.body.marca_veiculo;
    let modelo_veiculo = req.body.modelo_veiculo;
    let ano_veiculo = req.body.email;
    let fabricacao_veiculo = req.body.fabricacao_veiculo;

    //Conexão com o banco de dados
    let query = `INSERT INTO carros (cliente_id, marca_veiculo, modelo_veiculo, ano_veiculo, fabricacao_veiculo) VALUES`
    query += `('${cliente_id}','${marca_veiculo}','${modelo_veiculo}','${ano_veiculo}','${fabricacao_veiculo}');`;
    con.query(query, (err, result) => {
        if (err) {
            res.status(500).json(err)
        } else {
            res.status(201).json(result)
        }
    })
}

const read = (req, res) => {
    con.query('SELECT * FROM carros', (err, result) => {
        if (err){
            res.status(500).json(err);
        }else{
            res.json(result)
        }
    })
}

const deletar = (req, res) => {
    let id = Number(req.params.id);
    con.query(`DELETE FROM carros WHERE carros_id = '${id}'`, (err,result) => {
        if (err) {
            res.status(400).json();
        } else {
            res.status(201).json(result)
        }
    })
}

const update = (req, res) => {
    const { id, cliente_id, marca_veiculo, modelo_veiculo, ano_veiculo, fabricacao_veiculo } = req.body;

    const query = `UPDATE carros SET cliente_id = '${cliente_id}', marca_veiculo = '${marca_veiculo}', modelo_veiculo = '${modelo_veiculo}', ano_veiculo = '${ano_veiculo}', fabricacao_veiculo = '${fabricacao_veiculo}' WHERE carros_id = '${id}'`;
    con.query(query, [cliente_id, marca_veiculo, modelo_veiculo, ano_veiculo, fabricacao_veiculo, id], (err, result) => {
        if (err) {
            res.status(500).json({ error: err.message });
        } else {
            res.json({ message: 'Cliente atualizado com sucesso', result });
        }
    })
}

module.exports = {
    create,
    read,
    deletar,
    update
}