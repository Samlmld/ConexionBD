using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;

namespace EjemBD
{
    public partial class Form1 : Form
    {
        public Form1()
        {



            InitializeComponent();

        }

        private const bool V = false;
        ClassBD BD = new ClassBD();

        int res = -1;
        private void button6_Click(object sender, EventArgs e)
        {

            dataGridView1.DataSource = BD.consulta("select * from cliente order by codigo_cli ASC");
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = BD.consulta("select * from cliente order by codigo_cli ASC");


            SqlDataReader ResConsul;

            string consulta = "Select * from cliente where codigo_cli=" + txtCodigo.Text;

            ResConsul = BD.Buscar(consulta);

            if (ResConsul.Read())
            {
                txtCodigo.Text = ResConsul.GetInt32(0).ToString();
                txtNombre.Text = ResConsul.GetString(1).ToString();
                txtRFC.Text = ResConsul.GetString(2).ToString();
                txtDireccion.Text = ResConsul.GetString(3).ToString();
                txtCiudad.Text = ResConsul.GetString(4).ToString();
                txtTelefono.Text = ResConsul.GetString(5).ToString();

            }
            else
            {

                MessageBox.Show("No se encontró ningún registro con esas especificaciones", "Advertencia",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);

            }


            ResConsul.Close();

            BD.conn.Close();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = BD.consulta("select * from cliente order by codigo_cli ASC");
            try
            {


                string modificar = "update cliente set nombre_cli='" + txtNombre.Text + "',RFC_cli='" + txtRFC.Text + "',direccion_cli='" +
                    txtDireccion.Text + "',ciudad_cli='" + txtCiudad.Text + "',telefono_cli='" +
                    txtTelefono.Text + "' where codigo_cli = " + txtCodigo.Text;

                res = BD.ABM(modificar);

                if (res == 1)
                {
                    MessageBox.Show("Se ha modificado el registro correctamente", "Modificaciones", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                BD.conn.Close();
            }

        }

        private void btnRegistrar_Click(object sender, EventArgs e)
        {

            if (txtNombre.Text.Equals("") || txtRFC.Text.Equals("") || txtDireccion.Text.Equals("") || txtCiudad.Text.Equals("") || txtTelefono.Text.Equals("")  )
            {
               
                MessageBox.Show("Faltan datos", "", MessageBoxButtons.OK, MessageBoxIcon.Warning);

            }
            else
            {

           


            dataGridView1.DataSource = BD.consulta("select * from cliente order by codigo_cli ASC");
            try
            {
                string insertar = "insert into cliente values('" + txtNombre.Text + "','" +
                    txtRFC.Text + "','" + txtDireccion.Text + "','" + txtCiudad.Text + "','" +
                    txtTelefono.Text + "')";

                res = BD.ABM(insertar);

                if (res == 1)
                {
                    MessageBox.Show("Se ha agregado correctamente", "Registrar", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                BD.conn.Close();
            }
            }
        }



        private void btnEliminar_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = BD.consulta("select * from cliente order by codigo_cli ASC");
            try
            {
                string eliminar = "delete from cliente where codigo_cli=" + txtCodigo.Text;
                res = BD.ABM(eliminar);

                if (res == 1)
                {
                    MessageBox.Show("Se ha elimnado el registro", "Eliminar", MessageBoxButtons.OK, MessageBoxIcon.Information);

                }
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                BD.conn.Close();

            }
        }

        private void btnlimpiar_Click(object sender, EventArgs e)
        {
            String texto = "";
            txtCodigo.Text = texto;
            txtCiudad.Text = texto;
            txtDireccion.Text = texto;
            txtNombre.Text = texto;
            txtRFC.Text = texto;
            txtTelefono.Text = texto;


        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void cmbNomClie_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                DataSet ds = new DataSet();


                ds = BD.BuscarCliente("select * from cliente where nombre_cli = '" + cmbNomClie.Text + "'", "cliente");


                foreach (DataRow fila in ds.Tables["Cliente"].Rows)
                {

                    txtCodigo.Text = fila["codigo_cli"].ToString();
                    txtNombre.Text = fila["nombre_cli"].ToString();
                    txtRFC.Text = fila["RFC_cli"].ToString();
                    txtDireccion.Text = fila["direccion_cli"].ToString();
                    txtCiudad.Text = fila["ciudad_cli"].ToString();
                    txtTelefono.Text = fila["telefono_cli"].ToString();

                }

            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                BD.conn.Close();
            }
        }


        private void cmbNomClie_Click(object sender, EventArgs e)
        {

            cmbNomClie.Items.Clear();

            try
            {
                DataSet ds = new DataSet();

                ds = BD.BuscarCliente("select nombre_cli from cliente", "Cliente");

                foreach (DataRow fila in ds.Tables["Cliente"].Rows)
                {
                    cmbNomClie.Items.Add(fila["nombre_cli"].ToString());

                }
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);

            }
            finally
            {
                BD.conn.Close();
            }



        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void txtTelefono_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsNumber(e.KeyChar) || char.IsControl(e.KeyChar) || (e.KeyChar == 46) && !(txtTelefono.Text.Contains(".")))
            {

                e.Handled = false;


            }
            else
            {
                e.Handled = true;
            }
        }

        private void txtCiudad_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtCiudad_KeyPress(object sender, KeyPressEventArgs e)
        {

            if (char.IsNumber(e.KeyChar) || char.IsControl(e.KeyChar) || (e.KeyChar == 46) && !(txtTelefono.Text.Contains(".")))
            {

                e.Handled = true;


            }
            else
            {
                e.Handled = false;
            }




        }

        private void txtNombre_KeyPress(object sender, KeyPressEventArgs e)
        {

            if (char.IsNumber(e.KeyChar) || char.IsControl(e.KeyChar) || (e.KeyChar == 46) && !(txtTelefono.Text.Contains(".")))
            {

                e.Handled = true;


            }
            else
            {
                e.Handled = false;
            }

        }
    } } 
    
    
    

