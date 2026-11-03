Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701035;
	b=AKVPKtHvkYDJlTJjihA1zAB9FxD+Dk7HoEbFe1rro2Xi0C7C37OH7mDaS3LiUO25oBbr
	 QgKbWS6POjjUy+fxS1sbnhA5IMyflzmXP/q1FfZTnd4gZG1urNgi5kIvah/cnufB1n6rx
	 udTSXLkGl9O2gMaAjED7t1ynXXyRbJD/4CEWlfOu1EHfpL+Zn/RBU91xQfeUVqiuUISHc
	 n/9jUCAjmqxGOYGrxUZaxtp8rD0OZDYKAePTSxbTf1wg+D1r3JHR5Vj+XryW1IpY6019m
	 hW8zfVY6Y2g12NMSHC9/U7DU54YLz3EXPjRUQ59yNSvCKPMe/wUskF2OvYodZdYG1nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4J8KnVur3uVZ8yVqselgUVjwiPZYC8TO76Ebys42kvc=;
	b=bQmBLkg5CDNvwqnmZr5cT436/92oyeZIkSCOyhnjKuJV0OUsMoj39NbXHruZtqjHK7h/
	 Muy/GCTTdQiveUKLC7nM8jz81KXVkj278THym28yZ1yYcbr88tC5Um9wH8jfiVNEWc0rr
	 La+fysgpVZpw9NiTjxM8DstEHBSYEg+0HYyv/8bL4Byl9VfUOfIu9wkHykBx0jU19xeMW
	 yvd7gHcBI7D/0Q7M6ZtEk1nk2JWyyTWhEvdj7vrg4RPgb2vTbuH56O7kp6JqvCvrAuCOf
	 4yMVVaRUPqKg23bcwFn48x591y8l7yNB2r+A+4Rcl1CmXu9vBX2odPjeSo+2VrrzfOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weVC7Hyv;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED82D606D83C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED82D606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weVC7Hyv
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso6687845eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701033; x=1794305833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4J8KnVur3uVZ8yVqselgUVjwiPZYC8TO76Ebys42kvc=;
        b=weVC7HyvSpQVLJFDII/GcymajpWHFfYTpHFDiAg5q1Yu7vmjT/1CpWa3eKPW5tCip5
         jgsn7voSRb6C1fMnuRh57+6qcttSR5oSomi+UVnINSAOWhwIto4kJg8WHEyxxAI8mVab
         3GZyGa82C8VcH0dz50MTpNSTnYDAzpz3HBDicUtZ2pABk9gombb/V6taZDZm4TnhdC6O
         iu7MXbxZ6ov6sHSZXpaD4tWmYfB+ibDNruMH0JmjeSUKbRAEwkSqedAQ272ZofSzooKa
         I3QLMfLHbpc+tulmVY2SNi8pbGUmOwnSqh5Q+o4WbcTwXKESBpUZaKkKEBkD3FLr1mYT
         cTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701033; x=1794305833;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4J8KnVur3uVZ8yVqselgUVjwiPZYC8TO76Ebys42kvc=;
        b=D1H3m2QS53l1f1tA/LkwyTJ1zY5C4pwXFxkwi8J+YItebTB7f+YdJ+F94UrhGASPXU
         mW34LbfuKAUbANVXxMwxgz2yvu4iY5wTuw/6ob1QLJZ8M2ulwbinWvMohuDj6yirqouK
         3NAAf1qIDwUyJj6Vd3vCBD285NOhcVk9mPNV0S1bGhP6d3mfaRmEuQ8EPyJaVx+xSFwp
         psYEm+BrQp9hh8iX0P2mpJBNsOFiPq4MXHddunlnt2kBK4F9jz+tx99D54zHJHrvzMDh
         VE/OI8EOTovupeGufwuZZUkKDEplIw7ySY5FRx21X94D2Ste5dRzjuN5RWhlUjPbuocG
         Hc7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzeFT3Q5ZW/HhyPldAJOsqec/o5NTx9kVD3U7gkSMGoEaaNuRgMcezwtEF+52SclSn9hieqEhQ/2cYDXqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mLvr6JvFkLmvmEKEck/id+5YGpZa+jr/DAylQxFRbPWK9T6hR
	FIGdNhPEf8ZpMP8XXRwXFoSl/4HjZiiK00Ocubz//19ognF7/+ebkKFU
X-Gm-Gg: AYBFou3QBVnvnaXJtPwt7WtTO9d56FnU7SYiP+D6HEccH2G+23NLeg35XQ9WJKUG1MD
	Dsl3r4C0Q94h8kqKJfq4mdHiZv3+KgMUaLdRSLGc4Y4LtGLhEWFeVc8UXbD1GJ8Iq8PtLsNWiBo
	08N4o4iFOSJbqiN8H3hvBikRL8dbls8sOCATUnZAtjlPwkxrcNp27URGXIEoMq5zUcavNWj+brU
	8q1F6T2YsmlK7KMXMTA+PiRvRYVR+LK6snogtEANVIfREM/AvEe3n2mB3KS8pxuZiIp2s0jd6ki
	iCp1sQkkzFa/01nM4TJtXj0q9qhAIuDAonMtD8r3OCJQGLUf8vBVZ3x1Y+3zetLzxuX+B8AdQx7
	74mh+wXT28T/YjH9gfiWu62XIhmOhYuAjES644dkgwqanzn3m7YHHKF2iHFe+eFHMOQYY2lMBoJ
	kvGi8e9Pon/+Df+p38PlYSGr84E4dS4xY3yl74/u04eRm5IDMBr3bX9wyZB8vpjkv4YD79lqf7S
	5qG/nrMXcjl6zxdrUx+KxGgFkDc0Rb3BT7re7pEi0DJLQdEj2D/bahFdiVAUr+Z9xJvsJOt33ow
	fF3H9zC4hg3tzbD9SkMQ//lrr8kcgQ==
X-Received: by 2002:a05:693c:69d5:b0:369:7c:bfce with SMTP id 5a478bee46e88-36a423c6223mr19920521eec.14.1793701032723;
        Tue, 03 Nov 2026 02:17:12 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:17:12 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
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
	ryan.roberts@arm.com,
	Wen Jiang <jiangwenxiaomi@gmail.com>
Subject: [PATCH v11 00/10] mm/vmalloc: Speed up ioremap, vmalloc and vmap with contiguous memory
Date: Tue,  3 Nov 2026 18:16:48 +0800
Message-Id: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
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
implementations of vmap_pte_set_huge()/vmap_pte_clear_huge(), which join the
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

Changes since v10:
- Rebase onto v7.4-rc1.
- Rename pte_set_huge()/pte_clear_huge() to vmap_pte_set_huge()/
  vmap_pte_clear_huge() to make clear they are vmap helpers rather than
  HugeTLB helpers. (Dev Jain, Uladzislau Rezki)
- Add "Kernel mappings only" comment and alignment VM_WARN_ON() checks
  to vmap_pte_clear_huge(). (Dev Jain)
- Pick up Reviewed-by tags from Uladzislau Rezki and Dev Jain.

Changes since v9:
- Add a VM_WARN_ON() for pte_valid() in pte_set_huge(). (patch 1)
- Update the comment in arch_vmap_pte_range_map_size() to reflect
  the new batching behavior. (patch5)
- Drop the PMD_SIZE cap in arch_vmap_pte_range_map_size(). (patch 5)
- Rename steps to nr_pages in vmap_pte_range() and
  vmap_pages_pte_range(), and use 1U for the PMD page count.
  (patches 6, 7)
- Rename get_vmap_batch_order() to get_vmap_mapping_order(). (patch 9)

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
  arm64/mm: add vmap_pte_set_huge() and vmap_pte_clear_huge()
  powerpc/8xx: add vmap_pte_set_huge()
  mm/vmalloc: use vmap_pte_set_huge()/vmap_pte_clear_huge() for
    PTE-level block mappings
  arm64/hugetlb: drop the init_mm special case in clear_flush()
  mm/vmalloc: extract vmap_set_ptes() to consolidate PTE mapping logic
  mm/vmalloc: extract vm_shift() to consolidate mapping shift selection

 arch/arm64/include/asm/pgtable.h             |   6 +
 arch/arm64/include/asm/vmalloc.h             |  12 +-
 arch/arm64/mm/hugetlbpage.c                  |   5 +-
 arch/arm64/mm/mmu.c                          |  28 ++
 arch/powerpc/include/asm/nohash/32/pte-8xx.h |   4 +
 arch/powerpc/mm/nohash/8xx.c                 |  29 ++
 include/linux/pgtable.h                      |  29 ++
 mm/vmalloc.c                                 | 268 ++++++++++++++-----
 8 files changed, 310 insertions(+), 71 deletions(-)

-- 
2.34.1

