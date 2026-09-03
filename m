Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7092F4A260C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438117; cv=none; b=lcoZtojVkPD79as7ep3/W/WVucQONiaAQIL/WNIw2dEGUowxZqbQcnVSyGBi9eKLTUQveHsoCP9dUlM0Pf5ZnicV0rLBPKmYeVQugda5cxW2P5HKvKpemnhiyhu6gs6NZeaQaQLZ4YcTMdconi9Gw65d6SrOnsvsAxKfdhZ5tpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438117; c=relaxed/simple;
	bh=gSp03gDMBE517M+sfYMxfrdEqp8BxtiQyag0D0cdDZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E3LPFbANuDT+BDZ31XQCFW1jDRQ4k5Ntz9yTnlvT/GXPEy+VScC9PuXM/7vZXSQ9TKo0kTdLCz5NnbanWrA+/nkiTIE1K6SbK3JAkekKSZ249lSbGDyCmKO1deomKiUuo4uglB0rm/usz1cRF5On0ccRlWSAFlEGpICEHj5ZdvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=K/FkTuR+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="K/FkTuR+"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso1949869b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788438108; x=1789042908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJ73qBOQiTpXKwSrjAZqmWemxXwNOfQBE65lRVHowjY=;
        b=K/FkTuR+tFUmn6R5hMiyhpSkfSjGDW8McKFqlDSYtKc6Yfi9iN3NmwHs8C1hFilCCB
         jwMPQB353w2D7zxkOqxaeyRW1dBnkaeFxu+bXaR21KNmor0K6gdukCjxwJwJCeL+sV41
         FMKYaLW8bku3mfCDX7TA3QLEBEiqGNTx/Xoerxgvz2zlL/0I8GiZv9Ju1BukErzsqki+
         1fHLheoSghIJAAbX/YCGgqTKlHbeZ9CVlEiSnrADDoLG4nsO62lOZg/rYYzBNLHj+9lz
         TI8NivZWb8wTxSOYFnot29LvmNN2ZkWFb5/eHWq/Ium48lccpaafhMv3Aw2hRN35XhwI
         iE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788438108; x=1789042908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJ73qBOQiTpXKwSrjAZqmWemxXwNOfQBE65lRVHowjY=;
        b=f7rwInjlT55BPSOIgKszir9FSYQd2Q8myvXWF+P4IUge5CRtjf5qX1k2FadTdTh2R7
         2cPTjEevy4Utw+j2TLCm4lm02ugzODtOO5BiItfKU1v0kh0Vi5Zyq2U6Le3kQBtYdJ7n
         2B/Jk/qOHYtORETPUpIJ+MqTX8sP9pGK9zwglegGJFvh0uqv66gdl7H2d9XFUd3f572x
         YLxmX9Qv7N3+7iBdPw4rWbQJ5GBIzjQWHdBk6kWPUSa7o3itqG9mulcZc5p2j1gnY56Q
         qiF7asdbQX6wdtP0lczXp2LRzCWgKa0qeM8Sz5j/rnvGxraSjBXfvukfObSIiPkwAax+
         sRww==
X-Forwarded-Encrypted: i=1; AKwUvBxvej2wOEuTyaVi6dHXU/7Ntm5OreQUBUaj867E0Y0fbc9k0K9H5rA0LPjXnjHlM81W/H6/fG57P7MSmJo=@vger.kernel.org
X-Gm-Message-State: AFuF++m//OSrjsNBs94fYX4d+KFPYLYEEvV1jL8etexmpCtulU1euc1O
	24KgLJO9GA35i3+RCdYDE7l7ZDxK2ggUZlnc+DrmThl2AZddE8LXsCRcEN3VdWGvaLM=
X-Gm-Gg: AYBFou2REy61HZYsv6Rpk0Kefajmf29xtNM5dJEjCuGTNh7WZR1VOxZ7R3YS6VTrFXZ
	E2mMr5G+AYGX/LVebT21YWpHy+a4hDb67l7qWQDioKgXDxDhIdVDv//D5R523KRMq+bcKEpRYdv
	I6qRTvO92hDn4BC0NZ4yRIFKlYJSG0hQBqz+B5Rzm/xVFL17Em4PvfyLIehYTkRS1OhuEVOEllG
	wwLT/QI9ZTXuHnBYrqF+tPhe9RswWQkvnMr+pXKwHlkR6E0oLIIPBfFLWIfrSx4oRKnqVdAOHwg
	2PFO3EPaIJp3KNt5fp9/1p1l5OUGpaoHuPXtj8wwIQF0XwOA2t0hMUAo0Wl8KkKfpjjLSoz3zHO
	IkgwMN3JE4zAnK3LbcscwNEdYz29pvbKvtNZR7JTm32zc3Bk/wruJBPFi5EbyYYgKAMS/MV+keT
	Kce7SDgVUvl9gywIPO6f0I05VOOtHA7h8jJd7T/KjNuhM+4ZFYT83ecRlV0fAc0Ousf50D5FIK2
	Cxvu1ZMC1JDMrD0WNw2YryLgA==
X-Received: by 2002:a05:6a00:3021:b0:848:30c3:45dd with SMTP id d2e1a72fcca58-85ed2cbc58amr18768996b3a.11.1788438108017;
        Thu, 03 Sep 2026 05:21:48 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f2076sm2868126b3a.4.2026.09.03.05.21.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 05:21:47 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <djbw@kernel.org>,
	David Hildenbrand <david@kernel.org>
Cc: linux-mm@kvack.org,
	nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Ira Weiny <iweiny@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH 1/4] mm: generalize vmemmap remap architecture support
Date: Thu,  3 Sep 2026 20:21:24 +0800
Message-ID: <20260903122128.12264-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903122128.12264-1-songmuchun@bytedance.com>
References: <20260903122128.12264-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP is named after its first user, but
the underlying requirement is not HugeTLB-specific. Generic MM only needs
to know whether an architecture can safely remap populated vmemmap PTEs at
run time.

Rename the architecture opt-in to ARCH_SUPPORTS_VMEMMAP_REMAP and make
HugeTLB vmemmap optimization depend on that generic capability. This also
prepares for FS-DAX vmemmap optimization, which relies on the same runtime
remap support.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/loongarch/Kconfig | 2 +-
 arch/riscv/Kconfig     | 2 +-
 arch/x86/Kconfig       | 2 +-
 fs/Kconfig             | 2 +-
 mm/Kconfig             | 6 ++++--
 5 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 9c5def706222..e9bf19172e86 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -72,6 +72,7 @@ config LOONGARCH
 	select ARCH_SUPPORTS_RT
 	select ARCH_SUPPORTS_SCHED_SMT if SMP
 	select ARCH_SUPPORTS_SCHED_MC  if SMP
+	select ARCH_SUPPORTS_VMEMMAP_REMAP if 64BIT
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_MEMTEST
@@ -80,7 +81,6 @@ config LOONGARCH
 	select ARCH_WANT_DEFAULT_BPF_JIT if HAVE_EBPF_JIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select ARCH_WANT_LD_ORPHAN_WARN
-	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if 64BIT
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BUILDTIME_TABLE_SORT
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5965666194b0..3614001cafdb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -76,6 +76,7 @@ config RISCV
 	select ARCH_SUPPORTS_RT
 	select ARCH_SUPPORTS_SHADOW_CALL_STACK if HAVE_SHADOW_CALL_STACK
 	select ARCH_SUPPORTS_SCHED_MC if SMP
+	select ARCH_SUPPORTS_VMEMMAP_REMAP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
@@ -88,7 +89,6 @@ config RISCV
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select ARCH_WEAK_RELEASE_ACQUIRE if ARCH_USE_QUEUED_SPINLOCKS
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index a8c3b3d31a27..53f72d1500c5 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -133,6 +133,7 @@ config X86
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_SUPPORTS_RT
+	select ARCH_SUPPORTS_VMEMMAP_REMAP	if X86_64
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_MEMTEST
@@ -148,7 +149,6 @@ config X86
 	select ARCH_WANT_HUGE_PMD_SHARE		if X86_64
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP	if X86_64
-	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP	if X86_64
 	select ARCH_WANTS_THP_SWAP		if X86_64
 	select ARCH_HAS_PARANOID_L1D_FLUSH
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
diff --git a/fs/Kconfig b/fs/Kconfig
index d1c210c6508f..655795fbbd1b 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -276,7 +276,7 @@ config HUGETLB_PAGE
 
 config HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 	def_bool HUGETLB_PAGE
-	depends on ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
+	depends on ARCH_SUPPORTS_VMEMMAP_REMAP
 	depends on SPARSEMEM_VMEMMAP
 
 config HUGETLB_PMD_PAGE_TABLE_SHARING
diff --git a/mm/Kconfig b/mm/Kconfig
index c1ddf59c0d71..7ec734d89beb 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -463,12 +463,14 @@ config SPARSEMEM_VMEMMAP
 
 #
 # Select this config option from the architecture Kconfig, if it is preferred
-# to enable the feature of HugeTLB/dev_dax vmemmap optimization.
+# to enable the feature of dev_dax vmemmap optimization.
 #
 config ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 	bool
 
-config ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
+# Select this from architectures where generic MM can safely remap populated
+# vmemmap PTEs at run time.
+config ARCH_SUPPORTS_VMEMMAP_REMAP
 	bool
 
 config HAVE_MEMBLOCK_PHYS_MAP
-- 
2.54.0

