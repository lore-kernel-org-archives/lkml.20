Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792451232;
	b=5LPyOZ0qQRQ125bmfxGsXHXgPaV61MoQ9jVDqu9LiYPZ3k08YrTmhnQBbkBSe02c6Nud
	 67YdLRxxJP2L/kdhhY668DuwzBWSpZ73vGuz6OzzVvi9xtR+Pv55bQBVX7eC+Sxh7C7Ef
	 qa8GsSoJWdJ5isjmLVEfgBwrKSQeUgIPWwGBd8HMPDTH7RqN1uqzktNaiQqmaSkLAQMNb
	 NZ0NoJ+2rJbNZM3wSMeo/yag+pwsct5ozlxMhnfOALycVTZKF6x9meWFCP6NsikVBTWmC
	 ArdVwaGjRNy1zKhfZs0czzdxi6j4RJ6VnMhmbVXla5gaAcWXLzAy2geY5CYD/W4xmlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792451232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=X003jIwSoXQBeRutj7xwYcqrn9qDTaY/gDPTqo05RfU=;
	b=gPTLNA80FN1oCf9reTc8v8RlbcNkxwup/GHZBCSjrPVlH+4ZruSscGu+QpgEj5a1RmVD
	 Ec11Ev9APuhUKgIRtcbDKWigncDmXwua/M9UfvQwwkEIBK1GunPGJGxvgzDXDOgNXRrls
	 fng/nhKhGKuESPjp/OS9bUnxWWX0NrFFwQbcFYxEFB/R8a3osrQy79w+c4PadWucAt49c
	 GKlmk3o38zSMWXZJa0XoQCFUbBzDffHPt6IWmBvHiaO0I5ImF9paRmqVPnrE0t0zu8m7r
	 TrQk7p9sFp5rOt3I0WfzOBiei/KNKAkmXQ3rS+ZdvY8AwpTrr4U0nWRsjTx5zoCMV1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pq1NZxvO;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2528F606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2528F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pq1NZxvO
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-84a2bea315dso783623a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792451231; x=1793056031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X003jIwSoXQBeRutj7xwYcqrn9qDTaY/gDPTqo05RfU=;
        b=pq1NZxvOVyiTBwaV/5gj25ZkePHxIXWY7/LcoW5hymq9nFNdtQJGfB/XJqbCa8XhJY
         kXaa34R37wICEgdnUB0imY+2Y07eqv/o4nigxhZacY4DbBUfzZwro2oKJ51iWnTxLNOF
         a/vqe65NPid5Puzd+xTFqiYAgrHypJZLOt7Uo26hpAokBs++jCRZLnvY6KQ1mQ4GX0Nx
         IbaH5iRGIa09QgmMMg+0TOAdMQ4Wobjgfim3KaVz7cPaes8E6Hm7NFv0MdgHccwgiGo0
         Q4ZLG1nKc0M+MeENxZFxSxs58or0+ze04J+QZbQM5m2I9N+xO456B8gvEPc72IURPANi
         crdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792451231; x=1793056031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X003jIwSoXQBeRutj7xwYcqrn9qDTaY/gDPTqo05RfU=;
        b=Ub8Uqk/pDqz7K52lZCrI4xZRlt5t6AYCXV5sTmjwxSb9upu8xhaXIwigJiXKDzSeLV
         X6zYp6JwT0omfIRa4+r8YZFgwLUmdahnny1H+RHmCzuNU+s1XBFeE0MRjcCRbseWlUFT
         rjz9zNyY4+6Nwp04+SvvQbjncgmLsPFzRSj22j9/l3MY1gSKJuN4T3kJjVQzY8cndtS/
         OgT+gdscNtIKb1MSp8DRiez13VG/8/fOOFvOA4wcH25ogb7SuDBVxb1uorghA3raONpK
         VFHOPMygkzKiWws5xUFlRd63/Ii7xV/ojJbjxxorODNr2/UPlbL2OZWQkRnxpIP14Zao
         pVxA==
X-Forwarded-Encrypted: i=1; AKwUvBwIS2BxIi1VPFotlTbUHwlFFvLRex02mb8FbatWmKoy/0ereEacxNLXAUvlvlPOCJi2JhkTLqF8NPMjPyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeYbmR5Q6bp4BuKBsEXVAvS9uGILzmANfLZpH0PP3WGuiKdVhY
	E+TdLDgpDMIR6OJ9O2qjQU7+Tz3WV4+jLVqU56BuTWfVsnQpVDAoUd9R
X-Gm-Gg: AYBFou3qRPIfrQYOcNIJAlYD+jGlR1WzXYzfoPdvKSETrL4LM2WfHmnRQUZeiglsfkv
	FYiajJVUSg25tprI8UOfIV4v+WI1f3XDNGIPrsmS7jvl3/csnCuEE4vW78ZvXOIZSkbBmJa4Jzj
	proVejrkiJEuJTsgz5DiiGHMQRTs3Hzox8RMVUxTSGqhNed8g0N60eqFT2cOcQeaZaq4k4YpN2R
	DQlOgGd0NJhW0TsZ7wr0LsnMZEYKfzQAK8UEyS18YaZsECY+SOJi8/haL/Rl/LZpbnRv2LjrN0C
	ABLi4Lskvq5Crp9Q1xjfOHBkPylOFl3/OQYFx+WZ0rgLPSl1pUvjCyuYiIaLHHj+Dhzx53HTSXo
	xotqxZxrjwsahVECBGauEkp7fABGojAAfIyOpRI3xHRyTR9oJ9n8OiR+ldI2RE4/oMh6LxRIn5x
	sZNVi/uxc7ARVRtO3t+ROulB7fOiCnHq2APTCFH+zyZfbstRGdXj77QJuhMtx4THGm7c+RAQYw+
	7Qph96PTGh4eyTscFXS+k7S8VAADrLbhj8EmNoW6QQ9GIYhaBE=
X-Received: by 2002:a05:6830:4421:b0:81b:9724:8724 with SMTP id 46e09a7af769-844fe783338mr8650675a34.11.1792451230582;
        Mon, 19 Oct 2026 16:07:10 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:56::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a4a00f0asm9457269a34.5.2026.10.19.16.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:07:09 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Barry Song <baohua@kernel.org>,
	Usama Arif <usama.arif@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	Hugh Dickins <hughd@google.com>
Subject: [PATCH v3] mm: unqueue deferred split folios outside the lruvec lock
Date: Mon, 19 Oct 2026 16:06:46 -0700
Message-ID: <20261019230646.3510790-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
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

move_folios_to_lru(), folio_batch_move_lru() and folios_put_refs() call
folio_unqueue_deferred_split() on folios where the refcount has dropped
to zero. In these paths, folio_unqueue_deferred_split() is called with
the lruvec lock often held (move_folios_to_lru() always holds it and
folio_batch_move_lru()/folios_put_refs() usually hold it for every folio
in the batch except the first). However, it's not needed to hold the
lruvec lock.

The lruvec lock protects folio->lru and the reclaim LRU lists whereas
the deferred split queue lives on folio->_deferred_list in
deferred_split_lru. The deferred_split_lru is a list_lru with its own
per-memcg per-node lock.

There are already other existing callers that call
folio_unqueue_deferred_split() without holding the lruvec lock (eg
__folio_put(), shrink_folio_list(), __folio_migrate_mapping(), ...).

Add folio_batch_unqueue_deferred_split() and use it in
move_folios_to_lru(), folio_batch_move_lru(), and folios_put_refs() to
unqueue each batch of zero-refcount folios from the deferred split list
after the lruvec lock is released and before
mem_cgroup_uncharge_folios(). This helps shorten the lruvec lock's
critical sections, which run with IRQs disabled and are highly
contended.

This came out of the discussion on v2 of the mTHP shrinker series [1],
where queueing small mTHP folios on the deferred split queue was found
to regress Barry's fault microbenchmark. With [1] applied and
khugepaged/max_ptes_none=0 so that every folio is queued, perf lock
contention showed that the extra cost came from waiting on the lruvec
lock in the free path.

Test setup: 2-socket Intel Skylake, 40 cores / 80 threads, memory bound
to node 0 so that all threads contend on one lruvec, with each of 80
threads faulting in and unmapping 16 MB of anonymous memory 200 times.
With only 16K mTHP enabled, this patch reduces the queueing cost from
15% runtime to noise, and lruvec lock wait time (summed across threads)
drops from 491 seconds to 38 seconds. Most of the remaining contention
moves to the deferred split list_lru lock, but runtime still drops back
to the unqueued baseline. This test uses a worst-case configuration ([1]
is expected to only queue folios of 2M and larger).

[1] https://lore.kernel.org/linux-mm/CAJnrk1a2PpUGTsCgS7jct2KET4K2zAL+_h+te8G1MaU9bXs99w@mail.gmail.com/

Reviewed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
v2 -> v3:
- Move benchmark results into the commit message (Lance, Barry)
v2 link: https://lore.kernel.org/linux-mm/20261017004555.2890038-1-joannelkoong@gmail.com/

v1 -> v2:
- Reword comment in folio_batch_move_lru() (David)
v1 link: https://lore.kernel.org/linux-mm/20261013221307.850803-1-joannelkoong@gmail.com/

 mm/folio.c    | 24 +++++++++++++++++++-----
 mm/internal.h |  1 +
 mm/vmscan.c   |  3 ++-
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/mm/folio.c b/mm/folio.c
index 35e242b48870..45c814f3857b 100644
--- a/mm/folio.c
+++ b/mm/folio.c
@@ -109,6 +109,19 @@ EXPORT_SYMBOL(__folio_put);
 
 typedef void (*move_fn_t)(struct lruvec *lruvec, struct folio *folio);
 
+/*
+ * Unqueue a batch of folios from the deferred split queue. This must be
+ * called after the folios' refcounts have dropped to zero and before they
+ * are uncharged (see comment above __folio_unqueue_deferred_split() for why).
+ */
+void folio_batch_unqueue_deferred_split(struct folio_batch *fbatch)
+{
+	unsigned int i;
+
+	for (i = 0; i < folio_batch_count(fbatch); i++)
+		folio_unqueue_deferred_split(fbatch->folios[i]);
+}
+
 static void lru_add(struct lruvec *lruvec, struct folio *folio)
 {
 	int was_unevictable = folio_test_clear_unevictable(folio);
@@ -177,14 +190,10 @@ static void folio_batch_move_lru(struct folio_batch *fbatch, move_fn_t move_fn)
 		 *
 		 * We're bypassing normal cleanup. Clear flags that are not
 		 * applicable to dead folios.
-		 *
-		 * Since the folio may be part of a huge page, unqueue from
-		 * deferred split list to avoid a dangling list entry.
 		 */
 		if (is_lru_add && folio_ref_freeze(folio, 1)) {
 			__folio_clear_active(folio);
 			__folio_clear_unevictable(folio);
-			folio_unqueue_deferred_split(folio);
 			fbatch->folios[i] = NULL;
 			folio_batch_add(&free_fbatch, folio);
 			continue;
@@ -201,6 +210,11 @@ static void folio_batch_move_lru(struct folio_batch *fbatch, move_fn_t move_fn)
 
 	/* Cleanup filtered dead folios. */
 	if (is_lru_add) {
+		/*
+		 * Unqueue any large folios from the deferred split queue to
+		 * avoid a dangling list entry once the folios are freed.
+		 */
+		folio_batch_unqueue_deferred_split(&free_fbatch);
 		mem_cgroup_uncharge_folios(&free_fbatch);
 		free_unref_folios(&free_fbatch);
 	}
@@ -1020,7 +1034,6 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
 			free_huge_folio(folio);
 			continue;
 		}
-		folio_unqueue_deferred_split(folio);
 		__page_cache_release(folio, &lruvec, &flags);
 
 		if (j != i)
@@ -1035,6 +1048,7 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
 	}
 
 	folios->nr = j;
+	folio_batch_unqueue_deferred_split(folios);
 	mem_cgroup_uncharge_folios(folios);
 	free_unref_folios(folios);
 }
diff --git a/mm/internal.h b/mm/internal.h
index d497c35ee783..33ae388feb33 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -761,6 +761,7 @@ static inline bool folio_unqueue_deferred_split(struct folio *folio)
 
 	return __folio_unqueue_deferred_split(folio);
 }
+void folio_batch_unqueue_deferred_split(struct folio_batch *fbatch);
 
 static inline struct folio *page_rmappable_folio(struct page *page)
 {
diff --git a/mm/vmscan.c b/mm/vmscan.c
index daa7e37c2236..9c71a50309e8 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2007,9 +2007,9 @@ static unsigned int move_folios_to_lru(struct list_head *list, bool do_rotate)
 		if (unlikely(folio_put_testzero(folio))) {
 			__folio_clear_lru_flags(folio);
 
-			folio_unqueue_deferred_split(folio);
 			if (folio_batch_add(&free_folios, folio) == 0) {
 				lruvec_unlock_irq(lruvec);
+				folio_batch_unqueue_deferred_split(&free_folios);
 				mem_cgroup_uncharge_folios(&free_folios);
 				free_unref_folios(&free_folios);
 				lruvec = NULL;
@@ -2041,6 +2041,7 @@ static unsigned int move_folios_to_lru(struct list_head *list, bool do_rotate)
 		lruvec_unlock_irq(lruvec);
 
 	if (free_folios.nr) {
+		folio_batch_unqueue_deferred_split(&free_folios);
 		mem_cgroup_uncharge_folios(&free_folios);
 		free_unref_folios(&free_folios);
 	}
-- 
2.52.0

