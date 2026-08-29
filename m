Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DFB334C1D
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787989713; cv=none; b=LCZgX4jSLIaq4VOu8IjKYD/r/2FiyqOiDXmCT53jDyX27VGIHkGKbHCzoC+2gtHhK//6zfHg1eGNv2FauCvUGjSmuJotOYtu0lJlg627d1p5/NdgNeAULSkeDJrSVhvQJXWkeRNlJ2kiGqx4HTTJydRoGGgwqP69pc4//sQRoDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787989713; c=relaxed/simple;
	bh=4MUIpHCzYF63DZ48ekKA4MO/TtB0skrAysUyZkikHr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CXao5Zgmxc0aJekUHUv/SQCZhixUAziWXrEq72aRloyh050T5DrUcVNgq+WEfuvf8SDcFNCw6Uw+YTAX6nLppYXn+GeT4tSvEg6HJf0B23z4artHNL81L15hZfZCZnr1rUZJv+UwMVuGlRKNMNmN1e8bl+8O3IaaEttLAHCjkp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFNoJVLU; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFNoJVLU"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1634094a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787989708; x=1788594508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zmu3XpqP05NRue2fBxvw9Ta0ua8JaiA5G6dY6hEI5XE=;
        b=dFNoJVLU3s8irrEoZXUwQzalMb3yImH5Yy92+lgherv3GkkJkm+0ckl0CqMFukW8EU
         hj1FX3soCiIqSbIHbJPxf36umnGkOtM4sRs9m+sJ+dW40cALdlYplzxXlvRMk+t4Fz+R
         YZqdEmMXxUs8Q6q6Wlb1He4qq339rLvASZ7F9Aafh465ci2dWp1izR0iH84gWHBCUEew
         OWrRd1D/4AB2YRrbjBZqVQD7FLfW4EFfg11Zz3IfiYt+VEZW9FMy6fIQGyigXHNq0FA8
         qUZcmjKl+gDKjfNbcy0XTtRxtUCJDS9Z7nCxqbgqZ+WaMp/Ssi4c0QzvuHIz79MB+qJH
         ZVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787989708; x=1788594508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zmu3XpqP05NRue2fBxvw9Ta0ua8JaiA5G6dY6hEI5XE=;
        b=nxsw5VkbyBn3mbYHPbDZeDsZQisKT/Vap6fTOYS7kOMOIzgJZV0aRks9QJYkPOFVqa
         /hVxezaluvixId8bxiBeS9on3LmyR5/Qe+9jKjATEze3zc14YWkJa3LBjQoTYv4KdOGx
         +ccewdTu5EOpog75lbgaSd4ZSsB48GEpaKM8nr77heIhd5HtRx0mRGUCsW/NEzJihT+8
         M5NiCcofh79oKvZOW13Gn/MkBAW7vBAKqr553ZliMl0KcIWqCqkz070wRlq7M4MCItkt
         qm4T/e58076MsOOhKOps3P5L2KkEa34CvsnJcpZMMLxEEmQmsas9u1L+nJ7nWq6Jcck1
         ZZtg==
X-Gm-Message-State: AFuF++l0TKdLf3w+xQ2sVROLJ0DxRXzqvPpa0d903u5Ako4nwmtOYOJb
	xdZG2Kh9sz3AfwBNwWeVmmKlcQdAbmVnHkWmDW/zg5BI5BQnXCNIpSD2
X-Gm-Gg: AYBFou0Ty62jYGlB05fjoP9JzUQ9Z88F0HXyHDU/NmkPP5woLQ+bIWWk8jAlpnCr8h+
	B6P3V/w9n8TmnKJZoWKMTQBtjDKbCe5ARHsbPvKHwZ81Tcorht2ODlIhvx5yM27seUxuoA5e+kh
	XDNiti569hCQE7oxfFALfQ0WH7J/KEQMpnSFZ1v2YUR9kJswAur0AhcCU0ncm00dmuD15/hzD7t
	2+ezmQuUffX4vPzMv6UH0oo4YtFr4SzLOj3H+DrAtOYnrX2CV7u/QCNFR4zjE494UP0VKAr44ES
	319HZCVopBKQQy2CQKjH+gtq7YHZi8UbMFoUUVbVMkyT9olJ93i54hbhmN6D5epqhBl6qSLAE2Y
	L01tgqQZ00UUOqi+01Bo+heV08RnyK++j1702oKawgl8hM5jT8Q96cqheF3I1sWl4fMnj+JJpmw
	3aNxeFcdhl4Kym/gXCk4XNdy0mFxDV85jWpf0stWZkSbDQt7v21jeBomB68QfaLamxy1aNAK30Y
	sFakJpvtvR+CM85BijDxEomhikXzVLlI3zwcKQ=
X-Received: by 2002:a17:90b:52c8:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-3989bd13874mr6809369a91.21.1787989707985;
        Sat, 29 Aug 2026 00:48:27 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm10702719a91.8.2026.08.29.00.48.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 00:48:27 -0700 (PDT)
From: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [RESEND RFC PATCH v2 11/13] mm/swap: bound synchronous discard during allocation
Date: Sat, 29 Aug 2026 15:48:20 +0800
Message-ID: <20260829-swap-pcp-priq-v2-resend-11-68d3d925578c@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
References: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

The old global per-CPU cluster cache made it difficult to select a
specific device before handling its pending discards.  Now that cluster
state is per-device, let an allocator issue discard for that device when
its free-cluster list is drained instead of waiting for a global fallback
scan.

Do not drain the entire discard list from one allocation.  The list is
also updated by freeing paths, so an unlocked non-empty check races with
those writers, and a full synchronous drain has no fixed latency bound
when other CPUs continue to enqueue clusters.

Factor out swap_discard_one_cluster().  Isolate one cluster under
si->lock, retain CLUSTER_FLAG_DISCARD while I/O is in flight, and return
it to the free list after the discard completes.  The background worker
continues looping until the list is empty, while an allocator handles at
most one cluster before retrying allocation.

This keeps the proactive per-device policy while giving each allocation
a fixed synchronous discard budget.

Link: https://lore.kernel.org/all/CAMgjq7CsYhEjvtN85XGkrONYAJxve7gG593TFeOGV-oax++kWA@mail.gmail.com/
Signed-off-by: Kairui Song <kasong@tencent.com>
Co-developed-by: Lian Wang (ProcessMission) <lianux.mm@gmail.com>
Signed-off-by: Lian Wang (ProcessMission) <lianux.mm@gmail.com>
Tested-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 mm/swapfile.c | 149 ++++++++++++++++++++++----------------------------
 1 file changed, 64 insertions(+), 85 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index e183dfad264e..cb27f2e246f0 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -528,6 +528,26 @@ static long swap_usage_in_pages(struct swap_info_struct *si)
 	return atomic_long_read(&si->inuse_pages) & SWAP_USAGE_COUNTER_MASK;
 }
 
+/*
+ * Serialize the allocation on single CPU or globally to avoid
+ * fragmentation and make the workflow easier to follow.
+ */
+static void swap_alloc_lock_device(struct swap_info_struct *si)
+{
+	if (si->flags & SWP_SOLIDSTATE)
+		local_lock(&si->percpu_cluster->lock);
+	else
+		spin_lock(&si->global_cluster->lock);
+}
+
+static void swap_alloc_unlock_device(struct swap_info_struct *si)
+{
+	if (si->flags & SWP_SOLIDSTATE)
+		local_unlock(&si->percpu_cluster->lock);
+	else
+		spin_unlock(&si->global_cluster->lock);
+}
+
 /* Reclaim the swap entry anyway if possible */
 #define TTRS_ANYWAY		0x1
 /*
@@ -914,10 +934,7 @@ swap_cluster_populate(struct swap_info_struct *si,
 	 * the potential recursive allocation is limited.
 	 */
 	spin_unlock(&ci->lock);
-	if (si->flags & SWP_SOLIDSTATE)
-		local_unlock(&si->percpu_cluster->lock);
-	else
-		spin_unlock(&si->global_cluster->lock);
+	swap_alloc_unlock_device(si);
 
 	ret = swap_cluster_alloc_table(ci, __GFP_HIGH | __GFP_NOMEMALLOC |
 					   GFP_KERNEL);
@@ -930,10 +947,7 @@ swap_cluster_populate(struct swap_info_struct *si,
 	 * could happen with ignoring the percpu cluster is fragmentation,
 	 * which is acceptable since this fallback and race is rare.
 	 */
-	if (si->flags & SWP_SOLIDSTATE)
-		local_lock(&si->percpu_cluster->lock);
-	else
-		spin_lock(&si->global_cluster->lock);
+	swap_alloc_lock_device(si);
 	spin_lock(&ci->lock);
 
 	if (ret) {
@@ -1023,44 +1037,40 @@ static struct swap_cluster_info *isolate_lock_cluster(
 }
 
 /*
- * Doing discard actually. After a cluster discard is finished, the cluster
- * will be added to free cluster list. Discard cluster is a bit special as
- * they don't participate in allocation or reclaim, so clusters marked as
- * CLUSTER_FLAG_DISCARD must remain off-list or on discard list.
+ * Discard one cluster. After the discard is finished, the cluster will be
+ * added to the free cluster list. Discard clusters are special because they
+ * don't participate in allocation or reclaim, so CLUSTER_FLAG_DISCARD must
+ * remain set while a cluster is either queued or being discarded.
  */
-static bool swap_do_scheduled_discard(struct swap_info_struct *si)
+static bool swap_discard_one_cluster(struct swap_info_struct *si)
 {
 	struct swap_cluster_info *ci;
-	bool ret = false;
 	unsigned int idx;
 
 	spin_lock(&si->lock);
-	while (!list_empty(&si->discard_clusters)) {
-		ci = list_first_entry(&si->discard_clusters, struct swap_cluster_info, list);
-		/*
-		 * Delete the cluster from list to prepare for discard, but keep
-		 * the CLUSTER_FLAG_DISCARD flag, there could be percpu_cluster
-		 * pointing to it, or ran into by relocate_cluster.
-		 */
-		list_del(&ci->list);
-		idx = cluster_index(si, ci);
+	if (list_empty(&si->discard_clusters)) {
 		spin_unlock(&si->lock);
-		discard_swap_cluster(si, idx * SWAPFILE_CLUSTER,
-				SWAPFILE_CLUSTER);
-
-		spin_lock(&ci->lock);
-		/*
-		 * Discard is done, clear its flags as it's off-list, then
-		 * return the cluster to allocation list.
-		 */
-		ci->flags = CLUSTER_FLAG_NONE;
-		__free_cluster(si, ci);
-		spin_unlock(&ci->lock);
-		ret = true;
-		spin_lock(&si->lock);
+		return false;
 	}
+
+	ci = list_first_entry(&si->discard_clusters,
+			      struct swap_cluster_info, list);
+	/*
+	 * Delete the cluster from the list, but keep CLUSTER_FLAG_DISCARD
+	 * set while the discard is in flight. A percpu cluster may still
+	 * point to it, or relocate_cluster() may encounter it.
+	 */
+	list_del(&ci->list);
+	idx = cluster_index(si, ci);
 	spin_unlock(&si->lock);
-	return ret;
+
+	discard_swap_cluster(si, idx * SWAPFILE_CLUSTER, SWAPFILE_CLUSTER);
+
+	spin_lock(&ci->lock);
+	ci->flags = CLUSTER_FLAG_NONE;
+	__free_cluster(si, ci);
+	spin_unlock(&ci->lock);
+	return true;
 }
 
 static void swap_discard_work(struct work_struct *work)
@@ -1069,7 +1079,8 @@ static void swap_discard_work(struct work_struct *work)
 
 	si = container_of(work, struct swap_info_struct, discard_work);
 
-	swap_do_scheduled_discard(si);
+	while (swap_discard_one_cluster(si))
+		cond_resched();
 }
 
 static void swap_users_ref_free(struct percpu_ref *ref)
@@ -1467,6 +1478,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 	struct swap_cluster_info *ci;
 	unsigned int order = likely(folio) ? folio_order(folio) : 0;
 	unsigned int offset = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
+	bool discarded = false;
 
 	/*
 	 * Swapfile is not block device so unable
@@ -1475,15 +1487,12 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 	if (order && !(si->flags & SWP_BLKDEV))
 		return 0;
 
-	if (si->flags & SWP_SOLIDSTATE) {
-		/* Fast path using per CPU cluster */
-		local_lock(&si->percpu_cluster->lock);
+restart:
+	swap_alloc_lock_device(si);
+	if (si->flags & SWP_SOLIDSTATE)
 		offset = __this_cpu_read(si->percpu_cluster->next[order]);
-	} else {
-		/* Serialize HDD SWAP allocation for each device. */
-		spin_lock(&si->global_cluster->lock);
+	else
 		offset = si->global_cluster->next[order];
-	}
 
 	if (offset != SWAP_ENTRY_INVALID) {
 		ci = swap_cluster_lock(si, offset);
@@ -1507,6 +1516,15 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 		found = alloc_swap_scan_list(si, &si->free_clusters, folio, false);
 		if (found)
 			goto done;
+
+		if (!discarded) {
+			swap_alloc_unlock_device(si);
+			if (swap_discard_one_cluster(si)) {
+				discarded = true;
+				goto restart;
+			}
+			swap_alloc_lock_device(si);
+		}
 	}
 
 	if (order < PMD_ORDER) {
@@ -1555,10 +1573,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 			goto done;
 	}
 done:
-	if (si->flags & SWP_SOLIDSTATE)
-		local_unlock(&si->percpu_cluster->lock);
-	else
-		spin_unlock(&si->global_cluster->lock);
+	swap_alloc_unlock_device(si);
 
 	return found;
 }
@@ -1751,36 +1766,6 @@ static int swap_alloc_entry(struct folio *folio)
 	return ret;
 }
 
-/*
- * Discard pending clusters in a synchronized way when under high pressure.
- * Return: true if any cluster is discarded.
- */
-static bool swap_sync_discard(void)
-{
-	bool ret = false;
-	struct swap_info_struct *si, *next;
-
-	percpu_down_read(&swapon_rwsem);
-start_over:
-	plist_for_each_entry_safe(si, next, &swap_active_head, list) {
-		percpu_up_read(&swapon_rwsem);
-		if (get_swap_device_info(si)) {
-			if (si->flags & SWP_PAGE_DISCARD)
-				ret = swap_do_scheduled_discard(si);
-			put_swap_device(si);
-		}
-		if (ret)
-			return true;
-
-		percpu_down_read(&swapon_rwsem);
-		if (plist_node_empty(&next->list))
-			goto start_over;
-	}
-	percpu_up_read(&swapon_rwsem);
-
-	return false;
-}
-
 static int swap_extend_table_alloc(struct swap_info_struct *si,
 				   struct swap_cluster_info *ci,
 				   unsigned int ci_off, gfp_t gfp)
@@ -2085,14 +2070,8 @@ int folio_alloc_swap(struct folio *folio)
 		}
 	}
 
-again:
 	ret = swap_alloc_entry(folio);
 
-	if (!order && unlikely(!folio_test_swapcache(folio))) {
-		if (swap_sync_discard())
-			goto again;
-	}
-
 	/* Need to call this even if allocation failed, for MEMCG_SWAP_FAIL. */
 	if (unlikely(mem_cgroup_try_charge_swap(folio)))
 		swap_cache_del_folio(folio);
-- 
2.55.0

