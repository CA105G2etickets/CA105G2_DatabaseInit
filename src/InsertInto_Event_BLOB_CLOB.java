import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class InsertInto_Event_BLOB_CLOB {
	
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "CA105G2";
	private static final String PASSWORD = "123456";
	
	public static void main(String[] args) {
		ArrayList<FolderInfo> folderList = new ArrayList<FolderInfo>();
		
					
		folderList.add(new FolderInfo("BLOB_EVENT", "EVE_NO", 7));
		folderList.add(new FolderInfo("BLOB_EVENT_TITLE", "EVETIT_NO", 5));		
		folderList.add(new FolderInfo("BLOB_VENUE", "VENUE_NO", 4));		
		folderList.add(new FolderInfo("CLOB_EVENT_TITLE", "EVETIT_NO", 5));
		folderList.add(new FolderInfo("CLOB_VENUE", "VENUE_NO", 4));		
		
		for(int i = 0; i < folderList.size(); i++) {
			
			String folderName = folderList.get(i).folderName;
			File dir = new File(folderName);
		    String files[] = dir.list(); 
		    
		    if (!dir.isDirectory()) {
		    	System.out.println("找不到 " + folderName + " 資料夾");
		    } else if (files.length == 0) {
		    	System.out.println("資料夾 " + folderName + " 沒有檔案");
		    } else {
		    	for (int j = 0; j < files.length; j++) {		    		
		    		if ("BLOB".equals(folderName.substring(0, 4))) {
		    			writeBLOB(folderName, files[j], folderList.get(i).pkName, folderList.get(i).pkNameLength);
		    		} else {
		    			writeCLOB(folderName, files[j], folderList.get(i).pkName, folderList.get(i).pkNameLength);		    			
		    		}		    			
		    	}
		    }
		}
		
		System.out.println("完成BLOB和CLOB的更新");		
	}
	
	
	
	
	public static void writeCLOB(String dirName, String fileName, String pkName, int pkNameLength) {		
		
		String pkNO = fileName.substring(0, pkNameLength);
		String columnName = fileName.substring(pkNameLength+1, fileName.length()-4);
		String tableName = dirName.substring(5);
				
		StringBuilder sb = new StringBuilder();
		
		String SQL = sb.append("UPDATE ").append(tableName).append(" SET ").append(columnName).append(" = ? ").append("WHERE ").append(pkName).append(" = ?").toString();
				
		Connection con = null;
		PreparedStatement pstat = null;	
		Reader reader = null;
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstat = con.prepareStatement(SQL);
			
			pstat.setString(2, pkNO);
			
			File inputFile = new File(dirName + "/" + fileName);
			
			reader = new FileReader(inputFile);	
			pstat.setCharacterStream(1, reader);
			
			pstat.executeUpdate();
			
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} catch(IOException ie){
			ie.printStackTrace();
		} finally {
			if(reader != null) {
				try {
					reader.close();
				} catch (IOException se){
					se.printStackTrace();
				}
			}
			if(pstat != null) {
				try {
					pstat.close();
				} catch (SQLException se){
					se.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException se){
					se.printStackTrace();
				}
			}
		}
	}
	
	public static void writeBLOB(String dirName, String fileName, String pkName, int pkNameLength) {
		
		String pkNO = fileName.substring(0, pkNameLength);
		String columnName = fileName.substring(pkNameLength+1, fileName.length()-4);
		String tableName = dirName.substring(5);
		
		StringBuilder sb = new StringBuilder();		
		String SQL = sb.append("UPDATE ").append(tableName).append(" SET ").append(columnName).append(" = ? ").append("WHERE ").append(pkName).append(" = ?").toString();
				
		Connection con = null;
		PreparedStatement pstat = null;		
		FileInputStream fis = null;	
		ByteArrayOutputStream baos = null;
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstat = con.prepareStatement(SQL);
			
			pstat.setString(2, pkNO);
					
			File inputFile = new File(dirName + "/" + fileName);
			fis = new FileInputStream(inputFile);	
			
			baos = new ByteArrayOutputStream();
			
			int i;
			while ((i = fis.read()) != -1) {
				baos.write(i);
			}
				
			byte[] picByte = baos.toByteArray();
			pstat.setBytes(1, picByte);
						
			pstat.executeUpdate();
			
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} catch(IOException ie){
			ie.printStackTrace();
		} finally {
			if(fis != null) {
				try {
					fis.close();
				} catch (IOException se){
					se.printStackTrace();
				}
			}
			if(baos != null) {
				try {
					baos.close();
				} catch (IOException se){
					se.printStackTrace();
				}
			}
			if(pstat != null) {
				try {
					pstat.close();
				} catch (SQLException se){
					se.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException se){
					se.printStackTrace();
				}
			}
		}
	}
	
}





class FolderInfo{
	
	String folderName;
	String pkName;
	int pkNameLength;
	
	FolderInfo(){
		
	}
	
	FolderInfo(String folderName, String pkName, int pkNameLength){
		this.folderName = folderName;
		this.pkName = pkName;
		this.pkNameLength = pkNameLength;
	}
		
}


