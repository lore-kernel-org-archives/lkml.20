Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904127;
	b=fkUxJZRMuku+ZIZChxUdz1zN0Id+YjF+reWph0brHzzH2i6kKoi8sc5lN1LKnhR6vLA4
	 54/nEGps3V4oN0Uj9MRQXz/H6OwaCZSYr/pQIQ8VD78MBacfCbTBoN6Z2+q4MUYslABq9
	 lGuhmYFSRYIXi2jssfI2WqbZixrRPKSmb6p33dRtgbtuiU0cseB4O99IQ/tRLpDwmuS6O
	 QB8LdlDWdy8fcwajiisJM7T/NrB0IxUB0CtVb22jGj6/vtIGhcn21a+tz8ra0PmFGEMQs
	 AU/9aH0JJHszwToChe5fBtPg/tD+ddfQIwcxLpVp3L8hwrzPbwhQ2QZs2rky67JzXhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904127;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z0fJm4CjdrCfT5IXpHPP6Zmi1Pfjwt/oCSIBuUnP62M=;
	b=T0cRioQRY0BjoG5jIbVGkbq7PmCoazInFF0IIISqsEgAQxuRhFNv5j2GKZD8WMjXpCyd
	 dPHS0rpkR5inbrnDHh6Amb/AJZiCH8wgRMvx+oYZ6kJZlNAUz4le1VZ/oNPtSzqomiThp
	 ZL8x+Ub58G7gBIMeFGIc34tjCXoJsnwxL2tFX3hxYjgexqaWoQuzIIin3zmLtNukBxLLB
	 YCKHK1tR+bCB32XSwYw9fZ6YAPA1+qoSvK3ni5R/KzoqX/Bx0Ps2AzwGlCnd11ECumfYh
	 8Xqy0VHbawu8vBWXLr3rECNOx+a7+Sqoo0iUgecV/4FmtKgeXNWKokfF20stlD83lqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=L6jwir4L;
	arc=none smtp.remote-ip=91.218.175.22
Received: from mta0.migadu.com (out-22.mta0.migadu.com [91.218.175.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130BC606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 130BC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=L6jwir4L
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4MFauMfvLoZ0FPm6jb4sWsILjkooRhf2DKKgeqRebo8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904125; v=1; x=1794508925;
 b=L6jwir4LMQEAZ22XcDmNgjUpAJKU1ky/Q6gVZb3mmTm5P9C0Elzoh0g7VQ/+oBUI5z7cxeFN
 8anikLSWjGeRSMpePBqmDgoLirtXghAi4D7TG15qBMQEYl8rEn4fjvMWT+m+3uK8c1XnW/SQ+HX
 XDoVeJfEN5FnTSOPh6ytR/3o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 6e1d522fd8af9a39;
	Thu, 05 Nov 2026 18:42:04 +0000
X-Mizu-Trace-ID: 6e1d522fd8af9a39
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
Subject: [PATCH v9 24/32] mm/madvise: keep PMD swap entries whole for MADV_GUARD_INSTALL/REMOVE
Date: Thu,  5 Nov 2026 10:39:08 -0800
Message-ID: <20261105183940.2236717-25-usama.arif@linux.dev>
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

Both callbacks test bare pmd_trans_huge(), which is false for a PMD swap
entry, so they return without consuming the PMD and walk_pmd_range() splits
it - only for the PTE callbacks to find the range populated and abort, or
to find no guard markers and do nothing.

Both already short-circuit at PMD level for a present THP. Do the same for
a swapped-out one: it is just as populated, and just as free of guard
markers.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/madvise.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 576707e303cf2..f7f17efdd926d 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1109,8 +1109,12 @@ static int guard_install_pmd_entry(pmd_t *pmd, unsigned long addr,
 {
 	pmd_t pmdval = pmdp_get(pmd);
 
-	/* If huge return >0 so we abort the operation + zap. */
-	return pmd_trans_huge(pmdval);
+	/*
+	 * If huge return >0 so we abort the operation + zap. A PMD swap entry
+	 * is a swapped-out THP: also populated, and splitting it here would
+	 * only demote it before the zap.
+	 */
+	return pmd_trans_huge(pmdval) || pmd_is_swap_entry(pmdval);
 }
 
 static int guard_install_pte_entry(pte_t *pte, unsigned long addr,
@@ -1249,8 +1253,12 @@ static int guard_remove_pmd_entry(pmd_t *pmd, unsigned long addr,
 {
 	pmd_t pmdval = pmdp_get(pmd);
 
-	/* If huge, cannot have guard pages present, so no-op - skip. */
-	if (pmd_trans_huge(pmdval))
+	/*
+	 * If huge, cannot have guard pages present, so no-op - skip. The same
+	 * is true of a PMD swap entry, which must not be split just to discover
+	 * there is nothing to remove.
+	 */
+	if (pmd_trans_huge(pmdval) || pmd_is_swap_entry(pmdval))
 		walk->action = ACTION_CONTINUE;
 
 	return 0;
-- 
2.53.0-Meta

