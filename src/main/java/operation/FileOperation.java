package operation;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.Part;

public class FileOperation {
	private final String IMAGEPATH = "images/";
	private HttpServlet servlet;
	
	public FileOperation(HttpServlet servlet) {
		this.servlet = servlet;
	}
	
	public String getImagePath() {
		return IMAGEPATH;
	}
	
	private String getRealPath() {
		return servlet.getServletContext().getRealPath(IMAGEPATH);
	}
	
	public void saveFile(Part part) {
		String fileName = part.getSubmittedFileName();
		String svFileName = getRealPath() + fileName;
		
		try {
			File f = new File(getRealPath());
			if(!f.exists()) {
				f.mkdir();
			}
			part.write(svFileName);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	public List<String>getFiles(){
		List<String>list = new ArrayList<String>();
		File fileObject = new File(getRealPath());
		File[] files = fileObject.listFiles();
		if(files == null) {
			list = null;
		}else {
			for(File file:files) {
				list.add(file.getName());
			}
		}
		return list;
	}
	
	public void deleteFile(String[]files) {
		for(String file:files) {
			Path p = Paths.get(getRealPath()+file);
			try {
				Files.delete(p);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

}
