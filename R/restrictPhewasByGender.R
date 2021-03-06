restrictPhewasByGender <- function(phenotypes,id.gender) {
  data=merge(phenotypes,id.gender,by=names(id.gender)[1],all.x=T)
  #Get the column of the gender
  g=dim(data)[2]
  #Get the restrictions found in the phenotypes data frame
  current_gender_restriction=gender_restriction[gender_restriction$phewas_code %in% names(phenotypes)[-1],]
  #Get male and female-only phenotypes
  male_only=current_gender_restriction[current_gender_restriction$male_only,"phewas_code"]
  female_only=current_gender_restriction[current_gender_restriction$female_only,"phewas_code"]
  #Set row column matches to NA where inds of a gender meet restricted phenotypes
  data[data[,g]=="M",female_only]=NA
  data[data[,g]=="F",male_only]=NA

  #Return everything, sans gender
  data[,-g]
}