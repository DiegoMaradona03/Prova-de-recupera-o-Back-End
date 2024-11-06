// Dependências para funcionar
const express = require('express');
const router = express.Router();

const clientes = require('./controllers/clientes');
const telefone = require('./controllers/telefone');
const carros = require('./controllers/carros');

// Rota (Endpoint) de teste
const teste = (req, res) => {
    res.json("API respondendo com sucesso!");
}

// Rotas para clientes
router.get('/', teste);
router.post('/clientes', clientes.create);
router.get('/clientes', clientes.read);
router.put('/clientes', clientes.update);
router.delete('/clientes/:id', clientes.deletar);

// Rotas para telefone
router.post('/telefone', telefone.create);
router.get('/telefone', telefone.read);
router.put('/telefone', telefone.update);
router.delete('/telefone/:id', telefone.deletar);

// Rotas para carros
router.post('/carros', carros.create);
router.get('/carros', carros.read);
router.put('/carros', carros.update);
router.delete('/carros/:id', carros.deletar);

module.exports = router;