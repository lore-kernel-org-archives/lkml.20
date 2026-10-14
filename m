Received: from mta0.migadu.com (out-64.mta0.migadu.com [91.218.175.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37463B8BD4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947271; cv=none; b=EG8tCub2KdE3LQkJ5eqqBNK1SeIIZ+97y7W9pmf/QODGy+8/MUUc0ZU7qs9NYnoXSW9+M+vfB5CJaINf4cuWOilMSZrDMvnp8bMqLITZeVMOmkwU82xWS5kKhOaltQ2jIU55DKQ/Ru6m546REjsssov/jwt0Et64S3vwVoQ7PMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947271; c=relaxed/simple;
	bh=9zrs9qqhlsQOOSazO/3qggaoCuwnahB4HwqhsNSdhxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j3sKQhuHRTt/A3IEetWjNcc44dr8fUnViRyEKdz+Wy+TzBzAAruTLnnlW/nP2wYmgZQVNGMe3/07EWHqksf2YlWxaCt+mFS7vjiYnwyVVI8DqQpHLpBeEnzay4QOQKYUhCT20Ohsk2VVGJfC8BwTQ7k7XeGWXhOR9VO57F/Q/cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vuQb40Ds; arc=none smtp.client-ip=91.218.175.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vuQb40Ds"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9zrs9qqhlsQOOSazO/3qggaoCuwnahB4HwqhsNSdhxM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791947263; v=1; x=1792552063;
 b=vuQb40DsRX01QOyFawelPfbBt0/CIP0WefjaJMr4XsI65Zaj6Hbv1dr/30XjLhSTMalNdHZ3
 Pj11bu6YMIACZA5JnGrpamXHUeiauKuGKWCa4nsJT79UZgSAcGFbuRLcBNtxngPUGcSpyWu0EZg
 6QTgDUITSxBHvEH3p3wrZaeM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cfe85eb0f69d5cf8;
	Wed, 14 Oct 2026 03:07:43 +0000
X-Mizu-Trace-ID: cfe85eb0f69d5cf8
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: joannelkoong@gmail.com
Cc: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	hannes@cmpxchg.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	baohua@kernel.org,
	usama.arif@linux.dev,
	lance.yang@linux.dev,
	hughd@google.com
Subject: Re: [PATCH v1] mm: unqueue deferred split folios outside the lruvec lock
Date: Wed, 14 Oct 2026 11:07:37 +0800
Message-ID: <20261014030737.2102-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261013221307.850803-1-joannelkoong@gmail.com>
References: <20261013221307.850803-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Oct 13, 2026 at 03:13:07PM -0700, Joanne Koong wrote:
>move_folios_to_lru(), folio_batch_move_lru() and folios_put_refs() call
>folio_unqueue_deferred_split() on folios where the refcount has dropped
>to zero. In these paths, folio_unqueue_deferred_split() is called with
>the lruvec lock often held (move_folios_to_lru() always holds it and
>folio_batch_move_lru()/folios_put_refs() usually hold it for every folio
>in the batch except the first). However, it's not needed to hold the
>lruvec lock.
>
>The lruvec lock protects folio->lru and the reclaim LRU lists whereas
>the deferred split queue lives on folio->_deferred_list in
>deferred_split_lru. The deferred_split_lru is a list_lru with its own
>per-memcg per-node lock.
>
>There are already other existing callers that call
>folio_unqueue_deferred_split() without holding the lruvec lock (eg
>__folio_put(), shrink_folio_list(), __folio_migrate_mapping(), ...).
>
>Add folio_batch_unqueue_deferred_split() and use it in
>move_folios_to_lru(), folio_batch_move_lru(), and folios_put_refs() to
>unqueue each batch of zero-refcount folios from the deferred split list
>after the lruvec lock is released and before
>mem_cgroup_uncharge_folios(). This helps shorten the lruvec lock's
>critical sections, which run with IRQs disabled and are highly
>contended.

Nice work! Thanks!

BTW, have you seen measurable overhead from unqueueing deferred split
folios under the lruvec lock?

Any before/after numbers for this change, including the cost of the extra
pass over the batch?

Cheers, Lance

>Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
>---
> mm/folio.c    | 24 +++++++++++++++++++-----
> mm/internal.h |  1 +
> mm/vmscan.c   |  3 ++-
> 3 files changed, 22 insertions(+), 6 deletions(-)
>
>diff --git a/mm/folio.c b/mm/folio.c
>index 35e242b48870..85144078e635 100644
>--- a/mm/folio.c
>+++ b/mm/folio.c
>@@ -109,6 +109,19 @@ EXPORT_SYMBOL(__folio_put);
> 
> typedef void (*move_fn_t)(struct lruvec *lruvec, struct folio *folio);
> 
>+/*
>+ * Unqueue a batch of folios from the deferred split queue. This must be
>+ * called after the folios' refcounts have dropped to zero and before they
>+ * are uncharged (see comment above __folio_unqueue_deferred_split() for why).
>+ */
>+void folio_batch_unqueue_deferred_split(struct folio_batch *fbatch)
>+{
>+	unsigned int i;
>+
>+	for (i = 0; i < folio_batch_count(fbatch); i++)
>+		folio_unqueue_deferred_split(fbatch->folios[i]);
>+}
>+
> static void lru_add(struct lruvec *lruvec, struct folio *folio)
> {
> 	int was_unevictable = folio_test_clear_unevictable(folio);
>@@ -177,14 +190,10 @@ static void folio_batch_move_lru(struct folio_batch *fbatch, move_fn_t move_fn)
> 		 *
> 		 * We're bypassing normal cleanup. Clear flags that are not
> 		 * applicable to dead folios.
>-		 *
>-		 * Since the folio may be part of a huge page, unqueue from
>-		 * deferred split list to avoid a dangling list entry.
> 		 */
> 		if (is_lru_add && folio_ref_freeze(folio, 1)) {
> 			__folio_clear_active(folio);
> 			__folio_clear_unevictable(folio);
>-			folio_unqueue_deferred_split(folio);
> 			fbatch->folios[i] = NULL;
> 			folio_batch_add(&free_fbatch, folio);
> 			continue;
>@@ -201,6 +210,11 @@ static void folio_batch_move_lru(struct folio_batch *fbatch, move_fn_t move_fn)
> 
> 	/* Cleanup filtered dead folios. */
> 	if (is_lru_add) {
>+		/*
>+		 * Since the folios may be part of a huge page, unqueue them
>+		 * from the deferred split list to avoid a dangling list entry.
>+		 */
>+		folio_batch_unqueue_deferred_split(&free_fbatch);
> 		mem_cgroup_uncharge_folios(&free_fbatch);
> 		free_unref_folios(&free_fbatch);
> 	}
>@@ -1020,7 +1034,6 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
> 			free_huge_folio(folio);
> 			continue;
> 		}
>-		folio_unqueue_deferred_split(folio);
> 		__page_cache_release(folio, &lruvec, &flags);
> 
> 		if (j != i)
>@@ -1035,6 +1048,7 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
> 	}
> 
> 	folios->nr = j;
>+	folio_batch_unqueue_deferred_split(folios);
> 	mem_cgroup_uncharge_folios(folios);
> 	free_unref_folios(folios);
> }
>diff --git a/mm/internal.h b/mm/internal.h
>index 0ca863f2639a..ac72577a6e3e 100644
>--- a/mm/internal.h
>+++ b/mm/internal.h
>@@ -760,6 +760,7 @@ static inline bool folio_unqueue_deferred_split(struct folio *folio)
> 
> 	return __folio_unqueue_deferred_split(folio);
> }
>+void folio_batch_unqueue_deferred_split(struct folio_batch *fbatch);
> 
> static inline struct folio *page_rmappable_folio(struct page *page)
> {
>diff --git a/mm/vmscan.c b/mm/vmscan.c
>index 29b31446fc11..94859a830fb0 100644
>--- a/mm/vmscan.c
>+++ b/mm/vmscan.c
>@@ -2007,9 +2007,9 @@ static unsigned int move_folios_to_lru(struct list_head *list, bool do_rotate)
> 		if (unlikely(folio_put_testzero(folio))) {
> 			__folio_clear_lru_flags(folio);
> 
>-			folio_unqueue_deferred_split(folio);
> 			if (folio_batch_add(&free_folios, folio) == 0) {
> 				lruvec_unlock_irq(lruvec);
>+				folio_batch_unqueue_deferred_split(&free_folios);
> 				mem_cgroup_uncharge_folios(&free_folios);
> 				free_unref_folios(&free_folios);
> 				lruvec = NULL;
>@@ -2041,6 +2041,7 @@ static unsigned int move_folios_to_lru(struct list_head *list, bool do_rotate)
> 		lruvec_unlock_irq(lruvec);
> 
> 	if (free_folios.nr) {
>+		folio_batch_unqueue_deferred_split(&free_folios);
> 		mem_cgroup_uncharge_folios(&free_folios);
> 		free_unref_folios(&free_folios);
> 	}
>-- 
>2.52.0
>
>
