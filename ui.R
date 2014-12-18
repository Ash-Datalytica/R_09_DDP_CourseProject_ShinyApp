shinyUI(pageWithSidebar(
    headerPanel("MNIST written didits recognition"),
    sidebarPanel(
        sliderInput('caseNo', 'Select number of test case',value = 4501, min = 1, max = 10000, step = 1)
    ),
    mainPanel(
        strong("Instructions"),
        p("This application recognizes written digits. It has build-in prediction random forest
          Model which was trained on the MNIST dataset. Expected prediction accuracy is ~ 92%. This dataset also provides 10 000 test samples."),
        p("You can choose one of the testing samples 
          with the slider in the left panel and see the choice and the Model's prediction in the right panel."),
        strong("Results"),
        textOutput('caseNo'),
        plotOutput('digit', width="100%", height="100%"),
        textOutput('textReal'),
        textOutput('textPredicted')
    )
))
