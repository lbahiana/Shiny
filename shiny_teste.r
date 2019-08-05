#Exemplo do Livro Projetos em R

# monta interface de usuario

ui <- fluidPage(

  sliderInput(inputId = "numero",

              label = "Escolha um valor",

              value = 500,  min = 25,  max= 1000) ,
  
plotOutput("hist")

)


server < - function(input, output) {
  
  output$hist <- renderPlot({
   
    hist(runif(input$number,min=0,max=1), 
         xlab = "Valor",
        
          main=paste(input$number,"valores aleatorios entre 0 e 1"))
    
  })
  
}
  
shinyApp(ui = ui, server = server)



 #  mesmo programa com ggplot2

library(ggplot2)
library(shiny)

ui <- fluidPage(
  
  sliderInput(inputId = "numero",
              
              label = "Escolha um valor",
              
              value = 500,  min = 25,  max= 1000) ,
  
  plotOutput("hist")
  
)

# transformando a amostra em um data frame

server < -function(input, output){

outpu$hist <- renderPlot({

  df <- data.frame(runif(input$number, min =0 , max=1))

colnames(df)<- c("Value")

ggplot(df, aes(x =Value))+
  geom_histogram(color= "black", fill ="grey80")+
  labs(y = "Frequencia", 
       title = paste(input$number, "valores alaeatorios entre 0 e 1"))
})
}
