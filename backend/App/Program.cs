var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.UseDefaultFiles();
app.UseStaticFiles();

var greeter = new Greeter();

app.MapGet("/api", () => "Hello World!");
app.MapGet("/api/hello", () => new { message = "Hello from .NET!" });
app.MapGet("/api/greet/{name}", (string name) => new { message = greeter.Greet(name) });

app.MapGet("/api/health", () => Results.Ok("OK"));

app.Run();
