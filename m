Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B75E4611C9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389130; cv=none; b=OYbr2ExVjSmR402iPhMVZJ3JBbSPZ56zvoDW3wAHe2M0tSm2eQkxoPoc+h82doHWWO/7yqq7nRbNBI5wEKRP/CwxveeZRD2AeBG8f5OQXEboDGkWvZtFOyBp0i8dXH9N+TnpfTZfl5CUVOSWdERX6dllOH19+zTLBEa59WILH2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389130; c=relaxed/simple;
	bh=w0gztRkUfUOE/+G3kO+FMjzHwEfBAB20UzLM0QrOt9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJRHaBT6926vEEXuEyvOHv7H1KUac3I2kTzlRh12BzrQ2fNYH8ti+YMPasj/YsXrbPgLWv4Okry5rWW6HZ+GhN7fAOeFHSKGLfQR2RlMsEBuGOcVNqa33Pgm1IDVaJorREpKcg1+fe52lC5f5MaFTwJ/25hPo2z/ijAb7wYJL9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N9h+BqDN; arc=none smtp.client-ip=91.218.175.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N9h+BqDN"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=w0gztRkUfUOE/+G3kO+FMjzHwEfBAB20UzLM0QrOt9Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789389120; v=1; x=1789993920;
 b=N9h+BqDNu2H6KLMXdpMIXdLgPuFHyp95Bkge701twKjC4/Ib7B0+69PngqCU/zzAMUDuIkmE
 Foer+v+sMC0EmoxOhUWfpntEhbp8B+py4vPbufwTtv+ELhKFxV+OeLpTOEcaFNIpRTZbHjx1Axc
 4T7TZ4Qjboq10gF+2hNEvJDc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 95316f54d43a6e01;
	Mon, 14 Sep 2026 12:32:00 +0000
X-Mizu-Trace-ID: 95316f54d43a6e01
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
Subject: [RESEND v7 22/29] mm/mincore: report PMD swap-cache residency
Date: Mon, 14 Sep 2026 05:28:12 -0700
Message-ID: <20260914122950.3283997-23-usama.arif@linux.dev>
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

mincore_pte_range() reports every page under a huge PMD as resident. That
is wrong for a swapped-out one: mincore() would tell userspace that memory
it will have to fault in is already in core.

A PMD swap entry is only a compact encoding for HPAGE_PMD_NR slots, so
answer from the swap cache instead. One PMD-sized folio covering the range
makes every page resident exactly when that folio is uptodate; an empty
cache makes none of them; and if the folio was split while the entry stayed
in place, fall back to looking up each covered slot as mincore_swap() does
for a PTE swap entry.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/mincore.c | 47 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/mm/mincore.c b/mm/mincore.c
index c086836bc4bcc..1846c6f68ae63 100644
--- a/mm/mincore.c
+++ b/mm/mincore.c
@@ -85,6 +85,48 @@ static unsigned char mincore_swap(swp_entry_t entry, bool shmem)
 	return present;
 }
 
+#ifdef CONFIG_THP_SWAP
+static void mincore_pmd_swap(swp_entry_t entry, unsigned long addr,
+			     unsigned long end, unsigned char *vec)
+{
+	unsigned long haddr = addr & HPAGE_PMD_MASK;
+	unsigned long start = (addr - haddr) >> PAGE_SHIFT;
+	unsigned long nr = (end - addr) >> PAGE_SHIFT;
+	struct folio *folio;
+	enum swap_pmd_cache state;
+	int i;
+
+	state = swap_pmd_cache_lookup(entry, &folio);
+	if (state == SWAP_PMD_CACHE_HUGE) {
+		memset(vec, folio_test_uptodate(folio), nr);
+		folio_put(folio);
+		return;
+	}
+
+	if (state == SWAP_PMD_CACHE_EMPTY) {
+		memset(vec, 0, nr);
+		return;
+	}
+
+	/*
+	 * The PMD swap entry is only a compact encoding for consecutive swap
+	 * slots. If the PMD-sized swapcache folio was split, report residency
+	 * from the individual slots covered by this mincore() range.
+	 */
+	for (i = 0; i < nr; i++)
+		vec[i] = mincore_swap(swp_entry(swp_type(entry),
+						swp_offset(entry) + start + i),
+				      false);
+}
+#else	/* !CONFIG_THP_SWAP */
+static void mincore_pmd_swap(swp_entry_t entry, unsigned long addr,
+			     unsigned long end, unsigned char *vec)
+{
+	/* Nothing produces PMD swap entries without CONFIG_THP_SWAP. */
+	memset(vec, 0, (end - addr) >> PAGE_SHIFT);
+}
+#endif	/* CONFIG_THP_SWAP */
+
 /*
  * Later we can get more picky about what "in core" means precisely.
  * For now, simply check to see if the page is in the page cache,
@@ -171,7 +213,10 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 
 	ptl = pmd_trans_huge_lock(pmd, vma);
 	if (ptl) {
-		memset(vec, 1, nr);
+		if (pmd_is_swap_entry(*pmd))
+			mincore_pmd_swap(softleaf_from_pmd(*pmd), addr, end, vec);
+		else
+			memset(vec, 1, nr);
 		spin_unlock(ptl);
 		goto out;
 	}
-- 
2.53.0-Meta

