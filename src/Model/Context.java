package Model;

import java.sql.*;
import java.util.Properties;


public class Context{
    public static Connection con = null;
    public static ResultSet rs = null;
    public static Statement st = null;


    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://localhost/projeto2";
        Properties props = new Properties();
        props.setProperty("user","postgres");
        props.setProperty("password","sql");
        if (con == null){
            con = DriverManager.getConnection(url, props);
        }
        st = con.createStatement();
        return con;
    }

}
