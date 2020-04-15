import requests
url = "http://webservice.hobolink.com/restv2/data/custom/file"
res = requests.post(url, json={"query":"ReST_Query",
                         "authentication":{"password":"#Cr2792",
                                           "user":"crwa",
                                           "token":"YeXsAq7OLy"}})
print(res.text);
