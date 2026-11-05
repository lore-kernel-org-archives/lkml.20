Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793847410;
	b=T4faOrDL7WXPiV9T2qf98870zk96RTqgDCT1dTnEwpNGklMVgrujjq+4luMUUVhlAPnT
	 94cZTSji0cg2ofPJPAemKi29art7KwHXMQjG/Bn6DwtQmrNxZXeYVWI104X3vo1SSPeh5
	 0eOaaNnG2ua3DPCvFNGmSaWiCRQq3qb3AJ8MxiiC9fg3PIhPvJ5lPsw4Rm6nElmHTt2XP
	 v6rNGziZDzu5nLEZI0SXGVAGOmk17nlXRVOHVYbNwj5BuUJ4krdszlKEXXV12M27rAb6k
	 R11lo08LKll/qALlq8+TGddtgu/oL1ovDmbe4yZ/jLiKERsSD40Dty2vxfYCH5OSEiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847410;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e7HItsBXSCgxUc39U3iHUfM+8l/Wb7Jodni6FIfl/KA=;
	b=eG3yDyV3LEktgJIYuPN1Zrfz+C59XRXzXYQJpGGaKUw5No/Nw0V92vth3ovNsdQhHg+5
	 fVikTHFlLHMjEGLm6CeORJL2JXPbdxbDUu2lLj0CEUZ05ArFI5q617f8xtMUdFWZRpxe8
	 MQZMSbaQ5IECWysVxf2AWJV+A1IXTTSNTYnIEdn9wsw18ahWXpPTbvJHiPdxpfsp5CAgP
	 i2/JWeOWgUH5BdjvUAUlK7z+gxc4LgV6AiCnAUsTIPFDdIFyHBG2yXR+I7FG2YOLYbJxL
	 9Owspgb1UfBXFdIydaQpgyzoFfJ7QiFi3hT8n1rEM3yG5X9qep/tFsUu28xvZuPBtQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=sJhi3beE;
	arc=none smtp.remote-ip=115.124.30.113
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AA6606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39AA6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=sJhi3beE
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793847399; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=e7HItsBXSCgxUc39U3iHUfM+8l/Wb7Jodni6FIfl/KA=;
	b=sJhi3beEBbsEJE9qy/YnTi+EiZCxX2WyfElrwLg3DzOlo6HeMMD+4xHjp/9asCxLslZKpJjLzOYWqgDBRMgPucqE5hrjxSaqp2FmPEJF5IFz8xpAPr/P26XflXQ+NWCmqCCT0HiFytm2GRM8aEWMmqa0HJQ9By1AuYRN2rkcUNY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XE7G6W0_1793847397;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XE7G6W0_1793847397 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 10:56:38 +0800
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
	pfalcato@suse.de,
	ayushr@modal.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: synchronize with PTE table reclaim for all folio sizes
Date: Thu,  5 Nov 2026 10:56:28 +0800
Message-ID: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
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
fact already unmapped (as shown below), which may lead to unexpected OOM
or increased refaults.

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

Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in madvise(MADV_DONTNEED)")
Cc: stable@vger.kernel.org
Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/page_vma_mapped.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index e6b6170c2f4f..8797467b6f0c 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -293,10 +293,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
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

