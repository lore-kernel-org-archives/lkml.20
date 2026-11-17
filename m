Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899185;
	b=3kR1q1FeSZDuxNrYdC1O8jjN1/ZXNJU6D8/RMaGgYDRnQ1ouCBfetogaCoyENdzZxePk
	 YIBBq+pPvE4RcVgpj/2VCL174Bp2ttkQEkBEg82W76xEvDSYc3qyzbW+fniUkjw2X7OrU
	 QFWAB5ld53PQBBEIXFZZDfU1SjlXUtGeDayGAti+6nmzBmW3enew2e6LBEqm9zaF/SZa5
	 jpeSpy5F1X11scrf9+nZqOFo+b0/R636/cLGoNupQ+bigSA6nkpdujBnqe/KSl/ZlF5VH
	 LbV0WMe3G4MDzgBtYtjPPdqdvzCcyP1eS5CsLtTOd4SFTVp/7mmzkG71Vxcza/+0qyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899185;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=DK2z9R2aNAMo3cpbyc0iXvLVMBFbNb2nl1yBHrZjVC8=;
	b=Ip4OlthgjRBkY247rx9H5ZcVj0QY/3Xaqbmh1oxMrNXZ3+PtaDMGGV6YQyfVksHNbBWp
	 otjze/mIrSUGzlxHe8QhbPg8ccaoxkiBN8+M2gFhc0VWsSC/qjovfXY7k1dN71YDIRNcV
	 lXMl10IkDc/Q4D2+CxbFwTGOGDYAN8BEbhmZPIx3wgKtbb0Ho5b+sXcZ/D7clbPO7KHH6
	 tlErgBJFBt7ZqJm1rw3Yk/QQ6NF1fbwUIh/Q7MY3x3m+qUpck+obkdVFGCrNyIPi96/CM
	 SrfkyIP/YTFUxoGshIhhM8OSKoFl2miDsZl56f9WkpGMVqLqnFB7oscaF2SK1ZKd/Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=e+jFczCL;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7915B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7915B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=e+jFczCL
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00F531476;
	Mon, 16 Nov 2026 23:06:20 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 387743F763;
	Mon, 16 Nov 2026 23:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899182; bh=D5+Eq+T7MAw8bpJAmSIS1rTAXl9Z1ZNiIKrmuflYZwI=;
	h=From:To:Cc:Subject:Date:From;
	b=e+jFczCLGQAOioqneFFj22S+yLP1wxiFrMoYIvhEJdmXZKlBAYZLCM4Ua+5oPS+jn
	 FmVGsdDV86NuZT4zJlqcEPMq5dfQTd12+pizhKnHpSoUC6+1QTp9SZ4QjV6wediHgz
	 ywunezzOP0QFUytM3sHdnwQiHZ01kLuVYXx/No3Q=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V3 00/14] arm64/mm: Enable 128 bit page table entries
Date: Tue, 17 Nov 2026 12:35:59 +0530
Message-ID: <20261117070613.1183243-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
arm64 platforms with FEAT_D128 enabled will now have two different memory
translation systems i.e VMSAv8-64 and VMSAv9-128.

FEAT_D128 adds 128 bit page table entries, thus supporting larger physical
and virtual address range while also expanding available room for more MMU
feature bits for both HW and SW usage.

A new config option ARM64_D128 is being added thus enabling users to chose
between aforementioned memory translations regimes VMSAv8-64 (aka D64) and
VMSAv9-128 (aka D128) during the build time. If the ARM64_D128 built kernel
does not detect FEAT_D128 feature on the hardware, then it gets stuck with
with a new reason code CPU_STUCK_REASON_NO_D128. So ARM64_D128 built kernel
cannot fallback to D64 translation regime on unsupported HW. Besides config
ARM64_D128 is only available with CONFIG_EXPERT.

ARM64_[VA|PA]_BITS combinations for respective CONFIG_ARM64_XXK_PAGES are
now supported both on VMSAv8-64 and VMSAv9-128 memory translation regimes.
Although FEAT_D128 provided 52 bit VA and PA space along with skip levels
are not supported currently.

Basic page table geometry has also been changed with VMSAv9-128, as there
are fewer entries per level as compared to VMSAv8-64. Please refer to the
following table for various leaf entry sizes including the cont entries.

------------------------------------------------
|           |       D64      |       D128      |
------------------------------------------------
| PAGE_SIZE |   PMD  |  PUD  |   PMD  |   PUD  |
-----------------------------|-----------------|
|     4K    |    2M  |  1G   |    1M  |  256M  |
|    16K    |   32M  | 64G   |   16M  |   16G  |
|    64K    |  512M  |  4T   |  256M  |    1T  |
------------------------------------------------

--------------------------------------------------------------------
|           |            D64           |             D128          |
--------------------------------------------------------------------
| PAGE_SIZE |   CONT_PTE  |  CONT_PMD  |   CONT_PTE  |   CONT_PMD  |
--------------------------|------------|-------------|--------------
|     4K    |     64K     |     32M    |     64K     |      16M    |
|    16K    |      2M     |      1G    |      1M     |     256M    |
|    64K    |      2M     |     16G    |      1M     |      16G    |
--------------------------------------------------------------------

Besides arm64 kernel features such as KVM and UNMAP_KERNEL_AT_EL0 are not
supported currently. This series applies on v7.4-rc3 after applying the
following posted earlier.

https://lore.kernel.org/all/20261117012758.3814093-1-anshuman.khandual@arm.com/

There are no apparent problems while running MM kselftests with and without
CONFIG_ARM64_D128 being enabled on various pgtable geometry configurations.

For referfence

git@git.gitlab.arm.com:linux-arm/linux-anshuman.git (arm64_d128_V3)

Changes in V3:

- Rebased on v7.4-rc3
- Add const pgprot_t * in pgprot_read() both for generic and arm64 per David
- Fixed indent problems in ___ptep_set_wrprotect() and __clear_young_dirty_pte()
- Updated commit message for the 5-level fixmap patch per David

Changes in V2:

https://lore.kernel.org/all/20260907035030.2839978-1-anshuman.khandual@arm.com/

- Rebased on v7.3-rc1
- Enabled KASAN on D128 - dropped !KASAN dependency from CONFIG_ARM64_D128
- Split out pgtable printf standardizsation into a separate series
- Split out READ_ONCE() conversion into separate series
- Added d128.config for testing ARM64_D128 enabled kernels in CI environment

Changes in V1:

https://lore.kernel.org/all/20260729122452.3797443-1-anshuman.khandual@arm.com/

- Rebased on v7.2-rc5
- Pulled in new standardized pgtable entry print patch
- Added standardized pgtable entry print on arm64 platform
- Added KASAN related pgdp_get() changes missing earlier
- Renamed pxxval_get/set() as ptval_get/set()
- Renamed ptval_cmpxchg_relaxed() and ptval_xchg_relaxed()
- Renamed tlbi_args_t as tlbi_arg_t per Ryan
- Split final D128 enablement patch into four separate ones
- Updated all commit messages as required

Changes in RFC V2:

https://lore.kernel.org/all/20260513044547.4128549-1-anshuman.khandual@arm.com/

- Dropped some patches that were merged upstream and rebased on v7.1-rc3
- Updated commit message for the 5-level fixmap change per David
- Moved pxdval_t definition inside generic page table header
- Dropped _once from pgprot_read/write() per Mike
- Updated ARM64_CONT_[PTE|PMD]_SHIFT both for 16K and 64K base pages
- Renamed __PRIpte as __PRIpxx per David
- Added abstraction for tlbi_op
- Adopted TLBIP implementation to recent TLB flush changes
- Moved back all helpers back from arch/arm64/mm/mmu.c into the header
- Moved arm64 pgtable header READ_ONCE() replacements later in the series
- Renamed all ptdesc_ instances as pxxval_ instead
- Updated all commit messages as required and suggested
- Restored print format in __print_bad_page_map_pgtable() per Usama

Changes in RFC V1:

https://lore.kernel.org/linux-arm-kernel/20260224051153.3150613-2-anshuman.khandual@arm.com/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (12):
  mm: Add read-write accessors for vm_page_prot
  arm64/mm: Route all pgtable reads via ptval_get()
  arm64/mm: Route all pgtable writes via ptval_set()
  arm64/mm: Route all pgtable atomics to central helpers
  arm64/mm: Override read-write accessors for vm_page_prot
  arm64/mm: Enable fixmap with 5 level page table
  arm64/mm: Enable pgtable geometry for FEAT_D128
  arm64/mm: Enable pgtable descriptor for FEAT_D128
  arm64/mm: Enable 128 bit translation
  arm64/mm: Relax KASAN shadow alignment for FEAT_D128
  arm64/mm: Make ARM64_D128 selectable
  arm64/configs: Add d128.config

Linu Cherian (2):
  arm64/mm: Add an abstraction level for tlbi_op
  arm64/mm: Enable TLBIP instruction based TLB flush

 arch/arm64/Kconfig                     |  50 ++++++++-
 arch/arm64/Makefile                    |   4 +
 arch/arm64/configs/d128.config         |   6 ++
 arch/arm64/include/asm/assembler.h     |   4 +-
 arch/arm64/include/asm/el2_setup.h     |   9 ++
 arch/arm64/include/asm/pgtable-hwdef.h | 137 ++++++++++++++++++++++++
 arch/arm64/include/asm/pgtable-prot.h  |  20 +++-
 arch/arm64/include/asm/pgtable-types.h |   4 +
 arch/arm64/include/asm/pgtable.h       | 120 +++++++++++++++++----
 arch/arm64/include/asm/smp.h           |   1 +
 arch/arm64/include/asm/tlbflush.h      | 138 +++++++++++++++++--------
 arch/arm64/kernel/head.S               |  12 +++
 arch/arm64/mm/fault.c                  |   2 +-
 arch/arm64/mm/fixmap.c                 |  18 +++-
 arch/arm64/mm/kasan_init.c             |   4 +-
 arch/arm64/mm/mmu.c                    |   4 +-
 arch/arm64/mm/proc.S                   |  25 ++++-
 include/linux/pgtable.h                |  14 +++
 mm/huge_memory.c                       |   4 +-
 mm/memory.c                            |   2 +-
 mm/migrate.c                           |   2 +-
 mm/mmap.c                              |   2 +-
 22 files changed, 497 insertions(+), 85 deletions(-)
 create mode 100644 arch/arm64/configs/d128.config

-- 
2.43.0

