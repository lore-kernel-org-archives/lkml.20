Received: from out28-103.mail.aliyun.com (out28-103.mail.aliyun.com [115.124.28.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451D23769E7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940043; cv=none; b=Q0yuSg9ZgWQkxsen7PasSG+ndhA84N/pFkXgPmEOgyitBGF1+GIAwfZJHTarUAyF4GgZ5LRYZ2M+Hxi4U9iWpb1pOxBeDl+gSfn2oWmOQHZhalOHsA2yhdjv+RuM6+IxF5TZU+f12peBcbj8Cj7ZWyfIcBCW49C6hW1J1YUX4Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940043; c=relaxed/simple;
	bh=5453fASl0WEGmAEfrSQYq3vWQ3pezdx3MV8eBjtTQko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=biA7p5YPb0pbHpG0Ph0DmgjxMrmyHnXXeI/AqV6CjqwQnpluITQk3+LwbL1FP9PZSmmxuen8n9sv4UvSEcUIGQJAAq1/zAn2ztl1JcFCw8c3SjhjsWMl/jW6UTXqrdvpGw7aXJNFgXkYNAoMLaKvkOHWLKSYDryelHoYxWZB5wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436956|-1;BR=01201311R611S83rulernew998_84748_2000303;CH=blue;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.172705-0.00782085-0.819474;FP=18101722540256330983|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037032089;MF=yehuaisheng@open-hieco.net;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---.j9KD.hT_1788940023;
Received: from centos9p-03(mailfrom:yehuaisheng@open-hieco.net fp:SMTPD_---.j9KD.hT_1788940023 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 09 Sep 2026 15:47:11 +0800
From: Huaisheng Ye <yehuaisheng@open-hieco.net>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	linux-mm@kvack.org
Cc: david@kernel.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Huaisheng Ye <yehuaisheng@open-hieco.net>
Subject: [PATCH] mm/hugetlb: account for allowed nodes when gathering surplus pages
Date: Wed,  9 Sep 2026 15:46:42 +0800
Message-ID: <20260909074642.7308-1-yehuaisheng@open-hieco.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hugetlb reservations are accounted globally, but hugetlb_acct_memory()
also verifies that the current cpuset and MPOL_BIND policy contain enough
free huge pages to add a new reservation.

gather_surplus_pages() calculates its allocation shortfall from the global
free and reserved counters. If the global pool has enough free pages, but
those pages reside outside the nodes allowed by the task, it allocates no
surplus pages. The subsequent allowed_mems_nr() check then rejects the
reservation and mmap() fails with ENOMEM, even when
nr_overcommit_hugepages permits allocating surplus pages on the allowed
nodes.

Calculate both the global shortfall and the shortfall within the allowed
nodes, and allocate the larger of the two. Include surplus pages allocated
outside hugetlb_lock in both calculations when rechecking after reacquiring
the lock. These pages are constrained by alloc_nodemask, so they satisfy
both shortages.

Easy way to reproduce this issue with 2+ NUMA nodes system:

  # echo 0 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepage
  # echo 3 > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages
  # echo 1 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_overcommit_hugepages
  # cd tools/testing/selftests/mm
  # numactl --membind=1 ./hugetlb-mmap 2 21
  TAP version 13
  # [INFO] detected hugetlb page size: 2048 KiB
  # [INFO] detected hugetlb page size: 1048576 KiB
  # 2048 kB hugepages
  1..2
  # Mapping 2 Mbytes
  Bail out! mmap: Cannot allocate memory (12)
  # Planned tests != run tests (2 != 0)
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0

This fixes hugetlb mappings when, for example, a task runs with
MPOL_BIND on Node 1 while the existing free huge pages are on Node 0.

Similar issue also could be found in ltp if the free pages of global pool
reside outside the nodes allowed by the application.
  # cd ltp/testcases/kernel/mem/hugetlb/hugemmap/
  # numactl --cpunodebind=0 --membind=1 ./hugemmap10

Signed-off-by: Huaisheng Ye <yehuaisheng@open-hieco.net>
---
 mm/hugetlb.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 7857728457952..b078953099fe5 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -116,6 +116,7 @@ struct mutex *hugetlb_fault_mutex_table __ro_after_init;
 
 /* Forward declaration */
 static int hugetlb_acct_memory(struct hstate *h, long delta);
+static unsigned int allowed_mems_nr(struct hstate *h);
 static void hugetlb_vma_lock_free(struct vm_area_struct *vma);
 static void hugetlb_vma_lock_alloc(struct vm_area_struct *vma);
 static void __hugetlb_vma_unlock_write_free(struct vm_area_struct *vma);
@@ -2224,6 +2225,19 @@ static nodemask_t *policy_mbind_nodemask(gfp_t gfp)
 	return NULL;
 }
 
+/*
+ * Reservations are globally accounted, but they must also be backed by free
+ * pages on nodes allowed by the current cpuset and MPOL_BIND policy.
+ */
+static long surplus_pages_needed(struct hstate *h, long delta, long allocated)
+{
+	long global_free = (long)h->free_huge_pages + allocated;
+	long allowed_free = (long)allowed_mems_nr(h) + allocated;
+
+	return max((long)h->resv_huge_pages + delta - global_free,
+		   delta - allowed_free);
+}
+
 /*
  * Increase the hugetlb pool such that it can accommodate a reservation
  * of size 'delta'.
@@ -2246,7 +2260,7 @@ static int gather_surplus_pages(struct hstate *h, long delta)
 		alloc_nodemask = cpuset_current_mems_allowed;
 
 	lockdep_assert_held(&hugetlb_lock);
-	needed = (h->resv_huge_pages + delta) - h->free_huge_pages;
+	needed = surplus_pages_needed(h, delta, 0);
 	if (needed <= 0) {
 		h->resv_huge_pages += delta;
 		return 0;
@@ -2277,11 +2291,10 @@ static int gather_surplus_pages(struct hstate *h, long delta)
 
 	/*
 	 * After retaking hugetlb_lock, we need to recalculate 'needed'
-	 * because either resv_huge_pages or free_huge_pages may have changed.
+	 * because either resv_huge_pages or the free page counts may have changed.
 	 */
 	spin_lock_irq(&hugetlb_lock);
-	needed = (h->resv_huge_pages + delta) -
-			(h->free_huge_pages + allocated);
+	needed = surplus_pages_needed(h, delta, allocated);
 	if (needed > 0) {
 		if (alloc_ok)
 			goto retry;
-- 
2.52.0

