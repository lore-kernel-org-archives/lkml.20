Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24FB1C2AA
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792198094; cv=none; b=Wa2NS/OMFYGuEYXCMoLGOuf7tl+Dz9SwI7HmyOi7efWoL/lBHtPy+xv0ycZDOGNuy1zGXceabMVOmHmTB9EVP7MsySMryjNHsfefW4umglLVcZTlQopekFdXnCmruaJmbardFK538hh1Y9/MYuRgOJNdj1q3tz9Lcbm9i9CdbcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792198094; c=relaxed/simple;
	bh=zAkaYmnCSFgKp1IExIDSjfCmxe/z+dinVTCKFpzzcqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jvyuSUldl49SStys13LWam+zkFboP6j2O+7X+NyfIMmaQUmaiGUttHcauUfiB+7CDPVhlCImTFJw5VjAmmDccby6wvNTZuJv4OEFqR7eSFdmHjHNmlWoALVYHdsZY1++IcqAsVTY1qXvwz4d3ln1aYEPhrrI7UUnDYBzCtP/Ga4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9PN6YtU; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9PN6YtU"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8258ac98bc2so275498a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792198091; x=1792802891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9LzMb59cyBGnEfMp22f67zI9ONykL0xzCkuzFl5P5Qs=;
        b=F9PN6YtUBLfb5rER+8rKT//jPKFUvrOcN/qQfmQho0jr2xE0/pcjJvxVkkAjAxY4m2
         ftAYb1A+m0eSpr+W3jM/mw8Qk03OYR1GWE7pfRrk0IzPAVSgjtTZPiEexnPOzuqVflmk
         0ENF019LjX6/Su+UM1xFGRlMAkSsH17B2pMbqZNFlBgjh9Fd4AywzfEyFgdb0YwI2VAn
         fucbR94bBZaGW06RZF9VxwKU0VDn9bQQwjWTI8hP/sMSyogPQGR0Nz1+xmriQ6y2aq9z
         hvUTZh9q58e0VEt8XhM7P2G2wHP2hF0BVoQBPh/7zUnHwmTUFXxqp5EvUxxjSC+Hvh3f
         zzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792198091; x=1792802891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9LzMb59cyBGnEfMp22f67zI9ONykL0xzCkuzFl5P5Qs=;
        b=elmejXYGZmSIKxYAP827XRYIPMEiJylVmQmAe7CKBeSa4d0eCtKzNX3L35QOBPNvzn
         NdJs7tVtD8TIand1GiIqK8COS3VA1imIKRjOHcpNfGhta2Ch05ZHJ8UJ3fG+JYGwKd55
         jAyJWVLYSs0h7lNkdpFoLxAYNoIUEt7TNH8u6uYA6iWvdn/21WozsWc7pMAXyYcjTYCV
         +/g9B/Y3jXOhu7mbYE/vQD3SXtAHBvnda6r64Ved7M7Z3nynZWjN36VGHWIWOFz+Q6MQ
         IKbX7khatMFQsJqM7b23YSVgAFABkwdIk4ppURzfO9ULXoVxAGzH1fIp/pC56bw6EJfa
         x1Zw==
X-Forwarded-Encrypted: i=1; AKwUvByXO+y/67CL2cNK8Z6SG8q6gy3hV+C5da7JMOe+0tsUEpgH3siinogL1sonBdZMuKk0z15gnWWbPVyZ7ww=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcNVQAlUSZndNZvvIO8ObQLu6DqmIBMZdNPT1M988CnuwhVf+w
	+bAzml/hJRoEH2aw6U0o9ddi7QrMIn6cP4Ez0f4QcEmSNHBhpW2N88Xk
X-Gm-Gg: AYBFou2NmPmNiGnNlYs86U9Pjlh/qpHjCwZj6r1nfp0yo6DbYBw0MIMKjiLwl0kngEv
	hlN4BCz5wwFHDVbZLm4mDiar248WTt4h/r0jGGJZ/gl8L1ti7RQbMwhkSLNer2Hznu98bmKL90d
	sF8S/wJmprKpBX1cpWGJw8X1+r+dohcsl25LXmzKOQrEUbk7JjVhBQVq+J0Ux4wqAyYTFj4sivk
	H1HGBj41vNcckFOnqaWMgzhQO/sqouw+rPciA13L0UMXGOVUxRB1StedLRBK1nV+QIy64IrQUkX
	MfKzmcJq1Pb1Doq4vs13BzypX1EbMnNIiTsRudIb3TQzXS+EI1CIzV7tuwq7hEBoeZQlkNeI6fM
	D44IWaXhw3NqV6Xx+BAWtgVLjlmcpW3KKFpEZnZ67z+uzjGgrHryYqtXZQM18lapAEUTMAKknpA
	4m+OylgnbbFlOYN82p5OMhbUEefl/7QDe5U6Eb9LY61b/ORE0wqm0udIEaU7dCa4DYrLG58SfvB
	XSlwTPPFt0Kn67UcvGn4CJPJlb+CAYh6jXYZvfE1C3R1MtCYwY=
X-Received: by 2002:a05:6830:4acb:b0:7f4:d1aa:2f32 with SMTP id 46e09a7af769-84500595526mr1670876a34.11.1792198091605;
        Fri, 16 Oct 2026 17:48:11 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4a::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a0f31614sm3090730a34.3.2026.10.16.17.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:48:10 -0700 (PDT)
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
Subject: [PATCH v2] mm: unqueue deferred split folios outside the lruvec lock
Date: Fri, 16 Oct 2026 17:45:55 -0700
Message-ID: <20261017004555.2890038-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
This patch came out of a discussion about splitting underused mTHP folios [1],
where queueing small mTHP folios on the deferred split list was found to
regress Barry's fault microbenchmark. The cost turned out to be the unqueue
running under the lruvec lock rather than contention on the deferred split
queue itself. Testing this patch on top of the series in [1] with the same
microbenchmark, queueing every 16k folio went from a 15% runtime cost to
noise, with lruvec lock wait dropping from 491 seconds to 38 seconds (most of
that contention then moves to the deferred split list_lru lock, but runtime
still drops back to the unqueued baseline).

[1] https://lore.kernel.org/linux-mm/CAJnrk1a2PpUGTsCgS7jct2KET4K2zAL+_h+te8G1MaU9bXs99w@mail.gmail.com/

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

