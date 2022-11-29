import mysql.connector
mydb = mysql.connector.connect(host="localhost", user="root",password="password")
c = mydb.cursor()
c.execute("CREATE DATABASE railway_system_lab10")