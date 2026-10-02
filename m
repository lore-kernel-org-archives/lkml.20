Received: from mta0.migadu.com (out-230.mta0.migadu.com [91.218.175.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4345484243
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935057; cv=none; b=LcrhQNLFUdaoab92wROKVwojPImLpYYUSTdT1Y0+LZBzLnLqYr9jfxOIYDlOsIlazN1j1AXB6y/tc2Bwh5lcjsoPNw1jNprhOH/WJ5uHqfjK79HniI8B4DFym/cOr2ya2W66dblyH+nT6fANTmVNdaEbwAFFOe7mAh3VjlbbGdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935057; c=relaxed/simple;
	bh=b+tkZeQJpq6th21l2hoOsDbnBBxFt3Z2ambcft4iB68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRgyaaVk23hjH58SYdiPoTXtJc3NKmZ4m3vLHCZweY7b95gURmzfLd1bIMIsMU8oljH6xqwtvnxpaAFKxZ4EtysQkUuvYjN2bQiZz0JHm3YCEQHUK7zL8U2ytOibvIrb9yrgjAa7V21cJEiTOc+DggNXKpjd6Sdeqrqe8/lUyck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NTZ8NaY0; arc=none smtp.client-ip=91.218.175.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NTZ8NaY0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=b+tkZeQJpq6th21l2hoOsDbnBBxFt3Z2ambcft4iB68=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790935053; v=1; x=1791539853;
 b=NTZ8NaY0BLYSU29hWiPClz3kmeT3yI2pYrYNuQg+uu671WgUCJut6TFXOatc5nWYMB4vEjB0
 Ia5JYsGg0rR2gPl1AvPiaemApoAZnL02nPtTg+N2m2jBNSQiCIjL8nsQGAgn6eQiTLl1E0/PrpX
 oBeDKciqxvMgL5DDI/1Gy3Cw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id adb5c5ded8e6abd2;
	Fri, 02 Oct 2026 09:57:33 +0000
X-Mizu-Trace-ID: adb5c5ded8e6abd2
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
Subject: [PATCH v8 27/30] mm: don't PTE-batch a swap-in over a hardware-poisoned subpage
Date: Fri,  2 Oct 2026 02:52:41 -0700
Message-ID: <20261002095503.3585565-28-usama.arif@linux.dev>
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

do_swap_page() checks PageHWPoison() on the faulting page, but the
large-folio batching path then maps the rest of the folio without looking
at the other subpages. A poisoned subpage that is not the one being faulted
gets mapped anyway, and the fault that would have reported it never
happens.

Skip batching for such a folio and let each page take its own fault, where
the existing check catches it. Test every subpage rather than the
folio-level PG_has_hwpoisoned: memory_failure() sets PageHWPoison() on the
subpage before it acquires the folio lock, which we hold here.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/memory.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index c0ad446d0cea4..428a156ae15f7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5030,7 +5030,14 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	page_idx = 0;
 	address = vmf->address;
 	ptep = vmf->pte;
-	if (folio_test_large(folio) && folio_test_swapcache(folio)) {
+	/*
+	 * Scan every subpage rather than testing the folio-level
+	 * PG_has_hwpoisoned: memory_failure() sets PageHWPoison on the subpage
+	 * before it takes the folio lock, and we hold that lock, so the
+	 * folio-level flag can still be clear here.
+	 */
+	if (folio_test_large(folio) && folio_test_swapcache(folio) &&
+	    !folio_has_hwpoisoned_subpage(folio)) {
 		int nr = folio_nr_pages(folio);
 		unsigned long idx = folio_page_idx(folio, page);
 		unsigned long folio_start = address - idx * PAGE_SIZE;
-- 
2.53.0-Meta

