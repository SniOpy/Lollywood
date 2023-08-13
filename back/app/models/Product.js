const sequelize = require('../database');
const { Model, Sequelize, DataTypes } = require('sequelize');

class Product extends Model {}
Product.init({ 
    title:  { 
      type : DataTypes.TEXT,
      allowNul : false,
    },

    description: {
      type: DataTypes.TEXT,
      allowNull : false
    },

    price : {
      type : DataTypes.FLOAT, 
      allowNull : false
    },
    inventory : {

      type: DataTypes.INTEGER,
      allowNull : false
    },

    category_id : {
      type: DataTypes.INTEGER,
      references: {
        model: Product,
        key: 'id',
      }

    }

 }, {
    sequelize,
    tableName: "product" // nom de la table
});

module.exports = Product;