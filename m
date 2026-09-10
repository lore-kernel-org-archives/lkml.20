Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE2F3C9456
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022003; cv=none; b=UHCoVzRu10nbiOAblvTKr9LMC8nqNHHJS+MatlKKD1lGcGT49NxDKKBa/hk6S1/Aw0Q0PIiFOvPuwUiXdZrPRe/6wr5T6FE5Qzgy2xSJvagj/8cLC7LYiyxh3GXgEGJ5LLoksU+Rx8karRLS7HRdtr/d9sAfCtG/r3BgAg0RIUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022003; c=relaxed/simple;
	bh=51sfdZPQFUBdnHJXmz99ay36E45oB8w7ha63rRaSm8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aofHjqQmqgnLaLjeHMmTA072aKygHV9Te/K18Hn993YDG2DpE+l84up2mvhsusenVosbZ1a9T2EknZ8I/1vDdBYRksBNsxwEw4kxG3TPgC+yIDNORigD5r5SQdfUb8LZHHMZNAo8iQhJc4VnOT1i7aMylOhtg2cYTjsFdH8AtJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=epT/gZxK; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="epT/gZxK"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cace91f112so58042355ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022001; x=1789626801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rAd33FXhTKmE+GxkEc0xfvfKe/VbGJPr1z8AjG4R4y8=;
        b=epT/gZxKbGsj21TtfOrh+Ftkq0JG7u+zI41QjarQh7nJwYg67UHaOZHkiqz6oGo5AE
         x/8DQAlCqP48HaDeLmh3llNKE2/iOmWPyHAfQVj0/mz8xfAz9VDMdM1Ew+zUeogoQUBy
         6utPoNyGWcZud0UXSBe7HIlPzmDRcjonr5T1u547ad/esnHi3IcFu5JtmvvyiHrMQ6b3
         5r5K5qSn7MIynkitUCKc2RBqOOsWvurDuO4VTXHOF5QUFnlOEL9+ujAq9n0sseDQuKtC
         6yZVcPykUQOyuDk2RhlcQxA3F40eEERaP2uTDfSF0ZZTqZkh5G4t2d/HlOhXJYKL3ZcB
         KK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022001; x=1789626801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rAd33FXhTKmE+GxkEc0xfvfKe/VbGJPr1z8AjG4R4y8=;
        b=onmoaSPgjxhvDclhorWu0nb6cYcRFbhhAQWho16X/te8BaB5GvejcjPUDsChTb7rHg
         73WX2c2YhSk3HFAA6XiA+b/5DlWUIzNCr6MZ2pIw2nRSC3sKkYPkhsFo+nmykJPpTQ+K
         5qg28OIClPURUKhGU1b5lgzZuBn3X8W9tL9NvGt63yu4HKOZ8LsOUKTOs/cMtdWjniv7
         ZgAoykMZoC1/ORMNs8hSE13yC2GQ2/XSysOUSZ/KPAI4PLqQmkSlCUc6Bd/ZtHfjbrid
         RgpVj9tipsm0PWb9kK+WuW3BDvIiE+0+AD/bUlzujVtjIYjHo7MxeHaZ3LjnOB6mTLYF
         X4CQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNpZv4FCkBodIvu6Ygm5MwRny+GhXPY/qpHZkxG8uWKNVDwVY9b3nVU+rDVntz1ysEebnhsNK10UnYfwA=@vger.kernel.org
X-Gm-Message-State: AFuF++lwiISmmTAMR8lmomwpW6i+no6NVgtHc8VL8D+DhfLGGx7S/0Lm
	lCGk13fd9feIQiNtlG5Z6xjTazcrayjOWCk4PabxNwbcwDK/4ouEGEcx4k78R1qodwE=
X-Gm-Gg: AYBFou0ut+gFaukWoV7Rk5NRV8vo/FVoc755HkrIdKpSlYGgOKXOMcOebj1eId7wvno
	4a5X2rPlz76htRRzAiM1qTZwEG7CCpVGXjN3lnY7hQpgzzAVPbZZxe7cEJRR8zW2SgAMxbrJLle
	MoTIQ80ZkVp/83Ba6GXHD0HyVBLj6IFcnRZDRdFkRTlroxfIxrRgTNdaSuzClHJytjuTwt0ugEy
	U1GfIm6XyIDvzO7wikDVab/X3RbBYI9w1LGsKLwVAA+trtdlH2YKgIGY+IKitfaciLVxlBJ4sHa
	etWy+SFqpthYwEaPqE6zajq4UWGe3WMFfIfEegVvtUjhM30CyQDEBuyFn8E/TvAlAGH9pyaDooc
	rjAVtpBcsMR8e/G331zLJB/SHVWXE5qB7dtJmmG77dENK3yFPEmRbU9ef3HxEi3a9Z/1/7s8WBU
	YGtfKsPDiMEUBwZrO8ZfMX5GeqkL6wb8Q98XDnGyN/szGvurhYe3PFG1LyBN/HnxMS5df+BTBYm
	5hkpPr0IZbMK4RMoMGD79Sx8K0n729oDMDpFuHcr3tdrg==
X-Received: by 2002:a17:90b:3c45:b0:398:9beb:5c19 with SMTP id 98e67ed59e1d1-39b26232bb1mr58417921a91.20.1789022000528;
        Wed, 09 Sep 2026 23:33:20 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.33.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:33:19 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	David Laight <david.laight.linux@gmail.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>
Subject: [PATCH v6 00/17] mm: Introduce section-based vmemmap optimization for HugeTLB
Date: Thu, 10 Sep 2026 14:32:39 +0800
Message-ID: <20260910063256.64386-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is split out from the earlier, larger series "mm: Generalize
HVO for HugeTLB and device DAX" [1]. While the parent series generalizes
vmemmap optimization across HugeTLB and device DAX, this subset addresses
a single, self-contained step: making the generic sparse-vmemmap code
section-based optimization aware and switching HugeTLB bootmem pages to
this path.

HugeTLB vmemmap optimization currently has its own early boot setup
path. It pre-populates optimized vmemmap mappings before the normal
sparse-vmemmap population code runs, and sparsemem carries
SPARSEMEM_VMEMMAP_PREINIT only to support that special case.

That makes the HugeTLB vmemmap optimization path harder to share with
other users of sparse-vmemmap optimization and leaves a fair amount of
HugeTLB-specific boot-time state in the generic memory initialization
flow.

This series introduces section-based vmemmap optimization support in
the sparse-vmemmap code and switches HugeTLB bootmem pages over to it.
Instead of having HugeTLB pre-populate optimized vmemmap mappings
itself, HugeTLB now records the compound page order in the corresponding
memory sections. The generic sparse-vmemmap population path can then
allocate or reuse shared tail vmemmap pages based on section metadata.

The patches are organized as follows:

  - patches 1-2 prepare sparsemem and vmemmap optimization metadata
  - patches 3-8 teach the common sparse-vmemmap paths to use that state
  - patches 9-10 switch HugeTLB bootmem optimization to the
    section-based path
  - patches 11-17 clean up sparsemem and HugeTLB bootmem code that is no
    longer needed after the conversion

This is intended to be the second smaller step toward the broader HVO
generalization. The device DAX conversion and the wider HVO
consolidation are left for follow-up series.

v6:
- Rename the section order field and helpers to use compound page order
  terminology (suggested by David Hildenbrand).
- Clarify when shared tail vmemmap pages are initialized and drop an
  inaccurate sparse_sections_init() comment (suggested by David
  Hildenbrand).
- Make the local vmemmap allocation size const (suggested by David
  Hildenbrand).
- Collect Reviewed-by/Acked-by tags from Mike Rapoport, Qi Zheng and
  David Hildenbrand.

v5:
- Add comments for pageblock migratetype helper callers and shared tail
  vmemmap skipping (suggested by Mike Rapoport).
- Move section_nr_vmemmap_pages() earlier under its own
  CONFIG_MEMORY_HOTPLUG block to avoid code movement in the later
  visibility change (suggested by Mike Rapoport).
- Add vmemmap_alloc_pte() to keep PTE allocation handling clearer
  (suggested by Mike Rapoport).
- Collect Reviewed-by/Acked-by from Mike Rapoport.

v4:
- Rename pfn_vmemmap_optimizable() to vmemmap_optimizable_pfn() for
  consistency with vmemmap_optimizable_order().
- Move section_nr_vmemmap_pages() outside CONFIG_MEMORY_HOTPLUG to fix
  CONFIG_MEMORY_HOTPLUG=n builds (reported by kernel test robot).

v3:
- Replaced the !SPARSEMEM __pfn_to_section() stub with
  pfn_to_section_order() so callers can keep mem_section access inside
  sparse helpers (suggested by Mike Rapoport).
- Added vmemmap_optimizable_order() for order-based vmemmap
  optimization checks and used it for HugeTLB bootmem decisions.
- Fixed the pfn_to_zone() commit message to name mm/mm_init.h instead
  of mm/internal.h.
- Collected Acked-by tags from Mike Rapoport.

v2:
- Kept struct mem_section aligned after relaxing lookup constraints
  (suggested by David Laight).
- Folded section order tracking into the first user instead of keeping
  a standalone API-only patch (suggested by Mike Rapoport).
- Renamed the HVO order macros with a VMEMMAP_OPTIMIZATION prefix
  (suggested by Mike Rapoport).
- Moved pfn_to_zone() before the sparse-vmemmap optimization changes
  (suggested by Mike Rapoport).
- Kept vmemmap accounting and population logic in sparse-vmemmap.c
  (suggested by Mike Rapoport).
- Renamed the early sparsemem helper to sparse_sections_init()
  (suggested by Mike Rapoport).
- Fixed the !SPARSEMEM stub name so SPARSEMEM=n builds compile
  (reported by Sashiko).
- Guarded section_order() with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP so
  it returns 0 when HVO is disabled and lets the compiler optimize the
  code as much as possible (suggested by Mike Rapoport).
- Collected Acked-by tags from Mike Rapoport.

[1] https://lore.kernel.org/all/20260513130542.35604-1-songmuchun@bytedance.com/

Muchun Song (17):
  mm/sparse: relax struct mem_section size constraints
  mm/sparse-vmemmap: rename HVO order macros
  mm/mm_init: skip initializing shared vmemmap tail pages
  mm/sparse-vmemmap: initialize shared tail vmemmap pages on allocation
  mm/sparse-vmemmap: support section-based vmemmap accounting
  mm/mm_init: factor out pfn_to_zone()
  mm/sparse-vmemmap: move helpers ahead of future callers
  mm/sparse-vmemmap: support section-based vmemmap optimization
  mm/sparse: initialize memory sections earlier
  mm/hugetlb: switch HugeTLB to section-based vmemmap optimization
  mm/sparse-vmemmap: remove SPARSEMEM_VMEMMAP_PREINIT support
  mm/sparse: inline usemap allocation into sparse_init_nid()
  mm/sparse: remove section_map_size()
  mm/hugetlb: remove HUGE_BOOTMEM_HVO
  mm/hugetlb: remove HUGE_BOOTMEM_CMA
  mm/hugetlb: localize struct huge_bootmem_page
  mm/hugetlb: localize HUGE_BOOTMEM_ZONES_VALID

 arch/x86/Kconfig        |   1 -
 fs/Kconfig              |   1 -
 include/linux/hugetlb.h |   5 -
 include/linux/mm.h      |   4 -
 include/linux/mmzone.h  |  66 ++++--------
 mm/Kconfig              |   5 -
 mm/hugetlb.c            |  65 ++++--------
 mm/hugetlb_vmemmap.c    | 103 +-----------------
 mm/hugetlb_vmemmap.h    |  13 +--
 mm/internal.h           |   7 --
 mm/mm_init.c            |  69 ++++++++-----
 mm/mm_init.h            |   1 +
 mm/sparse-vmemmap.c     | 224 +++++++++++++++++++---------------------
 mm/sparse.c             |  93 +++--------------
 mm/sparse.h             |  88 ++++++++++++++++
 scripts/gdb/linux/mm.py |   6 +-
 16 files changed, 302 insertions(+), 449 deletions(-)


base-commit: 219467624544a1dd72e2022a442741e66766e39a
-- 
2.54.0

