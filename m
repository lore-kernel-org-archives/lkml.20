Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B7A369D4A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541032; cv=none; b=ogb3QK3fr+hMC1wjaq1Tkuw4w/cOJypTdkvVYd/AFCc3UTYgx00UUCMMY+pAJrUbTc9PjeeQ7hJFSZK7iWS+yDPW3VD2cUi81fNnrAySaSkZxzW4UN25x8132T/bkeOr4/yOZ3njb91zScLMTZVLPaqm15F873RLmNF89QUxFPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541032; c=relaxed/simple;
	bh=b8pnn/SiDglJnWPVnir4w4YF14OjtezvUlbOoE/IZjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d2KhhNx6xu+2WiWMu1heYw+hO3XQDeYudKdui5wAkGYSTcwHTHXSkQJwfKgzeU+6iV4xrKqKuBYuD6qSUajmx3O8+5LcD79Ftc+q3BPlkaZBlhNkeO+mIAiQ7ELmiOkJ8YitM0Lbq4SI9b+I2hnNfkxSjD1uqLwnW/bmFUm6Ed4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=PO/mbMam; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="PO/mbMam"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f6so3859405ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789541030; x=1790145830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0LtIEs9A+1i71VGLOsFyci15iFpT6FPKjskDwO0GIQg=;
        b=PO/mbMamZybwP2GqUQ0mR+aFEkjM5rXshtIQv7YB7nLE+HSfVSeMZejxgBfwk7su04
         QziYdPR1/0kGLEwNbnfWLpYGM2czfoppfamYHvelAznP5hITCJcSVh3Co/LVYuCyptJG
         AVS0RBZQuSy44XIhoKVIlKro/iRFcp7hZGIIKhHo64upsZfWGQpRIR9WTD0lL8ea4YiB
         0RMPzbjZreleqXIFYNHRdD2px1TKHeU7G1pCR8vU3uagX6FuZ3iBsQUThJyCFI6zsZbO
         fNpM+coiWtGMtVm0qLt+NLR8kVnZlvlXvrhBV8LTwGwRWIGLCtQJzJT2Jy+N6SXLex9E
         hXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541030; x=1790145830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LtIEs9A+1i71VGLOsFyci15iFpT6FPKjskDwO0GIQg=;
        b=BAgzdMg6IwZFFDkj5R1skPGmGx2ewCLVhLzLhPAVuhRd0qZcsXMz0yy39hG5iZmGvV
         +ti0dpSr0RpBDVTHT2EzE50NWmmToSGhF4Rf5noQ77cc7EZvEBuQEPN4YifvPQXEtZNc
         Y63wzyVz20ZQ4oPMYSzNKpO/0vDrcZereUp1X+FpPmWa2R3PnLvBW7WM/2V95wctIZZx
         gOF4ebBjkRMpUiWboekreGSdq3NzbgF556S4dRR0azb60Qw1x2YwcXJglK26p4OP64W4
         vHB7bX4MT6gElnT37Pte3/qIESPlDd8FDtsUo2r0ipKKqgzOzeIHF0XyIDr3MYGJlPmr
         aT3w==
X-Forwarded-Encrypted: i=1; AKwUvBzWMjmCtTTr23g6FsA0zY/GOfFrvAu1qgZ/yV8I+dPgG5Kl976ZuMCXBO9U9KCAnTCMoj4essA+CVN70B8=@vger.kernel.org
X-Gm-Message-State: AFuF++nRWC5sSniaE+jE0kaOgXXgQ7XTdhCO81rRx1e/JK4wt+PwHgF5
	D903RnrxOUbnyG2eohxn9+TDJ4dtuMouuzg9OmNDBx7VLDpVFcQCN5NNQjuHsp+lXK8=
X-Gm-Gg: AYBFou3WFmSx3DE1GD2qqahSs7WkH9rT5Gx8AAbeVSFprRoGSr4EYAAS0hc5/YXHtnV
	sm7kNCEMJktOB7+roMI9FFJfzl7h9BT5H6zCLexuwaX3+J1FjWk2stygU+S23TGjbmFd7gBZ+ny
	pbRiZNrgR2/+Ueg4cQY4LqMWi6yOyJo6LUPEyYIS+MWbc6UsToPJCzs83MHWpK4licjOawN2/3i
	vmK0r/khJq2YRhgCmEp4BpV2N+HtLYjeZOAHYeubemivL02kaWfM5cHOMq924YLeJQ+SFARC2uW
	XXySHI/wPJa4t+QQMO4i2asvJfSIwPt3JiLZAAuJvX54dzzDCewAhKs/yBOz9AyFJpdo4dPIt/C
	mIs6HmlmykhYDeV2kYI3+JNlOKnFjqd8rTClDgoY+COTGl2HfXrwBm3Lw1CdH+QpX8+kOlFmMLF
	PUEScMlRU0ZEEZJLnjfgr5PzOKbRZCp9Ezq9SDwml1SBJ9b9bgoyu734g0kTYPtScWYEcwp1DH4
	GQQuaJ5wffo4Qj5EJk=
X-Received: by 2002:a17:903:22c2:b0:2d9:3083:a3ac with SMTP id d9443c01a7336-2dd8e52c3aamr26882255ad.15.1789541029585;
        Tue, 15 Sep 2026 23:43:49 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f0592asm6074755ad.62.2026.09.15.23.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:43:48 -0700 (PDT)
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
Subject: [PATCH v4 00/11] mm: Switch device DAX to section-based vmemmap optimization
Date: Wed, 16 Sep 2026 14:43:30 +0800
Message-ID: <20260916064341.1825793-1-songmuchun@bytedance.com>
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
generic CONFIG_VMEMMAP_OPTIMIZATION symbol, factoring out shared tail-page
allocation, and keeping the special shared-tail struct page initialization
local to sparse-vmemmap.

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

v4:
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

Muchun Song (11):
  mm/sparse-vmemmap: introduce CONFIG_VMEMMAP_OPTIMIZATION
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


base-commit: 48cd55c7cb7b6a674cb94c2d65864088877f9279
-- 
2.54.0

