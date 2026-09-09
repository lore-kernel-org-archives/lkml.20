Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51CE4B049B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948515; cv=none; b=qz4j66OEuAXoR0wgeliS8wP+1DeY182f8gz5J8eYILSi0uxaBWCJAVo4YZYVahjIas22a6qSwGu+sl6kPZrQOQuknonmNgxCGCmPZ3/PuRcGV6xQemdKxUwEjMLZ/M0Orcd3YxmGlppFT18SJi562I1XMgOCmsPDPYOvayoH/R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948515; c=relaxed/simple;
	bh=sZg+Qi8C9DDFoJlNdlSunXk4grOh7FnoNGg+LOx/5FY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=B4RPshiQEIMtCjTF0dqLAyfNNVmPqjAFS4QqgeZzX33VhAPTL5+WWaBa0hpPOxp6lfuOWCbuhDFdyiEaJCCEl6eDgPObacGFgqs9EVr+vgniE4tQDasU8HawkpFl0s6Sjq6h4K8QSJ9+1c5M31QTM3cILycsKGKx/4Eih7AnK+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XVIvxlSM; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XVIvxlSM"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66fc2844f0eso5733256d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788948512; x=1789553312; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XZP7Izy7OCFS/wAqshdE6rdYOBHqDiQ7cVSskEfKxxg=;
        b=XVIvxlSM1uhJcR7djRV0gNPFg06Td/5yyfzj7kt0zuSN/nq7YJAe0pznxOUwic5Z96
         T5VO9mPvRCQlVw/dF65cWvu8wcZMwtxrzKgwXH4EweWIcis0ZV3/o5E0dfO0zimGo1Xk
         VvqOk1cK37CEjIvxOrgqIQDawXqHwwpXhjr8Wqg4Oy+b8pHlz20dQM/FCk6P3I3F8jH8
         tqoIFc0l+BO9af50GeytgtVNGofxtSb+FDbiVz/A7fo9nPBS4Akx+0g7wVZ0RVd1t7Q9
         UYZ69KeAjdGuX82EEqs57Qnbh/wb/WUts1rr2lGC+45bEbm/H6mjmNk2F0qyJhyvpJWu
         wIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948512; x=1789553312;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XZP7Izy7OCFS/wAqshdE6rdYOBHqDiQ7cVSskEfKxxg=;
        b=QMAdKdSCm3OVJ8qMAq4fsmYbl4XpUE8JnhzSlNnRlITVyU09axN7hoJ1uOE6mRm/DO
         8wJZxDz1DY2NqCsVPwSahggYls3VH6mZtC5Z6FEJ2J893IHg8Sxbg7qYcQepihOuRQOt
         vKQmnboyidHUnG+RVwRBzPVco8ueJ0GZrAWDBlMYq1zdU+kA/oJs3a6squNyzWCtmNoy
         pqkeh0vri+E9aO3LUNAUIzhHNvPg3HudzgUXnstXcllheANoMZc31+fQcsqyhbtC7oQw
         VS4UPiKhplWhtVcckac/XVANES9901rHaZNP9O0DX0QUsOKII8FC6qIYgfmHS4LfE9Z6
         /8xg==
X-Forwarded-Encrypted: i=1; AKwUvBwrtQIBp3kHwc2Sd++zj95XRbr5gViwAzqKbJD8QLERP4Lj6J5LhSm/YFljiemhRRUF3paUr8RSDdmVs6c=@vger.kernel.org
X-Gm-Message-State: AFuF++nufISI3xzGylyEwtxPDpiJkdv4Ht4Ll6DBxeMKlrtH54D41Zvt
	1FaImdxSXUh3gl7CcCo+narTPseymnEh24zC3V5MCKNrkmB5Ltq4La4Y959Ll0n1qA==
X-Gm-Gg: AYBFou0XVXlenAniz4CMnQ05stzzAgpyz8UM91N1RkPKNneDFRNEWmGxPVf9Gx9ubDL
	BZfx+5lzZBBGeQ0aBvgWVR2rjNQqPnwLOC7lsDUWMJCSk2lON6HXQwI+c0iP6gudfWQ1xGipTkp
	0gOnoBjQjPAfK6OkwFkUwWiSNaW4wE00KnZSu685tZ/DX7KDm8xDu4z8bj2QaBPU9ANYkVoJz7P
	ZZa1KR8ZIfwk05bM9YYDVz6BmmUWScMJI/ruMuV2iGGtsK5hZ07ltPLdJejBdfV/pqh88ZD5bEU
	viJuZQ+Wp8UBbJHlwWQzqv03LUfedBurloGYj6AgnTZylkS+PgB9AVDr6ydtFGQkKIEePgqlwWl
	qjg27Zb9ERnJUsahMjxjUFDhlBzbo30cppBV/vimQnRsSZ/DhWXU5wttZ7RMzGcclreSPZRjeX0
	yrX1hQDviP/iiOSpTUIq8EjFn+YKCWP6Osuv85w+C2ktFlTYfsrhQfsCZsozG80O6O+fnwMaIap
	OKAYuGIbJtwyhcYAxkPs/n+Zm+gGN7CfOqLElgY41/aBlf5OUkVK8ER9kg=
X-Received: by 2002:a05:690e:12c8:b0:66f:bdef:7d95 with SMTP id 956f58d0204a3-66fbdef8a7bmr8856733d50.20.1788948510918;
        Wed, 09 Sep 2026 03:08:30 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb47a8b8fsm12160676d50.2.2026.09.09.03.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:08:29 -0700 (PDT)
Date: Wed, 9 Sep 2026 03:08:23 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
cc: Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, Alexandre Ghiti <alex@ghiti.fr>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    David Hildenbrand <david@kernel.org>, JP Kobryn <jp.kobryn@linux.dev>, 
    Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, 
    Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, 
    Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
    Leonardo Bras <leobras.c@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
    Marcelo Tosatti <mtosatti@redhat.com>, 
    Matthew Wilcox <willy@infradead.org>, 
    Mel Gorman <mgorman@techsingularity.net>, 
    Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
    Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
    Oscar Salvador <osalvador@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
    Qi Zheng <qi.zheng@linux.dev>, Rik van Riel <riel@surriel.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Shakeel Butt <shakeel.butt@linux.dev>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Vlastimil Babka <vbabka@kernel.org>, 
    Yang Shi <yang@os.amperecomputing.com>, Yu Zhao <yuzhao@google.com>, 
    Zach O'Keefe <zokeefe@google.com>, Zi Yan <ziy@nvidia.com>, 
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 13/26] mm/fbatch: no lru_add_drain to
 collect_longterm_unpinnable_folios()
In-Reply-To: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Message-ID: <716d267e-11ea-f400-2cfe-d8775e6ac027@google.com>
References: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

collect_longterm_unpinnable_folios() has no use for lru_add_drain() nor
lru_add_drain_all(), now that the per-cpu fbatch references are gone.

Replace the recently added lru_cache_drain_for_folio() by a temporary
stub, so any callers outside mm may build independently of this series.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 include/linux/swap.h |  9 +++++----
 mm/folio.c           | 48 --------------------------------------------
 mm/gup.c             |  9 ---------
 3 files changed, 5 insertions(+), 61 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index a6fad5127118..0052a6890435 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -304,11 +304,12 @@ void lru_add_drain_all(void);
 
 enum lru_cache_drained {
 	LRU_CACHE_NOT_DRAINED,
-	LRU_CACHE_DRAINED,
-	LRU_CACHE_DRAINED_ALL,
 };
-void lru_cache_drain_for_folio(const struct folio *folio,
-		unsigned int extra_refs, enum lru_cache_drained *drained);
+static inline void lru_cache_drain_for_folio(const struct folio *folio,
+		unsigned int extra_refs, enum lru_cache_drained *drained)
+{
+	/* Temporary stub for callers' build independent of mm/fbatch series */
+}
 
 /* linux/mm/folio-compat.c */
 void mark_page_accessed(struct page *page);
diff --git a/mm/folio.c b/mm/folio.c
index 5021639c5494..d66aa2469e86 100644
--- a/mm/folio.c
+++ b/mm/folio.c
@@ -33,7 +33,6 @@
 #include <linux/page_idle.h>
 #include <linux/local_lock.h>
 #include <linux/buffer_head.h>
-#include <linux/kvm_types.h>
 
 #include "internal.h"
 #include "page_alloc.h"
@@ -843,53 +842,6 @@ void lru_add_drain_all(void)
 }
 #endif /* CONFIG_SMP */
 
-/**
- * lru_cache_drain_for_folio() - drain LRU caches if the caches might hold
- *				 folio references
- * @folio: The folio.
- * @extra_refs: Extra folio references held by the caller.
- * @drained: Drain status for batch folio processing.
- *
- * Drain LRU caches if the caches might hold folio references. Start
- * with a local LRU cache drain, to then drain LRU caches on all CPUs if
- * local draining was insufficient.
- *
- * This function detects LRU cache references by comparing the folio refcount
- * with the sum of the expected folio refcount + extra references held by the
- * caller. Note that we cannot rely on PG_lru to reliably detect all LRU
- * cache references, and there are rare scenarios (concurrent folio (un)mapping)
- * where this function might miss detecting LRU cache references.
- *
- * If @drained is not NULL, the function will avoid re-draining LRU caches
- * when processing multiple folios in a row. In that case, the variable
- * @drained points at must be initialized to LRU_CACHE_NOT_DRAINED before
- * the first invocation by the caller.
- */
-void lru_cache_drain_for_folio(const struct folio *folio,
-		unsigned int extra_refs, enum lru_cache_drained *drained)
-{
-	if (!folio_may_be_lru_cached(folio))
-		return;
-
-	if (!drained || *drained == LRU_CACHE_NOT_DRAINED) {
-		if (folio_ref_count(folio) ==
-		    folio_expected_ref_count(folio) + extra_refs)
-			return;
-		lru_add_drain();
-		if (drained)
-			*drained = LRU_CACHE_DRAINED;
-	}
-	if (!drained || *drained == LRU_CACHE_DRAINED) {
-		if (folio_ref_count(folio) ==
-		    folio_expected_ref_count(folio) + extra_refs)
-			return;
-		lru_add_drain_all();
-		if (drained)
-			*drained = LRU_CACHE_DRAINED_ALL;
-	}
-}
-EXPORT_SYMBOL_FOR_KVM(lru_cache_drain_for_folio);
-
 atomic_t lru_disable_count = ATOMIC_INIT(0);
 
 /*
diff --git a/mm/gup.c b/mm/gup.c
index eb898ea1ee22..fa17f99cbb60 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2266,14 +2266,12 @@ static unsigned long collect_longterm_unpinnable_folios(
 		struct list_head *movable_folio_list,
 		struct pages_or_folios *pofs)
 {
-	enum lru_cache_drained drained = LRU_CACHE_NOT_DRAINED;
 	unsigned long collected = 0;
 	struct folio *folio;
 	long i = 0;
 
 	for (folio = pofs_get_folio(pofs, i); folio;
 	     folio = pofs_next_folio(folio, pofs, &i)) {
-		const int pin_refs = folio_has_pincount(folio) ? 1 : GUP_PIN_COUNTING_BIAS;
 
 		if (folio_is_longterm_pinnable(folio))
 			continue;
@@ -2288,13 +2286,6 @@ static unsigned long collect_longterm_unpinnable_folios(
 			continue;
 		}
 
-		/*
-		 * We drain not only to make the folio_isolate_lru() succeed,
-		 * but also to remove any other folio references from LRU
-		 * caches.
-		 */
-		lru_cache_drain_for_folio(folio, pin_refs, &drained);
-
 		if (!folio_isolate_lru(folio))
 			continue;
 
-- 
2.51.0

