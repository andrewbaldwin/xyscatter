module XYscatter

  require 'RMagick'
  include Magick

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


#scale=5, filename='/tmp/scatter.gif', pointcolour='#fedcba'
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
     points.each do |pair|
        x=pair[0]-minx
        y=pair[1]-miny
        x=((gscale*x).to_f/xsize).to_i
        y=((gscale*y).to_f/ysize).to_i
	y=gscale-y	# gscale - y to flip diagram to normal coordinate system
	#puts "DEBUG x,y plotted x,y: #{pair[0]}\t#{pair[1]}\t#{x}\t#{y}"
        scat.rectangle(x,y,(x+2),(y+2))
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

#puts "starting"
#testscatter

end #module
