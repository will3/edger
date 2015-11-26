module.exports = (voxel) ->
	map = {}
	shape = voxel.shape
	w = shape[0]
	h = shape[1]
	d = shape[2]

	hash = (point) ->
		return [point[0], point[1], point[2]].join ','

	parse = (hash) ->
		components = hash.split ','
		x = parseFloat components[0]
		y = parseFloat components[1]
		z = parseFloat components[2]
		return [x, y, z]

	addEdge = (a, b, dir) -> 
		if !map[dir]
			map[dir] = {}

		slice = map[dir]
		hasha = hash a
		hashb = hash b
		if slice[hasha]?
			ori_a = slice[hasha]
			slice[hasha] = null
			slice[hashb] = ori_a
			return

		map[dir][hashb] = a

	format = () ->
		result = []
		for dir, slice of map
			for hasha, b of slice
				if !b
					continue
				result.push [b, parse hasha]
		result

	for i in [0..w]
		for j in [0..h]
			for k in [0..d]
				b = voxel.get i, j, k
				if !b
					continue

				right = voxel.get i + 1, j, k
				left = voxel.get i - 1, j, k
				top = voxel.get i, j + 1, k
				bottom = voxel.get i, j - 1, k
				front = voxel.get i, j, k + 1
				back = voxel.get i, j, k - 1

				#   6   7
				# 2   3
				#   4   5
				# 0   1
				
				p0 = [i, j, k]
				p1 = [i + 1, j, k]
				p2 = [i, j + 1, k]
				p3 = [i + 1, j + 1, k]
				p4 = [i, j, k + 1]
				p5 = [i + 1, j, k + 1]
				p6 = [i, j + 1, k + 1]
				p7 = [i + 1, j + 1, k + 1]

				if !left and !bottom
					addEdge p0, p4, 0
				if !left and !top
					addEdge p2, p6, 0
				if !bottom and !right
					addEdge p1, p5, 0
				if !top and !right
					addEdge p3, p7, 0

				if !top and !back
					addEdge p2, p3, 1
				if !back and !bottom
					addEdge p0, p1, 1
				if !bottom and !front
					addEdge p4, p5, 1
				if !front and !top
					addEdge p6, p7, 1

				if !back and !right
					addEdge p1, p3, 2
				if !right and !front
					addEdge p5, p7, 2
				if !front and !left	
					addEdge p4, p6, 2
				if !left and !back
					addEdge p0, p2, 2

	format()
