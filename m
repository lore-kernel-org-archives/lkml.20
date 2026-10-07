Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644E74C33D6
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388783; cv=none; b=O2xjfn+ncL/Ll1f49Rqvs6gcAgI2LC2zulRlyOoWxl1mUMyMyqzH02Kmqya7gH0onWCiMuYHDTM+FnfyzeCpqjTVunOuvPC8TEo4kHs+83+M8uFZxv0vOycNZa/qzDBt1lx0pn+POjoEJKe2yk7424/QUeAP1c7e2HV83lds0xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388783; c=relaxed/simple;
	bh=iH7gxtMFCEhoCCU4rmak4S7NdycEQXKcqJZP197MiJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ha5GT4WztDnrCbeX6zsF06hAAQkdXvKrUSzCyenT7ts2u6XgzqzkEBx65UPMhQpeyi4+hunKTn0lrMAw2Xw3vQD2oVVZjuUNEjkAPzuCg/yPhFAwdmXwXG8MFUOjHcpqPT9qszDQYlXMBHz4xrCQRo/q0lfIUmNcfSvQBSBZBZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id D0123582B4A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:36:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A60D63E9B1;
	Wed,  7 Oct 2026 15:36:26 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Christoph Hellwig <hch@lst.de>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH 1/2] mm/zswap: batch the writeback IO of consecutive entries
Date: Wed,  7 Oct 2026 17:34:43 +0200
Message-ID: <20261007153507.50715-2-alex@ghiti.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007153507.50715-1-alex@ghiti.fr>
References: <20261007153507.50715-1-alex@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alex@ghiti.fr
X-GND-Cause: dmFkZTFMmDhzRI1VF4VJEv1Glxi0/xCf5/UsaPxWiZO6CFitpeL7iII4ozF9mAko/Y4N96ToP1F+wO9d8Cyt3n3dCOkrHN5hKkSWqaXARpt/7JbAg3TpjzCUl4KqGKKBz3AR7HIKyFjdQExErAoROeYZPqoxG1hEcCJfeu4H30zWPy7XFcsGnqc1OviNnc7t7euAQXNG1ugsMfrmgxN7Mj3vrEto5zHPM7+7sYmBN/JegeTAvN4WAi4RcHGVN7oWMt7WFFDKBlNE6uQOLfQURLf3Il6Khr5Lc5CbsnRODEDRmt1CxIN5yefsqczuun4pWuL/6FgGBOZT1eF/1ulnRaqq9f5tsNMFC2UvucvHA4pLqgJ/GPVFDZfU1+8Am1I7bI5y2zD11GBygzJ8X3gFqnuuD1wv0hcAR7cSVPRq1tLtb1WJzgVTEo0VhrkbRNZ2sMQTWM8o2WKatM15mLpuD3PR1/4Vaa4yfv/JeqJG8FE/Lf04ZMPoOlknI0FYreqYqaLwH+WvercYbeQG8/vEQyu79LC7AbuHP5wt9O8+82QOhGTrlsHUZ/XDFpaKswe1Yrc2Vva4ytwZxfVVMncjfkiseOoEr+IRz/DxWbK7M99V7hKYtRaclP7Xd30yxX+3uR1YxJVeZGU1bXxlDV4hAU0KDnihCZYw6LsabuSaQpW+7WipZQ
X-GND-State: clean
X-GND-Score: -100

Commit 8f29aa226f82 ("mm/swap: introduce struct swap_io_ctx") introduced a
simple way to batch the swap writes of folios with consecutive slots into a
single bio. zswap writeback does not use it: zswap_writeback_entry()
submits a context of its own for every entry, so every entry written back
becomes its own IO.

So let the two functions that walk the zswap LRU, zswap_shrinker_scan()
and shrink_memcg(), own the context and submit it once the walk is done.

Kernel build (defconfig, -j4) in a 600M memory.max cgroup with the zswap
shrinker enabled, swapping to an NVMe partition with iocost enabled. It
runs alone, and next to a sibling fio random writer with 10 times its
io.weight so that iocost throttles it. Mean +- stddev, counters from the
build's cgroup:

Alone:

                                unbatched       batched
  build time (s)                1066 +- 9     1061 +- 2   -0.5%
  write requests (k)            748 +- 47     596 +- 26   -20.4%
  pages per write request    1.07 +- 0.01  1.30 +- 0.01   +21.2%
  iocost debt (s)             15.0 +- 2.7   12.1 +- 1.2   -19.5%
  iocost wait (s)              7.5 +- 1.2    7.2 +- 1.1   -3.6%
  IO full pressure (s)        19.0 +- 1.8   18.2 +- 0.9   -4.2%

Next to the writer:

                                unbatched       batched
  build time (s)               2269 +- 50    2203 +- 62   -2.9%
  write requests (k)            714 +- 31     605 +- 24   -15.2%
  pages per write request    1.08 +- 0.00  1.30 +- 0.02   +20.3%
  iocost debt (s)               685 +- 25     646 +- 26   -5.7%
  iocost wait (s)               655 +- 26     632 +- 23   -3.6%
  IO full pressure (s)          655 +- 31     624 +- 30   -4.7%

Suggested-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 mm/zswap.c | 47 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index ae19e301fced..698fb74c5d47 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -990,6 +990,21 @@ static bool zswap_decompress(struct zswap_entry *entry, struct folio *folio)
 /*********************************
 * writeback code
 **********************************/
+/* State shared by all the entries written back by one LRU walk. */
+struct zswap_shrink_ctl {
+	/*
+	 * Collects the writeback of consecutive entries into as few IOs as
+	 * possible. The owner of the walk must submit what is left in it
+	 * once it is done.
+	 */
+	struct swap_io_ctx io_ctx;
+	/*
+	 * If not NULL, stop the walk when writeback finds a folio already in
+	 * the swap cache, and set it to true.
+	 */
+	bool *encountered_page_in_swapcache;
+};
+
 /*
  * Attempts to free an entry by adding a folio to the swap cache,
  * decompressing the entry data into the folio, and issuing a
@@ -1001,8 +1016,12 @@ static bool zswap_decompress(struct zswap_entry *entry, struct folio *folio)
  * in the first place.  After the folio has been decompressed into
  * the swap cache, the compressed version stored by zswap can be
  * freed.
+ *
+ * The folio is only added to @ctx here, it is up to the owner of @ctx to
+ * submit the IO.
  */
-static int zswap_writeback_entry(struct zswap_entry *entry,
+static int zswap_writeback_entry(struct swap_io_ctx *ctx,
+				 struct zswap_entry *entry,
 				 swp_entry_t swpentry)
 {
 	struct xarray *tree;
@@ -1010,7 +1029,6 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	struct folio *folio;
 	struct mempolicy *mpol;
 	struct swap_info_struct *si;
-	struct swap_io_ctx ctx = {};
 	int ret = 0;
 
 	/* try to allocate swap cache folio */
@@ -1082,8 +1100,7 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	folio_put(folio);
 
 	/* start writeback */
-	__swap_writeout(&ctx, folio);
-	swap_write_submit(&ctx);
+	__swap_writeout(ctx, folio);
 
 	return 0;
 
@@ -1123,7 +1140,7 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
 				       void *arg)
 {
 	struct zswap_entry *entry = container_of(item, struct zswap_entry, lru);
-	bool *encountered_page_in_swapcache = (bool *)arg;
+	struct zswap_shrink_ctl *ctl = arg;
 	swp_entry_t swpentry;
 	enum lru_status ret = LRU_REMOVED_RETRY;
 	int writeback_result;
@@ -1178,7 +1195,7 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
 	 */
 	spin_unlock(&l->lock);
 
-	writeback_result = zswap_writeback_entry(entry, swpentry);
+	writeback_result = zswap_writeback_entry(&ctl->io_ctx, entry, swpentry);
 
 	if (writeback_result) {
 		zswap_reject_reclaim_fail++;
@@ -1189,9 +1206,9 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
 		 * into the warmer region. We should terminate shrinking (if we're in the dynamic
 		 * shrinker context).
 		 */
-		if (writeback_result == -EEXIST && encountered_page_in_swapcache) {
+		if (writeback_result == -EEXIST && ctl->encountered_page_in_swapcache) {
 			ret = LRU_STOP;
-			*encountered_page_in_swapcache = true;
+			*ctl->encountered_page_in_swapcache = true;
 		}
 	} else {
 		zswap_written_back_pages++;
@@ -1203,8 +1220,11 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
 static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
 		struct shrink_control *sc)
 {
-	unsigned long shrink_ret;
 	bool encountered_page_in_swapcache = false;
+	struct zswap_shrink_ctl ctl = {
+		.encountered_page_in_swapcache = &encountered_page_in_swapcache,
+	};
+	unsigned long shrink_ret;
 
 	if (!zswap_shrinker_enabled ||
 			!mem_cgroup_zswap_writeback_enabled(sc->memcg)) {
@@ -1213,7 +1233,9 @@ static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
 	}
 
 	shrink_ret = list_lru_shrink_walk(&zswap_list_lru, sc, &shrink_memcg_cb,
-		&encountered_page_in_swapcache);
+		&ctl);
+
+	swap_write_submit(&ctl.io_ctx);
 
 	if (encountered_page_in_swapcache)
 		return SHRINK_STOP;
@@ -1319,6 +1341,7 @@ static struct shrinker *zswap_alloc_shrinker(void)
  */
 static int shrink_memcg(struct mem_cgroup *memcg)
 {
+	struct zswap_shrink_ctl ctl = {};
 	int nid, shrunk = 0, scanned = 0;
 
 	if (!mem_cgroup_zswap_writeback_enabled(memcg))
@@ -1335,10 +1358,12 @@ static int shrink_memcg(struct mem_cgroup *memcg)
 		unsigned long nr_to_walk = SWAP_CLUSTER_MAX;
 
 		shrunk += list_lru_walk_one(&zswap_list_lru, nid, memcg,
-					    &shrink_memcg_cb, NULL, &nr_to_walk);
+					    &shrink_memcg_cb, &ctl, &nr_to_walk);
 		scanned += SWAP_CLUSTER_MAX - nr_to_walk;
 	}
 
+	swap_write_submit(&ctl.io_ctx);
+
 	/* Nothing was scanned: every LRU under @memcg was empty. */
 	if (!scanned)
 		return -ENOENT;
-- 
2.53.0-Meta

