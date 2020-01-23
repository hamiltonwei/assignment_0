using Test

# Q 1.2.3
function gaussian_pdf(x; mean=0., variance=0.01)
    a = 1/(sqrt(variance)*sqrt(2*pi))
    b = (x - mean) / sqrt(variance)
    return a*exp((-1/2)*b^2)
end

  # Test answers
using Distributions # Note Normal uses N(mean, stddev) for parameters
@testset "Implementation of Gaussian pdf" begin
  x = randn()
  @test gaussian_pdf(x) ≈ pdf.(Normal(0.,sqrt(0.01)),x)
  # ≈ is syntax sugar for isapprox, typed with `\approx <TAB>`
  # or use the full function, like below
  @test isapprox(gaussian_pdf(x,mean=10., variance=1) , pdf.(Normal(10., sqrt(1)),x))
end