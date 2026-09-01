Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E60349CFD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246855; cv=none; b=N675vbAYiKKobL4wlErGqs8ByMy4/HIrkD1UXqdtwx5QZsyqlXnAq0FNMAp42AHF90EI24RE/8usk7OFhvD4rIv3XqsxhtJQ9oLhKyotoYsZdqQyGultu3h44b+9/Bi+3Fq7x7PgfCeBCcqnAxm4ZDG7b/Jm0eFirflu5M8Iaes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246855; c=relaxed/simple;
	bh=8lenoH4AtdUqKZVuI5QAwaPE/ZyDUq1qfP4acf1k1cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQcM78TfWlzZ+yOfDhzxk1t1Xu96QinSb6NXqsSrJ2Jnxc8gxJJqCww/5G1zLIYJHhblOo8DPak0Ii9fywKT7ZtUMOSwSWbTTRcboKnVYMe+bDtsDlQuPJzShQHqUwMal+27d5mSIxFt2zkCeUWrO7yWhxsdaBp7oAC17Kz0vRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=h94hB45f; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="h94hB45f"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 341A31AED;
	Tue,  1 Sep 2026 00:14:09 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B0633F882;
	Tue,  1 Sep 2026 00:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788246852; bh=8lenoH4AtdUqKZVuI5QAwaPE/ZyDUq1qfP4acf1k1cE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h94hB45f2Hm/8UAfS1IpI2Kf6J6k9KhCyh9Jf5KpOpsLiNiT664pYD+aX7zL4/Oo4
	 0kl4GOPa6y5pDImrTARo4kz7ElFJDzRZhAKvKkGsg6lqPTT6QGPNEC3aYv/XO7VKRd
	 +SZ8LKoM/m3+014nfGAElUWKgHR69yo2c7KH93m8=
Date: Tue, 1 Sep 2026 12:44:09 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/17] arm64/mm: Enable 128 bit page table entries
Message-ID: <tkok4a65bilixfk2wswck4zkt6ndngjartnwyfx6ssqr5hypmf@4njnzfxamdjr>
References: <20260729122452.3797443-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729122452.3797443-1-anshuman.khandual@arm.com>

On Wed, Jul 29, 2026 at 05:54:35PM +0530, Anshuman Khandual wrote:
> FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
> translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
> arm64 platforms with FEAT_D128 enabled will now have two different memory
> translation systems i.e VMSAv8-64 and VMSAv9-128.
> 
> FEAT_D128 adds 128 bit page table entries, thus supporting larger physical
> and virtual address range while also expanding available room for more MMU
> feature bits for both HW and SW usage.
> 
> A new config option ARM64_D128 is being added thus enabling users to chose
> between aforementioned memory translations regimes VMSAv8-64 (aka D64) and
> VMSAv9-128 (aka D128) during the build time. If the ARM64_D128 built kernel
> does not detect FEAT_D128 feature on the hardware, then it gets stuck with
> with a new reason code CPU_STUCK_REASON_NO_D128. So ARM64_D128 built kernel
> cannot fallback to D64 translation regime on unsupported HW.
> 
> READ_ONCE() on page table entries get routed via level specific pxdp_get()
> helpers which platforms could then override when required. These accessors
> on arm64 platform help in ensuring page table accesses are performed in an
> atomic manner while reading 128 bit page table entries.
> 
> ARM64_[VA|PA]_BITS combinations for respective CONFIG_ARM64_XXK_PAGES are
> now supported both on VMSAv8-64 and VMSAv9-128 memory translation regimes.
> Although FEAT_D128 provided 52 bit VA and PA space along with skip levels
> features are not supported currently.
> 
> Basic page table geometry has also been changed with VMSAv9-128, as there
> are fewer entries per level as compared to VMSAv8-64. Please refer to the
> following table for various leaf entry sizes including the cont entries.
> 
> ------------------------------------------------
> |           |       D64      |       D128      |
> ------------------------------------------------
> | PAGE_SIZE |   PMD  |  PUD  |   PMD  |   PUD  |
> -----------------------------|-----------------|
> |     4K    |    2M  |  1G   |    1M  |  256M  |
> |    16K    |   32M  | 64G   |   16M  |   16G  |
> |    64K    |  512M  |  4T   |  256M  |    1T  |
> ------------------------------------------------
> 
> --------------------------------------------------------------------
> |           |            D64           |             D128          |
> --------------------------------------------------------------------
> | PAGE_SIZE |   CONT_PTE  |  CONT_PMD  |   CONT_PTE  |   CONT_PMD  |
> --------------------------|------------|-------------|--------------
> |     4K    |     64K     |     32M    |     64K     |      16M    |
> |    16K    |      2M     |      1G    |      1M     |     256M    |
> |    64K    |      2M     |     16G    |      1M     |      16G    |
> --------------------------------------------------------------------
> 
> Similarly arm64 kernel features such as KVM, KASAN and UNMAP_KERNEL_AT_EL0
> are currently not supported as well.
> 
> This series applies on v7.2-rc5 but after applying the following patch that
> standardized printing pgtable entries. There are no apparent problems while
> running MM kselftests with and without CONFIG_ARM64_D128.
> 
> https://lore.kernel.org/all/20260709044334.1741263-1-anshuman.khandual@arm.com/
> 
> Changes in V1:
> 
> - Rebased on v7.2-rc5
> - Pulled in new standardized pgtable entry print patch
> - Added standardized pgtable entry print on arm64 platform
> - Added KASAN related pgdp_get() changes missing earlier
> - Renamed pxxval_get/set() as ptval_get/set()
> - Renamed ptval_cmpxchg_relaxed() and ptval_xchg_relaxed()
> - Renamed tlbi_args_t as tlbi_arg_t per Ryan
> - Split final D128 enablement patch into four separate ones
> - Updated all commit messages as required
> 
> Changes in RFC V2:
> 
> https://lore.kernel.org/all/20260513044547.4128549-1-anshuman.khandual@arm.com/
> 
> - Dropped some patches that were merged upstream and rebased on v7.1-rc3
> - Updated commit message for the 5-level fixmap change per David
> - Moved pxdval_t definition inside generic page table header
> - Dropped _once from pgprot_read/write() per Mike
> - Updated ARM64_CONT_[PTE|PMD]_SHIFT both for 16K and 64K base pages
> - Renamed __PRIpte as __PRIpxx per David
> - Added abstraction for tlbi_op
> - Adopted TLBIP implementation to recent TLB flush changes
> - Moved back all helpers back from arch/arm64/mm/mmu.c into the header
> - Moved arm64 pgtable header READ_ONCE() replacements later in the series
> - Renamed all ptdesc_ instances as pxxval_ instead
> - Updated all commit messages as required and suggested
> - Restored print format in __print_bad_page_map_pgtable() per Usama
> 
> Changes in RFC V1:
> 
> https://lore.kernel.org/linux-arm-kernel/20260224051153.3150613-2-anshuman.khandual@arm.com/
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Linu Cherian <linu.cherian@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> 
> Anshuman Khandual (15):
>   mm: Add read-write accessors for vm_page_prot
>   arm64/mm: Convert READ_ONCE() as pmdp_get() while accessing PMD
>   arm64/mm: Convert READ_ONCE() as pudp_get() while accessing PUD
>   arm64/mm: Convert READ_ONCE() as p4dp_get() while accessing P4D
>   arm64/mm: Convert READ_ONCE() as pgdp_get() while accessing PGD
>   arm64/mm: Route all pgtable reads via ptval_get()
>   arm64/mm: Route all pgtable writes via ptval_set()
>   arm64/mm: Route all pgtable atomics to central helpers
>   arm64/mm: Override read-write accessors for vm_page_prot
>   arm64/mm: Standardize printing for pgtable entries

Page table entries print standardization patch has been taken out
from this series here and posted separately which uses a recently
added generic MM helper ptval_to_str().

https://lore.kernel.org/all/20260901065454.1906343-1-anshuman.khandual@arm.com/

Similarly the following READ_ONCE() ---> pxdp_get() conversion
patches too could also be split out from this series here and
reviewed independently.

   arm64/mm: Convert READ_ONCE() as pmdp_get() while accessing PMD
   arm64/mm: Convert READ_ONCE() as pudp_get() while accessing PUD
   arm64/mm: Convert READ_ONCE() as p4dp_get() while accessing P4D
   arm64/mm: Convert READ_ONCE() as pgdp_get() while accessing PGD

Please do let me know if there are any concerns.

- Anshuman

>   arm64/mm: Enable fixmap with 5 level page table
>   arm64/mm: Enable pgtable geometry for FEAT_D128
>   arm64/mm: Enable pgtable descriptor for FEAT_D128
>   arm64/mm: Enable 128 bit translation
>   arm64/mm: Make ARM64_D128 selectable
> 
> Linu Cherian (2):
>   arm64/mm: Add an abstraction level for tlbi_op
>   arm64/mm: Enable TLBIP instruction based TLB flush
> 
>  arch/arm64/Kconfig                     |  51 ++++++-
>  arch/arm64/Makefile                    |   4 +
>  arch/arm64/include/asm/assembler.h     |   4 +-
>  arch/arm64/include/asm/el2_setup.h     |   9 ++
>  arch/arm64/include/asm/pgtable-hwdef.h | 137 ++++++++++++++++++
>  arch/arm64/include/asm/pgtable-prot.h  |  18 ++-
>  arch/arm64/include/asm/pgtable-types.h |   4 +
>  arch/arm64/include/asm/pgtable.h       | 188 +++++++++++++++++++------
>  arch/arm64/include/asm/smp.h           |   1 +
>  arch/arm64/include/asm/tlbflush.h      | 138 ++++++++++++------
>  arch/arm64/kernel/head.S               |  12 ++
>  arch/arm64/mm/fault.c                  |  31 ++--
>  arch/arm64/mm/fixmap.c                 |  24 +++-
>  arch/arm64/mm/hugetlbpage.c            |  10 +-
>  arch/arm64/mm/kasan_init.c             |  18 +--
>  arch/arm64/mm/mmu.c                    |  81 ++++++-----
>  arch/arm64/mm/pageattr.c               |   8 +-
>  arch/arm64/mm/proc.S                   |  25 +++-
>  arch/arm64/mm/trans_pgd.c              |  14 +-
>  include/linux/mm_types.h               |  40 ++++++
>  include/linux/pgtable.h                |  14 ++
>  mm/huge_memory.c                       |   4 +-
>  mm/memory.c                            |  42 +-----
>  mm/migrate.c                           |   2 +-
>  mm/mmap.c                              |   2 +-
>  25 files changed, 668 insertions(+), 213 deletions(-)
> 
> -- 
> 2.43.0
> 
