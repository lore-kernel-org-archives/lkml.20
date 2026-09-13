Received: from mta0.migadu.com (out-96.mta0.migadu.com [91.218.175.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC537E0E4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789285857; cv=none; b=hlTHe62TK2s1u3f4t+QOLZjjJcMiZzMBCEm68VPRzenBnvYUjobTrZLKlPJPddmljnmQAdXl0nhnozOH1gGUgRsDKneyXKAWm0qKWrU2/1LjYsYaRF84iIKHU6c0DRPlbAdN9s+AlJGYHyeQ0iDZ1TXXQHro3SDL9Z/Nfu02slQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789285857; c=relaxed/simple;
	bh=tdsZOf25ZLpCfCvoWIxaO6ASt2dG3hTJrOfLSNFoK58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=r+XDDUoMmKfyCp9DwrO8FFvepmZAqY0riNLONmWUMgqdHwXkXJhG/XKHGLIVKfSX/DzWzIgkbsJr1ogoHdSb5KJ06awfNkhnUt5pvXig7sTp0UidGLYlVHXlfCywvQHaLJhRUHOXMeXZeWgYqlq32ju1nwyKGuKmDeyle3u/U24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 59fb4a7e4ef5c624;
	Sun, 13 Sep 2026 07:50:53 +0000
X-Mizu-Trace-ID: 59fb4a7e4ef5c624
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
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v2 06/12] mm, swap: add xswap grow trigger on cluster allocation
Date: Sun, 13 Sep 2026 15:50:08 +0800
Message-ID: <20260913075014.1732524-7-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260913075014.1732524-1-hebaoquan@kylinos.cn>
References: <20260913075014.1732524-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

When cluster_alloc_swap_entry() fails to find a free cluster and
the xswap device still has room to grow, expand the mapped range
by XSWAP_GROW_CLUSTERS clusters.

Since xswap is always SWP_SOLIDSTATE, global_cluster_lock is never
held on this path.

This makes the xswap cluster space grow transparently as swap usage
increases, without any userspace intervention.

Growing maps pages into the VM_SPARSE area, which can sleep. The caller
holds local_lock(&percpu_swap_cluster.lock) across the whole slow path,
so drop it around xswap_map_clusters() and take it again afterwards; it
only protects the per-cpu cluster cache, which this path does not touch.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 4861e2d49e36..f603f8c4b599 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1270,6 +1270,56 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 		if (found)
 			goto done;
 	}
+
+#ifdef CONFIG_XSWAP
+	/*
+	 * For xswap: if no free cluster was found and more clusters
+	 * can be mapped, grow the cluster_info array and retry.
+	 */
+	if (!found && (si->flags & SWP_XSWAP) &&
+	    READ_ONCE(si->nr_clusters_mapped) < READ_ONCE(si->nr_clusters_max) &&
+	    list_empty(&si->free_clusters)) {
+		unsigned long nr_new = min(READ_ONCE(si->nr_clusters_max) -
+					  READ_ONCE(si->nr_clusters_mapped),
+					  XSWAP_GROW_CLUSTERS);
+		unsigned long start = READ_ONCE(si->nr_clusters_mapped);
+		unsigned long i;
+		int ret;
+
+		/*
+		 * Mapping pages into the VM_SPARSE area can sleep, which is
+		 * not allowed under local_lock.  The lock only protects the
+		 * per-cpu cluster cache, which this path does not touch, so
+		 * it can be dropped across the call.
+		 */
+		local_unlock(&percpu_swap_cluster.lock);
+		ret = xswap_map_clusters(si, start, nr_new);
+		local_lock(&percpu_swap_cluster.lock);
+
+		if (!ret) {
+			for (i = start; i < start + nr_new; i++) {
+				struct swap_cluster_info *ci = &si->cluster_info[i];
+
+				/*
+				 * A concurrent grower may have already added
+				 * these clusters to the free list.  Only add
+				 * clusters that are still off-list (NONE).
+				 * Lock ci->lock first: move_cluster() takes
+				 * si->lock internally.
+				 */
+				spin_lock(&ci->lock);
+				if (ci->flags == CLUSTER_FLAG_NONE)
+					move_cluster(si, ci, &si->free_clusters,
+						     CLUSTER_FLAG_FREE);
+				spin_unlock(&ci->lock);
+			}
+
+			/* Retry allocation from the free list */
+			found = alloc_swap_scan_list(si, &si->free_clusters,
+						    folio, false);
+		}
+	}
+#endif
 done:
 	if (!(si->flags & SWP_SOLIDSTATE))
 		spin_unlock(&si->global_cluster_lock);
-- 
2.54.0

