"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.migrate = async function () {
    if (['-v', '--version', 'version'].includes(process.argv[2])) {
        for (let envs of Object.keys(process.env)) {
            if (envs.match(/^HEROKU_/) && envs !== 'HEROKU_UPDATE_INSTRUCTIONS') {
                let value = envs === 'HEROKU_API_KEY' ? 'to [REDACTED]' : `to ${process.env[envs]}`;
                this.warn(`${envs} set ${value}`);
            }
        }
    }
};
