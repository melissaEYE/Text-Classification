#Group Project Addendum
#Written by Group 3
#Group 3 (Samuel Adebayo, Tegan Classens, Melissa Hunfalvay, Patrick Mugwanja)
#Data 630, Summer Semester 2021
#UMGC


###########################################################################################
# Sentiment Analysis Script for Individual Provinces
# Remember to install sentimentr package before running this script
#Remove two variables that only contain null values
HotelReviews$reviews.doRecommend<-NULL
HotelReviews$reviews.id<-NULL
HotelReviews$address<-NULL
HotelReviews$categories<-NULL
HotelReviews$postalCode<-NULL
HotelReviews$reviews.dateAdded<-NULL
HotelReviews$reviews.username<-NULL
HotelReviews$reviews.title<-NULL
HotelReviews$reviews.userCity<-NULL
HotelReviews$reviews.userProvince<-NULL
HotelReviews$reviews.date<-NULL
HotelReviews$latitude<-NULL
HotelReviews$longitude<-NULL

# Rounding the variable review.rating to a whole number
HotelReviews$reviews.rating <- round(HotelReviews$reviews.rating, digit =0)


# creating a subset dataset for CA, FL, and TX

HotelReviews_CA<-subset.data.frame(HotelReviews, HotelReviews$province=="CA")
HotelReviews_FL<-subset.data.frame(HotelReviews, HotelReviews$province=="FL")
HotelReviews_TX<-subset.data.frame(HotelReviews, HotelReviews$province=="TX")
View(HotelReviews_CA)



# TEXAS hotels barplot

senttx <- HotelReviews_TX

senttx %>%
  get_sentences() %>%
  sentiment() -> hr_sentitx

View(hr_sentitx)

hr_sentitx %>%
  ggplot()+geom_density(aes(sentiment))


hr_sentitx %>%
  mutate (polarity_level = ifelse(sentiment > 0, "Positive", "Negative")) %>%
  count(name, polarity_level) %>%
  ggplot()+ geom_col(aes(y=name,x=n,fill= polarity_level))+
  theme_minimal()

# CALIFORNIA Hotels barplot

sentica <- HotelReviews_CA

sentica %>%
  get_sentences() %>%
  sentiment() -> hr_sentica

View(hr_sentica)

# hr_sentica %>%
#  get_sentences() %>%
#  sentiment_by(by=c("name","reviews.rating"))

#hr_sentica %>%
#  ggplot()+ geom_boxplot(aes(y = name,x = sentiment))

hr_sentica %>%
  mutate (polarity_level = ifelse(sentiment > 0, "Positive", "Negative")) %>%
  count(name, polarity_level) %>%
  ggplot()+ geom_col(aes(y=name,x=n,fill= polarity_level))+
  theme_minimal()



# Florida hotels barplot

sentifl <- HotelReviews_FL

sentifl %>%
  get_sentences() %>%
  sentiment() -> hr_sentifl


hr_sentifl %>%
  ggplot()+geom_density(aes(sentiment))

#hr_sentifl %>%
#  ggplot()+ geom_boxplot(aes(y = name,x = sentiment))

hr_sentifl %>%
  mutate (polarity_level = ifelse(sentiment > 0, "Positive", "Negative")) %>%
  count(name, polarity_level) %>%
  ggplot()+ geom_col(aes(y=name,x=n,fill= polarity_level))+
  theme_minimal()

##################################################################################################