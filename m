Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562630;
	b=BxRoN95/GAL9UmonKuU7zLFAFy9ddUHw1qewgZXzrPen4GVJwqZWCT2owmdgM++A8Kd5
	 tsUjUoezXEQQ6Fq3jMSR+5jrKKYwFHCITbU3wATf/h4i8tSKDJKZfeXEDIsqLHzBHbeXi
	 hOc8cI2J12vM/OeU5CXlFW42JTmDsiAJjYnxreFEhFUYiRlJ7gkYV+jBDwvdHQPJBKvDd
	 SbRSiSu3CIw8XGB/Bv/eA0zZY4Yo2eGgolVtn8hXXN4opP7KCCqiyqARBna49RH/cm47e
	 +WTXustqGIba+XUu1axlaZTOnXUnHHeX5wKNIuQR/KoFzDjCXNVDGAaVOecIL4asTEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v9sAzGLg/w6ld0X6rea65eNki+SZx/1duzekqGZ4zFk=;
	b=ksiP7HE348XVB3kXJLX1oivVJ2m/RbBjEOKbvwVuMCB2X0f4b6A3ej8+DRk58LJQf+GT
	 1sBc/7M6LMo3+2G8Ojxg69c3o19sGSny18RIl2fUi8wIVEpiCTcP/Q7Ow9uOCjDnISggm
	 okqoRZu9mQvdGJBsxYxG+/drXvfNRXgXaPBGJs/zGFGGOobh5m8+mBftafRnkZ2j2ilM4
	 HcwR1SORCVMbxFW/OIjGayEE6zIJs7bcfTtZasvvkkEIQ+TX9Nv/kHmg5Ns6LBqsjyXUP
	 5FJUUAA2BbONb2/dAg+idAatIRZhVwAZV3VcYONQxraGVhYT5B1bRTAQ8kKGcjuKKWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d2MKmKiQ;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE14160A2604
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE14160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d2MKmKiQ
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0d63f60bcso2998657b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562629; x=1793167429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v9sAzGLg/w6ld0X6rea65eNki+SZx/1duzekqGZ4zFk=;
        b=d2MKmKiQw53XEz/6wW1cfLKXINzt0nH9ypB35hYGq2/hTQTD1lCxNyALyolcBz3+mg
         YoHKv6RqqxWsQCz5t9O2bl5VvnjUw8opsguiNBLIwpN0JfQ+hG/SvZdquVcYLBmrbH1Y
         bGDvn7tpaw+SaxcSrJkKhi/yMVjbS+8HAGabET/ljqwk+Yk8l7pH2wqotDonOGx5duqG
         0I5un1A9LqXxYUJIaj1wJDkvCxM8vfAppRxH/HHBr3pmtyUFu5ivjYKq5sYH6D4jFJx2
         HS/X9MiieP09AupQJ7iwhOhLek+0TeOJQxvfNz/4PlEfiBrbuuAcE1HiHn0G1Xed+1rf
         4tPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562629; x=1793167429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v9sAzGLg/w6ld0X6rea65eNki+SZx/1duzekqGZ4zFk=;
        b=J/Taw47OxJz6fiXUYTWmE+hrHloTq1w8tTC6rOEHlIFWKyEFGO7VkIqvLWwXGG22yn
         PprPAPDFQVbhQm9GKGKuBH3F1EBe9CN9am/38eJv8JG82i/CK9XyPXi9oklizKnbYAl9
         z2f8ds+enIk2Z1uh/zcjHQ2/2dIdF1t229EkN2yR/ACgGKiuUJqFBP4Z+kmHnzDMnWXd
         zh6HbwQqLPfzxvj68Yncbi/TNflH6JT3TDyNJvpGZs8lzEJAD2MtjimOLGLolY0aG4CN
         +wjEXrkAYA4xeVYJ9eDAADq+xY8Ap5cMuGcpsJDY8B2Y2N5OeKvPXSbOGwmIAm2KIqrw
         rYKA==
X-Forwarded-Encrypted: i=1; AKwUvBwzvJiy6KHYMHJ55XplpFVYzl3xqUNPOhswHi3auIZWk+/n/8B2D7lbIYW9Kzf3BCB+YXYri661g3gFe+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOx9sx/ls8r/iOSWvfXM3nO015TLgClJkhGPCeg/wcHEucQ5A3
	RZFlaGH2DP2be93UTLMGB0aOu77bvT1Z+C/EyawEYc2wJzJtHNsbhhle
X-Gm-Gg: AYBFou17203rjpH287wTKytmI5dlCpK3UclgkOI4bxSq2OF7AFAv7+rVubFiMehboHw
	RUOTgIA6VmkBjUbNPZSuLGgBOaWSfhIwRphelen1KDDwqvXxalBEJrPVNGeX9VELalpSNf4e0r8
	CSPFh7qUKr2xlBKpfUlzFJUFX6Td4uq/7exgRX3JOq4BfaUtGxf9MMPx3JxP//8tJUUyjV8HQEo
	R03bU8QGvVKopcbFUDrhIGcHWGYVCfKrXlG50KnhHa3zBaw2p1/GNzS6g1Df5Rf7h6L5G7heRy9
	6VUQ1wBoZosmXLOlpH9P9qJqktnSNYixd+RRs/5uaqRzqyIC4A370ecg4M7Zo3J9c3Ay78H4AsX
	a4ZSVjAB7BJ/MIySHCDpPcMKxxuuB/emFepQfQmLuxpJhdNTV98WlBHeMGd/AAlUiPRaws+9iVP
	q/salC7O2Ej58lKR5ylxCG4Wjkhg8buWxcn+q3BdFdmmvete7Q4LS9/mAxFYajtREJ6a2SBwmd9
	5vkbTjEiXWOZItkmTcV2cDklQygAaHSPFz19IuXb3ZUR3HhLduwFT0DvlrRgB17t4drX8d2E1ma
	6nVUFgQDPJR/Arx80Br7QFLI1hGWGJTuYBah834SKVr2fOiOLneuBiwNYW9wtT4=
X-Received: by 2002:a05:690c:c4e9:b0:854:b86b:d206 with SMTP id 00721157ae682-8b133c87ee5mr5494447b3.12.1792562628567;
        Tue, 20 Oct 2026 23:03:48 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:c::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b13016fce2sm7251347b3.40.2026.10.20.23.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:03:47 -0700 (PDT)
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
	rdunlap@infradead.org,
	kunwu.chan@linux.dev,
	kernel-team@meta.com,
	nphamcs@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [PATCH v6 07/12] mm, swap: reclaim physical slots backing cache-only vswap entries
Date: Tue, 20 Oct 2026 23:03:18 -0700
Message-ID: <20261021060323.553433-8-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021060323.553433-1-nphamcs@gmail.com>
References: <20261021060323.553433-1-nphamcs@gmail.com>
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

A vswap folio can keep physical swapfile space after its swap count
reaches zero, even though its data remains in the swap cache. That space
is often scarce and valuable: retaining redundant backing leaves less
capacity for pages that need it. Put-time reclaim is best-effort and
does not reliably recover these slots.

Reclaim such slots from the physical reclaim scanner, once swap is more
than half used (vm_swap_full()), to free physical capacity for new
allocations.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/swap_table.h |  12 +++--
 mm/swapfile.c   | 117 ++++++++++++++++++++++++++++++++++++++++++++++++
 mm/vswap.h      |  31 +++++++++++++
 3 files changed, 156 insertions(+), 4 deletions(-)

diff --git a/mm/swap_table.h b/mm/swap_table.h
index a5e65ddbd2f8..88d1bb0e65fd 100644
--- a/mm/swap_table.h
+++ b/mm/swap_table.h
@@ -31,7 +31,7 @@ struct swap_memcg_table {
  * NULL:     |---------------- 0 ---------------| - Free slot
  * Shadow:   |SWAP_COUNT|Z|---- SHADOW_VAL ---|1| - Swapped out slot
  * PFN:      |SWAP_COUNT|Z|------ PFN -------|10| - Cached slot
- * Vswap:    |-------- vswap offset --------|100| - vswap rmap
+ * Vswap:    |C|------- vswap offset -------|100| - vswap rmap
  * Bad:      |------------- 1 -------------|1000| - Bad slot
  *
  * COUNT is `SWP_TB_COUNT_BITS` long, Z is the `SWP_TB_ZERO_FLAG` bit,
@@ -399,14 +399,18 @@ static inline unsigned short __swap_cgroup_clear(struct swap_cluster_info *ci,
  * On physical clusters, a Vswap-tagged entry stores the offset of the
  * vswap entry that owns this physical slot (the reverse map). Only the
  * offset is stored; the swap type is implicit (always vswap_si->type,
- * since there is exactly one vswap device).
+ * since there is exactly one vswap device). The top bit is reserved as
+ * a cache-only flag, set when vswap swap_count drops to 0 but the folio
+ * is still in swap cache.
  *
- *   Vswap:    |---- vswap offset ----|100|
+ *   Vswap:    |C|---- vswap offset ----|100|
+ *              C = SWP_RMAP_CACHE_ONLY (the top bit)
  */
 #define SWP_TB_VSWAP_MARK_BITS	3
 #define SWP_TB_VSWAP_MARK	0b100UL
 #define SWP_TB_VSWAP_MARK_MASK	((1UL << SWP_TB_VSWAP_MARK_BITS) - 1)
-#define SWP_RMAP_ENTRY_MASK	(~SWP_TB_VSWAP_MARK_MASK)
+#define SWP_RMAP_CACHE_ONLY	(1UL << (BITS_PER_LONG - 1))
+#define SWP_RMAP_ENTRY_MASK	(~(SWP_RMAP_CACHE_ONLY | SWP_TB_VSWAP_MARK_MASK))
 
 static inline bool swp_tb_is_vswap(unsigned long swp_tb)
 {
diff --git a/mm/swapfile.c b/mm/swapfile.c
index be66ac79313c..640e38a55497 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -145,6 +145,11 @@ static DEFINE_PER_CPU(struct percpu_vswap_cluster, percpu_vswap_cluster) = {
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
@@ -877,6 +882,55 @@ static int swap_cluster_setup_bad_slot(struct swap_info_struct *si,
 	return ret;
 }
 
+/*
+ * Try to reclaim a Vswap-tagged physical slot backing a vswap entry.
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
@@ -1158,6 +1212,7 @@ static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
 	long to_scan = 1;
 	unsigned long offset, end;
 	struct swap_cluster_info *ci;
+	swp_entry_t vswap_entry;
 	unsigned long swp_tb;
 	int nr_reclaim;
 
@@ -1182,6 +1237,19 @@ static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
 					offset += abs(nr_reclaim);
 					continue;
 				}
+			} else if (swp_tb_is_vswap(swp_tb) &&
+				   (swp_tb & SWP_RMAP_CACHE_ONLY)) {
+				vswap_entry = swp_tb_vswap_to_swp_entry(swp_tb);
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
@@ -1752,6 +1820,8 @@ static void swap_put_entries_cluster(struct swap_info_struct *si,
 			}
 			/* count will be 0 after put, slot can be reclaimed */
 			need_reclaim = true;
+			if (swap_is_vswap(si))
+				vswap_mark_cache_only(ci, ci_off);
 		}
 		/*
 		 * A count != 1 or cached slot can't be freed. Put its swap
@@ -1858,6 +1928,8 @@ static int swap_dup_entries_cluster(struct swap_info_struct *si,
 			goto failed;
 		}
 	} while (++ci_off < ci_end);
+	if (swap_is_vswap(si))
+		vswap_clear_cache_only(ci, ci_start, nr);
 	swap_cluster_unlock(ci);
 	return 0;
 failed:
@@ -2008,6 +2080,51 @@ int folio_alloc_swap(struct folio *folio)
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
 /**
  * __vswap_release_backing - release the backing of a range of vtable slots
  * @ci: the locked vswap cluster
diff --git a/mm/vswap.h b/mm/vswap.h
index 6f952b2591d1..fe2068d85b65 100644
--- a/mm/vswap.h
+++ b/mm/vswap.h
@@ -44,6 +44,37 @@ static inline bool is_vswap_entry(swp_entry_t entry)
 	return swap_is_vswap(__swap_entry_to_info(entry));
 }
 
+/*
+ * Rmap cache-only helpers for physical cluster Vswap-tagged entries.
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

