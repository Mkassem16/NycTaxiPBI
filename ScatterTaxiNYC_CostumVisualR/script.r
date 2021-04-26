source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly");
libraryRequireInstall("data.table");
####################################################

################### Actual code ####################
dataset <- Values
dataset %>% as.data.table
Distance = dataset[,1]
Duration = dataset[,2]
Class = factor(dataset[,3])
Fare = dataset[,4]

g <-ggplot(dataset, aes(x=Distance, y=Duration,
                        color = Class,
                        size = Fare),show.legend=F) +
  
  geom_jitter(alpha=0.7, show.legend=F)+
  scale_radius()+
  scale_color_brewer(palette="Dark2")

g <- g + theme_void() +
  theme(
    line = element_blank(),
    panel.background = element_rect(fill = "transparent", colour = NA),
    plot.background = element_rect(fill = "transparent", colour = NA),
    legend.background = element_rect(fill = "transparent", colour = NA),
    legend.box.background = element_rect(fill = "transparent", colour = NA)
  )

####################################################

############# Create and save widget ###############
p = ggplotly(g);

p <- p %>%
  layout(xaxis = list(showgrid = F,
                      autotick = FALSE,
                      title = "",
                      zeroline = FALSE,
                      showline = FALSE,
                      showticklabels = FALSE),
         yaxis = list(showgrid = F,
                      autotick = FALSE,
                      title = "",
                      zeroline = FALSE,
                      showline = FALSE,
                      showticklabels = FALSE))

p <- p %>% layout(showlegend = FALSE)


internalSaveWidget(p, 'out.html');

####################################################

