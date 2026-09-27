Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F842197A7D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477692; cv=none; b=udQnvOAqnSGaRnYOJxUkisdIYJQrzMyTPRXDZSVYWYWoqcZxhf7gv1WIhs9zkWYgM9y0kybmqTzuG++XPsrdM3THwy5WrA1H0L9btHPyQXAV4EkwFrVxJyvkjGd2+0P9dEE7T4jRuvNo+akx2UukxB+WxLv+2y7x1gIjUNJTKQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477692; c=relaxed/simple;
	bh=5TEuyBQLdHYZldY8L4cBn/RktSyzBo/ghBKSuRswM4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Brw9eJS9pml1E4jPFcXIE0u10FZ75ftqoQZDBM8GDVpdty0rzfeDUnESCAl+p2MLU+1tTJpvR+oazmXoLDWvn7GLYhnc/GOzOv5Do9y6L2vj7bTMO8vj6iD1Lx39kI0RMGnOn113ZF8MFF3a0GuRJx/Pz5fYZkjfs3xnEqdDD0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JY0hRCEg; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JY0hRCEg"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so1070845a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790477690; x=1791082490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YdCenWsLNM4fgmWyqHdVLEa8fbYRLFc5Vlv8cacB468=;
        b=JY0hRCEgUZRTO+eWaor1D5Sb3yxewm8Bw/aIKRRTg6mFr70OpUG0jLcB4hoHMFyUQl
         bO7wh+fwgBzkiaXG2z7DdKYHlVMhKY3D6fSE4yJZ4vr0QHQcEtxo6YUiMkQYLyewdKp9
         G1qzyx247gNuQC8x1EM4JjwQ6jvgx4kYb0SZf3N1BS6A4I8kYEeLW+2Gd3rcEYaOebkI
         OhylBm9LcC4/G+W0GczaWUubAUCCiOvRO21sAfw0vlhfTSPkr2Duzbrh1m5wDrzy7ZAp
         QbCPJAY4sz7fMUwlCKAvrAJhZpKyat44Z6PDzz5Q294NKwSRvuiadJrrqkdUNBnz7VN8
         T90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477690; x=1791082490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdCenWsLNM4fgmWyqHdVLEa8fbYRLFc5Vlv8cacB468=;
        b=T+0PySgp2zmK3l4cjEcRLXNNH6FbFqTdW+ySIKOFS0wxIlJtk4x9zgeI9ESYj2dWnU
         402UDLaMswrRKFTsTDxIzwBIWQJTLLFT7JKsBQIJPX/DkMs0ebaq+g6DwZFIdJ4ji6Lj
         O+IpV+tEzSLOf9lae81qjILaLJd+z9dohIrkk4OUhv4euUrh9DoTMgUfrJqzafL8yxmV
         zK88E27Yb1ZPNn2+Oe+j5xS/QF+XLVkLs8j2lnM1/VFkgnZaLyzSroAH5/ma2XdzoDMP
         O3hLgKFd8E9/Tbya+siRd5cs8uq0IJNlDnmsLBTvp0a/zpcuWp3xcxesmflGRvid6cpO
         Qq6w==
X-Forwarded-Encrypted: i=1; AKwUvBw9mnTMUCJXlF2OpsoVWAz/J7kygPk0h9iarhIikPzZKm78HpaFQX32fCwQA271l6Ykrn2tE9VojXs5J3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3UEKJflHrYUQlH+XSfYOhl3O6svTLxvCBThMr9kbIFqz7a3J4
	UXQQccwWO43lSYXh3o6rajRLSSdAtE9LGFvSa4xmo/Hr/jKnrPtoXGwWRpiEp6tfmgA=
X-Gm-Gg: AYBFou0NdFGzrOR8Nl3PCLMPd2YbdyMgKcQmabA1XpG/hzrVqSCnkbZwnf5F1IPl/JD
	NHjf6h8xgwQQhUSTuDXYJa3PEDYpoCghex3Ti8oiZ9SC1GcPpZnWM5+ul0u9rzwUf5vjNHJnFoH
	nWb4YlDjJdeBhSlW4IDzR0+wf1PZ6uOPLQ0UhdZ9oAIm6/jhJd/SPWHItaOZ4lGYWA7GHkGr54R
	q9ekraXLDPaeKpYCTNQXJMDZBXieQJMxQKzwKDOVI4oINRpAg15w1UsUhZ5jDgb3m8Joqw7CUDU
	try37UBEQimo3DX/jnsEHhYJOZBJjmCqhl+sAN/x8/kwctukIISXjWIhf6fu3MaCpIer4XS9qTF
	Hn8YVIincR4/If5uWVHH3YVAL3dJYUvJVqVFR3bfcCNDCPaYdDC4B3EGKJNLH6lcJA52dr2X9UA
	GOPUKlZSFkZKFywroCpeaPVePgOx1kIEqo3lfEne0jsExCX0uQki1UHqyMBFqHXulqLHhZj+LjI
	9YDYJCJoEYWhrVisy7Z
X-Received: by 2002:a17:90b:1652:b0:3a0:9640:8043 with SMTP id 98e67ed59e1d1-3a098ccdd41mr8412652a91.15.1790477689681;
        Sat, 26 Sep 2026 19:54:49 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm13461377a91.1.2026.09.26.19.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:54:48 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v5 00/12] mm: Switch device DAX to section-based vmemmap optimization
Date: Sun, 27 Sep 2026 10:54:29 +0800
Message-ID: <20260927025441.741633-1-songmuchun@bytedance.com>
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
a single, self-contained step: switching device DAX to the section-based
sparse-vmemmap optimization infrastructure introduced for HugeTLB.

After the HugeTLB conversion, optimized vmemmap state is described by
the memory section and the sparse-vmemmap population path can allocate or
reuse shared tail vmemmap pages based on that metadata. Device DAX still
uses the older DAX-specific population model, including a separate tail
vmemmap page reservation and architecture-specific logic to locate or
populate reusable tail pages.

This series makes device DAX use the same section-based model. Device DAX
records the compound page order from pgmap->vmemmap_shift in section
metadata before vmemmap population, uses the common per-zone shared tail
vmemmap page, and drops the extra reserved tail page. The powerpc radix
path is updated to use the same shared tail-page helper, so the generic
and powerpc DAX paths follow the same reservation model.

The first patches prepare the shared infrastructure by factoring out
shared tail-page allocation, allocating the per-zone shared tail-page
array dynamically, and introducing a generic
CONFIG_VMEMMAP_OPTIMIZATION symbol.

The middle patches move device DAX onto that infrastructure by recording
the device DAX compound page order in memory-section metadata, using that
metadata to back generic device DAX mappings with the common per-zone
shared tail page, exposing the shared helpers so the powerpc radix path
can use the same model, and dropping the extra DAX-only tail page
reservation and the now-unused section accounting arguments.

The final patch updates the documentation for the new DAX layout.

This is intended to be the third smaller step toward the broader HVO
generalization. The wider HVO consolidation between HugeTLB and device
DAX is left for follow-up series.

[1] https://lore.kernel.org/all/20260513130542.35604-1-songmuchun@bytedance.com/

v5:
- Move the shared tail-page factoring before introducing
  CONFIG_VMEMMAP_OPTIMIZATION
- Add a new patch to allocate the per-zone shared tail-page array
  dynamically and fix the RISC-V build failure reported by the kernel
  test robot
- Select VMEMMAP_OPTIMIZATION from ZONE_DEVICE instead of DEV_DAX so
  MSHV_VTL cannot set vmemmap_shift while leaving the optimization
  disabled (reported by Sashiko)
- Move the vmemmap optimization macros and MAX_FOLIO_VMEMMAP_ALIGN from
  mmzone.h to vmemmap-optimization.h

v4: https://lore.kernel.org/all/20260916064341.1825793-1-songmuchun@bytedance.com/
- Rename CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION to
  CONFIG_VMEMMAP_OPTIMIZATION (suggested by Mike Rapoport)
- Collect Acked-by tags from Mike Rapoport

v3: https://lore.kernel.org/all/20260911050228.58884-1-songmuchun@bytedance.com/
- Use EOPNOTSUPP for partial additions to sections that already use
  optimized vmemmap mappings
- Move device_zone() after NODE_DATA() to fix non-NUMA builds
- Collect Acked-by tags from David Hildenbrand and Qi Zheng
- Rebase onto mm/mm-new

v2: https://lore.kernel.org/all/20260908030335.96549-1-songmuchun@bytedance.com/
- Add a missing SPARSEMEM_VMEMMAP dependency (suggested by Qi Zheng,
  reported by Sashiko)
- Add an explicit ZONE_DEVICE dependency for DEV_DAX
- Add missing dependencies to the new public header
- Explain why optimized and ordinary layouts cannot share a section
  (suggested by Qi Zheng)
- Explain why sharing tail vmemmap pages is safe for DEV-DAX (suggested
  by Qi Zheng)
- Clarify the removal of duplicated 4K PUD calculations from the docs
  (reported by Sashiko)
- Collect Acked-by tags from Qi Zheng

v1: https://lore.kernel.org/all/20260831075342.57563-1-songmuchun@bytedance.com/

Muchun Song (12):
  mm/sparse-vmemmap: factor out shared vmemmap tail page allocation
  mm/sparse-vmemmap: allocate shared tail page array dynamically
  mm/sparse-vmemmap: introduce CONFIG_VMEMMAP_OPTIMIZATION
  mm/sparse-vmemmap: open-code init_compound_tail()
  mm/sparse-vmemmap: prepare DAX vmemmap population for compound page
    orders
  mm/sparse-vmemmap: set compound page order for device DAX
  mm/sparse-vmemmap: switch device DAX to shared tail vmemmap pages
  mm/sparse-vmemmap: move vmemmap optimization helpers to a public
    header
  powerpc/mm: switch device DAX to shared tail vmemmap pages
  mm/sparse-vmemmap: drop the extra tail page from device DAX
    reservation
  mm/sparse-vmemmap: drop unused section_nr_vmemmap_pages() arguments
  Documentation/mm: update DAX vmemmap deduplication docs

 Documentation/arch/powerpc/vmemmap_dedup.rst  |  90 ++------
 Documentation/mm/vmemmap_dedup.rst            |  32 +--
 MAINTAINERS                                   |   1 +
 arch/loongarch/include/asm/pgtable.h          |   1 +
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 124 +----------
 arch/riscv/mm/init.c                          |   1 +
 arch/x86/entry/vdso/vdso32/fake_32bit_build.h |   2 +-
 fs/Kconfig                                    |   1 +
 include/linux/mm.h                            |   7 +-
 include/linux/mmzone.h                        |  38 ++--
 include/linux/page-flags.h                    |   5 +-
 include/linux/vmemmap-optimization.h          | 115 ++++++++++
 mm/Kconfig                                    |   5 +
 mm/hugetlb.c                                  |   2 +-
 mm/hugetlb_vmemmap.c                          |  31 +--
 mm/internal.h                                 |   9 -
 mm/memory_hotplug.c                           |   6 +-
 mm/mm_init.c                                  |  17 +-
 mm/sparse-vmemmap.c                           | 209 +++++++++---------
 mm/sparse.c                                   |   3 +-
 mm/sparse.h                                   |  81 +------
 21 files changed, 299 insertions(+), 481 deletions(-)
 create mode 100644 include/linux/vmemmap-optimization.h


base-commit: 92068d3f6a4274d952441ba8f46221c3c03787dd
-- 
2.54.0

