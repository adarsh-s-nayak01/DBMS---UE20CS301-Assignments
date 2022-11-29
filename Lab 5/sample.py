import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    database="test"
)
# print(mydb)
mycursor = mydb.cursor()

str="show databases"
mycursor.execute(str)
p=mycursor.fetchall()
# print(p)
spl = "INSERT INTO student_info(id,name) VALUES(%s, %s)"
val=("2","Maria")
sql="insert into student_info(id,name) values "
