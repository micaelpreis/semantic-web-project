import json
from pprint import pprint
from sys import argv

script, filename = argv

# Read input file
with open("Retrieved/" + filename + ".json", 'r') as data_file:
    data = json.load(data_file)

# Print Original Data
# pprint(data)

# Create file to save
f = open("Parsed/" + filename + "_parsed.txt", 'w')

# Number of Results
num_results = data['num_results']
f.write(str(num_results) + "\n\n")

# Get Results
for index in range(num_results):
  f.write("---------- " + str(index) + " ----------\n")

  # Section
  output = data['results'][index]['section']
  f.write(output.encode('utf8') + "\n")

  # Subsection
  output = data['results'][index]['subsection']
  f.write(output.encode('utf8') + "\n")

  # Title
  output = data['results'][index]['title']
  f.write(output.encode('utf8') + "\n")

  # Abstract
  output = data['results'][index]['abstract']
  f.write(output.encode('utf8') + "\n")

  # URL
  output = data['results'][index]['url']
  f.write(output.encode('utf8') + "\n")

  # Author
  output = data['results'][index]['byline'].replace("By ", "")
  f.write(output.encode('utf8') + "\n")

  # Published Date
  output = data['results'][index]['published_date']
  f.write(output.encode('utf8') + "\n")

  # Subject Description
  length = len(data['results'][index]['des_facet'])
  f.write("--- des_facet --- " + str(length) + "\n")
  for index2 in range(length):
    output = data['results'][index]['des_facet'][index2]
    f.write(output.encode('utf8') + "\n")

  # Organization
  length = len(data['results'][index]['org_facet'])
  f.write("--- org_facet --- " + str(length) + "\n")
  for index2 in range(len(data['results'][index]['org_facet'])):
    output = data['results'][index]['org_facet'][index2]
    f.write(output.encode('utf8') + "\n")

  # Person
  length = len(data['results'][index]['per_facet'])
  f.write("--- per_facet --- " + str(length) + "\n")
  for index2 in range(len(data['results'][index]['per_facet'])):
    output = data['results'][index]['per_facet'][index2]
    f.write(output.encode('utf8') + "\n")

  # Location
  length = len(data['results'][index]['geo_facet'])
  f.write("--- geo_facet --- " + str(length) + "\n")
  for index2 in range(len(data['results'][index]['geo_facet'])):
    output = data['results'][index]['geo_facet'][index2]
    f.write(output.encode('utf8') + "\n")

print "Data parsed with success!"

# Save file
f.close()
