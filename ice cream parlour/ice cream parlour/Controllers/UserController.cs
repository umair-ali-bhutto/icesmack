using ice_cream_parlour.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace ice_cream_parlour.Controllers
{
    public class UserController : Controller
    {
        icecrmEntities db = new icecrmEntities();
        // GET: User
        public ActionResult SignUp()
        {
            return View();
        }


        [HttpPost]
        public ActionResult SignUp(tbl_user tb_u)
        {
            db.tbl_user.Add(tb_u);
            db.SaveChanges();
            return RedirectToAction("Login");
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(tbl_user tu)
        {
            tbl_user u = db.tbl_user.Where(x => x.u_email.Equals(tu.u_email) && x.u_pwd.Equals(tu.u_pwd)).SingleOrDefault();
            if (u != null)
            {
                Session["uname"] = u.u_name.ToString();
                return RedirectToAction("Recipes","admin");
            }
            else
            {
                ViewBag.msg = "Invalid Credentials";
                return RedirectToAction("Login");
            }

        }
        public ActionResult Logout()
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
             
    }
}