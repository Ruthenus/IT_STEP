using WebApi_Application.Models;

namespace WebApi_Application.Services
{
    // Расширение для добавления сервисов
    public static class ServiceProviderExtensions
    {
        public static void AddRepositoryService(this IServiceCollection services)
        {
            services.AddTransient<IRepository<User>, EFRepository<User>>();
        }
    }
}
