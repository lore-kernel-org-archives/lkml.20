Received: from mta0.migadu.com (out-118.mta0.migadu.com [91.218.175.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C8A3B994A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554122; cv=none; b=PnhtClqqIox+GkkneDlgKwlhs3qrcvuaQG8+GRcjTmDqKbx5vda9aRZutXovo5jBZ7N8OXWu2dUqhMQ3LmJfByPuI3EhbkEQMWhScMlW2Lj0sLJ0prgpkOa8wGrJzs2qWbUyjOBBFxBjtI8XIwJsCxsg0A9xp008iDT1XUTjGz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554122; c=relaxed/simple;
	bh=zr/6QkN7PGRbAiqv5LyfZL95bWr+x1adRWzQUkTaElM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=rZFKVShuC26Q76RvvvcwSxQ4hpveCIdTwwRES21+HmbSFB7M5H80zCz64p/Hu1um2c5ikS6Ottmmgi2U5xzSUy02yugRTiNryBi9fTyqnIY4ApNyhsqsgEVK9rIMLFtPNvJVm3S7zS4OZF3aFoKbty1IcJilvMz88AT6c8e5ynw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id c0bf29a0ffc9229e;
	Wed, 16 Sep 2026 10:21:27 +0000
X-Mizu-Trace-ID: c0bf29a0ffc9229e
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	kunwu.chan@gmail.com,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v3 14/14] mm, swap: shrink xswap to the ceiling when it drops
Date: Wed, 16 Sep 2026 18:19:21 +0800
Message-ID: <20260916101929.149106-15-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916101929.149106-1-hebaoquan@kylinos.cn>
References: <20260916101929.149106-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Make xswap_try_shrink() shrink down to the ceiling when the ceiling is
lowered below the mapped range, and trigger the shrink directly from a
limit write instead of waiting for the next free cluster.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 59 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 0fcbaf1cf0e2..ab64bfc4e0f7 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -4190,8 +4190,9 @@ static void xswap_shrink_work_fn(struct work_struct *work)
  */
 static void xswap_try_shrink(struct swap_info_struct *si)
 {
+	unsigned long nr_mapped, nr_ceiling, nr_tail, nr_unmap;
+	unsigned long start_idx, i;
 	struct swap_cluster_info *ci;
-	unsigned long nr_mapped, nr_tail, nr_unmap, start_idx, i;
 
 	if (!(si->flags & SWP_XSWAP))
 		return;
@@ -4203,35 +4204,45 @@ static void xswap_try_shrink(struct swap_info_struct *si)
 		goto out_unlock;
 
 	nr_mapped = READ_ONCE(si->nr_clusters_mapped);
+	nr_ceiling = READ_ONCE(si->nr_clusters);
+
 	if (nr_mapped <= 1)	/* keep cluster 0 */
 		goto out_unlock;
 
 	/*
-	 * Reclaim on our own, but only once the mapped range is at most
-	 * half in use: growth is demand driven, so reclaiming on a smaller
-	 * dip would only map the same clusters again, and every unmap costs
-	 * an RCU grace period.
+	 * A cap below the mapped range shrinks on its own.  Otherwise wait
+	 * until the range is at most half in use: growth follows demand, so
+	 * shrinking above that would only map the same clusters again.
 	 */
-	if (swap_usage_in_pages(si) * 2 > nr_mapped * SWAPFILE_CLUSTER)
+	if (nr_ceiling >= nr_mapped &&
+	    swap_usage_in_pages(si) * 2 > nr_mapped * SWAPFILE_CLUSTER)
 		goto out_unlock;
 
-	/*
-	 * Count the free clusters at the tail of the mapped range.  Scanned,
-	 * not tracked: the count must be exact to size the unmap, and an
-	 * incremental count falls behind on out-of-order frees.
-	 */
-	nr_tail = 0;
-	while (nr_mapped - nr_tail > 1) {
-		ci = &si->cluster_info[nr_mapped - nr_tail - 1];
-		if (READ_ONCE(ci->count) ||
-		    READ_ONCE(ci->flags) != CLUSTER_FLAG_FREE)
-			break;
-		nr_tail++;
-	}
-	if (nr_tail < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
-		goto out_unlock;
+	if (nr_ceiling < nr_mapped) {
+		/* Take the excess exactly; rounding could zero a small cap. */
+		nr_unmap = nr_mapped - nr_ceiling;
+		/*
+		 * Keep cluster 0: it always holds the header slot, so it is
+		 * never free and must not be unmapped.
+		 */
+		nr_unmap = min(nr_unmap, nr_mapped - 1);
+	} else {
+		/* Count the free tail; scanned, not tracked. */
+		nr_tail = 0;
+		while (nr_mapped - nr_tail > 1) {
+			ci = &si->cluster_info[nr_mapped - nr_tail - 1];
+			if (READ_ONCE(ci->count) ||
+			    READ_ONCE(ci->flags) != CLUSTER_FLAG_FREE)
+				break;
+			nr_tail++;
+		}
 
-	nr_unmap = rounddown(nr_tail - XSWAP_SHRINK_SLACK, XSWAP_GROW_CLUSTERS);
+		if (nr_tail < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
+			goto out_unlock;
+
+		nr_unmap = rounddown(nr_tail - XSWAP_SHRINK_SLACK,
+				     XSWAP_GROW_CLUSTERS);
+	}
 	if (!nr_unmap)
 		goto out_unlock;
 	start_idx = nr_mapped - nr_unmap;
@@ -4507,6 +4518,10 @@ static ssize_t xswap_limit_store(struct kobject *kobj,
 
 	spin_unlock(&swap_lock);
 
+	/* Enforce a lowered ceiling at once; raising needs no shrink. */
+	if (clusters < READ_ONCE(si->nr_clusters_mapped))
+		xswap_try_shrink(si);
+
 	return count;
 }
 
-- 
2.54.0

