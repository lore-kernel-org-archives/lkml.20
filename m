Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842F23ACF00
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895745; cv=none; b=CvMx/XBkNu8qNJ0lfYvec+NIXX1R4DWyySilAOJ2GJ6XNYk/mpl2MuAHnP0xSanExpu4ri1PZtePv6f+jfGYudBgW8fo4gTRV4IGkyCfHKNXz8o9NJtbUy/RFEaR+5cBpuaKserSzQvfUn62SwmonBm6j2TuhLdmChRA0/6EDsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895745; c=relaxed/simple;
	bh=00lrWxZe17VrlhuY3VaolhqUrEvdKVBmom6nqLyg/hg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hJnB2KRsz2x0VKJNZHEGiFdP61wh2IMX4cgAZ7V2o0kmh3Dt0jVrlp5aNWYiR4pisKsLCqXSp8offOiSWN9uOr/j2JchE8l01ljVSqgvlXkci44srOW8KVKabcROiPu+7ocq/c+m0K02FqeLmD19t/aDsholQVacADHf7i5gogc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kQjnawV1; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kQjnawV1"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so8007825a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790895743; x=1791500543; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7bxlv5ntBdZO0LQcKQEFlA8jL1mkcFGaYA5LZP7KTXI=;
        b=kQjnawV1o5c2J2JqH3ByeZZ7osbgFFV7f6EO06X8doygKYogL9nVQ/GEY4P9sXiwRq
         V87lsfbS7HCP3B8alV/2XLRK5AG05FsB+GwBWAaBKEo5YP77iOioYJOivJ9c5GplFnzc
         BbTHdPMDD1i+BHvGKxJmZWdzVnP3ABfS5ytPBbCyJla8mG9XJRAzZ8Hqv8p6bPakasWa
         GQFu1GGhvAFDKXfiGkF8UXDw3eiQxUTCee2hAJ7qq9FU87a6S9qN12alJWLPWnJLsVvJ
         qyYxAxzs9aMvrqwLEPBt9g1x6f3s3N/TAKvhaTDDC0m6xuyQ50R7q/zzN/6nRyAan0Sa
         NKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790895743; x=1791500543;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7bxlv5ntBdZO0LQcKQEFlA8jL1mkcFGaYA5LZP7KTXI=;
        b=xHJ2HqHT5JKLgYQJu0tjtfmwJVxSuwDzVqfvzGgmo9v4I6/rZI79j0oO4TkrZQYsEN
         qxMcuAlLHzQkbjHaJiwyyB+QOI2CIoKj/12xcwStuFhXxKSFjJ9+y57w8VLxiw2BtL/U
         XuGWAVWYRhM9tfg4tsF76gtA4MXeUNTDBlZvwFoxV5a1VCyKtqnxgmeyVGQurFMhooR4
         wX8oidmb2J8rm9yINBj16kcMJ1tAsdJetH0zpRy0b35EUiUtFtl1OWVoeSsDUsyGm6f5
         +vVlurkrpUKm2GcfA+mqqOgjxWhdMmHLQ92lBObPni5WFqTIv86S0aU/Dboc0chUuDHC
         k0Fg==
X-Forwarded-Encrypted: i=1; AKwUvBzQctvPD2DiT3TTB4b0D6/nDIpRQAr53f/+G7DxOLmygSA/8GUTCeeG1vM7ThCS9wcYaRk3MVgu8Zvg2no=@vger.kernel.org
X-Gm-Message-State: AFuF++kXCgWap+UUWt+4RoApMW1FPgfU+JC2mlH+yQ5/9hrzPZ8j0zuN
	BubQB1iUgUghEoqm8tZn6WU3pncVgeqqCwfea+gvyA6W2rfik25yYqKftHbsD2CeePbJNFZH5A7
	D0A==
X-Received: from pgqs2.prod.google.com ([2002:a65:6902:0:b0:cc7:58af:e212])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4a97:b0:3c3:a3f4:5485
 with SMTP id adf61e73a8af0-3e0bc9f8cc2mr744551637.6.1790895742383; Thu, 01
 Oct 2026 16:02:22 -0700 (PDT)
Date: Thu,  1 Oct 2026 23:02:14 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001230219.818128-1-praan@google.com>
Subject: [RFC PATCH 0/5] iommupt: Introduce IO page table shrinker
From: Pranjal Shrivastava <praan@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: Mostafa Saleh <smostafa@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Logan Odell <loganodell@google.com>, iommu@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce a lockless, deferred reclamation framework for IOMMU page tables
built on the generic_pt library. As VMMs and userspace drivers map and
unmap large, sparse IOVA regions through VFIO and iommufd, page table
directories are often left allocated but completely empty. generic_pt
frees a table when a single unmap covers it entirely, but tables that
empty through a series of partial unmaps stay allocated until the domain
is destroyed. Under memory pressure, this *stranded* memory cannot be
reclaimed and has resulted in OOMs.

This series refcounts leaf directories natively in struct ioptdesc and
registers a domain-aware MM shrinker that prunes empty directories under
system memory pressure.

This is an RFC to align on the design. It has known issues, listed below,
and is not intended for merging as-is.

Design
======
 - Refcounting: the __page_refcount of a leaf directory's struct ioptdesc
   counts its valid leaf entries, plus one for the table itself. Map takes
   a reference with atomic_inc_not_zero() before installing a leaf, and
   unmap drops it after clearing one. Leaf entries are counted only in the
   table that holds them, so map and unmap never update refcounts on the
   shared tables above it.
 - Queueing: when the refcount drops to 1, the directory is empty and is
   logged with its IOVA into a per-domain xarray (reclaim_list). Only
   non-DMA domains are queued.
 - Claim: under memory pressure, the shrinker walks the queued directories
   and claims each with atomic_cmpxchg(refcount, 1, 0). A map that finds
   the refcount at 0 fails atomic_inc_not_zero() and retries, so it never
   reuses a claimed directory.
 - Sever: a format-agnostic top-down walk (sever_branch) clears the parent
   slot with cmpxchg, severing the dead branch from the live tree.
 - Free: the domain's IOTLB is flushed so the IOMMU drops any cached
   pointers to the severed tables. A single synchronize_srcu() then waits
   for in-flight map walkers before the pages are freed.

The cost is one atomic operation per leaf entry on map and unmap, plus an
xarray insert when a directory becomes empty.

Known issues
============
These are understood and will be addressed in the next version:

 - Map vs. shrinker retry: on a claimed directory, map returns -EAGAIN,
   which __map_range() already uses to re-descend into the cached table
   pointer, i.e. the dead directory. It needs a distinct error and a retry
   from the top.
 - Unmap vs. shrinker hand-off: an unmap that fully covers a queued
   directory, or a large-page map over an empty range, frees it directly
   while the xarray still references it.
 - xarray keys: the key is the IOVA where the emptying unmap started, so a
   directory can be queued under several keys and nr_reclaimable
   over-counts. Keying by the table's PFN makes entries unique.
 - A failed sever leaves the refcount at 0 instead of restoring it to 1.
   The top-level table, which has no parent, should never be queued.
 - iommufd allocates paging domains without iommu_domain_init(), so their
   reclaim_list is not initialised.
 - Combined with the observability series, pages must be uncharged from
   their domain at sever time, as they are freed after the domain may be
   gone.

Open questions
==============
 - Leaf directories with child tables: a leaf directory above the last
   level (e.g. one holding a 2M leaf) can gain a child table, which is not
   counted, and could then be reclaimed while the child is live. Should
   child tables be counted at install, or counting be restricted to
   last-level directories?
 - SRCU in reclaim context: the shrinker can run from direct reclaim
   inside a map's SRCU read section, where synchronize_srcu() would wait on
   itself. Should the free be deferred (work item / call_srcu), or is a
   different scheme preferred?
 - IOTLB flush granularity: flush_iotlb_all() is used after severing.
   Would a range-based paging-structure flush be preferred?
 - DMA-API domains are excluded since their unmap can run in IRQ context.
   Should the per-leaf atomics also be skipped for them?

Upcoming Work / Roadmap
=======================
An IO page table observability series, which attributes page table memory
to its domain and exposes it via fdinfo, is posted separately as an RFC.
The two series are independent; this one applies on v7.3-rc5 by itself.

There's an alignment session at Linux Plumbers Conference 2026 for these [1].

[1] https://lpc.events/event/20/contributions/2624/

Pranjal Shrivastava (5):
  iommu: Add reclaim_list xarray to struct iommu_domain
  iommupt: Implement refcounting logic for Leaf entries
  iommupt: Add lockless sever_branch helper
  iommupt: Introduce lockless page table shrinker
  iommupt: Return real page count to the shrinker core

 drivers/iommu/Makefile              |   2 +-
 drivers/iommu/generic_pt/iommu_pt.h |  81 ++++++++++++++++-
 drivers/iommu/generic_pt/shrinker.c | 135 ++++++++++++++++++++++++++++
 drivers/iommu/iommu.c               |   2 +
 include/linux/generic_pt/iommu.h    |  29 ++++++
 include/linux/iommu.h               |   3 +
 6 files changed, 249 insertions(+), 3 deletions(-)
 create mode 100644 drivers/iommu/generic_pt/shrinker.c


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

