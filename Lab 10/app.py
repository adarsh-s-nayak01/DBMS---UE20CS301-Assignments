import streamlit as st
import mysql.connector

from create import create
from database import create_table
from delete import delete
from read import read
from update import update

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    # port=3306
    password="password"
)
c = mydb.cursor()
c.execute("CREATE DATABASE railways620;")


def main():
    st.title("Railway Reservation System")
    menu = ["Add Train", "View Trains", "Edit Train Info", "Remove Train"]
    choice = st.sidebar.selectbox("Menu", menu)

    create_table()
    if choice == "Add Train":
        st.subheader("Enter Train Details:")
        create()

    elif choice == "View Trains":
        st.subheader("View Train Details:")
        read()

    elif choice == "Edit Train Info":
        st.subheader("Edited Train Details:")
        update()

    elif choice == "Remove Train":
        st.subheader("Delete Train:")
        delete()

    else:
        st.subheader("About Train")


if __name__ == '__main__':
    main()
