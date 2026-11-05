Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904074;
	b=3OJ0A7DS+MG1ntR86FPkBtJEojTC/Mp/KCI6Sm/Es4uYEL+C669h6wI0hPJUfMPa0s+C
	 /f0DtnnWkDwdtmzHe5cuPQnB51SKSDwjcj8X8NZEeZfhz1rQJpv/i81v1jFcObp3brbr0
	 fFNc658TfhjI6/OAs/epw3DkGpCI8+hcgB0/ACx+aXT6cQyP7SZi9ydTpDwYyVKATi7i9
	 HyPPFc/tswXKNUkAoI9StKH+HoHZIe6IF8XXk41nfZh/P7I2Go/tIMJDEv/TXV1Wu+zND
	 zZCz/sn0NTUJMXObueNkOVkypC477pWZ6yRb9ZtLtO+91283DlkwcDqJY312OmkKrBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904074;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=99OaPNUALtrEo1DyIHDA5LAxQ/Si4UJO2itR3fKmwI0=;
	b=HPBKr+xhU5Mv5si/H1AQalHe+3Vi4uufs6ou9+6ADQuzrsms/oXAED2k2goynMAg+Pe3
	 VRjJU4+XZF8Gn712ycFDzO7yhRah8Ifrfp9egQ5YOccNaoHypBkJHXc+94wqJAuE1h2OD
	 v1oE0WLkld4A1HoI5Ldm3dfVxG2zL2FCLs+nrKPMHN2S8k+VJrv+cUxbr5QAfh94Hx3vC
	 tM0ejrtjBJQYTfdHK9ymKntQwzV5to96nn5cVFWJxaLHUkBmTZ1n5HGBKRK7OkJ070kQa
	 +4W1DcXy+pemf3c3YW9TejK9zvM6vaRNaS71bdVkhYNANWZXIdekk3vwY7aNHVW2u+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JeFYc1RQ;
	arc=none smtp.remote-ip=95.215.58.165
Received: from mta1.migadu.com (out-165.mta1.migadu.com [95.215.58.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B20606A33C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8B20606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JeFYc1RQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=A3/111gOQUX96DxN2YJbLmOUYLhJf9za3+Chp1HLx+s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904071; v=1; x=1794508871;
 b=JeFYc1RQnXyaNCJi/kyAaBHUekbi6bmrdzsnqK7rYDG+rMLVn4DiMXZ8DtDVzr/+Hk9EMxg1
 iLWSonkmVL34zf6pBK5xgn6z5nRo2DEsIT8nvAmfu8oDG0IqVhNPQjVe5lnTxBeiXbDhUgfXFus
 VKqHQK/lkslH7VOm0K10IA4A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 587db54ab7101a72;
	Thu, 05 Nov 2026 18:41:11 +0000
X-Mizu-Trace-ID: 587db54ab7101a72
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: chenhuacai@kernel.org,
	ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v9 13/32] mm/swap: allow duplicating a range of swap entries
Date: Thu,  5 Nov 2026 10:38:57 -0800
Message-ID: <20261105183940.2236717-14-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183940.2236717-1-usama.arif@linux.dev>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

swap_dup_entry_direct() duplicates one slot at a time. The PMD swap entry
fork path needs HPAGE_PMD_NR of them, and doing that one slot at a time
would take and drop the cluster lock HPAGE_PMD_NR times.

Give it an @nr argument and rename it swap_dup_entries_direct(), and do the
same for swap_retry_table_alloc(), whose GFP_KERNEL retry has to cover the
same range - the caller does not know which slot in it overflowed. Keep the
old single-slot names as inline wrappers so existing callers are untouched.

Unlike the put side, @nr is handed straight to the per-cluster helper, so
the range has to sit inside one cluster. That holds for the only caller
passing nr > 1: a PMD swap entry only exists under CONFIG_THP_SWAP, where
SWAPFILE_CLUSTER == HPAGE_PMD_NR, and a PMD-order folio's slots are only
ever allocated at a cluster head (see alloc_swap_scan_cluster()), so the
range is exactly one cluster. Reject a crossing range with -EINVAL so a
future caller cannot walk off the end of the swap table.

No functional change intended.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 include/linux/swap.h | 12 +++++++++-
 mm/swap.h            | 13 +++++++++-
 mm/swapfile.c        | 56 +++++++++++++++++++++++++++++++++-----------
 3 files changed, 65 insertions(+), 16 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 4f686709d71f0..861193d5ea109 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -417,9 +417,14 @@ sector_t swap_folio_sector(struct folio *folio);
  * All entries must be allocated by folio_alloc_swap(). And they must have
  * a swap count > 1. See comments of folio_*_swap helpers for more info.
  */
-int swap_dup_entry_direct(swp_entry_t entry);
+int swap_dup_entries_direct(swp_entry_t entry, int nr);
 void swap_put_entries_direct(swp_entry_t entry, int nr);
 
+static inline int swap_dup_entry_direct(swp_entry_t entry)
+{
+	return swap_dup_entries_direct(entry, 1);
+}
+
 /*
  * folio_free_swap tries to free the swap entries pinned by a swap cache
  * folio, it has to be here to be called by other components.
@@ -464,6 +469,11 @@ static inline void free_swap_cache(struct folio *folio)
 {
 }
 
+static inline int swap_dup_entries_direct(swp_entry_t ent, int nr)
+{
+	return 0;
+}
+
 static inline int swap_dup_entry_direct(swp_entry_t ent)
 {
 	return 0;
diff --git a/mm/swap.h b/mm/swap.h
index b8181bd056ee2..f028bd10c2cea 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -223,7 +223,12 @@ static inline void swap_cluster_unlock_irq(struct swap_cluster_info *ci)
 	spin_unlock_irq(&ci->lock);
 }
 
-extern int swap_retry_table_alloc(swp_entry_t entry, gfp_t gfp);
+int swap_retry_table_alloc_nr(swp_entry_t entry, unsigned int nr, gfp_t gfp);
+
+static inline int swap_retry_table_alloc(swp_entry_t entry, gfp_t gfp)
+{
+	return swap_retry_table_alloc_nr(entry, 1, gfp);
+}
 
 /*
  * Below are the core routines for doing swap for a folio.
@@ -453,6 +458,12 @@ static inline int swap_writeout(struct swap_io_ctx *ctx, struct folio *folio)
 	return 0;
 }
 
+static inline int swap_retry_table_alloc_nr(swp_entry_t entry, unsigned int nr,
+					    gfp_t gfp)
+{
+	return -EINVAL;
+}
+
 static inline int swap_retry_table_alloc(swp_entry_t entry, gfp_t gfp)
 {
 	return -EINVAL;
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 8dd2ba8254137..6b5149b88fa43 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1473,11 +1473,16 @@ static bool swap_sync_discard(void)
 
 static int swap_extend_table_alloc(struct swap_info_struct *si,
 				   struct swap_cluster_info *ci,
-				   unsigned int ci_off, gfp_t gfp)
+				   unsigned int ci_off, unsigned int nr,
+				   gfp_t gfp)
 {
 	int count;
+	unsigned int i;
 	void *table;
 
+	/* The range must not run past the end of @ci's swap table. */
+	VM_WARN_ON_ONCE(ci_off + nr > SWAPFILE_CLUSTER);
+
 	table = kzalloc(sizeof(ci->extend_table[0]) * SWAPFILE_CLUSTER, gfp);
 	if (!table)
 		return -ENOMEM;
@@ -1491,15 +1496,21 @@ static int swap_extend_table_alloc(struct swap_info_struct *si,
 	 */
 	if (!cluster_table_is_alloced(ci))
 		goto out_free;
-	count = swp_tb_get_count(__swap_table_get(ci, ci_off));
-	if (count < (SWP_TB_COUNT_MAX - 1))
-		goto out_free;
 	if (ci->extend_table)
 		goto out_free;
-
-	ci->extend_table = table;
-	spin_unlock(&ci->lock);
-	return 0;
+	/*
+	 * The caller may not know which slot in [ci_off, ci_off + nr) hit
+	 * SWP_TB_COUNT_MAX - 1. Confirm at least one slot in the range still
+	 * needs the extend table before committing the allocation.
+	 */
+	for (i = 0; i < nr; i++) {
+		count = swp_tb_get_count(__swap_table_get(ci, ci_off + i));
+		if (count >= (SWP_TB_COUNT_MAX - 1)) {
+			ci->extend_table = table;
+			spin_unlock(&ci->lock);
+			return 0;
+		}
+	}
 
 out_free:
 	spin_unlock(&ci->lock);
@@ -1507,19 +1518,23 @@ static int swap_extend_table_alloc(struct swap_info_struct *si,
 	return 0;
 }
 
-int swap_retry_table_alloc(swp_entry_t entry, gfp_t gfp)
+int swap_retry_table_alloc_nr(swp_entry_t entry, unsigned int nr, gfp_t gfp)
 {
 	int ret;
 	struct swap_info_struct *si;
 	struct swap_cluster_info *ci;
 	unsigned long offset = swp_offset(entry);
 
+	if (WARN_ON_ONCE(swp_cluster_offset(entry) + nr > SWAPFILE_CLUSTER))
+		return -EINVAL;
+
 	si = get_swap_device(entry);
 	if (IS_ERR_OR_NULL(si))
 		return 0;
 
 	ci = __swap_offset_to_cluster(si, offset);
-	ret = swap_extend_table_alloc(si, ci, swp_cluster_offset(entry), gfp);
+	ret = swap_extend_table_alloc(si, ci, swp_cluster_offset(entry), nr,
+				      gfp);
 
 	put_swap_device(si);
 	return ret;
@@ -1695,6 +1710,9 @@ static int __swap_cluster_dup_entry(struct swap_cluster_info *ci,
  * @offset: start offset of slots.
  * @nr: number of slots.
  *
+ * The range [offset, offset + nr) must not cross a cluster boundary; the
+ * caller is responsible for splitting a range that can.
+ *
  * Context: The specified slots must be pinned by existing swap count or swap
  * cache reference, so they won't be released until this helper returns.
  * Return: 0 on success. -ENOMEM if the swap count maxed out (SWP_TB_COUNT_MAX)
@@ -1709,6 +1727,7 @@ static int swap_dup_entries_cluster(struct swap_info_struct *si,
 
 	ci_start = offset % SWAPFILE_CLUSTER;
 	ci_end = ci_start + nr;
+	VM_WARN_ON_ONCE(ci_end > SWAPFILE_CLUSTER);
 	ci_off = ci_start;
 	ci = swap_cluster_lock(si, offset);
 restart:
@@ -1717,7 +1736,8 @@ static int swap_dup_entries_cluster(struct swap_info_struct *si,
 		if (unlikely(err)) {
 			if (err == -ENOMEM) {
 				spin_unlock(&ci->lock);
-				err = swap_extend_table_alloc(si, ci, ci_off, GFP_ATOMIC);
+				err = swap_extend_table_alloc(si, ci, ci_off, 1,
+							      GFP_ATOMIC);
 				spin_lock(&ci->lock);
 				if (!err)
 					goto restart;
@@ -1728,6 +1748,7 @@ static int swap_dup_entries_cluster(struct swap_info_struct *si,
 	swap_cluster_unlock(ci);
 	return 0;
 failed:
+	/* The caller's page-table or swap-cache reference pins every slot. */
 	while (ci_off-- > ci_start)
 		__swap_cluster_put_entry(ci, ci_off);
 	swap_cluster_unlock(ci);
@@ -3964,8 +3985,9 @@ void si_swapinfo(struct sysinfo *val)
 }
 
 /*
- * swap_dup_entry_direct() - Increase reference count of a swap entry by one.
+ * swap_dup_entries_direct() - Increase reference count of swap entries by one.
  * @entry: first swap entry from which we want to increase the refcount.
+ * @nr: number of contiguous swap entries to duplicate.
  *
  * Returns 0 for success, or -ENOMEM if the extend table is required
  * but could not be atomically allocated.  Returns -EINVAL if the swap
@@ -3976,8 +3998,11 @@ void si_swapinfo(struct sysinfo *val)
  * owner. e.g., locking the PTL of a PTE containing the entry being increased.
  * Also the swap entry must have a count >= 1. Otherwise folio_dup_swap should
  * be used.
+ *
+ * Unlike swap_put_entries_direct(), the whole range [entry, entry + nr) must
+ * lie within one swap cluster; a crossing range is rejected with -EINVAL.
  */
-int swap_dup_entry_direct(swp_entry_t entry)
+int swap_dup_entries_direct(swp_entry_t entry, int nr)
 {
 	struct swap_info_struct *si;
 
@@ -3987,6 +4012,9 @@ int swap_dup_entry_direct(swp_entry_t entry)
 		return -EINVAL;
 	}
 
+	if (WARN_ON_ONCE(swp_cluster_offset(entry) + nr > SWAPFILE_CLUSTER))
+		return -EINVAL;
+
 	/*
 	 * The caller must be increasing the swap count from a direct
 	 * reference of the swap slot (e.g. a swap entry in page table).
@@ -3994,7 +4022,7 @@ int swap_dup_entry_direct(swp_entry_t entry)
 	 */
 	VM_WARN_ON_ONCE(!swap_entry_swapped(si, entry));
 
-	return swap_dup_entries_cluster(si, swp_offset(entry), 1);
+	return swap_dup_entries_cluster(si, swp_offset(entry), nr);
 }
 
 #if defined(CONFIG_MEMCG) && defined(CONFIG_BLK_CGROUP)
-- 
2.53.0-Meta

