using ice_cream_parlour.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ice_cream_parlour.Controllers
{
    public class HomeController : Controller
    {
        icecrmEntities db = new icecrmEntities();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            

            return View();
        }

        public ActionResult Contact()
        {
            

            return View();
        }
        public ActionResult faq()
        {
            return View();
        }
    }
}