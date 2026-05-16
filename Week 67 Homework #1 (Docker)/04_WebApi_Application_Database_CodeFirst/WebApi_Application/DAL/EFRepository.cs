using Microsoft.EntityFrameworkCore;
using WebApi_Application.Models;

namespace WebApi_Application.Services
{
    public class EFRepository<T> : IRepository<T> where T : class
    {
        private readonly UsersContext _context;
        public EFRepository(UsersContext context)
        {
            _context = context;
        }
        public async Task<bool> AddDataAsync(T data)
        {
            try
            {
                _context.Set<T>().Add(data);
                return await SaveDataAsync();
            }
            catch
            {
                return false;
            }
        }

        public async Task<bool> UpdateDataAsync(T data)
        {
            try
            {
                _context.Entry(data).State = EntityState.Modified;
                //_context.Set<T>().Update(data);
                return await SaveDataAsync();
            }
            catch
            {
                return false;
            }
        }

        public async Task<bool> DeleteDataAsync(int id)
        {
            try
            {
                var D = await GetDataAsync(id);
                _context.Set<T>().Remove(D);
                return await SaveDataAsync();
            }
            catch 
            {
                return false;
            }
        }

        public virtual async Task<T?> GetDataAsync(int id)
        {
            return await _context.Set<T>().FindAsync(id);
        }

        public virtual async Task<IEnumerable<T>> GetListDataAsync()
        {
            return await _context.Set<T>().ToListAsync();
        }
        public async Task<bool> SaveDataAsync()
        {
	    if (await _context.SaveChangesAsync() > 0)
               return true;
            else return false;
        }
    }
}
