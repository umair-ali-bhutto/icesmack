using ice_cream_parlour.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ice_cream_parlour.Controllers
{
    public class BuyController : Controller
    {
        icecrmEntities db = new icecrmEntities();

        public ActionResult BuyNow()
        {
            return View();
        }
        // GET: Buy
        [HttpPost]
        public ActionResult BuyNow(tbl_buy t_buy)
        {
            db.tbl_buy.Add(t_buy);
            db.SaveChanges();
            ModelState.Clear();
            return RedirectToAction("download","Buy");
        }
        public ActionResult download()
        {
            return View();
        }
    }
}