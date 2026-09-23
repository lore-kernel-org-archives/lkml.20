Received: from mail-pj2-f18.google.com (mail-pj2-f18.google.com [74.125.227.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B11C416878
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144926; cv=none; b=K3y5XlAN3QhBHtjBeLneJTEiHWQGkBz2kZ4Qr/I+WJRvCGz/8zs5FO8wuYAUuoIcDrdLIkjgB+/NmXfj17k7sWFrCFbaC2YFV7uJ/gA6orm7y3NUoa0OgFGVfPNmPDNKLZtcsdf3XSeEZATZFZ8AfydCXiUfS+4x+4GSbAffNEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144926; c=relaxed/simple;
	bh=g1hW5l5u+YDkQfsQZlZCHcb+RGsO2rsStTMFZd6dHOE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Fpky+kzVxY4in4c5+DercIVfzd/X+nnWzZ9O/bNyajdM/hY32F4cO+Fzd4xIB83BftjetZi1YAbL4S5Yl0JrWnJS+asRFmIGt1cqdKvReojcrg0oSt40B3wXX4GH2cuRfm7OX0bMqCrK7BI7/aUcXLOxAxNZG2P/tvlPzOwK7EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHCpTUg7; arc=none smtp.client-ip=74.125.227.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHCpTUg7"
Received: by mail-pj2-f18.google.com with SMTP id d9443c01a7336-2db22383fe8so2352375ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144921; x=1790749721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuSLF0hkxQHLte/AAueOTAnFcUBu56imXlI7BP0ZEbY=;
        b=AHCpTUg7iyoL5Eg4fMhR2N/7+QDUZ4Be015n2n5vC1OC1tsDCdx0fQy/08uuYpJq6E
         rqbz407lcxC9GqxiVMVNjd3jxuCajcYA/VTnBaxn7SWTt6waRQRPl+w3fHPmso7o7C4A
         qJdMYvHOssfxif4bj+/AtTObxMHMU/mG3dxZTVRgpevXAHD9XjWpq8/3QHhp2JXkolMb
         KQ/plKL6rLDPi6+1s6lxMepiTh1J24hFhdnVz8Lg6UllKuj5cbcf5VpiJiNejjTwN+1B
         lqPPrwbPC9w7luz5stg8LnIqrMk9KcIu5lsN/xI3QHUNhrsM6YKkctAL7ZI5x8UM6ftf
         /RSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144921; x=1790749721;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZuSLF0hkxQHLte/AAueOTAnFcUBu56imXlI7BP0ZEbY=;
        b=j5/ha3LDouPa+i6g9BMFtLjEu9otD8wiDW2ZJC/ClLFNA4bH1h/jUUy2myKLFlOJa6
         DyVpQSB+dT5jF/+xNvOd4lE8EW1KloPZzXdEtThB3yem52+km5Svekz9BsX/h3Bo83F8
         hcsjEYhu8dyDL7ihLmVV7doLDKUXqZxxHVxrjWrijQHbt8/XGBesRMbxL7hJUbY+LDKy
         Nomf/TRGn3PNkRq3hmTySL4BZ7kdxXtUP8v1w/xeAA3bE8gqzLuZ+rO/++O45WY6djfs
         l9WKusf4h16d65JJBR7lCDU5u0ebaLE9KLZq5CoW41PaucfoB/M8CtcM/wISU0Myx423
         VVbg==
X-Forwarded-Encrypted: i=1; AKwUvBz0U4HHWKG+0EaYYrzoemXPGZFawtfbGJVNdHO8wLQig9ZjLxsYz+hUsLej+FpTG3ka6MWb9qHc0cjBOUg=@vger.kernel.org
X-Gm-Message-State: AFuF++l4xDDb8KpzaGncsFhX7cMHb5G05NyaFn2SRtTKxEVy/BXQoQJ4
	5NBvCvrbL+BIcIqiOMXw42NdUBu/ZcLrkoEJ18wz76EaZttnYTXCbNmJ
X-Gm-Gg: AYBFou0kyZUzPDqpnjY1/yfFRh/WP4zh5ZWTyTRJf3r1aQD+oncFM52zoR3We2aQfKo
	iMpBZ3z1itPUMt0eHLlkc6wS2X6PQkUU2RuA+oawuxNkXNbz0wu9/Kzs/6wBk4qC0YdA/eFBZmU
	8IBJyiF1aFwBRDkaLrrjbQ2NSK4yxJswveJVwv8bmqSOqYJC59lpWuyHuqE4t17Cs0VjfWdFW9M
	bpDFZHzPuB3E+HuN23KAtIIul4fa5Xfnk5wPO7iPq70biD+ByZ2H2Ay/Q4elZCkM8m10R30n54Y
	qEBqzNH2M9Goz5mNmSZ+NVGVh1nskE3Tt7PEiXCftLpEiNtyRckDNWU9mmcOggCLbFFk286HwxG
	WLVlDwe5hQdRvwU7VsmIJuDj88pL9CXqRmwkyZu4R9+xewVjev6wO2Y/f3YBCeLmzWRck0pg3ib
	zwws+rsdsSXU3monRvlxP6owd+P+f7fygFqPsSmVnRkl+GP8oVFPp7wabi29I1MsHr7Wj5e6s5G
	4dxUH0PYusR1tr/38P9VQ==
X-Received: by 2002:a17:903:3b8f:b0:2dd:7ede:4c0e with SMTP id d9443c01a7336-2df69d2146emr13851875ad.12.1790144920724;
        Tue, 22 Sep 2026 23:28:40 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:28:39 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Subject: [PATCH v9 00/10] mm/vmalloc: Speed up ioremap, vmalloc and vmap with contiguous memory
Date: Wed, 23 Sep 2026 14:28:22 +0800
Message-Id: <20260923062832.479455-1-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset accelerates ioremap, vmalloc, and vmap when the memory is
physically fully or partially contiguous. Two techniques are used:

1. Avoid page table rewalk when setting PTEs/PMDs for multiple memory
   segments
2. Use batched mappings wherever possible in both vmalloc and ARM64
   layers

Besides accelerating the mapping path, this also enables large
mappings (PMD and cont-PTE) for vmap, which are currently not
supported.

Patches 1-4 decouple the PTE-level block mapping path from HugeTLB.
Previously vmap_pte_range() installed cont-PTE mappings by reusing
set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
helpers gated by CONFIG_HUGETLB_PAGE. This made the feature silently
unavailable on CONFIG_HUGETLB_PAGE=n kernels, and coupled mm/vmalloc.c
to HugeTLB internals. Patches 1 and 2 add the arm64 and powerpc/8xx
implementations of pte_set_huge()/pte_clear_huge(), which join the
existing pmd/pud_set_huge() family. Patch 3 adds the generic fallbacks
and converts mm/vmalloc.c over. Patch 4 then removes the now-dead
init_mm special case from arm64's clear_flush().

Patch 5 extends ARM64 arch_vmap_pte_range_map_size() to batch multiple
CONT_PTE blocks in one call instead of one at a time.

Patch 6 extracts a common helper vmap_set_ptes() that consolidates PTE
mapping logic for the ioremap and vmalloc/vmap paths, handling both
CONT_PTE and regular PTE mappings. This prepares for the next patch.

Patch 7 extends the page table walk path to support page shifts other
than PAGE_SHIFT and eliminates the page table rewalk for huge vmalloc
mappings. The function is renamed from vmap_small_pages_range_noflush()
to vmap_pages_range_noflush_walk().

Patch 8 extracts vm_shift() to consolidate vmalloc mapping shift
selection for reuse in the batching path.

Patches 9-10 add huge vmap support for contiguous pages, including
support for non-compound pages with pfn alignment verification.

On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
the performance CPUfreq policy enabled, benchmark results:

* ioremap(1 MB): 1.35x faster (3407 ns -> 2526 ns)
* vmalloc(1 MB) mapping time (excluding allocation) with
  VM_ALLOW_HUGE_VMAP: 1.42x faster (5.00 us -> 3.53 us)
* vmap(100MB) with order-8 pages: 8.3x faster (1235 us -> 149 us)

Many thanks to Xueyuan Chen for his testing efforts on RK3588 boards.

Large vmap() mappings were also tested by Leo Yan with ARM trace buffer
units, including TRBE and SPE. These units use the CPU page tables for
address translation when writing trace data to DRAM, so using larger
vmap() mapping granules can reduce TLB pressure on the trace writer.

The TRBE test used a 1G CoreSight ETM AUX buffer. Across five runs on an
isolated CPU, the average results were:

* dtlb_walk:       68.4 -> 59.4 (-13.16%)
* l1d_tlb_refill: 155.8 -> 119.6 (-23.23%)
* l2d_tlb_refill: 161435.8 -> 495.0 (-99.69%)

The SPE test used a 512M ARM SPE AUX buffer. Across five runs on an
isolated CPU, the average results were:

* dtlb_walk:       1710.4 -> 1315.6 (-23.08%)
* l1d_tlb_refill: 16000.0 -> 15950.2 (-0.31%)
* l2d_tlb_refill: 4796.0 -> 2931.2 (-38.88%)

These results show that enabling larger vmap() mappings can materially
reduce page table walks and TLB refills for large trace buffers.

Many thanks to Leo Yan for his testing efforts on ARM trace buffers.

Changes since v8:
- Rebase onto v7.3-rc4.
- Rename new_pte to pte in pte_set_huge(). Add a
  VM_WARN_ON for addr alignment. (patch 1)
- Use BUILD_BUG() instead of WARN_ON_ONCE in the
  generic pte_set_huge()/pte_clear_huge() fallbacks. (patch 3)

Changes since v7:
- v7's patch 1 (which extended the hugetlb helpers in
  arch/arm64/mm/hugetlbpage.c) is replaced by pte_set_huge()/
  pte_clear_huge(), split across patches 1-3 so that the arm64,
  powerpc/8xx and generic changes can be reviewed and acked
  independently: patch 1 is arm64 only, patch 2 is powerpc/8xx only,
  patch 3 is the generic fallbacks plus the mm/vmalloc.c conversion.
  hugetlbpage.c no longer gains the CONT_PTE batching hooks, and patch 4
  additionally removes its now-dead init_mm special case. mm/vmalloc.c
  no longer includes <linux/hugetlb.h>.
- The generic pte_set_huge()/pte_clear_huge() fallbacks WARN_ON_ONCE()
  instead of silently doing nothing. They only exist to keep the build
  working on architectures without PTE-level block mappings, where they
  are unreachable (patch 3).
- Patch 5 (v7 patch 2): use round_down(size, CONT_PTE_SIZE) instead of
  rounddown_pow_of_two(size), since pte_set_huge() takes the size directly
  without an ilog2() roundtrip. This lets a single call span several
  CONT_PTE blocks: a 768K (512K + 256K) ioremap is now 1.25x faster than
  v7.
- Patch 6 (v7 patch 3): vmap_set_ptes() now calls pte_set_huge() instead
  of the hugetlb path.
- Patch 9 (v7 patch 6): get_vmap_batch_order() takes pages+i instead of a
  separate idx argument, and applies pfn alignment limit to scan length
  rather than to the resulting order. Renamed idx/map_addr to
  batch_idx/batch_start. Dropped Dev's Reviewed-by.

Changes since v6:
- Add a clarifying comment about the reuse of hugetlb helpers
  by non-hugetlbfs(vmalloc) mm code (patch 1)
- Expand the arm64/vmalloc commit message and comment to clarify that
  multi-CONT_PTE_SIZE values are vmalloc mapping spans, not HugeTLB
  hstate sizes (patch 2)
- Move the local steps variable change in vmap_pte_range() into the
  vmap_set_ptes() extraction patch (patch 3)
- Propagate vmap_pages_pte_range() errors through the upper
  vmap_pages_*() levels instead of returning -ENOMEM for all failures
  (patch 4)
- Add a preparatory vm_shift() helper patch before the batching patch
  (patch 5)
- Guard the PFN alignment clamp in get_vmap_batch_order() against PFN 0
  before calling __ffs() (patch 6)
- Fix kmsan_vmap_pages_range_noflush() indentation in the batching path
  (patch 6)

Changes since v5:
- No code changes.
- Pick up Reviewed-by and Tested-by tags from Dev, Leo and Uladzislau.
  Many thanks!
- Add TRBE/SPE large vmap() test results from Leo Yan to the cover
  letter.

Changes since v4:
- Move pgsize update before contig_ptes check (patch 1)
- Use rounddown_pow_of_two instead of __fls in
  arch_vmap_pte_range_map_size (patch 2)
- Reword comment to avoid mentioning cont_pte and remove if in
  vmap_set_ptes (patch 3)
- Rename vmap_batched() to vmap_pages_range_batched() (patch 5)
- Use batch_end as the batching cursor to avoid an unused start variable
  (patch 5)
- Check arch_vmap_pmd_supported before PMD mapping (patch 6)

Changes since v3:
- Squash vmap_pte_range() loop variable fix into patch 4 (patch 3, 4)
- Use shift >= PMD_SHIFT and fix *nr increment in
  vmap_pages_pmd_range() (patch 4)
- Pass page_shift directly without capping at PMD_SHIFT (patch 4, 5)
- Add vm_shift() helper and pass pgprot_t to get_vmap_batch_order()
  (patch 5)
- Use min(order, __ffs(pfn)) for graceful pfn alignment degradation,
  replacing IS_ALIGNED check (patch 5)
- Remove irrelevant ioremap_max_page_shift early-exit (patch 5)
- Add __get_vm_area_node_aligned_caller() wrapper, rename to
  vmap_get_aligned_vm_area() (patch 6)

Changes since v2:
- Use __fls instead of fls in arch_vmap_pte_range_map_size (patch 2)
- Add WARN_ON checks in vmap_pages_pmd_range (patch 4)
- Fix flush_cache_vmap to use saved start address instead of the
  already-advanced addr (patch 5)
- Rename __vmap_huge() to vmap_batched() (patch 5)
- Add caller parameter and unroll while(1) loop (patch 5)
- Squash patch 7 into patch 5 (stop scanning for compound pages after
  encountering small pages)

Changes since v1:
- Fix condition order and use PMD_SIZE instead of CONT_PMD_SIZE in
  patch 1 (Dev Jain)
- Squash patch 3+4 and patch 5+7 (Dev Jain)
- Replace "zigzag" with "page table rewalk" in commit messages
  (Dev Jain)
- Rename vmap_small_pages_range_noflush() to
  vmap_pages_range_noflush_walk() (Dev Jain)
- Extract vmap_set_ptes() as a new patch to consolidate PTE mapping
  logic between vmap_pte_range() and vmap_pages_pte_range(), handling
  both CONT_PTE and regular mappings (Mike Rapoport)
- Support non-compound pages in get_vmap_batch_order() by falling
  back to physical contiguity scanning with pfn alignment check
  (Dev Jain, Uladzislau Rezki)
- In get_vmap_batch_order(), filter out orders that the architecture
  cannot batch by checking arch_vmap_pte_supported_shift() directly.
  This avoids overhead for orders 1-3 on ARM64 CONT_PTE with 4K
  pages. (patch 5)

Barry Song (Xiaomi) (4):
  arm64/vmalloc: allow arch_vmap_pte_range_map_size() to batch multiple
    CONT_PTE
  mm/vmalloc: extend page table walk to support larger page_shift sizes
    and eliminate page table rewalk
  mm/vmalloc: map contiguous pages in batches for vmap() if possible
  mm/vmalloc: align vm_area so vmap() can batch mappings

Wen Jiang (6):
  arm64/mm: add pte_set_huge() and pte_clear_huge()
  powerpc/8xx: add pte_set_huge()
  mm/vmalloc: use pte_set_huge()/pte_clear_huge() for PTE-level block
    mappings
  arm64/hugetlb: drop the init_mm special case in clear_flush()
  mm/vmalloc: extract vmap_set_ptes() to consolidate PTE mapping logic
  mm/vmalloc: extract vm_shift() to consolidate mapping shift selection

 arch/arm64/include/asm/pgtable.h             |   6 +
 arch/arm64/include/asm/vmalloc.h             |   8 +-
 arch/arm64/mm/hugetlbpage.c                  |   5 +-
 arch/arm64/mm/mmu.c                          |  20 ++
 arch/powerpc/include/asm/nohash/32/pte-8xx.h |   4 +
 arch/powerpc/mm/nohash/8xx.c                 |  29 ++
 include/linux/pgtable.h                      |  29 ++
 mm/vmalloc.c                                 | 268 ++++++++++++++-----
 8 files changed, 301 insertions(+), 68 deletions(-)

-- 
2.34.1

