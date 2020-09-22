using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dapper.Contrib.Extensions;
using System.Data;
using Dapper;

namespace DB4_Movie_API
{
    public class DataAccessor
    {
        public static IDbConnection GetConnection()
        {
            return new SqlConnection("Server=7K5SN13\\DB4_SERVER; Database=Movie_API; User Id=DB4_User; Password=pass1;");
        }

        public static List<Movie> GetMovies()
        {
            IDbConnection db = GetConnection();
            return db.GetAll<Movie>().ToList();
        }

        public static List<MovieCategory> GetCategories()
        {
            IDbConnection db = GetConnection();
            return db.Query<MovieCategory>("SELECT DISTINCT Category FROM Movie").ToList();
        }

        public static List<Movie> GetMovies(string category)
        {
            IDbConnection db = GetConnection();
            List<Movie> movies = GetMovies();
            return (from movie in movies where movie.Category.Equals(category, StringComparison.OrdinalIgnoreCase) select movie).ToList();
        }

        public static Movie FindMovie(string title)
        {
            IDbConnection db = GetConnection();
            try
            {
                return db.QuerySingle<Movie>("SELECT * FROM Movie WHERE Name = @title", new { title });
            }
            catch
            {
                return null;
            }
        }

        public static List<Movie> SearchMovies(string title)
        {
            IDbConnection db = GetConnection();
            List<Movie> movies = GetMovies();
            return (from movie in movies where movie.Name.Contains(title, StringComparison.OrdinalIgnoreCase) select movie).ToList();
        }
    }
}
