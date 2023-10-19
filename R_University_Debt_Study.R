college = read.csv("college_debt.csv")
college$Debt = as.integer(gsub("[\\$,]", "", college$Debt))

library(ggplot2)

ggplot(data=college, aes(x=Debt, y="", fill=Status)) + 
  geom_boxplot()+
  facet_wrap(~Status)+
  
  theme(plot.title = element_text(vjust =-100, hjust=.5),
        panel.spacing = unit(1, "cm"),
        legend.position = "none",
        axis.title.x=element_text(hjust=0.5),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        plot.margin=margin(t=2,r=0,b=2,l=2,unit="cm"))+
  ylab("")+
  xlab(" Average Debt")+
  ggtitle("Figure 1. Boxplot of Average Debt for Small and Large Private Universities \n")

ggplot(data = college, aes(sample=Debt)) +
  geom_qq() + 
  geom_qq_line(color="red") + 
  facet_wrap( ~ Status)+
  
  theme(plot.title = element_text(vjust =-100, hjust=.5),
        panel.spacing = unit(1, "cm"),
        legend.position = "none",
        axis.title.x=element_text(hjust=0.5),
        axis.title.y=element_text(angle=0),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        plot.margin=margin(t=2,r=-1,b=2,l=0,unit="cm"))+
  ggtitle("Figure 2. Q-Q plots of the sample data\n")+
  xlab("Normal theoritical quantiles")+
  ylab("Sample data\n quantiles")

tapply(college$Debt,college$Status, sd)

t.test(college$Debt~college$Status,
       alternative=c("greater"),
       mu=0,paired=F,var.equal=T)

tapply(college$Debt,college$Status, mean)