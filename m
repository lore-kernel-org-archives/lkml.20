Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667905;
	b=ZgbrtCzTS/OH796vuhZ2WgV0PJQffZEfaBhUjNyhFZUShShXc1ixWqV6VqO7Zi5v5pz9
	 dYUW4hGxBBMh7baY4lu4uuACkfbnBI9OQ6bLoHuoLkw+BXipyj2xMhCOTai9CC+uAyEpK
	 LGrAIlQlDds3tJpky0+kwg7nX270u+pjikgIAApEmsPyL5cd5YTXF2qBu2w3feGk5dCnw
	 9kEJEQs6lp85flcIxR+HDa8RPKzrrSLtbz7WYDHmx04YEUBvYyu5y9oOi2jY3FLFzfqlj
	 dYJrl7tUxSpIvLBGVJFPuLqkE8pXOZ4Tw0cdy3HY9ghT23l77M4VfEfhFjdf+1OY3xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d/KG6L5TmcYH8sgI9i0BskQU4jwPk6/DgXHqGyit9go=;
	b=GkeThLpFB6nHH4ba/jYApHo4KRyjFFhuKK/g8oNppP2O8nRN8zjAxv1m+M0nieufmK2G
	 vwr6/8o8DG+AOdU3u3WsIS/VQ7YeRyC+75r6OxYVRCZhBZkqV23rcdWJS2sL5Sjb0fto/
	 m4bU+nqWE9FPH8laSkXGbyG8d+bWxw3iexEwtDV1Ox4M2LoohkSOgaLzeluUuiEQZFJ0r
	 D2MU866Y/1i8hPv1x2CpFkH8BEt0QNFd4PKDss2eF4RYsK9k06LtKUcwFDIQ2lY4QZh/W
	 w5UOh/hQj8B5cqoN3bB9VlO/23OJ4gphFyRmGWWZ3pEMBT3DLAnNHIFXjx7/kyCyWeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bu2qnJKf;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C375F606A33F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C375F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bu2qnJKf
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so997683b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667904; x=1795272704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d/KG6L5TmcYH8sgI9i0BskQU4jwPk6/DgXHqGyit9go=;
        b=Bu2qnJKfcUWDYVKL8198+kc68BelozhlGclUlRJAobTp6G6gG74Ro8LKiAXaqd92f7
         hPXLx0WBpn8/iPsJLRKETXW/VktEcjnWgOdpvSB5bXMJuBsGpK50EkL0CLXTKQpscTZf
         YHBdPQnI1AIk7Y0U2eJAMqyvErscmUliHilgeBIHRWcABnCf0whMGwP5B1Gt3neiMb2v
         9OQ1KP9eMH0Uqt7ou7iGbD1SwK0IR0b5g3O05khZ8px01LD0bVjEjTgtVGy2R9rvT2PA
         KWHkUz81ox6eNrO0f1tgzW7C6sVo8bfC57mKxu4vo4jAddZN9XU5/V+nlhyPlYBenzLE
         JgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667904; x=1795272704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d/KG6L5TmcYH8sgI9i0BskQU4jwPk6/DgXHqGyit9go=;
        b=aq9ZNiRE0+xoxj8YBM1hRi05TeT+SuoSDv6XAijz22hNrnlyeREQ9N17QjlDzWIM/z
         +xTyD+kUADS7VOoB2OSRP8iTqQsnqzQLsI6NW74t/gIcJAxDQWEQi8RBv9aVy/bzHyYT
         nWgbIU0AdE5kslp+q8ZLWA7FzKjqVh+ZLvbWuo4Z2kh37VcYLshVDDCeUBVai9tKBcDx
         Xc6xQ3mzlKohBUele4NLA9b0IYkLuptRIxM/s2AA1+YAJK/LELkGYxDXKbey4TRVpRDd
         yLbuCV1ozFiFUXWSZ6NJqnUtH6B3uKuMy77a9pUaiTRZFbkzDqAfb4AUNII7dHjTnrqr
         XtOw==
X-Gm-Message-State: APuU4Z8TzatlVW5on8sudCspP4m5+KDws1qghauRNzD7Dl/GDTFgvlkf
	axUNLytFf5F1pe0gDQRZZM8oLQ8k9/01E2WmjenQQ271SfrzlkmysA5p
X-Gm-Gg: AYBFou0vw/QISAZBWMIFSFlIbFHSsHVcY+5QNEjAx3w5GCnpM5+fTIZ07p6rDqtA75K
	AYYHzKEVFVSxIKpR8+2B8qFzS+Nw5DR0DGNqUb9CUg72i8R5nnZDIyh4Xl0GaerYwlSwaW7sek3
	WBFi82nXZrK3mHfIl0A2uw4Nq9jI5n7HLiJIlH6klmMB2LcAEEBcFVkXp0et09cFd7NX2oEekUF
	OtYE7YvbaZj4+8Ao87JjOqqf2mo2Uy1GZgWG042IkZFbTk7IbnXw4wKvkCr4CcWDRASED+m4KmJ
	Da5cYna5PySZQhpwMv6tZB7wHpMfVFhrc3FA8pRAGWQuEjR/dSp8D4rXt8rLf6DnjtAXd2yXyfw
	J/XpsHNT5rGxbynuQm80BRD8QwoUXp+mNnomYAlaz/NT09sh8suGz5xalMiHBhG04+AEGYdcmSv
	iTG8RHQRottnLe7BGJkgPMl2+mD8yimNPXAkdjjlnQd7jW5HJHPY9f5iU+LsGUdHQZ4RonO4dZl
	S++xEuvRC3XB38W8IEeAqZ8UH8FvRQ/m1V5xb8bBYTrU1jQWk6HHEm9/LZcAmTQFVxLnmD7W2MD
	XpQRnnFegapm6fhMWULSyzveYUvZO31goDflBTBFAQV578k1NFvdVUIEWFaQ53OBXnu0rQ==
X-Received: by 2002:a05:6a21:6e01:b0:3de:79fe:13f with SMTP id adf61e73a8af0-3f7a7bc1ad1mr5150361637.38.1794667903897;
        Sat, 14 Nov 2026 06:51:43 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1873531sm2424369a12.10.2026.11.14.06.51.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:51:43 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
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
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v4 12/18] mm/swap: bound synchronous discard outside the allocation reader
Date: Sat, 14 Nov 2026 22:51:24 +0800
Message-ID: <19155551d5c520add74b25f8d50d22fb890e3fbb.1794666741.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794666741.git.lianux.mm@gmail.com>
References: <cover.1794666741.git.lianux.mm@gmail.com>
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

From: Kairui Song <kasong@tencent.com>

The synchronous discard fallback drains a list that freeing paths can
keep replenishing. Limit each foreground step to one cluster, retaining
CLUSTER_FLAG_DISCARD while I/O is in flight and returning the cluster to
the free list only after completion. The background worker continues to
process the remaining list.

Keep synchronous discard outside the topology reader. Enter this fallback
only after a complete normal order-0 allocation walk fails. A higher-
priority device with only pending discard work does not force synchronous
I/O if a lower-priority device satisfies that walk.

Find a writable discard-capable device under the reader and take its live
reference, then release the reader before issuing I/O. Drop the reference
after completion and restart allocation with a fresh cursor, so a
concurrent topology change cannot leave stale ring state. This also sees
discard work produced by the preceding reclaim scans.

Track the swap types already processed during this folio allocation and
check each candidate at most once per fallback search. An empty check
does not consume the I/O budget. Each swap type can complete at most one
synchronous cluster discard, bounding successful retries by MAX_SWAPFILES
even if membership changes. Do not keep discarding until this task wins
a free cluster from a peer.

Large folios retain the existing same-priority retry and split boundary;
their reader-held cluster walk does not issue synchronous discard. The
budget bounds work count, not device I/O completion latency.

Link: https://lore.kernel.org/all/CAMgjq7CsYhEjvtN85XGkrONYAJxve7gG593TFeOGV-oax++kWA@mail.gmail.com/
Signed-off-by: Kairui Song <kasong@tencent.com>
Co-developed-by: Lian Wang <lianux.mm@gmail.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 175 ++++++++++++++++++++++++++++----------------------
 1 file changed, 100 insertions(+), 75 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 5c5e449e9da3..6b2dbaf33cb6 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -6,6 +6,7 @@
  *  Swap reorganised 29.12.95, Stephen Tweedie
  */
 
+#include <linux/bitmap.h>
 #include <linux/blkdev.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
@@ -585,6 +586,26 @@ static long swap_usage_in_pages(struct swap_info_struct *si)
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
@@ -916,12 +937,8 @@ static int swap_cluster_alloc_table(struct swap_info_struct *si,
 
 lock:
 	if (!locked) {
-		if (si) {
-			if (si->flags & SWP_SOLIDSTATE)
-				local_lock(&si->percpu_cluster->lock);
-			else
-				spin_lock(&si->global_cluster->lock);
-		}
+		if (si)
+			swap_alloc_lock_device(si);
 		spin_lock(&ci->lock);
 	}
 	lockdep_assert_held(&ci->lock);
@@ -1024,10 +1041,7 @@ swap_cluster_populate(struct swap_info_struct *si,
 	 * which could give allocator hooks and failure cleanup reserve access.
 	 */
 	spin_unlock(&ci->lock);
-	if (si->flags & SWP_SOLIDSTATE)
-		local_unlock(&si->percpu_cluster->lock);
-	else
-		spin_unlock(&si->global_cluster->lock);
+	swap_alloc_unlock_device(si);
 
 	gfp = (GFP_KERNEL | __GFP_HIGH | __GFP_NOMEMALLOC) &
 		~__GFP_DIRECT_RECLAIM;
@@ -1134,44 +1148,40 @@ static struct swap_cluster_info *isolate_lock_cluster(
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
@@ -1180,7 +1190,8 @@ static void swap_discard_work(struct work_struct *work)
 
 	si = container_of(work, struct swap_info_struct, discard_work);
 
-	swap_do_scheduled_discard(si);
+	while (swap_discard_one_cluster(si))
+		cond_resched();
 }
 
 static void swap_users_ref_free(struct percpu_ref *ref)
@@ -1609,15 +1620,11 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 	if (order && !(si->flags & SWP_BLKDEV))
 		return 0;
 
-	if (si->flags & SWP_SOLIDSTATE) {
-		/* Fast path using per CPU cluster */
-		local_lock(&si->percpu_cluster->lock);
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
@@ -1685,10 +1692,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
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
@@ -1883,33 +1887,50 @@ static int swap_alloc_entry(struct folio *folio)
 }
 
 /*
- * Discard pending clusters in a synchronized way when under high pressure.
- * Return: true if any cluster is discarded.
+ * Discard outside the topology reader, holding only the selected device's
+ * live reference across I/O. Each successful retry starts a fresh queue walk.
  */
-static bool swap_sync_discard(void)
+static bool swap_discard_for_alloc(unsigned long *discarded)
 {
-	bool ret = false;
-	struct swap_info_struct *si, *next;
+	DECLARE_BITMAP(checked, MAX_SWAPFILES) = {};
+	struct swap_info_struct *si, *candidate;
+	unsigned int i, j;
+	bool done;
+	int type;
 
-	percpu_down_read(&swapon_rwsem);
-start_over:
-	plist_for_each_entry_safe(si, next, &swap_active_head, list) {
-		percpu_up_read(&swapon_rwsem);
-		if (get_swap_device_info(si)) {
-			if (si->flags & SWP_PAGE_DISCARD)
-				ret = swap_do_scheduled_discard(si);
-			put_swap_device(si);
+	for (;;) {
+		candidate = NULL;
+		percpu_down_read(&swapon_rwsem);
+		for (i = 0; i < swap_queue_len && !candidate; i++) {
+			struct swap_prio_ring *ring = swap_queue[i];
+
+			for (j = 0; j < ring->size; j++) {
+				si = swap_device_unmask_ptr(READ_ONCE(ring->dev[j]));
+				type = si->type;
+				if (test_bit(type, discarded) || test_bit(type, checked))
+					continue;
+				__set_bit(type, checked);
+				if ((READ_ONCE(si->flags) & (SWP_WRITEOK | SWP_PAGE_DISCARD)) !=
+				    (SWP_WRITEOK | SWP_PAGE_DISCARD))
+					continue;
+				if (get_swap_device_info(si)) {
+					candidate = si;
+					break;
+				}
+			}
 		}
-		if (ret)
-			return true;
+		percpu_up_read(&swapon_rwsem);
+		if (!candidate)
+			return false;
 
-		percpu_down_read(&swapon_rwsem);
-		if (plist_node_empty(&next->list))
-			goto start_over;
+		type = candidate->type;
+		done = swap_discard_one_cluster(candidate);
+		if (done)
+			__set_bit(type, discarded);
+		put_swap_device(candidate);
+		if (done)
+			return true;
 	}
-	percpu_up_read(&swapon_rwsem);
-
-	return false;
 }
 
 static int swap_extend_table_alloc(struct swap_info_struct *si,
@@ -2213,12 +2234,16 @@ int folio_alloc_swap(struct folio *folio)
 		}
 	}
 
-again:
 	swap_alloc_entry(folio);
 
 	if (!order && unlikely(!folio_test_swapcache(folio))) {
-		if (swap_sync_discard())
-			goto again;
+		DECLARE_BITMAP(discarded, MAX_SWAPFILES) = {};
+
+		while (swap_discard_for_alloc(discarded)) {
+			swap_alloc_entry(folio);
+			if (folio_test_swapcache(folio))
+				break;
+		}
 	}
 
 	/* Need to call this even if allocation failed, for MEMCG_SWAP_FAIL. */
