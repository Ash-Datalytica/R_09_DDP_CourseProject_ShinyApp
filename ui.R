shinyUI(pageWithSidebar(
    headerPanel("MNIST Digits: written digits recognition"),
    sidebarPanel(
        sliderInput('caseNo', 'Select number of test case',value = 4501, min = 1, max = 10000, step = 1)
    ),
    mainPanel(
        strong("Instructions"),
        p("This application recognises written digits. It works with the famous MNIST dataset which 
            contains 70000 images of written digits. Each image is 28 x 28 pixels, 256 grayscale colour. 
            The dataset is split into training (60 000 images) and testing (10 000 images) parts."),
        p("The application has build-in prediction Model which was trained on the training part of MNIST dataset. 
          Expected prediction accuracy is ~ 92%. "),
        p("You can choose one of the testing samples by selecting number of a test image from the testing subset.
          Use the slider in the left panel to do it. Then the application shows in the right panel: 
            the choice made, image of selected digit and the Model's prediction ."),
        strong("Results"),
        textOutput('caseNo'),
        plotOutput('digit', width="100%", height="100%"),
        textOutput('textReal'),
        textOutput('textPredicted')
    )
))
