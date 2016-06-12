import rdflib
from collections import Counter

g = rdflib.Graph()
g.parse("populated.owl",format="xml")
sections = list()

res = g.query(
"""
PREFIX ns: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX on: <http://www.semanticweb.org/micael/ontologies/2015/10/WS_Project#>
SELECT ?Article ?section ?subsection ?title ?abstract ?url ?author ?published_date
?subject_description ?organization ?person ?location ?image ?image_small
WHERE {
      ?Article on:section ?section .
      ?Article on:subsection ?subsection .
      ?Article on:title ?title .
      ?Article on:abstract ?abstract .
      ?Article on:url ?url .
      ?Article on:author ?author .
      ?Article on:published_date ?published_date .
      ?Article on:subject_description ?subject_description .
      ?Article on:organization ?organization .
      ?Article on:person ?person .
      ?Article on:location ?location .
      ?Article on:image ?image .
      ?Article on:image_small ?image_small .
}
""")

l = [{
'article':str(row[0].encode('utf8')),
'section':str(row[1].encode('utf8')),
'subsection':str(row[2].encode('utf8')),
'title':str(row[3].encode('utf8')),
'abstract':str(row[4].encode('utf8')),
'url':str(row[5].encode('utf8')),
'author':str(row[6].encode('utf8')),
'published_date':str(row[7].encode('utf8')),
'subject_description':str(row[8].encode('utf8')),
'organization':str(row[9].encode('utf8')),
'person':str(row[10].encode('utf8')),
'location':str(row[11].encode('utf8')),
'image':str(row[12].encode('utf8')),
'image_small':str(row[13].encode('utf8'))
} for row in res]

for index in range(len(l)):
  print "Article " + str(index)
  print "Section: "+ l[index]['section']
  print "Subsection: " + l[index]['subsection']
  print "Title: " + l[index]['title']
  print "Abstract: " + l[index]['abstract']
  print "URL: " + l[index]['url']
  print "Author: " + l[index]['author']
  print "Published Date: " + l[index]['published_date']
  print "Subject Description: " + l[index]['subject_description']
  print "Organization: " + l[index]['organization']
  print "Person: " + l[index]['person']
  print "Location: " + l[index]['location']
  print "Image: " + l[index]['image']
  print "Image Small: " + l[index]['image_small']
  print
  print
  sections.append(l[index]['section'])

print "Numero total de articles para a pesquisa efetuada: " + str(len(l))
print
print Counter(sections)
