setwd("~/KoborLab/kobor_space/zdong/T2T/Array-based/EWAS_cancer/Figure/Pangenome_cancer-driver")
## After get all the values then generate the plot
require(ggpubr)
require(stringr)
dfm<-read.csv("all.txt",header=T,sep='\t')
# dfm$group <- factor(dfm$group, levels = c(1,0))
# dfm$cyl <- factor(dfm$cyl, levels = c('MCC vs SCC','MCC vs NCC'))
p<-ggdotchart(dfm, x = "name", y = "mpg",
              color = c('#548235'),#shape ="group",
              dot.size = 4,
              #palette = "Set1",
              rotate = TRUE,ylab="Fold enrichment",
              sorting = "descending",
              ggtheme = theme_bw()
)+
  # geom_point(aes(shape=factor(group)))+
  scale_shape_manual(values=c(19,1) , guide = "none")+
  theme(legend.position = "top",axis.title.x = element_text(size=12),
        axis.title.y=element_blank(),axis.text = element_text(size=12),
        legend.title =element_blank(),legend.text = element_text(size=12)
  )+
  #scale_y_continuous(breaks = sort(c(seq(0, 20,length.out=5), 1)))+
  scale_x_discrete(labels=function(dfm) str_wrap(dfm,width = 39))+
  scale_y_continuous(limits = c(1.7, 2.1))#+
# scale_colour_manual(values=c("#D95F02","#7570B3"))
ggsave("Enrichmen_cancer_driver_array_pan.pdf",p, width=2.8, height=6.5)