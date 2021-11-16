exports.handler = async (event, context) => {
    console.log('Ambiente..', JSON.stringify(process.env, null, 2));
    console.log('Evento...', JSON.stringify(event, null, 2));

    return {
        message: 'Bem-vindo ao treinamento Serverless AWS!'
    };
};
