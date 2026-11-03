Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692899;
	b=fOWbvA0SVcD9S6S+tEQkhLGf4kws2yt7MpsokcZtISMU7fnV5XQonxT8NLYnsdvzfKwm
	 IGJsSMvRsg+r1PL6UB00Wu7+Ubnv8L3TrxZaLcdtjR2s4zbDbk1NOvRKh1XPoxkhtuMHa
	 8Zkny1ROg1W6I235aHYfxFKVcY5qhDDeaV53fTYjSxE9EB+L+nPpLCBRlmo2lrXJFpapX
	 11+NPDu7Vs9Hd8modb42jVs2pBpJA5cf5EzKEHkdaBvYvBk/S+vpvEww0BJeMGsK8PHep
	 ssBiZWcP5/WPmY9lm3VIyWR8R0wsMh2WqVTeUcB3SezpvjxpPDDyVhZlLvFt477077Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692899;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JYQyQkhetD6ZOaLMew7rXre3mg1MOm9HF6woZrkOd8Q=;
	b=urvCisqTx9Q3UxIgDwyXcCoysG+NgirKNdZu/fpyXUE9ANQ38fVky64WLyQ2+HocpUnI
	 141BWP9O7pqcD2ZAiNAy/gpzHDmCOPlLTUDD4NmhwAk8sdKYe+d9C6jK45V5ObHOssKdf
	 Hf2WPNw0JDuzvxQ+pIRbgcDtdgjy1yXE8C4KLxt35JRV+i4EMqxWtt3XyP/XZbZc0/Ta1
	 kV2ihTQfRKidfndgWdORTtsbLW8qmLEQPPjim/Ba3Fp2uCGc0sTCD1MCKP9xp/mVU4bdA
	 sxyOlL9CIitfrp4Dot/THD7J9woqG/LdXoobqqRwFTg9Rmq4mpBGsJAWDArNwpjT6eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uoMofLeV;
	arc=none smtp.remote-ip=91.218.175.110
Received: from mta0.migadu.com (out-110.mta0.migadu.com [91.218.175.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD0A606D812
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD0A606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uoMofLeV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=f4MZEPomACo+JF2HOCbhbkGFHnL8N31Hjwf6Gqd4q3w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793692897; v=1; x=1794297697;
 b=uoMofLeVG/Ky2QC9sXVRMsOMWQkkJWpYo9yF02Y4Nc1np6EnpTtjqxqU8685L+rM5SOrGNax
 QKzf9hQcjZGS5lqoAOiSLM8Zfma/Hl+Ol1bP7Tdv2opBrzAKUOi4CMoKBSVNrBGlA8AIN8bwH1h
 uDvrNRWnNVQtmX2DU3c2fQIo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 25ecdb623a230149;
	Tue, 03 Nov 2026 08:01:36 +0000
X-Mizu-Trace-ID: 25ecdb623a230149
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	azpijr@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	stable@vger.kernel.org,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH 4/4] mm: hugetlb: respect cpuset restrictions for surplus allocations
Date: Tue,  3 Nov 2026 16:01:07 +0800
Message-ID: <d1e41a65970ced879715a73ce2607de7ad102fb2.1793692578.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1793692578.git.zhengqi.arch@bytedance.com>
References: <cover.1793692578.git.zhengqi.arch@bytedance.com>
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

From: Qi Zheng <zhengqi.arch@bytedance.com>

Gigantic surplus allocations can escape the faulting task's cpuset.
CMA and the contiguous allocator trust the supplied nodemask without
checking the current cpuset.

For example, a shared HugeTLB VMA has MPOL_BIND={0,1}, and T is a
non-leader thread. With surplus allocation enabled and no eligible free
HugeTLB folio, the following sequence can occur:

  CPU0 (cgroup v1 migration)       CPU1 (thread T)
  -------------------------       ---------------
  cpuset_attach_task(..., T)
    T->mems_allowed = {0}
    /* Non-leader: skip
       mpol_rebind_mm(). */
                                  /* Fault; VMA policy is still {0,1}. */
                                  policy_nodemask()
                                    /* {0,1} intersects {0}. */
                                    nodemask = {0,1}
                                  hugetlb_cma_alloc_frozen_folio()
                                    /* node0 fails; node1 succeeds. */

The 1 GiB folio is allocated on node1 despite T being restricted to node0.

Intersect the interpreted policy with the current cpuset before surplus
allocation, preserving MPOL_BIND and MPOL_PREFERRED_MANY fallback rules.
Apply the restriction at the policy-aware entry point to preserve
per-node pool management semantics.

If the cpuset changes during allocation, rebuild the mask and revalidate
any allocated folio against the current constraints. Keep it if it is
still eligible: freeing an HVO-optimized folio can defer returning its
range to CMA, so discarding a usable folio can cause a needless allocation
failure. Only release the folio and allocate again if it is no longer
eligible.

Fixes: eb02f14c4a2b ("mm/hugetlb: allow overcommitting gigantic hugepages")
Cc: stable@vger.kernel.org
Reported-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/hugetlb.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ce9c8e57b8e5c..6fd6e58ace869 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -2181,22 +2181,46 @@ struct folio *alloc_buddy_hugetlb_folio(struct hstate *h,
 		gfp_t gfp_mask, struct mempolicy_interpreted *mpoli)
 {
 	struct folio *folio = NULL;
-	nodemask_t *nodemask = mpoli->nodemask;
+	nodemask_t alloc_nodemask;
+	unsigned int cpuset_mems_cookie;
+
+retry:
+	cpuset_mems_cookie = read_mems_allowed_begin();
+	alloc_nodemask = cpuset_current_mems_allowed;
+	if (mpoli->mode == MPOL_BIND && mpoli->nodemask &&
+	    nodes_intersects(*mpoli->nodemask, alloc_nodemask))
+		nodes_and(alloc_nodemask, alloc_nodemask, *mpoli->nodemask);
+
+	if (folio) {
+		if (unlikely(read_mems_allowed_retry(cpuset_mems_cookie)))
+			goto retry;
+
+		if (node_isset(folio_nid(folio), alloc_nodemask))
+			return folio;
+
+		/* Balance free_huge_folio()'s decrement before caller accounting */
+		lruvec_stat_mod_folio(folio, NR_HUGETLB, pages_per_huge_page(h));
+		free_huge_folio(folio);
+		folio = NULL;
+	}
 
 	if (mpoli->mode == MPOL_PREFERRED_MANY) {
 		gfp_t gfp = gfp_mask & ~(__GFP_DIRECT_RECLAIM | __GFP_NOFAIL);
 
+		nodes_and(alloc_nodemask, alloc_nodemask, *mpoli->nodemask);
 		folio = alloc_surplus_hugetlb_folio(h, gfp, mpoli->nid,
-						    nodemask);
+						    &alloc_nodemask);
 
-		/* Fallback to all nodes if page==NULL */
-		nodemask = NULL;
+		/* Fallback to all nodes allowed by the current cpuset */
+		alloc_nodemask = cpuset_current_mems_allowed;
 	}
 
-	if (!folio) {
+	if (!folio)
 		folio = alloc_surplus_hugetlb_folio(h, gfp_mask, mpoli->nid,
-						    nodemask);
-	}
+						    &alloc_nodemask);
+
+	if (unlikely(read_mems_allowed_retry(cpuset_mems_cookie)))
+		goto retry;
 
 	return folio;
 }
-- 
2.54.0

