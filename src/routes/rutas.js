const { Router } = require('express');
const router = Router();

const pool = require('../database/pool');
const passport = require('passport')

var talleres =  new Array()

// GET
router.get('/index', async (req, res, next) => {
    const links = await pool.query('SELECT * FROM taller')
    res.render('links/index', { links })
})

router.get('/signup', (req, res, next) => {
    res.render('links/signup')
})

router.get('/signin', (req, res, next) => {
    res.render('links/signin')
})

router.get('/logout', (req, res) => {
    req.logOut();
    res.redirect('/index');
})

router.get('/perfil', (req, res, next) => {
    if (req.isAuthenticated()) {
        //const talleres = await pool.query(query)
        //res.render('links/perfil')
        res.render('links/perfil', { talleres })
    } else {
        res.redirect('/index');
    }
})

//POST
router.post('/signup', passport.authenticate('local-signup', {
    successRedirect: '/index',
    failureRedirect: '/signup',
    failureFlash: true
}));

router.post('/signin', (req, res, next) => {
    passport.authenticate('local-signin', {
        successRedirect: '/perfil',
        failureRedirect: '/signin',
        failureFlash: true
    })(req, res, next)
});

router.post('/inscripcion', async (req, res, next) => {
    const inscripcion = req.body
    console.log(inscripcion)
    const resul = await pool.query(`INSERT INTO inscripcion(fk_id_usuario, fk_id_taller) VALUES (${inscripcion.usuario},${inscripcion.taller})`);

})

router.post('/perfil', async (req, res, next) => {
    const userId = req.body.id_usuario

    const query = `

    Select 
    DISTINCT i.fk_id_taller,
    i.fk_id_usuario,
    t.nombre
     from inscripcion i 
     JOIN taller t on (id_taller = fk_id_taller)
     where fk_id_usuario = ${userId}
    `

    talleres = await pool.query(query)

    console.log(talleres)


    //res.render('links/perfil', { talleres })
})

router.post('/delete', async(req, res, next)=>{
    //console.log(req.body)
    const query = `
    Delete from inscripcion where fk_id_usuario = ${req.body.userId} and fk_id_taller = ${req.body.tallerId}
    `

    const resul = await pool.query(query)


    const query2 = `

    Select 
    DISTINCT i.fk_id_taller,
    i.fk_id_usuario,
    t.nombre
     from inscripcion i 
     JOIN taller t on (id_taller = fk_id_taller)
     where fk_id_usuario = ${req.body.userId}
    `

    talleres = await pool.query(query2)
    

})

module.exports = router;