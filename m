Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904129;
	b=0OBGKC0U6qQJIq7qFbM3nUvzfNyfGTde9CfQn8kawIAd+pvmpCtkqTeccNkvnZqhwCRs
	 GyV1be3LBDt6FfnioM2MVinC+jH2tbzWru2axNL6uDnYYAFhwXM4UNriQ+htWOTZocJSa
	 JOg+xtAKvq7DiQiLFaozCjROHyxQU5VqyBtGBhtek8BYpB+CenHgbJTYCRpAHPLtWxam5
	 csXFRTm7KdU6OArh9vnaVMORnYU7OJsnY6xZg9ks4Zwpr76ghBhdL1sZnHCx/sMkRHXTM
	 OkoEPIoWYtY8q9LaV94wtq9VyRdhsxe9qapWiCmJ1P0wCYbmTy4nxY/NpwPBICbRZbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904129;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=64IaiU1Jn8/to2KlNcEKMRMIAfHn34Xc+y2Zc/87onE=;
	b=luDmHZzrcxghQRstEFJq+UnZlki3g5G1niMHQu/z+jBpDgGCEIH0rtzrU9cGc0HHjlAf
	 JKyWJpYiZJBNOAdXsVVBwlxXjplzXte9KHharwZK0q0FGQ3lp1dI9jW4+A5gkOAj0mPZy
	 xU9vzOx0w1DFw6oQlUWcS2KTTufNfp1QaaUyEWQiIGipIlTVgsuzmZ7sjh2BiJzyfYsmJ
	 p6Mdy6hddoFAVAOvuLtkOWpyoNiq+J7yttwuOc+ehZOKHAXSZyxyMg/B2wQk69k5cS/Wl
	 G1j+dT9NcWdvMurS65OdnHDhXG1JPhDcmhJuQCKEy4x4m+zX+N4enWwlDz1KRxWpPQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VczYSozw;
	arc=none smtp.remote-ip=95.215.58.107
Received: from mta1.migadu.com (out-107.mta1.migadu.com [95.215.58.107])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448EC606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 448EC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VczYSozw
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=53KC29oKTGdq1sHS30FhbmUhH+DwEHBLzotfAuJMBTQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904127; v=1; x=1794508927;
 b=VczYSozwZEpf3GQl0f+OdB/qMZ/Kg6H9n0kzZNL2pWhn6e6B+eMKDhmQSlhXd4as1LTLdeP+
 pNFyZgk/twuKr44bq1nozMOOt6GIexFThn4EuD8kaZOZOli7tCvmV6VXKWaN163tgpOXLgbWPWq
 mMyoBpaEHpBR6w+pF8PDer1I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id c2998befc35801a0;
	Thu, 05 Nov 2026 18:42:07 +0000
X-Mizu-Trace-ID: c2998befc35801a0
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
Subject: [PATCH v9 25/32] mm/mincore: report PMD swap-cache residency
Date: Thu,  5 Nov 2026 10:39:09 -0800
Message-ID: <20261105183940.2236717-26-usama.arif@linux.dev>
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
index 0fe50f8a7e629..bc144118e039e 100644
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

