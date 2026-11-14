Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667840;
	b=CUKGfVA6si0ay2y28vPYWmjPBpUnksQCJS1IgWougkBrV2gIwWjFzBgbSZVi38+DVNWA
	 w0M5qL43E+s2jwgavB5jH932oCISJuztnzf7PospgxkNMIAKvpCoCYXZMrCJ7rjtgT8Kw
	 u11o7gqFwT/kE8C591p8OH0ZQs74cdqBNes0rFcvmqr07+Ootz5lV5ZnJ1odRFWjxhdIk
	 b7Y7gkq8djRTmCPGaqCkUODgJeDNAXbNznMIt6dAPD0MnE9MF9pxanCoRbHVMC41sE6Uz
	 7HWg2hsFD0uVRhvCalTUOySTaKSs1Idz4ITcLWhmHdkVycgQKIehepxB9LFSQqIPlyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=at5RjVFnb0nLG0yNWBL2prGnwvhHWrO+XxTNCCu9nPs=;
	b=yg/3wxlEcw+cBJx3if1uNX3ocD1/DeYtV85jR/VHeAo+Jh5STz+beRGwDTf6uGV2sd1e
	 RICBeyhWyDOibci3U1JCkg0MkfZMUHD77Vx4COyx1vo4NnMbE+NLQ9l+52EdJYD560w2F
	 XtfAWUjqtyH1rbHdxPP9bTMvytVLD2+0KzXqmwZYvc62Yv/t3t8y3NJiC6sadRP+QutNq
	 BGCTOZf4P03+HXvoOwU+U5uRx3Ch1J/5FE8UXZquvBKVR3esOSyt6xbm59MY73F3QlzYy
	 lPTMR+UlNM0yDhj6bbJadtdy69AeuIzV1x+6rGOagEyujutujmQclBe0DQIEotr4Dxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iephRNfw;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0770C606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0770C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iephRNfw
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1026107b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667839; x=1795272639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=at5RjVFnb0nLG0yNWBL2prGnwvhHWrO+XxTNCCu9nPs=;
        b=iephRNfwv84kgSaaVbebjIkekw0AFXkaDkXwIsvk47yP+hg+U3sIiGQ3lV5A/5RX3Z
         onTV11Xc08+ohdwHHQE/8d8fRxB+4d523ga9k5G/oZDJ55w/0bTMaofXXipixhtVFPZt
         2aGvc8iouR6O8czsthr8oV1LpCDclBB5bLwti2kL0BBE/naUt7vbxmUVKDKbxYoA5BWo
         zzwKrYYT8TmojTE2F4PWL/UhF0Lo52Dz50SvMFlGDRdc7xCm3Sz8KaQsw/z7g7KYEjHk
         28NB/T6BIWSh7a853uM/qPgoYYwQrF+fwW8SZT7jOO+s3dHbKpoiJCmDKKzfpYzqpFvM
         LCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667839; x=1795272639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=at5RjVFnb0nLG0yNWBL2prGnwvhHWrO+XxTNCCu9nPs=;
        b=BQ09LeRrt4OU0GJBWrPR0igisFgsgIxxsL3Kw2E9Cr4riIXUmFqzSo/+E9MT14Q/lu
         W2Mjnpq6bdhl7UOS0L+vD6q+ipohrz/I2osC5SMg7O65aouzFI9I+s7zc9IiDOC/XjFV
         oQRMZPi5GycPcEj+UyraBWDqoZJi7uj+QVlhXFrsQnWJqOwWIve7Qp4jo3g/IeRFEXED
         Mq0u+zYTQ5RSSqgixUJ4Fn2MCYDjQ7Nz5+FHCP2osoZd0c2N0q8Hs+NXFkyP0MKgGMCR
         Sllj5sXdDsT/WnqfJgb8zu3teMQsLifWMjNG95RG/V2ixTcb2IyT8iB6M7ER/FfzwT4y
         xd9A==
X-Gm-Message-State: APuU4Z/ere99vgz6dYQPlwxnEzq7RbvXnXLk9n0MWU5UQgzdQW42TAeG
	jdWCybUzp/q9N2+8BtnHzD3qOoYOKVrzQSjbBhgZr3L0TFZWdFsrVZDo
X-Gm-Gg: AYBFou16X3nN2AxpAcqYKPh0KWxJoFWPkbwx/9XhRQ9s8VQ00fSV7Tkbxt8d4Igwe4e
	wU+W3wY9QO7aeSJQgkYg9ZWm3JemNnAQ91A7TwEc9ap9owtwt8rwPVs1cnq2pAFvHPzHunRu0kd
	nUzBWLjQATaXaOBWBlVKUqijQpFiP+oFrKwdlAqZ3+w2EmUxnOAPVnlznnWAJhKC7cctHB1YoD6
	AQyJtXAOsxjRjV3quqoX0eEUsTJwGjoa5x3Li+qfOOsuBT4kV9PfGEBUp8yOX5Gd/O7k4cgV1OP
	UHwEQdE9CpAsg62gjURwyym2afsBzuWB9T6sujcDUaKNGaDAf2jdlEOeCwvsiG1ZGmDdk7GfwCl
	mvUW51lQYbngDzsD5qo35sxkGEzlWDWeI+qCDQlOco06wKWq9C/wLHCp0DRIAnKc6khvaCrZFe6
	ryQGNbFHRJDl94drbizpPZGcSbrpDbXyS8vO7jRyGfDpGN7QsxTpzrpITfRp0FSQ9g6REl1QTN+
	89zduA7HUYvc/gwe8yCGVF43oEqcdsmxvRSGLEcszVK0b02gdLH3b9RR05e4lmSpIa9iAgN9WjW
	3vGWAoIS9ZZX2pSTERlZgaeuEyYWFRIM4wMQnITdvGbiHk6vEwbcYiwdVTLQLHXhCp96qP+3Dmx
	FyyiWlsvCQuCwnw==
X-Received: by 2002:a05:6a00:1783:b0:8ac:3a71:38a6 with SMTP id d2e1a72fcca58-8beb76369e3mr5821665b3a.52.1794667839241;
        Sat, 14 Nov 2026 06:50:39 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1e5ac38sm2159239b3a.31.2026.11.14.06.50.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:50:38 -0800 (PST)
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
Subject: [RFC PATCH v4 08/18] mm/swap: change back to use each swap device's percpu cluster
Date: Sat, 14 Nov 2026 22:50:26 +0800
Message-ID: <f9cb4b2c57360c07bb1ff0d305e089635cb7e56e.1794666741.git.lianux.mm@gmail.com>
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

From: Youngjun Park <youngjun.park@lge.com>

This reverts commit 1b7e90020eb7 ("mm, swap: use percpu cluster as
allocation fast path").

The global percpu cluster causes several issues:

1) It prevents efficient swap allocation for users that do not want
   the default swap device policy.  Because the cluster cache sits
   above device selection, users that need a different policy must
   bypass or replace the cache. This complicates incoming ideas like
   swap tiering.

2) It can bypass a caller's preferred device policy. Consider a future
   policy with per-memcg device restrictions: memcg1 can access devices
   A and B, where A has higher priority; memcg2 can only access B. Memcg2
   can write the global percpu cluster with device B, then memcg1 takes B
   in the fast path even though higher-priority device A is not exhausted.

3) The fast-path / slow-path design bundled with the global per-CPU
   cache is problematic: only the fast path uses the global cache,
   and the slow path is forced to rotate the allocation list.  This
   complicates consumers like discard.

Revert to per-device percpu clusters first.  A later patch will
introduce new infrastructure for a high-performance global
allocation path.

Suggested-by: Kairui Song <kasong@tencent.com>
Co-developed-by: Baoquan He <bhe@redhat.com>
Signed-off-by: Baoquan He <bhe@redhat.com>
Signed-off-by: Youngjun Park <youngjun.park@lge.com>
Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 include/linux/swap.h |  13 +++-
 mm/swapfile.c        | 170 ++++++++++++++-----------------------------
 2 files changed, 63 insertions(+), 120 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 717387e16a2d..c8a5684b2f4f 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -241,10 +241,17 @@ enum {
 #endif
 
 /*
- * We keep using same cluster for rotational device so IO will be sequential.
- * The purpose is to optimize SWAP throughput on these device.
+ * We assign a cluster to each CPU, so each CPU can allocate swap entry from
+ * its own cluster and swapout sequentially. The purpose is to optimize swapout
+ * throughput.
  */
+struct percpu_cluster {
+	local_lock_t lock; /* Protect the percpu_cluster above */
+	unsigned int next[SWAP_NR_ORDERS]; /* Likely next allocation offset */
+};
+
 struct swap_sequential_cluster {
+	spinlock_t lock; /* Serialize usage of global cluster */
 	unsigned int next[SWAP_NR_ORDERS]; /* Likely next allocation offset */
 };
 
@@ -267,8 +274,8 @@ struct swap_info_struct {
 					/* list of cluster that are fragmented or contented */
 	unsigned int pages;		/* total of usable pages of swap */
 	atomic_long_t inuse_pages;	/* number of those currently in use */
+	struct percpu_cluster	__percpu *percpu_cluster; /* per cpu's swap location */
 	struct swap_sequential_cluster *global_cluster; /* Use one global cluster for rotating device */
-	spinlock_t global_cluster_lock;	/* Serialize usage of global cluster */
 	struct rb_root swap_extent_root;/* root of the swap extent rbtree */
 	struct block_device *bdev;	/* swap device or bdev of swap file */
 	struct file *swap_file;		/* seldom referenced */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index aa020f2706b4..c46b43414bf4 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -145,18 +145,6 @@ static atomic_t proc_poll_event = ATOMIC_INIT(0);
 
 atomic_t nr_rotate_swap = ATOMIC_INIT(0);
 
-struct percpu_swap_cluster {
-	struct swap_info_struct *si[SWAP_NR_ORDERS];
-	unsigned long offset[SWAP_NR_ORDERS];
-	local_lock_t lock;
-};
-
-static DEFINE_PER_CPU(struct percpu_swap_cluster, percpu_swap_cluster) = {
-	.si = { NULL },
-	.offset = { SWAP_ENTRY_INVALID },
-	.lock = INIT_LOCAL_LOCK(),
-};
-
 /* May return NULL on invalid type, caller must check for NULL return */
 static struct swap_info_struct *swap_type_to_info(int type)
 {
@@ -523,9 +511,10 @@ static int swap_cluster_alloc_table(struct swap_info_struct *si,
 lock:
 	if (!locked) {
 		if (si) {
-			local_lock(&percpu_swap_cluster.lock);
-			if (!(si->flags & SWP_SOLIDSTATE))
-				spin_lock(&si->global_cluster_lock);
+			if (si->flags & SWP_SOLIDSTATE)
+				local_lock(&si->percpu_cluster->lock);
+			else
+				spin_lock(&si->global_cluster->lock);
 		}
 		spin_lock(&ci->lock);
 	}
@@ -610,9 +599,10 @@ swap_cluster_populate(struct swap_info_struct *si,
 	 * Only cluster isolation from the allocator does table allocation.
 	 * Swap allocator uses percpu clusters and holds the local lock.
 	 */
-	lockdep_assert_held(&this_cpu_ptr(&percpu_swap_cluster)->lock);
-	if (!(si->flags & SWP_SOLIDSTATE))
-		lockdep_assert_held(&si->global_cluster_lock);
+	if (si->flags & SWP_SOLIDSTATE)
+		lockdep_assert_held(this_cpu_ptr(&si->percpu_cluster->lock));
+	else
+		lockdep_assert_held(&si->global_cluster->lock);
 	lockdep_assert_held(&ci->lock);
 
 	if (!swap_cluster_alloc_table(si, ci, __GFP_HIGH | __GFP_NOMEMALLOC |
@@ -625,9 +615,10 @@ swap_cluster_populate(struct swap_info_struct *si,
 	 * the potential recursive allocation is limited.
 	 */
 	spin_unlock(&ci->lock);
-	if (!(si->flags & SWP_SOLIDSTATE))
-		spin_unlock(&si->global_cluster_lock);
-	local_unlock(&percpu_swap_cluster.lock);
+	if (si->flags & SWP_SOLIDSTATE)
+		local_unlock(&si->percpu_cluster->lock);
+	else
+		spin_unlock(&si->global_cluster->lock);
 
 	ret = swap_cluster_alloc_table(si, ci, __GFP_HIGH | __GFP_NOMEMALLOC |
 					     GFP_KERNEL, false);
@@ -749,7 +740,7 @@ static bool swap_do_scheduled_discard(struct swap_info_struct *si)
 		ci = list_first_entry(&si->discard_clusters, struct swap_cluster_info, list);
 		/*
 		 * Delete the cluster from list to prepare for discard, but keep
-		 * the CLUSTER_FLAG_DISCARD flag, percpu_swap_cluster could be
+		 * the CLUSTER_FLAG_DISCARD flag, there could be percpu_cluster
 		 * pointing to it, or ran into by relocate_cluster.
 		 */
 		list_del(&ci->list);
@@ -1104,12 +1095,10 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 out:
 	relocate_cluster(si, ci);
 	swap_cluster_unlock(ci);
-	if (si->flags & SWP_SOLIDSTATE) {
-		this_cpu_write(percpu_swap_cluster.offset[order], next);
-		this_cpu_write(percpu_swap_cluster.si[order], si);
-	} else {
+	if (si->flags & SWP_SOLIDSTATE)
+		this_cpu_write(si->percpu_cluster->next[order], next);
+	else
 		si->global_cluster->next[order] = next;
-	}
 	return found;
 }
 
@@ -1210,13 +1199,17 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 	if (order && !(si->flags & SWP_BLKDEV))
 		return 0;
 
-	if (!(si->flags & SWP_SOLIDSTATE)) {
+	if (si->flags & SWP_SOLIDSTATE) {
+		/* Fast path using per CPU cluster */
+		local_lock(&si->percpu_cluster->lock);
+		offset = __this_cpu_read(si->percpu_cluster->next[order]);
+	} else {
 		/* Serialize HDD SWAP allocation for each device. */
-		spin_lock(&si->global_cluster_lock);
+		spin_lock(&si->global_cluster->lock);
 		offset = si->global_cluster->next[order];
-		if (offset == SWAP_ENTRY_INVALID)
-			goto new_cluster;
+	}
 
+	if (offset != SWAP_ENTRY_INVALID) {
 		ci = swap_cluster_lock(si, offset);
 		/* Cluster could have been used by another order */
 		if (cluster_is_usable(ci, order)) {
@@ -1230,7 +1223,6 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 			goto done;
 	}
 
-new_cluster:
 	if (swap_prefer_free_cluster(si)) {
 		found = alloc_swap_scan_list(si, &si->free_clusters, folio, false);
 		if (found)
@@ -1283,8 +1275,10 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 			goto done;
 	}
 done:
-	if (!(si->flags & SWP_SOLIDSTATE))
-		spin_unlock(&si->global_cluster_lock);
+	if (si->flags & SWP_SOLIDSTATE)
+		local_unlock(&si->percpu_cluster->lock);
+	else
+		spin_unlock(&si->global_cluster->lock);
 
 	return found;
 }
@@ -1440,41 +1434,8 @@ static bool get_swap_device_info(struct swap_info_struct *si)
 	return true;
 }
 
-/*
- * Fast path try to get swap entries with specified order from current
- * CPU's swap entry pool (a cluster).
- */
-static bool swap_alloc_fast(struct folio *folio)
-{
-	unsigned int order = folio_order(folio);
-	struct swap_cluster_info *ci;
-	struct swap_info_struct *si;
-	unsigned int offset;
-
-	/*
-	 * Once allocated, swap_info_struct will never be completely freed,
-	 * so checking it's liveness by get_swap_device_info is enough.
-	 */
-	si = this_cpu_read(percpu_swap_cluster.si[order]);
-	offset = this_cpu_read(percpu_swap_cluster.offset[order]);
-	if (!si || !offset || !get_swap_device_info(si))
-		return false;
-
-	ci = swap_cluster_lock(si, offset);
-	if (cluster_is_usable(ci, order)) {
-		if (cluster_is_empty(ci))
-			offset = cluster_offset(si, ci);
-		alloc_swap_scan_cluster(si, ci, folio, offset);
-	} else {
-		swap_cluster_unlock(ci);
-	}
-
-	put_swap_device(si);
-	return folio_test_swapcache(folio);
-}
-
 /* Rotate the device and switch to a new cluster */
-static void swap_alloc_slow(struct folio *folio)
+static void swap_alloc_entry(struct folio *folio)
 {
 	struct swap_info_struct *si, *next;
 
@@ -1842,10 +1803,7 @@ int folio_alloc_swap(struct folio *folio)
 	}
 
 again:
-	local_lock(&percpu_swap_cluster.lock);
-	if (!swap_alloc_fast(folio))
-		swap_alloc_slow(folio);
-	local_unlock(&percpu_swap_cluster.lock);
+	swap_alloc_entry(folio);
 
 	if (!order && unlikely(!folio_test_swapcache(folio))) {
 		if (swap_sync_discard())
@@ -2251,31 +2209,14 @@ void swap_put_entries_direct(swp_entry_t entry, int nr)
  */
 swp_entry_t swap_alloc_hibernation_slot(int type)
 {
-	struct swap_info_struct *pcp_si, *si = swap_type_to_info(type);
-	unsigned long pcp_offset, offset = SWAP_ENTRY_INVALID;
-	struct swap_cluster_info *ci;
+	struct swap_info_struct *si = swap_type_to_info(type);
+	unsigned long offset = SWAP_ENTRY_INVALID;
 	swp_entry_t entry = {0};
 
 	if (!si)
 		goto fail;
 
-	/*
-	 * Try the local cluster first if it matches the device. If
-	 * not, try grab a new cluster and override local cluster.
-	 */
-	local_lock(&percpu_swap_cluster.lock);
-	pcp_si = this_cpu_read(percpu_swap_cluster.si[0]);
-	pcp_offset = this_cpu_read(percpu_swap_cluster.offset[0]);
-	if (pcp_si == si && pcp_offset) {
-		ci = swap_cluster_lock(si, pcp_offset);
-		if (cluster_is_usable(ci, 0))
-			offset = alloc_swap_scan_cluster(si, ci, NULL, pcp_offset);
-		else
-			swap_cluster_unlock(ci);
-	}
-	if (!offset)
-		offset = cluster_alloc_swap_entry(si, NULL);
-	local_unlock(&percpu_swap_cluster.lock);
+	offset = cluster_alloc_swap_entry(si, NULL);
 	if (offset)
 		entry = swp_entry(si->type, offset);
 
@@ -3253,27 +3194,6 @@ static void free_swap_cluster_info(struct swap_cluster_info *cluster_info,
 	kvfree(cluster_info);
 }
 
-/*
- * Called after swap device's reference count is dead, so
- * neither scan nor allocation will use it.
- */
-static void flush_percpu_swap_cluster(struct swap_info_struct *si)
-{
-	int cpu, i;
-	struct swap_info_struct **pcp_si;
-
-	for_each_possible_cpu(cpu) {
-		pcp_si = per_cpu_ptr(percpu_swap_cluster.si, cpu);
-		/*
-		 * Invalidate the percpu swap cluster cache, si->users
-		 * is dead, so no new user will point to it, just flush
-		 * any existing user.
-		 */
-		for (i = 0; i < SWAP_NR_ORDERS; i++)
-			cmpxchg(&pcp_si[i], si, NULL);
-	}
-}
-
 SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 {
 	struct swap_info_struct *p = NULL;
@@ -3325,7 +3245,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 
 	flush_work(&p->discard_work);
 	flush_work(&p->reclaim_work);
-	flush_percpu_swap_cluster(p);
 
 	destroy_swap_extents(p, p->swap_file);
 
@@ -3346,6 +3265,8 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	percpu_up_write(&swapon_rwsem);
 	arch_swap_invalidate_area(p->type);
 	zswap_swapoff(p->type);
+	free_percpu(p->percpu_cluster);
+	p->percpu_cluster = NULL;
 	kfree(p->global_cluster);
 	p->global_cluster = NULL;
 	free_swap_cluster_info(cluster_info, maxpages);
@@ -3694,7 +3615,7 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 {
 	unsigned long nr_clusters = DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
 	struct swap_cluster_info *cluster_info;
-	int err = -ENOMEM;
+	int cpu, err = -ENOMEM;
 	unsigned long i;
 
 	cluster_info = kvzalloc_objs(*cluster_info, nr_clusters);
@@ -3704,13 +3625,26 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 	for (i = 0; i < nr_clusters; i++)
 		spin_lock_init(&cluster_info[i].lock);
 
-	if (!(si->flags & SWP_SOLIDSTATE)) {
+	if (si->flags & SWP_SOLIDSTATE) {
+		si->percpu_cluster = alloc_percpu(struct percpu_cluster);
+		if (!si->percpu_cluster)
+			goto err;
+
+		for_each_possible_cpu(cpu) {
+			struct percpu_cluster *cluster;
+
+			cluster = per_cpu_ptr(si->percpu_cluster, cpu);
+			for (i = 0; i < SWAP_NR_ORDERS; i++)
+				cluster->next[i] = SWAP_ENTRY_INVALID;
+			local_lock_init(&cluster->lock);
+		}
+	} else {
 		si->global_cluster = kmalloc_obj(*si->global_cluster);
 		if (!si->global_cluster)
 			goto err;
 		for (i = 0; i < SWAP_NR_ORDERS; i++)
 			si->global_cluster->next[i] = SWAP_ENTRY_INVALID;
-		spin_lock_init(&si->global_cluster_lock);
+		spin_lock_init(&si->global_cluster->lock);
 	}
 
 	/*
@@ -3984,6 +3918,8 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 bad_swap_unlock_inode:
 	inode_unlock(inode);
 bad_swap:
+	free_percpu(si->percpu_cluster);
+	si->percpu_cluster = NULL;
 	kfree(si->global_cluster);
 	si->global_cluster = NULL;
 	inode = NULL;
