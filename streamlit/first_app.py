import streamlit as st
import numpy as np
import pandas as pd
import time

st.title('My First Application in Streamlit')
"""
If you’re using Python 3, you can also write to your app without calling any Streamlit methods. Streamlit supports “magic commands,” which means you don’t have to use st.write() at all! Try replacing the code above with this snippet:
"""

st.markdown(
    """
    ### Learning Streamlit, see the code on my github [here](https://github.com/AlexanderPalencia/Data-Product/blob/master/streamlit/first_app.py)
    """
)

x=4
st.write(x, 'square is', x*x)

# Write a dataframe
st.write("Here's our first attempt at using data to create a table: with st.write function")
st.write(pd.DataFrame({
    'first column': [1, 2, 3, 4],
    'second column': [10, 20, 30, 40]
}))


st.write("You can also print a dataframe")
df = pd.DataFrame({
  'first column': [1, 2, 3, 4],
  'second column': [10, 20, 30, 40]
})

df


st.subheader("Graphs in Streamlit")
st.subheader("Line Chart")
if st.checkbox('Show Line chat'):
    chart_data = pd.DataFrame(
        np.random.randn(20, 3),
        columns=['a', 'b', 'c'])

    st.line_chart(chart_data)

st.subheader("Map Chart")
map_data = pd.DataFrame(
    np.random.randn(1000, 2) / [50, 50] + [37.76, -122.4],
    columns=['lat', 'lon'])

st.map(map_data)


st.subheader("selectbox")
option = st.selectbox(
    'Which number do you like best?',
     df['first column'])

'You selected: ', option

st.subheader("sidebar") 
add_selectbox = st.sidebar.selectbox(
    'How would you like to be contacted?',
    ('Email', 'Home phone', 'Mobile phone')
)
add_slider = st.sidebar.slider(
    'Select a range of values',
    0.0, 100.0, (25.0, 75.0)
)

st.markdown(
    """
    ## Exercise Uber Pickups [here](https://github.com/AlexanderPalencia/Data-Product/blob/master/streamlit/uber_pickups.py)
    """
)


st.subheader("slidebar") 
'Starting a long computation...'

# Initializing the variables
latest_iteration = st.empty()
bar = st.progress(0)
for i in range(100):
  # Update the progress bar with each iteration.
  latest_iteration.text(f'Iteration {i+1}')
  bar.progress(i + 1)
  time.sleep(0.1)

'...and now we\'re done!'





