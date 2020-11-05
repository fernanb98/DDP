
server<-function(input,output){
  library(shiny)
  library(dplyr)
  nurseries<-read.csv("2019_nov_encalG_nacional.csv",fileEncoding="Latin1")
 # Sat1 column contains rating of each survey
 # Deleg identifies Delegation
 # Guard identifies Nursery  
  nurseries_satisfaction<-nurseries %>%
    select(Sat1,Deleg,Guard) %>%
    #Ratings not in 1:6 are capture errors
    filter(Sat1 %in% c(1:6)) %>%
    # Source file Sat1 column is integer
    mutate(Satisfaction=as.factor(Sat1))
           
  # Assign names to each rating level
  levels(nurseries_satisfaction$Satisfaction)<-c("Excellent","Good","Fair","Poor","Terrible","Don't know")
  output$plot_satnurseries<-renderTable({
    # Filter data for a particular Delegation
    if (input$delegacion != 0){ 
      info<-filter(nurseries_satisfaction, Deleg==input$delegacion)
    }
    # Presents all data (national)
    else {
      info<-nurseries_satisfaction
    }
    # Change Guard column name Guard by Nursery, for clarity
    # Count how many surveys are for each satisfaction rating
    info<-info%>%
          rename(Nursery=Guard) %>%
          group_by(Satisfaction,Nursery)%>%
          summarise(Count=n())
  })
  
  output$deleg_totals<-renderTable({
    # Summary data, totals for each satisfaction rating
    if (input$delegacion != 0){ 
      info<-filter(nurseries_satisfaction, Deleg==input$delegacion)
    }
    else {
      info<-nurseries_satisfaction
    }
    totals<-info %>%
      group_by(Satisfaction) %>%
      summarise(Total=n())
  })

}
