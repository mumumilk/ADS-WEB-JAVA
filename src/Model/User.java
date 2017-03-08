package Model;


import java.sql.*;

public class User {
    private int Id;
    private String Name;
    private String Email;
    private String Password;
    private String C_Password;
    private String ImgPath;
    private int IdRole;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getC_Password() {
        return C_Password;
    }

    public void setC_Password(String c_password){
        C_Password = c_password;
    }

    public String getImgPath() {
        return ImgPath;
    }

    public void setImgPath(String imgPath) {
        ImgPath = imgPath;
    }

    public int getIdRole() {
        return IdRole;
    }

    public void setIdRole(int idRole) {
        IdRole = idRole;
    }


    private boolean checkFields(){

        if (this.getName().isEmpty() || this.checkEmail() == false || this.getPassword().isEmpty() || this.getC_Password().isEmpty())
            return false;

        if (!this.getPassword().equals(this.getC_Password()))
            return false;

        return true;
    }

    public boolean checkEmail(){
        int atpos = this.getEmail().indexOf("@");
        int dotpos = this.getEmail().lastIndexOf(".");

        if(atpos < 1 || dotpos < atpos+2 || dotpos+2 >this.getEmail().length()){
            return false;
        } else {
            try {
                Connection con = Context.getConnection();
                String sql  = "select email from users";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next())
                {
                    if(this.getEmail().equals(rs.getString("email"))){
                        return false;
                    }
                }
            } catch (SQLException e){
                e.printStackTrace();
            } catch (ClassNotFoundException e){
                e.printStackTrace();
            }
        }
        return true;
    }

    public boolean insert() {
        if(checkFields()){
            try {
                Connection con = Context.getConnection();
                String sql = ("insert into users (name, email, password) values (?, ?, ?);");
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, this.getName());
                ps.setString(2, this.getEmail());
                ps.setString(3, this.getPassword());
                ps.execute();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                return false;
            }
            return true;
        }
        return false;
    }

    public boolean checkLogin(){
        try {
            Connection con = Context.getConnection();
            String sql = "select count(email) from users where email = ? and password = ?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,this.getEmail());
            ps.setString(2,this.getPassword());
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                if(rs.getInt("count") != 1)
                    return false;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }

    public User getUs(String email)
    {
        User u = new User();
        try {
            Connection con = Context.getConnection();
            String  sql = ("select id, email, name, password, id_role, img_path from users where email = (?) limit 1");
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                u.setEmail(rs.getString("email"));
                u.setName(rs.getString("name"));
                u.setPassword(rs.getString("password"));
                u.setIdRole(rs.getInt("id_role"));
                u.setId(rs.getInt("id"));
                u.setImgPath(rs.getString("img_path"));
            }


            }catch (SQLException ex) {
                ex.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        return u;
    }

    public User getUser(String name, String password){
        User u = new User();
        try{
            Connection con = Context.getConnection();
            String sql = ("select email,name,password,id_role,img_path from users where email = (?) and password = (?) limit 1");
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,this.getEmail());
            ps.setString(2,this.getPassword());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                u.setEmail(rs.getString("email"));
                u.setName(rs.getString("name"));
                u.setPassword(rs.getString("password"));
                u.setIdRole(rs.getInt("id_role"));
                u.setImgPath(rs.getString("img_path"));
            }
        }
        catch (SQLException ex){
            ex.printStackTrace();
        }
        catch(ClassNotFoundException e){
            e.printStackTrace();
        }
        return u;
    }

    public boolean updateUser(User updated)
    {
        try {
            Connection con = Context.getConnection();
            String sql = ("update users set name = (?), password = (?), img_path = (?) where email = (?)");
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, updated.getName());
            ps.setString(2, updated.getPassword());
            ps.setString(3, updated.getImgPath());
            ps.setString(4, updated.getEmail());
            ps.executeUpdate();
            System.out.print(updated.getName()+updated.getPassword()+updated.getImgPath()+updated.getEmail());
            return true;
        } catch (SQLException ex){
            ex.printStackTrace();
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return false;
    }
}
