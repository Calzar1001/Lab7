package ca.sait.lab7.servlets;

import ca.sait.lab7.models.Role;
import ca.sait.lab7.models.User;
import ca.sait.lab7.services.UserService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Valued Customer
 */
public class UserServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService service = new UserService();

        String action = request.getParameter("action");

        if (action != null && action.equals("delete")) {
            try {
                String email = request.getParameter("email");

                boolean deleted = service.delete(email);

            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        try {
            List<User> users = service.getAll();

            request.setAttribute("users", users);

            this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserService service = new UserService();

        String action = request.getParameter("action");

        //When add new user button is clicked
        if (action != null && action.equals("addUser")) {
            String email = request.getParameter("email");
            String fristName = request.getParameter("fristName");
            String lastName = request.getParameter("lastName");
            String password = request.getParameter("password");

            int id = Integer.parseInt(request.getParameter("role"));
            String roleName = request.getParameter("email");
            Role role = new Role(id, roleName);

            boolean active = Boolean.parseBoolean(request.getParameter("active"));

            User user = new User(email, active, fristName, lastName, password, role);

            ArrayList<User> users = (ArrayList<User>) session.getAttribute("users");
            
            try {
                boolean insert = service.insert(email, active, fristName, lastName, password, role);
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            users.add(user);
  
            session.setAttribute("users", users);
        }

    }
}
