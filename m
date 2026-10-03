Received: from mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ED22472AF
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987545; cv=none; b=LnS3lsJiDhdwFpqVQoomJd/lCJUN3dR9ooYm3B7/ZaNGjm5tY+cOD4zGnrB3VBxGxowOB+VujEZfYuWx4r0O3vtmBItDO4wyzeZrbP1qky17Oj8pP2OVYsBXZyYjIr3/F7Km7OppA5jXPvIiwvZpYcHjEjHBOpbWHDZ1CufOujI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987545; c=relaxed/simple;
	bh=GJP1WgcrSt4wXNPDjMJQSEXn/jOreewXozdvrWqTIEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=d+6raoS9kaVWv5HeNY1zmiyp383AX2Y8oTZKjESrRXY9iBDSy9Fnbh7VnLiM/tt1kFZU6okWS2vvmXyA+MUI9RUnI58nsheqUur8REzFiW7UcZFP5kZXk7CRSGSb98ybckQ/RzFn5ELlpiZwFHe67R484yIZ9Vdpqa9zbYbTtdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 6711e8c646215ae2;
	Sat, 03 Oct 2026 00:32:20 +0000
X-Mizu-Trace-ID: 6711e8c646215ae2
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v4 05/14] mm, swap: add xswap grow trigger on cluster allocation
Date: Sat,  3 Oct 2026 08:31:27 +0800
Message-ID: <20261003003136.750633-6-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261003003136.750633-1-hebaoquan@kylinos.cn>
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Grow the mapped range before it runs out rather than after, from
cluster_alloc_swap_entry().

Growing maps pages into the VM_SPARSE area and can sleep. Doing it from
the allocation that would otherwise have failed puts that sleep on the
swap-out path with nothing left to fall back on. Growing at 85% in use
instead leaves the allocation that pays for it a reserve to land in, and
leaves one grow's worth of room in front of the next.

The target is 65%: past the point where the shrink starts looking (50%)
and short of the point that triggers the next grow (85%), so a grow
cannot leave the range in a state the shrink would undo.

Since xswap is always SWP_SOLIDSTATE, global_cluster_lock is never
held on this path.

This makes the xswap cluster space grow transparently as swap usage
increases, without any userspace intervention.

The caller holds local_lock(&percpu_swap_cluster.lock) across the whole
slow path, so drop it around xswap_map_clusters() and take it again
afterwards; it only protects the per-cpu cluster cache, which this path
does not touch.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 93 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 9c204e455ef9..45050f8a2ed8 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -70,6 +70,19 @@
 #define XSWAP_GROW_CLUSTERS \
 	max_t(unsigned long, PAGE_SIZE / sizeof(struct swap_cluster_info), 16)
 
+/*
+ * Grow and shrink thresholds, as a percentage of the mapped range in use.
+ * Each one lands inside (SHRINK_WHEN, GROW_WHEN), so neither can leave the
+ * range in a state that wakes the other up.
+ */
+#define XSWAP_SHRINK_WHEN	50
+#define XSWAP_SHRINK_UNTIL	70
+#define XSWAP_GROW_UNTIL	65
+#define XSWAP_GROW_WHEN		85
+#define XSWAP_GROW_CHUNKS	4
+
+static bool xswap_should_grow(struct swap_info_struct *si);
+static unsigned long xswap_grow(struct swap_info_struct *si);
 static int xswap_map_clusters(struct swap_info_struct *si,
 			      unsigned long start_idx, unsigned long nr);
 static void xswap_unmap_clusters(struct swap_info_struct *si,
@@ -1204,6 +1217,17 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 	if (order && !(si->flags & SWP_BLKDEV))
 		return 0;
 
+#ifdef CONFIG_XSWAP
+	/*
+	 * Top the range up early.  Every path below leaves through `done`,
+	 * so this has to come first; mapping pages can sleep, and doing it
+	 * from the allocation that would otherwise fail leaves nothing to
+	 * fall back on.
+	 */
+	if ((si->flags & SWP_XSWAP) && xswap_should_grow(si))
+		xswap_grow(si);
+#endif
+
 	if (!(si->flags & SWP_SOLIDSTATE)) {
 		/* Serialize HDD SWAP allocation for each device. */
 		spin_lock(&si->global_cluster_lock);
@@ -1280,6 +1304,12 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
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
@@ -3909,6 +3939,69 @@ static int xswap_map_clusters(struct swap_info_struct *si,
 	return -ENOMEM;
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
+	lockdep_assert_held(&percpu_swap_cluster.lock);
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
 static void xswap_unmap_clusters(struct swap_info_struct *si,
 				 unsigned long start_idx, unsigned long nr)
 {
-- 
2.54.0

