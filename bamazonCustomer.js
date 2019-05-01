var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
    host: "localhost",

    port: 3306,

    user: "root",

    password: "root",
    database: "bamazon_db"
});

connection.connect(function (err) {
    if (err) throw err;
    console.log("Connected");
    start();
});

function start() {
    connection.query('SELECT * FROM products', (err, results) => {
        if (err) throw err;

        console.log("Data received from database:");

        inquirer
            .prompt([
                {
                    name: "itemChoice",
                    type: "rawlist",
                    choices: function () {
                        var choiceArray = [];
                        for (var i = 0; i < results.length; i++) {
                            choiceArray.push(results[i].item_name);
                        }
                        return choiceArray;
                    },
                    message: "What product do you wish to purchase?"
                },
                {
                    name: "choice",
                    type: "input",
                    message: "How many would you like to purchase?"
                }
            ])
            .then(function (answer) {
                var chosenItem;
                for (var i = 0; i < results.length; i++) {
                    if (results[i].item_name === answer.itemChoice) {
                        chosenItem = results[i];
                    }
                }

                if (chosenItem.quantity > parseInt(answer.choice)) {
                    connection.query("UPDATE products SET quantity = quantity - ? WHERE id = ?",

                        // connection.query(
                        //     "UPDATE products SET ? WHERE ?",
                        [answer.choice, chosenItem.id],
                        function (error) {
                            if (error) throw err;
                            console.log("Your order has been created!");
                            start();
                        }
                    );
                }
                else {
                    console.log("We do not have enough in stock, sorry bout dat homie..");
                    start();
                }
            });
    });
}

