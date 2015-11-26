##Edger

Generate hard edges for voxel data

Install  
```npm install edger```

### Usage

```javascript
var edger = require('edger');
var ndarray = require('ndarray');
var voxel = ndarray([], [16, 16, 16]);
voxel.set(0, 0, 0, 0xff0000);
var result = edger(voxel);
console.log(result);

//12 edges for one block
//[ [ [ 0, 0, 0 ], [ 0, 0, 1 ] ],
//[ [ 0, 1, 0 ], [ 0, 1, 1 ] ],
//[ [ 1, 0, 0 ], [ 1, 0, 1 ] ],
//[ [ 1, 1, 0 ], [ 1, 1, 1 ] ],
//[ [ 0, 1, 0 ], [ 1, 1, 0 ] ],
//[ [ 0, 0, 0 ], [ 1, 0, 0 ] ],
//[ [ 0, 0, 1 ], [ 1, 0, 1 ] ],
//[ [ 0, 1, 1 ], [ 1, 1, 1 ] ],
//[ [ 1, 0, 0 ], [ 1, 1, 0 ] ],
//[ [ 1, 0, 1 ], [ 1, 1, 1 ] ],
//[ [ 0, 0, 1 ], [ 0, 1, 1 ] ],
//[ [ 0, 0, 0 ], [ 0, 1, 0 ] ] ]
```