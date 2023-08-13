const express = require('express');
const router = express.Router();
const homeController = require('./controllers/homeController');

// Route pour la liste des taches
//router.get('/', taskController.listTasks);
router.get("/", homeController.renderHome);

// Route pour ajouter une tache
//router.post('/tasks', taskController.createTask);

// Route pour modifier une tache
//router.patch('/tasks/:id', taskController.updateTask);
// Route pour supprimer une tache
//router.delete('/tasks/:id', taskController.deleteTask);
module.exports  = router;