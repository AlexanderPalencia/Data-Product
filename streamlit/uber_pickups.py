import streamlit as st
import pandas as pd
import numpy as np
import time

st.title('Uber Pickups')

DATE_COLUMN = 'Date/Time'
DATA_URL = ('https://s3-us-west-2.amazonaws.com/streamlit-demo-data/uber-raw-data-sep14.csv.gz')


def load_data(nrows):
    data = pd.read_csv(DATA_URL, nrows=nrows, parse_dates=[DATE_COLUMN])
    lowercase = lambda x: str(x).lower()
    data.rename(lowercase, axis='columns', inplace=True)
    return data

# Create a text element and let the reader know the data is loading.
data_load_state = st.text('Loading data...')
# Load 10,000 rows of data into the dataframe.
data = load_data(10000)
# Notify the reader that the data was successfully loaded.
data_load_state.text('Loading data...done!')

if st.checkbox('Show raw data'):
    st.subheader('Raw data')
    st.write(data)


st.subheader('Map of all pickups')

st.map(data)


st.subheader('Static filter')
hour_to_filter = 17
filtered_data = data[data['date/time'].dt.hour == hour_to_filter]
st.subheader(f'Map of all pickups at {hour_to_filter}:00')
st.map(filtered_data)

st.subheader('Dinamic filter')
hour_to_filter = st.slider('hour', 0, 23, 17)
filtered_data = data[data['date/time'].dt.hour == hour_to_filter]
st.subheader(f'Map of all pickups at {hour_to_filter}:00')
st.map(filtered_data)











