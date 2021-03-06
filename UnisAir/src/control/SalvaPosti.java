package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Passeggero;
import model.Prenotazione;

/**
 * Servlet implementation class SalvaPosti
 */
@WebServlet("/SalvaPosti")
public class SalvaPosti extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SalvaPosti() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] postiA = request.getParameterValues("stringa");
		double prezzoTot=Double.parseDouble(request.getParameter("prezzoTot"));
		String Checked=(String) request.getSession().getAttribute("Andata/Ritorno");
		Prenotazione pA=(Prenotazione)request.getSession().getAttribute("prenotazioneA");
		ArrayList<Passeggero> passeggeriA =new ArrayList<Passeggero>();
		Passeggero p;
		request.getSession().setAttribute("count",-1);
		for(int i=0;i<postiA.length;i++){
			p=new Passeggero();
			p.setPosto(postiA[i]);
			passeggeriA.add(p);
		}
		pA.setPrezzoTotale(prezzoTot);
		pA.setPasseggeri(passeggeriA);
		request.getSession().setAttribute("prenotazioneA", pA);

		if(Checked.equals("a/r")){

			String[] postiR = request.getParameterValues("stringaR");
			Prenotazione pR=(Prenotazione)request.getSession().getAttribute("prenotazioneR");
			ArrayList<Passeggero> passeggeriR =new ArrayList<Passeggero>();
			double prezzoTotR=Double.parseDouble(request.getParameter("prezzoTotR"));
			for(int i=0;i<postiR.length;i++){
				p=new Passeggero();
				p.setPosto(postiR[i]);
				passeggeriR.add(p);
			}
			pR.setPasseggeri(passeggeriR);
			pR.setPrezzoTotale(prezzoTotR);
			request.getSession().setAttribute("prenotazioneR", pR);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("InserimentoDatiAnagrafici.jsp");//pagina corrente
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
