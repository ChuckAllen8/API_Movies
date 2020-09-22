using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DB4_Movie_API.Controllers
{
    [Route("Movies")]
    [ApiController]
    public class MoviesController : ControllerBase
    {
        [HttpGet] //Get all movies
        [Route("")]
        public IEnumerable<Movie> Movies()
        {
            return DataAccessor.GetMovies();
        }

        [HttpGet] // get a specific movie
        [Route("Find/{title}")]
        public JsonResult Find(string title)
        {
            Movie found = DataAccessor.FindMovie(title);
            if(found is null)
            {
                return new JsonResult(new { });
            }
            return new JsonResult(found);
        }

        [HttpGet]
        [Route("Like/{search}")] //get a movie with a title like
        public IEnumerable<Movie> Search(string search)
        {
            return DataAccessor.SearchMovies(search);
        }

        [HttpGet] //get a random movie from a category
        [Route("Random/{category}")]
        public JsonResult RandomMovie(string category)
        {
            List<Movie> movies = DataAccessor.GetMovies(category);
            if(movies.Count <= 0)
            {
                return new JsonResult(new { });
            }
            else
            {
                return new JsonResult(movies[new Random().Next(movies.Count)]);
            }
        }

        [HttpGet] //get a list of random movies
        [Route("Random/{quantity:int}")]
        public IEnumerable<Movie> RandomMovies(int quantity)
        {
            List<Movie> movies = DataAccessor.GetMovies();
            List<Movie> results = new List<Movie>();
            Random rand = new Random();
            if(quantity > movies.Count)
            {
                quantity = movies.Count;
            }
            while(quantity > 0 && results.Count < quantity)
            {
                int index = rand.Next(movies.Count);
                if(!results.Contains(movies[index]))
                {
                    results.Add(movies[index]);
                }
            }
            return results;
        }

        [HttpGet] //get a random movie
        [Route("Random")]
        public Movie RandomMovie()
        {
            List<Movie> movies = DataAccessor.GetMovies();

            return movies[new Random().Next(movies.Count)];
        }

        [HttpGet] //get a list of all movie categories
        [Route("Categories")]
        public IEnumerable<MovieCategory> Categories()
        {
            return DataAccessor.GetCategories();
        }

        [HttpGet] //get movies in a specific category
        [Route("{category}")]
        public IEnumerable<Movie> MoviesByCategory(string category)
        {
            return DataAccessor.GetMovies(category);
        }


        //
        //Movies/ -> All Movies
        //Movies/Like/Mulan -> title is like Mulan
        //Movies/Horror -> All category horror movies
        //Movies/Random?show=10 -> 10 random horror movies
        //Movies/Find?title=Mulan -> gives mulan
        //Movies/Categories
        //
    }
}
