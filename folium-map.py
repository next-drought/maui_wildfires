
import gradio as gr
from gradio_folium import Folium
from folium import Map
import pandas as pd
import pathlib

df = pd.read_csv(pathlib.Path(__file__).parent / "cities.csv")

def select(df, data: gr.SelectData):
    row = df.iloc[data.index[0], :]
    return Map(location=[row['Latitude'], row['Longitude']])

with gr.Blocks() as demo:
    gr.Markdown(("# 🗺️ Explore World Capitals with Gradio and Folium\n"
                 "Install this custom component with `pip install gradio_folium`"))
    map = Folium(value=Map(location=[25.7617, -80.1918]), height=400)
    data = gr.DataFrame(value=df, height=200)
    data.select(select, data, map)

demo.launch()
