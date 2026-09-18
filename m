Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CA551CF4A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754580; cv=none; b=IDM8lyCtvhhq2XAvr6MZTuypoI1FNcf3kRJ/X+mbyTA48c0L9Xh1wVU5sMFhBZzaOAjOV9TCTCkrgH0Fwsx4GEUOlucbLdQYDHYVOdDR2yNPI/VTGbK/AA8Q5mWbaF7jN6f7EXymkylQm5jVVNFM6Ph9eFbZsNytHySbyjIDRfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754580; c=relaxed/simple;
	bh=IJvK4Vvy0VCt+V23WX0pSPCnBeAybxb27qXqZn6DYsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLb+iNr+/QWxGuA0RqQRr4b0lK+pXWI4Qjo4hzkSkS8SY2PThmHwyvG1yp7rcHvpN4W9X3x9eicwQNgxQ8M08dPEtG4iU6nc/3gEoSJGERyVe7iUAjtu6LOmZCMWFRMP1d+wadLust+3XX6jq0be55faL4K1ZnFp2viZOiFuXKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uryn2Xnt; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uryn2Xnt"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6c72bd8a017so662163eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754575; x=1790359375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iKzNgqV0ZA0AZzF6ydZQcV12V6+MZv1Kiypu+ZDENgo=;
        b=Uryn2XntMQmAIkaYR7Cii24/foDihxsCV5gSYUVWt7q9yJUigTcHjWzqV0eE6zuSlW
         o/czTtTnPbKY9aZ/22ANz/VJZrFQJod9F3llZambAKuNyXs7uli1FTklM/D8vovyJvqx
         BD8fbMnRXV9Z7udumeUCOCCgMIbr7fsY6V0muOlvn3TYBzPLrq66PaUpP2iDjyOO4ejI
         bvQ2/iEEK8useDyRF/VNKhJoYch5TCKzTh+3OI5ew5g2kIndT955Hvw0ybDolbUoW+oU
         2Xsjh7RDi88oqELySswrvh4vALVVRBUj54sbwS/dozhRGf7wrZsUWBMmDUcdd9fpmL+e
         WnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754575; x=1790359375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iKzNgqV0ZA0AZzF6ydZQcV12V6+MZv1Kiypu+ZDENgo=;
        b=naEmI/HL1dJnB4tmHtf/b25VjEt7s0joQ1f4TK7efrF2rzN6LJ278y4FR3nz7jZeWA
         FelvmIu87YOnedO6oMQolByekVU92kPDcbq/Z8y2E8Pa8u1ZCzODn6LQOt+y9yTjj4UU
         klaYX7fjdGpU9p0vxuSlRncDbtmcnO8olWO1FQUC8DIDI+n7EyfjhBcqGKFcLT4L0xOl
         3/WhInHqmLqEo7n2HT2ZnoEU/9RAztcFZ7VOaupU/WzU4Oeqjv0t7z3NpGKg7r/eK3D2
         PkbnX7gPUiP4XR6isqsETGF70laIeX5wS3QgBJqxsxmWqYYdifA6fUC0FLLNxrpiKs3i
         1++w==
X-Forwarded-Encrypted: i=1; AKwUvBx30pHWtalRlEX6P2BEVPGWTdy97FJkqlpDurf0Mr8fantfRinIfihVBCmp+27zlq8wG1q2RnXZQ0jZhC0=@vger.kernel.org
X-Gm-Message-State: AFuF++npFE12opzBa7S2p7fD3yX7v1021YSEjSwJC4XH5fenb+YXJlgK
	6X5+nG+nZcGQUNy7kxSl+aMkvF1NrVaKUxTjni3/YH86736QN+DLpd38
X-Gm-Gg: AYBFou09l/HDTOQWgwY1Jf7TzO4cTxWWseH3DrNbOvEwl2UZhOmybg9vnDRe5i09/bW
	0ICo9W/BAnn4ucAmmqYPYEa8BiCIRmchhT51yuoeDQ1I8IvFs3hQfg3nuXcFBOwPt7NOOV/TRtJ
	42LN5FBBqezGYV3Xdth+FN+uCpNT79Ie3eofzsf5iJnomDXTKLeN1ztYdtc9K25RoL4nYjRJsIL
	+5sR/63dXX3NaeCkbtcqwSnqS5sDHZMsB+1E97VkVTDaHeUlXdgIx9/i4aHRHZs3lr+wHIV/+aM
	WwjXOGGB2fXCrPCjiXVb4G1NOPqWPOoLM8asBH7OSdnJ53A7DEAJxPA1ZUYFj3BAZwlzzKrVrAy
	FgwJ73RdbUdgAAs/KMYRWQFVidjRcIEp07H08GxmUwoYi5tiuF+RuhepFdN0kUydoqDbKBJqWc8
	KlvEbM7i3Qi3otBbSKXj6ViXQ/JD3Boo2u3uYO4qboVeK2KeE5QRDepUeMpwSbzbbY0kJCX9bkr
	J85ODf+VJPMkyyDcpCpyw==
X-Received: by 2002:a05:6820:190d:b0:6cd:3fbd:1d5f with SMTP id 006d021491bc7-6cd3fbd2951mr340212eaf.73.1789754575416;
        Fri, 18 Sep 2026 11:02:55 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:12::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd34b35d71sm522300eaf.7.2026.09.18.11.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:02:54 -0700 (PDT)
From: Nhat Pham <nphamcs@gmail.com>
To: akpm@linux-foundation.org
Cc: chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	yosry@kernel.org,
	david@kernel.org,
	muchun.song@linux.dev,
	shikemeng@huaweicloud.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	chengming.zhou@linux.dev,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	qi.zheng@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	riel@surriel.com,
	gourry@gourry.net,
	haowenchao22@gmail.com,
	corbet@lwn.net,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	tj@kernel.org,
	mkoutny@suse.com,
	skhan@linuxfoundation.org,
	kunwu.chan@linux.dev,
	kernel-team@meta.com,
	nphamcs@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [PATCH v5 07/11] mm, swap: reclaim physical slots backing cache-only vswap entries
Date: Fri, 18 Sep 2026 11:02:37 -0700
Message-ID: <20260918180241.3424851-8-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918180241.3424851-1-nphamcs@gmail.com>
References: <20260918180241.3424851-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a vswap entry's swap_count drops to 0 while its folio is still in
the swap cache, the entry is cache-only and its physical slot is
redundant. swap_put_entries_direct() tries to reclaim it at put time, but
folio_put_swap() does not, and even the direct route can come back empty:
the folio may be under the writeback that allocated the slot, its trylock
may be lost, it may still be mapped, or swap_only_has_cache() may be false
on a partial run. Nothing retried afterwards, so the slot stayed pinned.

Reclaim such slots from the physical reclaim scanner, once swap is more
than half used (vm_swap_full()), to free physical capacity for new
allocations. Reclaim goes through folio_free_swap(), which ends in
folio_set_dirty(), so a reclaimed slot costs a re-swapout if the folio is
dropped again.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/swap_table.h |  12 +++--
 mm/swapfile.c   | 117 ++++++++++++++++++++++++++++++++++++++++++++++++
 mm/vswap.h      |  31 +++++++++++++
 3 files changed, 156 insertions(+), 4 deletions(-)

diff --git a/mm/swap_table.h b/mm/swap_table.h
index 7d094694ec37..79f06642a553 100644
--- a/mm/swap_table.h
+++ b/mm/swap_table.h
@@ -31,7 +31,7 @@ struct swap_memcg_table {
  * NULL:     |---------------- 0 ---------------| - Free slot
  * Shadow:   |SWAP_COUNT|Z|---- SHADOW_VAL ---|1| - Swapped out slot
  * PFN:      |SWAP_COUNT|Z|------ PFN -------|10| - Cached slot
- * Pointer:  |-------- vswap offset --------|100| - vswap rmap
+ * Pointer:  |C|------- vswap offset -------|100| - vswap rmap
  * Bad:      |------------- 1 -------------|1000| - Bad slot
  *
  * COUNT is `SWP_TB_COUNT_BITS` long, Z is the `SWP_TB_ZERO_FLAG` bit,
@@ -399,14 +399,18 @@ static inline unsigned short __swap_cgroup_clear(struct swap_cluster_info *ci,
  * On physical clusters, a Pointer-tagged entry stores the offset of the
  * vswap entry that owns this physical slot (the reverse map). Only the
  * offset is stored; the swap type is implicit (always vswap_si->type,
- * since there is exactly one vswap device).
+ * since there is exactly one vswap device). The top bit is reserved as
+ * a cache-only flag, set when vswap swap_count drops to 0 but the folio
+ * is still in swap cache.
  *
- *   Pointer:  |---- vswap offset ----|100|
+ *   Pointer:  |C|---- vswap offset ----|100|
+ *              C = SWP_RMAP_CACHE_ONLY (the top bit)
  */
 #define SWP_TB_PTR_MARK_BITS	3
 #define SWP_TB_PTR_MARK		0b100UL
 #define SWP_TB_PTR_MARK_MASK	((1UL << SWP_TB_PTR_MARK_BITS) - 1)
-#define SWP_RMAP_ENTRY_MASK	(~SWP_TB_PTR_MARK_MASK)
+#define SWP_RMAP_CACHE_ONLY	(1UL << (BITS_PER_LONG - 1))
+#define SWP_RMAP_ENTRY_MASK	(~(SWP_RMAP_CACHE_ONLY | SWP_TB_PTR_MARK_MASK))
 
 static inline bool swp_tb_is_pointer(unsigned long swp_tb)
 {
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 13d2ae60fe4c..2efb47b4cc4f 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -142,6 +142,11 @@ static DEFINE_PER_CPU(struct percpu_vswap_cluster, percpu_vswap_cluster) = {
 	.lock = INIT_LOCAL_LOCK(),
 };
 
+static void vswap_mark_cache_only(struct swap_cluster_info *ci,
+				  unsigned int ci_off);
+static void vswap_clear_cache_only(struct swap_cluster_info *ci,
+				   unsigned int ci_start, int nr);
+
 /* May return NULL on invalid type, caller must check for NULL return */
 static struct swap_info_struct *swap_type_to_info(int type)
 {
@@ -874,6 +879,55 @@ static int swap_cluster_setup_bad_slot(struct swap_info_struct *si,
 	return ret;
 }
 
+/*
+ * Try to reclaim a Pointer-tagged physical slot backing a vswap entry.
+ * The physical cluster lock must NOT be held. Returns the backing folio's
+ * page count, negated if the slots could not be reclaimed, or 0 if the
+ * folio could not be shown to own @offset (i.e. there is a race).
+ */
+static int try_to_reclaim_vswap_backing(struct swap_info_struct *si,
+					unsigned long offset,
+					swp_entry_t vswap_entry)
+{
+	swp_entry_t phys_base;
+	struct folio *folio;
+	unsigned int i;
+	int ret;
+
+	folio = swap_cache_get_folio(vswap_entry);
+	if (!folio)
+		return 0;
+
+	if (!folio_trylock(folio)) {
+		/* Unvalidated: the folio may not even own @offset. */
+		folio_put(folio);
+		return 0;
+	}
+
+	if (!folio_matches_swap_entry(folio, vswap_entry)) {
+		folio_unlock(folio);
+		folio_put(folio);
+		return 0;
+	}
+
+	i = vswap_entry.val - folio->swap.val;
+	phys_base = vswap_to_phys(folio->swap);
+	if (!phys_base.val || swp_type(phys_base) != si->type ||
+	    swp_offset(phys_base) + i != offset) {
+		folio_unlock(folio);
+		folio_put(folio);
+		return 0;
+	}
+
+	/* The run is ours: skip it all, whether or not the free succeeds. */
+	ret = folio_nr_pages(folio);
+	if (!folio_free_swap(folio))
+		ret = -ret;
+	folio_unlock(folio);
+	folio_put(folio);
+	return ret;
+}
+
 /*
  * Reclaim drops the ci lock, so the cluster may become unusable (freed or
  * stolen by a lower order). @usable will be set to false if that happens.
@@ -1155,6 +1209,7 @@ static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
 	long to_scan = 1;
 	unsigned long offset, end;
 	struct swap_cluster_info *ci;
+	swp_entry_t vswap_entry;
 	unsigned long swp_tb;
 	int nr_reclaim;
 
@@ -1179,6 +1234,19 @@ static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
 					offset += abs(nr_reclaim);
 					continue;
 				}
+			} else if (swp_tb_is_pointer(swp_tb) &&
+				   (swp_tb & SWP_RMAP_CACHE_ONLY)) {
+				vswap_entry = swp_tb_ptr_to_swp_entry(swp_tb);
+				spin_unlock(&ci->lock);
+				nr_reclaim = try_to_reclaim_vswap_backing(si, offset,
+									  vswap_entry);
+				ci = swap_cluster_lock(si, offset);
+				if (!ci)
+					goto next;
+				if (nr_reclaim) {
+					offset += abs(nr_reclaim);
+					continue;
+				}
 			}
 			offset++;
 		}
@@ -1749,6 +1817,8 @@ static void swap_put_entries_cluster(struct swap_info_struct *si,
 			}
 			/* count will be 0 after put, slot can be reclaimed */
 			need_reclaim = true;
+			if (swap_is_vswap(si))
+				vswap_mark_cache_only(ci, ci_off);
 		}
 		/*
 		 * A count != 1 or cached slot can't be freed. Put its swap
@@ -1855,6 +1925,8 @@ static int swap_dup_entries_cluster(struct swap_info_struct *si,
 			goto failed;
 		}
 	} while (++ci_off < ci_end);
+	if (swap_is_vswap(si))
+		vswap_clear_cache_only(ci, ci_start, nr);
 	swap_cluster_unlock(ci);
 	return 0;
 failed:
@@ -2004,6 +2076,51 @@ int folio_alloc_swap(struct folio *folio)
 	return order ? -E2BIG : -ENOMEM;
 }
 
+static void vswap_mark_cache_only(struct swap_cluster_info *ci,
+				  unsigned int ci_off)
+{
+	struct swap_cluster_info_dynamic *ci_dyn;
+	struct swap_cluster_info *pci;
+	swp_entry_t phys;
+	unsigned long vt;
+
+	ci_dyn = container_of(ci, struct swap_cluster_info_dynamic, ci);
+	vt = __vtable_get(ci_dyn, ci_off);
+
+	if (vtable_type(vt) == VSWAP_SWAPFILE) {
+		phys = vtable_to_phys(vt);
+		pci = __swap_entry_to_cluster(phys);
+		swap_rmap_mark_cache_only(pci, swp_cluster_offset(phys));
+	}
+}
+
+/*
+ * Clear the cache-only rmap hint for entries re-referenced from count 0 to 1
+ * (no longer reclaimable), so the physical reclaim scanner skips them.
+ */
+static void vswap_clear_cache_only(struct swap_cluster_info *ci,
+				   unsigned int ci_start, int nr)
+{
+	struct swap_cluster_info_dynamic *ci_dyn;
+	struct swap_cluster_info *pci;
+	unsigned long swp_tb, vt;
+	swp_entry_t phys;
+	unsigned int off;
+
+	ci_dyn = container_of(ci, struct swap_cluster_info_dynamic, ci);
+	for (off = ci_start; off < ci_start + nr; off++) {
+		swp_tb = __swap_table_get(ci, off);
+		if (!swp_tb_is_folio(swp_tb) || swp_tb_get_count(swp_tb) != 1)
+			continue;
+		vt = __vtable_get(ci_dyn, off);
+		if (vtable_type(vt) != VSWAP_SWAPFILE)
+			continue;
+		phys = vtable_to_phys(vt);
+		pci = __swap_entry_to_cluster(phys);
+		swap_rmap_clear_cache_only(pci, swp_cluster_offset(phys));
+	}
+}
+
 static void __swap_cluster_free_phys_backing(struct swap_info_struct *psi,
 					     struct swap_cluster_info *pci,
 					     unsigned int ci_start,
diff --git a/mm/vswap.h b/mm/vswap.h
index 6f952b2591d1..b79866d5999c 100644
--- a/mm/vswap.h
+++ b/mm/vswap.h
@@ -44,6 +44,37 @@ static inline bool is_vswap_entry(swp_entry_t entry)
 	return swap_is_vswap(__swap_entry_to_info(entry));
 }
 
+/*
+ * Rmap cache-only helpers for physical cluster Pointer-tagged entries.
+ * SWP_RMAP_CACHE_ONLY records, inline on the physical swap_table entry,
+ * that the backing vswap entry has swap_count == 0 (swap-cache-only, so
+ * reclaimable). The physical reclaim scanner reads it directly instead of
+ * chasing the rmap into the vswap layer and paying the cluster-lookup
+ * indirection.
+ *
+ * Callers hold the vswap cluster lock, not the physical one. The rmap is
+ * only touched while the vtable holds the slot as SWAPFILE, and that
+ * window is opened and closed under the vswap cluster lock, so the
+ * allocator has finished writing the entry by then.
+ */
+static inline void swap_rmap_mark_cache_only(struct swap_cluster_info *ci,
+					     unsigned int off)
+{
+	atomic_long_t *table;
+
+	table = rcu_dereference_protected(ci->table, true);
+	atomic_long_or(SWP_RMAP_CACHE_ONLY, &table[off]);
+}
+
+static inline void swap_rmap_clear_cache_only(struct swap_cluster_info *ci,
+					      unsigned int off)
+{
+	atomic_long_t *table;
+
+	table = rcu_dereference_protected(ci->table, true);
+	atomic_long_and(~SWP_RMAP_CACHE_ONLY, &table[off]);
+}
+
 /*
  * Virtual table entry encoding for vswap clusters.
  *
-- 
2.53.0-Meta

