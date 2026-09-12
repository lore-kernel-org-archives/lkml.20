Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58604BEE44
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789184919; cv=none; b=Fx2mSz2dy1xh1ybjEmNOixF3GDxpcwRpT6PTF4BCNIOCqO09e3s79HMhzJnrgyRlKCe2ARMawYG1VSL/t2z5AyDY/n5n57wbwoD51uM2oNILJNwzkIqNVvYTiCyaJCeku2X8QMyevEDZzvJrfyEj5ucMg3oOiPw3lESfCj6RJL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789184919; c=relaxed/simple;
	bh=mYoMmheMoasLET4QI3Le0+6t46Vtg1yOJjckwQ9B7V8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p4eHmNhpTZyIdAJflct1eNPS2FPsCTCpXNF8aK7f6WcPP0SKs4+r5JysmtYktT5iInGznPbzlM7A29fZvtRwFjooo6ndlMGYySumfHdWb62TvH/38FRztjdGNCNwVUvo9idDfRfI5efaHpf2jwkb8eBJ3n0PMmXaiKN2YAUrYJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=H+s5e8sf; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="H+s5e8sf"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91053c27a91so15900926d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789184916; x=1789789716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=plkBLD16av4xLeK164/lGunO4Zlly9VfMGr5BH//1kE=;
        b=H+s5e8sfXo0CXu2bBpBgkvutPCwVd+WPvyJ8kKiflOtvv5sPRwkXzdxKSQb+UIhgcU
         is2NbGGbSHrfl8ug+jKw0gmWVYuJteYQIGywR1nkAxWxC9+GkpfLlFsOnsdcNui/Ohwt
         gSG7TTX8pKlbzhDOa/0qF6Rxf+4S1v7J/4GYrx4Axkw+wSH2+B6mQXQJN/IcrDVUTqSg
         /QCza/lWMZKark5NB1wZbMz7VYqSHxS8bbXL4Oq7XBuLgEme0LTq5SinXPES8y/mhL++
         dhXg+VLZuSYjTYtuqjudpkk52n7KbtmmPtU5zUWuBWjaEKwxAGjAIQX0f1Ns0/l0Rzvz
         ztjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789184916; x=1789789716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plkBLD16av4xLeK164/lGunO4Zlly9VfMGr5BH//1kE=;
        b=Vpy+yqMb9e04ncfLO6uyNyMCNH+wtFosA60nMKKzO865bCK76Md/cf/305P/FQ+2XE
         0lkUKPs0j0nB9oQLNsroW1OL9Ep1hwKKJWbOYAmIaADqz1OB1naYWCMPhXTwDC19DENL
         YNaVArncU8pV85oSxzFGmJuWe2LuFK242++AaNs2RPhRB05Fl6SeiEB2eDg0mpkSw8hT
         KpI1LyL8YsLRCOXbCYGMceF3VeKcB4601QIR9ONUrczIEAoKyEGpnayOlW4jEUtoVko2
         1E2KUV8Gc4bTKGhWwYVeAuoSSdSLJ8ZCUoCz1pXZoWNgxxljADGchYj2j8BF5iUizkpN
         n3XQ==
X-Gm-Message-State: AFuF++lv55bkhAtnwVTiRPNLY/CC6Nk8kaDsT+KTJjwbsOpt3J2aVyeO
	gb47bTCwtLqhRZ8dL9+T5jcP1uHYb0UhqckK5uOH62iRc/QnXnzmsCbIKI/AhxMGbdY=
X-Gm-Gg: AYBFou0Dtfn82gezOXlFbWeSq+TpD/R/fXXz3kQVTb48LwbDKNsuW49ALPjo82dIUVK
	7uOTbVnG5JmUQDCTyNL4Irz6KTig8euuQJaTg247jo7D128t1Gl6Khr/onhVSQvtGE3XT7WOJwo
	8izuzehjisJi90XY2WHUbi6NeAVuulHpXR2tEo/tZxERrdrggnAY3tCM5mpKioxmdX7O6Sgcqvg
	23yqmx+AdQ0DmAE7I8LkkC9UvLSAIuPRBYDZQHRzlzvbbTzXeFW+GCg1FKKFRaPkh89HFwowehn
	lSHdFCX9BnMaoyNOg5UdLDL4u7aTWhlA26C/vhBPEGHBYSECP4zyrUbMIKF+tP4Oa4lEtsmzmlI
	GOwsnQTq+kP6rs2Q+loFwcCBISyHHaiuEE3RNeY87gZsSfaRIcKCVAv+oy2kCGxN/ZBmr4Aux6Z
	lhC318SpKTlVEzZsbFVJuWkQk3L97uhjrUa/7IVjVAcDC2UI0us47NxFUQS7OT1FJRqcgOuVttz
	zVbHH9xftNFFkSPu38Gx3FlOzvi68eL1pqWv+q0s2QelWml9L8Uyj9iHC7t
X-Received: by 2002:a05:6214:529c:b0:910:6a88:1a28 with SMTP id 6a1803df08f44-912120e24abmr96843286d6.18.1789184916546;
        Fri, 11 Sep 2026 20:48:36 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f494620sm36252476d6.28.2026.09.11.20.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 20:48:35 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	peterx@redhat.com,
	jgg@ziepe.ca,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH v2 0/2] mm: stop calling pmd_folio() on special PMDs
Date: Fri, 11 Sep 2026 23:48:31 -0400
Message-ID: <20260912034833.2952750-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two page table walkers resolve the folio behind a PMD with pmd_folio(),
which is only valid for a PMD mapping a refcounted struct page:

  madvise_cold_or_pageout_pte_range()   mm/madvise.c
  queue_folios_pmd()                    mm/mempolicy.c

vmf_insert_pfn_pmd() installs special PMDs holding a raw pfn that need not
have a memmap entry at all.  Both walkers can reach one and fault on the
first folio field read.  The PTE halves of both already use
vm_normal_folio(); these two patches make the PMD halves match.

The four callers of vmf_insert_pfn_pmd(), and which walker each reaches:

  drivers/vfio/pci/vfio_pci_core.c        VM_PFNMAP     mempolicy
  drivers/gpu/drm/drm_gem_shmem_helper.c  VM_PFNMAP     mempolicy
  drivers/gpu/drm/panthor/panthor_gem.c   VM_PFNMAP     mempolicy
  drivers/hv/mshv_vtl_main.c              VM_MIXEDMAP   both

can_madv_lru_vma() rejects VM_PFNMAP, so only mshv_vtl_low reaches the
madvise walker, and that needs CAP_SYS_ADMIN.  queue_pages_walk_ops
supplies its own ->test_walk, so walk_page_test()'s generic VM_PFNMAP skip
never runs and vfio-pci is reachable by any process holding the device fd.
Hence the different stable tags.

One behaviour change: mbind(MPOL_MF_STRICT) over a PMD mapped VM_PFNMAP
region now returns 0 rather than -EIO.  The PTE loop already returned 0
there.  drm_gem_shmem and panthor are where this is observable, since they
PMD map pages that do have a memmap entry and so never faulted.

Reproducer
==========

No hardware needed.  An out of tree module stands in for the drivers above:
three misc devices, each with a ->huge_fault calling vmf_insert_pfn_pmd(),
plus VM_HUGEPAGE so the fault path takes the PMD branch.

  /dev/pmdspec_mixed    VM_MIXEDMAP, pfn at the 1 TiB mark, no memmap
  /dev/pmdspec_pfnmap   VM_PFNMAP,   pfn at the 1 TiB mark, no memmap
  /dev/pmdspec_real     VM_PFNMAP,   real alloc_pages(PMD_ORDER) on node 0

Userspace maps the device into a PMD aligned window, reads one byte to
fault the PMD in, checks a module parameter to confirm it went in, then
issues the operation.

  vng --run <bzImage> --user root --memory 4G --verbose \
      --append "numa=fake=2" \
      --exec "insmod pmdspec.ko && ./pmdspec_test <subtest>"

numa=fake=2 gives a node 1 to bind to; the module allocates its real page
on node 0, which is what makes queue_folio_required() true.

  subtest        operation                              parent   series
  --------------------------------------------------------------------
  madv_cold      madvise(MADV_COLD)                     oops     ret=0
  madv_pageout   madvise(MADV_PAGEOUT)                  oops     ret=0
  mbind_mixed    mbind(MPOL_BIND, n1, MPOL_MF_MOVE)     oops     ret=0
  mbind_pfnmap   mbind(MPOL_BIND, n1, MPOL_MF_STRICT)   oops     ret=0
  mbind_real     mbind(MPOL_BIND, n1, MPOL_MF_STRICT)   -EIO     ret=0

Two things the table shows that are easy to miss in the code:

  - mbind_mixed passes only MPOL_MF_MOVE.  MPOL_MF_STRICT is not needed for
    a VM_MIXEDMAP vma: walk_page_test() only skips VM_PFNMAP, and
    vma_migratable() is true for VM_MIXEDMAP.

  - mbind_real demonstrates the user visible change (-EIO -> 0)

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260817220810.1175596-1-gourry%40gourry.net
Assisted-by: LLM

---
v2: improvements from David

Gregory Price (2):
  mm/mempolicy: use vm_normal_folio_pmd() in queue_folios_pmd()
  mm/madvise: use vm_normal_folio_pmd() in cold/pageout PMD range

 mm/madvise.c   |  7 +++----
 mm/mempolicy.c | 16 +++++++++-------
 2 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.55.0

