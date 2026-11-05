Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904103;
	b=ug5ahqp5BswuowKWTzreALtPT+dzDK7GsPLMiYUYaYUbaNaCk/eV1xJdjmOrr61F3weH
	 1G9Me75yXb9tUPnTqTd2Am8rJKvJZyAck/VdaCZ5w24wPV5exVyawrvgAtEZCO2UPcwPJ
	 Urs1DeY08cFV0rX98bnyvsmsfIhKa+62CnC4B/dETEM97cDj0qPXuwyipAqwQWVXzCivb
	 4CENJlrFecZJBPr2OKLQ/JC5LBsnC2KK81B/rscmBpaMO0VZI49iaL9HkrYeDftHGg+WN
	 OYR0PYL2Amff74g3+nOaKcxWqf11nMDU/FmMEzNs8FWUVk21tM35xmGT3kxdoKQYSWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904103;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iTkQgAFQb13D2NQe7Ymv03xi+ycIuHXZDBueXOZ6laQ=;
	b=u0R1SzCurvFRopeO+gNxfdJvTeayod7nRlszSJDYHjwxrmZeD1iUP1qHI05tdeHE7sm7
	 qYwICaklfzl4F6uV6nNg7fb1xYuU/HncuphNHsFkW5ILRnU8euqqVyc3mkGG07MAGkTB0
	 8IsTDhvPCqPuj1c/UZyYBzC/23FLxUmwrHBW1fkvePIOvAQFiA1aWBXuGWe/QgLEOTjBT
	 DOl25+B6ri6b931AWquXixD0QqKAvCCOu5+E7uH+B3B/ZIXKzSQ9Uiu4ojof5Vkdm3X2g
	 goo+AUOjWHb3X2pExSlnziwYw0Q1SSgC3jaIp4WxXkBrA3YmV8UVuRsREh2GCqAlmlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=w93hL3eD;
	arc=none smtp.remote-ip=95.215.58.1
Received: from mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FEE606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49FEE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=w93hL3eD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gtwkzCCRR5a8LFYW6Q8g6wa92+pnZlz0qa19Rbk0Nmg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904100; v=1; x=1794508900;
 b=w93hL3eDrok5topCpNv//X825qTYwNznSaJBucz2j52W+US+5F78b2P4YXLUN88+5HHSaIZq
 K2EStH73muaq7TQICs0BvFKCt5NeGO+Nj5zwJHQGyQTX3EmJUAHHaYKD6HUsx3UXknFM2cyWs9c
 xzQWfbNrn4tRnvyy4enkz31k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 319861037ae1e3f7;
	Thu, 05 Nov 2026 18:41:40 +0000
X-Mizu-Trace-ID: 319861037ae1e3f7
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: chenhuacai@kernel.org,
	ying.huang@linux.alibaba.com,
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
Subject: [PATCH v9 18/32] fs/proc: account PMD swap entries in smaps
Date: Thu,  5 Nov 2026 10:39:02 -0800
Message-ID: <20261105183940.2236717-19-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183940.2236717-1-usama.arif@linux.dev>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
index 22361607020d1..bfe9d6af76d5a 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -965,6 +965,25 @@ static void smaps_pte_hole_lookup(unsigned long addr, struct mm_walk *walk)
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
@@ -986,18 +1005,7 @@ static void smaps_pte_entry(pte_t *pte, unsigned long addr,
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
@@ -1030,8 +1038,15 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
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

