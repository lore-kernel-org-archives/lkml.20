Received: from mta1.migadu.com (out-9.mta1.migadu.com [95.215.58.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F54F2931C1
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789878639; cv=none; b=k/nd5391caD1wx11AlVPTw42vYBZA3tWUvhYoVwoj7cF85stTU0eM/oxJhj+7uh1jvYjGeuriQHNJscd33HWwuCWWUVzEnVg/pMNSNp4Qp2hJOaGIwQZ/cJLqYnYt9fhOKymvqzTVegdt+Hd3WGThm/amPN/EkcJD03j+qfX3+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789878639; c=relaxed/simple;
	bh=TgrUaoIcfeyXCzjO0gIV1NEvHecdV5MhC5ykQWIT36o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IxfXsvkz6ZdEB0xMr4DFHPlPEOwJ49QeJYrs/DICGGOy9uJcbrW6Ej9kJC6VURRcOneJU35okUkHpJ4ylagqX/IfUHJbkngH45x8h9qfhEIlVeC8VD912I8wdbUsD3JFRMNaV8fJGPC1ofKcGLTvf0LsrGAeh35YQkQ+Sv71PzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e4VmGXpK; arc=none smtp.client-ip=95.215.58.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e4VmGXpK"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TgrUaoIcfeyXCzjO0gIV1NEvHecdV5MhC5ykQWIT36o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789878635; v=1; x=1790483435;
 b=e4VmGXpKHlhLHeZexgq2+8IOwttKu+oAwkaVFcf8oA/3+8bCewKHXNZ8U71kDeZmOfi/J5DF
 sHAVKV63MmYJ4yVO2YNrRyqNGHXubWX2zTxWCowrRK/W2sQMxDjaUKIgmFFLCBfpJuOwJPOrXAc
 7QeC1c7DmQ/r8pWF7IGnzDPA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dacf3ab7917213a9;
	Sun, 20 Sep 2026 04:30:35 +0000
X-Mizu-Trace-ID: dacf3ab7917213a9
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Cc: Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)),
	linux-kernel@vger.kernel.org,
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH mm-new] mm: vmscan: put rotation-missed folios at the LRU tail
Date: Sun, 20 Sep 2026 12:30:15 +0800
Message-Id: <20260920043015.3126317-1-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ridong Chen <chenridong@xiaomi.com>

The page reclaim isolates a batch of folios from the tail of an LRU list
and works on them one by one.  For a suitable swap-backed folio on an
async swap device, it queues the folio for writeback and, after finishing
the batch, puts the folio back to the head of the original LRU list.

Meanwhile the page writeback flushes the queued folios in its own,
independent batches.  For each folio it writes back it calls
folio_rotate_reclaimable(), which tries to rotate the folio to the LRU
tail.  But folio_rotate_reclaimable() only takes effect once the folio has
been put back by reclaim.  If the async swap device is fast enough, the
writeback can complete a folio while reclaim is still working on the rest
of the batch that contains it.  In that case the folio stays near the head
and reclaim will not revisit it before wrapping around, causing a cold/hot
inversion: a clean, written-back folio that should be a prime reclaim
candidate is kept ahead of hotter folios.

commit 359a5e1416ca ("mm: multi-gen LRU: retry folios written back while
isolated") addressed this for MGLRU only.  The traditional active/inactive
LRU has the same problem, reported at [1].  A reproducer is available at
[2].

Rather than re-reclaiming those folios (which would drop the swap cache
that may still be useful for a future hit [4]), restore the rotation that
was missed: when move_folios_to_lru() puts a folio back, add it to the LRU
tail if it looks like it missed folio_rotate_reclaimable() (inactive, not
mapped, not dirty and not under writeback).  A new do_rotate parameter
gates this so it only applies on the reclaim put-back path
(shrink_inactive_list()), not on shrink_active_list() where the list order
is already deliberate.  This approach was suggested by Barry Song [3].

Only the traditional LRU is handled here.  MGLRU already retries such
folios via its own clean-list retry pass in evict_folios(), so it is left
unchanged.  The same do_rotate scheme could later replace that retry pass
to unify both LRUs, which is left for a follow-up.

[1] https://lore.kernel.org/linux-kernel/20241010081802.290893-1-chenridong@huaweicloud.com/
[2] https://lore.kernel.org/lkml/46037a37-4cf6-448e-a94b-30a4d16e8814@linux.dev/
[3] https://lore.kernel.org/lkml/CAGsJ_4zwP3_+EYY5Ug9EJ+yD1UdxsBSGr25u8s1K3u_i7LH3Zg@mail.gmail.com/
[4] https://lore.kernel.org/linux-mm/20260911121341.178028-1-alex@ghiti.fr/

Suggested-by: Barry Song <baohua@kernel.org>
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 mm/vmscan.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index e200ce3eb056..026b844c681f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1971,7 +1971,7 @@ static bool too_many_isolated(struct pglist_data *pgdat, int file,
  *
  * Note: The caller must not hold any lruvec lock.
  */
-static unsigned int move_folios_to_lru(struct list_head *list)
+static unsigned int move_folios_to_lru(struct list_head *list, bool do_rotate)
 {
 	int nr_pages, nr_moved = 0;
 	struct lruvec *lruvec = NULL;
@@ -2018,7 +2018,16 @@ static unsigned int move_folios_to_lru(struct list_head *list)
 			continue;
 		}
 
-		lruvec_add_folio(lruvec, folio);
+		/*
+		 * Put folios that may have missed folio_rotate_reclaimable()
+		 * at the tail to avoid cold/hot inversion.
+		 */
+		if (do_rotate && !folio_test_active(folio) && !folio_mapped(folio) &&
+		    !folio_test_dirty(folio) && !folio_test_writeback(folio))
+			lruvec_add_folio_tail(lruvec, folio);
+		else
+			lruvec_add_folio(lruvec, folio);
+
 		nr_pages = folio_nr_pages(folio);
 		nr_moved += nr_pages;
 		if (folio_test_active(folio))
@@ -2135,7 +2144,7 @@ static unsigned long shrink_inactive_list(unsigned long nr_to_scan,
 	nr_reclaimed = shrink_folio_list(&folio_list, pgdat, sc, &stat, false,
 					 lruvec_memcg(lruvec));
 
-	move_folios_to_lru(&folio_list);
+	move_folios_to_lru(&folio_list, true);
 
 	mod_lruvec_state(lruvec, PGDEMOTE_KSWAPD + reclaimer_offset(sc),
 					stat.nr_demoted);
@@ -2246,8 +2255,8 @@ static void shrink_active_list(unsigned long nr_to_scan,
 	/*
 	 * Move folios back to the lru list.
 	 */
-	nr_activate = move_folios_to_lru(&l_active);
-	nr_deactivate = move_folios_to_lru(&l_inactive);
+	nr_activate = move_folios_to_lru(&l_active, false);
+	nr_deactivate = move_folios_to_lru(&l_inactive, false);
 
 	count_vm_events(PGDEACTIVATE, nr_deactivate);
 	count_memcg_events(lruvec_memcg(lruvec), PGDEACTIVATE, nr_deactivate);
@@ -5115,7 +5124,7 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 			folio_set_active(folio);
 	}
 
-	move_folios_to_lru(&list);
+	move_folios_to_lru(&list, false);
 
 	walk = current->reclaim_state->mm_walk;
 	if (walk && walk->batched) {
-- 
2.34.1

