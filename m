Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53AA4AF142
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554060; cv=none; b=RvPtRCe3sTC7XTpcqhfZEjQuWAzmXdyyKEDmjRiBt1ygWB9FtGQQLDyw4v1SgGrrM1AAqdxLBgVMvApi0Kb4pIf5F9uciRQUAYKl8mIShbftHQBY6lzZEvvNLGQNlvOhDFu3aCRacVJjrhG+u5g20ouZFyCx4/ArlYFfWQ/OGGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554060; c=relaxed/simple;
	bh=0F87CNzhepZiFr8WQMyBvHS+j+ezFrEBmG0zT8DT8pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Jgc1gYyouR8jywT7G1sjqOKY+gaEnvtJ903wNaq5HrYAO3heCwmxyrSdhFs4eHf+Id3hFqOina5tgMKZpkuFRJA1aL2POdUbh1YxrXbwQhnAbTecYhRk9DO/qKLxjdLEor9OLSMPl3gitd/FhcIVrNLL/yhOwXoAXj20V0C3N0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id e285610b6a99b574;
	Wed, 16 Sep 2026 10:20:40 +0000
X-Mizu-Trace-ID: e285610b6a99b574
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
Subject: [PATCH v3 06/14] mm, swap: add xswap grow trigger on cluster allocation
Date: Wed, 16 Sep 2026 18:19:13 +0800
Message-ID: <20260916101929.149106-7-hebaoquan@kylinos.cn>
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
 mm/swapfile.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index b0edf5421fc5..17e482059d32 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1273,6 +1273,47 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 		if (found)
 			goto done;
 	}
+
+#ifdef CONFIG_XSWAP
+	/* For xswap: grow the cluster_info array, then retry. */
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
+		 * Mapping pages can sleep.  The lock only guards the per-cpu
+		 * cluster cache, which this path does not touch.
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
+				 * A concurrent grower may have taken these already;
+				 * only add the off-list ones.
+				 */
+				spin_lock(&ci->lock);
+				if (ci->flags == CLUSTER_FLAG_NONE)
+					move_cluster(si, ci, &si->free_clusters,
+						     CLUSTER_FLAG_FREE);
+				spin_unlock(&ci->lock);
+			}
+
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

