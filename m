Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216BB448391
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772451; cv=none; b=Of2jSYK1J/P1o7Mw0nePUfygYA/ycgzjIzU6A3PoW6bmuXVhK6u4VnasyablE4zT13DQPL4CjOaPStyoEKM9bVjpzuCxJ/BD3YmIqbrSbbH6lUjFq7gWU+HN4QejiOEG4AaU5dj15yB0C/TIg99MvjjcqQ3kJwIn3aPK8yXiMUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772451; c=relaxed/simple;
	bh=EuwCH11R92TYqx8qAsMflYyIBm9cROqmFL3OH0Qnt50=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OaJyKc1JMYgWANrPZa8FjVifZLsZqDDX5NcUegI0Oc4IQjwMjdTMCUhuTLCkYr3StEn0FIyrFGhsU59HHAxImVW2vFqXma/1N1Ls7rqPPuRHwRXL8uiX4e8TF3ZJueoU7a6nuZUPDbrXHscbItRnwOGCCSV08Fjp5/tv8GeZi4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hdhF32yfPzYQwPy
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:13:11 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id E711140577
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:14:00 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgCnZbNWgJ5qMElGBA--.7816S3;
	Mon, 07 Sep 2026 17:14:00 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kemeng Shi <shikemeng@huaweicloud.com>
Subject: [PATCH v3 1/4] mm, swap: Fix potential NULL dereference when trying a sleep table allocation
Date: Mon,  7 Sep 2026 17:13:53 +0800
Message-Id: <20260907091356.53026-2-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260907091356.53026-1-shikemeng@huaweicloud.com>
References: <20260907091356.53026-1-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgCnZbNWgJ5qMElGBA--.7816S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGF4fXFW7WF1fCFWfJF1fJFb_yoWrWFWDpF
	nYgF98Kr4rXr9xWrsxAw1Dt34rWw4ru34DGayxGw1293ZxXrWkWFWxAr9xZF98CF97Jryq
	gr1jgw17uF4vvwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBl14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r43Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbn2-7UUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

The root cause of this issue is because multi-tables are updated in non
atomic context. To be more specific, the issue could be triggerred as
following:

swap_alloc_fast         swap_cluster_populate()
                         /* Try a sleep allocation */
                         spin_unlock(&ci->lock);
                         swap_cluster_alloc_table()
                          rcu_assign_pointer(ci->table, table);

 ci = swap_cluster_lock(si, offset)
 cluster_is_usable(ci, order）
  if (!cluster_table_is_alloced(ci)) // ok
 alloc_swap_scan_cluster()
  cluster_scan_range()
   __swap_table_get()

                          /* free table when more table allocation fails */
                          ci->memcg_table = kzalloc_obj(*ci->memcg_table,
                                                        gfp);
                          if (!ci->memcg_table)
                           swap_cluster_free_table()
                            rcu_assign_pointer(ci->table, NULL);

    table = rcu_dereference_check(ci->table, lockdep_is_held(&ci->lock));
     atomic_long_read(&table[off]); // NULL dereference

Since memory order guarantee between ci->table, as well as between
ci->table and ci->zero_bitmap, fix the issue by making tables
visible at the end of swap_cluster_populate().

Current memory order guarantee is as following:
On write side:
rcu_assign_pointer(ci->table, table) will offer release to ensure
zero_bitmap and memcg_table visible before ci->table.

On read side:
folio_alloc_swap
 swap_alloc_fast/swap_alloc_slow
  /* ci->table: protected by cluster lock */
  swap_cluster_lock
  cluster_is_usable
  ...
  __swap_table_set
  ...
  swap_cluster_unlock

 mem_cgroup_try_charge_swap
  ...
  /* memcg_table: protected by cluster lock */
  swap_cluster_get_and_lock
  __swap_cgroup_set
  swap_cluster_unlock

swap_writeout
 swap_zeromap_folio_set
  /* zero_bitmap: protected by cluster lock */
  swap_cluster_get_and_lock
  __swap_table_set_zero
  swap_cluster_unlock

Fixes: b197d41462c2 ("mm/memcg, swap: store cgroup id in cluster table directly")
Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 mm/swapfile.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 53bf01d5f7f1..45b6154f85ad 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -418,6 +418,17 @@ static void swap_cluster_free_table_folio_rcu_cb(struct rcu_head *head)
 	folio_put(folio);
 }
 
+static void swap_cluster_free_count_table(struct swap_table *table)
+{
+	if (!SWP_TABLE_USE_PAGE) {
+		kmem_cache_free(swap_table_cachep, table);
+		return;
+	}
+
+	call_rcu(&(folio_page(virt_to_folio(table), 0)->rcu_head),
+		 swap_cluster_free_table_folio_rcu_cb);
+}
+
 static void swap_cluster_free_table(struct swap_cluster_info *ci)
 {
 	struct swap_table *table;
@@ -437,13 +448,7 @@ static void swap_cluster_free_table(struct swap_cluster_info *ci)
 		return;
 
 	rcu_assign_pointer(ci->table, NULL);
-	if (!SWP_TABLE_USE_PAGE) {
-		kmem_cache_free(swap_table_cachep, table);
-		return;
-	}
-
-	call_rcu(&(folio_page(virt_to_folio(table), 0)->rcu_head),
-		 swap_cluster_free_table_folio_rcu_cb);
+	swap_cluster_free_count_table(table);
 }
 
 static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
@@ -466,14 +471,12 @@ static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
 	if (!table)
 		return -ENOMEM;
 
-	rcu_assign_pointer(ci->table, table);
-
 #ifdef CONFIG_MEMCG
 	if (!mem_cgroup_disabled()) {
 		VM_WARN_ON_ONCE(ci->memcg_table);
 		ci->memcg_table = kzalloc_obj(*ci->memcg_table, gfp);
 		if (!ci->memcg_table) {
-			swap_cluster_free_table(ci);
+			swap_cluster_free_count_table(table);
 			return -ENOMEM;
 		}
 	}
@@ -484,9 +487,16 @@ static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
 	ci->zero_bitmap = bitmap_zalloc(SWAPFILE_CLUSTER, gfp);
 	if (!ci->zero_bitmap) {
 		swap_cluster_free_table(ci);
+		swap_cluster_free_count_table(table);
 		return -ENOMEM;
 	}
 #endif
+
+	/*
+	 * Make tables visible to cluster_is_usable() after everything is
+	 * ready.
+	 */
+	rcu_assign_pointer(ci->table, table);
 	return 0;
 }
 
-- 
2.36.1

