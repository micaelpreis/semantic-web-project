package beans;
import java.io.*;
import java.util.*;
import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.QueryFactory;
import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.hp.hpl.jena.rdf.model.RDFNode;
import entities.*;

public class SearchBean{

    public SearchBean(){
    }

    public ArrayList<Article> getArticles(String search, String section, String subsection, String author, String tagSub, String tagOrg, String tagPer, String tagLoc) throws IOException {

    	File f = new File("/Users/micael/Documents/Universidade/eclipse/workspace/WSProject/Ontology/populated.owl");
    	InputStream in = new FileInputStream(f);

    	Model model = ModelFactory.createMemModelMaker().createModel(null);
    	model.read(in,null);
    	in.close();

		String queryString =
			"PREFIX ns: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> " +
			"PREFIX on: <http://www.semanticweb.org/micael/ontologies/2015/10/WS_Project#> " +
			"SELECT DISTINCT ?Article ?section ?subsection ?title ?abstract ?author ?url ?published_date ?subject_description ?organization ?person ?location ?image ?image_small " +
			"WHERE {" +
			"      ?Article on:section ?section . " + "FILTER regex(?section, \"" + section + "\") " +
			"      ?Article on:subsection ?subsection . " + "FILTER regex(?subsection, \"" + subsection + "\") " +
			"      ?Article on:title ?title . " +
			"      ?Article on:abstract ?abstract . " +
			"      {" +
			"      ?Article on:title ?title . " + "FILTER regex(lcase(str(?title)), \"" + search + "\") " +
			"	   } UNION {" +
			"      ?Article on:abstract ?abstract . " + "FILTER regex(lcase(str(?abstract)), \"" + search + "\") " +
			"      }" +
			"      ?Article on:author ?author . " + "FILTER regex(?author, \"" + author + "\") " +
			"      ?Article on:url ?url . " +
			"      ?Article on:published_date ?published_date . " +
			"      ?Article on:subject_description ?subject_description . " + "FILTER regex(?subject_description, \"" + tagSub + "\") " +
			"      ?Article on:organization ?organization . " + "FILTER regex(?organization, \"" + tagOrg + "\") " +
			"      ?Article on:person ?person . " + "FILTER regex(?person, \"" + tagPer + "\") " +
			"      ?Article on:location ?location . " + "FILTER regex(?location, \"" + tagLoc + "\") " +
			"      ?Article on:image ?image . " +
			"      ?Article on:image_small ?image_small . " +
			"      }" +
			"ORDER BY DESC(?published_date)";


		Query query = QueryFactory.create(queryString);

		QueryExecution qe = QueryExecutionFactory.create(query, model);
		ResultSet results = qe.execSelect();

		ArrayList<Article> articles = new ArrayList<Article>();

		while(results.hasNext()){
        	QuerySolution row = results.next();
			Iterator<String> columns = row.varNames();

			Article tmp = new Article();

			while (columns.hasNext()) {
				String columnName = columns.next().toString();
				RDFNode content = row.get(columnName);

				switch (columnName) {
	            case "Article":
	            	tmp.setId(Integer.parseInt(content.toString().split("#")[1].substring(7)));
	                break;
	            case "section":
	            	tmp.setSection(content.toString());
	                break;
	            case "subsection":
	            	tmp.setSubsection(content.toString());
	                break;
	            case "title":
	            	tmp.setTitle(content.toString());
	                break;
	            case "abstract":
	            	tmp.setAbstract_(content.toString());
	                break;
	            case "author":
	            	tmp.setAuthor(content.toString());
	                break;
	            case "url":
	            	tmp.setUrl(content.toString());
	                break;
	            case "published_date":
	            	tmp.setPublished_date(content.toString());
	                break;
	            case "subject_description":
	            	if(!content.toString().equals("")) {
	            		tmp.setSubjects_description(new ArrayList<String>(Arrays.asList(content.toString().split("##"))));
	            	}
	                break;
	            case "organization":
	            	if(!content.toString().equals("")) {
	            		tmp.setOrganizations(new ArrayList<String>(Arrays.asList(content.toString().split("##"))));
	            	}
	                break;
	            case "person":
	            	if(!content.toString().equals("")) {
	            		tmp.setPersons(new ArrayList<String>(Arrays.asList(content.toString().split("##"))));
	            	}
	                break;
	            case "location":
	            	if(!content.toString().equals("")) {
	            		tmp.setLocations(new ArrayList<String>(Arrays.asList(content.toString().split("##"))));
	            	}
	                break;
	            case "image":
	            	tmp.setImage(content.toString());
	                break;
                case "image_small":
                    tmp.setImageSmall(content.toString());
                    break;
	            default: break;
				}
			}

			articles.add(tmp);
    	}

		Iterator<Article> itr = articles.iterator();
		while(itr.hasNext()){
			Article tmp = itr.next();
		}

		qe.close();

		System.out.println("Articles Founded: " + articles.size());

		return articles;
    }

    public ArrayList<Article> getRecommendation() throws IOException {
    	ArrayList<Integer> temp = new ArrayList<Integer>();
    	ArrayList<Article> articles = new ArrayList<Article>();
    	ArrayList<Article> articlesRec = new ArrayList<Article>();
    	ArrayList<Article> articlesRandom = new ArrayList<Article>();
    	HashMap<String, Integer> counter = new HashMap<String, Integer>();
    	ArrayList<String> sections = new ArrayList<String>();
    	Random random;
    	String section;
    	int i, n, aux, size;

    	BufferedReader br = new BufferedReader(new FileReader("/Users/micael/Documents/Universidade/eclipse/workspace/WSProject/src/recommendation.txt"));
    	section = br.readLine();
    	// No Sections
		if (section == null) {
		    articlesRandom = getArticles("", "", "", "", "", "", "", "");
		    size = articlesRandom.size();
		    for(i=0;i<6;i++) {
		    	n = 0 + (int)(Math.random() * (((size-1) - 0) + 1));
		    	if(!temp.contains(n)) {
		    		articlesRec.add(articlesRandom.get(n));
		    		temp.add(n);
		    	}
		    	else {  i--; }
		    }
		}
		else {
			sections.add(section);
			while(section!=null) {
				if (counter.containsKey(section)) {
					counter.put(section, counter.get(section)+1); }
				else {
					counter.put(section, 1); }
				sections.add(section);
				section = br.readLine();
			}
			List<String> keys = new ArrayList<String>(counter.keySet());
			Collections.sort(keys, new Comparator<String>() {
			    @Override
			    public int compare(String x, String y) {
			        return counter.get(y) - counter.get(x);
			    }
			});
			// 1 Section (4 Recommended and 2 Random)
			if(counter.size()==1) {
				// Section
				Iterator it = keys.iterator();
				Object element = it.next();
				articles = getArticles("", element.toString(), "", "", "", "", "", "");
				size = articles.size();
				if(size<=4) {
					articlesRec = articles; }
				for(i=0;i<4;i++) {
			    	n = 0 + (int)(Math.random() * (((size-1) - 0) + 1));
			    	if(!temp.contains(n)) {
			    		articlesRec.add(articles.get(n));
			    		temp.add(n);
			    	}
			    	else {  i--; }
		    	}
		    	temp.clear();

		    	// Random
				articlesRandom = getArticles("", "", "", "", "", "", "", "");
				size = articlesRandom.size();
				aux = 6-articlesRec.size();
				for(i=0;i<aux;i++) {
			    	n = 0 + (int)(Math.random() * (((size-1) - 0) + 1));
			    	if(!temp.contains(n)) {
			    		articlesRec.add(articlesRandom.get(n));
			    		temp.add(n);
			    	}
			    	else {  i--; }
		    	}
			}
			// 2 Sections (3 + 2 Recommended and 1 Random)
			else if(counter.size()==2) {
				Iterator it = keys.iterator();
				// First Section
				Object element = it.next();
				articles = getArticles("", element.toString(), "", "", "", "", "", "");
				size = articles.size();
				if(size<=3) {
					articlesRec = articles;
				}
				else {
					for(i=0;i<3;i++) {
				    	n = 0 + (int)(Math.random() * (((size-1) - 0) + 1));
				    	if(!temp.contains(n)) {
				    		articlesRec.add(articles.get(n));
				    		temp.add(n);
				    	}
				    	else {  i--; }
			    	}
				}
		    	temp.clear();

		    	// Second Section
		    	element = it.next();
				articles = getArticles("", element.toString(), "", "", "", "", "", "");
				size = articles.size();
				if(size<=2) {
					articlesRec.addAll(articles);
				}
				else {
					for(i=0;i<2;i++) {
				    	n = 0 + (int)(Math.random() * (((size-1) - 0) + 1));
				    	if(!temp.contains(n)) {
				    		articlesRec.add(articles.get(n));
				    		temp.add(n);
				    	}
				    	else {  i--; }
			    	}
				}
		    	temp.clear();

		    	// Random
				articlesRandom = getArticles("", "", "", "", "", "", "", "");
				size = articlesRandom.size();
				aux = 6-articlesRec.size();
				for(i=0;i<aux;i++) {
			    	n = 0 + (int)(Math.random() * (((size-1) - 0) + 1));
			    	if(!temp.contains(n)) {
			    		articlesRec.add(articlesRandom.get(n));
			    		temp.add(n);
			    	}
			    	else {  i--; }
		    	}
			}
			// 3 or More Sections (3 + 2 + 1 Recommended)
			else {
				System.out.println("3 Sections");
				Iterator it = keys.iterator();
				// First Section
				Object element = it.next();
				articles = getArticles("", element.toString(), "", "", "", "", "", "");
				size = articles.size();
				if(size<=3) {
					articlesRec = articles;
				}
				else {
					for(i=0;i<3;i++) {
				    	n = 0 + (int)(Math.random() * (((size-1) - 0) + 1));
				    	if(!temp.contains(n)) {
				    		articlesRec.add(articles.get(n));
				    		temp.add(n);
				    		System.out.println("First Section");
				    	}
				    	else {  i--; }
			    	}
				}
		    	temp.clear();

		    	// Second Section
		    	element = it.next();
				articles = getArticles("", element.toString(), "", "", "", "", "", "");
				size = articles.size();
				if(size<=2) {
					articlesRec.addAll(articles);
				}
				else {
					for(i=0;i<2;i++) {
				    	n = 0 + (int)(Math.random() * (((size-1) - 0) + 1));
				    	if(!temp.contains(n)) {
				    		articlesRec.add(articles.get(n));
				    		temp.add(n);
				    		System.out.println("Second Section");
				    	}
				    	else {  i--; }
			    	}
				}
		    	temp.clear();

		    	// Third Section
				element = it.next();
				articles = getArticles("", element.toString(), "", "", "", "", "", "");
				size = articles.size();
				for(i=0;i<1;i++) {
			    	n = 0 + (int)(Math.random() * (((size-1) - 0) + 1));
			    	if(!temp.contains(n)) {
			    		articlesRec.add(articles.get(n));
			    		temp.add(n);
			    		System.out.println("Third Section");
			    	}
			    	else {  i--; }
		    	}
			}
		}

    	return articlesRec;
    }

    public void addToHistory(String section) {
    	try {
		    String filename= "/Users/micael/Documents/Universidade/eclipse/workspace/WSProject/src/recommendation.txt";
		    FileWriter f = new FileWriter(filename,true);
		    f.write(section + "\n");
		    f.close();
		} catch(IOException e) {
		    System.err.println("IOException: " + e.getMessage());
		}
    }
}
