ndarray = require 'ndarray'
edger = require '../index.coffee'
expect = require('chai').expect
describe 'Edger', () ->
	it 'edge a cube correctly', () ->
		voxel = ndarray [], [1, 1, 1]
		voxel.set 0, 0, 0, 1

		result = edger voxel
		expect(result).to.eql([
			[ [ 0, 0, 0 ], [ 0, 0, 1 ] ],
			[ [ 0, 1, 0 ], [ 0, 1, 1 ] ],
			[ [ 1, 0, 0 ], [ 1, 0, 1 ] ],
			[ [ 1, 1, 0 ], [ 1, 1, 1 ] ],
			[ [ 0, 1, 0 ], [ 1, 1, 0 ] ],
			[ [ 0, 0, 0 ], [ 1, 0, 0 ] ],
			[ [ 0, 0, 1 ], [ 1, 0, 1 ] ],
			[ [ 0, 1, 1 ], [ 1, 1, 1 ] ],
			[ [ 1, 0, 0 ], [ 1, 1, 0 ] ],
			[ [ 1, 0, 1 ], [ 1, 1, 1 ] ],
			[ [ 0, 0, 1 ], [ 0, 1, 1 ] ],
			[ [ 0, 0, 0 ], [ 0, 1, 0 ] ] ]);

	it 'edge two cubes correctly', () ->
		voxel = ndarray [], [1, 1, 1]
		voxel.set 0, 0, 0, 1
		voxel.set 1, 0, 0, 1

		result = edger voxel
		expect(result).to.eql([ 
			[ [ 0, 0, 0 ], [ 0, 0, 1 ] ],
		  [ [ 1, 1, 1 ], [ 1, 1, 2 ] ],
		  [ [ 1, 2, 0 ], [ 1, 2, 1 ] ],
		  [ [ 2, 1, 0 ], [ 2, 1, 1 ] ],
		  [ [ 0, 0, 0 ], [ 1, 0, 0 ] ],
		  [ [ 0, 1, 2 ], [ 1, 1, 2 ] ],
		  [ [ 0, 2, 1 ], [ 1, 2, 1 ] ],
		  [ [ 1, 1, 1 ], [ 2, 1, 1 ] ],
		  [ [ 0, 0, 0 ], [ 0, 1, 0 ] ],
		  [ [ 1, 0, 2 ], [ 1, 1, 2 ] ],
		  [ [ 1, 1, 1 ], [ 1, 2, 1 ] ],
		  [ [ 2, 0, 1 ], [ 2, 1, 1 ] ] ]);