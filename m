Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396950;
	b=qKqvO+UgRPuz+lX1kK1NhFELjnPZmdITHT1OJZdVaq3uCY3y6G2+sG6aklRRqQRC4X5Z
	 fYrScnw9G2h0w348G6Mw5U0wCEu0ZF/2jn6+dkDRHQl1J9p0cutw2KdtoSYk2x6PjbbsO
	 FROIdIrvgwWaKnukVn8ibrRmGuSGAns8ZJa9coI+RtkeR6Hxap1es2zPMJCsp/zFVIrfu
	 gNRNuWfWRpUozT5QVk1uEQM4JsTKGNe7sROFCAfn9bWTh9bWw/NXwLXOzBcu6gOUtE7A6
	 WuQxHU7kZIzJuU4z9YJ/Qii5uMVQTlNuw4rTWbU2CLHEXZ8Krqs/9Oc49QxNyNeIXnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=giKqYnWzubQikXm12jGK16pXQcb6NbBHXFTnepSWaq8=;
	b=NCT8TM1aksaVSRbynrSYqP2eAOy5tXplTL37XXpPArplCjjwUKO42Ox+lRjEdkJcBNd7
	 U4PO3QTzInViMqaQ2VeZM8mEmoCecG5nqgRKgkMp2o7i7ptLXCvu/KmaZ7FZagK0Xl21K
	 xzLnZxvn4BMKRmL/O/7spaMHORD73udv7llPCKmV3EKB+D8xnfBVO9OhySPthif5MRh2u
	 96+wJzt/N7i8k7vEldLl7sh4s1rc+N/wwAN6+PAJy35xqg48HDu5Ao8nS2QmbwsT3EWA2
	 LzOvkb83isRjBHAvmXnKi/k+k1fHM9V28X+c+Wqg5FVl1PLs5rTWAtjjtpRDZx8VYhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=osdf9x8R;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D3D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D3D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=osdf9x8R
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so2286340f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794396948; x=1795001748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=giKqYnWzubQikXm12jGK16pXQcb6NbBHXFTnepSWaq8=;
        b=osdf9x8R60DxE2czkCgJF3YXs4wnKSO2Bs/fwLwiqahoAbVYsN6pwzVdp7b5dI8rwA
         mCW065lLUJK17EzttbDhZKOYOaRgtUdo0NJ3tEiJp72DVLvDnaJekZTFURt8nZwTI4V/
         q3WAOoRsWQUPI0KeVB3S6RLUcOwHvFwhwe+7XVn8o8nXx/XNQHMPZxY3T4GSU+0fPk1L
         Ao39jZpax/eZr5qJnD6qNolpBwRG0x+Wg72hvCcdAyzenzb4FTjNtsPb1oWdiIqDvwMb
         g2kMjMzwTCazqi/3GTtG5CNDu4wWY1MzHxqOlCYNdrkMWbL6d5igb2mWspsebyzb5WkY
         fXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396948; x=1795001748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=giKqYnWzubQikXm12jGK16pXQcb6NbBHXFTnepSWaq8=;
        b=kX3037LvuoQ6fzh0IuZ+OUcY7KPWT+0tJ0k7vYDlrw9M612OGj+zp1dwv2gomorhFq
         nKx5onSc0PlHP7EugNc1pZiyR8Ei2tbaPJh/AgfCbmBO8T4jrTsfIgrx7FDi5o+tj7T3
         7GK1qjxSUJ8KIerUNYzFQdlN/jqEdprOEG42aYMJugwcjD4vhbolRNRD3qOHky2NAkqJ
         6rR/z9KJ+ZbPetM/rOuBbfDZCpC11mB7s4CqadUh0PsEz+o5sfEpUAGzBxYRQkP8C98e
         cM1as9OpdPVnt6nLl1liRFakw5I5fwUO8eEDRAn00fyiyN+vTPO4VxZ8UQM2SlLEYh2J
         uohA==
X-Forwarded-Encrypted: i=1; AL+hErHtvxLZAEfGAdyWgmRaUoreUIa+M8x2e4Eb802+WkkgyBtsRUNknkGIZsyqtVh6TK6tp3cz0OK2WUSbXeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Xp8+7eiy8SUEoHH0NhOiHcvdaeJmbs2DTEBZZtDutQmj0Gc9p
	ixeeBgKOoBSK1u67MbzvKwtFnA5nYZXh9WGN/Ww4vIn+xS+UHOb6IQNd
X-Gm-Gg: AYBFou14N1Fr4lfxlre5HYZ3wmyqDnVooRq7hNQJ2xbrVnSIdWTTlq+CQQsF++LBiJY
	BSZ+sm4ESub34otp9jYrl6t2ccdjBtOXhQqXqIWMNo7t/cEjgsSXKZGSyJqv5sPmKzSU5BNWjue
	LvKeZUrXbH0hnh3LwbbPGjEN2Uwg/e6TRLoNjZ+EbYRjLhfPGUmVL2/pGDxu7SVonNBVka1Uz1b
	vj5cDdHMoXMa1Zb+FzJQj3ehruf1aXBiugFU0SyEayQTyC0bjB/aO9tmMGZdtxbRW3DPZdyHeTy
	s3cNBmuYr4sv3ypqJIWhESnHMA3+pgnsafdR2ZWt5GwWps4gkV0ABDsy6OcitkMPOISAvsPAtb6
	sEXFVU44OQS8WVaO2HEV1NBPtdYhwJYwRX785mrywhq+J5cONmlc5RLv0d/Hb66au6eQzKmIypn
	a7si2xgxi3RnPi7DUFkRWFMaUqguMU3CSeUqrTenj7FHuznsLxyTKvsex/VqDWledv8fgwc9eiB
	piwhKG4RXA31iaqqHd02uj62Uw6TiQgKOTX/GrBKlrffi5guCD+LRPsWygacvTqEZjgL73UCubs
	627q+sMkMv805A==
X-Received: by 2002:a05:6000:98e:b0:48d:f14a:9182 with SMTP id ffacd0b85a97d-499c898262cmr2615193f8f.20.1794396947836;
        Wed, 11 Nov 2026 03:35:47 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbbe5sm11598683f8f.42.2026.11.11.03.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:35:47 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Joanne Koong <joannelkoong@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [RFC PATCH 2/2] mm/huge_memory: detect partially mapped shared folios without per-page mapcounts
Date: Wed, 11 Nov 2026 12:31:38 +0100
Message-ID: <20261111113535.330078-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111113535.330078-1-azpijr@gmail.com>
References: <20261111113535.330078-1-azpijr@gmail.com>
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

With CONFIG_NO_PAGE_MAPCOUNT, __folio_remove_rmap() takes an anon folio
as partially mapped when its mapcount drops below the number of pages
and no entire mapping is left. With several MMs mapping the folio, the
mapcount can stay at or above the number of pages while some pages are
mapped by nobody:

 - parent and child zap the same half of a THP after fork();

 - two children zapped the same half and the parent removes the last
   PMD mapping.

The folio is never queued for deferred split, and the unused pages stay
allocated until every mapper is gone.

Queue the folio without PG_partially_mapped when the mapcount can't
tell, and have the shrinker walk the rmap of these candidates. If a page
is mapped by nobody while another one still is, mark the folio partially
mapped and split it as usual. Otherwise drop it from the queue, unless
the underused check wants it.

The walk needs one bit per page, which is too much for the stack with
large base pages, so it uses a static bitmap under a mutex.

Nothing changes with per-page mapcounts.

512 MB of THPs with the same half zapped by every mapper, memory freed
by the shrinker:

                                before    after
  2M,  2 processes                0 MB   252 MB
  2M,  3 processes                0 MB   237 MB
  2M,  2 children + parent PMD    0 MB   244 MB
  64K, 2 processes                0 MB   252 MB
  64K, 3 processes                0 MB   252 MB

The walk takes about 4 us per 64K folio in a TCG guest.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/huge_memory.c | 84 +++++++++++++++++++++++++++++++++++++++++++++---
 mm/rmap.c        | 21 ++++++++++--
 2 files changed, 98 insertions(+), 7 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 8c4a69c797ed..f80fa028dd34 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4632,6 +4632,10 @@ void deferred_split_folio(struct folio *folio, bool partially_mapped)
 	if (folio_order(folio) <= 1)
 		return;
 
+	/* Already queued, and there is no flag to set. */
+	if (!partially_mapped && !data_race(list_empty(&folio->_deferred_list)))
+		return;
+
 	/*
 	 * Exclude swapcache: originally to avoid a corrupt deferred split
 	 * queue. Nowadays that is fully prevented by __memcg1_swapout();
@@ -4655,9 +4659,6 @@ void deferred_split_folio(struct folio *folio, bool partially_mapped)
 			count_mthp_stat(folio_order(folio), MTHP_STAT_SPLIT_DEFERRED);
 			mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, 1);
 		}
-	} else {
-		/* partially mapped folios cannot become non-partially mapped */
-		VM_WARN_ON_FOLIO(folio_test_partially_mapped(folio), folio);
 	}
 	__list_lru_add(&deferred_split_lru, lru, &folio->_deferred_list, nid, memcg);
 	list_lru_unlock_irqrestore(lru, &flags);
@@ -4700,6 +4701,72 @@ static bool thp_underused(struct folio *folio)
 	return false;
 }
 
+/*
+ * One bit per page of the folio being checked. Too big for the stack of a
+ * shrinker with large base pages, so there is a single one.
+ */
+static DEFINE_MUTEX(mapped_pages_lock);
+static DECLARE_BITMAP(mapped_pages, MAX_PTRS_PER_PTE);
+
+static bool folio_mapped_pages_one(struct folio *folio,
+		struct vm_area_struct *vma, unsigned long addr, void *arg)
+{
+	const unsigned long nr_pages = folio_nr_pages(folio);
+	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, addr, 0);
+	unsigned long *nr_mapped = arg;
+	pgoff_t idx;
+
+	while (page_vma_mapped_walk(&pvmw)) {
+		if (!pvmw.pte) {
+			*nr_mapped = nr_pages;
+			page_vma_mapped_walk_done(&pvmw);
+			break;
+		}
+		idx = linear_anon_page_index(vma, pvmw.address) -
+		      folio_pgoff(folio);
+		if (idx < nr_pages && !__test_and_set_bit(idx, mapped_pages))
+			(*nr_mapped)++;
+	}
+
+	return *nr_mapped < nr_pages;
+}
+
+/*
+ * Without per-page mapcounts, a partial unmap of a folio that is mapped by
+ * several MMs is only detected at unmap time if the total mapcount drops
+ * below the number of pages. Check the page tables to find out whether a
+ * page is mapped by nobody while another one is still mapped.
+ */
+static bool folio_mapped_shared_partially(struct folio *folio)
+{
+	const unsigned long nr_pages = folio_nr_pages(folio);
+	unsigned long nr_mapped = 0;
+	struct rmap_walk_control rwc = {
+		.rmap_one = folio_mapped_pages_one,
+		.arg = &nr_mapped,
+		.anon_lock = folio_lock_anon_vma_read,
+	};
+
+	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
+
+	if (nr_pages > MAX_PTRS_PER_PTE)
+		return false;
+
+	mutex_lock(&mapped_pages_lock);
+	bitmap_zero(mapped_pages, nr_pages);
+	rmap_walk(folio, &rwc);
+	mutex_unlock(&mapped_pages_lock);
+
+	return nr_mapped && nr_mapped < nr_pages;
+}
+
+static bool folio_needs_mapped_check(struct folio *folio)
+{
+	return IS_ENABLED(CONFIG_NO_PAGE_MAPCOUNT) && folio_test_anon(folio) &&
+	       !folio_test_swapcache(folio) && !folio_entire_mapcount(folio) &&
+	       folio_maybe_mapped_shared(folio);
+}
+
 static enum lru_status deferred_split_isolate(struct list_head *item,
 					      struct list_lru_one *lru,
 					      void *cb_arg)
@@ -4744,6 +4811,15 @@ static unsigned long deferred_split_scan(struct shrinker *shrink,
 		list_lru_unlock_irq(lru);
 		rcu_read_unlock();
 
+		if (!folio_test_partially_mapped(folio) &&
+		    folio_needs_mapped_check(folio)) {
+			if (!folio_trylock(folio))
+				goto requeue;
+			/* Sets PG_partially_mapped and puts it back on the queue. */
+			if (folio_mapped_shared_partially(folio))
+				deferred_split_folio(folio, true);
+			folio_unlock(folio);
+		}
 		if (!folio_test_partially_mapped(folio)) {
 			/*
 			 * See try_to_map_unused_to_zeropage(): we cannot
@@ -4752,7 +4828,7 @@ static unsigned long deferred_split_scan(struct shrinker *shrink,
 			 */
 			if (folio_test_mlocked(folio))
 				goto next;
-			underused = thp_underused(folio);
+			underused = split_underused_thp && thp_underused(folio);
 			if (!underused)
 				goto next;
 		}
diff --git a/mm/rmap.c b/mm/rmap.c
index 0faef46806e5..95444ed6189a 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1803,6 +1803,7 @@ static __always_inline void __folio_remove_rmap(struct folio *folio,
 	atomic_t *mapped = &folio->_nr_pages_mapped;
 	int last = 0, nr = 0, nr_pmdmapped = 0;
 	bool partially_mapped = false;
+	bool maybe_partially_mapped = false;
 
 	__folio_rmap_sanity_checks(folio, page, nr_pages, level);
 
@@ -1821,6 +1822,16 @@ static __always_inline void __folio_remove_rmap(struct folio *folio,
 			} else {
 				partially_mapped = nr < folio_large_nr_pages(folio) &&
 						   !folio_entire_mapcount(folio);
+				/*
+				 * With other MMs mapping the folio, the total
+				 * mapcount cannot tell whether the pages we
+				 * just unmapped are still mapped by anyone.
+				 * Let the shrinker find out.
+				 */
+				maybe_partially_mapped = !partially_mapped &&
+					nr_pages < folio_large_nr_pages(folio) &&
+					!folio_entire_mapcount(folio) &&
+					folio_maybe_mapped_shared(folio);
 				nr = 0;
 			}
 			break;
@@ -1850,6 +1861,10 @@ static __always_inline void __folio_remove_rmap(struct folio *folio,
 			} else {
 				partially_mapped = last &&
 						   nr < folio_large_nr_pages(folio);
+				/* Only PTE mappings by several MMs are left. */
+				maybe_partially_mapped = last &&
+					!partially_mapped &&
+					folio_maybe_mapped_shared(folio);
 				nr = 0;
 			}
 			break;
@@ -1888,10 +1903,10 @@ static __always_inline void __folio_remove_rmap(struct folio *folio,
 	 * Device private folios do not support deferred splitting and
 	 * shrinker based scanning of the folios to free.
 	 */
-	if (partially_mapped && folio_test_anon(folio) &&
-	    !folio_test_partially_mapped(folio) &&
+	if ((partially_mapped || maybe_partially_mapped) &&
+	    folio_test_anon(folio) && !folio_test_partially_mapped(folio) &&
 	    !folio_is_device_private(folio))
-		deferred_split_folio(folio, true);
+		deferred_split_folio(folio, partially_mapped);
 
 	__folio_mod_stat(folio, -nr, -nr_pmdmapped);
 
-- 
2.56.0

