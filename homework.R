library(tidyverse)
library(tidycensus)
library(sf)
library(tmap)
census_api_key(" edd2da6e8ef22a79df25dd7facaf2586d859754e", overwrite = TRUE)
vars <- load_variables(2019, "acs5")
acs_vars <- c("B99233_002","B99233_005")
myTracts <- c("42101000801","42101000803","42101000804","42101001201","42101001202")
acsTractsPHL.2019.sf <- get_acs(geography = "tract",
                                year = 2019,
                                variables = acs_vars,
                                geometry = TRUE,
                                state  = "PA",
                                county = "Philadelphia",
                                output = "wide")
dplyr::select (GEOID, NAME, all_of(acs_vars))%>% 
  rename (worked.2019 = B99233_002, Notwork.2019 = B99233_005)%>%
  mutate(employeepct.2019 = worked.2019/(worked.2019 + Notwork.2019)) %>%
  mutate(Neighborhood = ifelse(GEOID %in% myTracts,
                                        "RittenhouseSquare",
                                        "REST OF PHILADELPHIA"))
acsTractsPHL.2019.sf_WGS84 <- acsTractsPHL.2019.sf %>% 
  st_transform(crs = "EPSG:4326")
st_crs(acsTractsPHL.2016.sf_WGS84)

ggplot()+
  geom_sf(data = acsTractsPHL.2019.sf, aes(fill = employeepct.2019),
          color = "transparent")+
  geom_sf(data = acsTractsPHL.2019.sf %>%
            filter(Neighborhood == "RittenhouseSquare") %>%
            st_union(),
          color = "white",
          fill = "transparent")+
  labs(
    title = "Percentage of Those Worked",
    subtitle = "Year 2019",
    caption = "Data: US Census Bureau, ACS 5-year estimates")
