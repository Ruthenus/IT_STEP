using Microsoft.AspNetCore.Mvc;
using WebApi_Application.Models;
using WebApi_Application.Services;

namespace WebApi_Application.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
    {
        IRepository<User> _repo;
        public UsersController(IRepository<User> repo)
        {
            _repo = repo;
        }


        // GET api/users
        [HttpGet]
        public async Task<IEnumerable<User>> Get()
        {
            return await _repo.GetListDataAsync();
        }


        // GET api/users/5
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> Get(int id)
        {
            User? user = await _repo.GetDataAsync(id);
            if (user == null)
                return NotFound();
            return new ObjectResult(user);


        }


        // POST api/users
        [HttpPost]
        public async Task<ActionResult<User>> Post(User user)
        {
            // обработка частных случаев валидации
            if (user.Name == "admin")
            {
                ModelState.AddModelError("Name", "Недопустимое имя пользователя - admin");
            }

            // если есть лшибки - возвращаем ошибку 400
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            // если ошибок нет, сохраняем в базу данных
            bool result = await _repo.AddDataAsync(user);
            if (!result)
                return BadRequest();
            else
                return Ok(user);
        }


        // PUT api/users/
        [HttpPut]
        public async Task<ActionResult<User>> Put(User user)
        {
            // обработка частных случаев валидации
            if (user.Name == "admin")
            {
                ModelState.AddModelError("Name", "Недопустимое имя пользователя - admin");
            }

            // если есть лшибки - возвращаем ошибку 400
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            bool result = await _repo.UpdateDataAsync(user);
            if (!result)
                return BadRequest();
            else
                return Ok(user);
        }


        // DELETE api/users/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<User>> Delete(int id)
        {
            User? user = await _repo.GetDataAsync(id);
            if (user == null)
            {
                return NotFound();
            }
            
            bool result = await _repo.DeleteDataAsync(id);
            if (!result)
                return BadRequest();
            else
                return Ok(user);
        }
    }
}