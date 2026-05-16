using Microsoft.EntityFrameworkCore;
using WebApi_Application.Data;
using WebApi_Application.Models;
using WebApi_Application.Services;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

// JSON Serialialization
builder.Services.AddControllers();


builder.Services.AddDbContext<UsersContext>(options =>
                options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddRepositoryService();

var app = builder.Build();

// Configure the HTTP request pipeline.

// Работа со статическими файлами
app.UseDefaultFiles();
app.UseStaticFiles();


app.MapControllers();

CreateDbIfNotExists(app);

app.Run();

static void CreateDbIfNotExists(IHost host)
{
    using var scope = host.Services.CreateScope();
    var services = scope.ServiceProvider;
    try
    {
        var context = services.GetRequiredService<UsersContext>();
        DbInitializer.Initialize(context);
    }
    catch (Exception ex)
    {
        var logger = services.GetRequiredService<ILogger<Program>>();
        logger.LogError(ex, "An error occurred creating the DB.");
    }
}
