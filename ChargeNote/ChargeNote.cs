using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static ChargeNote.OwnDB;


namespace ChargeNote
{
    public partial class ChargeNote : Form
    {

        public ChargeNote()
        {
            InitializeComponent();

            
            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = "MM/yyyy";
            dateTimePicker1.ShowUpDown = true;

            Installment installments = new Installment();
            var installmentList = installments.RetrieveAllFromMonth(dateTimePicker1.Value.Month, dateTimePicker1.Value.Year);
            dataGridView1.DataSource = installmentList;

            //Create payment object and retrieve data from SQL
            //Payment payments = new Payment();
            //var paymentslist = payments.RetrieveAll();

            //dataGridView1.DataSource = paymentslist;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void Test_Click(object sender, EventArgs e)
        {
            Installment installments = new Installment();
            var installmentList = installments.RetrieveAllFromMonth(dateTimePicker1.Value.Month, dateTimePicker1.Value.Year);
            dataGridView1.DataSource = installmentList;

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void SaveButton_Click(object sender, EventArgs e)
        {

        }
    }
}
