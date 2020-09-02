#!/usr/bin/python

import numpy as np

KEYSPACE_SIZE = 65536
ZIPF_ALPHA = 3

zipf_dist = np.random.zipf(ZIPF_ALPHA, KEYSPACE_SIZE).tolist()
zipf_dist_indexed = []
for i in range(0, KEYSPACE_SIZE):
    zipf_dist_indexed.append((zipf_dist[i], i))

zipf_dist_indexed.sort(key=lambda x: x[0])
zipf_dist_indexed.reverse()

with open('keydist_zipf_alpha_ranked_%d.csv' % ZIPF_ALPHA, 'w') as out:
    buf = [ "%d,%d" % (x[0], x[1]) for x in zipf_dist_indexed ]
    out.write("\n".join(buf))
    out.close()