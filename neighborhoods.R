neighborhoods = read.csv("neighborhoods.csv")
neighborhoods = unique(neighborhoods)
str(neighborhoods)
distances = dist(neighborhoods[2:3], method="euclidian")
clusterNeighborhoods = hclust(distances, method="ward.D")
plot(clusterNeighborhoods)
clusterGroups = cutree(clusterNeighborhoods, k=16)
neighborhoods['cluster'] <- clusterGroups

neighborhoods
tapply(neighborhoods$Latitude, clusterGroups, mean)
tapply(neighborhoods$Longitude, clusterGroups, mean)
