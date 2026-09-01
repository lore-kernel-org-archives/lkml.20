Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781072EF67A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232372; cv=none; b=Bu7Bf4HatNY4TghpF3x7Tha7MG3Jih+jZ/Zp9x24KlRzqtZ1KxdCHglEQg6Q2W17oYRu0ylKQXIWaCZh2Ck9g8ZMwxNwl9f5MkbkuUWUoqigsWvk4c9z203R45SJF1igPSNNpvWNb5GxeE8/4WKpKdUFzb4Mhr4FXmOqslthxvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232372; c=relaxed/simple;
	bh=pfY+Z++dtZ+g07KWN32vQFEyr+d3e97KhKR2qmC/hCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jb/LrFKxY9u3dS1UkLcGugB67vwaEHvh1cldkxLc5l4bHW6EUYmoljMZUghJPT9DrPcUt/TGHDxqhu0x3S8TtvAhQXKlN0TEbV7OWr5VbOVOpYoNJGYlUYF8U5zlOqq8IpoRfoS7rEJTb9OsrG7tNQgDNPhiNSaowNlfb+jfxOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R40qPFf1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R40qPFf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788232369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wMMJ0OAiNfaxCsWmuBf2UXvDAznEbFoi73wXunP44fA=;
	b=R40qPFf1pNkX1S2HZEV/t3M1WZSonLqZFsebpLioJEBFNpsdHpT0kumrYFdT6dnHk5mdIG
	rCJYEjWJ8Nkc8Se8DV0YghjXrkvdqWnTil0zdqGWKiKEUO68iXQgjQ05LjSblRmT67aXq8
	fURyjcK03575tq2MNM2YdxhFsCEbNTE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-284-ODNX134gOfWMy_anQ_BWKA-1; Mon,
 31 Aug 2026 23:12:43 -0400
X-MC-Unique: ODNX134gOfWMy_anQ_BWKA-1
X-Mimecast-MFC-AGG-ID: ODNX134gOfWMy_anQ_BWKA_1788232360
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9ACF6197703B;
	Tue,  1 Sep 2026 03:12:38 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D7F8D18005B8;
	Tue,  1 Sep 2026 03:12:32 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@kernel.org,
	baolin.wang@linux.alibaba.com,
	ziy@nvidia.com,
	lance.yang@linux.dev
Cc: corbet@lwn.net,
	tsbogend@alpha.franken.de,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hughd@google.com,
	dave.hansen@linux.intel.com,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	akpm@linux-foundation.org,
	yintirui@huawei.com,
	dev.jain@arm.com,
	usama.arif@linux.dev
Subject: [PATCH v7 00/14] mm: thp: always enable mTHP support
Date: Mon, 31 Aug 2026 23:12:04 -0400
Message-ID: <cover.1788232334.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

[ NOTE: Updated cover letter ]

Introduction
============

Today, if an architecture implements has_transparent_hugepage() and the CPU
lacks support for PMD-sized pages, the THP code disables all THP, including
mTHP.

This happens because the has_transparent_hugepage() helper is overloaded:
its name implies it checks whether THP is enabled, but on some architectures
it actually checks whether the CPU supports PMD-sized pages. In addition,
the THP and shmem code have a big switch on has_transparent_hugepage().

This series solves this by decoupling THP availability checking from
querying CPU support for PMD-sized pages. THP availability can be checked
with IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE). For querying PMD-sized page
support, this series introduces a new helper called pgtable_has_pmd_leaves(),
which is independent of THP, has well defined semantics and can be used
in fast paths.

Core THP code and shmem can use pgtable_has_pmd_leaves() to determine
PMD-sized THP support at page fault time (or folio allocation time for
shmem), leaving THP and shmem always enabled for other THP sizes. For
architectures and CPUs that do support PMD-sized pages there's no
intended change in behavior.

We also convert each user of has_transparent_hugepage(), and the related
helper thp_disabled_by_hw(), to IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)
and/or pgtable_has_pmd_leaves() according to the call site's check semantics.
On s390, powerpc, mips and x86 the arch has_transparent_hugepage()
implementation is moved out of the CONFIG_TRANSPARENT_HUGEPAGE guard and
renamed to arch_has_pmd_leaves().

Thanks to David Hildenbrand for suggesting this improvement and for
providing initial guidance (all bugs and misconceptions are mine).

This applies to mm-new da6c37ed8beb ("mm/swap, PM: hibernate: atomically
replace hibernation pin").

Reporting availability of PMD-sized pages to user-space
=======================================================

Before this series, not having PMD pages available would shutdown THP support
meaning that /sys/kernel/mm/transparent_hugepage would not be available.
After this series, /sys/kernel/mm/transparent_hugepage and hpage_pmd_size are
always available but hugepages-<PMD-size>kB is only available if PMD-sized
pages are supported.

To me this seems logical, as hugepages-<size>kB is only available if <size>
is supported. If this is correct, then MM kselftests that depend on PMD-sized
pages will need to be updated to check for it as they fail with this series
applied when PMD-sized pages are not available.

The alternative is changing hpage_pmd_size: either don't create the file
when PMD-sized pages are not available or set hpage_pmd_size=0. My concern
is that this could be considered an ABI breakage as this file was never
reported to be optional or report a zero value.

Testing
=======

- Ran MM kselftests on x86_64 with and without PMD-sized pages available
- Tested all mTHP sizes allocation on x86_64 when PMD-sized pages are
  not available
- Tested shmem with within_size w/ mTHP on x86_64 when PMD-sized pages
  are not available
- Performed defconfig build on x86_64, s390, arm64, powerpc, and mips

NOTES:
  1. I'm forcing arch_has_pmd_leaves() off on x86 to simulate not having
     PMD-sized pages available

  2. Running the MM kselftests when PMD pages are not available causes some
     tests that depend on PMD-sized THP pages to fail as noted earlier

Changelog
=========

v7
--
- Applied on top of latest mm-new
- Improved various changelogs including cover-letter
- Changed arch_has_pmd_leaves() default implementation to use IS_ENABLED()
  intead of IS_BUILTIN()

v6
--
- Rebased on top of mm-unstable (required a minor conflict resolution)
- Added more Reviewed-by and Acked-by tags

v5
--
- Moved init_arch_has_pmd_leaves() to mm_core_init() (David)
- Renamed init_arch_has_pmd_leaves() to pgtable_leaf_support_init() (Lance)
- Added new patch changing shmem_getattr() to set blksize according to
  highest supported THP order (Baolin)
- Added new patches to move has_transparent_hugepage() out of
  CONFIG_TRANSPARENT_HUGEPAGE guards (Sashiko)
- shmem_allowable_huge_orders(): rename variable and only disable
  PMD_ORDER (David)
- Added <linux/jmp_label.h> to include/linux/pgtable.h (Sashiko)
- Added new tags and removed Reviewed-by from changed patches

v4
--
- Used static key for pgtable_has_pmd_leaves() API (Lance)
- Moved shmem pgtable_has_pmd_leaves() check to
  shmem_allowable_huge_orders() (Baolin)
- Default pgtable_has_pmd_leaves() implementation to
  IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE) (Zi)
- Dropped patch “mm: thp: x86: cleanup PSE feature bit usage” (Dave)

v3
--
- Rebased on top of latest Linus tree
- Removed i915 patch as driver dropped has_transparent_hugepage() usage
- Moved init_arch_has_pmd_leaves() call in start_kernel() to avoid conflict
  with early_param handlers clearing CPU feature flags
- Fixed build error with CONFIG_MMU=n (kernel test robot)
- Fixed huge_anon_orders_inherit default setting when !pgtable_pmd_leaves() (Baolin)
- Small commit changelog improvements

v2
--
- Added support for always enabling mTHPs for shmem (Baolin)
- Improved commits changelog & added reviewed-by

v1
--
- Call init_arch_has_pmd_leaves() from start_kernel()
- Keep pgtable_has_pmd_leaves() calls tied to CONFIG_TRANSPARENT_HUGEPAGE (David)
- Clear PUD_ORDER when clearing PMD_ORDER (David)
- Small changelog improvements (David)
- Rebased on top of latest mm-new

Luiz Capitulino (14):
  docs: tmpfs: remove implementation detail reference
  mm: shmem: shmem_getattr(): set blksize to highest supported THP order
  mm: introduce pgtable_has_pmd_leaves()
  drivers: dax: use pgtable_has_pmd_leaves()
  drivers: nvdimm: use pgtable_has_pmd_leaves()
  mm: debug_vm_pgtable: use pgtable_has_pmd_leaves()
  mm: shmem: allow THP support determination at folio allocation time
  s390: move has_transparent_hugepage() out of THP guard
  powerpc: move has_transparent_hugepage() out of THP guard
  mips: move has_transparent_hugepage() out of THP guard
  x86: move has_transparent_hugepage() out of THP guard
  treewide: introduce arch_has_pmd_leaves()
  mm: replace thp_disabled_by_hw() with pgtable_has_pmd_leaves()
  mm: thp: always enable mTHP support

 Documentation/filesystems/tmpfs.rst           |  5 ++--
 arch/mips/include/asm/pgtable.h               |  6 ++--
 arch/mips/mm/tlb-r4k.c                        |  8 ++---
 arch/powerpc/include/asm/book3s/64/hash-4k.h  |  2 +-
 arch/powerpc/include/asm/book3s/64/hash-64k.h |  2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 18 ++++++------
 arch/powerpc/include/asm/book3s/64/radix.h    | 14 ++++-----
 arch/powerpc/mm/book3s64/hash_pgtable.c       |  8 ++---
 arch/s390/include/asm/pgtable.h               |  6 ++--
 arch/x86/include/asm/pgtable.h                | 12 ++++----
 drivers/dax/dax-private.h                     |  2 +-
 drivers/nvdimm/pfn_devs.c                     |  6 ++--
 include/linux/huge_mm.h                       |  7 -----
 include/linux/pgtable.h                       | 20 +++++++++++--
 mm/debug_vm_pgtable.c                         | 20 ++++++-------
 mm/huge_memory.c                              | 27 ++++++++++++-----
 mm/memory.c                                   | 11 ++++++-
 mm/mm_init.c                                  |  1 +
 mm/shmem.c                                    | 29 ++++++++++++-------
 19 files changed, 120 insertions(+), 84 deletions(-)

-- 
2.55.0

