library(cranlogs)
df<-cran_top_downloads("last-month")

library(treemapify)
library(ggplot2)
library(RColorBrewer)
png(file="cranlog.png", width = 800, height = 700)
ggplot(df, aes(area = count, fill = package, label = paste(package,"\n", prettyNum(count,big.mark=",")))) +
  geom_treemap() +
  geom_treemap_text(fontface = "bold",
                    colour = "white",
                    place = "centre",
                    size = 20) +
  labs(title ="Top downloaded packages from the RStudio CRAN mirror") +
  labs(subtitle ="The last month for which data is available (2023-03-02 to 2023-03-31)") +
  labs(caption ="#30DayChartChallenge | Data source: https://cranlogs.r-pkg.org | Visualization by @fblpalmeira") +
  scale_fill_brewer(palette="Paired") +
  theme(plot.title = element_text(size=30))+
  theme(plot.subtitle = element_text(size=20))+
  theme(plot.caption = element_text(size=18))+
  theme(legend.position="none")
dev.off()
