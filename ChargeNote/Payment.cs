using ChargeNote.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChargeNote
{
    public class Payment
    {
        public int paymentID { get; set; }
        public string paymentTitle { get; set; }
        public float fullAmount { get; set; }
        public int installmentCount { get; set; }
        public bool isPaid { get; set; }

        

        List<Payment> paymentsList;

        public Payment()
        {

        }

        public List<Payment> RetrieveAll()
        {
            List<Payment> paymentList = new List<Payment>();
            SqlConnection conn = new SqlConnection("Server=DESKTOP-VJ4QE5H\\SQLEXPRESS;Database=MyOrganizer;Trusted_Connection=true");


            try
            {
                string sql = @"Select * from PaymentTable";
                SqlCommand sqlCmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader dr = sqlCmd.ExecuteReader();
                //Bulszit ta funkcja
                while (dr.Read())
                {
                    Payment newItem = new Payment();
                    
                    newItem.paymentID = (int)dr["ID"];
                    newItem.paymentTitle = dr["Title"].ToString();
                    newItem.fullAmount = float.Parse(dr["FullAmount"].ToString());
                    newItem.installmentCount = (int)dr["InstallmentCount"];
                    newItem.isPaid = (bool)dr["isPaid"];
                    paymentList.Add(newItem);
                }
                dr.Close();
                conn.Close();
            }
            catch
            {
                paymentList = null;
            }
            finally
            {
                conn.Close();
            }
            return paymentList;
           
        }

 

    }

    public class Installment
    {
        public string installmentTitle { get; set; }
        public DateTime installmentDate { get; set; }
        public float Amount { get; set; }
        public bool isPaid { get; set; }

        public Installment()
        {

        }


        public List<Installment> RetrieveAllFromMonth(int month, int year)
        {
            int _month = month;
            int _year = year;
            List<Installment> installmentList = new List<Installment>();
            SqlConnection conn = new SqlConnection("Server=DESKTOP-VJ4QE5H\\SQLEXPRESS;Database=MyOrganizer;Trusted_Connection=true");


            try
            {
                string sql = @"SELECT 
                                  Pays.[Title]
                                  ,[InstallmentDate]
                                  ,[Amount]
                                  ,Inst.[isPaid]
                              FROM [MyOrganizer].[dbo].[InstallmentTable] as Inst
                              LEFT JOIN PaymentTable as Pays on PaymentID = Pays.ID
                              Where Month(InstallmentDate) = @Month and Year(InstallmentDate) = @Year";

                SqlCommand sqlCmd = new SqlCommand(sql, conn);
                sqlCmd.Parameters.AddWithValue("@Month", _month);
                sqlCmd.Parameters.AddWithValue("@Year", _year);

                conn.Open();
                SqlDataReader dr = sqlCmd.ExecuteReader();
                //Bulszit ta funkcja
                while (dr.Read())
                {
                    Installment newItem = new Installment();

                    newItem.installmentTitle = dr["Title"].ToString();
                    newItem.installmentDate = (DateTime)dr["InstallmentDate"];
                    newItem.Amount = float.Parse(dr["Amount"].ToString());
                    newItem.isPaid = (bool)dr["isPaid"];

                    installmentList.Add(newItem);
                }
                dr.Close();
                conn.Close();
            }
            catch
            {
                installmentList = null;
            }
            finally
            {
                conn.Close();
            }
            return installmentList;

        }



    }
}
