Received: from lgeamrelo07.lge.com (lgeamrelo07.lge.com [156.147.51.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78323515FD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.51.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971463; cv=none; b=ecznAputx1ThRLuxfMffeD4+HRBaDmhXn749nvLpOJrKJZajKJUVddoqF4Mzzf3EJtk291Qef7r6duMWPiJMVPtGalXQFJCN1s7hdp5RrKmcXauGA7wzzvnOitqzEfjCe+f/HMvetOyY17vdeWEAiUKoLCn7nIV4ono6iN79SRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971463; c=relaxed/simple;
	bh=Rq4B22bGzOx4HhdzbB2hM5lPZxNZSNXs/fWQ9nq3iEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lodecG6bCQ/bQaxVsTqGbyr/N/zT1xXiIZYuttXYJFkkWyFJXF/+mCpHrui9HADzSmVcFSuDeiLd3Ndk59uZfVjGRc6taqHmLGk86B+9vM2m7+2M53ELe6ZnCt+CXlEffJZB3S8nuFOYDM7Euz5PsuU8zh5niCyhjyFdyyZfQyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.51.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO yjaykim-PowerEdge-T330.lge.net) (10.177.112.156)
	by 156.147.51.103 with ESMTP; 10 Sep 2026 01:15:59 +0900
X-Original-SENDERIP: 10.177.112.156
X-Original-MAILFROM: youngjun.park@lge.com
From: Youngjun Park <youngjun.park@lge.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	her0gyugyu@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] mm/swap: scan by cluster in find_next_to_unuse()
Date: Thu, 10 Sep 2026 01:15:52 +0900
Message-Id: <20260909161552.2335971-3-youngjun.park@lge.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909161552.2335971-1-youngjun.park@lge.com>
References: <20260909161552.2335971-1-youngjun.park@lge.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

find_next_to_unuse() walks every offset from 0 to si->max, and swapoff
restarts that walk on each retry, so the cost scales with the size of
the device rather than with the few slots the shmem and mmlist passes
could not free.  It has caused stalls before.

The flat walk predates the swap table.  Slot state now lives in a per
cluster table, and wait_for_allocation() stops all allocation before
try_to_unuse() runs, so a cluster that holds no slot in use stays that
way.  Skip such a cluster instead of reading all of its entries.

Fill a 1 TiB swap up to some amount, then swapoff.
What is left sits at the top of what was filled, so every slot below it
is free.  Medians over 11 pairs at 32 and 128 GiB, 3 pairs at 256 and
512.

	filled		swapoff
			old	new
	 32 GiB		 92.4ms	 66.3ms
	128 GiB		157.6ms	 94.4ms
	256 GiB		209.7ms	 63.8ms
	512 GiB		391.8ms	 73.4ms

old grows with how much was filled, new does not.

In the ordinary case swap still holds real data and swapoff spends its
time reading it back. it is tested 4 GiB on an 8 GiB device, where the scan
is 1.4% of try_to_unuse(), and there is no difference either way.

Commit dc644a073769 ("mm: add three more cond_resched() in swapoff")
answered those stalls with a cond_resched() every 256 offsets.  A walk
bounded by one cluster no longer needs that counter.  The loop now runs
at most SWAPFILE_CLUSTER times before it returns or reschedules, the
same bound swap_reclaim_full_clusters() already scans between
cond_resched() calls.

The scan end is clamped to si->max, so the walk stops there rather than
running into the masked tail of the last cluster.

ci->count is read without ci->lock, so READ_ONCE() marks the read for
KCSAN.  Allocation is already stopped, so the count can only drop, and a
slot stops being counted only after its folio has left the swap cache.
An empty cluster therefore holds nothing for try_to_unuse() to act on.

Signed-off-by: Youngjun Park <youngjun.park@lge.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Acked-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Baoquan He <baoquan.he@linux.dev>
---
 mm/swapfile.c | 43 ++++++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 0a3a3b2218c7..05d3408396f9 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -370,8 +370,6 @@ static void discard_swap_cluster(struct swap_info_struct *si,
 	}
 }
 
-#define LATENCY_LIMIT		256
-
 static inline bool cluster_is_empty(struct swap_cluster_info *info)
 {
 	return info->count == 0;
@@ -2787,7 +2785,9 @@ static int unuse_mm(struct mm_struct *mm, unsigned int type)
 static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 					unsigned int prev)
 {
-	unsigned int i;
+	struct swap_cluster_info *ci;
+	unsigned long i, end;
+	unsigned int ci_off;
 	unsigned long swp_tb;
 
 	/*
@@ -2796,19 +2796,36 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 	 * hits are okay, and sys_swapoff() has already prevented new
 	 * allocations from this area (while holding swap_lock).
 	 */
-	for (i = prev + 1; i < si->max; i++) {
-		swp_tb = swap_table_get(__swap_offset_to_cluster(si, i),
-					i % SWAPFILE_CLUSTER);
-		if (!swp_tb_is_null(swp_tb) && !swp_tb_is_bad(swp_tb))
-			break;
-		if ((i % LATENCY_LIMIT) == 0)
+	i = prev + 1;
+	while (i < si->max) {
+		ci = __swap_offset_to_cluster(si, i);
+		end = min_t(unsigned long,
+			    ALIGN_DOWN(i, SWAPFILE_CLUSTER) + SWAPFILE_CLUSTER,
+			    si->max);
+
+		/*
+		 * An empty cluster has no slot in use, so skip it whole.
+		 * A slot is uncounted only after its folio left the swap
+		 * cache, so there is nothing here for try_to_unuse() to act on.
+		 * Count only drops here, so a READ_ONCE() without ci->lock is
+		 * enough, unlike in every other cluster_is_empty() caller.
+		 */
+		if (!READ_ONCE(ci->count)) {
+			i = end;
 			cond_resched();
-	}
+			continue;
+		}
 
-	if (i == si->max)
-		i = 0;
+		ci_off = i % SWAPFILE_CLUSTER;
+		for (; i < end; ci_off++, i++) {
+			swp_tb = swap_table_get(ci, ci_off);
+			if (!swp_tb_is_null(swp_tb) && !swp_tb_is_bad(swp_tb))
+				return i;
+		}
+		cond_resched();
+	}
 
-	return i;
+	return 0;
 }
 
 static int try_to_unuse(unsigned int type)
-- 
2.48.1

