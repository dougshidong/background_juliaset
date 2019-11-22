function iter(z,c)
  n = 0
  while (abs2(z)<4 && n < 1000)
    z = z^2+c
	n+=1
  end
  #if (n > 2000) print(n, " ", z, "\n") end
  return n
end
 
# Span -1, 1 in x and y, and then scale by x_span, y_span
coord(i,j,pixel_width,pixel_height,x_span,y_span) = x_span * (2*(i-1)/(pixel_width-1) - 1) + im * y_span * (2*(j-1)/(pixel_height-1) - 1)
 
# #palette(n) = string(255-min(n,255)," ",255-min(n,255)," ", 255);
# rscale = 1.1
# gscale = 1.0
# bscale = 1.0
# div = 1.5
# scaler(n) = convert(UInt8, trunc(255 - min((rscale*n/div)*n^0.5/255^0.5,255)))
# scaleg(n) = convert(UInt8, trunc(255 - min((gscale*n/div)*n^0.5/255^0.5,255)))
# scaleb(n) = convert(UInt8, trunc(255 - min((bscale*n/div)*n^0.5/255^0.5,255)))
# palette(n) = string(scaler(n)," ",scaleg(n)," ", scaleb(n));
#  
# julia(c) = (pixel_width,pixel_height,x_span,y_span,i,j) -> palette(iter(coord(i,j,pixel_width,pixel_height,x_span,y_span), c))
#  
# using DelimitedFiles
# 
# writeppm(f; pixel_width=2*1920,pixel_height=2*1080,x_span=2,y_span=1,file="julia.ppm") =
#   open(file, "w") do out
#     write(out, string("P3\n", pixel_width, " ", pixel_height, "\n255\n"))
#     writedlm(out, [f(pixel_width,pixel_height,x_span,y_span,i,j) for j = 1:pixel_height, i = 1:pixel_width], '\n')
#   end
#  
# #writeppm(julia(-0.786+0.147im))
# writeppm(julia(-0.755+0.15im))


#palette(n) = string(255-min(n,255)," ",255-min(n,255)," ", 255);
rscale = 1.1 # 0 = most red
gscale = 1.0 # 0 = most green
bscale = 1.0 # 0 = most blue
div = 2
scaler(n) = convert(UInt8, trunc(255 - min((rscale*n/div)^0.4*255/(255^0.4),255)))
scaleg(n) = convert(UInt8, trunc(255 - min((gscale*n/div)^0.4*255/(255^0.4),255)))
scaleb(n) = convert(UInt8, trunc(255 - min((bscale*n/div)^0.4*255/(255^0.4),255)))
palette(n) = string(scaler(n)," ",scaleg(n)," ", scaleb(n));
 
julia(c) = (pixel_width,pixel_height,x_span,y_span,i,j) -> palette(iter(coord(i,j,pixel_width,pixel_height,x_span,y_span), c))
 
using DelimitedFiles

# Compute Julia set for (x,y) = ([-2,2] x [-1,1])
writeppm(f; pixel_width=2*1920,pixel_height=2*1080,x_span=2,y_span=1,file="julia.ppm") =
  open(file, "w") do out
    write(out, string("P3\n", pixel_width, " ", pixel_height, "\n255\n"))
    writedlm(out, [f(pixel_width,pixel_height,x_span,y_span,i,j) for j = 1:pixel_height, i = 1:pixel_width], '\n')
  end
 
#writeppm(julia(-0.786+0.147im))
writeppm(julia(-0.74543+0.11301im))

