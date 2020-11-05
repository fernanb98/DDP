# Names of the 35 delegations across Mexico
delegaciones<-c("National"="0",
                "Aguascalientes"="1",
                "Baja California"="2",
                "Baja California Sur"="3",
                "Campeche"="4",
                "Chiapas"="5",
                "Chihuahua"="6",
                "Coahuila"="7",
                "Colima"="8",
                "DF Norte"="9",
                "DF Sur"="10",
                "Durango"="11",
                "México Oriente"="12",
                "México Poniente"="13",
                "Guanajuato"="14",
                "Guerrero"="15",
                "Hidalgo"="16",
                "Jalisco"="17",
                "Michoacán"="18",
                "Morelos"="19",
                "Nayarit"="20",
                "Nuevo León"="21",
                "Oaxaca"="22",
                "Puebla"="23",
                "Querétaro"="24",
                "Quintana Roo"="25",
                "San Luis Potosí"="26",
                "Sinaloa"="27",
                "Sonora"="28",
                "Tabasco"="29",
                "Tamaulipas"="30",
                "Tlaxcala"="31",
                "Veracruz Norte"="32",
                "Veracruz Sur"="33",
                "Yucatán"="34",
                "Zacatecas"="35")

ui<-fluidPage(
  h1("Nurseries 2019 user satisfaction survey", align="center"),
  h2("Mexico Social Security Institute", align="center"),
  sidebarLayout(
    # User can select view data for a particular Delegation
    # National data also available
    sidebarPanel(
      selectInput(inputId="delegacion", label="Delegation", choices=delegaciones,selected="0"),
      tableOutput("deleg_totals")
    ),
    mainPanel(
      tableOutput("plot_satnurseries")
    )
  )
)
