using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Xml;
using System.Runtime.Remoting;
using System.Windows.Forms;
using System.Security.Policy;

namespace EjemBD

{

    public class ClassBD  
    {


        public SqlConnection conn = new SqlConnection("Data Source=DESKTOP-LMPR4SA\\SQLEXPRESS;Initial Catalog=Proyectos;Integrated Security=True");



        public DataTable consulta(string val)
        {
            conn.Open();
            string query = val;
            DataTable tb = new DataTable();

            SqlDataAdapter adaptador = new SqlDataAdapter(query, conn);
            adaptador.Fill(tb);
            conn.Close();
            return tb;

        }


        public SqlDataReader Buscar(string CodConsulta)
        {

            SqlCommand comando = new SqlCommand(CodConsulta, conn);

            conn.Open();

            SqlDataReader lector = comando.ExecuteReader();

            return lector;


        }


        public int ABM(string instruccion)
        {
            int respuesta = 1;

            SqlCommand comando = new SqlCommand(instruccion,conn);

            conn.Open();

            respuesta = comando.ExecuteNonQuery();

            conn.Close();

            return respuesta;


        }



        public DataSet BuscarCliente (string consu, string tabla)
        {
            DataSet Conjutos = new DataSet();

            SqlCommand comando = new SqlCommand(consu, conn);
            SqlDataAdapter adaptador = new SqlDataAdapter();

            adaptador.SelectCommand = comando;

            conn.Open();

            adaptador.Fill(Conjutos, tabla);

            conn.Close();

            return Conjutos;

        }

    }



  



}

