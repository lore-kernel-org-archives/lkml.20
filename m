Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827065;
	b=anXaHWs/i1PWkh6/ykn5ZsGM/BZhW1fNH2P3wcAXNAeHfdCoEzFp3eWT+ZkqT4EZMkDU
	 4oCL3bOIY8F9T0ArZHLjRNVKR9VygYpNaGNGCVVGGOZ7zfJFPHnuCUmhxf2uLP8q4ElfY
	 lBhYKBng12L704KWwiQ+ShttOxb0+cLsGKkg+gRA2AfkD8KXW9YCyXNBDiyPCMijV7TKs
	 iiR+9hqPi4K+r+ZHdNPgAYl+L3JYfp6p+bCzLBwC32m7j2+xJQHFnNoGu4pbQYHW2YPAD
	 1M1jUzMREVtkNvUfSIO3qqwg3GWp+jAvVoOOC+R3kEzrO6cDEfhVXf0A1GT8cPMimmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZX3pkyyq8Bg5+JdrpMjD7+301LPabJjTMnmRRo+l6ag=;
	b=o6j5JeJnNuArvXsK8OZhJ9kFEswhZKrHnF3deFT7kldFzSHs0yFn9EefPR/RdoD6Dz77
	 NxuQR+0BLCRnvUPYrHOvrt/8YKxuS8blj1LJDmN7v5seoX3G10k4AQMSkWc5UBCLDF0ae
	 9rE6B8oWmeROobORVJfPsicj32U/pskrsmNniAsr3TXClAHsW2BB5rZbWPvJKacDbrHV5
	 /KKYkM73o+lx5ya+90Ov266/4Un6uQBwRfd26oyef1RUqGQ6x7moYVDfpzeXFTv02So6s
	 MuDe4LxiphlKH9nZNoeQwn9yy8rvoBZpZRBRQ5vgqpwN4zQ4ahFHETlJelj2Uh93gRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2QwRpfm;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BDF606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04BDF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2QwRpfm
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b244fb7fffso3722550c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794827064; x=1795431864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZX3pkyyq8Bg5+JdrpMjD7+301LPabJjTMnmRRo+l6ag=;
        b=g2QwRpfmwGB5TWDAlZZvXmNinfOofEPWk5srERQ0BuMMnTOOUXaWJgR+9EgUdf3XE6
         DdNMo7bwh6ksjGKKaohwqdnwopsbnJ6GwE33gadHnxf5YiSITT9tExiV0k65iQnbastj
         Zw0pg7D3MPnoiJREMFEkwkRe9+yTXXo0rsCcy/Ih8Pza2vxqfDxPp142d8zaUWVYMMGn
         PXbBrn/C+F/oxbthSZ36MO3hQoROCG7KG4YazXCIGfN+6wh4MIpJ5LnY74sQpihrR64c
         ik05r8WqXhi+1fC2NOxPewpJQV+9wjWAITHcCCrxleOS6AyIVmFMG6PM4tYj1ojQQXoX
         zYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827064; x=1795431864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZX3pkyyq8Bg5+JdrpMjD7+301LPabJjTMnmRRo+l6ag=;
        b=q50UhburwzTAzIvSLu5Op93is5qBLB7FDN0lkPeSbIvGPlCM/6CLS2uyqzX0j+YboT
         wj7NvfRtSkeOnasJdRk2s1tT6okw6zWFwYbxR7nTp6LpcCUWs4o/A0Vw6++FqWHGXfGi
         hkHyGF6mTtkcFJCRiUni0o9meTz6XL6gLy/VloBleDnQXckkDDboVS0KSmIiEE7bPOUk
         TRQDaqd5q91JDxE2EnKjUP7aypTkfmlxrPYARGd9NSxJyWZqTYMguKWVgrqZFlmhmczK
         /UzYIs6rsDiAm1+Q+u87TTpyyXeFP9N9tNTFEqzx4j6AvqrcifVmVITA+98rv6PZcfpx
         Y13Q==
X-Gm-Message-State: APuU4Z+zlyCYrbw6tNYw0+TiFslhz0l0/gHFmcb5Tv0GGEdYrUFItUow
	ur2xIJxzHQpQZlALOB2/mJ5p9Ee7BP8bc/d5rrspOH9BBLeILPFmjbpK
X-Gm-Gg: AYBFou3ONliijMQw5lwJ+gfqt7P7z+zTZL4imivolnIEPVgFgYuk+R0uS9gHQpN2e2U
	8YnFEP0tVIudi3yf+lO2XqsmVoPFxgyP0NM1Gg2m6TVp6jSoSK6r8+jZrKvoQEMlrifIN3nLCak
	b6MDK5hOtuUbvaiLhWBeWjn/TSMB3p2tZitvJvjvEcOX2hiM+0RmpwUlN4Kj4a1egbq3noB10WK
	y/yndTRqjInAG70x7yhFCiIdMFJphxUW0HyQ7o2j7L1AooCVrkADkxMV13MxYpE2QyGLs347kHO
	QNJnqsAOiAwjHRgKjds62v/hkW33uXdlF5gEt8Qh/VvGholXor9zqNxWsgtlsy1m6jrj1BJD0jG
	16JulmCHkX5edVsUa7+J/b45hiuVCbtuTRn0yfpf7Stx877ms41y+KkPJWUMNeaLsYJ6WXLLL0N
	xMXFiCE5+dPI5VqDzwgCDdHHCHI62g6DTPOsyrYsAgZ6DFMkzZJ3E0aTquz0B9pfK+e9YIKs2iU
	eePv/DKZaLDoaDsfanJoWYw+J5grnSxoFPpfij1o9yNSNPutEexAhr9B2Q7scowdXCson84OJCr
	dA91yjdzaWsOEJjN1Ua+SzqvYSXt/o6UZ4CeDXH40J4nFmI=
X-Received: by 2002:a05:7022:1e0d:b0:1b3:bae1:f5f3 with SMTP id a92af1059eb24-1b503068228mr8684015c88.6.1794827063915;
        Mon, 16 Nov 2026 03:04:23 -0800 (PST)
Received: from naki-PC.localdomain ([203.175.14.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm42999260c88.9.2026.11.16.03.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:04:23 -0800 (PST)
From: nakixii <nakixii@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Barry Song <baohua@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [RFC PATCH 09/16] mm: memcomp: batch unmap reserved large folios
Date: Mon, 16 Nov 2026 19:01:15 +0800
Message-ID: <20261116110122.309748-10-nakixii@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116110122.309748-1-nakixii@gmail.com>
References: <20261116110122.309748-1-nakixii@gmail.com>
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

Batch uniform PTE runs only for reserved memcomp folios. Retain the
single-PTE path for mixed protection, soft-dirty or exclusivity state.
Acquire all token owners before clearing mappings and unwind the whole
prefix when sharing or architecture checks fail.

Keep TLB ordering, notifier scope and the native rmap completion
context.
Do not import the general lazyfree batching policy.

Signed-off-by: nakixii <nakixii@gmail.com>
---
 mm/memcomp_rmap.h | 139 ++++++++++++++++++++++++++++++++++++++++++++++
 mm/rmap.c         |  12 ++++
 2 files changed, 151 insertions(+)
 create mode 100644 mm/memcomp_rmap.h

diff --git a/mm/memcomp_rmap.h b/mm/memcomp_rmap.h
new file mode 100644
index 0000000000000000000000000000000000000000..52cdd471ad70fc27372fa819fc8996d57a3f418e
--- /dev/null
+++ b/mm/memcomp_rmap.h
@@ -0,0 +1,139 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _MM_MEMCOMP_RMAP_H
+#define _MM_MEMCOMP_RMAP_H
+
+#ifdef CONFIG_MEMCOMP
+/*
+ * Unlike the newer generic lazyfree batching path, this backport only batches
+ * a reserved memcomp span. Mixed protection or exclusive bits stay on the
+ * existing single-PTE path. The caller owns folio lock, PTL and notifier scope.
+ */
+static bool memcomp_unmap_exclusive_uniform(struct folio *folio)
+{
+	bool exclusive = PageAnonExclusive(folio_page(folio, 0));
+	unsigned int i;
+
+	for (i = 1; i < folio_nr_pages(folio); i++) {
+		if (PageAnonExclusive(folio_page(folio, i)) != exclusive)
+			return false;
+	}
+	return true;
+}
+
+static int memcomp_share_anon_ptes(struct folio *folio, struct page *page,
+				   unsigned int nr)
+{
+	unsigned int i;
+
+	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
+		/* Paired with the memory barrier in try_grab_folio(). */
+		smp_mb();
+	if (unlikely(folio_maybe_dma_pinned(folio)))
+		return -EBUSY;
+	for (i = 0; i < nr; i++)
+		ClearPageAnonExclusive(page + i);
+	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
+		/* Paired with the smp_rmb() in gup_must_unshare(). */
+		smp_mb__after_atomic();
+	return 0;
+}
+
+/* 1: use the original actor; >1: complete batch; <0: restored, abort walk. */
+static int memcomp_unmap_ptes(struct page_vma_mapped_walk *pvmw,
+			      struct folio *folio, struct vm_area_struct *vma,
+			      enum ttu_flags flags)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long address = pvmw->address, end, token;
+	unsigned int i, nr, got = 0;
+	struct page *page;
+	swp_entry_t entry;
+	pte_t first, old, swap;
+	bool exclusive;
+
+	if (!folio_memcomp_reserved(folio) || !folio_test_large(folio) ||
+	    !folio_test_anon(folio) || !folio_test_swapbacked(folio) ||
+	    folio_test_hugetlb(folio) || (flags & TTU_HWPOISON) ||
+	    !memcomp_unmap_exclusive_uniform(folio))
+		return 1;
+	first = ptep_get(pvmw->pte);
+	if (!pte_present(first) || pte_unused(first))
+		return 1;
+	page = pfn_to_page(pte_pfn(first));
+	nr = folio_nr_pages(folio) - folio_page_idx(folio, page);
+	end = min(pmd_addr_end(address, vma->vm_end), vma->vm_end);
+	nr = min_t(unsigned int, nr, (end - address) >> PAGE_SHIFT);
+	if (nr < 2)
+		return 1;
+	for (i = 1; i < nr; i++) {
+		if (!pte_same(pte_advance_pfn(first, i), ptep_get(pvmw->pte + i)))
+			break;
+	}
+	nr = i;
+	if (nr < 2)
+		return 1;
+	entry = page_swap_entry(page);
+	token = swp_offset(entry);
+	if (!is_memcomp_entry(entry) || !token || token > U32_MAX - (nr - 1))
+		return 1;
+	/* Each future PTE gets a real owner; failure unwinds the whole prefix. */
+	for (; got < nr; got++) {
+		if (!memcomp_entry_get(token + got))
+			goto refs_fail;
+	}
+	exclusive = PageAnonExclusive(page);
+	flush_cache_range(vma, address, address + nr * PAGE_SIZE);
+	old = get_and_clear_full_ptes(mm, address, pvmw->pte, nr, 0);
+	if (should_defer_flush(mm, flags)) {
+		for (i = 0; i < nr; i++)
+			set_tlb_ubc_flush_pending(mm, old, address + i * PAGE_SIZE);
+	} else {
+		flush_tlb_range(vma, address, address + nr * PAGE_SIZE);
+	}
+	if (pte_dirty(old))
+		folio_mark_dirty(folio);
+	update_hiwater_rss(mm);
+	for (i = 0; i < nr; i++) {
+		if (arch_unmap_one(mm, vma, address + i * PAGE_SIZE,
+				   pte_advance_pfn(old, i)) < 0)
+			goto restore;
+	}
+	if (exclusive && memcomp_share_anon_ptes(folio, page, nr))
+		goto restore;
+	if (list_empty(&mm->mmlist)) {
+		spin_lock(&mmlist_lock);
+		if (list_empty(&mm->mmlist))
+			list_add(&mm->mmlist, &init_mm.mmlist);
+		spin_unlock(&mmlist_lock);
+	}
+	add_mm_counter(mm, MM_ANONPAGES, -(int)nr);
+	add_mm_counter(mm, MM_SWAPENTS, nr);
+	swap = swp_entry_to_pte(entry);
+	if (exclusive)
+		swap = pte_swp_mkexclusive(swap);
+	if (pte_soft_dirty(old))
+		swap = pte_swp_mksoft_dirty(swap);
+	if (pte_uffd_wp(old))
+		swap = pte_swp_mkuffd_wp(swap);
+	for (i = 0; i < nr; i++)
+		set_pte_at(mm, address + i * PAGE_SIZE, pvmw->pte + i,
+			   pte_move_swp_offset(swap, i));
+	folio_remove_rmap_ptes(folio, page, nr, vma);
+	if (vma->vm_flags & VM_LOCKED)
+		mlock_drain_local();
+	folio_put_refs(folio, nr);
+	pvmw->pte += nr - 1;
+	pvmw->address += (nr - 1) * PAGE_SIZE;
+	return nr;
+restore:
+	/* Complete invalidation before set_ptes() may form a contpte range. */
+	flush_tlb_range(vma, address, address + nr * PAGE_SIZE);
+	/* Dirty/young aggregation is conservative; protection bits were uniform. */
+	set_ptes(mm, address, pvmw->pte, old, nr);
+refs_fail:
+	while (got)
+		memcomp_invalidate(token + --got);
+	return -EBUSY;
+}
+#endif /* CONFIG_MEMCOMP */
+#endif /* _MM_MEMCOMP_RMAP_H */
diff --git a/mm/rmap.c b/mm/rmap.c
index 41f1b9f645a261021698d7972649264de391601f..874cf92c1096267a5524b29ab55cc10a901cbcb1 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1656,6 +1656,8 @@ void folio_remove_rmap_pmd(struct folio *folio, struct page *page,
 #endif
 }
 
+#include "memcomp_rmap.h"
+
 /*
  * @arg: enum ttu_flags will be passed to this argument
  */
@@ -1737,6 +1739,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 
 		/* Unexpected PMD-mapped THP? */
 		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
+#ifdef CONFIG_MEMCOMP
+		{
+			int nr = memcomp_unmap_ptes(&pvmw, folio, vma, flags);
+
+			if (nr < 0)
+				goto walk_abort;
+			if (nr > 1)
+				continue;
+		}
+#endif
 
 		pfn = pte_pfn(ptep_get(pvmw.pte));
 		subpage = folio_page(folio, pfn - folio_pfn(folio));
