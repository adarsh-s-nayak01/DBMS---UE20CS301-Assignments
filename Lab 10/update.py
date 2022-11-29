import datetime

import pandas as pd
import streamlit as st
from database import view_all_data, view_only_train_names, get_details, edit_details


def update():
    result = view_all_data()
    # st.write(result)
    df = pd.DataFrame(result, columns=['Train_No', 'Name', 'Source', 'Destination', 'Train_Type', 'Availability'])
    with st.expander("Current trains"):
        st.dataframe(df)
    list_of_trains = [i[0] for i in view_only_train_names()]
    selected_train = st.selectbox("Train to Edit", list_of_trains)
    selected_result = get_details(selected_train)
    # st.write(selected_result)
    if selected_result:
        train_no = selected_result[0][0]
        train_name = selected_result[0][1]
        source = selected_result[0][2]
        destination = selected_result[0][3]
        train_type = selected_result[0][4]
        availability = selected_result[0][5]

        # Layout of Create

        col1, col2 = st.columns(2)
        with col1:
            new_train_no = st.text_input("ID:", train_no)
            new_train_name = st.text_input("Name:", train_name)
        with col2:
            new_source = st.text_input("Source:",source)
            new_destination = st.text_input("Destination:",destination)
            new_train_type = st.selectbox(train_type, ["Superfast", "Fast", "Mail"])
            new_availability = st.selectbox(availability,["Yes","No"])

        if st.button("Update Train"):
            edit_details(new_train_no, new_train_name, new_source, new_destination, new_train_type, new_availability, train_no, train_name, source, destination, train_type, availability)
            st.success("Successfully updated:: {} to ::{}".format(train_name, new_train_name))

    result2 = view_all_data()
    df2 = pd.DataFrame(result2, columns=['Train_No', 'Name', 'Source', 'Destination', 'Train_Type', 'Availability'])
    with st.expander("Updated data"):
        st.dataframe(df2)