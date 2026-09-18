Received: from mta0.migadu.com (out-134.mta0.migadu.com [91.218.175.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D269E4BFE6F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731851; cv=none; b=cWvtHU1rOtyPx2AcMQlMp5WtPoCJQyXuWu3XWxa0W1f4nslktbQqZDFOJhs1+VYeGgFkSNvV7zkdtLCQs6TIs0Kqqo58PNp5AOfWgiQA0VwNQOsm07q99hRgk9HGaR6XPh4r2QXxSH6O4EfL0iauOL5Jul0A4x/3wQUY8mqQCoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731851; c=relaxed/simple;
	bh=z18ua7KJj8NUH51GZr7B30RkX10das6Mm9xYywfDXH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cinpjGK7BXq0sLhfU41jzINcKWdc39vDJ0BDKEVVtT3FaRCK44XYehOEInlKtcV1E+TDKpkVym2RXge6N82iMoIqPs4/UISik3lT/zEh76Ga5S+QsK3fyRhplxZvr76z8RlUb2DGc/7jhRQTSDYjfg/+s24lTK55b3kqrfK5fSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q57NOsFk; arc=none smtp.client-ip=91.218.175.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q57NOsFk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=z18ua7KJj8NUH51GZr7B30RkX10das6Mm9xYywfDXH8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789731845; v=1; x=1790336645;
 b=q57NOsFkxHDhvPX55FXWnYc8XrVYmI+qR3k0vCCyIrI9t1k+wXptceunfeIGKo/6p5wZFTY/
 9jg9Fa/lxuyvNBQQAzQb2GxJRxWimn2U/KHDF+GykooFqLRZniwIkYl4jYgnG5rz0Oa1MxUGQdo
 YUxwT6Dqou+S1Ixz/XxFAgMQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 03a9aeceba392b53;
	Fri, 18 Sep 2026 11:44:05 +0000
X-Mizu-Trace-ID: 03a9aeceba392b53
X-Migadu-Flow: FLOW_OUT
From: Hao Li <hao.li@linux.dev>
To: vbabka@kernel.org,
	harry@kernel.org,
	akpm@linux-foundation.org
Cc: cl@gentwo.org,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Hao Li <hao.li@linux.dev>
Subject: [PATCH] mm/slub: refill prefilled sheaves from the barn
Date: Fri, 18 Sep 2026 19:41:56 +0800
Message-ID: <20260918114318.124346-1-hao.li@linux.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, when the prefill API refills a non-full sheaf, it takes the
objects from partial slabs and never from the full sheaves in the barn,
so once the barn's full list becomes saturated, it stays saturated.

For objects freed via kfree_rcu(), every RCU sheaf then has to be
flushed to slabs because the barn's full list has no room.

To fix this, let the sheaf refill from the barn first, and introduce a
partial sheaf in the barn, which holds the leftover objects.

If no partial sheaf exists, take a full sheaf from the barn and return
it to the caller; the non-full sheaf becomes the partial sheaf, or is
put on the barn's empty list if it holds no objects.

If a partial sheaf exists and the non-full sheaf and the partial sheaf
together reach capacity, the one holding more objects is filled up from
the other and handed out instead, so no full sheaf needs to be taken
from the barn.

If a partial sheaf exists but the two together do not reach capacity,
take a full sheaf from the barn for the caller; the objects of the
non-full sheaf are absorbed into the partial sheaf, and the non-full
sheaf, now empty, is put on the barn's empty list.

The gain comes from two sides: every full sheaf taken out makes room on
the barn's full list for a future RCU sheaf, and refilling from the
barn is cheaper than refilling from partial slabs under list_lock.

Note that putting the non-full sheaf on the full list instead would not
work: it would occupy room on the full list, so the list would stay
saturated and rcu_free_sheaf() would still keep flushing.

Tested with will-it-scale mmap1 (192 processes, one-minute runs) on the
maple_node cache.

throughput: 27778727 -> 34500556 (+24.2%)

metric                       baseline           patched        change
=====================================================================
alloc_fastpath                 54,124            56,696        +4.75%
alloc_slab                  7,100,651           159,739       -97.75%
barn_get                          849       194,460,392    +22904539.81%
barn_get_fail                       2               217    +10750.00%
barn_put                          851       182,306,701    +21422544.07%
barn_put_fail             260,400,484       145,522,675       -44.12%
cmpxchg_double_fail         1,029,204           334,228       -67.53%
free_add_partial          326,694,687       181,935,790       -44.31%
free_fastpath                  13,297            15,611       +17.40%
free_rcu_sheaf          8,332,839,104    10,490,535,227       +25.89%
free_remove_partial         7,099,788           158,297       -97.77%
free_slab                   7,099,788           158,297       -97.77%
free_slowpath              10,969,156           782,851       -92.86%
objects                        15,295            14,849        -2.92%
objects_partial                15,295            14,849        -2.92%
partial                         1,604             2,336       +45.64%
sheaf_alloc               137,757,895       141,208,076        +2.50%
sheaf_flush             8,332,823,922     4,656,725,764       -44.12%
sheaf_free                137,757,883       141,208,072        +2.50%
sheaf_prefill_fast      3,337,502,163     4,196,506,116       +25.74%
sheaf_prefill_slow                685               400       -41.61%
sheaf_refill            8,343,794,364     4,657,509,724       -44.18%
sheaf_return_fast       3,337,502,411     4,196,506,382       +25.74%
sheaf_return_slow                 437               134       -69.34%
slabs                           1,604             2,336       +45.64%
total_objects                 102,656           149,504       +45.64%

Here is what the important metric changes mean.

barn_get and barn_put: refills now take full sheaves out of the barn,
and RCU sheaves are put into the barn again. Before, the barn's full
list was saturated once and hardly ever consumed.

barn_put_fail: more than half of the RCU sheaves are now put into the
barn instead of being flushed. The rest are still flushed because they
arrive while the barn's full list is at its limit.

sheaf_refill and free_add_partial: fewer objects are taken from partial
slabs to refill sheaves, and fewer slabs are added to the partial list,
by the same percentage.

alloc_slab and free_slab: the partial list is almost never empty when a
refill looks at it, so slabs are almost never allocated and freed again
only to serve refills.

After the test, the maple_node cache holds 1604 slabs without the patch
and 2336 with it. After a manual shrink
(echo 1 > /sys/kernel/slab/maple_node/shrink), it holds 485 without
the patch and 563 with it. So most of the extra slabs are held only by
objects sitting in sheaves and are returned by a shrink, and what
remains is a small difference, because objects handed out from the barn
come from many more slabs than a refill from partial slabs would use.

Link: https://lore.kernel.org/linux-mm/aqPlMzUIw-4g2iOX@fedora/
Signed-off-by: Hao Li <hao.li@linux.dev>
---
This patch emerged from the discussion here:
https://lore.kernel.org/linux-mm/aqPlMzUIw-4g2iOX@fedora/
Thanks everyone for joining the discussion!

Below are the full metrics for the current patch:

throughput: 27778727 -> 34500556   (+24.2%)

metric                            baseline           patched             delta      change
==========================================================================================
alloc_fastpath                      54,124            56,696             2,572      +4.75%
alloc_node_mismatch                      0                 0                 0      +0.00%
alloc_slab                       7,100,651           159,739        -6,940,912     -97.75%
alloc_slowpath                           0                 0                 0      +0.00%
barn_get                               849       194,460,392       194,459,543  +22904539.81%
barn_get_fail                            2               217               215  +10750.00%
barn_put                               851       182,306,701       182,305,850  +21422544.07%
barn_put_fail                  260,400,484       145,522,675      -114,877,809     -44.12%
cmpxchg_double_fail              1,029,204           334,228          -694,976     -67.53%
free_add_partial               326,694,687       181,935,790      -144,758,897     -44.31%
free_fastpath                       13,297            15,611             2,314     +17.40%
free_rcu_sheaf               8,332,839,104    10,490,535,227     2,157,696,123     +25.89%
free_rcu_sheaf_fail                      0                 0                 0      +0.00%
free_remove_partial              7,099,788           158,297        -6,941,491     -97.77%
free_slab                        7,099,788           158,297        -6,941,491     -97.77%
free_slowpath                   10,969,156           782,851       -10,186,305     -92.86%
object_size                            256               256                 0      +0.00%
objects                             15,295            14,849              -446      -2.92%
objects_partial                     15,295            14,849              -446      -2.92%
objs_per_slab                           64                64                 0      +0.00%
order                                    2                 2                 0      +0.00%
partial                              1,604             2,336               732     +45.64%
sheaf_alloc                    137,757,895       141,208,076         3,450,181      +2.50%
sheaf_capacity                          32                32                 0      +0.00%
sheaf_flush                  8,332,823,922     4,656,725,764    -3,676,098,158     -44.12%
sheaf_free                     137,757,883       141,208,072         3,450,189      +2.50%
sheaf_prefill_fast           3,337,502,163     4,196,506,116       859,003,953     +25.74%
sheaf_prefill_oversize                   0                 0                 0      +0.00%
sheaf_prefill_slow                     685               400              -285     -41.61%
sheaf_refill                 8,343,794,364     4,657,509,724    -3,686,284,640     -44.18%
sheaf_return_fast            3,337,502,411     4,196,506,382       859,003,971     +25.74%
sheaf_return_slow                      437               134              -303     -69.34%
slab_size                              256               256                 0      +0.00%
slabs                                1,604             2,336               732     +45.64%
total_objects                      102,656           149,504            46,848     +45.64%

derived                                                baseline           patched      change
=============================================================================================
page allocator churn (alloc_slab + free_slab)        14,200,439           318,036     -97.76%

---
 mm/slub.c | 142 +++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 134 insertions(+), 8 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 54ec12503357..0b1de6b42b61 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -422,6 +422,7 @@ struct node_barn {
 	spinlock_t lock;
 	struct list_head sheaves_full;
 	struct list_head sheaves_empty;
+	struct slab_sheaf *sheaf_partial;
 	unsigned int nr_full;
 	unsigned int nr_empty;
 };
@@ -3164,6 +3165,89 @@ static struct slab_sheaf *barn_get_empty_sheaf(struct node_barn *barn,
 	return empty;
 }
 
+/*
+ * Exchange @sheaf, which holds fewer objects than requested, for a full one,
+ * keeping the leftover objects in the barn's partial sheaf instead of
+ * flushing them.
+ *
+ * Returns a full sheaf, or NULL if the barn cannot make one.
+ * The returned sheaf might be @sheaf itself or a new one.
+ */
+static struct slab_sheaf *barn_replace_partial_sheaf(struct kmem_cache *s,
+						     struct node_barn *barn,
+						     struct slab_sheaf *sheaf)
+{
+	struct slab_sheaf *full = NULL, *partial;
+	unsigned int to_move;
+	unsigned long flags;
+
+	if (!data_race(barn->nr_full) && !data_race(barn->sheaf_partial))
+		return NULL;
+
+	spin_lock_irqsave(&barn->lock, flags);
+
+	partial = barn->sheaf_partial;
+	if (partial && partial->size + sheaf->size >= s->sheaf_capacity) {
+		/* Fill the larger one to capacity from the smaller */
+		if (partial->size > sheaf->size)
+			swap(partial, sheaf);
+
+		to_move = s->sheaf_capacity - sheaf->size;
+		partial->size -= to_move;
+		memcpy(&sheaf->objects[sheaf->size],
+		       &partial->objects[partial->size],
+		       to_move * sizeof(void *));
+		sheaf->size = s->sheaf_capacity;
+
+		if (partial->size) {
+			barn->sheaf_partial = partial;
+		} else {
+			/*
+			 * No empty-limit check here or below: the sheaf put on the
+			 * empty list is either the barn's own partial sheaf, or the
+			 * caller's sheaf taken in exchange for a full one, so the
+			 * barn holds no more sheaves than before.
+			 * barn_replace_empty_sheaf() skips the check for the same
+			 * reason.
+			 */
+			list_add(&partial->barn_list, &barn->sheaves_empty);
+			barn->nr_empty++;
+			barn->sheaf_partial = NULL;
+		}
+
+		full = sheaf;
+		goto done;
+	}
+
+	if (!barn->nr_full)
+		goto done;
+
+	full = list_first_entry(&barn->sheaves_full, struct slab_sheaf,
+				barn_list);
+	list_del(&full->barn_list);
+	barn->nr_full--;
+
+	if (partial) {
+		/* The two do not reach capacity: the partial sheaf absorbs all of @sheaf */
+		memcpy(&partial->objects[partial->size], sheaf->objects,
+		       sheaf->size * sizeof(void *));
+		partial->size += sheaf->size;
+		sheaf->size = 0;
+	}
+
+	if (sheaf->size) {
+		barn->sheaf_partial = sheaf;
+	} else {
+		list_add(&sheaf->barn_list, &barn->sheaves_empty);
+		barn->nr_empty++;
+	}
+
+done:
+	spin_unlock_irqrestore(&barn->lock, flags);
+
+	return full;
+}
+
 /*
  * The following two functions are used mainly in cases where we have to undo an
  * intended action due to a race or cpu migration. Thus they do not check the
@@ -3298,6 +3382,7 @@ static void barn_init(struct node_barn *barn)
 	spin_lock_init(&barn->lock);
 	INIT_LIST_HEAD(&barn->sheaves_full);
 	INIT_LIST_HEAD(&barn->sheaves_empty);
+	barn->sheaf_partial = NULL;
 	barn->nr_full = 0;
 	barn->nr_empty = 0;
 }
@@ -3315,6 +3400,10 @@ static void barn_shrink(struct kmem_cache *s, struct node_barn *barn)
 	barn->nr_full = 0;
 	list_splice_init(&barn->sheaves_empty, &empty_list);
 	barn->nr_empty = 0;
+	if (barn->sheaf_partial) {
+		list_add(&barn->sheaf_partial->barn_list, &full_list);
+		barn->sheaf_partial = NULL;
+	}
 
 	spin_unlock_irqrestore(&barn->lock, flags);
 
@@ -5073,12 +5162,51 @@ void *kmem_cache_alloc_node_noprof(struct kmem_cache *s, gfp_t gfpflags, int nod
 }
 EXPORT_SYMBOL(kmem_cache_alloc_node_noprof);
 
+/*
+ * Refill *@sheafp from the barn; *@sheafp may be replaced.
+ *
+ * Returns true if the sheaf is now full, at s->sheaf_capacity.
+ * Returns false if the sheaf is still not full.
+ */
+static bool refill_sheaf_from_barn(struct kmem_cache *s,
+				   struct slab_sheaf **sheafp)
+{
+	struct node_barn *barn = get_barn(s);
+	struct slab_sheaf *sheaf = *sheafp;
+	struct slab_sheaf *full;
+
+	/* Objects from pfmemalloc slabs must not enter the barn */
+	if (!barn || sheaf->pfmemalloc)
+		return false;
+
+	full = barn_replace_partial_sheaf(s, barn, sheaf);
+	if (!full)
+		return false;
+
+	stat(s, BARN_GET);
+	full->capacity = s->sheaf_capacity;
+	full->pfmemalloc = false;
+	*sheafp = full;
+
+	/*
+	 * A sheaf taken from the barn's full list may hold fewer than capacity
+	 * objects, see rcu_free_sheaf().
+	 */
+	return full->size == s->sheaf_capacity;
+}
+
 static int __prefill_sheaf_pfmemalloc(struct kmem_cache *s,
-				      struct slab_sheaf *sheaf, gfp_t gfp)
+				      struct slab_sheaf **sheafp, gfp_t gfp)
 {
+	struct slab_sheaf *sheaf;
 	gfp_t gfp_nomemalloc;
 	int ret;
 
+	if (refill_sheaf_from_barn(s, sheafp))
+		return 0;
+
+	sheaf = *sheafp;
+
 	gfp_nomemalloc = gfp | __GFP_NOMEMALLOC;
 	if (gfp_pfmemalloc_allowed(gfp))
 		gfp_nomemalloc |= __GFP_NOWARN;
@@ -5171,7 +5299,7 @@ kmem_cache_prefill_sheaf(struct kmem_cache *s, gfp_t gfp, unsigned int size)
 		sheaf->pfmemalloc = false;
 
 		if (sheaf->size < size &&
-		    __prefill_sheaf_pfmemalloc(s, sheaf, gfp)) {
+		    __prefill_sheaf_pfmemalloc(s, &sheaf, gfp)) {
 			sheaf_flush_unused(s, sheaf);
 			free_empty_sheaf(s, sheaf);
 			sheaf = NULL;
@@ -5238,14 +5366,12 @@ void kmem_cache_return_sheaf(struct kmem_cache *s, gfp_t gfp,
 
 /*
  * Refill a sheaf previously returned by kmem_cache_prefill_sheaf to at least
- * the given size.
+ * the given size. The sheaf might have been replaced with a new one, whether
+ * the refill succeeds or not.
  *
  * Return: 0 on success. The sheaf will contain at least @size objects.
- * The sheaf might have been replaced with a new one if more than
- * sheaf->capacity objects are requested.
  *
- * Return: -ENOMEM on failure. Some objects might have been added to the sheaf
- * but the sheaf will not be replaced.
+ * Return: -ENOMEM on failure. Some objects might have been added to the sheaf.
  *
  * In practice we always refill to full sheaf's capacity.
  */
@@ -5267,7 +5393,7 @@ int kmem_cache_refill_sheaf(struct kmem_cache *s, gfp_t gfp,
 
 	if (likely(sheaf->capacity >= size)) {
 		if (likely(sheaf->capacity == s->sheaf_capacity))
-			return __prefill_sheaf_pfmemalloc(s, sheaf, gfp);
+			return __prefill_sheaf_pfmemalloc(s, sheafp, gfp);
 
 		if (!__kmem_cache_alloc_bulk(s, gfp, sheaf->capacity - sheaf->size,
 					     &sheaf->objects[sheaf->size]))
-- 
2.55.0

