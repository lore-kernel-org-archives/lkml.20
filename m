Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.247
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451328;
	b=YFT7b4dEP3EtjgbiPQqbhRhpyG9j0AjGyp4k9yZSbZo07BOfh5ELMCyVxzkgWHQCM4eL
	 g9lywAybfW52joSo46E/RXCCEVHM0tewcnebT04yFtoQe0eXpAm3QjeM/5S9eo9UJEKz7
	 DpcWGLjl8fthjr5jj7fu8ZRN7JKm32MgnDWCQIlODf77Owsg6vn5Z/mHHMOC5gRetffS7
	 Ks9z7xpnyh4zizJcfIhunQtTkx9bqqzwRmGtyIKzj6VUax4tnjLdjCEcoO4MGWg9cmTyc
	 wlPcBbiMMIsQEiVZk0KI+1Z1wXm1nsmLl6PhCIk4T5TpyN2hMW17RAhzmdHTPODabZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451328;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/8c9L7Aa/+KfdpEEVA0L9SAbBuPuYRG32gKLgx+Xt9s=;
	b=IBPwqHFAAm+XOJ5ATuDj0zlSSHlvtkB3uhIjmdqi3TBK3SFs66P73SR9Fi0eG242KYLy
	 jzPAYMdhVmu9yilQx+45G4vBfYLLI2Ui9LYupqL7RAZjsngDpHqamIcSkUhiZ88DAdu1c
	 61h4qFGMtxyMm68pYoHOYg5gSeDSVdNaz0wnw8GeSRBuBVxTGLoiw7GVJvdHee0fC/eGl
	 /lRD8B/1ABGeo2RmleVHdheCWM2tNx/4T+uCb+GEedO/FGC6hTfeVWo66V4rZvcxMTnQH
	 aFK+Zvlx8ruqSZ7DjjhX8Baghke6Xd7oJeqKkQxRbF16CmViDZmzgCNohHCXAGC0Yuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cRDDg6ZF;
	arc=none smtp.remote-ip=91.218.175.247
Received: from mta0.migadu.com (out-247.mta0.migadu.com [91.218.175.247])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5F3606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E5F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cRDDg6ZF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q4lNDug3J+65+63Wa+IbdOW7P2vunUh/rpySJhsCY98=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794451325; v=1; x=1795056125;
 b=cRDDg6ZF3BhLBhPJJxSx3MlvlnrA7ofqAW4mUi3Vi8YtyVCX693kXLilOVex0Zwu9kwmXQvR
 rORjUPnSf7E6Iv/FcJDrENqguli1OVYc74WapL3+DKOWIU78FE2YYfls3UP1XgI5mwR9J11/chy
 kmbclHep2Y5qFwwKhhCzr4A4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cfce15ccbfb00ccc;
	Thu, 12 Nov 2026 02:42:04 +0000
X-Mizu-Trace-ID: cfce15ccbfb00ccc
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
Subject: [PATCH] mm: list_lru: fix NULL deref when a folio moves to the root memcg
Date: Wed, 11 Nov 2026 18:41:40 -0800
Message-ID: <20261112024140.648088-1-shakeel.butt@linux.dev>
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

Fix it by skipping the root memcg in the slow path too. The root needs
no lists of its own.

Fixes: ae64f07a6a40 ("mm: list_lru: introduce folio_memcg_list_lru_alloc()")
Reported-by: Chris Mason <mason@kernel.org>
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

---
 mm/list_lru.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/list_lru.c b/mm/list_lru.c
index d1d256822ccc..566691ca3dd8 100644
--- a/mm/list_lru.c
+++ b/mm/list_lru.c
@@ -645,9 +645,15 @@ int folio_memcg_list_lru_alloc(struct folio *folio, struct list_lru *lru,
 	if (likely(res))
 		return 0;
 
-	/* Allocation may block, pin the memcg */
+	/*
+	 * Allocation may block, so pin the memcg. If the folio's cgroup
+	 * was removed after the check above, the folio has moved up to a
+	 * parent memcg, which can be the root. The root uses the global
+	 * lists and has no parent, so skip it.
+	 */
 	memcg = get_mem_cgroup_from_folio(folio);
-	res = __memcg_list_lru_alloc(memcg, lru, gfp);
+	if (!mem_cgroup_is_root(memcg))
+		res = __memcg_list_lru_alloc(memcg, lru, gfp);
 	mem_cgroup_put(memcg);
 	return res;
 }
-- 
2.53.0-Meta

