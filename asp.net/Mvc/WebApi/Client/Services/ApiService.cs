using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;

namespace MvcMovie.Services
{
    public class ApiService
    {
        /// <summary>
        /// ベースのURLを作成
        /// </summary>
        private readonly string baseUrl;
        //private readonly string baseUrl = @"http://xxx.xxx.xxx.xxx:pp/api/";

        /// <summary>
        /// HttpClient このクラスのを使いまわす
        /// </summary>
        private readonly HttpClient httpClient;

        private ApiService()
        {

        }

        public ApiService(string baseUrl)
        {
            this.baseUrl = baseUrl;
            this.httpClient = new HttpClient();
        }

        public string GetRequest(string actionName)
        {
            // リクエスト作成
            String requestEndPoint = this.baseUrl + actionName;
            HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Get, requestEndPoint);

            // レスポンスの箱を作る
            string resBodyStr;
            HttpStatusCode resStatusCode = HttpStatusCode.NotFound;
            Task<HttpResponseMessage> response;
            try
            {
                // 引数にrequestをとる場合はSendAsyncを使うそれ以外はGetAsyncやPostAsyncなどを使う
                response = this.httpClient.SendAsync(request);
                resBodyStr = response.Result.Content.ReadAsStringAsync().Result;    // 実際にリクエストを飛ばすのはこのタイミング
                resStatusCode = response.Result.StatusCode;
            }
            catch (Exception ex)
            {
                return null;
            }

            return resBodyStr;
        }



    }
}