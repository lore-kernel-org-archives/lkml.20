Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0CF38DC6A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103013; cv=none; b=Dv8Y8Zwu1g6KrTsMBoeCJq+S/iE0eY7gjp/u6Yn65J92VbihvjAo5Zr89et0PaqQ9f4qjooA82NYi/YoBDkY41uK1RS6YHWVesH6fztGcF4TWlhVtJ4kYXJMmjQ/qRnm65z5O5CddO7Q2nZGTuDWUjw3MLal0CPezJQeC6F4ohE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103013; c=relaxed/simple;
	bh=61T4yHtrc+/68Njc8a6Em4ai4R7Ll91D9PGAmdrjjxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hOULPEfLuLXfmccgqWMv0URaqYa7Qi0VVreXJmKNiZldaipV2WTFHCOFhM95tmNM7CvGJCC+RD/z0C+hAtIjTw6IJu7EB+YOgjvrRGAc2lg6DGnq9KeJ9LQlRnaHrUbAmAoeCazh0z0V7XSLc0AHQPNG+I8KCT4fbAJlJKt/TQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=OItLOlIO; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="OItLOlIO"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so488707a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103007; x=1789707807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqQtNE5K5bGF4fAhBmQKuNzeCVlz+kHVYANXwAzhHeA=;
        b=OItLOlIOXlUIS6A3VCFW7vJ3vP44BD2ixBXKW/3RTx6J3ruJyDaD8HqDZY912X2IdE
         mUw9rp3mqapwNm4w+oltQm/33ibredE0PnPIp4XEIldx0iZP4GAja/Y1/X6J8JOMZG5m
         iaFeSnologR2tP7PNCelvzULLYLWEVJZHkATdcce2qE3mZ7HYH0ifnZKI9jfqtH7X219
         N2e8hkUoEtgYtoMMfRSIqGoJZQMtrv+5Y0g3D0PMspf6LokK1gO+XbQnL9KBQNy3hAyZ
         fJnVmwNYgjZKB4D7MjAJhOh+eNqrMmpO8l8lqMykh0vOEKC8eac14IFucH0xXbEh1Job
         XWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103007; x=1789707807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqQtNE5K5bGF4fAhBmQKuNzeCVlz+kHVYANXwAzhHeA=;
        b=qvn3lXb0w0jRyFFQDmx7VdDsSfOThk9d2fqQLd0z/+kI76PbLYgHCCM5DVuhyD14JG
         MvFtqgzLyR+J1zdRRnI5AOcVy2MLbgAUyt/mlnmecq8pQ6x07rg+9y8mCwbwI8lj2aJY
         eWzV4yofmBStDPSV32hqLcoyFIxJnGXf3MZvEsOh4QobcbuWuF1Vc3nmbecqbViArNX4
         8/egomK/8lqrn2pAoHOevVI+hKquBD8SsBZTJZuG98b1m0l1+jOvyRXD4YVsUCepO8GD
         UmW9REWZ/YTWUbNWb97RYKFlaoniMbc+lbaUk/HPn1UhcS11v7l0QhskEHOSvsH7Nuzf
         IaCQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8g5AQrNo82WDtNhzpGRELj6DuiDzHYLjjEERl2yoVfo2tdnx21sHPs4rucNAE/YW/8ASUHIN/mEX1hlg=@vger.kernel.org
X-Gm-Message-State: AFuF++nyEqyNxpUKUcw1MyqDxNYloby9P1XVq+D9s1DDqzuBFMDYA90q
	7gfGwuzwBTmo2mvdy1GZgmIDJTEEW+QvBEuGlorg8zdaqhQ/mCCAeDCVhHckzS+7UfY=
X-Gm-Gg: AYBFou2P81/YAQH6J5tPywntYkNXbyGi+92ieHhIRx0QoM2ewU69cMKOgnu3pteXXyV
	kcN8auqLuV5ucr4T6+Ek2ceZrn49FEFJt4ZTkvQj9O/HIq/3cldW1iIlDMsbXQQbeEsYS5x/iK2
	T0tjec7Q+7xxAR1CWa7Qf9Ti8GNLJFPkoqpcnJ7e8TrRgei2DrdhjOFjL4hDH4vnF5fsum0F347
	xwJfYlK7hpxDDpuTJHXyAfZD7CtPMaKXEqxozdFVVfcLaGWXE+b6PamITca2t9phUjUe1ynMXjl
	W1vphhLZ8Q+p/K01FmlbP6TOCeXAtz4FuInOYGvm3zq65P0hwE6W2vkUaBv7H96TXlEGFZsVT1D
	4R0CHN7Ka2B01+uLpbZetqf/ZTBPsY/yAboafz781JvJx+gbA6+EDdsnpJOIgS67iuK1zm8jara
	si1R+5GywczlEzaFMBL5/2wAbi8/txY/WXovR6DGTNnkkjnsvy3meeACz/Etf441UaM+0pL67+N
	MNi1rQ93+5vOZ83t9O/3n0csinbjSl/AfeA
X-Received: by 2002:a17:90b:1d45:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39d9c21cf40mr3843551a91.20.1789103006582;
        Thu, 10 Sep 2026 22:03:26 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.03.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:03:25 -0700 (PDT)
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
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 00/11] mm: Switch device DAX to section-based vmemmap optimization
Date: Fri, 11 Sep 2026 13:02:17 +0800
Message-ID: <20260911050228.58884-1-songmuchun@bytedance.com>
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

The first patches prepare the shared infrastructure by introducing a
generic CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION symbol, factoring out
shared tail-page allocation, and keeping the special shared-tail struct
page initialization local to sparse-vmemmap.

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

v3:
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

Muchun Song (11):
  mm/sparse-vmemmap: introduce CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
  mm/sparse-vmemmap: factor out shared vmemmap tail page allocation
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

 Documentation/arch/powerpc/vmemmap_dedup.rst  |  90 ++-------
 Documentation/mm/vmemmap_dedup.rst            |  32 +--
 MAINTAINERS                                   |   1 +
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 124 +-----------
 arch/x86/entry/vdso/vdso32/fake_32bit_build.h |   2 +-
 drivers/dax/Kconfig                           |   2 +
 fs/Kconfig                                    |   1 +
 include/linux/mm.h                            |   6 +-
 include/linux/mmzone.h                        |  23 ++-
 include/linux/page-flags.h                    |   5 +-
 include/linux/vmemmap-optimization.h          |  94 +++++++++
 mm/Kconfig                                    |   4 +
 mm/hugetlb.c                                  |   2 +-
 mm/hugetlb_vmemmap.c                          |  30 +--
 mm/internal.h                                 |   9 -
 mm/memory_hotplug.c                           |   6 +-
 mm/mm_init.c                                  |  17 +-
 mm/sparse-vmemmap.c                           | 184 ++++++++----------
 mm/sparse.c                                   |   3 +-
 mm/sparse.h                                   |  81 +-------
 20 files changed, 253 insertions(+), 463 deletions(-)
 create mode 100644 include/linux/vmemmap-optimization.h


base-commit: c46036ca3ab7a7628fabe5790aefd917d0858db6
-- 
2.54.0

