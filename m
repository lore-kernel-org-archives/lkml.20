Received: from mta0.migadu.com (out-89.mta0.migadu.com [91.218.175.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA61F4DF4C2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554098; cv=none; b=gVJepeR3B32X1M6KHi+emms2VUn9fJxwzF5pOiOWHmMnoyJOgyjY/LNi+Wbiy/xzRzqohPZTVDLQTHQi6BO/J2GL/xIQzvpqfBpLj04ABjYoFNYOZh4RnFbf522WabGJ9rVgdpkSsCAHrbQSyMUHT43BhDSO//PQOd36l6GK6F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554098; c=relaxed/simple;
	bh=XFP04jrpN6W+7ITyb1pJ6MF6suxcaOgkoPfcJUVQoMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=BgGh5EO2I/TXdB4+aLRyRK00/6wRmSqRgnpBwxCCmwZRcGoMBA/aqSqMOYxyDe+Qhy3Br8eXyU4FXN4BDG/yO4Bfnq9k67wDWIXs8bR/8W3GZe3rOox8F/uxiezxZgipOoXHLItFVIHJcRrlXBnBRwwovEPIqKAoma2wB9Xz0dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 8cb4c72123f0ed8d;
	Wed, 16 Sep 2026 10:21:13 +0000
X-Mizu-Trace-ID: 8cb4c72123f0ed8d
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
Subject: [PATCH v3 12/14] mm, swap: cap xswap growth at nr_clusters
Date: Wed, 16 Sep 2026 18:19:19 +0800
Message-ID: <20260916101929.149106-13-hebaoquan@kylinos.cn>
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

Add si->nr_clusters as the ceiling for the cluster_info array's growth.
It starts at the whole address space, so nothing changes yet.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |  1 +
 mm/swapfile.c        | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 30642bb481df..9fe82d0f1740 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -245,6 +245,7 @@ struct swap_info_struct {
 #ifdef CONFIG_XSWAP
 	struct vm_struct	*cluster_vm;	/* VM_SPARSE area for cluster_info */
 	unsigned long		nr_clusters_max;/* total clusters in the xswap address space */
+	unsigned long		nr_clusters;	/* how far the array may grow */
 	unsigned long		nr_clusters_mapped; /* currently mapped cluster count */
 	struct work_struct	xswap_shrink_work; /* deferred shrink trigger */
 	struct mutex		xswap_lock;	/* serialize map/unmap operations */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index cac084bc72d6..2cf6ba0bd0c0 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1319,16 +1319,18 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 
 #ifdef CONFIG_XSWAP
 	/* For xswap: grow the cluster_info array, then retry. */
-	if (!found && (si->flags & SWP_XSWAP) &&
-	    READ_ONCE(si->nr_clusters_mapped) < READ_ONCE(si->nr_clusters_max) &&
-	    list_empty(&si->free_clusters)) {
-		unsigned long nr_new = min(READ_ONCE(si->nr_clusters_max) -
-					  READ_ONCE(si->nr_clusters_mapped),
-					  XSWAP_GROW_CLUSTERS);
-		unsigned long start = READ_ONCE(si->nr_clusters_mapped);
-		unsigned long i;
+	if (!found && (si->flags & SWP_XSWAP) && list_empty(&si->free_clusters)) {
+		unsigned long ceiling = READ_ONCE(si->nr_clusters);
+		unsigned long mapped = READ_ONCE(si->nr_clusters_mapped);
+		unsigned long nr_new, start, i;
 		int ret;
 
+		if (mapped >= ceiling)
+			goto done;
+
+		nr_new = min(ceiling - mapped, XSWAP_GROW_CLUSTERS);
+		start = mapped;
+
 		/*
 		 * Mapping pages can sleep.  The lock only guards the per-cpu
 		 * cluster cache, which this path does not touch.
@@ -4294,6 +4296,7 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 		cluster_info = vm->addr;
 		si->cluster_vm = vm;
 		si->nr_clusters_max = nr_clusters;
+		si->nr_clusters = nr_clusters;
 		si->cluster_info = cluster_info;
 
 		/* Must be initialized before xswap_map_clusters() locks it. */
-- 
2.54.0

