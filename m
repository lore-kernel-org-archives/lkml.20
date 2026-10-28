Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187392;
	b=agEmeIFDxP8weM7IudnK2PKJZ4y+e5PNu0FLw/uuPACama2DrBl+jCPiYi3LD+KN+q19
	 53tSMX1lxXsUex9RdNij8UTb+PdG7wo6GFGfS5BuhhA/YQcxr89UuLZfTVN/yJzk+YXzd
	 ndId0Cq/wMBTdeGmz8WyvMEwblwVgRFdExeKpaghLvzZSS7tRVvIYftlCq7fmVe1lTrH3
	 KfL49JN5xi7NzB2pR4i57i33J7d6H4dcLG7VsEnGI5ivqhlynCNHmkJisMEERD08j/PD/
	 op9c2TZEaAtsr/HMgenKbpQQq8fOam8OAuAWp7t6+d5W59C7ztpg8x76ilPK3HeypCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187392;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KJQ5MFQyAoYK4/IEHk3nRAEzowJdeSnGgVSxIBuPHzk=;
	b=SxAzqm0U8ewf7BEarykS5u0HtFEa7ZdkoOZKa7mtDATtPJvOcN+lcMJOLXHCFc3zv5WE
	 zosZswSpjBNfBZ673pnelSqy/Ywd/IZMyzBX0+RXeh0lbs3T0kIcNz6RmEsLIIuLrkOsj
	 Rl1JetMaVvUyoMOoEN+Jp9APJbb4H7tcMVJblzTJqAMUH5MZdgPjiPQIjr3KuYCD+3Pzx
	 gSPAINYOLUP5c5YGbj6fCF0d+vdAAy6VRxl1Vf2TJ62Qmga4ehF49jK+jpacsIYg4VzdD
	 IanekYUZW9YUpu83qQYv1dz4T/DTYPCyvgslN6Udj5ciAPMc2q3TSRVSp/cHE9s5AjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AQEJ1Oz9;
	arc=none smtp.remote-ip=91.218.175.89
Received: from mta0.migadu.com (out-89.mta0.migadu.com [91.218.175.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA671606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA671606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AQEJ1Oz9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kMCNGJJYpGz5x7c10ToMLdnciTX84LaiipX1h2aokB0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793187389; v=1; x=1793792189;
 b=AQEJ1Oz9qonlO9wnD+shAr0CZf+DRW2FBdnkeZQ/L6EDrrClmEze0FZ/gxAIb9L8FmrWN6mL
 +0fF1JPkhKLSYWtq2Nbpmjw+mP+wG3RQ1obOsne+2356nFX6wJTXaNF59siH1W1JuCKzjzkFUwn
 qle2y5Ay+dE2nlebMb82tqu0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0fbe3d682f9be5a6;
	Wed, 28 Oct 2026 11:36:29 +0000
X-Mizu-Trace-ID: 0fbe3d682f9be5a6
X-Migadu-Flow: FLOW_OUT
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH] mm/zswap: fix double decrement of the LRU node count on writeback
Date: Wed, 28 Oct 2026 19:36:19 +0800
Message-ID: <20261028113619.38752-1-kaitao.cheng@linux.dev>
X-Mailer: git-send-email 2.54.0
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

From: Kaitao Cheng <chengkaitao@kylinos.cn>

Successful writeback calls zswap_entry_free(), which removes the entry
from the LRU and decrements both the sublist and node item counts.
shrink_memcg_cb() then returns LRU_REMOVED_RETRY, causing the LRU walker
to decrement the node count again.

The affected call path before this change is:

  __list_lru_walk_one()
    shrink_memcg_cb()
      zswap_writeback_entry()
        zswap_entry_free()
          zswap_lru_del()
            list_lru_del()
              __list_lru_del()
                atomic_long_dec()  /* first node count decrement */
      return LRU_REMOVED_RETRY
    atomic_long_dec()              /* second node count decrement */

Add zswap_lru_del_nocnt() to remove the entry and update only the sublist
count, leaving node accounting to the walker. Split data cleanup into
__zswap_entry_free() so writeback can free the entry without performing
another LRU deletion. Other free paths retain their existing accounting.

Fixes: 5878303c5353 ("mm/zswap: fix race between lru writeback and swapoff")
Link: https://sashiko.dev/#/bug/linux-68d2ca49-23be-4504-9a75-b8526ec92388
Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 mm/zswap.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index ad01c691a263..d0c98daddf2e 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -719,6 +719,22 @@ static void zswap_lru_del(struct zswap_entry *entry)
 	rcu_read_unlock();
 }
 
+/* Like zswap_lru_del(), but does not decrement the node item count. */
+static void zswap_lru_del_nocnt(struct zswap_entry *entry)
+{
+	int nid = entry_to_nid(entry);
+	struct mem_cgroup *memcg;
+	struct list_lru_one *l;
+
+	rcu_read_lock();
+	memcg = obj_cgroup_memcg(entry->objcg);
+	l = list_lru_lock(&zswap_list_lru, nid, &memcg);
+	if (!list_empty(&entry->lru))
+		list_lru_isolate(l, &entry->lru);
+	list_lru_unlock(l);
+	rcu_read_unlock();
+}
+
 void zswap_lruvec_state_init(struct lruvec *lruvec)
 {
 	atomic_long_set(&lruvec->zswap_lruvec_state.nr_disk_swapins, 0);
@@ -781,11 +797,10 @@ static void zswap_entry_cache_free(struct zswap_entry *entry)
  * Carries out the common pattern of freeing an entry's zsmalloc allocation,
  * freeing the entry itself, and decrementing the number of stored pages.
  */
-static void zswap_entry_free(struct zswap_entry *entry)
+static void __zswap_entry_free(struct zswap_entry *entry)
 {
 	struct zswap_pool *pool = zswap_entry_pool(entry);
 
-	zswap_lru_del(entry);
 	if (!WARN_ON_ONCE(!pool)) {
 		zs_free(pool->zs_pool, entry->handle);
 		zswap_pool_put(pool);
@@ -800,6 +815,12 @@ static void zswap_entry_free(struct zswap_entry *entry)
 	atomic_long_dec(&zswap_stored_pages);
 }
 
+static void zswap_entry_free(struct zswap_entry *entry)
+{
+	zswap_lru_del(entry);
+	__zswap_entry_free(entry);
+}
+
 /*********************************
 * compressed storage functions
 **********************************/
@@ -1119,7 +1140,8 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	if (entry->objcg)
 		count_objcg_events(entry->objcg, ZSWPWB, 1);
 
-	zswap_entry_free(entry);
+	zswap_lru_del_nocnt(entry);
+	__zswap_entry_free(entry);
 
 	/* folio is up to date */
 	folio_mark_uptodate(folio);
-- 
2.53.0

