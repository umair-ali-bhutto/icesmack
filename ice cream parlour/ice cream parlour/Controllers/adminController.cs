using ice_cream_parlour.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace ice_cream_parlour.Controllers
{
    public class adminController : Controller
    {
        icecrmEntities db = new icecrmEntities();
        // GET: admin
        public ActionResult Index()
        {
            return View(db.tbl_product.ToList());
        }
        public ActionResult feedback()
        {
            return View(db.tbl_feedback.ToList());
        }
        public ActionResult users() {
            return View(db.tbl_user.ToList());
        }
        public ActionResult bought()
        {
            return View(db.tbl_buy.ToList());
        }




        public ActionResult Admin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Admin(tbl_admin ta)
        {
            tbl_admin a = db.tbl_admin.Where(x => x.adm_name.Equals(ta.adm_name) && x.adm_pwd.Equals(ta.adm_pwd)).SingleOrDefault();
            if (a != null)
            {
                Session["aname"] = a.adm_name.ToString();
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.msg = "Invalid Credentials";
                return RedirectToAction("Admin");
            }
        }

        public ActionResult Create()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Create(HttpPostedFileBase abc, tbl_product pr)
        {
            string filename = Path.GetFileName(abc.FileName);
            string _filename = DateTime.Now.ToString("d ") +filename;
            string extension = Path.GetExtension(abc.FileName);
            string path = Path.Combine(Server.MapPath("~/images/"), _filename);
            pr.p_image = "~/images/" + _filename;
            if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".pdf")
            {
                if (abc.ContentLength <= 10000000)
                {
                    db.tbl_product.Add(pr);
                    if (db.SaveChanges()>0)
                    {
                        abc.SaveAs(path);
                        ModelState.Clear();
                    }
                }
                else
                {
                    ViewBag.msg = "Size is more than 10mb";
                }
            }
            else
            {
                ViewBag.msg = "Only jpg, jpeg, pdf files are accepted";
            }
            return View();
        }


        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var udata = db.tbl_product.Find(id);
            if (udata == null)
            {
                return HttpNotFound();
            }
            return View(udata);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var udata = db.tbl_product.Find(id);
            if (udata == null)
            {
                return HttpNotFound();
            }
            string crntImg = Request.MapPath(udata.p_image);
            db.Entry(udata).State = System.Data.Entity.EntityState.Deleted;
            if (db.SaveChanges()>0)
            {
                if (System.IO.File.Exists(crntImg))
                {
                    System.IO.File.Exists(crntImg);
                }
                ViewBag.msg = "File Deleted";
                ModelState.Clear();
                return RedirectToAction("Index");
            }
            return View();
        }
        public ActionResult Recipes()
        {
            return View(db.tbl_product.ToList());
        }

        public ActionResult Edit(int? id)
        {
            if (id ==null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var udata = db.tbl_product.Find(id);
            Session["imgpath"] = udata.p_image;
            if (udata == null)
            {
                return HttpNotFound();
            }
            return View(udata); 
        }
        [HttpPost]
        public ActionResult Edit(HttpPostedFileBase abc, tbl_product pro)
        {
            if (ModelState.IsValid)
            {
                string filename = Path.GetFileName(abc.FileName);
                string _filename = DateTime.Now.ToString("d ") + filename;
                string extension = Path.GetExtension(abc.FileName);
                string path = Path.Combine(Server.MapPath("~/images"), _filename);
                pro.p_image = "~/images" + _filename;
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".pdf")
                {
                    if (abc.ContentLength <= 10000000)
                    {
                        string crntImg = Request.MapPath(Session["imgpath"].ToString());
                        db.Entry(pro).State = EntityState.Modified;
                        if (db.SaveChanges() > 0)
                        {
                            abc.SaveAs(path);
                            if (System.IO.File.Exists(crntImg))
                            {
                                System.IO.File.Exists(crntImg);
                            }
                            ModelState.Clear();
                        }
                    }
                    else
                    {
                        ViewBag.msg = "File Size is Large";
                    }
                }
                else
                {
                    ViewBag.msg = "File Extension is not valid";
                }
            }
            else
            {
                pro.p_image = Session["imgpath"].ToString();
                db.Entry(pro).State = EntityState.Modified;
                if (db.SaveChanges () > 0)
                {
                    TempData["msg"] = "Record Updated";
                    return RedirectToAction("Index");
                }
            }
            return View();
        }
    }
}