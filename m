Received: from mta0.migadu.com (out-198.mta0.migadu.com [91.218.175.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9151943CE4F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823956; cv=none; b=khvC5mhL8M/uOUWB5E2eQps7+IVovECFL2+OyDZKS8hln/oOeKNXSuUZlGcQOKlIUyH/fxgacQ0E5xkMjQqat+JFETWZ7AHUtkH4ML1VPyscaUANXvsJReq0OKDHsmpR3BUQooVYd/vMfk+Ci7XnxsVU7H0ZaVe3jCTG0xViqdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823956; c=relaxed/simple;
	bh=TOZrgZBL2nqq9rVeu8yyBvw2pItZAocX5D7PLiqwuPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-type; b=G/emlVWj51xPYzwl4yVPElBn1BJ1YKHUhRrTNS6KL4+PAfrIs9zHmsqJoxZ8r38JFiWi1tOokYcLie73bI3wMkjmTxzYI7UF3FScNTPQwSHhhOkLjd2UJu6+etU0VGy65ODFyIlFKTrka8xeeQbgQ5b8Gyf0EYwJwDFH3+uMpKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 8048e88cfe4c95cd;
	Thu, 27 Aug 2026 09:45:52 +0000
X-Mizu-Trace-ID: 8048e88cfe4c95cd
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
Subject: [PATCH 07/16] mm, swap: add xswap grow trigger on cluster allocation
Date: Thu, 27 Aug 2026 17:44:57 +0800
Message-ID: <20260827094509.1016740-8-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit

When cluster_alloc_swap_entry() fails to find a free cluster and
the xswap device still has room to grow, expand the mapped range
by XSWAP_GROW_CLUSTERS clusters.

Since xswap is always SWP_SOLIDSTATE, no locks need to be dropped
before calling xswap_map_clusters(), global_cluster_lock is never
held on this path.

The grow sequence:
1. Check nr_clusters_mapped < nr_clusters and free list empty
2. Call xswap_map_clusters() to allocate and map more physical pages
3. Add newly mapped clusters to si->free_clusters under si->lock
4. Retry allocation from the fresh free clusters

This makes the xswap cluster space grow transparently as swap usage
increases, without any userspace intervention.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 1127e3d6596b..c6a01d74298a 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1273,6 +1273,51 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
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
+	    READ_ONCE(si->nr_clusters_mapped) < READ_ONCE(si->nr_clusters) &&
+	    list_empty(&si->free_clusters)) {
+		unsigned long nr_new = min(READ_ONCE(si->nr_clusters) -
+					  READ_ONCE(si->nr_clusters_mapped),
+					  XSWAP_GROW_CLUSTERS);
+		unsigned long start = READ_ONCE(si->nr_clusters_mapped);
+		unsigned long i;
+
+		if (!xswap_map_clusters(si, start, nr_new)) {
+			unsigned long added = 0;
+
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
+				if (ci->flags == CLUSTER_FLAG_NONE) {
+					move_cluster(si, ci, &si->free_clusters,
+						     CLUSTER_FLAG_FREE);
+					added++;
+				}
+				spin_unlock(&ci->lock);
+			}
+			WRITE_ONCE(si->nr_free_tail,
+				   READ_ONCE(si->nr_free_tail) + added);
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

