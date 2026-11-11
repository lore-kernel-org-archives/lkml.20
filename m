Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.13.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396656;
	b=4H05WBatQqoi6U1Um8J3LohrcJFzjjgDPpEDQMHXLBfLghS0vfGZpCnBA78bhMqGTx3P
	 1yZxbnT88HyjMhbe4pBiJQu/TRI0AXJWfXtAPDlJ7H6t5dmar/O43lb5B5uPSpuK9Wi5L
	 37wKKp5ccmwfJNEhkS10pqd4j1aYfOMIUs+OBQKRxL8HictY7LY/7L+n7fpq0c8yD5a7B
	 85rW6G3nNiaylfVf4JG919KCxYbGrJgQG8CQT7UVNV/IhMPxT63BonfYvrfQtLjxKRwgD
	 LfWdCIaLtP10pRGg7WmNJoXaTxYXTwNli35wbPO0MwVggQig58J3RLahbgLIARf4NzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396656;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Ji3jLiDdzuyM9cCPX1vdBLGPhGAltfdidVumS7/FERc=;
	b=EdSvNkopjcflWvM1V9djTgR3+dsXvux559z8h+SfEhrBUNyXLVPfjdvf3piQIYBTkr7x
	 ZqXh583OE78zM8GbAVmfzDt7AuXPHOyAVlDRt2IWfPSsTsviHIJAKARsVdX7Lq+FoNkiH
	 3IG5/9yWKjsOUV64XAWoxYgHmTOjUpdAzd/mEgJaDGU67uk/s2EO4aH2ZL5NEweL29+GP
	 FGUPnm9GHQ1FVosh0OP4XiSYppPzQ8o8/237WWy5Z+3jEQl52nJrMNxhu7MtV+27+07Zk
	 +NljQHvCjY7RP3a4T8BxFxUseKdI9FDALp6hdmPG5BDhE3G+4kL0FWKdCceNFBOHLaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Z1iDUL2k;
	arc=none smtp.remote-ip=52.13.214.179
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20E9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D20E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Z1iDUL2k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794396655; x=1825932655;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ji3jLiDdzuyM9cCPX1vdBLGPhGAltfdidVumS7/FERc=;
  b=Z1iDUL2ktq0Ye0VPnAm5nY5KCJdM6/jeCz5D7ZuS6ZCd/oNk1uP97mUf
   T1DhVULHERsyupXhdFMI4GVpIeVMo+Lo8VeOQ1z5LfYbdFIVAZv3sG9TT
   d2tVcpOCX9XI4jrpCPy71GRKGUBL5N6ozXP86GUCB99YT2jBqmtOj96F6
   wKudz4ACbmUrN6GaZzcK5XQeCOss0m43QZ2xn+ZZupZ3SptahuKKcSul4
   Wbch6JOR/lFg4/RS6uFvl1/umhuNnjMi5r5An7D+cd7nL57S7RqvtkNYE
   MP1xC5WvX9WlM1koseZYZZCGho6EVcp5J0cWNPtczMnYwFvCf10bZCNQi
   Q==;
X-CSE-ConnectionGUID: 3LoDkxEJQ6exd/6yaixCOQ==
X-CSE-MsgGUID: 8bP7UMmdQySmcmYyfGCm1Q==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33684258"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 11:30:52 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:8220]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.142:2525] with esmtp (Farcaster)
 id 075fdd73-6fe3-4028-bf84-b350b66b4ee3; Wed, 11 Nov 2026 11:30:52 +0000 (UTC)
X-Farcaster-Flow-ID: 075fdd73-6fe3-4028-bf84-b350b66b4ee3
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 11:30:52 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Wed, 11 Nov 2026
 11:30:49 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, Pedro Falcato
	<pfalcato@suse.de>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	Eliav Farber <farbere@amazon.com>
Subject: [PATCH 0/4] mm, uio: huge PFN mappings for /dev/mem and UIO
Date: Wed, 11 Nov 2026 11:30:41 +0000
Message-ID: <20261111113045.35368-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

/dev/mem and UIO both hand large, well-aligned physical regions to
userspace, and both populate them eagerly at mmap() time with
remap_pfn_range(), that is with 4K PTEs however large and well aligned
the region is. vfio-pci moved to fault-driven population in commit
f9e54c3a2f5b ("vfio/pci: implement huge_fault support") and gets PMD and
PUD mappings where alignment allows. This series does the same for
/dev/mem and UIO, and factors out the logic vfio-pci open-codes so that a
third driver does not have to repeat it.

Two things have to be solved to do this outside vfio-pci:

1. remap_pfn_range() reserves the range's memory type in the PAT memtype
   tree, via pfnmap_track() -> reserve_pfn_range(). The vmf_insert_pfn*()
   helpers only look the memory type up, they never reserve. A driver
   that populates lazily therefore loses the conflict detection that
   rejects a second mapping of the same physical range with a
   conflicting cache attribute. Patch 1 adds pfn_range_track(), which
   sets the VMA up as remap_pfn_range() would and reserves the range for
   the VMA's lifetime, but leaves population to the fault handler. For
   ->mmap_prepare drivers, where no VMA exists yet, it adds an
   MMAP_PFN_TRACK action.

2. The order dispatch itself: the window and alignment checks, and the
   pfn_modify_allowed() check that vmf_insert_pfn_pmd() and
   vmf_insert_pfn_pud() skip but the order-0 path performs. Patch 2 adds
   vmf_pfn_order_ok() and vmf_insert_pfn_order(), split in two so a
   driver can apply its own policy between the check and the insert.

Patches 3 and 4 convert /dev/mem and UIO to use them.

Patch 2 also passes the fault's write flag to vmf_insert_pfn_pmd() and
vmf_insert_pfn_pud(), as the DAX and DRM ->huge_fault handlers do, rather
than the literal false that vfio-pci passes. With write=false,
insert_pmd() leaves a present read-only entry in place and returns
VM_FAULT_NOPAGE, and wp_huge_pmd() splits the entry only on
VM_FAULT_FALLBACK, so a store to a mapping that mm write-protected for
tracking (soft-dirty, uffd-wp, fs writeback) faults forever. vfio-pci has
the same problem today and has no ->pfn_mkwrite either; that needs a
separate patch, which I have not written.

Testing
=======

Tested on x86_64 at 7.4-rc2, and on arm64 at 7.3.4, which is what the
test hardware runs. The four patches are identical in both trees.

On arm64 Cortex-A75: a local selftest over UIO map0, UIO map1 and
/dev/mem reports 64 passed, 0 failed and 3 skipped of 67, the skips
being the soft-dirty case, which needs CONFIG_MEM_SOFT_DIRTY.
tools/testing/selftests/mm/pfnmap.c passes 6/6 on /dev/mem and 6/6 on
/dev/uio0. dmesg is free of warnings and call traces. The fault counts
confirm the huge path: 4 faults for four PMD windows where a 4K mapping
needs 2048, 2 faults for a two-window PMD-offset mapping, 1024 for a
4K-offset mapping of 1024 pages, 2048 for a deliberately misaligned VA,
and 0 on a second pass.

x86_64 under QEMU, four kernel configs, with a 4G ivshmem BAR as the test
region and a small lab module exposing it through UIO:

  THP always, DEBUG_VM=y                30/30
  the same plus lockdep                 30/30
  THP=n                                 30/30
  THP always, MEM_SOFT_DIRTY=y          31/31

The checks cover the PMD and PUD paths and their fallbacks, PAT
reservation and the rejection of a conflicting cache attribute over a
tracked range, iomem revoke and re-population after release, COW
mappings, fork, remote access through /proc/pid/mem, and the UIO entry
point. The soft-dirty config adds the write-protected store case; the
others report it as a single skip.

On x86, tools/testing/selftests/mm/pfnmap.c passes 6/6 pointed at the
UIO device. Reaching the /dev/mem entry point needs STRICT_DEVMEM=n, as
the test's System RAM target is otherwise refused, so a fifth config was
built with it disabled; it passes 6/6 there too. The suite above is not
a useful instrument in that config, four of its checks being
STRICT_DEVMEM behaviour that inverts when it is off.

The write flag in patch 2 was confirmed by building the same tree twice
and changing nothing else: with the fault's write flag passed, a store to
a soft-dirty write-protected PUD and PMD mapping completes; with the
literal false restored, both stores time out in a fault loop under a 10s
alarm.

Build-only checks, all with KCFLAGS=-Werror W=1:

  m68k ColdFire, CONFIG_MMU=n           vmlinux links
  riscv64, THP and UIO enabled          mm/ and drivers/uio/ build
  tools/testing/vma                     29/29

riscv64 is the only other architecture selecting
HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD, and its defconfig leaves THP and UIO
off, so both were turned on for that build.

Two things none of this reaches: 1G PUD mappings anywhere but x86, as
the test hardware has no suitable 1G-aligned region, and the huge zero
folio fallback in patch 2, which needs STRICT_DEVMEM=n and has no check
targeting it.

Performance
===========

Measured on arm64 Cortex-A75 at 7.3.4, 64-byte stride, medians of 5
runs. Three kernels: the base commit, which populates eagerly at mmap()
as today; this series; and this series with CONFIG_TRANSPARENT_HUGEPAGE
off, which disables ARCH_SUPPORTS_HUGE_PFNMAP and so makes
vmf_insert_pfn_order() fall back to order 0.

A 256MB /dev/mem region:

                       eager 4K     series      series, 4K
  mmap()               421,536 ns   4,456 ns    3,912 ns
  first touch          2.60 ms      2.66 ms     41.42 ms
  faults               0            128         65536
  setup total          3.03 ms      2.66 ms     41.42 ms
  dTLB read misses     658,700      8,247       660,730
  sweep per access     39.01 ns     39.49 ns    39.28 ns

An 8MB UIO region:

                       eager 4K     series      series, 4K
  mmap()               16,048 ns    2,888 ns    2,536 ns
  first touch          81 us        82 us       1.34 ms
  faults               0            4           2048
  setup total          97 us        85 us       1.34 ms
  dTLB read misses     20,503       70          20,499
  sweep per access     39.12 ns     38.77 ns    39.80 ns

Against today's eager mapping, the series cuts mmap() by 95x on the
256MB region and 5.6x on the 8MB one, as populating the range no longer
happens inside the syscall. Total setup, for a consumer that goes on to
touch every page, improves by about 12% on both targets: the work moves
out of mmap() into the fault handler rather than disappearing. A
consumer that touches only part of the range pays only for that part,
which this benchmark cannot show because it touches everything.

The dTLB footprint falls about 80x on the 256MB region, and from 20,503
to 70 on the UIO one. That does not become throughput here: the
per-access sweep cost is the same in all three kernels, because at 39 ns
per 64-byte access the sweep is bound by the device memory path and
page-table walks hide underneath it.

The third column is the series with huge entries disabled. Nobody would
run it; it is there to separate what huge entries contribute from what
fault-driven population contributes, and it is the worst of the three,
paying 65536 faults at about 600 ns each.

Touching the same 256MB region in random page order leaves the dTLB
counts at 552,176 for the series against 662,577 eager. I do not have an
explanation for that: 128 PMD entries should cover the region, so random
order was expected to benefit as well.

Eliav Farber (4):
  mm: add MMAP_PFN_TRACK action and pfn_range_track() for lazy PFN maps
  mm: add vmf_insert_pfn_order() and vmf_pfn_order_ok() helpers
  mm/char-mem: implement huge_fault support for /dev/mem
  uio: implement huge_fault support for physical mappings

 drivers/uio/uio.c               | 102 +++++++++++++++++++++--
 include/linux/mm.h              |  47 +++++++++++
 include/linux/mm_types.h        |   1 +
 mm/char-mem.c                   | 103 ++++++++++++++++++++++-
 mm/internal.h                   |   3 +
 mm/memory.c                     | 142 ++++++++++++++++++++++++++++++++
 mm/util.c                       |   7 ++
 tools/testing/vma/include/dup.h |   1 +
 8 files changed, 396 insertions(+), 10 deletions(-)


base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.47.3

