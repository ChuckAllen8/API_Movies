using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DB4_Movie_API
{
    [Table("Movie")]
    public class Movie
    {
        [Key]
        public long Id { get; set; }
        public string Name { get; set; }
        public string Category { get; set; }
    }
}
