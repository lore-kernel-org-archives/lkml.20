Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36145423E9E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419878; cv=none; b=UBxbreUR1Kws8ni/cyuGE1IJoSdrS0d4C55F2Aftfsi5jDimjXqIhKyIcHQN/cOSyjEKVeoPXyhVlQ98uUh5tTUVNNCCr4/7tq+UqBw4jhHSs23CnKkJkZYf+9kGIF3xt2fTsWI+yC+HBgB+xvVdCfKlJHGxvKiT6vgh/MzSRs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419878; c=relaxed/simple;
	bh=KaCGZHclEi7vRyauxRwtUWXorE/ecwSVoVfhExE/pck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OgnWbOYwgDYzp4gPNJIQreLsJ8+id9jZ7eRohWd0hs74l8uWnqwBjAMETN3/8u94ylqyonZ31gZgNhVrGod3HfuMfDeVh+XPLDJaY0UFj0VFlY7fBpZhjcj3KOX06KnkYLmAJdrb9ZCrX2/nvt8RKYIhBUMt8X9sAkYCvXZXF4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=qygI8Rgr; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="qygI8Rgr"
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-5332bdd8296so3969391cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790419873; x=1791024673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nhXhBLbXkdtNzOcTcim9FzBfpMg5vkoQVWLwtE5p/IQ=;
        b=qygI8RgrbHPfJrnySoOxSuRHCeAKX1Fkj8NISWON6yYOmp4UtgWoFNSJNCSJDJ/hRD
         jreMHWxQVv9L5RthIaRLbZUAEujmFK2INewriiYbET+f+Cu3+ihpN5eVo0BFFMSvRGG6
         QWCUukkezl5qIhHG0lOFJESGChlTt/4/8obM16nYQzLUsx80R59fnag2mpyYx78oeLhH
         ee+iL+kcLMtI6Yc/r4ayS3jjXx19oNOix5VL1bjOvbp4eHgpdxPv1oywuIZJbl9FUQV3
         +5I0G2v4NRDcj2ZzJpYnFYaUhBMnJ9HZIrxPtxy7xOR0lfhDAFD4enh931ehZg60xr6F
         pa0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790419873; x=1791024673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhXhBLbXkdtNzOcTcim9FzBfpMg5vkoQVWLwtE5p/IQ=;
        b=hCmaoRJypz30zOauTju4in+SUdtNDXCUepOzD0dbQluT1lT8myHcpv/JuxYaY8xleZ
         AZNozo90cZ1IkUmSMNVfymeU0LhC5gnWFBLk5Zv86+1hxS6oQx35IBtiNRFxMoAsSuyf
         GeNlLRfk1dKTq1xMoiw9W+pfFCsXhSeQj08dX/bKuYAeUNc+I31V3iqOzFe4xK4hpbuY
         CHBzcQWq2phTkwJJ+qzsJNj8tD+dKWP0n4Z15vtMqu72UZmKQVb3jbMlytmX4NASpj/V
         JtFHVSXf9Z00Bqxhg3ZEeDi0jr6unQElKtmaYO+5NHOMsBK7dozl8vDX+DvBKHDieBJ6
         4pMg==
X-Gm-Message-State: AFuF++nHobpLxRFoNAT2Dea/seub4eeA1vbkDmnOnML+l2e5OTFEgPZN
	zPOML94ceMH6vWxTUA83j7xC8mL4XjrD2EJGtbupTEO1VKKGKzGlwvu8JeSnROdnyNc=
X-Gm-Gg: AYBFou1mFngWVmSCAqz++iSk3reIjZWFzuEw832vdW74sI/1jy8qrDg33KFC7BE7CVa
	5dmG67fnUTnk3iEx4PJk04NK5qehEuzQPlJdD2BaeOK8XHj5+hzCBmr6hfh34PHiuCA3PhfRN/J
	hBzRivKQ1C1q1/Nhq0LhEzapq+7vRHtfQ4Au86veDzTAh8lXX3RwJDXejBEMInfgrAZXcvDP/md
	WU7q15FMDtCI9riH5VpO0kwGCWHJB774mXe8ufNiS6iiTJC2tcTReHUUFa+XoHPADgw7IlnnFha
	7cKgSKtjn351vqjKGvFaG1QRv587zceWoD3tIy6CKEOC/MEXkl1Vi8Mrncbr77VyemNFv6ujKJE
	wFR/nN87ue4D8bMalr9q5kFt5/WjEMqjAUmzS1HSWGOZhy4apHWFQ4Y6vikGrPmjlhSdmcJbrDj
	7q3062AhEKrp0ghG+RbST9K3T7ytfEY25a8qMPTvHATMPdASbwl9itprb/kf8LtcGtOLIBaDbRF
	I0oondIF1dSlP4LTcrNnbUtc+icM5uEIZ7riLEQpe0Tf1yXFjXh6CVCCXp8
X-Received: by 2002:a05:622a:e150:10b0:532:9bac:55ed with SMTP id d75a77b69052e-5330b583945mr70779921cf.7.1790419873168;
        Sat, 26 Sep 2026 03:51:13 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53322422063sm15060361cf.28.2026.09.26.03.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:51:12 -0700 (PDT)
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
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	peterx@redhat.com,
	jgg@ziepe.ca,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH v3 0/2] mm: stop calling pmd_folio() on special PMDs
Date: Sat, 26 Sep 2026 06:51:08 -0400
Message-ID: <20260926105110.2156652-1-gourry@gourry.net>
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
v3: improvements from Lorenzo
v2: improvements from David

Gregory Price (2):
  mm/mempolicy: use vm_normal_folio_pmd() in queue_folios_pmd()
  mm/madvise: use vm_normal_folio_pmd() in cold/pageout PMD range

 mm/madvise.c   |  7 +++----
 mm/mempolicy.c | 13 +++++--------
 2 files changed, 8 insertions(+), 12 deletions(-)

-- 
2.55.0

