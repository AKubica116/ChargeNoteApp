using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChargeNote
{
    public class OwnDB
    {
        //Connect to DB

        SqlConnection conn = new SqlConnection();


        private void ConnectDB()
        {
            conn.ConnectionString = "Server=DESKTOP-VJ4QE5H\\SQLEXPRESS;Database=MyOrganizer;Trusted_Connection=true";
            conn.Open();
        }

        private void DisconnectDB()
        {
            conn.Close();
        }

        public DataRow[] ReadFromSQL(string query)
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = $"{query}";
            adapter.SelectCommand = cmd;
            DataSet ds = new DataSet();
            ConnectDB();
            adapter.Fill(ds);
            DisconnectDB();
            var table = ds.Tables[0];
            DataRow[] output = table.Select();
            return output;
        }

        public DataRow[] TestQuery()
        {
            string command = "Select * from PaymentTable";
            DataRow[] output = ReadFromSQL(command);

            return output;

            //using (SqlDataReader reader = command.ExecuteReader())
            //{
            //    Console.WriteLine("FirstColumn\tSecond Column\t\tThird Column\t\tForth Column\t");
            //    while (reader.Read())
            //    {
            //        Console.WriteLine(String.Format("{0} \t | {1} \t | {2} \t | {3}",
            //            reader[0], reader[1], reader[2], reader[3]));
            //    }
            //}
            //Console.WriteLine("Data displayed! Now press enter to move to the next section!");
        }
    }
}
