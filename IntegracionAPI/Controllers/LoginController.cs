using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IntegracionAPI.Models;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace IntegracionAPI.Controllers
{
    [Route("api/[controller]")]
    [EnableCors("AllowAllOrigins")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        #region Select
        [HttpPost("auticacion")]
        public IActionResult api_autenticacion([FromHeader]string Usuario, [FromHeader]string Contrasenia, ObjAutenticacion request)
        {
            if (Usuario == "Jean")
            {
                return Ok("Ok");
            }
            if (request.usuario == "Jean")
            {
                return Ok("Ok");
            }
            return Ok("Ok");

          //  fetch('https://jsonplaceholder.typicode.com/todos', {
          //  method: 'POST',
          //  body: JSON.stringify({
          //      usuario: "Jean",             
          //      constrasenia: "xxxx"
          //  }),
          //  headers:
          //      {
          //          "Content-type": "application/json",
          //          "Usuario": "jean",
          //          "Constrasenia": "xxxx"
          //  })
          //.then(response => response.json())
          //.then(json => console.log(json))

        }
        #endregion

        #region Insert

        #endregion

        #region Update

        #endregion

        #region Delete

        #endregion
    }
}