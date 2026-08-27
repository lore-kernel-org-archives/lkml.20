Received: from mta1.migadu.com (out-168.mta1.migadu.com [95.215.58.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F88641D231
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824001; cv=none; b=WcEII1LxP/bc/77MoXW+3s/uZulGtNzy+WTyBFoVAg4VHxMuswJV5Y8Ac4ty98jxWW8cgH4/fmnPE2xpL5X2m15JaQdAK91SeQUz2ggWLf0Twm6SvS4q+2DUDTg6lt5fvk11qBIDGdw1O2gDrIigIRDSOoHFyAumfLlFzTCqP4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824001; c=relaxed/simple;
	bh=6MrSmKsMskkT+vc/2S3d0j/3bC64oaRVC3+/b7ctbNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-type; b=S3/Qik20vRNx24XCRv5lJAmoJDg6JDH5zFyhYpxu5LEZ8uoR1CgCw1QLBUlTZqcofG5MmCE5Lw4ykC+lvZv7OCExDEJj4EmTGdcOU8LfG2BJZyYAER4IpiTNOZ25DNVLAgDOicfvSxQ6LrCfcTIkTvNh3tRT1eQR8jO88cbZYBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 7d67cfe4c2f446bf;
	Thu, 27 Aug 2026 09:46:36 +0000
X-Mizu-Trace-ID: 7d67cfe4c2f446bf
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
Subject: [PATCH 13/16] mm, swap: defer xswap shrink to workqueue to avoid lock recursion
Date: Thu, 27 Aug 2026 17:45:03 +0800
Message-ID: <20260827094509.1016740-14-hebaoquan@kylinos.cn>
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

xswap_try_shrink() was called directly from __free_cluster() while
holding ci->lock.  The shrink path calls xswap_unmap_clusters()
which unmaps vmalloc pages backing cluster_info, and on return
swap_cache_del_folio() tries swap_cluster_unlock(ci) on the now-
unmapped address - crashing on a not-present page.

Replace direct calls with schedule_work() so shrink runs in an
independent workqueue context where no cluster locks are held.
Use cancel_work_sync() during swapoff to ensure no pending shrink
work races with the VM area teardown.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |  1 +
 mm/swapfile.c        | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 5e50486103b9..998f04c0b767 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -255,6 +255,7 @@ struct swap_info_struct {
 	unsigned long		nr_clusters_mapped; /* currently mapped cluster count */
 	unsigned long		nr_free_tail;	/* contiguous free clusters at tail */
 	struct dentry		*debugfs_entry;	/* debugfs: type<N>_max_clusters */
+	struct work_struct	xswap_shrink_work; /* deferred shrink trigger */
 	struct mutex		xswap_lock;	/* serialize map/unmap operations */
 #endif
 	struct list_head free_clusters; /* free clusters list */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 6916a8b3f63b..dc112c378489 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -786,7 +786,7 @@ static void __free_cluster(struct swap_info_struct *si, struct swap_cluster_info
 	ci->order = 0;
 #ifdef CONFIG_XSWAP
 	xswap_update_free_tail(si, ci - si->cluster_info);
-	xswap_try_shrink(si);
+	schedule_work(&si->xswap_shrink_work);
 #endif
 }
 
@@ -3312,6 +3312,7 @@ static void free_swap_cluster_info(struct swap_info_struct *si)
 #ifdef CONFIG_XSWAP
 	if (si->flags & SWP_XSWAP) {
 		xswap_debugfs_del(si);
+		cancel_work_sync(&si->xswap_shrink_work);
 		/* Unmap all mapped clusters and free the VM_SPARSE area */
 		if (si->nr_clusters_mapped > 0)
 			xswap_unmap_clusters(si, 0, si->nr_clusters_mapped);
@@ -4082,6 +4083,13 @@ static void xswap_trim_free_tail(struct swap_info_struct *si, unsigned long idx)
 		WRITE_ONCE(si->nr_free_tail, nr_mapped - idx - 1);
 }
 
+static void xswap_shrink_work_fn(struct work_struct *work)
+{
+	struct swap_info_struct *si = container_of(work,
+			struct swap_info_struct, xswap_shrink_work);
+	xswap_try_shrink(si);
+}
+
 /*
  * Try to shrink the cluster_info tail.  Uses si->nr_free_tail which
  * is maintained incrementally during alloc/free — no scanning needed.
@@ -4200,6 +4208,8 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 
 		/* All mapped clusters except cluster 0 are free at the tail */
 		si->nr_free_tail = si->nr_clusters_mapped - 1;
+
+		INIT_WORK(&si->xswap_shrink_work, xswap_shrink_work_fn);
 		xswap_debugfs_add(si);
 		return 0;
 
-- 
2.54.0

