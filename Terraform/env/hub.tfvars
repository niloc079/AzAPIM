#
#Env Variables
environment                    = "hub"         #Hub, Prd, Stg, Dev, Tst, Idp
application                    = "apm"         #net, app, ads
location                       = "centralus"   #Azure Location
iteration                      = ""            #Numeric
application_owner              = "Mark Brendanawicz"
deployment_source              = "terraform"
#
#Tags
tags =  {
environment                    = "hub"         #Hub, Prd, Stg, Dev, Tst, Idp
application                    = "apm"         #net, app, ads
location                       = "centralus"   #Azure Location
iteration                      = ""            #Numeric
application_owner              = "Mark Brendanawicz"
deployment_source              = "terraform"
        }
#
#Custom
AzAPIM_publisher_email         = "test@parksandrec.com"
AzAPIM_sku                     = "Developer_1"     # Consumption Developer_1 Basic Standard Premium 
