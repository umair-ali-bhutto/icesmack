using ice_cream_parlour.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ice_cream_parlour.Controllers
{
    public class FeedbackController : Controller
    {
        icecrmEntities db = new icecrmEntities();

        // GET: Feedback
        public ActionResult Feedback()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Feedback(tbl_feedback fe)
        {
            db.tbl_feedback.Add(fe);
            db.SaveChanges();
            ModelState.Clear();
            return View();
        }
    }
}