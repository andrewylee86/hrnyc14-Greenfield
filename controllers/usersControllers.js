const { knex } = require('../database/index');

exports.getAllUsers = async (req, res) => {
	const allUsers = await knex.select().from('users');
	res.send(allUsers);
}

exports.addUser = async (req, res) => {
	const { username, email } = req.body;
	const result = await knex('users').insert({ username: username, email: email });
	res.send(result);
};





