import streamlit as st
import numpy as np
import pandas as pd

st.title('My First Application in Streamlit')

st.markdown(
    """
    ### Learning Streamlit, see the code on my github [here]()
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

