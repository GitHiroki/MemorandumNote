using MvcMovie.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcMovie.Controllers
{
    public class FksmAPIController : Controller
    {
        // GET: FksmAPI
        public ActionResult Index()
        {
            //iis express
            //ApiService apiService = new ApiService(@"http://localhost:xxxxx/api/");
            //ローカルiis
            ApiService apiService = new ApiService(@"http://xxx.xxx.xxx.xxx:pp/api/");
            String resBody = apiService.GetRequest("values");
            ViewBag.resBody = resBody;


            return View();
        }
    }
}