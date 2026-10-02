Received: from mta1.migadu.com (out-80.mta1.migadu.com [95.215.58.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DA43B101C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935022; cv=none; b=AoNYJ3on6sFRZgC6ewXmN5YTZa1nowWpItJPu24NYSyrj4kliHI5q+PufZ/aCFobnaq2hcwIFnGaI7SKTWlYRaTOhUX17LNYnI2UYzNvwB4OtUFuHtHZTL7VEQPEA1ogxncZjhmlCpCMX7VCHelvAmVx/VTfeNoAYTtfQ9Ok1qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935022; c=relaxed/simple;
	bh=U7fl/g2rQtBLEOOrRTOeLDCwF2LzhxQL9fohkaqezco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KlTXjlHbc0evOnygdGhZ4L/0+JWjA0mFckzRJFgi56S3Gl2f29KUf8P1HoReeJoDUCQb+JxOgL9NabaX2aoJjaxDKQzRqlm3MWmi/tEhVa2DASd6aVC4WXv7MHTWJ3DCoZIPc49749ZyFKDgOb8wnlWn8Ei7W/Um7hiVVmNPwU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V+HGp6iu; arc=none smtp.client-ip=95.215.58.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V+HGp6iu"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U7fl/g2rQtBLEOOrRTOeLDCwF2LzhxQL9fohkaqezco=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790935018; v=1; x=1791539818;
 b=V+HGp6iuRhxNJlToyyu4Db5rTKQ0jAz7Rn/JbvJ5z05atfpJfZbnbUv/vTkap/DEdJbvXJMi
 2m1c2ACvb3JW3sh3jhhVcxiczSrkIdiSP8VUy2B1gSI5dFBt54WgUhu2OT7RHP9BryHN0/taxCz
 Q84662Jr5/kV7aIUeGEVhtR0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 780e5e8d7edcc9b9;
	Fri, 02 Oct 2026 09:56:57 +0000
X-Mizu-Trace-ID: 780e5e8d7edcc9b9
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
Subject: [PATCH v8 16/30] fs/proc: account PMD swap entries in smaps
Date: Fri,  2 Oct 2026 02:52:30 -0700
Message-ID: <20261002095503.3585565-17-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002095503.3585565-1-usama.arif@linux.dev>
References: <20261002095503.3585565-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smaps_pmd_entry() derives a page from a non-present PMD and gives up if
it cannot. A PMD swap entry carries no PFN, so a swapped-out THP is
missing from both Swap and SwapPss.

The slots of a PMD swap entry can have different swap reference counts,
so SwapPss has to be computed one slot at a time rather than divided
once. Factor that loop out of smaps_pte_entry() and call it from both
levels, then return early: a swapped-out THP is not resident and must
not be added to AnonHugePages or Rss.

While touching PMD softleaf accounting, match the PTE path and treat
device-private PMD entries as fake-present. This lets smaps use
mapcount-based PSS and private/shared accounting instead of treating
them like migration entries.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 fs/proc/task_mmu.c | 41 ++++++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 24425e2308951..97c3fd7acf15d 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -957,6 +957,25 @@ static void smaps_pte_hole_lookup(unsigned long addr, struct mm_walk *walk)
 #endif
 }
 
+static void smaps_account_swap(struct mem_size_stats *mss,
+			       softleaf_t entry, unsigned long nr_pages)
+{
+	mss->swap += nr_pages << PAGE_SHIFT;
+	do {
+		int swapcount = swp_swapcount(entry);
+
+		if (swapcount >= 2) {
+			u64 pss_delta = (u64)PAGE_SIZE << PSS_SHIFT;
+
+			do_div(pss_delta, swapcount);
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
@@ -978,18 +997,7 @@ static void smaps_pte_entry(pte_t *pte, unsigned long addr,
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
+			smaps_account_swap(mss, entry, 1);
 		} else if (softleaf_has_pfn(entry)) {
 			if (softleaf_is_device_private(entry))
 				present = true;
@@ -1022,8 +1030,15 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
 	} else if (unlikely(thp_migration_supported())) {
 		const softleaf_t entry = softleaf_from_pmd(*pmd);
 
-		if (softleaf_has_pfn(entry))
+		if (softleaf_is_swap(entry)) {
+			smaps_account_swap(mss, entry, HPAGE_PMD_NR);
+			return;
+		}
+		if (softleaf_has_pfn(entry)) {
+			if (softleaf_is_device_private(entry))
+				present = true;
 			page = softleaf_to_page(entry);
+		}
 	}
 	if (IS_ERR_OR_NULL(page))
 		return;
-- 
2.53.0-Meta

