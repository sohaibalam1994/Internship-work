installed.packages("ropenaq")

library("ropenaq")
aq_latest(country = "IN")

Pune_locations <- aq_locations(
  city = 'Pune',
  country = 'IN',
  parameter = 'pm25'
)
Pune_locations

head((Pune_locations$sourceName))

Delhi_locations <-aq_locations(
  city = "Delhi",
  country = "IN",
  parameter = "pm25"
)
Delhi_locations

head(Delhi_locations$sourceName)

head(Delhi_locations$pm25)

min(Delhi_locations$firstUpdated)

min(Delhi_locations$lastUpdated)

head(Delhi_locations$location)

head(Delhi_locations$locationURL)

result <-aq_latest(location = "Alipur%2C+Delhi+-+DPCC")

data <- aq_measurements(location = "Anand+Vihar%2C+Delhi+-+DPCC",
                        parameter = "pm25")
data <- dplyr::filter(data,value >0)

data

installed.packages("ggplot2")

installed.packages("hrbrthemes")

library("ggplot2")

ggplot(data) +
  geom_point(aes(x = dateLocal, y = value),
             col = "CornflowerBlue") +
  geom_hline(yintercept = 25,
             size = 1.2,
             col = "darkred") +
  ylab(expression(paste("PM2.5 concentration (", mu, "g/",m^3,")")))+
  xlab("Time (days)") +
  ggtitle(data$location[1]) +
  hrbrthemes::theme_ipsum(
    base_size = 16,
    axis_title_size = 16)

data <-aq_measurements(location = "Ashok+Vihar%2C+Delhi+-+DPCC",parameter = "so2")

data<-dplyr::filter(data, value >0 )

ggplot(data) +
  geom_point(aes(x = dateLocal, y = value), 
             col = "CornflowerBlue") +
  geom_hline(yintercept = 25, size = 1.2, col = "darkred") +
  ylab(expression(paste("PM2.5 concentration (", mu, "g/",m^3,")")))+
  xlab("Time (days)") +
  ggtitle(data$location[1]) +
  hrbrthemes::theme_ipsum(
    base_size = 16,
    axis_title_size = 16)

result<-aq_measurements(country = "IN")
nrows(result)

attr(result,"meta")$found


