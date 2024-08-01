
package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
    public static Connection connect() {
        Connection con = null;
        try {


            Class.forName("org.postgresql.Driver");


            con = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/pharmacydb",
                    "postgres",
                    "admin"
            );
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
}
