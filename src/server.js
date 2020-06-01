const express = require('express');
const server = require('./index');
const morgan = require('morgan');
const exphbs = require('express-handlebars')
const path = require('path');
const passport = require('passport');
const flash = require('connect-flash');
const session = require('express-session');
const mySqlStore =require('express-mysql-session');

const { database } = require('./dataBase/Keys'); //aki tango que cambiar el nombre de la carpeta
require('./lib/passport');

//**configuracion**
server.set('port', process.env.PORT || 3000);
//ver html
server.set('views', path.join(__dirname, 'views'));
server.engine('.hbs',exphbs({
    defaultLayout: 'main',
    layoutsDir: path.join(server.get('views'), 'layouts'),
    partialsDir: path.join(server.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}));
server.set('view engine', '.hbs')



//**middlewears**
//reder Json que reciva de alguna API
server.use(express.json());
server.use(session({
    secret: 'holahola',
    resave: false,
    saveUninitialized: false,
    store: new mySqlStore(database)
}));
server.use(flash());
server.use(morgan('dev'));
//recive datos simples desde formularios(string, int, etc)
server.use(express.urlencoded({extended: false}));
server.use(passport.initialize());
server.use(passport.session());

//**variables globales**
//SIEMPRE HAY QUE DECLARARLA SANTES DE LAS RUTAS NO SEAS WN XD
server.use((req, res, next)=>{
    server.locals.ok = req.flash('ok');
    server.locals.message = req.flash('message');
    server.locals.user = req.user;
    next();
});

//**rutas **
server.use(require('./routes/rutas'));




//** static files
server.use(express.static(path.join(__dirname, ('public'))));

//**run server
server.listen(server.get('port'), ()=>{
    console.log('sever on port ', server.get('port'));
});
