package de.uni_koeln.spinfo.drc.search;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.search.highlight.NullFragmenter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.search.highlight.SimpleSpanFragmenter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.SimpleFSDirectory;
import org.apache.lucene.util.Version;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class Searcher {

	private final StandardAnalyzer analyzer = new StandardAnalyzer(
			Version.LUCENE_42);

	private final SimpleHTMLFormatter highlightFormatter = new SimpleHTMLFormatter(
			"<strong class=\"text-info\">", "</strong>");

	private int totalHits;

	Logger logger = LoggerFactory.getLogger(getClass());

	@Test
	public void testSearch() {

		String indexDir = "index";
		String q = "daniel";
		int offset = 0;

		try {
			search(indexDir, q, offset);

		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (InvalidTokenOffsetsException e) {
			e.printStackTrace();
		}
	}

	public Map<String, String> search(String indexDir, String q, int offset)
			throws IOException, ParseException, InvalidTokenOffsetsException {

		Directory dir = new SimpleFSDirectory(new File(indexDir));
		DirectoryReader dirReader = DirectoryReader.open(dir);
		IndexSearcher is = new IndexSearcher(dirReader);

		QueryParser parser = new QueryParser(Version.LUCENE_42, "contents",
				analyzer);
		Query query = parser.parse(q);
//		logger.info("QUERY: " + query);

		// long start = System.currentTimeMillis();
		TopDocs hits = is.search(query, 5000);// 1000 best docs
		// long end = System.currentTimeMillis();

		// System.err.println("Took " + (end - start) + " ms to find "
		// + hits.totalHits + " document(s) that matched query '" + q
		// + "':");

		this.setTotalHits(hits.totalHits);
		logger.info("QUERY: " + query + " - OFFSET: "+offset+" - HITS: "+hits.totalHits);

		// pagination via offset
		Map<String, String> resultMap = new HashMap<String, String>();
		int count = Math.min(hits.scoreDocs.length - offset, 10);
		for (int i = 0; i < count; i++) {
			ScoreDoc scoreDoc = hits.scoreDocs[offset + i];
			Document doc = is.doc(scoreDoc.doc);
			// int id = hits.scoreDocs[i].doc;
			String filename = doc.get("filename");
			String content = doc.get("contents");
			String highlighted = highlight(q, content);
			resultMap.put(filename, highlighted);
		}
		dirReader.close();
		return resultMap;
	}

	public String highlight(String searchPhrase, String text)
			throws IOException, InvalidTokenOffsetsException, ParseException {

		QueryParser parser = new QueryParser(Version.LUCENE_42, "contents",
				analyzer);
		Query query = parser.parse(searchPhrase);
		QueryScorer scorer = new QueryScorer(query);
		Highlighter highlighter = new Highlighter(highlightFormatter, scorer);

		highlighter.setTextFragmenter(new SimpleSpanFragmenter(scorer, 40));// no
																			// of
																			// bytes/fragment
		StringBuilder highlight = new StringBuilder("... ");
		String[] best = highlighter.getBestFragments(analyzer, "contents",
				text, 10);
		for (int j = 0; j < best.length; j++) {
			highlight.append(best[j]);
			highlight.append((j > best.length) ? "</br>...</br>" : " ...");
		}
		return highlight.toString();
	}

	public String highlightFullPage(String searchPhrase, String text)
			throws IOException, InvalidTokenOffsetsException, ParseException {

		QueryParser parser = new QueryParser(Version.LUCENE_42, "contents",
				analyzer);
		Query query = parser.parse(searchPhrase);
		QueryScorer scorer = new QueryScorer(query);

		Highlighter highlighter = new Highlighter(highlightFormatter, scorer);
		highlighter.setTextFragmenter(new NullFragmenter());
		String best = highlighter.getBestFragment(analyzer, "contents", text);
		return best;
	}

	public int getTotalHits() {
		return totalHits;
	}

	public void setTotalHits(int totalHits) {
		this.totalHits = totalHits;
	}
}
