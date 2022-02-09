{ mapboxgl } = require "npm"


# Creating a new HTML layer
# for the map to live inside of and scale
# it to fit the entire window
mapHeight = Screen.height
mapWidth = Screen.width

mapboxLayer = new Layer
mapboxLayer.visible = false
mapboxLayer.ignoreEvents = false
mapboxLayer.width = mapWidth
mapboxLayer.height = mapHeight
mapboxLayer.html = "<div id='map'></div>"
mapElement = mapboxLayer.querySelector("#map")
mapElement.style.height = mapHeight + 'px'

# Set your Mapbox access token here!
mapboxgl.accessToken = 'pk.eyJ1IjoiY2xlbWVuY3kxMCIsImEiOiJjaXVsOTd1c3AwMDBhMnRsOHlibWQwenpuIn0.4SzhCIdbQCjqLhv6e4xMOA'

map = new mapboxgl.Map({
    container: mapElement
    zoom: 11
    center: [103.816978, 1.362293]
    # here we're using a default style:
    # you can use any of the defaults or a
    # custom style you design in Mapbox Studio
#     style: 'mapbox://styles/mapbox/light-v9'
    datasetID: 'cj7bq5va20qqf32nz22ibk58y'
    mapID: 'clemency10.4nkae6b3'
    style: 'mapbox://styles/mapbox/streets-v10'
    hash: true
})

#Map Layers
#Estate Boundary Base Map
estateBoundaryBasemap.width = 1024
estateBoundaryBasemap.height = 713
estateBoundaryBasemap.x = 0
estateBoundaryBasemap.y = 55
estateBoundaryBasemap.draggable.enabled = true
estateBoundaryBasemap.pinchable.enabled = true
estateBoundaryBasemap.pinchable.rotate = false
# estateBoundaryBasemap.visible = false
estateBoundaryBasemap.draggable.overdrag = false
estateBoundaryBasemap.draggable.momentum = false
estateBoundaryBasemap.onPinchStart ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

estateBoundaryBasemap.onPinchEnd ->
	if @scale < 1
		@animate
			properties:
				scale: 1
			curve: "spring(300, 40)"
	else
		@draggable.constraints = constraints(@)

estateBoundaryBasemap.onDragStart (data) ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

estateBoundaryBasemap.onDragEnd (data) ->
	if @scale <= 1
		if @x isnt 0 or @y isnt 0
			@animate
				properties:
					x: @oriX
					y: @oriY
				curve: "spring(300, 40)"
	else
		@draggable.constraints = constraints(@)

estateBoundaryBasemap.onDoubleTap ->
	if @scale > 1
		@animate
			properties:
				x: @oriX
				y: @oriY
				scale: 1
			curve: "spring(400, 40)"
			
estateBoundaryBasemap.states =
	hide:
		visible: false
	show:
		visible: true
#Estate Boundary One North

estateBoundaryOneNorth.width = 1024
estateBoundaryOneNorth.height = 713
estateBoundaryOneNorth.x = 0
estateBoundaryOneNorth.y = 55
estateBoundaryOneNorth.draggable.enabled = true
estateBoundaryOneNorth.pinchable.enabled = true
estateBoundaryOneNorth.pinchable.rotate = false
estateBoundaryOneNorth.visible = false
estateBoundaryOneNorth.draggable.overdrag = false
estateBoundaryOneNorth.draggable.momentum = false
estateBoundaryOneNorth.onPinchStart ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

estateBoundaryOneNorth.onPinchEnd ->
	if @scale < 1
		@animate
			properties:
				scale: 1
			curve: "spring(300, 40)"
	else
		@draggable.constraints = constraints(@)

estateBoundaryOneNorth.onDragStart (data) ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

estateBoundaryOneNorth.onDragEnd (data) ->
	if @scale <= 1
		if @x isnt 0 or @y isnt 0
			@animate
				properties:
					x: @oriX
					y: @oriY
				curve: "spring(300, 40)"
	else
		@draggable.constraints = constraints(@)

estateBoundaryOneNorth.onDoubleTap ->
	if @scale > 1
		@animate
			properties:
				x: @oriX
				y: @oriY
				scale: 1
			curve: "spring(400, 40)"
			
estateBoundaryOneNorth.states =
	hide:
		visible: false
	show:
		visible: true
#Land Area DNA One North
dnaOneNorth.x = 0
dnaOneNorth.y = 55
dnaOneNorth.draggable.enabled = true
dnaOneNorth.pinchable.enabled = true
dnaOneNorth.pinchable.rotate = false
dnaOneNorth.visible = false
dnaOneNorth.draggable.overdrag = false
dnaOneNorth.draggable.momentum = false
dnaOneNorth.onPinchStart ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

dnaOneNorth.onPinchEnd ->
	if @scale < 1
		@animate
			properties:
				scale: 1
			curve: "spring(300, 40)"
	else
		@draggable.constraints = constraints(@)

dnaOneNorth.onDragStart (data) ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

dnaOneNorth.onDragEnd (data) ->
	if @scale <= 1
		if @x isnt 0 or @y isnt 0
			@animate
				properties:
					x: @oriX
					y: @oriY
				curve: "spring(300, 40)"
	else
		@draggable.constraints = constraints(@)

dnaOneNorth.onDoubleTap ->
	if @scale > 1
		@animate
			properties:
				x: @oriX
				y: @oriY
				scale: 1
			curve: "spring(400, 40)"
			
dnaOneNorth.states =
	hide:
		visible: false
	show:
		visible: true
#Centros Building Boundary
centrosBoundary.x = 0
centrosBoundary.y = 55
centrosBoundary.draggable.enabled = true
centrosBoundary.pinchable.enabled = true
centrosBoundary.pinchable.rotate = false
centrosBoundary.visible = false
centrosBoundary.draggable.overdrag = false
centrosBoundary.draggable.momentum = false
centrosBoundary.onPinchStart ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

centrosBoundary.onPinchEnd (data) ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

centrosBoundary.onDragEnd (data) ->
	if @scale <= 1
		if @x isnt 0 or @y isnt 0
			@animate
				properties:
					x: @oriX
					y: @oriY
				curve: "spring(300, 40)"
	else
		@draggable.constraints = constraints(@)

centrosBoundary.onDoubleTap ->
	if @scale > 1
		@animate
			properties:
				x: @oriX
				y: @oriY
				scale: 1
			curve: "spring(400, 40)"
			
centrosBoundary.states =
	hide:
		visible: false
	show:
		visible: true
#Centros Level 1 Space Product
centrosLvl1.x = 0
centrosLvl1.y = 55
centrosLvl1.draggable.enabled = true
centrosLvl1.pinchable.enabled = true
centrosLvl1.pinchable.rotate = false
centrosLvl1.visible = false
centrosLvl1.draggable.overdrag = false
centrosLvl1.draggable.momentum = false
centrosLvl1.onPinchStart ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

centrosLvl1.onPinchEnd (data) ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

centrosLvl1.onDragEnd (data) ->
	if @scale <= 1
		if @x isnt 0 or @y isnt 0
			@animate
				properties:
					x: @oriX
					y: @oriY
				curve: "spring(300, 40)"
	else
		@draggable.constraints = constraints(@)

centrosLvl1.onDoubleTap ->
	if @scale > 1
		@animate
			properties:
				x: @oriX
				y: @oriY
				scale: 1
			curve: "spring(400, 40)"
			
centrosLvl1.states =
	hide:
		visible: false
	show:
		visible: true
#Centros Level 3 Space Product
centrosLvl3.x = 0
centrosLvl3.y = 55
centrosLvl3.draggable.enabled = true
centrosLvl3.pinchable.enabled = true
centrosLvl3.pinchable.rotate = false
centrosLvl3.visible = false
centrosLvl3.draggable.overdrag = false
centrosLvl3.draggable.momentum = false
centrosLvl3.onPinchStart ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

centrosLvl3.onPinchEnd (data) ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

centrosLvl3.onDragEnd (data) ->
	if @scale <= 1
		if @x isnt 0 or @y isnt 0
			@animate
				properties:
					x: @oriX
					y: @oriY
				curve: "spring(300, 40)"
	else
		@draggable.constraints = constraints(@)

centrosLvl3.onDoubleTap ->
	if @scale > 1
		@animate
			properties:
				x: @oriX
				y: @oriY
				scale: 1
			curve: "spring(400, 40)"
			
centrosLvl3.states =
	hide:
		visible: false
	show:
		visible: true
#Astar Customer Map Layer
custOn1.x = 0
custOn1.y = 55
custOn1.draggable.enabled = true
custOn1.pinchable.enabled = true
custOn1.pinchable.rotate = false
custOn1.visible = false
custOn1.draggable.overdrag = false
custOn1.draggable.momentum = false
custOn1.onPinchStart ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

custOn1.onPinchEnd (data) ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

custOn1.onDragEnd (data) ->
	if @scale <= 1
		if @x isnt 0 or @y isnt 0
			@animate
				properties:
					x: @oriX
					y: @oriY
				curve: "spring(300, 40)"
	else
		@draggable.constraints = constraints(@)

custOn1.onDoubleTap ->
	if @scale > 1
		@animate
			properties:
				x: @oriX
				y: @oriY
				scale: 1
			curve: "spring(400, 40)"
			
custOn1.states =
	hide:
		visible: false
	show:
		visible: true
#Astar + Biomed Customer Map Layer
custOn2.x = 0
custOn2.y = 55
custOn2.draggable.enabled = true
custOn2.pinchable.enabled = true
custOn2.pinchable.rotate = false
custOn2.visible = false
custOn2.draggable.overdrag = false
custOn2.draggable.momentum = false
custOn2.onPinchStart ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

custOn2.onPinchEnd (data) ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

custOn2.onDragEnd (data) ->
	if @scale <= 1
		if @x isnt 0 or @y isnt 0
			@animate
				properties:
					x: @oriX
					y: @oriY
				curve: "spring(300, 40)"
	else
		@draggable.constraints = constraints(@)

custOn2.onDoubleTap ->
	if @scale > 1
		@animate
			properties:
				x: @oriX
				y: @oriY
				scale: 1
			curve: "spring(400, 40)"
			
custOn2.states =
	hide:
		visible: false
	show:
		visible: true
#Astar + Biomed + Apple Customer Map Layer
custOn3.x = 0
custOn3.y = 55
custOn3.draggable.enabled = true
custOn3.pinchable.enabled = true
custOn3.pinchable.rotate = false
custOn3.visible = false
custOn3.draggable.overdrag = false
custOn3.draggable.momentum = false
custOn3.onPinchStart ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

custOn3.onPinchEnd (data) ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

custOn3.onDragEnd (data) ->
	if @scale <= 1
		if @x isnt 0 or @y isnt 0
			@animate
				properties:
					x: @oriX
					y: @oriY
				curve: "spring(300, 40)"
	else
		@draggable.constraints = constraints(@)

custOn3.onDoubleTap ->
	if @scale > 1
		@animate
			properties:
				x: @oriX
				y: @oriY
				scale: 1
			curve: "spring(400, 40)"
			
custOn3.states =
	hide:
		visible: false
	show:
		visible: true
#Customer All 3 Zoomed
custOn3Zoomed.x = 0
custOn3Zoomed.y = 55
custOn3Zoomed.draggable.enabled = true
custOn3Zoomed.pinchable.enabled = true
custOn3Zoomed.pinchable.rotate = false
custOn3Zoomed.visible = false
custOn3Zoomed.draggable.overdrag = false
custOn3Zoomed.draggable.momentum = false
custOn3Zoomed.onPinchStart ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

custOn3Zoomed.onPinchEnd (data) ->
	unless @oriX?
		@oriX = @x
		@oriY = @y

custOn3Zoomed.onDragEnd (data) ->
	if @scale <= 1
		if @x isnt 0 or @y isnt 0
			@animate
				properties:
					x: @oriX
					y: @oriY
				curve: "spring(300, 40)"
	else
		@draggable.constraints = constraints(@)

custOn3Zoomed.onDoubleTap ->
	if @scale > 1
		@animate
			properties:
				x: @oriX
				y: @oriY
				scale: 1
			curve: "spring(400, 40)"
			
custOn3Zoomed.states =
	hide:
		visible: false
	show:
		visible: true


# Area Dna Data Pages
landAreaPage = new ScrollComponent
	x: 624
	y: 0
	width: 400
	height: 620
	backgroundColor: "#FFFFFF"
	
landAreaPage.states = 
	hide:
		x:624
	show:
		x:0

#Misc layers to be organized
# popScroll2 = new ScrollComponent
# 	x: 624
# 	y: 0
# 	width: 400
# 	height: 620
# 	backgroundColor: "#FFFFFF"
# 	
# popScroll2.states = 
# 	hide:
# 		x:624
# 	show:
# 		x:0
scrollaggre = new ScrollComponent
	scrollVertical: false
# 	x: 624
# 	y: 105
	width: 400
	height: 54
# 	opacity: 0
	backgroundColor: "#4787ED"
		
scrollaggre.states = 
	hide:
		opacity:0
	show:
		opacity:1
# mainLOR = new Layer
# 	backgroundColor: '#FFF'
# 	width: 400
# 	height: 607
# 	html: "<iframe width='400' height='607' src='https://preview.c9users.io/clemency10/panel/dna.html'></iframe>"
dnaAreaPage = new ScrollComponent
	x: 0
	y: 55
	width: 400
	height: 768
	backgroundColor: "#FFFFFF"
dnaLayer = new Layer
# 	x: 624
	y: 50
	width: 400
	height: 663
	visible: false	
	
dnaLayer.states = 
	hide:
		visible: false
	show:
		visible: true

# Layer Result Main Layers
spDataSelectorHolder = new ScrollComponent
	scrollVertical: false
	x:0
	y:0
	width: 400
	height: 55
	backgroundColor: "#4786ED"
		
spDataSelectorHolder.states = 
	hide:
		opacity:0
	show:
		opacity:1
custDataSelectorHolder = new ScrollComponent
	scrollVertical: false
	x:0
	y:0
	width: 400
	height: 55
	backgroundColor: "#4786ED"
		
custDataSelectorHolder.states = 
	hide:
		opacity:0
	show:
		opacity:1
layoutResultLayer = new Layer
	y: 50
	width: 400
	height: 663
	backgroundColor: "#FFFFFF"
	visible: false
	
	
layoutResultLayer.states = 
	hide:
		visible: false
	show:
		visible: true
		
lrNoInfo.x = 0
lrNoInfo.y = 10
layoutResultLayer.addChild(lrNoInfo)
lrNoInfo.placeBehind(lorScroll)
lorScroll = new ScrollComponent
	x: 400
	y: 0
	width: 400
	height: 768
	backgroundColor: "#FFFFFF"
	visible: true
	
lorScroll.states =
	hide:
		x: 400
	show:
		x: 0
		
lorScroll.states.animationOptions =
	time: 0.5
custScroll = new ScrollComponent
	x: 400
	y: 0
	width: 400
	height: 768
	backgroundColor: "#FFFFFF"
	visible: true
	
custScroll.states =
	hide:
		x: 400
	show:
		x: 0
		
custScroll.states.animationOptions =
	time: 0.5
lrdataHolder = new Layer
# 	scrollHorizontal: false
	x:0
	y:-508
	width: 400
	height: 558
	backgroundColor: "#F8F8F8"
	
custDataHolder = new Layer
# 	scrollHorizontal: false
	x:0
	y:-508
	width: 400
	height: 558
	backgroundColor: "#F8F8F8"
	
spSpecDDScroll = new ScrollComponent
	height: 160
	width: 368
	x: 16
	y: 200
	backgroundColor: "#F8F8F8"
	visible: false
	
spSpecDDScroll.scrollVertical = false

spSpecDDScroll.states =
	hide:
		visible: false
	show: 
		visible: true
allocCustScroll = new ScrollComponent
	height: 160
	width: 368
	x: 16
	y: 48
	backgroundColor: "#F8F8F8"
	visible: true
	parent: allocationDataAstar
	
allocCustScroll.scrollVertical = false

allocCustScroll.states =
	hide:
		visible: false
	show: 
		visible: true
		
perfCustScroll = new ScrollComponent
	height: 160
	width: 368
	x: 16
	y: 48
	backgroundColor: "#F8F8F8"
	visible: true
	parent: perfDataAstar
	
perfCustScroll.scrollVertical = false

perfCustScroll.states =
	hide:
		visible: false
	show: 
		visible: true
engCustScroll = new ScrollComponent
	height: 160
	width: 368
	x: 16
	y: 48
	backgroundColor: "#F8F8F8"
	visible: true
	parent: engagementDataAstar
	
engCustScroll.scrollVertical = false

engCustScroll.states =
	hide:
		visible: false
	show: 
		visible: true

dataLayerMain = new Layer
	x:-400
	y:55
	width: 400
	height: 713
	opacity: 1
	backgroundColor: "white"
	
dataLayerMain.states = 
	hide:
		x:-400
	show:
		x:0
dataScroll = new ScrollComponent
	x: 0
	y: 120
	width: 400
	height: 1024
	backgroundColor: "#00FFFFFF"

# Search bar at top
# searchHeader = new Layer
# 	html: 
# 		"
# 			<input id='searchHeader' type='text' placeholder=' Search address...' style='width:245px;height:30px;font-size:17px; border:1px solid grey ;border-radius:4px' >
# 		"
# 	backgroundColor: "false"
# 	x: 8
# 	y: 9

{InputLayer} = require "input"
headerInput = InputLayer.wrap(searchHeaderBackground, searchHeaderText)

# Initialize Layers
screenA.opacity = 0
screenB.opacity = 0
estateDNA.x = 0
estateDNA.y = 0
buildingDNA.x = 0
buildingDNA.y = 0
buildingDNA.visible = false
landparcelDNA.x = 0
landparcelDNA.y = 0
landparcelDNA.visible = false
# layerResult.x = 0
# layerResult.y = 0
Header.y = 0
Header.x = 0
Header.shadowY = 1
Header.placeBefore(mapboxLayer)
Header.bringToFront()
Infopanel.x = 1024
Infopanel.y = 55
Infopanel.opacity = 1
Infopanel.shadowX = -.5
AreaDNA.x = 1024
AreaDNA.y = 55
AreaDNA.opacity = 0
AreaDNA.shadowX = -.5

# Space Product Layers
spaceProductHolder.x = 0
spaceProductHolder.y = 55
spLvl3Holder.x = 0
spLvl3Holder.y = 55
spLvl3Holder.visible = false
spDataSelector.x = 0
spDataSelector.y = 0
unit0101.x = 0
unit0101.y = 0
unit0102.x = 0
unit0102.y = 50
unit0103.x = 0
unit0103.y = 100
unit0104.x = 0
unit0104.y = 150
unit0301.x = 0
unit0301.y = 0
generalData0101.x = 0
generalData0101.y = 0
allocationData0101.x = 0
allocationData0101.y = 0
allocationData0101.visible = false
specData0101.x = 0
specData0101.y = 0
specData0101.visible = false
pricingData0101.x = 0
pricingData0101.y = 0
pricingData0101.visible = false
fpsbButtons.x = 0
fpsbButtons.y = 473

#Space Product Specification Layers
sp0101DDData1.x = 0
sp0101DDData1.y = 0
sp0101DDData2.x = 16
sp0101DDData2.y = 248
sp0101DDData2.visible = false
sp0101DDData2.placeBehind(sd0101DD3)
sp0101DDData3.x = 16
sp0101DDData3.y = 296
sp0101DDData3.visible = false

#Customer Layers
customerHolder.x = 0
customerHolder.y = 55
custDataSelector.x = 0
custDataSelector.y = 0
custComp1.x = 0
custComp1.y = 0
custComp1.visible = false
custComp2.x = 0
custComp2.y = 50
custComp2.visible = false
custComp3.x = 0
custComp3.y = 100
custComp3.visible = false
custSearch1.visible = false
custSearch2.visible = false
custSearch3.visible = false
generalDataAstar.x = 0
generalDataAstar.y = 0
generalDataAstar.visible = true
allocationDataAstar.x = 0
allocationDataAstar.y = 0
allocationDataAstar.visible = false
perfDataAstar.x = 0
perfDataAstar.y = 0
perfDataAstar.visible = false
engagementDataAstar.x = 0
engagementDataAstar.y = 0
engagementDataAstar.visible = false
allocationDataAstarTable.x = 0
allocationDataAstarTable.y = 0
allocationDataAstarTable.parent = allocCustScroll.content
perfDataAstarTable.x = 0
perfDataAstarTable.y = 0
perfDataAstarTable.parent = perfCustScroll.content
engDataAstarTable.x = 0
engDataAstarTable.y = 0
engDataAstarTable.parent = engCustScroll.content


# Data Layers categories
dataLayerHolder.x = 0
dataLayerHolder.y = 0
datalayerheader.x = 0
datalayerheader.y = 0
dataLayersMulti.x = 0
dataLayersMulti.y = 60
jtcProducts.x = 0
jtcProducts.y = 0
jtcProducts.index = 3
jtcProductsEx.x = 0
jtcProductsEx.y = 0
jtcProductsEx.visible = false
jtcProductsSubjects.x = 0
jtcProductsSubjects.y = -60
jtcComp.x = 0
jtcComp.y = 60
jtcCompEx.x = 0
jtcCompEx.y = 60
jtcCompEx.visible = false
jtcCompSubjects.x = 0
jtcCompSubjects.y = 0
jtcTransport.x = 0
jtcTransport.y = 120
jtcTransportEx.x = 0
jtcTransportEx.y = 120
jtcTransportEx.visible = false
jtcTranSubjects.x = 0
jtcTranSubjects.y = -120


landAreaData.x = 0
landAreaData.y = 0
close_btn.x = 0
close_btn.y = 0

#DNA Area Pop up Layers
lpPopup.x = 50
lpPopup.y = 100
lpPopup.visible = false
lpPopup.bringToFront()

# Arrows for scrolling Layers 
L_arrow.x = 0
L_arrow.y = 0
R_arrow.x = 345
R_arrow.y = 0

# scrolling layers 
aggreA.x = 0
aggreA.y = 0
aggreB.x = 0
aggreB.y = 0

#Basemap Layers


#Left side data layer layers
#Unit Filter Menu Layers

unitFilterPanel.x = -200
unitFilterPanel.y = Align.bottom
unitFilterPanel.states =
	hide:
		x: -200
	show: 
		x: 400
	collapse:
		x: -175
	flushleft:
		x: 0

ufpBack.states =
	collapse:
		rotation: 180
	expand:
		rotation: 0
		

levelDD = new Layer
	html: 
		"
		<select id='selLevel' style='height:20px; width:150px'>
			<option value='lvl1'>Level 1</option>
			<option value='lvl2'>Level 2</option>
			<option value='lvl3'>Level 3</option>
			<option value='lvl4'>Level 4</option>
		</select>
		"
	backgroundColor: "false"
	x: 10
	y: -5
	
vacOption.states = 
	hide:
		opacity: 0
	show:
		opacity: 1
		
allOption.states =
	hide:
		opacity: 0
	show:
		opacity: 1
		
poDD = new Layer
	html: 
		"
		<select id='poDD' style='height:20px; width:150px'>
			<option value='poAll'>All</option>
			<option value='AMU'>AMU</option>
			<option value='BEC'>BEC</option>
			
		</select>
		"
	backgroundColor: "false"
	x: 10
	y: -5
	
puDD = new Layer
	html: 
		"
		<select id='puDD' style='height:20px; width:150px'>
			<option value='puAll'>All</option>
			<option value='puCom'>Commercial</option>
			<option value='puInd'>Industrial</option>
			<option value='puRet'>Retail</option>
			
		</select>
		"
	backgroundColor: "false"
	x: 10
	y: -5
	
faRangeSlider = new RangeSliderComponent
	x: 12
	y: Align.center
	width: 148
	height: 8
	knobSize: 25
	min: 0 
	max: 1200
	minValue: 0
	maxValue: 1200
	parent: faSliderHolder
	
rangeStart = Utils.round(faRangeSlider.minValue)	
rangeEnd = Utils.round(faRangeSlider.maxValue)
	
faRangeSlider.onValueChange ->
	rangeMin.html = Math.round(@minValue)
	rangeMax.html = Utils.round(@maxValue)
	
rangeMin = new Layer
	parent: faRangeSlider.minKnob
	html: 0
	size: 25
	backgroundColor: ""
	color: "#000000"
	
rangeMin.style =
	fontSize: "11px"
	textAlign: "center"
	
rangeMax = new Layer
	parent: faRangeSlider.maxKnob
	html: faRangeSlider.maxValue
	size: 25
	backgroundColor: ""
	color: "#000000"
	
rangeMax.style =
	fontSize: "11px"
	textAlign: "center"
#Company Customer Filter Menu Layers
custFilterPanel.x = -200
custFilterPanel.y = Align.bottom
custFilterPanel.states =
	hide:
		x:-200
	show:
		x:400
	collapse:
		x:-175
	flushleft:
		x: 0
		
cfpBack.states =
	collapse:
		rotation: 180
	expand:
		rotation: 0
		
customerInput = InputLayer.wrap(searchCustBackground, searchCustText)
		
custLayerDD = new Layer
	html: 
		"
		<select id='custLayerSel' style='height:23px; width:160px'>
			<option value='ceODeptAll'>All (default)</option>
			<option value='ceODept1'>Land Parcel</option>
			<option value='ceODept2'>Building</option>
			<option value='ceODept3'>Unit</option>
		</select>
		"
	backgroundColor: "false"
	x: 10
	y: Align.top
	
# custSearch1.x = 0
# custSearch2.y = 0

custExpiryDD = new Layer
	html: 
		"
		<select id='custExpirySel' style='height:23px; width:160px'>
			<option value='2018'>2018</option>
			<option value='2019'>2019</option>
			<option value='2020'>2020</option>
			<option value='2021'>2021</option>
			<option value='2022'>2022</option>
			<option value='2023'>2023</option>
		</select>
		"
	backgroundColor: "false"
	x: 10
	y: Align.top
	parent: compLayerFilterHolder2
	
#------------------------------------
#STATES
#------------------------------------

#Master States
 #DATA LAYER STATES		
		
offSwitch.states =
	on:
		backgroundColor: "#66BB66"
	off:
		backgroundColor: "#FFFFFF"
		
offSwitchButton.states =
	on: 
		x: 27
	off: 
		x: 0
		
jtcProducts.states =
	reset:
		y: jtcProducts.y
		visible: jtcProducts.visible
	hide:
		visible: false
	show:
		visible: true
		
		
jtcProductsEx.states =
	reset:
		y: jtcProductsEx.y
		visible: jtcProductsEx.visible
	hide:
		visible: false
	show:
		visible: true
		
		
jtcProductsSubjects.states =
	reset:
		y: jtcProductsSubjects.y
	prodCollapse:
		y: jtcProductsSubjects.y
	prodExpand:
		y: jtcProductsSubjects.y + 120
		
unitDataLayer.states =
	inactive:
		backgroundColor: "#C5DDED"
	active:
		backgroundColor: "#57B2EA"
		
		
jtcComp.states =
	hide:
		visible: false
	show:
		visible: true
	prodCollapse:
		y:jtcComp.y 
	prodExpand:
		y:jtcComp.y + 120
		
jtcCompEx.states =
	hide:
		visible: false
	show:
		visible: true
	prodCollapse:
		y:jtcCompEx.y 
	prodExpand:
		y:jtcCompEx.y + 120
		
jtcCompSubjects.states =
	prodCollapse:
		y: jtcCompSubjects.y
	prodExpand:
		y: jtcCompSubjects.y + 120
		
compDataLayer.states =
	inactive:
		backgroundColor: "#C5DDED"
	active:
		backgroundColor: "#57B2EA"
		
		
jtcTransport.states =
	hide:
		visible: false
	show:
		visible: true
	prodCollapse:
		y:jtcTransport.y - 120
	prodExpand:
		y:jtcTransport.y + 120
		
		
		
jtcTransportEx.states =
	hide:
		visible: false
	show:
		visible: true
	prodCollapse:
		y:jtcTransportEx.y - 120
	prodExpand:
		y:jtcTransportEx.y + 120
		
		
jtcTranSubjects.states =
	prodCollapse:
		y: jtcTranSubjects.y
	prodExpand:
		y: jtcTranSubjects.y + 120
	transCollapse:
		y: jtcTranSubjects.y - 420
	transExpand:
		y: jtcTranSubjects.y + 420
#AREA DNA STATES
buildingDNA.states =
	hide:
		visible: false
	show:
		visible: true
		
landparcelDNA.states =
	hide:
		visible: false
	show:
		visible: true
		
estateDNA.states =
	hide:
		visible: false
	show:
		visible: true
		
tabline.states =
	left:
		x: 0
		width: 122
	right:
		x: 135
		width: 100

		
Infopanel.states = 
	hide:
		x:1024
	show:
		x:624
		
		
AreaDNA.states = 
	hide:
		x:1024
	show:
		x:624
		
		
resultsTab.states =
	inactive:
		color: "#939091"
	active:
		color: "#4787ED"

areaDNAtab.states =
	inactive:
		color: "#939091"
	active:
		color: "#4787ED"
		
estateB.states =
	inactive:
		color: "#94DFFF"
		fontStyle: "Regular"
		
	active:
		color: "#FFFFFF"
		fontStyle: "Semibold"
		
buildingB.states =
	inactive:
		color: "#94DFFF"
		fontstyle: "Regular"
	active:
		color: "#FFFFFF"
		fontstyle: "Semibold"
		
landparcelB.states =
	inactive:
		color: "#94DFFF"
		fontStyle: "Regular"
	active:
		color: "#FFFFFF"
		Style: "italic"   #"oblique" "normal"
		
estateA.states =
	inactive:
		color: "#94DFFF"
		fontStyle: "Regular"
		
	active:
		color: "#FFFFFF"
		fontStyle: "Semibold"
		
buildingA.states =
	inactive:
		color: "#94DFFF"
		fontstyle: "Regular"
	active:
		color: "#FFFFFF"
		fontstyle: "Semibold"
		
landparcelA.states =
	inactive:
		color: "#94DFFF"
		fontStyle: "Regular"
	active:
		color: "#FFFFFF"
		Style: "italic"   #"oblique" "normal"
		
unitA.states =
	inactive:
		color: "#94DFFF"
		fontstyle: "Regular"
	active:
		color: "#FFFFFF"
		fontstyle: "Semibold"
#LAYER RESULT STATES
sp0101DDData1.states =
	hide:
		visible: false
	show:
		visible: true
		
sp0101DDData2.states =
	hide:
		visible: false
	show:
		visible: true
		
sp0101DDData3.states =
	hide:
		visible: false
	show:
		visible: true
		
spDDPlus1.states =
	hide:
		opacity: 0
	show:
		opacity: 1
		
spDDPlus2.states =
	hide:
		opacity: 0
	show:
		opacity: 1
		
spDDPlus3.states =
	hide:
		opacity: 0
	show:
		opacity: 1

unit0101Plus.states =
	hide:
		opacity: 0
	show:
		opacity: 1
		
generalData0101.states =
	hide:
		visible: false
	show:
		visible: true
		
allocationData0101.states =
	hide:
		visible: false
	show:
		visible: true
		
specData0101.states =
	hide:
		visible: false
	show:
		visible: true
		
pricingData0101.states =
	hide:
		visible: false
	show:
		visible: true
		
spGeneral.states =
	inactive:
		color: "#94DFFF"
		fontStyle: "Regular"
	
	active:
		color: "#FFFFFF"
		fontStyle: "Semibold"
		
spAllocation.states =
	inactive:
		color: "#94DFFF"
		fontStyle: "Regular"
	
	active:
		color: "#FFFFFF"
		fontStyle: "Semibold"
		
spSpecification.states =
	inactive:
		color: "#94DFFF"
		fontStyle: "Regular"
	
	active:
		color: "#FFFFFF"
		fontStyle: "Semibold"
		
spPricing.states =
	inactive:
		color: "#94DFFF"
		fontStyle: "Regular"
	
	active:
		color: "#FFFFFF"
		fontStyle: "Semibold"
		
spaceProductHolder.states =
	hide:
		visible: false
	show:
		visible: true
		
spLvl3Holder.states =
	hide:
		visible: false
	show: 
		visible: true
#POPUP STATES
lpPopup.states =
	hide:
		visible: false
	show:
		visible: true
#Customer Filter States
custSearch1.states =
	hide:
		visible: false
	show:
		visible: true
		
custSearch2.states =
	hide:
		visible: false
	show:
		visible: true
		
custSearch3.states =
	hide:
		visible: false
	show:
		visible: true
		
custComp1.states =
	hide:
		visible: false
	show:
		visible: true
		
custComp2.states =
	hide:
		visible: false
	show:
		visible: true
		
custComp3.states =
	hide:
		visible: false
	show:
		visible: true
		
custSearch1Plus.states =
	hide:
		opacity: 0
	show:
		opacity: 1
#Customer Layer States
custGeneral.states =
	inactive:
		color: "#94DFFF"
		fontStyle: "Regular"
	
	active:
		color: "#FFFFFF"
		fontStyle: "Semibold"
		
custAllocation.states =
	inactive:
		color: "#94DFFF"
		fontStyle: "Regular"
	
	active:
		color: "#FFFFFF"
		fontStyle: "Semibold"
		
custPerformance.states =
	inactive:
		color: "#94DFFF"
		fontStyle: "Regular"
	
	active:
		color: "#FFFFFF"
		fontStyle: "Semibold"
		
custEngagement.states =
	inactive:
		color: "#94DFFF"
		fontStyle: "Regular"
	
	active:
		color: "#FFFFFF"
		fontStyle: "Semibold"
		
generalDataAstar.states =
	hide:
		visible: false
	show:
		visible: true
		
allocationDataAstar.states =
	hide:
		visible: false
	show:
		visible: true
		
perfDataAstar.states =
	hide:
		visible: false
	show:
		visible: true
		
engagementDataAstar.states =
	hide:
		visible: false
	show:
		visible: true
		
#Functions
#exp/col 120
expand120 = (layer) ->
	layer.animate
		y:layer.y + 120
		options: 
			curve: "ease"
			time: 0.3
	    
collapse120 = (layer) ->
	layer.animate
		y:layer.y - 120
		options: 
			curve: "ease"
			time: 0.3
#exp/col Transport Subjects
expandTrans = (layer) ->
	layer.animate
		y:layer.y + jtcTranSubjects.height
		options: 
			curve: "ease"
			time: 0.3
			
collapseTrans = (layer) ->
	layer.animate
		y:layer.y - jtcTranSubjects.height
		options: 
			curve: "ease"
			time: 0.3
			
leftPanelCollapse = ->
	dataLayerMain.states.switch "hide"
	
expand560 = (layer) ->
	layer.animate
		y: layer.y + 558
		options:
			curve: "ease"
			time: 0.3
			
collapse560 = (layer) ->
	layer.animate
		y: layer.y - 558
		options:
			curve: "ease"
			time: 0.3
			
expand160 = (layer) ->
	layer.animate
		y: layer.y + 160
		options:
			curve: "ease"
			time: 0.3
			
collapse160 = (layer) ->
	layer.animate
		y: layer.y - 160
		options:
			curve: "ease"
			time: 0.3
	
showlayer = (layer) ->
	layer.states.switch "show"
	
hidelayer = (layer) ->
	layer.states.switch "hide"
	
showInstant = (layer) ->
	layer.states.switchInstant "show"
	
hideInstant = (layer) ->
	layer.states.switchInstant "hide"
	
activelayer = (layer) ->
	layer.states.switchInstant "active"
	
inactivelayer = (layer) ->
	layer.states.switchInstant "inactive"
	
expandBased = (layer,layer2) ->
	layer.animate
		y: layer.y + layer2.height
		options:
			curve: "ease"
			time: 0.3
			
collapseBased = (layer,layer2) ->
	layer.animate
		y: layer.y - layer2.height
		options:
			curve: "ease"
			time: 0.3
	
	
constraints = (layer) ->
	xOffset = Math.abs(layer.width * layer.scale - layer.width)
	yOffset = Math.abs(layer.height * layer.scale - layer.height)
	
	marginLeft = xOffset - layer.originX * xOffset
	marginTop = yOffset - layer.originY * yOffset
	
	return frame =
		x: layer.oriX - marginLeft
		y: layer.oriY - marginTop
		width: layer.width * layer.scale
		height: layer.height * layer.scale
masterMapReset = ->
	estateBoundaryBasemap.states.switchInstant "hide"
	estateBoundaryOneNorth.states.switchInstant "hide"
	dnaOneNorth.states.switchInstant "hide"
	centrosBoundary.states.switchInstant "hide"
	centrosLvl1.states.switchInstant "hide"
	centrosLvl3.states.switchInstant "hide"
	hideInstant(custOn1)
	hideInstant(custOn2)
	hideInstant(custOn3)
	hideInstant(custOn3Zoomed)
#One North Boundary Show
onShow = ->
	masterMapReset()
	estateBoundaryBasemap.states.switchInstant "hide"
	estateBoundaryOneNorth.states.switchInstant "show"
	Infopanel.states.switchInstant "show"
	dnaLayer.states.switchInstant "show"			
centrosBoundaryShow = ->
	masterMapReset()
	centrosBoundary.states.switchInstant "show"
centrosLvl1Show = ->
	masterMapReset()
	centrosLvl1.states.switchInstant "show"
centrosLvl3Show = ->
	masterMapReset()
	centrosLvl3.states.switchInstant "show"


#Unit Filter Function
updateLevel = ->
	if document.getElementById("selLevel").value is "lvl3"
		centrosLvl3Show()
		hideInstant(spaceProductHolder)
		showInstant(spLvl3Holder)
		
	if document.getElementById("selLevel").value is "lvl1"
		centrosLvl1Show()
		hideInstant(spLvl3Holder)
		showInstant(spaceProductHolder)
flushUnitFilter = ->
	unitFilterPanel.states.switch "flushleft"
	ufpBack.states.switch "collapse"
showUnitFilter = ->
	unitFilterPanel.states.switch "show"
	ufpBack.states.switch "expand"	

#Multi-Select Lock
ssLock = false # to prevent multi selecting of data layers
	
#-------------------------------
#Interactions
#-------------------------------
#Header Interactions
mapboxLayer.onClick ->
	Infopanel.states.switch "show"
# 	Infopanel.stateCycle("show","hide")
# 	mapboxLayer.opacity = 0
# 	estateBoundaryJurong.visible = true
	
resetButt.onClick ->
# 	estateBoundaryBasemap.states.switch "show"
# 	Infopanel.states.switch "hide"
# 	dataLayerMain.states.switch "hide"
# 	window.location.reload()
	masterMapReset()
	estateBoundaryBasemap.states.switchInstant "show"
	Infopanel.states.switch "hide"
	dataLayerMain.states.switch "hide"
infopanelButt.onClick (event,layer) ->
	Infopanel.stateCycle("show","hide")
headMenu.onClick ->
	dataLayerMain.stateCycle("show","hide")
	
	if unitDataLayer.states.current.name is "active"
		if unitFilterPanel.states.current.name is "flushleft"
			showUnitFilter()
		else
			unitFilterPanel.stateCycle("hide","show")
			ufpBack.stateCycle("collapse","expand")
			
	else if compDataLayer.states.current.name is "active"
		custFilterPanel.stateCycle("hide","show")
searchHeaderButton.onClick (event,layer) ->
	if headerInput.value is "One-North"
		masterMapReset()
		onShow()
	if headerInput.value is "138668"
		masterMapReset()
		clickBuildingDNA()
		centrosBoundaryShow()
		clickAreaDNA()
	
#Basemap Interactions
bmONBoundary.onMouseOver (event,layer) ->
	bmONBoundary.borderColor = "#FF0000"
	bmONBoundary.color = "#FF0000"
	bmONBoundary.opacity = .4
	bmONTitle.opacity = 1
bmONBoundary.onMouseOut (event,layer) ->
	bmONBoundary.borderColor = "#FB68D4"
	bmONBoundary.opacity = 0
	bmONTitle.opacity = 0
bmONBoundary.onClick (event,layer) ->
	masterMapReset()
	onShow()
	clickAreaDNA()
	clickEstateDNA()

#One North Map Interactions

#Infopanel on right interactions
close_1.onClick ->
	Infopanel.states.switch "hide"
areaDNAtab_1.onClick ->
	areaDNAtab.states.switchInstant "active"
	resultsTab.states.switchInstant "inactive"	
	tabline.states.switch "right"
	if estateBoundaryBasemap.states.current.name is "hide"
		dnaLayer.states.switchInstant "show"
	layoutResultLayer.states.switchInstant "hide"
	
clickAreaDNA = ->
	areaDNAtab.states.switchInstant "active"
	resultsTab.states.switchInstant "inactive"	
	tabline.states.switch "right"
	if estateBoundaryBasemap.states.current.name is not "show"
		dnaLayer.states.switchInstant "show"
	layoutResultLayer.states.switchInstant "hide"
resultsTab_1.onClick ->
	resultsTab.states.switchInstant "active"
	areaDNAtab.states.switchInstant "inactive"	
	tabline.states.switch "left"
	dnaLayer.states.switchInstant "hide"
	layoutResultLayer.states.switchInstant "show"

#Dna Card Interactions
laCard.onClick ->
	landAreaPage.states.switch "show"
	landAreaPage.bringToFront()
	dnaOneNorth.states.switchInstant "show"
	estateBoundaryOneNorth.states.switchInstant "hide"
	
laBack.onClick ->
	landAreaPage.states.switch "hide"	
	dnaOneNorth.states.switch "hide"
	estateBoundaryOneNorth.states.switch "show"
lpInfoButt.onClick (event,layer) ->
	lpPopup.states.switch "show"
lpPopupBack.onClick (event,layer) ->
	lpPopup.states.switch "hide"

close_btn.onClick ->
# 	DNA.bringToFront()
# 	population.ignoreEvents = true
	popScroll.states.switch "hide"

#Aggregate Option Interactions
#dnaAreaLayers on Clicks
estateB.onClick (event, layer) ->
	estateDNA.states.switch "show"
	landparcelDNA.states.switch "hide"
	buildingDNA.states.switch "hide"
	landparcelB.states.switchInstant "inactive"
	estateB.states.switchInstant "active"
	buildingB.states.switchInstant "inactive"
	if estateBoundaryOneNorth.states.current.name is "hide"
		onShow()
		
clickEstateDNA = ->
	estateDNA.states.switch "show"
	landparcelDNA.states.switch "hide"
	buildingDNA.states.switch "hide"
	landparcelB.states.switchInstant "inactive"
	estateB.states.switchInstant "active"
	buildingB.states.switchInstant "inactive"
	if estateBoundaryOneNorth.states.current.name is "hide"
		onShow()
		

landparcelB.onClick (event, layer) ->
	landparcelDNA.states.switch "show"
	estateDNA.states.switch "hide"
	buildingDNA.states.switch "hide"
	landparcelB.states.switchInstant "active"
	estateB.states.switchInstant "inactive"
	buildingB.states.switchInstant "inactive"
buildingB.onClick (event, layer) ->
	buildingDNA.states.switch "show"
	estateDNA.states.switch "hide"
	landparcelDNA.states.switch "hide"
	landparcelB.states.switchInstant "inactive"
	estateB.states.switchInstant "inactive"
	buildingB.states.switchInstant "active"
	centrosBoundaryShow()
	
clickBuildingDNA = ->
	buildingDNA.states.switch "show"
	estateDNA.states.switch "hide"
	landparcelDNA.states.switch "hide"
	landparcelB.states.switchInstant "inactive"
	estateB.states.switchInstant "inactive"
	buildingB.states.switchInstant "active"
	centrosBoundaryShow()

#Space Product interactions
unit0101Plus.onClick (event,layer) ->
	if unit0101Plus.states.current.name is "hide"
		unit0101Plus.states.switchInstant "show"
		collapse560(unit0102)
		collapse560(unit0103)
		collapse560(unit0104)
		collapse560(lrdataHolder)
	else
		unit0101Plus.states.switchInstant "hide"
		expand560(unit0102)
		expand560(unit0103)
		expand560(unit0104)
		expand560(lrdataHolder)
spGeneral.onClick (event,layer) ->
	activelayer(spGeneral)
	inactivelayer(spAllocation)
	inactivelayer(spSpecification)
	inactivelayer(spPricing)
	showlayer(generalData0101)
	hidelayer(allocationData0101)
	hidelayer(specData0101)
	hidelayer(pricingData0101)
spAllocation.onClick (event,layer) ->
	activelayer(spAllocation)
	inactivelayer(spGeneral)
	inactivelayer(spSpecification)
	inactivelayer(spPricing)
	showlayer(allocationData0101)
	hidelayer(generalData0101)
	hidelayer(specData0101)
	hidelayer(pricingData0101)
spSpecification.onClick (event,layer) ->
	activelayer(spSpecification)
	inactivelayer(spAllocation)
	inactivelayer(spGeneral)
	inactivelayer(spPricing)
	showlayer(specData0101)
	hidelayer(allocationData0101)
	hidelayer(generalData0101)
	hidelayer(pricingData0101)
spPricing.onClick (event,layer) ->
	activelayer(spPricing)
	inactivelayer(spAllocation)
	inactivelayer(spSpecification)
	inactivelayer(spGeneral)
	showlayer(pricingData0101)
	hidelayer(allocationData0101)
	hidelayer(specData0101)
	hidelayer(generalData0101)
	
#Space Product Spec Interactions
spDDPlus1.onClick (event,layer) ->
	if spDDPlus1.states.current.name is "hide"
		spDDPlus1.states.switchInstant "show"
		spSpecDDScroll.states.switch "hide"
		collapse160(sd0101DD2)
		collapse160(sd0101DD3)
		collapse160(sp0101DDData2)
		collapse160(sp0101DDData3)
		collapse160(fpsbButtons)
		collapse160(unit0102)
		collapse160(unit0103)
		collapse160(unit0104)
	else
		spDDPlus1.states.switchInstant "hide"
		spSpecDDScroll.states.switch "show"
		expand160(sd0101DD2)
		expand160(sd0101DD3)
		expand160(sp0101DDData2)
		expand160(sp0101DDData3)
		expand160(fpsbButtons)
		expand160(unit0102)
		expand160(unit0103)
		expand160(unit0104)
spDDPlus2.onClick (event,layer) ->
	if spDDPlus2.states.current.name is "hide"
		spDDPlus2.states.switchInstant "show"
		sp0101DDData2.states.switch "hide"
		collapseBased(sd0101DD3,sp0101DDData2)
		
		collapseBased(sp0101DDData3,sp0101DDData2)
		collapseBased(fpsbButtons,sp0101DDData2)
		collapseBased(unit0102,sp0101DDData2)
		collapseBased(unit0103,sp0101DDData2)
		collapseBased(unit0104,sp0101DDData2)
	else
		spDDPlus2.states.switchInstant "hide"
		sp0101DDData2.states.switch "show"
		expandBased(sd0101DD3,sp0101DDData2)
		expandBased(sp0101DDData3,sp0101DDData2)
		expandBased(fpsbButtons,sp0101DDData2)
		expandBased(unit0102,sp0101DDData2)
		expandBased(unit0103,sp0101DDData2)
		expandBased(unit0104,sp0101DDData2)
spDDPlus3.onClick (event,layer) ->
	if spDDPlus3.states.current.name is "hide"
		spDDPlus3.states.switchInstant "show"
		sp0101DDData3.states.switch "hide"
		collapseBased(fpsbButtons,sp0101DDData3)
		collapseBased(unit0102,sp0101DDData3)
		collapseBased(unit0103,sp0101DDData3)
		collapseBased(unit0104,sp0101DDData3)
	else
		spDDPlus3.states.switchInstant "hide"
		sp0101DDData3.states.switch "show"
		expandBased(fpsbButtons,sp0101DDData3)
		expandBased(unit0102,sp0101DDData3)
		expandBased(unit0103,sp0101DDData3)
		expandBased(unit0104,sp0101DDData3)
	
	
#Data Layer interactions
offSwitch.onClick (event, layer) ->
	offSwitchButton.stateCycle("on", "off")
	offSwitch.stateCycle("on","off")

jtcProducts.onClick (event, layer) ->
	jtcProductsEx.states.switch "show"
	jtcProducts.states.switch "hide"
	expand120(jtcProductsSubjects)
	expand120(jtcComp)
	expand120(jtcCompEx)
	expand120(jtcCompSubjects)
	expand120(jtcTransport)
	expand120(jtcTransportEx)
	expand120(jtcTranSubjects)
jtcProductsEx.onClick (event, layer) ->
	jtcProductsEx.states.switch "hide"
	jtcProducts.states.switch "show"
	collapse120(jtcProductsSubjects)
	collapse120(jtcComp)
	collapse120(jtcCompEx)
	collapse120(jtcCompSubjects)
	collapse120(jtcTransport)
	collapse120(jtcTransportEx)
	collapse120(jtcTranSubjects)
unitDataLayer.onClick (event, layer) ->
	if ssLock is false
			unitFilterPanel.stateCycle("show","hide")
			unitDataLayer.stateCycle("active","inactive")
			if centrosBoundary.states.current.name is "show"
				lorScroll.states.switch "show"
				centrosLvl1Show()
			ssLock = true
			
	else 
		if unitDataLayer.states.current.name is "active"
			unitFilterPanel.stateCycle("show","hide")
			unitDataLayer.stateCycle("active","inactive")
			if centrosLvl1.states.current.name is "show" or centrosLvl3.states.current.name is "show"
				centrosBoundaryShow()
			lorScroll.states.switch "hide"
			ssLock = false


ufpBack.onClick (event, layer) ->
	dataLayerMain.stateCycle("hide","show")
	unitFilterPanel.stateCycle("flushleft","show")
	ufpBack.stateCycle("collapse","expand")
	
jtcComp.onClick (event, layer) ->
	jtcCompEx.states.switch "show"
	jtcComp.states.switch "hide"
	expand120(jtcCompSubjects)
	expand120(jtcTransport)
	expand120(jtcTransportEx)
	expand120(jtcTranSubjects)
jtcCompEx.onClick (event, layer) ->
	jtcCompEx.states.switch "hide"
	jtcComp.states.switch "show"
	collapse120(jtcCompSubjects)
	collapse120(jtcTransport)
	collapse120(jtcTransportEx)
	collapse120(jtcTranSubjects)
compDataLayer.onClick (event, layer) ->
	if ssLock is false
		compDataLayer.stateCycle("active","inactive")
		custFilterPanel.stateCycle("show","hide")
		custScroll.states.switch "show"
		ssLock = true
	else
		if compDataLayer.states.current.name is "active"
			compDataLayer.stateCycle("active","inactive")
			custFilterPanel.stateCycle("show","hide")
			custScroll.states.switch "hide"
			masterMapReset()
			onShow()
			ssLock = false
cfpBack.onClick (event, layer) ->
	dataLayerMain.stateCycle("hide","show")
	custFilterPanel.stateCycle("flushleft","show")
	cfpBack.stateCycle("collapse","expand")

jtcTransport.onClick (event, layer) ->
	jtcTransport.states.switch "hide"
	jtcTransportEx.states.switch "show"
	expandTrans(jtcTranSubjects)
jtcTransportEx.onClick (event, layer) ->
	jtcTransport.states.switch "show"
	jtcTransportEx.states.switch "hide"
	collapseTrans(jtcTranSubjects)





#Unit Filter Interactions
#Level Filter Listener
document.getElementById("selLevel").addEventListener("change", updateLevel)

vacOption.onClick (event,layer) ->
	vacOption.stateCycle("show","hide")
	
allOption.onClick (event,layer) ->
	allOption.stateCycle("show","hide")

#Customer Layer Result Interactions
custGeneral.onClick (event,layer) ->
	activelayer(custGeneral)
	inactivelayer(custAllocation)
	inactivelayer(custPerformance)
	inactivelayer(custEngagement)
	showlayer(generalDataAstar)
	hidelayer(allocationDataAstar)
	hidelayer(perfDataAstar)
	hidelayer(engagementDataAstar)
custAllocation.onClick (event,layer) ->
	activelayer(custAllocation)
	inactivelayer(custGeneral)
	inactivelayer(custPerformance)
	inactivelayer(custEngagement)
	showlayer(allocationDataAstar)
	hidelayer(generalDataAstar)
	hidelayer(perfDataAstar)
	hidelayer(engagementDataAstar)
custPerformance.onClick (event,layer) ->
	activelayer(custPerformance)
	inactivelayer(custAllocation)
	inactivelayer(custGeneral)
	inactivelayer(custEngagement)
	showlayer(perfDataAstar)
	hidelayer(allocationDataAstar)
	hidelayer(generalDataAstar)
	hidelayer(engagementDataAstar)
custEngagement.onClick (event,layer) ->
	activelayer(custEngagement)
	inactivelayer(custAllocation)
	inactivelayer(custPerformance)
	inactivelayer(custGeneral)
	showlayer(engagementDataAstar)
	hidelayer(allocationDataAstar)
	hidelayer(perfDataAstar)
	hidelayer(generalDataAstar)
	
#Customer Filter Interactions
searchCustButton.onClick (event,layer) ->
	if customerInput.value is "Astar"
		masterMapReset()
		showInstant(custOn1)
		showInstant(custSearch1)
		showInstant(custComp1)
	if customerInput.value is "Biomedical Sciences"
		masterMapReset()
		showInstant(custOn2)
		showInstant(custSearch2)
		showInstant(custComp2)
	if customerInput.value is "Apple"
		masterMapReset()
		showInstant(custOn3)
		showInstant(custSearch3)
		showInstant(custComp3)
custSearch1Plus.onClick (event,layer) ->
	if custSearch1Plus.states.current.name is "hide"
		showInstant(custSearch1Plus)
		collapse560(custComp2)
		collapse560(custComp3)
		collapse560(custDataHolder)
	else
		hideInstant(custSearch1Plus)
		expand560(custComp2)
		expand560(custComp3)
		expand560(custDataHolder)

#Customer Map Interactions
CustOn3ZoomClick.onClick ->
	masterMapReset()
	custOn3Zoomed.states.switchInstant "show"

#Nesting
# setting parent as scroll.content enables scroll otherwise it will be static
#Right Side Main Panel Nesting
Infopanel.addChild(layoutResultLayer)
Infopanel.addChild(dnaLayer)
#Layer Level Scrolling Nesting
aggreB.parent = scrollaggre.content
# aggreA.parent = scrollaggre2.content

# DNA Area Nesting 
dnaLayer.addChild(scrollaggre)
dnaLayer.addChild(dnaAreaPage)
estateDNA.parent = dnaAreaPage.content
landparcelDNA.parent = dnaAreaPage.content
buildingDNA.parent = dnaAreaPage.content
dnaAreaPage.addChild(landAreaPage)
landAreaData.parent = landAreaPage.content
# Layer Result Nesting

#Space Product LR Nesting
layoutResultLayer.addChild(lorScroll)
spaceProductHolder.parent = lorScroll.content

lorScroll.addChild(spDataSelectorHolder)
spDataSelector.parent = spDataSelectorHolder.content
spaceProductHolder.addChild(unit0101)
spaceProductHolder.addChild(unit0102)
spaceProductHolder.addChild(unit0103)
spaceProductHolder.addChild(unit0104)
spaceProductHolder.addChild(lrdataHolder)
lrdataHolder.placeBehind(unit0101)
lrdataHolder.addChild(generalData0101)
lrdataHolder.addChild(allocationData0101)
lrdataHolder.addChild(specData0101)
lrdataHolder.addChild(pricingData0101)
lrdataHolder.addChild(fpsbButtons)

#Specification Tab Nesting
specData0101.addChild(spSpecDDScroll)
specData0101.addChild(sp0101DDData2)
specData0101.addChild(sp0101DDData3)
sp0101DDData1.parent = spSpecDDScroll.content


#Customer LR Nesting
layoutResultLayer.addChild(custScroll)
customerHolder.parent = custScroll.content
custScroll.addChild(custDataSelectorHolder)
custDataSelector.parent = custDataSelectorHolder.content
customerHolder.addChild(custComp1)
customerHolder.addChild(custComp2)
customerHolder.addChild(custComp3)
customerHolder.addChild(custDataHolder)
custDataHolder.placeBehind(custComp1)
custDataHolder.addChild(generalDataAstar)
custDataHolder.addChild(allocationDataAstar)

custDataHolder.addChild(perfDataAstar)
custDataHolder.addChild(engagementDataAstar)

#Level 3 layers
spLvl3Holder.parent = lorScroll.content
spLvl3Holder.addChild(unit0301)

# Data Layer Nesting
dataLayerMain.addChild(datalayerheader)
dataLayerMain.addChild(dataLayersMulti)
dataLayerMain.addChild(dataScroll)
dataLayerHolder.parent = dataScroll.content

dataLayerHolder.addSubLayer(jtcProducts)
dataLayerHolder.addSubLayer(jtcProductsEx)
dataLayerHolder.addSubLayer(jtcProductsSubjects)
jtcProductsSubjects.sendToBack()
dataLayerHolder.addSubLayer(jtcComp)
dataLayerHolder.addSubLayer(jtcCompEx)
dataLayerHolder.addSubLayer(jtcCompSubjects)
jtcCompSubjects.sendToBack()
dataLayerHolder.addSubLayer(jtcTransport)
dataLayerHolder.addSubLayer(jtcTransportEx)
dataLayerHolder.addSubLayer(jtcTranSubjects)
jtcTranSubjects.sendToBack()
# Unit Filter Nesting
# filterPanel.addChild(unitFilterPanel)
lvlSelectorFrame.addChild(levelDD)
poHolder.addChild(poDD)
puHolder.addChild(puDD)
unitFilterPanel.placeBehind(dataLayerMain)
#Company Filter Nesting
compLayerFilterHolder.addChild(custLayerDD)
custFilterPanel.placeBehind(dataLayerMain)

# searchHolder.addChild(myNavbar)
# searchHolder.addChild(searchHeader)
dataLayerMain.placeBehind(Header)
jtcTranSubjects.placeBehind(Header)
Infopanel.placeBefore(Header)


# Scrolling Convention
dnaAreaPage.scrollHorizontal = false
dataScroll.scrollHorizontal = false
landAreaPage.scrollHorizontal = false
lorScroll.scrollHorizontal = false
lorScroll.mouseWheelEnabled = true
custScroll.scrollHorizontal = false
dnaAreaPage.mouseWheelEnabled = true
# population.mouseWheelEnabled = true

landAreaPage.mouseWheelEnabled = true
# popScroll2.mouseWheelEnabled = true
dataScroll.mouseWheelEnabled = true
#Animation Options		
tabline.states.animationOptions = 
	time: .3
Infopanel.states.animationOptions = 
	time: .5
dnaAreaPage.states.animationOptions = 
	time: .3	
landAreaPage.states.animationOptions = 
	time: .3	
dataLayerMain.states.animationOptions =
	curve: "ease"
	time: .5
dataLayerMain.children.animationOptions =
	curve: "ease"
	time: .5
offSwitch.states.animationOptions =
	time: .5
offSwitchButton.states.animationOptions =
	time: .5
# filterPanel.states.animationOptions =
# 	time: .5
unitFilterPanel.states.animationOptions =
	time: .5
custFilterPanel.states.animationOptions =
	time: .5
	
#Layer Result Options
unit0101Plus.states.animaionOptions =
	time: .3

	