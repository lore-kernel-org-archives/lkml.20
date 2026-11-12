Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794521592;
	b=DBpTNjxUySXP56RKseVXYyhsLzx/AnNrUDnB1lKq4HgMD0NaqOmJzFADGg1qkpd+pILb
	 4oCIjI0JcGr+vkBqn6QRwAG2/NeWyWjbzLTtU+SK1/If9hSiNTo7HVDr5mrncJzCP4x42
	 szLthN3YImvEAigyYB4T8pxlR4Of2oNvGwJuSkSmYxkAXDvgHdXTJSBfXvb/hfSws5Z+K
	 fQG9670dsEnwl6+fRRdqrylzxnI560GkNhtECGOdNlAf4JKRokgMkm1KUtNBplEMEqoOZ
	 G9fVPL9SFbUhlaOsb69Vp8cA6oY30Ursy7/xXQEPlNK1awCKfJSPE0CX4FhbDFMi6Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521592;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kTdo+kO/ZFnoi8WBOH10hGoTbRODmVYIrrHV4RIL5fA=;
	b=xWL1hOARfBva0ZqHxhyh6oOU/T+3anc2vLmO5V+pFgoo6Puj9YfAQxY+nDeyapLeLTMj
	 IbFnqCuzUN03yql/GK9ExHz6Wi3IcrI4m0ymSKB7J73ghcPkiCpxege43O3RZbqZiex0K
	 /JlRhp0lI8JyT5/O7oqB1hADMJ060uXrqN0pR0HZjpiHbMQQEaAn+V2BOlBagu2ZAoyIs
	 dsMAsq2FYJcPxmpNtFOsxDvkilWsuzUxs6TWmnf8+b1fuSk5c4VZW1UlMZuu8QPL8lh7x
	 0DsHAPAL7pPi7yIKFEtooZG04brkqlHC5Lm2S+r1w1I1e4/QcIC5BZeVAF2dUrIJf4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iaYl8CJG;
	arc=none smtp.remote-ip=95.215.58.216
Received: from mta1.migadu.com (out-216.mta1.migadu.com [95.215.58.216])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E942E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E942E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iaYl8CJG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SBKlid3rP+qCHPEj+Z0hRqE3CyPPTMKLsXSlj3BJE+c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794521590; v=1; x=1795126390;
 b=iaYl8CJGgnyl+5hL1pofzDwkBpk0CDE8yh15YaEbJw4NLc5S2i5xWHovQGaTnX6ARYyJcqGL
 5ub1HZYjIwxeE2g5m1V5jSKFBeUk2gZGg3YTdwLADNruTbBWmI3oY4JB3+ywis2IH8k2jHe6DCf
 byWolOUof+FhzolNqXwmoxVQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 140af9af48ba9318;
	Thu, 12 Nov 2026 22:13:08 +0000
X-Mizu-Trace-ID: 140af9af48ba9318
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
Subject: [PATCH] mm: list_lru: don't use a new memcg's lists for an offline memcg
Date: Thu, 12 Nov 2026 14:12:48 -0800
Message-ID: <20261112221248.3512447-1-shakeel.butt@linux.dev>
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

A memcg's list_lru lists are found by its kmemcg_id, which is its
private ID. Offlining a memcg moves its lists to the parent and frees
the ID right away, with no RCU grace period. The next new memcg can get
the same ID and allocate its own lists at that index.

A caller that holds only the RCU read lock, such as
__folio_unqueue_deferred_split(), can still hold the offline memcg. If
it is preempted until the ID is reused, it then locks the new memcg's
list and unlinks a folio that now sits on the parent's list, without
holding the parent's lock. A concurrent change to the parent's list can
then leave a pointer to a freed folio on it.

Users see list corruption reports, crashes or silent memory corruption
when memory cgroups are removed and created while THPs are freed, on
kernels with preemptible RCU, which is the default on x86 and arm64.
They can also see a warning from memcg_reparent_list_lru_one() when the
new memcg is removed, because the wrong unlink made its count negative.

Fix it by recording the owning memcg in each list_lru_memcg, and by
treating the index as empty when its lists belong to another memcg. The
lookup then moves up to the parent, whose list holds the folio.

Fixes: 28e98022b31e ("mm/list_lru: simplify reparenting and initial allocation")
Reported-by: Chris Mason <mason@kernel.org>
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 include/linux/list_lru.h |  2 ++
 mm/list_lru.c            | 18 +++++++++++-------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/linux/list_lru.h b/include/linux/list_lru.h
index a450fffe1550..6ef5bc539606 100644
--- a/include/linux/list_lru.h
+++ b/include/linux/list_lru.h
@@ -38,6 +38,8 @@ struct list_lru_one {
 
 struct list_lru_memcg {
 	struct rcu_head		rcu;
+	/* owning memcg, only compared and never dereferenced */
+	const void		*memcg;
 	/* array of per cgroup per node lists, indexed by node id */
 	struct list_lru_one	node[];
 };
diff --git a/mm/list_lru.c b/mm/list_lru.c
index ca8de3793166..560190d5b348 100644
--- a/mm/list_lru.c
+++ b/mm/list_lru.c
@@ -72,12 +72,15 @@ static int lru_shrinker_id(struct list_lru *lru)
 }
 
 static inline struct list_lru_one *
-list_lru_from_memcg_idx(struct list_lru *lru, int nid, int idx)
+list_lru_from_memcg(struct list_lru *lru, int nid, struct mem_cgroup *memcg)
 {
+	int idx = memcg_kmem_id(memcg);
+
 	if (list_lru_memcg_aware(lru) && idx >= 0) {
 		struct list_lru_memcg *mlru = xa_load(&lru->xa, idx);
 
-		return mlru ? &mlru->node[nid] : NULL;
+		/* Lists at a reused index belong to another memcg. */
+		return mlru && mlru->memcg == memcg ? &mlru->node[nid] : NULL;
 	}
 	return &lru->node[nid].lru;
 }
@@ -91,7 +94,7 @@ lock_list_lru_of_memcg(struct list_lru *lru, int nid,
 
 	rcu_read_lock();
 again:
-	l = list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(*memcg));
+	l = list_lru_from_memcg(lru, nid, *memcg);
 	if (likely(l)) {
 		lock_list_lru(l, irq, irq_flags);
 		if (likely(READ_ONCE(l->nr_items) != LONG_MIN)) {
@@ -132,7 +135,7 @@ static inline bool list_lru_memcg_aware(struct list_lru *lru)
 }
 
 static inline struct list_lru_one *
-list_lru_from_memcg_idx(struct list_lru *lru, int nid, int idx)
+list_lru_from_memcg(struct list_lru *lru, int nid, struct mem_cgroup *memcg)
 {
 	return &lru->node[nid].lru;
 }
@@ -313,7 +316,7 @@ unsigned long list_lru_count_one(struct list_lru *lru,
 	long count;
 
 	rcu_read_lock();
-	l = list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(memcg));
+	l = list_lru_from_memcg(lru, nid, memcg);
 	count = l ? READ_ONCE(l->nr_items) : 0;
 	rcu_read_unlock();
 
@@ -502,11 +505,10 @@ static void memcg_reparent_list_lru_one(struct list_lru *lru, int nid,
 					struct list_lru_one *src,
 					struct mem_cgroup *dst_memcg)
 {
-	int dst_idx = dst_memcg->kmemcg_id;
 	struct list_lru_one *dst;
 
 	spin_lock_irq(&src->lock);
-	dst = list_lru_from_memcg_idx(lru, nid, dst_idx);
+	dst = list_lru_from_memcg(lru, nid, dst_memcg);
 	spin_lock_nested(&dst->lock, SINGLE_DEPTH_NESTING);
 
 	list_splice_init(&src->list, &dst->list);
@@ -602,6 +604,8 @@ static int __memcg_list_lru_alloc(struct mem_cgroup *memcg,
 			if (!mlru)
 				return -ENOMEM;
 		}
+		/* Set before the lists are published, and never changed after. */
+		mlru->memcg = pos;
 		xas_set(&xas, pos->kmemcg_id);
 		do {
 			xas_lock_irqsave(&xas, flags);
-- 
2.53.0-Meta

