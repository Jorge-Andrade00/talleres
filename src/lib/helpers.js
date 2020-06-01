const bcrypt = require('bcryptjs');
const helpers = {};
const pool = require('../database/pool');
const fs = require('fs');
const path = require('path')

helpers.encryptPass = async (pass) => {
    const stringHash = await bcrypt.genSalt(10);
    const finalPass = await bcrypt.hash(pass, stringHash);
    return finalPass;
};

helpers.matchPass = async (pass, savedPass) => {
    return await bcrypt.compare(pass, savedPass);
};


module.exports =  helpers;