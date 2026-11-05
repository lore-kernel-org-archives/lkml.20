Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854455;
	b=etYON6czh64GqNlh7rdRdLEx5PALwqfT1aK6waJ85b1eg5/hCdK2ojR6PuCGpQqe7o0A
	 g93XgOFIhQrqlmYuGlQtxgVIPdD1+o3cj0ebixKHkXPNBKRgRaUlnVv0qoMghoz6+zdtt
	 wHlCsEHvMjlb2XCMrkq8UndpHNufsPdCeElwSVi6zZerSRhBXL49fOZd82iE2dS5rubv5
	 uNH0syzp1zWvSRFvILlw1WrB9iv/ETLMTOEeA/0feAJKp6IStA9kqEeXmqez83KpAXsnq
	 4zz+AjRuzxKP1itrgeU70sZjbXT69g/i/tUrLMKf+3PLeNpZd1/y6TanfDqM7Dn719g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854455;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SOnxtD5kQgW2tF7PVrffOT/lerqKVdwMhcbBwPAH/FM=;
	b=14HSymAJw/zOofsGm8DNtmDe5VbDHl5AURzb32HpGiBBXKzEtqCcznGHjJ9eQMw6uDZa
	 iWh7MqweF7OWNo+qJVXouDgVtOK4oK0ZBYt8nMMkDq3GyNe1EsDte0yubhj5+m10t+hda
	 OlZV3cvXjCG/mEED4MAnnt5Qq7bcAqsc6LXhwD06qtnTMrdgjezWba6yy18D/9RNXOeuy
	 +4zwOJkk0Hhizrf61CdO7eYo3V7jtBeSieoDfntRCwqwrPGSMIzh07TGrb8+pR/Oqko31
	 TKaUHMTOCewNH860aTbQ7d1xQjgJQJprExxh7+Myu/UOdqsPL51lzxMJFgN40mvMDhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R8+KcAAw;
	arc=none smtp.remote-ip=95.215.58.216
Received: from mta1.migadu.com (out-216.mta1.migadu.com [95.215.58.216])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB6F606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB6F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R8+KcAAw
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qIbdiMjLr9Y0SUefhfkdE51Knh5aRfQ/kBIeoszyPGg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793854452; v=1; x=1794459252;
 b=R8+KcAAwP5th3uxXwZF0lIDf5ASxqNS9DWJPnfcXG0mVIzDVJyDNOzlkeiRYDx7qxjDcFf9K
 /Ko7fmQstorud3tguEysoSZ2htTJ+IeZMRmSfmx9JBGDfUo3xxYWjopCwmZqiMtGccOcV4IfTo2
 0MDpnF9TRoQsBPnAp+htccyE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f63fd72cc0f28980;
	Thu, 05 Nov 2026 04:54:11 +0000
X-Mizu-Trace-ID: f63fd72cc0f28980
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: baolin.wang@linux.alibaba.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	riel@surriel.com,
	liam@infradead.org,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	qi.zheng@linux.dev,
	pfalcato@suse.de,
	ayushr@modal.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: synchronize with PTE table reclaim for all folio sizes
Date: Thu,  5 Nov 2026 12:54:06 +0800
Message-ID: <20261105045406.39871-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Thu, Nov 05, 2026 at 10:56:28AM +0800, Baolin Wang wrote:
>Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped
>folios"), the '!pmd_present()' check in page_vma_mapped_walk() can also race
>with concurrent page table reclamation via zap_empty_pte_table().

Good catch!

>page_vma_mapped_walk() is used by many functions including try_to_unmap(),
>try_to_migrate(), folio_mkclean(), pfn_mkclean_range(), remove_migration_ptes(),
>page_mapped_in_vma(), and mapping_wrprotect_range(). Except for try_to_unmap()
>and try_to_migrate(), the other callers do not perform post-walk accounting
>checks, so the race has no observable impact on them.
>
>For migration, the race can cause unnecessary retries. For reclaim via
>try_to_unmap(), the race can cause failure to reclaim a folio that is in
>fact already unmapped (as shown below), which may lead to unexpected OOM
>or increased refaults.
>
>CPU 0 (reclaim)                      CPU 1 (MADV_DONTNEED)
>--------------------------------    --------------------------------
>folio_lock(F)
>try_to_unmap(F, TTU_SYNC)
>                                    zap_pte_range(full PMD range)
>                                      spin_lock(ptl)
>                                      clear PTEs
>                                      zap_empty_pte_table()
>                                        spin_trylock(pml)
>                                        pmd_clear()
>                                        spin_unlock(pml)
>
>  page_vma_mapped_walk()
>    observe !pmd_present(pmde)
>    nr_pages < HPAGE_PMD_NR
>    skip synchronization
>    return false
>
>try_to_unmap() returns
>folio_mapped(F) == true
>nr_unmap_fail += folio_nr_pages(F)
>                                    tlb_flush_mmu_tlbonly()
>                                    tlb_flush_rmaps()
>                                      remove F's rmaps
>                                    spin_unlock(ptl)
>
>Commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped folios")
>has already moved the PMD clear operation (via zap_empty_pte_table()) to
>after tlb_flush_rmaps(). Similarly, page_vma_mapped_walk() also needs to
>use sync_with_folio_pmd_zap() to synchronize and avoid memory ordering
>issues on weakly ordered CPUs.
>
>Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in madvise(MADV_DONTNEED)")
>Cc: stable@vger.kernel.org
>Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
>Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>---
> mm/page_vma_mapped.c | 5 +----
> 1 file changed, 1 insertion(+), 4 deletions(-)
>
>diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>index e6b6170c2f4f..8797467b6f0c 100644
>--- a/mm/page_vma_mapped.c
>+++ b/mm/page_vma_mapped.c
>@@ -293,10 +293,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
> 			spin_unlock(pvmw->ptl);
> 			pvmw->ptl = NULL;
> 		} else if (!pmd_present(pmde)) {
>-			if ((pvmw->flags & PVMW_SYNC) &&
>-			    thp_vma_suitable_order(vma, pvmw->address,
>-						   PMD_ORDER) &&
>-			    (pvmw->nr_pages >= HPAGE_PMD_NR))
>+			if (pvmw->flags & PVMW_SYNC)

Right. Whether the folio can be PMD-mapped doesn't tell us whether its
PTE table can be reclaimed, so those extra checks can skip synchronization
that the caller explicitly asked for ;)

LGTM, thanks!

Reviewed-by: Lance Yang <lance.yang@linux.dev>

> 				sync_with_folio_pmd_zap(mm, pvmw->pmd);
> 
> 			goto next_pmd;
>-- 
>2.47.3
>
>
