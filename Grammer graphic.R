# Grammer graphic****

#Movies..
setwd("C:\\r_studio\\XYZ")


getwd()



movies<-read.csv("Movie-Ratings.csv")

View(movies)

head(movies)

colnames(movies)
 

colnames(movies)<-c("Film","Genre","CriticRating","AudienceRating",
                   "BudgetMillions","Year")

colnames(movies)


head(movies)


tail(movies)


str(movies)

summary(movies)

summary(movies$Year)

str(movies$Year)

movies$Year<-factor(movies$Year)

summary(movies$Year)

summary(movies)

str(movies)


#****
#---Aesthetics


library(ggplot2)

head(movies)

#Aesthetics is how u set ur data

# v wnat CR on Bottom
#this will gv us empty plot


ggplot(data = movies,aes(x = CriticRating, y = AudienceRating))


#here v add geometry layer

ggplot(data = movies,aes(x = CriticRating, y = AudienceRating,size=1))+geom_point()

#inxtadd color ,it automatically creates legend

ggplot(data = movies,aes(x = CriticRating, y = AudienceRating,colour=Genre,size=1))+geom_point()

ggplot(data = movies,aes(x = CriticRating, y = AudienceRating,colour=Genre,size=BudgetMillions))+geom_point()

ggplot(data = movies,aes(x = CriticRating, y = AudienceRating,colour=Genre,size=Genre))+geom_point()

#what is the issue with the abve

#now notice bigger bubbles r bigger budget movies

#and vice versa

#***

#what is geometry

#in env selct p and expand it and ntc a bunch of vars
#it show a lot of objs

ggplot(data = movies,aes(x=CriticRating,y=AudienceRating))


#here V r adding geom layer or overlaying it with points

p<-ggplot(data = movies,aes(x=CriticRating,y=AudienceRating))

p+geom_point() # geom is used to create scatterplots

#lines

#lines geom is used to create scatterplots

p+geom_line() #does this make sense

#multiple layers

p+geom_point()+geom_line()

p+geom_line()+geom_point()



#---overriding aesthetics
#q<-ggplot(data=movies,aes(x=CritinRating,y=AudienceRating,colour=Genre,size=BudgetMillions))

q<-ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,colour=Genre,size=BudgetMillions))

q

#add geom layer

q+geom_point()

#here geom layer is said to be inheriting aesthetics from

#q aes r x,y,colour,size

#override

#here v r overriding aes
#the size has been overridden by the new mapping
#of size

q+geom_point(aes(size=CriticRating))

#ntc the colour is diff it is automatically picked up
q+geom_point(aes(colour=BudgetMillions))



#q remains the same
#actually q stays the same
#but the geom_point is overridden

q+geom_point()


#heere v can override X & y
#q+geom_point(aes(x=BudgetMillions))
#ntc the x axis say critic rating

"q<-ggplot(data = movies,

    aes(x=CriticRating,
    
       y=AudienceRating,
       
         colour=Genre,size=BudgetMillions))
"
#so v give the xlab

q+geom_point(aes(x=BudgetMillions))+xlab("Budget in Million$$$")


#ntc the budget does not really affect the rating

#of a movie if it is big or not

# v can also save this as a image

#****

# this is the plot with 2 layers


q+geom_line()+geom_point()

# v can reduce the size of line

q+geom_line(size=1)+geom_point()

#Mapping vs setting

r<-ggplot(data = movies,aes(x=CriticRating,y=AudienceRating))

r+geom_point()

#1.Mapping
#here v r mapping a color to a var


r+geom_point(aes(colour=Genre))

#Colors()
#2.setting
# here v r setting a color to a phy color

r+geom_point(colour="DarkGreen")

# mapping is generally hard to remember than setting

#Error

r+geom_point(aes(colour="DarkGreen"))

#Mapping

r+geom_point(aes(size=BudgetMillions))



#2.Setting 

r+geom_point(size=10)
#Err


r+geom_point(aes(size=100))

#ntc size is not really 10 here

#Histograms
#v will start with one var

s<-ggplot(data=movies,aes(x=BudgetMillions))

s+geom_histogram(binwidth = 10)

#there r rghly 122 movies with a budget of 120 mill 



s+geom_histogram(binwidth = 5)



s+geom_histogram(binwidth = 50)


#ntc the new var count is generated by R

#and it is aggregating for us

#****

#add colour


s+geom_histogram(binwidth = 10,fill="green")

#this is setting

#this mapping


s+geom_histogram(binwidth = 10,aes(fill=Genre))

#add a border

s+geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black")

#***

s+geom_histogram(binwidth = 10,colour="Black")

colors()

#layer tips

t<-ggplot(data = movies,aes(x=AudienceRating))

t+geom_histogram(binwidth = 10,fill="White",colour="blue")

#another way is 

# it is the same result 
# v r overriding the aesthetic here

t+geom_histogram(binwidth = 10,aes(x=CriticRating),fill="White",colour="blue")

# so here v don't have to recreate the 
# t var

#****

t<-ggplot()

#this is called a skeleton

#statistical layer & transoformations

#****

?geom_smooth


# allows us to observe trends & reletionships

#that r not easily shown




u<-ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))

u+geom_point()+geom_smooth()

#not v meaningful

# so lets not fill it

u+geom_point()+geom_smooth(fill=NA,size=2)

#ntc Romance

#lly ntc for Action movies

# so these r the patterns


mvs<-movies[movies$Genre=='Action',]


head(mvs)

u2<-ggplot(data = mvs,aes(x=CriticRating,y=AudienceRating,colour=Genre))


u2+geom_point()+geom_smooth(fill=NA,size=2)


mvs2<-movies[movies$Genre=='Action' | movies$Genre=='Adventure',]

head(mvs2)


u2<-ggplot(data = mvs2,aes(x=CriticRating,y=AudienceRating,colour=Genre))

u2+geom_point()+geom_smooth(fill=NA,size=2)



#boxplots


u<-ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))


# u+ geom_boxplot()

u+geom_boxplot(size=1.2)

#***

u+geom_boxplot(size=1.2)+geom_point()

# so a tip

u+geom_boxplot(size=1.2)+geom_jitter()

#  v can get an idea where the pts fall

#another way is


u+geom_jitter()+geom_boxplot(size=1.2,alpha=0.5)

u+geom_jitter()+geom_boxplot(size=1.2,alpha=0.9)

#alpha is transparency
#ntc the horror is v riskiest business
#it is v low
#Drama & Romance r also v good
#****


v<-ggplot(data = movies,aes(x=BudgetMillions))

v+geom_histogram(binwidth = 10,aes(fill=Genre))

#ntc it is blurry
#u<-ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))

v+geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black")

#facets

v+geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black")+facet_grid(Genre~.)

#Genre is the rows on the left

v+geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black")+
  facet_grid(Genre~.,scales = "free")

#***


w<-ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))


# w+geom_point(size=3)

w+geom_point(size=3)+facet_grid(.~Year)

w+geom_point(size=3)+facet_grid(Genre~Year)

#ntc v hv yrs in the cols
#and the genres in the rows

?ggplot

w<-ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))



# w+geom_point(size=3)

w+geom_point(size=3)+facet_grid(.~Year)

#lets also add another layer
#w+geom_point(size=3)+facet_grid(Genre~Year)+geom_smooth()
#ntc v hv a smoother inside each of em
#and ntc the trends
#lets add budget

w+geom_point(aes(size=BudgetMillions))+facet_grid(Genre~Year)+
  geom_smooth(fill=NA)


#ntc the size of the pts reprsent the budget

#----Coords

#limits

#Zoom

#Library(ggplot2)

m<-ggplot(data = movies,aes(x=CriticRating,y=AudienceRating, 
                            size=BudgetMillions,colour=Genre))

m+geom_point()

#say v wanna visualize only the movies with highest rating
#50 to 100 for critic&audience say

m+geom_point()+xlim(50,100)

#notice 50 is the lowest and 100 is the highest
#ntc the warning msg removed 304 rows

#not only did v zoom in but also removed the data


m+geom_point()+xlim(50,100)+ylim(50,100)

#but it wont work well always


n<-ggplot(data = movies,aes(x=BudgetMillions))

n+geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black")

n+geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black")+ylim(50,100)

n+geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black")+ylim(0,50)

#instead -zoom

n+geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black")+
  coord_cartesian(ylim=c(0,50))            

#improve#1

w<-ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))


w+geom_point(aes(size=BudgetMillions))


w+geom_point(aes(size=BudgetMillions))+facet_grid(Genre~Year)+geom_smooth()+
  coord_cartesian(ylim = c(0,100))


"w+geom_point(aes(size=BudgetMillions))+facet_grid(Genre~Year)+geom_smooth()+
  coord_cartesian(ylim = c(0,100))
"

w+geom_point(aes(size=BudgetMillions))+facet_grid(Genre~Year)+geom_smooth()+
  coord_cartesian(ylim = c(0,50))

# v can draw many insights frm this chart

#--adding themes

#formatting of the text ,colors label position

#***

o<-ggplot(data = movies,aes(x=BudgetMillions))

h<-o+geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black")

h


#axes label
#h+xlab("Money Axis")

h+xlab("Money Axis")+ylab("Num of Movies")

#label format

h+xlab("Money Axis")+ylab("Num of Movies")+
  theme(axis.title.x = element_text(colour = "DarkGreen",size = 30),
        axis.title.y = element_text(colour = "Red",size = 30))

#tick mark formating

h+xlab("Money Axis")+ylab("Num of Movies")+
  theme(axis.title.x = element_text(colour = "DarkGreen",size = 30),
        axis.title.y = element_text(colour = "Red",size = 30),
        axis.text.x = element_text(size = 20),axis.text.y = element_text(size = 20))


?theme


#legend format


h+xlab("Money Axis")+ylab("Num of Movies")+
  theme(axis.title.x = element_text(colour = "DarkGreen",size = 30),
        axis.title.y = element_text(colour = "Red",size = 30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 20))

h+xlab("Money Axis")+ylab("Num of Movies")+
  theme(axis.title.x = element_text(colour = "DarkGreen",size = 30),
        axis.title.y = element_text(colour = "Red",size = 30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 20),legend.position = c(1,1))



h+xlab("Money Axis")+ylab("Num of Movies")+
  theme(axis.title.x = element_text(colour = "DarkGreen",size = 30),
        axis.title.y = element_text(colour = "Red",size = 30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 20),
        legend.position = c(1,1),legend.justification = c(1,1))


#put legend in top rt corner inthe top rt corner of the chat

#title


h+xlab("Money Axis")+ylab("Num of Movies")+ggtitle("Movie Budget Distribution")+
  theme(axis.title.x = element_text(colour = "DarkGreen",size = 30),
        axis.title.y = element_text(colour = "Red",size = 30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 20),
        legend.position = c(1,1),legend.justification = c(1,1))


#nct the title is small

#h+xlab("Money Axis")+ylab("Num of Movies")+ggtitle("Movie Budget Distribution")+
 # theme(axis.title.x = element_text(colour = "DarkGreen",size = 30),
  #      axis.title.y = element_text(colour = "Red",size = 30),
   #     axis.text.x = element_text(size = 20),
    #    axis.text.y = element_text(size = 20),
     #   legend.title = element_text(size = 30),
      #  legend.text = element_text(size = 20),
       # legend.position = c(1,1),legend.justification = c(1,1),
        # plot.title = element_text(colour = "DarkBlue",size = 40,family = "Courier"))
       

h+xlab("Money Axis")+ylab("Num of Movies")+ggtitle("Movie Budget Distribution")+
  theme(axis.title.x = element_text(colour = "DarkGreen",size = 30),
        axis.title.y = element_text(colour = "Red",size = 30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 20),
        legend.position = c(1,1),legend.justification = c(1,1))
