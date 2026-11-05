Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851712;
	b=gdecXPUkPoFxDt2UjxoMTof+Y2ILYyskrqEnQLOFt8ozG7sTRPaqBrxtXkOlnlQuuUnq
	 UnsutTdDQ5ghKwYFdSB0gjnbR/NDuPQMAAatew7AGFRG909r6X7HLzhJxAlhITvZOmrza
	 Sx7UkJ5ygFo2hp9YXNwP2KCpQAdXFiyUnLJiPJosupHJlDcpDiQh1NkCa4O5pdGSzVEbh
	 EJsaTmyWrbCzMvBGLkQHzm5KxHr8Rs3BCeWprRHT572IgCp+JimT92jb3pfdCvKpqcRth
	 XdpjhNYHNVuuYnfU0+22LzLEDPd30br1pcWWwVwAYOIZ9ldVfFX22d1MRt+SAhFCXYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851712;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hxAdYOiZMDWVnhrVJerUgUeo3FuklgjtpnZJkBnaqj0=;
	b=DNWVaxDBLiYxFkRHi0mA+qi2Foo+T+wCzCLejnAFOmQX6+BmuZ3NAyjzO9uDIC9SZVTj
	 0sdfVeAO4eluC9BdjZv46j1tq0mSOMtijSuX0AqRXcc8bulfYq9s7KfaveuXkg+W3eOTd
	 J9lBPKS0IhRfYNrzG/H7m4W5x0vtKvHRo2UUh42g8buJU+T4Q03ItxtZmrqhHuP2FepBw
	 fA/3qieDH4+lcGz1U8+dopYexDMY9Sc7gG9UEHcLSvU5RZZnLyq+NthoB7ooVu6ohsi6i
	 OkNDekt22viJuFIm6ZZmqzV0FN9qtCalN+4xWsUOw4LJGWsnC6UocoCXJ+W7hxBPIHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RUDGX5v7;
	arc=none smtp.remote-ip=95.215.58.218
Received: from mta1.migadu.com (out-218.mta1.migadu.com [95.215.58.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A6D606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00A6D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RUDGX5v7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4zR6GuXHlYIEiJeN1rNCRlmHY2SNfG3wyJTdYXq1hOg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793851708; v=1; x=1794456508;
 b=RUDGX5v78X1j40xqFE1muXfgcFojzyNxW8vviBxIFY9jVQ7/B74hJWUZKU0PPNicHuBmqF1W
 hkn0V+3VAdchOTtdJ2RAT3njv5eed/swXVGlb58FHPqIzibbAAvXZ/As297LqhZIxHTgcfk13eD
 q5o0pTXAf6TYvlPSm9lkfgis=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 39f390051dfdd29d;
	Thu, 05 Nov 2026 04:08:28 +0000
X-Mizu-Trace-ID: 39f390051dfdd29d
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	azpijr@gmail.com,
	lance.yang@linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] mm: hugetlb: fix cpuset violations in gigantic surplus allocations
Date: Thu,  5 Nov 2026 12:07:46 +0800
Message-ID: <046fd77e49ee8bb35e3bcc4104b9275d2e72ea5e.1793850539.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1793850539.git.zhengqi.arch@bytedance.com>
References: <cover.1793850539.git.zhengqi.arch@bytedance.com>
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

CMA and the contiguous allocator trust a supplied nodemask without
checking the current cpuset. Gigantic surplus allocations can therefore
use nodes forbidden to the faulting thread.

For example, moving a non-leader thread to another cgroup v1 cpuset
updates its mems_allowed without rebinding the shared VMA policy:

  CPU0 (cpuset attach)             CPU1 (thread T)
  -------------------             ---------------
  T->mems_allowed = {0}
  /* Skip mpol_rebind_mm()
     for a non-leader. */
                                  /* VMA MPOL_BIND remains {0,1}. */
                                  hugetlb_cma_alloc_frozen_folio()
                                    /* node0 fails; node1 succeeds. */

Intersect the allocation mask with the current cpuset, preserving
MPOL_BIND and MPOL_PREFERRED_MANY fallback rules. Retry only failed
allocations when the cpuset changes.

Fixes: eb02f14c4a2b ("mm/hugetlb: allow overcommitting gigantic hugepages")
Cc: stable@vger.kernel.org
Reported-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/hugetlb.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6fba92b0f6749..09b64f7c11dd2 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -2181,22 +2181,33 @@ struct folio *alloc_buddy_hugetlb_folio(struct hstate *h,
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
+	if (!folio && unlikely(read_mems_allowed_retry(cpuset_mems_cookie)))
+		goto retry;
 
 	return folio;
 }
-- 
2.54.0

