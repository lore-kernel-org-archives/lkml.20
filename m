Received: from mta0.migadu.com (out-57.mta0.migadu.com [91.218.175.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0197C48381D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968925; cv=none; b=DWyRZGcfuInSgHcaaaGjnvCt3zm8S4dFZPukGObIg3dNT9hPJqD05AmObQUbpZjSy+VjY6XPubr3IFqGaayg7k6JSKrtiHXHt5JKEXMid9jbq1tbpRJF7lbdRa6IEfE0D9Y83clXTo6vBA/vD8L0EygAxLyWB+al26ibrjz9sGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968925; c=relaxed/simple;
	bh=Yi2o4E6jvrlhNUvXO1iyMzGGl83qdBuhWx+mVWs45IU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P/U7vLsYYz8djVTYkEUZy+7iXH8F9mvB+T/v7i/FKK+SMN3rZjFZjuqGstZJLTveKAAUe+fYSuSAWl8SFCFE3rEIdZg3gd0qojveQP8Tl99PM91GXWAymLLNsTFUQHDok/50VPVpABkd00EObrHQB4lbysZCENrSN452bEhp4ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=c0eqYvp1; arc=none smtp.client-ip=91.218.175.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="c0eqYvp1"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Yi2o4E6jvrlhNUvXO1iyMzGGl83qdBuhWx+mVWs45IU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791968920; v=1; x=1792573720;
 b=c0eqYvp1Z/KQaH7DLM//9cbrSu69qeSoHnoAOk1lnuepMgE3PMfzsWRwnYpiAXHkgNtpIXYa
 dAwYrRD9HxAOkFInn5XIKq/nXPtBwGr9ngvjWWSxdvobQSAC3ShVOFeLOPHInLtUKbqW2unKyUB
 MGPahkDasJFZ2SW17bFLw/sc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ee47123ca44ef893;
	Wed, 14 Oct 2026 09:08:38 +0000
X-Mizu-Trace-ID: ee47123ca44ef893
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: linux-mm@kvack.org
Cc: Jiayuan Chen <jiayuan.chen@shopee.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH mm-next] mm/swap: free swap cache folios the zap path gave up on
Date: Wed, 14 Oct 2026 17:08:19 +0800
Message-ID: <20261014090821.227366-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiayuan Chen <jiayuan.chen@shopee.com>

On our production hosts we saw swap cache only pages keep growing for days:
on a box with a 500 GiB swap partition, 250 GiB of RAM and 250 GiB of
swap slots were held by folios that no process mapped any more, charged
to cgroups whose workloads had long exited. The only way to get them
back was swapoff, and with other services actively swapping on the
same host that is not an option.

Such a slot has swap count 0 and an unmapped folio pinned in the swap
cache, left there after a process exited or did MADV_DONTNEED. No page
table holds its swap entry any more, so nothing comes back for the
slot; LRU reclaim drops it eventually, and the allocator only reclaims
such slots once swap is half full. The growth stopped exactly there:
at 50% of the device, where vm_swap_full() becomes true.

The race is readahead against a zap in a neighbouring thread. Readahead
works on virtual addresses, so a fault at the end of thread A's range
pulls in the entries at the start of thread B's range:

  thread A                               thread B
  do_swap_page()
    swap_vma_readahead()
      swap_cache_read_folio(B's entry)
        folio locked, added to cache
        swap_read_folio()                MADV_DONTNEED
          zswap_load() / bio in flight     zap_nonpresent_ptes()
          .                                  swap_put_entries_cluster()
          .                                    swap count 1 -> 0
          .                                    __try_to_reclaim_swap()
          .                                      folio_trylock() fails
          .                                      gives up
          folio_unlock()
      folio_put()
  -> slot: swap count 0, folio in swap cache, not mapped, never freed

The lock is one reason it gives up. The other is writeback: with a block
device as backing store, B's own PAGEOUT leaves the folio in the swap
cache under writeback, and when the DONTNEED comes __try_to_reclaim_swap()
gets the lock but folio_swapcache_freeable() refuses. The write
completes, nobody frees the slot. The present-PTE side has the same two
outcomes through free_swap_cache().

Options considered:

1. Fix it on the readahead side: after the read, check the swap count
   and free the slot. Covers the lock, not writeback, and the
   asynchronous read path unlocks in the bio completion where the slot
   cannot be freed. Two places to patch, neither clean.
2. swapoff/swapon clears it, as does memory.reclaim on the right cgroup.
   That is a workaround, not a fix.
3. Have the side that gives up come back later. This patch.

The zap runs under the PTL and the fault path takes the folio lock
before the PTL, so waiting there is out; a worker has to do it. On a
lost trylock or a writeback refusal under TTRS_UNMAPPED,
__try_to_reclaim_swap() schedules si->sweep_work. The worker walks the
in-use clusters and, for every slot with swap count 0 whose folio is
unmapped, calls __try_to_reclaim_swap() with TTRS_WAIT, which takes the
folio lock and waits for writeback instead of giving up.
free_swap_cache() now calls __try_to_reclaim_swap() as well, so both
paths give up, and wake the worker, in the same place.

For now the worker scans every in-use cluster of the device; marking
the clusters that need it can reduce that later.

Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
---
 include/linux/swap.h |   1 +
 mm/swap.h            |   1 +
 mm/swap_state.c      |   9 ++--
 mm/swapfile.c        | 101 ++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 104 insertions(+), 8 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 4f686709d71f..5777f10e9aa4 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -267,6 +267,7 @@ struct swap_info_struct {
 					 */
 	struct work_struct discard_work; /* discard worker */
 	struct work_struct reclaim_work; /* reclaim worker */
+	struct work_struct sweep_work;	/* frees swap cache only slots a zap gave up on */
 	struct list_head discard_clusters; /* discard clusters list */
 	struct plist_node avail_list;   /* entry in swap_avail_head */
 	const struct swap_ops *ops;
diff --git a/mm/swap.h b/mm/swap.h
index d5bf21f517dc..f62f36c0ce5c 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -309,6 +309,7 @@ static inline bool folio_matches_swap_entry(const struct folio *folio,
  * - See the comment of get_swap_device() for more complex usage.
  */
 bool swap_cache_has_folio(swp_entry_t entry);
+void swap_reclaim_entry(swp_entry_t entry);
 struct folio *swap_cache_get_folio(swp_entry_t entry);
 void *swap_cache_get_shadow(swp_entry_t entry);
 void swap_cache_del_folio(struct folio *folio);
diff --git a/mm/swap_state.c b/mm/swap_state.c
index ebef568cd62e..99708f149b25 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -598,16 +598,13 @@ void swap_writeback_dropbehind_folio(struct folio *folio)
  *
  * Its ok to check the swapcache flag without the folio lock
  * here because we are going to recheck again inside
- * folio_free_swap() _with_ the lock.
+ * __try_to_reclaim_swap() _with_ the lock.
  * 					- Marcelo
  */
 void free_swap_cache(struct folio *folio)
 {
-	if (folio_test_swapcache(folio) && !folio_mapped(folio) &&
-	    folio_trylock(folio)) {
-		folio_free_swap(folio);
-		folio_unlock(folio);
-	}
+	if (folio_test_swapcache(folio) && !folio_mapped(folio))
+		swap_reclaim_entry(folio->swap);
 }
 
 /*
diff --git a/mm/swapfile.c b/mm/swapfile.c
index c3288910b3e3..ee29085152fe 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -172,6 +172,8 @@ static long swap_usage_in_pages(struct swap_info_struct *si)
 #define TTRS_UNMAPPED		0x2
 /* Reclaim the swap entry if swap is getting full */
 #define TTRS_FULL		0x4
+/* May sleep: wait for the folio lock and for writeback instead of giving up */
+#define TTRS_WAIT		0x8
 
 static bool swap_only_has_cache(struct swap_cluster_info *ci,
 				unsigned long offset, int nr_pages)
@@ -217,9 +219,19 @@ static int __try_to_reclaim_swap(struct swap_info_struct *si,
 	 * avoiding deadlock. This is a special case and you should
 	 * use folio_free_swap() with explicit folio_lock() in usual
 	 * operations.
+	 *
+	 * The zap path (TTRS_UNMAPPED) is the one caller for which giving
+	 * up means the slot is never looked at again: it stays allocated
+	 * with count 0 and an unmapped folio pinned in the swap cache. Let
+	 * the sweep worker, which can wait, come back for it.
 	 */
-	if (!folio_trylock(folio))
+	if (flags & TTRS_WAIT) {
+		folio_lock(folio);
+	} else if (!folio_trylock(folio)) {
+		if (flags & TTRS_UNMAPPED)
+			schedule_work(&si->sweep_work);
 		goto out;
+	}
 
 	/*
 	 * Offset could point to the middle of a large folio, or folio
@@ -232,11 +244,20 @@ static int __try_to_reclaim_swap(struct swap_info_struct *si,
 	}
 	offset = swp_offset(folio->swap);
 
+	if (flags & TTRS_WAIT)
+		folio_wait_writeback(folio);
+
 	need_reclaim = ((flags & TTRS_ANYWAY) ||
 			((flags & TTRS_UNMAPPED) && !folio_mapped(folio)) ||
 			((flags & TTRS_FULL) && mem_cgroup_swap_full(folio)));
-	if (!need_reclaim || !folio_swapcache_freeable(folio))
+	if (!need_reclaim)
+		goto out_unlock;
+	if (!folio_swapcache_freeable(folio)) {
+		/* Same for a folio the zap caught under writeback. */
+		if ((flags & TTRS_UNMAPPED) && folio_test_writeback(folio))
+			schedule_work(&si->sweep_work);
 		goto out_unlock;
+	}
 
 	/*
 	 * It's safe to delete the folio from swap cache only if the folio
@@ -1099,6 +1120,80 @@ static void swap_reclaim_work(struct work_struct *work)
 	swap_reclaim_full_clusters(si, true);
 }
 
+/*
+ * Free the slots a zap could not take back: swap cache only, count 0, folio
+ * not mapped. The zap runs under the PTL, so when the folio was locked (a
+ * readahead or an asynchronous swap-in still reading into it) or under
+ * writeback, __try_to_reclaim_swap() had to give up and scheduled us. Such
+ * a slot is reachable by nobody but LRU reclaim: no page table holds its
+ * entry, and the allocator skips it until swap is half full. Here we can
+ * wait for the lock and the writeback.
+ */
+static void swap_sweep_work(struct work_struct *work)
+{
+	struct swap_info_struct *si;
+	struct swap_cluster_info *ci;
+	unsigned long offset, end, swp_tb;
+	unsigned long nr_clusters;
+	int nr_reclaim;
+
+	si = container_of(work, struct swap_info_struct, sweep_work);
+	nr_clusters = DIV_ROUND_UP(si->max, SWAPFILE_CLUSTER);
+
+	for (unsigned long i = 0; i < nr_clusters; i++) {
+		ci = si->cluster_info + i;
+		offset = i * SWAPFILE_CLUSTER;
+		end = min(si->max, offset + SWAPFILE_CLUSTER);
+
+		spin_lock(&ci->lock);
+		if (!ci->count) {
+			spin_unlock(&ci->lock);
+			continue;
+		}
+		while (offset < end) {
+			swp_tb = swap_table_get(ci, offset % SWAPFILE_CLUSTER);
+			/*
+			 * A mapped folio with count 0 is a page swapped in and
+			 * kept in the swap cache: useful, and not ours. The
+			 * folio cannot leave the cache while we hold ci->lock,
+			 * so peeking at it is safe; the real check is done
+			 * under the folio lock in __try_to_reclaim_swap().
+			 */
+			if (swp_tb_is_folio(swp_tb) && !__swp_tb_get_count(swp_tb) &&
+			    !folio_mapped(swp_tb_to_folio(swp_tb))) {
+				spin_unlock(&ci->lock);
+				nr_reclaim = __try_to_reclaim_swap(si, offset,
+								   TTRS_UNMAPPED | TTRS_WAIT);
+				spin_lock(&ci->lock);
+				if (nr_reclaim) {
+					offset += abs(nr_reclaim);
+					continue;
+				}
+			}
+			offset++;
+		}
+		spin_unlock(&ci->lock);
+		cond_resched();
+	}
+}
+
+/*
+ * The present-PTE zap path drops a folio that was mapped from the swap
+ * cache. Same rules as the swap-entry zap: free the slot if the folio is
+ * unmapped and unused, let the worker handle it if that is not possible
+ * right now. @entry may already be stale, get_swap_device() sorts that out.
+ */
+void swap_reclaim_entry(swp_entry_t entry)
+{
+	struct swap_info_struct *si;
+
+	si = get_swap_device(entry);
+	if (IS_ERR_OR_NULL(si))
+		return;
+	__try_to_reclaim_swap(si, swp_offset(entry), TTRS_UNMAPPED);
+	put_swap_device(si);
+}
+
 /*
  * Try to allocate swap entries with specified order and try set a new
  * cluster for current CPU too.
@@ -3264,6 +3359,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 
 	flush_work(&p->discard_work);
 	flush_work(&p->reclaim_work);
+	flush_work(&p->sweep_work);
 	flush_percpu_swap_cluster(p);
 
 	destroy_swap_extents(p, p->swap_file);
@@ -3744,6 +3840,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 
 	INIT_WORK(&si->discard_work, swap_discard_work);
 	INIT_WORK(&si->reclaim_work, swap_reclaim_work);
+	INIT_WORK(&si->sweep_work, swap_sweep_work);
 
 	CLASS(filename, name)(specialfile);
 	swap_file = file_open_name(name, O_RDWR | O_LARGEFILE | O_EXCL, 0);
-- 
2.43.0

