Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCA74BA1D1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791387582; cv=none; b=fbbcAAAZU4Cfpk9T9NVFyHTfR4/lA/cQbQvHxZeSH648MGT+sGe9jYc/3+ajsdspboKToKMUMbC/WnwS5AM7w3SfmEEL/WVRjafoOrSaCF5O3vUXQ7MekADdG9UAUYFuasBzbWhTo3C0LCNekKdczoAN+bfamYs/o4BkPlHb1XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791387582; c=relaxed/simple;
	bh=LcK0JwkQF26W9j73g6p+7P2mTvZ02+gjad+QXOUpeeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E7HW8FCTYObw/yfDEZfarRsO7rqRaHganqr02BxkDn7HGUim6x8h3UJoijoqPDuXg9j6nyGmpGpauGomk3b7SAt9b6HyZG8QNEgpP629bXmNGU5D/S7HDFdQjmTSfzY5CwewMO9d+3f3n4S54hSBVlnGLrOiGU/ddM8oajPHF9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99B603ED0B;
	Wed,  7 Oct 2026 15:39:20 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	nphamcs@gmail.com
Cc: shikemeng@huaweicloud.com,
	baoquan.he@linux.dev,
	youngjun.park@lge.com,
	chengming.zhou@linux.dev,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	kasong@tencent.com,
	ryncsn@gmail.com,
	chrisl@kernel.org,
	baohua@kernel.org,
	usama.arif@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v3] mm: bypass swap readahead for zswap
Date: Wed,  7 Oct 2026 17:39:08 +0200
Message-ID: <20261007153915.53429-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alex@ghiti.fr
X-GND-Score: 0
X-GND-Cause: dmFkZTFP1SzsGG2TRP1EL7olQ2wIwic2hq4WA8U6oUihmWJQO4j1F9rLVuRRtycUEZZaBDSZFV53dwDMuuWwSOQfNdf4qP1r6laiiFRDmdTchAuRwWz3vc4YWUjK0707CH1QJQYfWdvHwD4MzpNf0QDrjrKu0lOgyJn8ANugkG3Fa3GgJH0kj7LS642h912u7KumPMito6lyhOOd0f0A38S9GJ9AxkU93qpohN6UO8xLeAc4wmFv779PwYUzccha5lveTMhOLQwQxlpAA7Gcn6DMO0lQ/nRIL508SQWXMz5CKr0e0pXQJ7QGvyAWRGDvlXjZCHvh6xGCOPNVn361/5EDOMIMKE3DGtOr3WIL7JdsOC2BLBLV9bqKXAuHAUOHTFLuN4RpzZgrnR+HKDY7fVXZjmN+VNR76CtAgTCKx8WnUGr+f2JYUBDCgA40ZsC4caGUp528vR2lWQlTpWfiLteKawh9O4d2On8a/vFrfhRRRFOZKVZlU7U78ytcqnOW8HUtrTKAFr84A7eaOjp2nJhHvjVsszdYsL75x9+Plo4hF5o4wuGiI3Q0CqzGCuNN/QcfdYR5eVsBlpmjYGwpEKphAi4p/bc15hp0lgiCxicDeKhziMyXFfJKQK10SnmKL9h0dBaQShf7xi4RvB4vEewoDVXG5pGUo2Eo/fYggHP6oPLLaQ
X-GND-State: clean

Commit 0bcac06f27d7 ("mm, swap: skip swapcache for swapin of synchronous
device") made SWP_SYNCHRONOUS_IO devices (e.g. zram) skip swap readahead.

zswap is the same kind of in-memory, synchronous backend as zram, not a
swap device flagged SWP_SYNCHRONOUS_IO so it still goes through
swapin_readahead().

Here are the results from bypassing readahead for zswap too: it was
measured with a kernel build (make -j16) in a memcg, zswap=zstd, shrinker
off, on Sapphire Rapids and 3 iterations.

  768M memcg (sustained swap thrash):
    metric                 mm-new    + bypass    delta
    build time (s)          405.0       341.7    -15.6%
    zswap-in (GB)            79.5        53.0     -33%
    zswap-out (GB)          144.8       115.6     -20%
    swap readahead (pages)  6.79M       0.45M     -93%
    swap_ra hit (%)          72.1        89.9     +18pp

  1G memcg (light pressure, build not memory-bound):
    metric                 mm-new    + bypass    delta
    build time (s)          177.7       176.0    ~same (no regression)
    zswap-in (GB)            10.2         7.5     -26%
    zswap-out (GB)           27.7        25.1      -9%
    swap readahead (pages)  1.07M       0.08M     -93%
    swap_ra hit (%)          68.6        87.2     +19pp

Similar gains were observed on an AMD EPYC 7D13 host.

The gain is from no longer prefetching pages that are pointless for an
in-memory backend: readahead inflates anon residency and thrashes the
page cache (file pages get evicted and re-read), lengthens each fault by
synchronously (de)compressing a cluster of neighbours, and adds
compression traffic when those extra pages are reclaimed.

Bypassing swap readahead for zswap therefore makes sense.

Suggested-by: Usama Arif <usama.arif@linux.dev>
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
Changes in v3:
- Go back to the RFC's single patch: readahead windows that mix zswap
  and disk entries will be dealt with later, the priority is to merge the
  zswap readahead bypass
- Move the check into a swap helper, swap_entry_synchronous(), instead
  of open-coding it in do_swap_page() (David)
- Bail out early when zswap was never enabled or the tree is empty, so
  disk-only systems pay a static branch (Kairui, Nhat)
- Reuse zswap_is_present() rather than adding zswap_present_test()
  (Yosry)
- Rebase on mm-new

Changes in v2:
- Keep readahead, but overlap the decompression of zswap neighbours with
  the disk I/O of the window, and bypass it when the target needs no
  disk I/O (Yosry, Nhat, Barry)

v2: https://lore.kernel.org/all/20260722163536.773166-1-alex@ghiti.fr/
RFC: https://lore.kernel.org/all/20260624075700.751467-1-alex@ghiti.fr/

 include/linux/zswap.h |  6 ++++++
 mm/memory.c           |  4 ++--
 mm/swap.h             | 25 +++++++++++++++++++++++++
 mm/zswap.c            |  5 ++++-
 4 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/include/linux/zswap.h b/include/linux/zswap.h
index df6cafbe95dc..94746fb71bb6 100644
--- a/include/linux/zswap.h
+++ b/include/linux/zswap.h
@@ -35,6 +35,7 @@ void zswap_lruvec_state_init(struct lruvec *lruvec);
 void zswap_folio_swapin(struct folio *folio);
 bool zswap_is_enabled(void);
 bool zswap_never_enabled(void);
+bool zswap_is_present(swp_entry_t entry, unsigned int nr);
 #else
 
 struct zswap_lruvec_state {};
@@ -73,6 +74,11 @@ static inline bool zswap_never_enabled(void)
 	return true;
 }
 
+static inline bool zswap_is_present(swp_entry_t entry, unsigned int nr)
+{
+	return false;
+}
+
 #endif
 
 #endif /* _LINUX_ZSWAP_H */
diff --git a/mm/memory.c b/mm/memory.c
index 330cde31bf8b..396bc71a265f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5030,8 +5030,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	if (folio)
 		swap_update_readahead(folio, vma, vmf->address);
 	if (!folio) {
-		/* Swapin bypasses readahead for SWP_SYNCHRONOUS_IO devices */
-		if (data_race(si->flags & SWP_SYNCHRONOUS_IO))
+		/* Swapin bypasses readahead for SWP_SYNCHRONOUS_IO devices and zswap */
+		if (swap_entry_synchronous(si, entry))
 			folio = swapin_sync(entry, GFP_HIGHUSER_MOVABLE,
 					    thp_swapin_suitable_orders(vmf) | BIT(0),
 					    vmf, NULL, 0);
diff --git a/mm/swap.h b/mm/swap.h
index d5bf21f517dc..b8181bd056ee 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -94,6 +94,7 @@ static inline int mem_cgroup_swappiness(const struct mem_cgroup *memcg)
 
 #ifdef CONFIG_SWAP
 #include <linux/swapops.h> /* for swp_offset */
+#include <linux/zswap.h> /* for zswap_is_present */
 #include <linux/blk_types.h> /* for bio_end_io_t */
 
 static inline unsigned int swp_cluster_offset(swp_entry_t entry)
@@ -336,6 +337,24 @@ struct folio *swapin_sync(swp_entry_t entry, gfp_t flag, unsigned long orders,
 void swap_update_readahead(struct folio *folio, struct vm_area_struct *vma,
 			   unsigned long addr);
 
+/**
+ * swap_entry_synchronous - check if @entry is read synchronously
+ * @si: the swap device of @entry
+ * @entry: the swap entry
+ *
+ * SWP_SYNCHRONOUS_IO devices and zswap complete a read in the faulting
+ * context, so swap readahead has no asynchronous I/O to overlap.
+ *
+ * Context: The caller must hold a reference on @si. The answer is a hint: the
+ * entry can be written back from zswap or freed concurrently.
+ */
+static inline bool swap_entry_synchronous(struct swap_info_struct *si,
+					  swp_entry_t entry)
+{
+	return data_race(si->flags & SWP_SYNCHRONOUS_IO) ||
+	       zswap_is_present(entry, 1);
+}
+
 #else /* CONFIG_SWAP */
 
 static inline struct swap_cluster_info *swap_cluster_get_and_lock(
@@ -423,6 +442,12 @@ static inline void swap_update_readahead(struct folio *folio,
 {
 }
 
+static inline bool swap_entry_synchronous(struct swap_info_struct *si,
+					  swp_entry_t entry)
+{
+	return false;
+}
+
 static inline int swap_writeout(struct swap_io_ctx *ctx, struct folio *folio)
 {
 	return 0;
diff --git a/mm/zswap.c b/mm/zswap.c
index eb3494491410..1dcf77d5edae 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1605,12 +1605,15 @@ bool zswap_store(struct folio *folio)
  * change under it.
  * Return: true if at least one slot in the range is in zswap.
  */
-static bool zswap_is_present(swp_entry_t entry, unsigned int nr)
+bool zswap_is_present(swp_entry_t entry, unsigned int nr)
 {
 	pgoff_t offset = swp_offset(entry);
 	struct xarray *tree = swap_zswap_tree(entry);
 	unsigned long index = offset;
 
+	if (zswap_never_enabled() || xa_empty(tree))
+		return false;
+
 	/*
 	 * A pinned range is at most SWAPFILE_CLUSTER slots and is aligned to
 	 * its own size, so one tree covers all of it and a single lookup is
-- 
2.53.0-Meta

