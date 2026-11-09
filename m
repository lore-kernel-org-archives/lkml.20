Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203829;
	b=WRjf4CLxZbdYXKjOFtHGA0+ZzmCKRn1Rz9+iI0LFBwAPoCfAepX92ytHIOlVeXGWnNNg
	 sKcXLKTLx8KY3fqymxSBe1oQiYkwv+X7tABbOnftdmDwNqOQcNNvkeeHDmhdnqbazJ5GV
	 2ekUdPGdB96k0iZmDy1+myhuojnYCG8/t0ui/vxX61gzYoAi6ehgLwla/vnZfG/Pyzq3z
	 wIapU4mIfS/6YW/CnM0frNTbzaBwxZeeqEWGYPMZWcZP/YbVHtaHs8xlR+xYpwd6R+omw
	 faFqqVrfUsMOCXYCixupgoxuXPG+EfTW1HYASEyfsQL1dH6QYt74pT8NkQgRC+gIIwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203829;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=oHIuvULbA0fqevzvPsgDGnoy3CmrucFTgFOStDNRHTc=;
	b=GCm3acXnJARV/XTfL4IvZKyalajJGXMRn/UVSWxxP9NWPIe2FFU18ckaW1YsE05+SIEy
	 /trI9iQ2D9xsYCVqktS00vb0A+tFMrTPJ1JYvMY5amgTD4ITISdCSSGwD7MC1nksSoYWJ
	 H6DO+ra5oEo0pOFdzAYQ8SV6tOQskYz5bJ8NWsoDV6seugx1trIb3AAI1uSaLNgftOLOA
	 ztR7K60gcWtezblETsJln+uVkXiQT7jNIsk/AR6G98iZjeKa4NuNDXdFdIKzAxYBKUr2z
	 MYYLD3SUobLNF4yEmI5hJjUALWL36P7bA8rrl8PPbPbXFGy8BAXhqIaLEicJi6WIR5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lnz6CLZV;
	arc=none smtp.remote-ip=91.218.175.197
Received: from mta0.migadu.com (out-197.mta0.migadu.com [91.218.175.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5065E606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5065E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lnz6CLZV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=grvGazueux9g/dh4Ox9KldXCRFLinqH44M5UkMCzZds=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203826; v=1; x=1794808626;
 b=lnz6CLZVFYsVRZgBptfCd919FbVYInP7m1dvDrnoVc6njiOzG77gb8J7DSJB3qhZwZ/jgNSG
 z+zVS7ZP9OBCwB8vtIy/7QdRXlkeIhWqrzT2ScEQ99+mXMCgBEio3k3ufpzFOa6eS2lpIlQSBTC
 WY7sZQdQPC3ZrkaL1IXzf13E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 6e7fba55756a7293;
	Mon, 09 Nov 2026 05:57:05 +0000
X-Mizu-Trace-ID: 6e7fba55756a7293
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	corbet@lwn.net,
	hannes@cmpxchg.org,
	chengming.zhou@linux.dev,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v5 13/19] mm, swap: add xswap grow trigger on cluster allocation
Date: Mon,  9 Nov 2026 13:54:49 +0800
Message-ID: <20261109055455.536925-14-baoquan.he@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109055455.536925-1-baoquan.he@linux.dev>
References: <20261109055455.536925-1-baoquan.he@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Baoquan He <hebaoquan@kylinos.cn>

Grow the mapped xswap range before it runs out. When usage reaches 85%
of the mapped range, map more clusters from cluster_alloc_swap_entry().

Grow to about 65% usage. This leaves free space in the mapped range
before the next grow at 85%, so one grow is not immediately followed by
another.

Mapping pages can sleep. Grow before the allocation that needs them,
not after it fails. xswap_grow() drops the per-CPU cluster lock around
xswap_map_clusters(), because mapping can sleep and the lock only
protects the per-CPU cache. xswap is always SWP_SOLIDSTATE, so this path
does not use global_cluster_lock.

Link the new clusters even if swapoff cleared SWP_WRITEOK while mapping.
The caller keeps the device alive, and the allocation path checks the
flag before taking a cluster. If try_to_unuse() then fails, the
reinserted device needs these clusters; otherwise they go away with the
device.

After a failed scan, retry the free list once. A concurrent free or
grow may have added clusters.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 100 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 7b1d16226b7b..ba730fa19194 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -80,7 +80,18 @@
 	max_t(unsigned long,						\
 	      ((XSWAP_UNMAP_BATCH_PAGES * PAGE_SIZE) /		\
 	       sizeof(struct swap_cluster_info)), 16)
+/*
+ * Grow thresholds, as a percentage of the mapped range in use.  The target
+ * sits above the point where the shrink starts looking (50%) and below the
+ * next grow trigger (85%), so a grow cannot leave the range in a state the
+ * shrink would undo.
+ */
+#define XSWAP_GROW_UNTIL	65
+#define XSWAP_GROW_WHEN		85
+#define XSWAP_GROW_CHUNKS	4
 
+static bool xswap_should_grow(struct swap_info_struct *si);
+static unsigned long xswap_grow(struct swap_info_struct *si);
 static int xswap_map_clusters(struct swap_info_struct *si,
 			      unsigned long start_idx, unsigned long nr);
 static void xswap_unmap_clusters(struct swap_info_struct *si,
@@ -1359,6 +1370,18 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 	if (order && !(si->flags & SWP_BLKDEV))
 		return 0;
 
+#ifdef CONFIG_XSWAP
+	/*
+	 * Top the range up early.  Every path below leaves through `done`,
+	 * so this has to come first; mapping pages can sleep, and doing it
+	 * from the allocation that would otherwise fail leaves nothing to
+	 * fall back on.
+	 */
+	if ((si->flags & SWP_XSWAP) && (si->flags & SWP_WRITEOK) &&
+	    xswap_should_grow(si))
+		xswap_grow(si);
+#endif
+
 	if (!(si->flags & SWP_SOLIDSTATE)) {
 		/* Serialize HDD SWAP allocation for each device. */
 		spin_lock(&si->global_cluster_lock);
@@ -1435,6 +1458,12 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 		if (found)
 			goto done;
 	}
+
+#ifdef CONFIG_XSWAP
+	/* A concurrent free or grow may have added clusters; retry once. */
+	if (!found && (si->flags & SWP_XSWAP))
+		found = alloc_swap_scan_list(si, &si->free_clusters, folio, false);
+#endif
 done:
 	if (!(si->flags & SWP_SOLIDSTATE))
 		spin_unlock(&si->global_cluster_lock);
@@ -4168,6 +4197,77 @@ static void xswap_unmap_range(struct swap_info_struct *si,
 		__free_page(pages[i]);
 }
 
+static bool xswap_should_grow(struct swap_info_struct *si)
+{
+	unsigned long mapped = READ_ONCE(si->nr_clusters_mapped);
+
+	if (mapped >= READ_ONCE(si->nr_clusters_max))
+		return false;
+
+	return swap_usage_in_pages(si) * 100 >=
+	       mapped * SWAPFILE_CLUSTER * XSWAP_GROW_WHEN;
+}
+
+/*
+ * Map more of the cluster_info array, up to GROW_UNTIL in use.  The caller
+ * holds percpu_swap_cluster.lock, which this drops while it sleeps.
+ */
+static unsigned long xswap_grow(struct swap_info_struct *si)
+{
+	unsigned long mapped = READ_ONCE(si->nr_clusters_mapped);
+	unsigned long nr_new, want, i;
+	int ret;
+
+	/* The unmap below is paired with the caller's lock. */
+	lockdep_assert_held(&this_cpu_ptr(&percpu_swap_cluster)->lock);
+
+	want = DIV_ROUND_UP(swap_usage_in_pages(si) * 100,
+			    XSWAP_GROW_UNTIL * SWAPFILE_CLUSTER);
+	if (want <= mapped)
+		return 0;
+
+	nr_new = rounddown(want - mapped, XSWAP_GROW_CLUSTERS);
+	if (!nr_new)
+		nr_new = XSWAP_GROW_CLUSTERS;
+	if (nr_new > XSWAP_GROW_CHUNKS * XSWAP_GROW_CLUSTERS)
+		nr_new = XSWAP_GROW_CHUNKS * XSWAP_GROW_CLUSTERS;
+	nr_new = min(nr_new, READ_ONCE(si->nr_clusters_max) - mapped);
+	if (!nr_new)
+		return 0;
+
+	/*
+	 * Mapping pages can sleep.  The lock only guards the per-cpu
+	 * cluster cache, which this path does not touch.
+	 */
+	local_unlock(&percpu_swap_cluster.lock);
+	ret = xswap_map_clusters(si, mapped, nr_new);
+	local_lock(&percpu_swap_cluster.lock);
+	if (ret)
+		return 0;
+
+	/*
+	 * Link the clusters even if swapoff cleared SWP_WRITEOK while we
+	 * mapped. The caller keeps the device alive, and nothing takes a
+	 * cluster while WRITEOK is clear. If try_to_unuse() fails, the
+	 * reinserted device needs them.
+	 */
+	for (i = mapped; i < mapped + nr_new; i++) {
+		struct swap_cluster_info *ci = &si->cluster_info[i];
+
+		/*
+		 * A concurrent grower may have taken these already;
+		 * only add the off-list ones.
+		 */
+		spin_lock(&ci->lock);
+		if (ci->flags == CLUSTER_FLAG_NONE)
+			move_cluster(si, ci, &si->free_clusters,
+				     CLUSTER_FLAG_FREE);
+		spin_unlock(&ci->lock);
+	}
+
+	return nr_new;
+}
+
 /* Caller must hold si->xswap_lock.  Cannot fail. */
 static void xswap_unmap_clusters(struct swap_info_struct *si,
 				 unsigned long start_idx, unsigned long nr)
-- 
2.54.0

