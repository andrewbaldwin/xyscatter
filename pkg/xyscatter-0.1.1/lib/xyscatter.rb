module XYscatter

  require 'RMagick'
  include Magick

#Routine to generate an image with a simple XY scatter plot.
#the image is square  and set to 100x the scale option
#
# version 0.1.0			20101103
#
#
# It was written by Andrew Baldwin who asserts copyright.
#
# Use 
# 
# You may use it in any way you wish so long as this header text
# is reproduced in its entirety and any changes are clearly marked.
#
# If you find errors and/or make improvements, I'd appreciate it
# if you'd send me a copy of the revised version.
#
# If you use this in a commercial and/or non free product, please
# make a donation to a charity of your choice (ideally one which
# is connected to relief of suffering and/or improvement of the
# environment); there is no obligation to do this - just your
# conscience.
#
# If you find it useful and if we should ever meet you can buy me
# a nice cup of tea :-)
#
#	Andrew Baldwin    andrew.baldwin@bcs.org.uk
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#
#usage
#
#  require 'xyscatter'
#  
#  XYscatter::xyscatter({params})
#  
#  where params is a hash containing
#  
#  :points => 2d array of data points [ [x1,y1],[x2,y2] ..[xn,yn] ]
#  :background => background colour (default black)
#  :scale => integer (default 5) makes resulting image scale*100 points square
#  :pointcolour => colour name or html hex code, default #fedcba
#  :ticks => number of ticks on each axis - minimum 1 (default 10)
#  :tickcolour => colour used for ticks (default #ffffff)
#  :minx => lower bound for x for plotting (default 0)
#  :maxx => upper bound for x for plotting (default 100)
#  :miny => lower bound for y for plotting (default 0)
#  :maxy => upper bound for y for plotting (default 100)
#  :filename => output file name (default /tmp/scatter.gif)
#  
#  Only the :points setting is needed#
#
#  Note: The package does not check for sensible values 
#  so if you set the pointcolour and background to the same or close values
#  you won't see very much 





  def self.xyscatter(options)
        points=options[:points] || [[0,0],[100,100]]
        background=options[:background] || 'black'
	scale=options[:scale] || 5
	filename=options[:filename]|| '/tmp/sactter.gif'
	pointcolour=options[:pointcolour] || '#fedcba'
        ticks=options[:ticks] || 10
        tickcolour=options[:tickcolour] || '#ffffff'
        minx=options[:minx] || 0
        maxx=options[:maxx] || 100
        miny=options[:miny] || 0
        maxy=options[:maxy] || 100
        xsize=maxx-minx
        ysize=maxy-miny
        gscale=scale*100


				#create a canvas
     csize=(gscale)+2
     f=Image.new(csize,csize) {self.background_color=background}
				#create a drawing
     scat=Draw.new

  				#show ticks on axis
     scat.fill(tickcolour)	
     xtickstep=(100/ticks)*scale
     ytickstep=(100/ticks)*scale
     x=0
     y=gscale
     0.upto(ticks) do |tick|
            scat.rectangle(x,98*scale,(x+2),100*scale)
            scat.rectangle(0,y,2*scale,(y+2))
	    x+=xtickstep
	    y-=ytickstep
     end #do 
				#plot points

#scale coords plotted_x= ((x-minx)/(maxx-minx))*gscale ; similar for y
     scat.fill(pointcolour)
     points.each do |xyplot|
        x=xyplot[0]-minx
        y=xyplot[1]-miny
        x=((gscale*x).to_f/xsize).to_i
        y=((gscale*y).to_f/ysize).to_i
	y=gscale-y	# gscale - y to flip diagram to normal coordinate system
	if xyplot[2] then
           radius=xyplot*scale
	   scat.circle(x,y,x+radius,y)	#plot a circle with radius xyplot[2] (suitably scaled)
	else
           scat.rectangle(x,y,(x+2),(y+2))	#plot a simple point (actually a small rectangle to improve visibility
        end
     end #do

				#associate drawing object with canvas
     scat.draw(f)  

     f.write(filename)		#save to file
     f.display 
  end #def

    def self.testxyscatter
	# test routine
	a=[[31,41],[59,26],[53,58],[97,94],[27,18],[2,8],[18,28]]

 	xyscatter({:points => a})		#using defaults
	xyscatter({:points=>a, :minx=>20, :ticks=>5, :tickcolour=>'#ffff00', :pointcolour=>'#00ff00',:filename=>'/tmp/xxx.png'})
 	puts "done"
    end #def


end #module
