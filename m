Received: from mta0.migadu.com (out-120.mta0.migadu.com [91.218.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC04471D0B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389107; cv=none; b=ks7l1eYGOqTjl5kiYP8VpbhpfNMYjWiLbsGxB4vJA3nucrK0TbI3VEahzeqv5dHAldT1NaBTyBsH0a9wVTF9BVZUFwuLQRsGTVpAlrNLIyFCn5Q9Z7xbWw+SjyPjqPZY3Y+s1BAm0k/hLB4JrPuTzhyKdOwqaxfo3YTLWLNuz6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389107; c=relaxed/simple;
	bh=ENO5TWLGQORFi4I6GbjA3CLf4xd6bsmKP3WV+1rfFXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUv8zbZDMhsXk80VQrsckGCjPyC0XdDC4dkvZu8bWmeiuTmMks7wdwo4XY9c7TyUa1Zxne8XXdrqjeXiO3GMfzBPYmM8+MoHipZ4Le78Cjp15yFrUigJzEJ4bKLIJYEh0SEebPJL7AEm+ePm88gXxTeHIlq4tXryVcneK3ov3bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h3QkhiwX; arc=none smtp.client-ip=91.218.175.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h3QkhiwX"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ENO5TWLGQORFi4I6GbjA3CLf4xd6bsmKP3WV+1rfFXs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789389099; v=1; x=1789993899;
 b=h3QkhiwXYcTZIuHPfBY/OApK3oAnJPSf4MiaDXPLEk9gGD9P6GFCYLAoIXZBL/jB3dUBs7VG
 FtFp5iyFFU+RiwZ8UliwaICS2TK2uZ70h4jBqnHRXIdK82c5JEM0SWi/byRUAi8R5q1edN5041a
 nF94ai5PgXcbzkDYzG9wWh48=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id da37515ffb07b15a;
	Mon, 14 Sep 2026 12:31:39 +0000
X-Mizu-Trace-ID: da37515ffb07b15a
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [RESEND v7 15/29] fs/proc: account PMD swap entries in smaps
Date: Mon, 14 Sep 2026 05:28:05 -0700
Message-ID: <20260914122950.3283997-16-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914122950.3283997-1-usama.arif@linux.dev>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smaps_pmd_entry() derives a page from a non-present PMD and gives up if it
cannot. A PMD swap entry carries no PFN, so a swapped-out THP is accounted
nowhere: its bytes show up in neither Swap nor SwapPss, and VmSwap silently
loses them.

The slots of a PMD swap entry can have different swap reference counts, so
SwapPss has to be computed one slot at a time rather than divided once.
Factor that loop out of smaps_pte_entry() and call it from both levels,
then return early: a swapped-out THP is not resident and must not be added
to AnonHugePages or Rss.

pagemap needs no equivalent change - it already emits PM_SWAP and
type | offset+idx for a PFN-less softleaf entry - but its
thp_migration_supported() gate answers a different question than the decode
requires, so use pmd_is_valid_softleaf() there instead.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 fs/proc/task_mmu.c | 42 ++++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 24425e2308951..aa3f4d54a8580 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -957,6 +957,27 @@ static void smaps_pte_hole_lookup(unsigned long addr, struct mm_walk *walk)
 #endif
 }
 
+static void smaps_account_swap(struct mem_size_stats *mss,
+			       softleaf_t entry, unsigned long size)
+{
+	unsigned long nr_pages = size >> PAGE_SHIFT;
+
+	mss->swap += size;
+	do {
+		int mapcount = swp_swapcount(entry);
+
+		if (mapcount >= 2) {
+			u64 pss_delta = (u64)PAGE_SIZE << PSS_SHIFT;
+
+			do_div(pss_delta, mapcount);
+			mss->swap_pss += pss_delta;
+		} else {
+			mss->swap_pss += (u64)PAGE_SIZE << PSS_SHIFT;
+		}
+		entry.val++;
+	} while (--nr_pages);
+}
+
 static void smaps_pte_entry(pte_t *pte, unsigned long addr,
 		struct mm_walk *walk)
 {
@@ -978,18 +999,7 @@ static void smaps_pte_entry(pte_t *pte, unsigned long addr,
 		const softleaf_t entry = softleaf_from_pte(ptent);
 
 		if (softleaf_is_swap(entry)) {
-			int mapcount;
-
-			mss->swap += PAGE_SIZE;
-			mapcount = swp_swapcount(entry);
-			if (mapcount >= 2) {
-				u64 pss_delta = (u64)PAGE_SIZE << PSS_SHIFT;
-
-				do_div(pss_delta, mapcount);
-				mss->swap_pss += pss_delta;
-			} else {
-				mss->swap_pss += (u64)PAGE_SIZE << PSS_SHIFT;
-			}
+			smaps_account_swap(mss, entry, PAGE_SIZE);
 		} else if (softleaf_has_pfn(entry)) {
 			if (softleaf_is_device_private(entry))
 				present = true;
@@ -1019,9 +1029,13 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
 	if (pmd_present(*pmd)) {
 		page = vm_normal_page_pmd(vma, addr, *pmd);
 		present = true;
-	} else if (unlikely(thp_migration_supported())) {
+	} else {
 		const softleaf_t entry = softleaf_from_pmd(*pmd);
 
+		if (softleaf_is_swap(entry)) {
+			smaps_account_swap(mss, entry, HPAGE_PMD_SIZE);
+			return;
+		}
 		if (softleaf_has_pfn(entry))
 			page = softleaf_to_page(entry);
 	}
@@ -2000,7 +2014,7 @@ static int pagemap_pmd_range_thp(pmd_t *pmdp, unsigned long addr,
 			flags |= PM_UFFD_WP;
 		if (pm->show_pfn)
 			frame = pmd_pfn(pmd) + idx;
-	} else if (thp_migration_supported()) {
+	} else if (pmd_is_valid_softleaf(pmd)) {
 		const softleaf_t entry = softleaf_from_pmd(pmd);
 		unsigned long offset;
 
-- 
2.53.0-Meta

