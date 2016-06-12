import json
import rdflib
import urllib2
from sys import argv

g = rdflib.Graph()
g.parse("ontology.owl",format="xml")
link = "http://www.semanticweb.org/micael/ontologies/2015/10/WS_Project"
files = ["arts", "business", "dining", "fashion", "health", "home", "magazine", "national", "opinion", "politics", "realestate", "sports", "technology", "travel", "world"]
request = "http://api.nytimes.com/svc/topstories/v1/"
key = "d449a1033c6b3afad30174090fe09dfb:9:73580553"
n = 0
script, articles, topics = argv

# Articles
if(articles=="local"):
  print "Local Articles"
else:
  print "Actualized Articles"

# Topics
if(topics=="all"):
  print "All Topics"
  f = files
else:
  print "One Topic"
  f = [topics]

# Populate RDF
for topic in f:
  if(articles=="local"):
    with open("Data/Retrieved/" + str(topic) + ".json", 'r') as data_file:
      data = json.load(data_file)
  else:
    data = json.load(urllib2.urlopen(request + topic + ".json?api-key=" + key))

  num_results = data['num_results']
  print str(topic) + " > number of results: " + str(num_results)

  for index in range(num_results):
    n = n + 1
    article = "/Articles/#Article" + str(n)
    g.add((rdflib.URIRef(link+article),rdflib.RDF.type,rdflib.URIRef(link+"#Article")))

    # Section
    output = data['results'][index]['section']
    g.add((rdflib.URIRef(link+article), rdflib.URIRef(link+"#section"), rdflib.Literal(output.encode('utf8'))))

    # Subsection
    output = data['results'][index]['subsection']
    g.add((rdflib.URIRef(link+article), rdflib.URIRef(link+"#subsection"), rdflib.Literal(output.encode('utf8'))))

    # Title
    output = data['results'][index]['title']
    g.add((rdflib.URIRef(link+article), rdflib.URIRef(link+"#title"), rdflib.Literal(output.encode('utf8'))))

    # Abstract
    output = data['results'][index]['abstract']
    g.add((rdflib.URIRef(link+article), rdflib.URIRef(link+"#abstract"), rdflib.Literal(output.encode('utf8'))))

    # URL
    output = data['results'][index]['url']
    g.add((rdflib.URIRef(link+article), rdflib.URIRef(link+"#url"), rdflib.Literal(output.encode('utf8'))))

    # Author
    output = data['results'][index]['byline'].replace("By ", "")
    g.add((rdflib.URIRef(link+article), rdflib.URIRef(link+"#author"), rdflib.Literal(output.encode('utf8'))))

    # Published Date
    output = data['results'][index]['published_date']
    g.add((rdflib.URIRef(link+article), rdflib.URIRef(link+"#published_date"), rdflib.Literal(output.encode('utf8'))))

    # Subject Description
    output = ""
    length = len(data['results'][index]['des_facet'])
    for index2 in range(length):
      if (index2 != 0):
        output = output + "##"
      output = output + str(data['results'][index]['des_facet'][index2].partition('(')[0])
    g.add((rdflib.URIRef(link+article), rdflib.URIRef(link+"#subject_description"), rdflib.Literal(output.encode('utf8'))))

    # Organization
    output = ""
    length = len(data['results'][index]['org_facet'])
    for index2 in range(len(data['results'][index]['org_facet'])):
      if (index2 != 0):
        output = output + "##"
      output = str(data['results'][index]['org_facet'][index2].partition('(')[0])
    g.add((rdflib.URIRef(link+article), rdflib.URIRef(link+"#organization"), rdflib.Literal(output.encode('utf8'))))

    # Person
    output = ""
    length = len(data['results'][index]['per_facet'])
    for index2 in range(len(data['results'][index]['per_facet'])):
      if (index2 != 0):
        output = output + "##"
      output = str(data['results'][index]['per_facet'][index2].partition('(')[0])
    g.add((rdflib.URIRef(link+article), rdflib.URIRef(link+"#person"), rdflib.Literal(output.encode('utf8'))))

    # Location
    output = ""
    length = len(data['results'][index]['geo_facet'])
    for index2 in range(len(data['results'][index]['geo_facet'])):
      if (index2 != 0):
        output = output + "##"
      output = str(data['results'][index]['geo_facet'][index2].partition('(')[0])
    g.add((rdflib.URIRef(link+article), rdflib.URIRef(link+"#location"), rdflib.Literal(output.encode('utf8'))))

    # Image
    if(data['results'][index]['multimedia'] != ""):
      if(len(data['results'][index]['multimedia'])>=5):
        output = data['results'][index]['multimedia'][4]['url']
      else:
        output = "http://www.magicdigitalalbum.com/photos/photo-not-available.jpg"
    else:
      output = "http://www.magicdigitalalbum.com/photos/photo-not-available.jpg"
    g.add((rdflib.URIRef(link+article), rdflib.URIRef(link+"#image"), rdflib.Literal(output.encode('utf8'))))

    # Image2
    if(data['results'][index]['multimedia'] != ""):
      if(len(data['results'][index]['multimedia'])>=4):
        output = data['results'][index]['multimedia'][3]['url']
      else :
        output = "http://www.magicdigitalalbum.com/photos/photo-not-available.jpg"
    else:
      output = "http://www.magicdigitalalbum.com/photos/photo-not-available.jpg"
    g.add((rdflib.URIRef(link+article), rdflib.URIRef(link+"#image_small"), rdflib.Literal(output.encode('utf8'))))

# Print Results
print "Number of Articles: " + str(n)

# Save Results
f = open("populated.owl","wb")
f.write(g.serialize(format='xml'))
f.close()
