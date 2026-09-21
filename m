Received: from mta0.migadu.com (out-93.mta0.migadu.com [91.218.175.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A433EE1E4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986989; cv=none; b=FNqxA/FjrduDWOUl9UEd2k4vpdF08titZaDSdYnZ/0XoMTd12lSo5DtxNQCTKhVIOmtqPtv655LLgrrp1rZP6mKqdrCGFAqB+ys+uHqXGFYHSzEgrSs3zYpggSbVlmBX4sYTC85wdgtPf/EcS1STnRXdgUlt+PERzXHwyrwtX6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986989; c=relaxed/simple;
	bh=+tmcq41FscUEr4r2n07BCtdn1qbwdVSJKS+ZPfTMX8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DghObdWgbtTV+z40f9IQ7go2dgyAr0QVbznxOtOg4ceV5AaY0DfFagw4w+478+jXuGHg0KXz+7zzSO6cgIivL9PABvqYK8S2+gmMrI3IDo3fLDPCwgO0mWQiizq7eJVzNSejlZ6Hgdl9CrHYs2owR6eYAjgqEXKtK19w6e5n9go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SnFIJP5M; arc=none smtp.client-ip=91.218.175.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SnFIJP5M"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+tmcq41FscUEr4r2n07BCtdn1qbwdVSJKS+ZPfTMX8U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789986985; v=1; x=1790591785;
 b=SnFIJP5M5XU2N3+JURQRMWxbDOwGpyD++IS6l974XOzBNZERVX6dd1zuqsA2ZdaFNTrKALQM
 mHWjAynAMzJKDDC3gw1KkZRb3XlQLKomiuYzdTqHUANCo8XZGxR6g0YqgnpUCP8gTzDwJ4ktxBw
 XDznnOqDTKN93cvicaMyURN4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id ea87f986f0d8cc08;
	Mon, 21 Sep 2026 10:36:25 +0000
X-Mizu-Trace-ID: ea87f986f0d8cc08
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@kernel.org,
	baolin.wang@linux.alibaba.com,
	ziy@nvidia.com,
	lance.yang@linux.dev,
	corbet@lwn.net,
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
	dev.jain@arm.com
Subject: Re: [PATCH v8 00/14] mm: thp: always enable mTHP support
Date: Mon, 21 Sep 2026 03:36:18 -0700
Message-ID: <20260921103620.3431087-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <970c8f34-3cf4-4c6c-931c-b132e3bc6838@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 10:01:35 -0400 Luiz Capitulino <luizcap@redhat.com> wrote:

> 
> 
> On 9/18/26 6:37 AM, Usama Arif wrote:
> > 
> > 
> > On 18/09/2026 02:45, Luiz Capitulino wrote:
> >> Introduction
> >> ============
> >>
> >> Today, if an architecture implements has_transparent_hugepage() and the CPU
> >> lacks support for PMD-sized pages, the THP code disables all THP, including
> >> mTHP.
> > 
> > 
> > Hi Luiz,
> > 
> > Sorry for asking this so late in the series, but which CPUs lack support for
> > PMD sized pages?
> > 
> > Is this series mainly for PowerPC?
> 
> No :)
> 
> The architectures that have conditional PMD page support (ie. discovered
> at run-time via has_transparent_hugepage()) are x86, s390, powerpc and
> mips.
> 
> For x86 for example, even on 64-bit there are cases where the PSE bit
> may not be present (eg. some errata and by hypervisor CPUID masking).
> 
> That being said, the main goal of the series is that
> has_transparent_hugepage() is overloaded: it has different semantics on
> those architectures and is used to gate all THP support (which is not
> the right thing to do for mTHP).

Thanks for clearing that and the patches.

They all look good to me, apart from the the comment in the last patch.

Feel free to add

Acked-by: Usama Arif <usama.arif@linux.dev>

to all of them apart from last.

One nit: I would put the above goal of clean up at the start of the
coverletter, instead of starting with adding mTHP support for CPUs
that lack PMD.

Thanks,
Usama

> 
> > 
> > Thanks,
> > Usama
> > 
> >>
> >> This happens because the has_transparent_hugepage() helper is overloaded:
> >> its name implies it checks whether THP is enabled, but on some architectures
> >> it actually checks whether the CPU supports PMD-sized pages. In addition,
> >> the THP and shmem code have a big switch on has_transparent_hugepage().
> >>
> >> This series solves this by decoupling THP availability checking from
> >> querying CPU support for PMD-sized pages. THP availability can be checked
> >> with IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE). For querying PMD-sized page
> >> support, this series introduces a new helper called pgtable_has_pmd_leaves(),
> >> which is independent of THP, has well defined semantics and can be used
> >> in fast paths.
> >>
> >> Core THP code and shmem can use pgtable_has_pmd_leaves() to determine
> >> PMD-sized THP support at page fault time (or folio allocation time for
> >> shmem), leaving THP and shmem always enabled for other THP sizes. For
> >> architectures and CPUs that do support PMD-sized pages there's no
> >> intended change in behavior.
> >>
> >> We also convert each user of has_transparent_hugepage(), and the related
> >> helper thp_disabled_by_hw(), to IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)
> >> and/or pgtable_has_pmd_leaves() according to the call site's check semantics.
> >> On s390, powerpc, mips and x86 the arch has_transparent_hugepage()
> >> implementation is moved out of the CONFIG_TRANSPARENT_HUGEPAGE guard and
> >> renamed to arch_has_pmd_leaves().
> >>
> >> Thanks to David Hildenbrand for suggesting this improvement and for
> >> providing initial guidance (all bugs and misconceptions are mine).
> >>
> >> This applies to mm-new 93f615a22169 ("mm/swap, PM: hibernate: atomically
> >> replace hibernation pin").
> >>
> >> Reporting availability of PMD-sized pages to user-space
> >> =======================================================
> >>
> >> Before this series, not having PMD pages available would shut down THP support
> >> meaning that /sys/kernel/mm/transparent_hugepage would not be available.
> >> After this series, /sys/kernel/mm/transparent_hugepage and hpage_pmd_size are
> >> always available but hugepages-<PMD-size>kB is only available if PMD-sized
> >> pages are supported.
> >>
> >> To me this seems logical, as hugepages-<size>kB is only available if <size>
> >> is supported. If this is correct, then MM kselftests that depend on PMD-sized
> >> pages will need to be updated to check for it as they fail with this series
> >> applied when PMD-sized pages are not available.
> >>
> >> The alternative is changing hpage_pmd_size: either don't create the file
> >> when PMD-sized pages are not available or set hpage_pmd_size=0. My concern
> >> is that this could be considered an ABI breakage as this file was never
> >> reported to be optional or report a zero value.
> >>
> >> Testing
> >> =======
> >>
> >> - Ran MM kselftests on x86_64 and s390
> >> - Tested all mTHP sizes allocation on x86_64 (with and without PMD-sized
> >>    pages available)
> >> - Tested shmem with within_size w/ mTHP on x86_64 (with and without
> >>    PMD-sized pages available)
> >> - Performed defconfig build on x86_64, s390, arm64, powerpc, and mips
> >>
> >> NOTES:
> >>    * I'm forcing arch_has_pmd_leaves() off on x86 to simulate not having
> >>      PMD-sized pages available
> >>
> >>    * Running the MM kselftests when PMD pages are not available causes some
> >>      tests that depend on PMD-sized THP pages to fail as noted earlier
> >>
> >> Changelog
> >> =========
> >>
> >> v8
> >> --
> >> - Fixed build breakage on MIPS (Lance)
> >> - Rebased on top of mm-new (fixed conflicts in include/linux/pgtable.h and
> >>    mm/shmem.c - dropped a Reviewed-by as a result)
> >>
> >> v7
> >> --
> >> - Applied on top of latest mm-new
> >> - Improved various changelogs including cover-letter
> >> - Changed arch_has_pmd_leaves() default implementation to use IS_ENABLED()
> >>    instead of IS_BUILTIN()
> >>
> >> v6
> >> --
> >> - Rebased on top of mm-unstable (required a minor conflict resolution)
> >> - Added more Reviewed-by and Acked-by tags
> >>
> >> v5
> >> --
> >> - Moved init_arch_has_pmd_leaves() to mm_core_init() (David)
> >> - Renamed init_arch_has_pmd_leaves() to pgtable_leaf_support_init() (Lance)
> >> - Added new patch changing shmem_getattr() to set blksize according to
> >>    highest supported THP order (Baolin)
> >> - Added new patches to move has_transparent_hugepage() out of
> >>    CONFIG_TRANSPARENT_HUGEPAGE guards
> >> - shmem_allowable_huge_orders(): rename variable and only disable
> >>    PMD_ORDER (David)
> >> - Added <linux/jmp_label.h> to include/linux/pgtable.h
> >> - Added new tags and removed Reviewed-by from changed patches
> >>
> >> v4
> >> --
> >> - Used static key for pgtable_has_pmd_leaves() API (Lance)
> >> - Moved shmem pgtable_has_pmd_leaves() check to
> >>    shmem_allowable_huge_orders() (Baolin)
> >> - Default pgtable_has_pmd_leaves() implementation to
> >>    IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE) (Zi)
> >> - Dropped patch “mm: thp: x86: cleanup PSE feature bit usage” (Dave)
> >>
> >> v3
> >> --
> >> - Rebased on top of latest Linus tree
> >> - Removed i915 patch as driver dropped has_transparent_hugepage() usage
> >> - Moved init_arch_has_pmd_leaves() call in start_kernel() to avoid conflict
> >>    with early_param handlers clearing CPU feature flags
> >> - Fixed build error with CONFIG_MMU=n (kernel test robot)
> >> - Fixed huge_anon_orders_inherit default setting when !pgtable_has_pmd_leaves() (Baolin)
> >> - Small commit changelog improvements
> >>
> >> v2
> >> --
> >> - Added support for always enabling mTHPs for shmem (Baolin)
> >> - Improved commits changelog & added reviewed-by
> >>
> >> v1
> >> --
> >> - Call init_arch_has_pmd_leaves() from start_kernel()
> >> - Keep pgtable_has_pmd_leaves() calls tied to CONFIG_TRANSPARENT_HUGEPAGE (David)
> >> - Clear PUD_ORDER when clearing PMD_ORDER (David)
> >> - Small changelog improvements (David)
> >> - Rebased on top of latest mm-new
> >>
> >> Luiz Capitulino (14):
> >>    docs: tmpfs: remove implementation detail reference
> >>    mm: shmem: shmem_getattr(): set blksize to highest supported THP order
> >>    mm: introduce pgtable_has_pmd_leaves()
> >>    drivers: dax: use pgtable_has_pmd_leaves()
> >>    drivers: nvdimm: use pgtable_has_pmd_leaves()
> >>    mm: debug_vm_pgtable: use pgtable_has_pmd_leaves()
> >>    mm: shmem: allow THP support determination at folio allocation time
> >>    s390: move has_transparent_hugepage() out of THP guard
> >>    powerpc: move has_transparent_hugepage() out of THP guard
> >>    mips: move has_transparent_hugepage() out of THP guard
> >>    x86: move has_transparent_hugepage() out of THP guard
> >>    treewide: introduce arch_has_pmd_leaves()
> >>    mm: replace thp_disabled_by_hw() with pgtable_has_pmd_leaves()
> >>    mm: thp: always enable mTHP support
> >>
> >>   Documentation/filesystems/tmpfs.rst           |  5 ++--
> >>   arch/mips/include/asm/pgtable.h               |  6 ++--
> >>   arch/mips/mm/pgtable.c                        | 25 ++++++++++++++++
> >>   arch/mips/mm/tlb-r4k.c                        | 22 --------------
> >>   arch/powerpc/include/asm/book3s/64/hash-4k.h  |  2 +-
> >>   arch/powerpc/include/asm/book3s/64/hash-64k.h |  2 +-
> >>   arch/powerpc/include/asm/book3s/64/pgtable.h  | 18 ++++++------
> >>   arch/powerpc/include/asm/book3s/64/radix.h    | 14 ++++-----
> >>   arch/powerpc/mm/book3s64/hash_pgtable.c       |  8 ++---
> >>   arch/s390/include/asm/pgtable.h               |  6 ++--
> >>   arch/x86/include/asm/pgtable.h                | 12 ++++----
> >>   drivers/dax/dax-private.h                     |  2 +-
> >>   drivers/nvdimm/pfn_devs.c                     |  6 ++--
> >>   include/linux/huge_mm.h                       |  7 -----
> >>   include/linux/pgtable.h                       | 21 ++++++++++++--
> >>   mm/debug_vm_pgtable.c                         | 20 ++++++-------
> >>   mm/huge_memory.c                              | 27 ++++++++++++-----
> >>   mm/memory.c                                   | 11 ++++++-
> >>   mm/mm_init.c                                  |  1 +
> >>   mm/shmem.c                                    | 29 ++++++++++++-------
> >>   20 files changed, 144 insertions(+), 100 deletions(-)
> >>
> > 
> 
> 
