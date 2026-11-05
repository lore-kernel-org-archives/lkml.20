Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904144;
	b=J+V+deTT9gTKJLR3ftI4D9JLLFXNXpfgR4oX38qDs4qVtbzWHhSLBqdSg3z15xHQpESu
	 xBZoD1luEu8lD8k14jfW9GrPas8G4p6Co9pGi4YZt/Kp4inactl6ZsQnWKqVG/m7YX/go
	 fW5/+MyT7Ycp+SGiHD2xgqIl5bI+rOA+JT5C17aMBMlVPDypN19lGWQFE4kTg4v0ftuVg
	 Tqj1Wf3w3NlnIuJPDm+Iydt44q8nKE0B9nhPPHrtvOazqyGM3zCLkUHKj73dmy4X/E5qv
	 Dx5Jos8Yp91FjZYrSZYRF2qyNluchZSraD8u/BN5km7aIDbQc6Ld0bwk+3GrsOUzEPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904144;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3rveXys3ZDi6PVgA/epR1hrpD6HRU61mHGBa3cRD2j0=;
	b=iz+KQ6h+DIVQRZEha1EizXmEnyV1AWk/FEY1cFNxwkPm4NAUP7lmk8P8KrMjgWsReZ/L
	 lqHDWywxhOJny1ZGkBVJ7orI03j4JtW9SCNzZn7ZRWWyanARHU7Jyfl+RSngSu3IJX07E
	 +XZgahG7Bj2jzqA7o/iAyqjBLt3cnThchaYmsfXezNu2D6oyxD3evDzEj6vML6qCZHeEw
	 cFcbjzIDeZ8+cWb3agDQ/fWQV5VPq1LkRuuq6oH/J3ek8kUZvbEWMTnXFBwCw5B8/Btqj
	 CSihZMPA1IZKcBiIQ28x63zV5GHUP8CtC1jGmnZVZDX4n5FUy6kVughR82c8WwuiWBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K0rI0UM2;
	arc=none smtp.remote-ip=95.215.58.170
Received: from mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773B9606D82C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 773B9606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K0rI0UM2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VFZ2vxQ1RyBM+AHfk9Z1D4P0na8AkP2wtBSDmYtWTbM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904141; v=1; x=1794508941;
 b=K0rI0UM27/1GSwUGbyRi5b3mKDlk95uXE0g7uVRcIJd1xFApXnGo9OXqD5gQkUQhKXXXFfc+
 Vr2rGNxiAFYlXu510cE7UoP1JpuCv2PPXg2M1xgGVdWH0JHANZ8/bVpqCWqYQRpYKCHzlVbBJ+v
 s/K60K7Srf4LhQazh2voI3sk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 09cff266752e68e4;
	Thu, 05 Nov 2026 18:42:21 +0000
X-Mizu-Trace-ID: 09cff266752e68e4
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
Subject: [PATCH v9 29/32] mm: don't PTE-batch a swap-in over a hardware-poisoned subpage
Date: Thu,  5 Nov 2026 10:39:13 -0800
Message-ID: <20261105183940.2236717-30-usama.arif@linux.dev>
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
index dedcec3cfca6e..47bba4695d855 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5143,7 +5143,14 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
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
+	    !folio_has_any_hwpoisoned_page(folio)) {
 		const int nr = folio_nr_pages(folio);
 		const unsigned long idx = folio_page_idx(folio, page);
 		unsigned long folio_start, folio_end;
-- 
2.53.0-Meta

