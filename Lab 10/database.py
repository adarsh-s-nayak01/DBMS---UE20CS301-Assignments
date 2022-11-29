import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",
    database="railway_system_lab10"
)
c = mydb.cursor()


def create_table():
    c.execute('CREATE TABLE IF NOT EXISTS Train (Train_No int, Name varchar(30), Train_Type varchar(20), Source varchar(20), Destination varchar(20), Availability varchar(5));')


def add_data(train_no, train_name, train_type, source, dest, available):
    c.execute('INSERT INTO Train (Train_No, Name, Train_Type, Source, Destination, Availability) VALUES (%s,%s,%s,%s,%s,%s);',
              (train_no, train_name, train_type, source, dest, available))
    mydb.commit()


def view_all_data():
    c.execute('SELECT * FROM Train')
    data = c.fetchall()
    return data


def view_only_train_names():
    c.execute('SELECT Name FROM Train')
    data = c.fetchall()
    return data


def get_details(train_name):
    c.execute('SELECT * FROM Train WHERE Name="{}"'.format(train_name))
    data = c.fetchall()
    return data


def edit_details(new_train_no, new_train_name, new_train_type, new_source, new_dest, new_available, train_no, train_name, train_type, source, dest, available):
    c.execute("UPDATE Train SET Train_No=%s, Name=%s, Train_Type=%s, Source=%s, Destination=%s, Availability=%s WHERE "
              "Train_No=%s and Name=%s and Train_Type=%s and Source=%s and Destination=%s and Availability=%s", (new_train_no, new_train_name, new_train_type, new_source, new_dest, new_available, train_no, train_name, train_type, source, dest, available))
    mydb.commit()
    data = c.fetchall()
    return data


def delete_data(train_name):
    c.execute('DELETE FROM Train WHERE Name="{}"'.format(train_name))
    mydb.commit()