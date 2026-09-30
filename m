Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742DA4FD294
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777249; cv=none; b=WmcsGllOh5cEDmL8XGnswGYOz7csHTPA57j/dy5pVlQf7+4MBEghdV56l+Y146qn5pAo4u77lxrZA71/zm6DEmwZnabitl+QZijYCMS/RgGhykAVJOemJp6SGlNJYB7BJW9dkxOxr2GfHWlTeTqiHi7hIXXAQNsLSjzNmCZnrXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777249; c=relaxed/simple;
	bh=JqsrAkHQEIBMR08n54LWem3vmCgMbeK92e+dIom+JxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rhLXNSGwKcwQRzPIzuNYGQiDdAq8yg1AyWzyeAklw5AouJJf+TKZ6jd9wcIfILtbwMo94n4DGyUyqwHjJ3OVFBMblmjOgUsAL5RuHEl1ARSDKEW10U0rxBebPzE3vv4KalOkKCeImLUnv76McHWqF28HtI5uDAUYo+0eyUW0AgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Sd5jz8bx; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Sd5jz8bx"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e5eso2626955a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790777235; x=1791382035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6e1W9oGdmTQ/Tr5KCupwBGHorLPAMWe6GyMMJhNYhVc=;
        b=Sd5jz8bxUQZNXryETWM3H7R3WUEjm3Rb6hzobm5Ta6RycyaVCZ8g4CpkTYl0j9wR4S
         JVHDTJOr+nkWW0DLRGPmXkB6ByDgfoKvOZn6iisfZUi97OKKAsg141yel/5NAqQp42aF
         7td35IvlqUoqB5lsMB317bNrf2QKiAVyA/2q1CGyFn1S2fbI5Iu3iBDRqgfs5bzW2Zds
         247XBdPkFBryeSMJFm/XfZXoOT3dFPHLwxFHe68bkNZMRanX23n2pYJhFxrFyTAg3B/q
         Qmrqq/kbDXTHy1y6/RPdykwlJkHudU+SVv7n9GeyhI/pKv+5Tlv/Zur5xWJiDM/dWVAV
         pcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777235; x=1791382035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6e1W9oGdmTQ/Tr5KCupwBGHorLPAMWe6GyMMJhNYhVc=;
        b=UoaFuKXeQPjaGX2XXng7WEoHDDh8TWUWWWtOAgRGLXdDMwGyNwBI2+PyCONnrhVCt6
         997H7t9VdV1RP19ylORSybTWLokWhbgvZx8MRllmOWd1+riMC84yr1wzI3jKd1OwrQPV
         iLwE6jWfyU8leBnjgk6Ve5u/m5bDW3mUnSHXHPEFHt6HI4FS50PR8JUY+RNEB0YDzrYn
         eAqvn6oJIPiBGOvDqGCmTziJTDzt6JAwyi+dMWtsyWhTK8rrZn5wqF6A+FkwFlxfBJ8g
         Q1RM9XLErDL7KfWQ9r6noOIirOUeujBGI81FiXeJa1ptZVMBFrsNrTZ9dHW6dohxJEAX
         rtDg==
X-Forwarded-Encrypted: i=1; AKwUvBysuRby2ynoYonv04eh26JrNIkDh9F0c0VM5665JzchJ26FHvFja3Whsd6qTqIZLPe6agmBIgppg4DrPkc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJU+2unFfURtRGk9qGNW5u95OnmQT8S0Jxw44hF0hue2klinf2
	8FJeiGBm4cmmQC9rIcfWwqBLyMJeJ7RyyoJLz+GC1hyJZ7xiXO0pxY/mcaD45fG9+5U=
X-Gm-Gg: AYBFou2DvDTZ9lKOR74iQRNc2WJ96Qv9JqumYTohyDZMm9b/RdCYWxnrYf6llzhlcWU
	k0dvpwoO16OtrE+WoPcJ0cgZB1GV/qEZe9bOs2BPDyBnf7L02reQ35KpQYtpEy2378NVmVltwYR
	lj2yIIMZaco+1eN1GiNwX+KK0JyqWjRuUo+bMBUSnJsnJOHltNx9K5015SEcTcDMbc8BbeGf9/t
	ivZalwj3t35wg8fBqA5qspLSuAhXnagsErng4i+wtQa2OPbx2aHlMhadJkoUnLXprAJApE6FgXm
	vWt/xMRuAUMnhaIe3L7E7UfZ6597XVvobVyyhTnbj5dwTifDmAl96TXIo91BOTSt3LuJBw9/v7b
	T5WYil6IWxUb/uo/CtZ6Jw4P0+1Jo3bC7+IZrOdhUTRtMZ5/EmSlk+OWBnkw1A6pZugu6VwJ5jj
	9JBnXVj99zDNZR14scTGmH3SGKaq+lt1GyvwxtAddoHLAMKqqtW+EpaEeuykRIMxenrR5zSR+n/
	WgOCxxsWvat0w==
X-Received: by 2002:a17:90b:2684:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-3a4d151ef73mr1140780a91.18.1790777235209;
        Wed, 30 Sep 2026 07:07:15 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e60ea12csm639509a91.1.2026.09.30.07.07.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 07:07:14 -0700 (PDT)
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
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v6 00/12] mm: Switch device DAX to section-based vmemmap optimization
Date: Wed, 30 Sep 2026 22:06:15 +0800
Message-ID: <20260930140627.57431-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This version is based on mm-new commit a878c908dc92.

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

[1] https://lore.kernel.org/20260513130542.35604-1-songmuchun@bytedance.com/

v6:
- Use try_get_page() to prevent the shared device DAX tail-page
  reference count from overflowing (suggested by Andrew Morton,
  reported by Sashiko)
- Move constant declarations to the top of their functions and fold
  the shared tail-page array lookup into vmemmap_tails() (suggested by
  David Hildenbrand)
- Clarify the DAX population flag description and why optimized tail
  pages must not be poisoned (suggested by David Hildenbrand)
- Collect Acked-by tags from David Hildenbrand
- Rebase onto mm/mm-new

v5: https://lore.kernel.org/20260927025441.741633-1-songmuchun@bytedance.com/
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

v4: https://lore.kernel.org/20260916064341.1825793-1-songmuchun@bytedance.com/
- Rename CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION to
  CONFIG_VMEMMAP_OPTIMIZATION (suggested by Mike Rapoport)
- Collect Acked-by tags from Mike Rapoport

v3: https://lore.kernel.org/20260911050228.58884-1-songmuchun@bytedance.com/
- Use EOPNOTSUPP for partial additions to sections that already use
  optimized vmemmap mappings
- Move device_zone() after NODE_DATA() to fix non-NUMA builds
- Collect Acked-by tags from David Hildenbrand and Qi Zheng
- Rebase onto mm/mm-new

v2: https://lore.kernel.org/20260908030335.96549-1-songmuchun@bytedance.com/
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

v1: https://lore.kernel.org/20260831075342.57563-1-songmuchun@bytedance.com/

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

 Documentation/arch/powerpc/vmemmap_dedup.rst  |  90 ++-----
 Documentation/mm/vmemmap_dedup.rst            |  32 +--
 MAINTAINERS                                   |   1 +
 arch/loongarch/include/asm/pgtable.h          |   1 +
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 124 +---------
 arch/riscv/mm/init.c                          |   1 +
 arch/x86/entry/vdso/vdso32/fake_32bit_build.h |   2 +-
 fs/Kconfig                                    |   1 +
 include/linux/mm.h                            |   7 +-
 include/linux/mmzone.h                        |  38 +--
 include/linux/page-flags.h                    |   5 +-
 include/linux/vmemmap-optimization.h          | 115 +++++++++
 mm/Kconfig                                    |   5 +
 mm/hugetlb.c                                  |   2 +-
 mm/hugetlb_vmemmap.c                          |  31 +--
 mm/internal.h                                 |   9 -
 mm/memory_hotplug.c                           |   6 +-
 mm/mm_init.c                                  |  17 +-
 mm/sparse-vmemmap.c                           | 227 +++++++++---------
 mm/sparse.c                                   |   3 +-
 mm/sparse.h                                   |  81 +------
 21 files changed, 313 insertions(+), 485 deletions(-)
 create mode 100644 include/linux/vmemmap-optimization.h


base-commit: a878c908dc928cfe8b3be0f33d3e60d1af437cb9
-- 
2.54.0

