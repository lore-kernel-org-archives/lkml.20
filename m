Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886841;
	b=QO7IMj7pivHwdwxQc2GBurTbsHldeOehKlAjsBpzYf9obeVkMEQ1p3PhyXZEQWQugALc
	 dD54o/qH0phhu1mp8RR03yION1cG6zYrWCXC8jKewCIin1vDEpL7F79WRLBWRd4aT2rVk
	 3QHg8pk1RvwZi6ZFZFXqAj/gRVNZZwYIkKfedEAPfax0A41BlT6AcWke/bDUa+/syQYoF
	 sk/DVTwbcBsSLAeYyJlkd8RTCBuB8wZ1mfESb71YBFscC2fMApAt7h+zsxs/TJjE9pbPG
	 Yf2eqYELJYujSJVMzHwSjYA+/1b+cv+2TGDPCFQQEZzPlrkCEZ/H3acn1mtsLZNZzqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886841;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BCD+ZeAlR3HyVI1Lid6kcHhyKTsbSvUwBV1vWEpv/80=;
	b=kyWJUgB1b361sqxVR2M09+5kQDtRXE+8+JZ5KUu8uRwA6SFjM7f5P/2a0KvutxIZ5Un6
	 KER8Nb1aPXhrmdHCvLACMoHGS4Bx5/QWQ9ZhsEMxwM2Vslibyazxy6YzR0T9m6l3Pvv1C
	 /S/mTxoIVpdLu84nTdjFOgP28p4tH+Cwv//ARcsb79Fn8/opkTyreETjBZsuykmIBqxeU
	 4zvF8LG765yp7wKvdQg47A1Jb3tsRSufj95EMgXq0FNVgiuURrUSx6sFG8AMFgYzXMGfj
	 ZUWAfxKSIIhliMpdbJF71ETJ85VKle8cXHCLDyaM+lKtj44iSkMhRitayiWFbdfU5YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=csZmWHhe;
	arc=none smtp.remote-ip=115.124.30.110
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6281606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6281606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=csZmWHhe
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794886836; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=BCD+ZeAlR3HyVI1Lid6kcHhyKTsbSvUwBV1vWEpv/80=;
	b=csZmWHhenxebsDrRkKilpGU83URGAgSuwSWjbIN1AZfum1ws+t8DWNPqLCJsNnoYptn1FCp4kwax7OlOuwLGJbpZZuI+tXREar1I40hrF/RSr10JSYaHoHtpR6Rd3VKv/VQZ4gny4ew82kWuiNcs0fujCGIzXL2Y0PCXzxW+29U=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XEwzRFI_1794886835;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEwzRFI_1794886835 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 17 Nov 2026 11:40:35 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org
Cc: riel@surriel.com,
	liam@infradead.org,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	qi.zheng@linux.dev,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mm: synchronize with PTE table reclaim for all folio sizes
Date: Tue, 17 Nov 2026 11:40:22 +0800
Message-ID: <71980310d9bf1bf9733ea0e4b772635e1b2bc5c5.1794886401.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
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

Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped
folios"), the '!pmd_present()' check in page_vma_mapped_walk() can also race
with concurrent page table reclamation via zap_empty_pte_table().

page_vma_mapped_walk() is used by many functions including try_to_unmap(),
try_to_migrate(), folio_mkclean(), pfn_mkclean_range(), remove_migration_ptes(),
page_mapped_in_vma(), and mapping_wrprotect_range(). Except for try_to_unmap()
and try_to_migrate(), the other callers do not perform post-walk accounting
checks, so the race has no observable impact on them.

For migration, the race can cause unnecessary retries. For reclaim via
try_to_unmap(), the race can cause failure to reclaim a folio that is in
fact already unmapped (as shown below), which may cause cold/hot inversion
(e.g., in MGLRU) and increase refaults. In extreme cases, failing to
reclaim unmapped large folios could even cause OOM in theory.

CPU 0 (reclaim)                      CPU 1 (MADV_DONTNEED)
--------------------------------    --------------------------------
folio_lock(F)
try_to_unmap(F, TTU_SYNC)
                                    zap_pte_range(full PMD range)
                                      spin_lock(ptl)
                                      clear PTEs
                                      zap_empty_pte_table()
                                        spin_trylock(pml)
                                        pmd_clear()
                                        spin_unlock(pml)

  page_vma_mapped_walk()
    observe !pmd_present(pmde)
    nr_pages < HPAGE_PMD_NR
    skip synchronization
    return false

try_to_unmap() returns
folio_mapped(F) == true
nr_unmap_fail += folio_nr_pages(F)
                                    tlb_flush_mmu_tlbonly()
                                    tlb_flush_rmaps()
                                      remove F's rmaps
                                    spin_unlock(ptl)

Commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped folios")
has already moved the PMD clear operation (via zap_empty_pte_table()) to
after tlb_flush_rmaps(). Similarly, page_vma_mapped_walk() also needs to
use sync_with_folio_pmd_zap() to synchronize and avoid memory ordering
issues on weakly ordered CPUs.

Regarding performance, evaluated the impact on try_to_unmap(). Mapped a file
to generate clean large folios, then used MADV_PAGEOUT to reclaim 1G of mapped
clean large folios, repeated 5 times, with no measurable performance impact.
Before: 16.031 ms over 5 loops
After: 16.303 ms over 5 loops

While the race scenario described in the patch may theoretically affect
performance, the actual impact in real workloads is likely limited I think.
Anyway, will use memory barriers to sync for non PMD-sized folios in a
follow-up.

Lance also reported the possible racy check for small folios[1]. However,
whether to set TTU_SYNC for small folios should be done in a separate patch
(this is a pre-existing issue) with proper measurement (though it may be
hard to measure the actual impact).

[1] https://lore.kernel.org/all/0ddaf336-7cb7-4e83-af2c-f60d23f7aafd@linux.dev/
Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in madvise(MADV_DONTNEED)")
Cc: stable@vger.kernel.org
Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
---
Changes from v1:
 - Update commit message per David.
 - Add reviewed tags from Qi and Lance. Thanks.
---
 mm/page_vma_mapped.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index d45d52436f99..a931243ca42b 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -294,10 +294,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			spin_unlock(pvmw->ptl);
 			pvmw->ptl = NULL;
 		} else if (!pmd_present(pmde)) {
-			if ((pvmw->flags & PVMW_SYNC) &&
-			    thp_vma_suitable_order(vma, pvmw->address,
-						   PMD_ORDER) &&
-			    (pvmw->nr_pages >= HPAGE_PMD_NR))
+			if (pvmw->flags & PVMW_SYNC)
 				sync_with_folio_pmd_zap(mm, pvmw->pmd);
 
 			goto next_pmd;
-- 
2.47.3

