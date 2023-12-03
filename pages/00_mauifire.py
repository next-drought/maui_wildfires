import solara


@solara.component
def Page():
    with solara.Column(align="center"):
        markdown = """
        ## A Web App for Visualizing [Maui Fire Related Open Data](https://www.maxar.com/open-data)
        
        ### Introduction

        **A collection of [Solara](https://github.com/widgetti/solara) web apps for maui fire.**

        - Web App: <**>
        - GitHub: <**>
        - Hugging Face: <**>

        """

        solara.Markdown(markdown)

    