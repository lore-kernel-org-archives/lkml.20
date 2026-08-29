Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5AB2DF12F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787968794; cv=none; b=pN0eOpYUu4E0Mkv4o24OC3pyDzb2mWbz0J79Uy36gSmerLe2eQnRLWB4A7DUZegeJfFxr4lxEtmXeywdAbu/sgFDyqQfRhfc9nQwanHYOa9cLHlMG9gq1ZGHPFtTu060uKl2qmQR2pvhIiSzdHu6T7Cw+h3aHC2bgTDUrg9DrkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787968794; c=relaxed/simple;
	bh=xN1O5hap1czxHNRtZxYk5qVL1FQlbdug281W2wtbwY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OB0vHkllIuEHxcxuEZocKikmBqc2cFYDObn34h9FoOOpgofdHfb1rBhfIwhtAuj4lU88lQErOM0STRrU2lqPWSN/6W75vywlRYL2iTU+Tm6a2glZsn8HzveEKgF6X80u3qoz6LAIci2o/mWgsNeCOI2YbS4C0pQkXf8c3mGilus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=szlbiaLx; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="szlbiaLx"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93900ed2925so130680285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787968791; x=1788573591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=faC0fYG8yMLiPwwr3mLcygBE5e7EbRUJ0hBevdXCmrk=;
        b=szlbiaLxIc+nrl3gI/fS+a49AY72LcRgPXBW+wrZHVY4qTagU67qQJfYu9H4XTpqBU
         L0KhVc/opWYwXGR43j0Y/84Ecq9SJb1EviYF/4NAYd1KEKjZdVZanqdN4Lab9vxoVOzP
         RiZjQE0ncYTsIh1c1UfQgslv3YCq/qa+NhKTs1FYwLDhVRhEsL7xP7DjO472oJFi5TNJ
         WEkotqvKGVyfX0xTP9K8hNLKDiwzBCQZYyzyhtwkArwoS81q3iN675ULZtGPAWxR7/R7
         OeoEtKIezd7hIPy8u7FpKlcS8PrQGahtoI7NEdXdodC7tvAe6mF1WHcZa5geIF3qGxs9
         YvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787968791; x=1788573591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=faC0fYG8yMLiPwwr3mLcygBE5e7EbRUJ0hBevdXCmrk=;
        b=pd+v2u9SVG8VAbFqMPPAV0O6LS45HPwnQ/yKJaAXFpNnt646+rMzIuPAoIgYXpKIda
         mph9EXKScXTGwn6zCn9MtWEskEu/nTifP6Ykni/Vue4HksYI4GVyn+Qv5u7dkFEtlypp
         ZNve07b1MLDRT07bsxg3a3/XAGMh2J796BtpvZZBLmpX22WqIAzvjeLwWMtKpYqoTHRQ
         Heek6OBorP8fSWUT84x5djSZmjRO1/OxRSq7Seq1UDC6HNbBWMquISON4JWrvr+kSE3V
         2MGHfUPBiMFokMKgy8VTGWqvhWM5SfFsyBSbZrb2KR2WHPJcYSeYtZyQB7fyKk1VuS3J
         KKAQ==
X-Gm-Message-State: AFuF++kyVESeK55OdhLYVvTFTlcB29sIndAyYWNR5C+QjSwbWGYkMBN8
	WZouCVRj6+66muzhNcj5LCHTcIoFwL4pFxSnlF5lNTgQOj+k8Mrm4QfZJqdWEdCZC1qe61Hjt7v
	x9UtVOKU=
X-Gm-Gg: AR+sD13lAhiWTSZblY7846olfGeGBU1rABuZA1+UBBCuum5o6jmNAtlBKlbMnhwjBWc
	aTH/EdLddw+ANSpqzLp62qkWMN1vSpkpJzesQsscf2mxeRry4tW8fAmKD2uxLu+C8UyUFxBOoda
	6LjRZV4K3j2wHNUotAgrCzOjKbD1OXAQbQopdPAFf+tteoB4f7vpc7yWLdyY40t1m6iwqKKrfGj
	XtNeAyoPNWmPG9M0xXWtwDEorU4i0NoEV+Ed4hix7mVy+BVvwLdXi2hHlvdpHJblM8FbZlMvayJ
	DAeozEU8T+pgtuituAcayARXAngufWGXF+FNlzYvQDQSFERz4L1k3dFr8aMofF2Z3BAFKRu52EK
	pxNaoxpbKMZMGJewJ+1smKWx+ON7Ae7UuzOHftO+sWfb5gCupY9C6qx+mPtD2fX4Z1sYfzdfmnL
	pZeSHgbP+qXbCIfAdN/kma8be7hZhLusK5qZvp6qen9FT+2SSHss0Er69u9r1lCWIzGRmo8fjSW
	p/Lpp317cDh33IGbgjrKxYJd4bq615gka9l+cdPxjxmWwzFTg==
X-Received: by 2002:a05:620a:29d4:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-9391379155emr1157379185a.15.1787968791382;
        Fri, 28 Aug 2026 18:59:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391701305dsm272582285a.4.2026.08.28.18.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 18:59:50 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	urezki@gmail.com,
	chenwandun@huawei.com
Subject: [PATCH 2/2] mm/mempolicy: stop copying the nodemask in the interleave paths
Date: Fri, 28 Aug 2026 21:59:43 -0400
Message-ID: <20260829015943.1258774-3-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829015943.1258774-1-gourry@gourry.net>
References: <20260829015943.1258774-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interleave node selectors copy pol->nodes onto the stack so the mask
cannot change while they walk it.  nodemask_t is 128 bytes at
MAX_NUMNODES=1024, and two of the three run per folio fault.

The copy only buys consistency between the node count and the walk.
Drop the consistency and just bounds check the walk instead.

If an empty nodelist or weight is perceived, fall back to numa_node_id(),
which is what the functions already did when the copy came back empty.

weighted_interleave_nid() counts the nodes as we sum the weights. We use
that node count to limit the maximum skew a single node can host.

interleave_nid() walks with next_node_in() rather than next_node(), so a
mask that shrank mid-walk wraps to a node still in the policy.

alloc_pages_bulk_weighted_interleave() derives per-node counts from a
weight total summed over the mask, so a changing mask can make them exceed
the request.  Clamp each chunk to the space left in page_array.

A cpuset cookie will not work here: two of these take VMA policies, which
mpol_rebind_mm() rebinds under mmap_write_lock(), not mems_allowed_seq.

Cost is distribution accuracy during a rebind - but the copy never
corrected this anyway, it was just a safety mechanism to prevent div/0
and overrunning the alloc request buffer.

Remove read_once_policy_nodemask(), now unused.

-fstack-usage at MAX_NUMNODES=1024:

  weighted_interleave_nid            184 -> 56
  interleave_nid                     168 -> 32
  alloc_pages_bulk_mempolicy_noprof  360 -> 136

Assisted-by: Claude:claude-opus-5
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mempolicy.c | 86 ++++++++++++++++++++++++++++----------------------
 1 file changed, 49 insertions(+), 37 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 2643915dc966..296129126109 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2197,34 +2197,15 @@ unsigned int mempolicy_slab_node(void)
 	}
 }
 
-static unsigned int read_once_policy_nodemask(struct mempolicy *pol,
-					      nodemask_t *mask)
-{
-	/*
-	 * barrier stabilizes the nodemask locally so that it can be iterated
-	 * over safely without concern for changes. Allocators validate node
-	 * selection does not violate mems_allowed, so this is safe.
-	 */
-	barrier();
-	memcpy(mask, &pol->nodes, sizeof(nodemask_t));
-	barrier();
-	return nodes_weight(*mask);
-}
-
 static unsigned int weighted_interleave_nid(struct mempolicy *pol, pgoff_t ilx)
 {
 	struct weighted_interleave_state *state;
-	nodemask_t nodemask;
-	unsigned int target, nr_nodes;
+	unsigned int target, nnodes = 0;
 	u8 *table = NULL;
 	unsigned int weight_total = 0;
 	u8 weight;
 	int nid = 0;
 
-	nr_nodes = read_once_policy_nodemask(pol, &nodemask);
-	if (!nr_nodes)
-		return numa_node_id();
-
 	rcu_read_lock();
 
 	state = rcu_dereference(wi_state);
@@ -2232,22 +2213,40 @@ static unsigned int weighted_interleave_nid(struct mempolicy *pol, pgoff_t ilx)
 	if (state)
 		table = state->iw_table;
 
-	/* calculate the total weight */
-	for_each_node_mask(nid, nodemask)
+	/* calculate the total weight and the node count */
+	for_each_node_mask(nid, pol->nodes) {
 		weight_total += table ? table[nid] : 1;
+		nnodes++;
+	}
+
+	/* the mask is empty */
+	if (!weight_total) {
+		rcu_read_unlock();
+		return numa_node_id();
+	}
 
 	/* Calculate the node offset based on totals */
 	target = ilx % weight_total;
-	nid = first_node(nodemask);
-	while (target) {
+	nid = first_node(pol->nodes);
+
+	/*
+	 * The target was calculated in a separate loop, and a concurrent
+	 * rebind can change the total number of nodes.  Clamp this loop to
+	 * a single pass (nnodes) to keep the walk bounded by node count.
+	 */
+	while (target && nnodes-- && nid < MAX_NUMNODES) {
 		/* detect system default usage */
 		weight = table ? table[nid] : 1;
 		if (target < weight)
 			break;
 		target -= weight;
-		nid = next_node_in(nid, nodemask);
+		nid = next_node_in(nid, pol->nodes);
 	}
 	rcu_read_unlock();
+
+	/* the mask emptied under the walk */
+	if (nid >= MAX_NUMNODES)
+		return numa_node_id();
 	return nid;
 }
 
@@ -2258,18 +2257,21 @@ static unsigned int weighted_interleave_nid(struct mempolicy *pol, pgoff_t ilx)
  */
 static unsigned int interleave_nid(struct mempolicy *pol, pgoff_t ilx)
 {
-	nodemask_t nodemask;
 	unsigned int target, nnodes;
 	int i;
 	int nid;
 
-	nnodes = read_once_policy_nodemask(pol, &nodemask);
+	nnodes = nodes_weight(pol->nodes);
 	if (!nnodes)
 		return numa_node_id();
 	target = ilx % nnodes;
-	nid = first_node(nodemask);
-	for (i = 0; i < target; i++)
-		nid = next_node(nid, nodemask);
+	nid = first_node(pol->nodes);
+	for (i = 0; i < target && nid < MAX_NUMNODES; i++)
+		nid = next_node_in(nid, pol->nodes);
+
+	/* the mask emptied under the walk */
+	if (nid >= MAX_NUMNODES)
+		return numa_node_id();
 	return nid;
 }
 
@@ -2665,7 +2667,6 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	u8 *table, weight;
 	unsigned int weight_total = 0;
 	unsigned long rem_pages = nr_pages;
-	nodemask_t nodes;
 	int nnodes, node;
 	int resume_node = MAX_NUMNODES - 1;
 	u8 resume_weight = 0;
@@ -2675,10 +2676,10 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	if (!nr_pages)
 		return 0;
 
-	/* read the nodes onto the stack, retry if done during rebind */
+	/* count the nodes, retry if a rebind happened during the read */
 	do {
 		cpuset_mems_cookie = read_mems_allowed_begin();
-		nnodes = read_once_policy_nodemask(pol, &nodes);
+		nnodes = nodes_weight(pol->nodes);
 	} while (read_mems_allowed_retry(cpuset_mems_cookie));
 
 	/* if the nodemask has become invalid, we cannot do anything */
@@ -2688,7 +2689,7 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	/* Continue allocating from most recent node and adjust the nr_pages */
 	node = me->il_prev;
 	weight = me->il_weight;
-	if (weight && node_isset(node, nodes)) {
+	if (weight && node_isset(node, pol->nodes)) {
 		node_pages = min(rem_pages, weight);
 		nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
 						  page_array);
@@ -2712,9 +2713,13 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	table = state ? state->iw_table : NULL;
 
 	/* calculate total, detect system default usage */
-	for_each_node_mask(node, nodes)
+	for_each_node_mask(node, pol->nodes)
 		weight_total += table ? table[node] : 1;
 
+	/* the mask emptied since it was counted */
+	if (!weight_total)
+		goto out;
+
 	/*
 	 * Calculate rounds/partial rounds to minimize __alloc_pages_bulk calls.
 	 * Track which node weighted interleave should resume from.
@@ -2724,10 +2729,14 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	 */
 	rounds = rem_pages / weight_total;
 	delta = rem_pages % weight_total;
-	resume_node = next_node_in(prev_node, nodes);
+	resume_node = next_node_in(prev_node, pol->nodes);
+	if (resume_node >= MAX_NUMNODES)
+		goto out;
 	resume_weight = table ? table[resume_node] : 1;
 	for (i = 0; i < nnodes; i++) {
-		node = next_node_in(prev_node, nodes);
+		node = next_node_in(prev_node, pol->nodes);
+		if (node >= MAX_NUMNODES)
+			break;
 		weight = table ? table[node] : 1;
 		node_pages = weight * rounds;
 		/* If a delta exists, add this node's portion of the delta */
@@ -2744,6 +2753,8 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 		/* node_pages can be 0 if an allocation fails and rounds == 0 */
 		if (!node_pages)
 			break;
+		/* a rebind can invalidate the counts: never overrun page_array */
+		node_pages = min(node_pages, nr_pages - total_allocated);
 		nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
 						  page_array);
 		page_array += nr_allocated;
@@ -2754,6 +2765,7 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	}
 	me->il_prev = resume_node;
 	me->il_weight = resume_weight;
+out:
 	srcu_read_unlock_fast(&wi_srcu, scp);
 	return total_allocated;
 }
-- 
2.55.0

