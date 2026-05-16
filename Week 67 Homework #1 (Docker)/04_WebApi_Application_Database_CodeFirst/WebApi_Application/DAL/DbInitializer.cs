using WebApi_Application.Models;

namespace WebApi_Application.Data
{
    public static class DbInitializer
    {
        public static void Initialize(UsersContext context)
        {
            context.Database.EnsureCreated();

            // Look for any students.

            if (!context.Users.Any())
            {
                context.Users.Add(new User { Name = "Tom", Age = 26 });
                context.Users.Add(new User { Name = "Alice", Age = 31 });
                context.Users.Add(new User { Name = "Bob", Age = 25 });
                context.Users.Add(new User { Name = "Maggy", Age = 21 });
                context.Users.Add(new User { Name = "Chack", Age = 27 });
                context.Users.Add(new User { Name = "Fozzy", Age = 35 });
                context.SaveChanges();
            }
        }
    }
}