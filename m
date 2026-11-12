Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463962;
	b=3SVoPKgFDGDMB7KCSXzbfjfj0hBOZB8OscyHRUxfnRYV429m/8elk3U/mv/e9aTVy3+J
	 55vXq96nJkGMdx27GoS+GG8n9zpTzjuv4HKgen/L1W11yurB8HWXWyJyOD348YZoZzxBX
	 19alqv8YKiDFTLoq+swtqtWVPRMeagoIg8Fv3694aLrSQLf+s5uIUnCHTIAY7phcNHU8U
	 VR3+B+MXBRBSRBCqjfevOGyRESbnek12tj6P3kWh+mTjv2UVTeDGG7YG8M6ExklSOi3+b
	 r7bihzV3Wm/lpTu2cur0s3raIg9XK+LwvKoK2+d8VrxxLf0+QdndbPCwGfH+2x/kgCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463962;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1+gXg/vjFn6nzZA2EVEP765YusEY5R4QCzjg5NvcKa0=;
	b=qs3ffEYrzrjIqG9U8IxIwP44vjBlTWlUwRmPmBKEcUCYDr+dA0pvp+vrfdkYAqn9DGC1
	 oHOJ3Os6DZijn1sEkzJXgxwGlBxLG+9oXBBjxp8KmgSetOMCiqnO+XizrgkV5ghtdVSts
	 QiYsCbVRboFnebXo+0AIJUhDSiFOsCDundlUJudTHkG5jaZky6rQfbLswUlvtv/PuInEn
	 odONDT9YAp6v3QKyf54i06a3FxRYazQtbEW/H4UHBTO5QAw3PlPU9UGRtiiJciIDqDX6k
	 FnoIEXn6jrm3y71vSLnxcXzS84mrqD17pNfeVu1bFJaJu5tIt0+XZC1p8u45A3mvz2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CV0mW+bm;
	arc=none smtp.remote-ip=95.215.58.50
Received: from mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F58606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76F58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CV0mW+bm
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5q5l1kzky20TOdvCOQkbVc5c+2wT9HJYJXXnkXqYupc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794463959; v=1; x=1795068759;
 b=CV0mW+bmuW46y0b3t+nZ2OsdGfraTo0JvwQxnvSCV8iGpfduEaA/lvZiaE68xMfEcUjYINQK
 T11ymgH/8LhOq1EYs178Y+jWessBXwc06WZVgzzprPUoyqroV90PEl0QDzcPae6uDM4MIsUjTtU
 ikz/If4ez9/tY48GWylpZrvI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 42ff7a47c71756af;
	Thu, 12 Nov 2026 06:12:39 +0000
X-Mizu-Trace-ID: 42ff7a47c71756af
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dave Chinner <david@fromorbit.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	Meta kernel team <kernel-team@meta.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Chris Mason <mason@kernel.org>
Subject: [PATCH v2] mm: list_lru: fix NULL deref when a folio moves to the root memcg
Date: Wed, 11 Nov 2026 22:12:31 -0800
Message-ID: <20261112061231.2469026-1-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
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

folio_memcg_list_lru_alloc() makes sure that a folio's memcg has its
own lists in a list_lru, such as the THP deferred split queue. It looks
up the folio's memcg twice: a fast path under RCU checks if the lists
exist, and a slow path takes a reference and allocates them. The fast
path returns early for the root memcg, which uses the global lists.
The slow path does not check for the root.

The memcg can change between the two lookups: when a cgroup is
removed, its folios are moved to the parent memcg. If the folio is
moved up to the root in between, the slow path gets the root, and
__memcg_list_lru_alloc() dereferences the root's parent, which is NULL.

Users see a NULL pointer dereference oops while a THP is allocated,
such as in a page fault, in khugepaged or at swap-in. tmpfs huge pages
are affected too, and for them the oops can also happen in reclaim,
for example in kswapd. The task that hits the oops is killed, or the
machine panics if panic_on_oops is set.

The race is narrow: the folio has to be moved up to the root right
between the two lookups. For example, its cgroup is directly below the
root and is removed, or has its memory controller disabled, at that
moment.

Fix it by checking memcg_list_lru_allocated() again in the slow path,
like the fast path does. It returns true for the root, which needs no
lists of its own.

Fixes: ae64f07a6a40 ("mm: list_lru: introduce folio_memcg_list_lru_alloc()")
Reported-by: Chris Mason <mason@kernel.org>
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
Changes in v2:
- Check memcg_list_lru_allocated() instead of mem_cgroup_is_root(), like
  the fast path does, and update the comment to match (Muchun).
- Link to v1: https://lore.kernel.org/20261112024140.648088-1-shakeel.butt@linux.dev

 mm/list_lru.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/mm/list_lru.c b/mm/list_lru.c
index d1d256822ccc..ca8de3793166 100644
--- a/mm/list_lru.c
+++ b/mm/list_lru.c
@@ -645,9 +645,16 @@ int folio_memcg_list_lru_alloc(struct folio *folio, struct list_lru *lru,
 	if (likely(res))
 		return 0;
 
-	/* Allocation may block, pin the memcg */
+	/*
+	 * Allocation may block, so pin the memcg. If the folio's cgroup
+	 * was removed after the check above, the folio has moved up to a
+	 * parent memcg. That memcg may already have its lists, or may be
+	 * the root, which uses the global lists and has no parent. So
+	 * check again before allocating.
+	 */
 	memcg = get_mem_cgroup_from_folio(folio);
-	res = __memcg_list_lru_alloc(memcg, lru, gfp);
+	if (!memcg_list_lru_allocated(memcg, lru))
+		res = __memcg_list_lru_alloc(memcg, lru, gfp);
 	mem_cgroup_put(memcg);
 	return res;
 }
-- 
2.53.0-Meta

