Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.13.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460492;
	b=iPTC5Dwu1WRukHVSZ7JhyxhDRAXKwlsMiJHK1iBFe94ORWnR3/gF03rhzlXP3YBB6LT9
	 ZGRWiH/VLQH2KrlMj7f1rU0A56aJ3O5Q6PUh7ZJ+tbhateQOpbDSN6iStYoUyyFDoIzlc
	 I/hYnAjM2CsYvVT/PVGd7oGjgY8KhpmFXmHjEWAQxdVhnlJkhMFSgWIzi8LyDGqR73Nrj
	 epOk6+zIBMFAU3GuVVX55tGoAV/0u6X7DX+Tcuwgl3axDTZXSWc7pcNvvO0mCerpqWkWQ
	 ziFcO1eKjW/0eK0E5og3mDRxmt0bH5En5MxhP5C1VyrVymTBTQLHxGln/q6W2F4f99w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460492;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=UwNVdcg4hu49pw73uLx9po2gYXpqXbGe+f6RGcd22vk=;
	b=Xv2dwQ6S0cm58WhTPMx5iOVXaPAIHTKiD836RS17ag458/rTTqGDGASgfAE49aab1HPX
	 4tm1JBx4h/Ua8NVF/k4rELtSN7BwtP8q7rwtJVhiDsgXEhD6uc+md7JiPCIG/yGivc2RG
	 Mt+k5GiezA2Ue9zNRkvukx34itKGY6n1wWAkczk4kbGvhNkJBU2Gs5jNlATp8v125ZYlb
	 7U27wzwX5TuzPNeHvNspIx/tC2Q9EMfqy2asZgExCMZtrnGK6Ck+F0BNXxowrOYe/qm7y
	 wIu4YY3uMIMi/9Ny7zrA9JwGelttuQ74fn0AHOpibLh3GnA6+RvkA0qVui0lUm+ap+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=pbxcp0pR;
	arc=none smtp.remote-ip=52.13.214.179
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D32E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D32E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=pbxcp0pR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794460492; x=1825996492;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UwNVdcg4hu49pw73uLx9po2gYXpqXbGe+f6RGcd22vk=;
  b=pbxcp0pRdRHTMDI4iluihNW0rQWO8yCYyRbhk05m3IF/tnNSjQiBOiUe
   1Tcd4IUE2+Q+nzfsmQm6wloeo4q5xerZgZ7q5lptUmjOMmCbQvrj1sCpM
   /N1QF8POInjWwKwKxqGET3eNQM48oWX31xussAOAx73hqd59yBJqUd4I4
   kYV+ZdLC3fiBJ4vt3P4yY9rPNG8EPj3UU/f8PgoYGbSW0wjdkN018FlLR
   NGxk24b1oNYqabRpWTeh5Y6aMm6rM0StdC19EfPUWjbapK3VEhZq3M1xm
   T7pEKf2DBGW5bOU/rtGQr9V2Uv92JZWY7xMYRZrEwjm8ubYIkoI/Kpfny
   g==;
X-CSE-ConnectionGUID: RIQ8jwMwSDC7sVtqv/60sg==
X-CSE-MsgGUID: K4U543RsTumeq+5w07ubFw==
X-IronPort-AV: E=Sophos;i="6.27,209,1787011200"; 
   d="scan'208";a="33759943"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:14:49 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:4823]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.34.255:2525] with esmtp (Farcaster)
 id 49f785c0-b384-4044-b2fd-f34d41a03307; Thu, 12 Nov 2026 05:14:49 +0000 (UTC)
X-Farcaster-Flow-ID: 49f785c0-b384-4044-b2fd-f34d41a03307
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 05:14:49 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Thu, 12 Nov 2026
 05:14:44 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Zi Yan <ziy@nvidia.com>
CC: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Baolin
 Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>,
	"Ryan Roberts" <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
	<usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
	<hpa@zytor.com>, <x86@kernel.org>, William Kucharski
	<william.kucharski@linux.dev>, Vishal Moola <vishal.moola@gmail.com>, "Alex
 Williamson" <alex@shazbot.org>, Matthew Wilcox <willy@infradead.org>, Peter
 Xu <peterx@redhat.com>, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Eliav Farber
	<farbere@amazon.com>
Subject: [PATCH v2 0/4] mm: fixes for huge PFN mappings
Date: Thu, 12 Nov 2026 05:14:36 +0000
Message-ID: <20261112051440.16140-1-farbere@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Four independent fixes to the existing huge PFN mapping code. They are
not dependent on each other and can be taken separately.

Patches 1-3 are three symptoms of one race. A VM_PFNMAP mapping that
provides both ->fault and ->huge_fault can take faults of different
orders on the same entry, because the mm's THP policy is read early in
each fault and is not held across it. Flipping it while faults are in
flight, for example with prctl(PR_SET_THP_DISABLE), is enough: one
fault takes the PTE path while another installs a PMD leaf over the
same address, or the reverse.

This is reachable today. vfio-pci has exactly that shape:
vfio_pci_mmap_ops provides .fault, which reaches insert_pfn() for
order 0, and .huge_fault, which reaches insert_pmd(); mshv_vtl_main and
nvgrace-gpu are built the same way.

  1. walk_to_pmd() asserts that the PMD is not a leaf. With
     CONFIG_DEBUG_VM=y the losing fault hits that assertion instead of
     recovering.
  2. insert_pfn() reaches the PTE through get_locked_pte(), which folds
     the table allocation and the mapping into one call and turns a NULL
     from either into VM_FAULT_OOM. The losing fault therefore reports
     OOM for a mapping that is healthy.
  3. insert_pmd() and insert_pud() compare the PFN of a non-empty entry
     without checking that it is a leaf. A page table installed by a
     concurrent order-0 fault makes pmd_pfn()/pud_pfn() report the
     table's own PFN, which never matches, and the mismatch is warned
     about. Under panic_on_warn that is fatal.

Patch 4 is unrelated to the race. insert_pmd() and insert_pud() build a
huge entry from a pgprot laid out for a PTE. On x86 the PAT bit sits at
bit 7 in a PTE and at bit 12 in a large entry, and bit 7 in a large
entry is _PAGE_PSE, so the attribute is silently dropped: write-through
degrades to UC and write-protect degrades to write-combining, which
loses the write protection. Run the pgprot through pgprot_4k_2_large(),
with a generic identity fallback for architectures that encode the
levels alike.

How these were observed, since it differs between them:

Patches 1-3 were reproduced on x86_64 under QEMU with four threads
colliding on one address of each PMD window of a VM_PFNMAP mapping
while another thread flipped PR_SET_THP_DISABLE. With patches 1 and 2
reverted and CONFIG_DEBUG_VM=y, that lands within three seconds:

  kernel BUG at mm/memory.c:2392!
  RIP: 0010:walk_to_pmd+0x188/0x190
  Call Trace:
   get_locked_pte+0x1b/0x70
   insert_pfn+0x40/0x230
   vmf_insert_pfn_prot+0x94/0x100
   __do_fault+0x30/0xb0
   __handle_mm_fault+0xbb2/0x1a90
   handle_mm_fault+0x9b/0x270
   do_user_addr_fault+0x15d/0x630

and BUG() leaves mmap_lock held, so the system then wedges. With those
two applied the race is survived, and patch 3's warning appears
instead:

  WARNING: mm/huge_memory.c:1649 at insert_pmd.isra.0+0x1d3/0x430
  Call Trace:
   vmf_insert_pfn_pmd+0xa6/0xf0
   __handle_mm_fault+0x45b/0x1a90

With all four applied, four runs of the same test made 102656 colliding
touches with no BUG, no warning, no OOM and no incorrect data. Debug
counters placed at each site in a throwaway tree confirm the recovery
path in patch 2 is taken rather than merely not crashing: in three of
the four runs a fault reached the VM_FAULT_NOPAGE return after the page
table had been allocated successfully, which is the path this version
splits out, while the counter for a genuine allocation failure stayed at
zero.

Patch 4 was found by inspection rather than from a failure report. The
in-tree ->huge_fault providers map write-back or uncached memory, and
only write-through and write-protect set _PAGE_PAT, so I have not seen
the dropped attribute in practice. The entry is still built from the
wrong encoding, and a caller asking for write-protect would lose it
silently.

Found while adding huge_fault support for /dev/mem and UIO:
https://lore.kernel.org/all/20261111113045.35368-1-farbere@amazon.com/
That series is not a prerequisite for any of these.

Tested on x86_64 under QEMU with CONFIG_DEBUG_VM=y. The race above needs
a VM_PFNMAP mapping providing both ->fault and ->huge_fault, so the
reproducer ran on these four patches applied on top of the /dev/mem and
UIO series linked above, which gave it one to use; vfio-pci would serve
the same purpose. A 30-check functional suite over /dev/mem and UIO
mappings passes on that kernel, with the same counter totals as v1. This
series on its own boots clean, and mm/ and drivers/uio/ were cross-built
for riscv64 with -Werror W=1, the other architecture selecting
ARCH_SUPPORTS_PUD_PFNMAP, so insert_pud() and pud_leaf() are compiled.
checkpatch --strict is clean on all four.

Changes since v1:

- Patch 2: split pte_alloc_map_lock() into pte_alloc() followed by
  pte_offset_map_lock(), rather than calling it and then re-reading the
  PMD to work out which of the two failures had happened. Only a failed
  allocation now returns VM_FAULT_OOM, and a NULL from the map returns
  VM_FAULT_NOPAGE. That also covers the non-present and bad-PMD cases,
  which v1 still reported as OOM, and it drops the pmd_trans_huge()
  re-read. insert_pages() already builds the PTE the same way.
  Suggested by Jose A. Perez de Azpillaga.
- Patch 4: corrected the commit message. It said a write-through range
  ends up write-back; with the PAT slots Linux programs, write-through
  ends up UC and write-protect ends up write-combining, as the cover
  letter said.
- Patch 4: Fixes: is now 5cad465d7fa6 ("mm: add vmf_insert_pfn_pmd()"),
  the commit that introduced the unconverted pgprot, instead of
  6857be5fecae. Pointed out by Jose A. Perez de Azpillaga.
- Patches 1 and 3: picked up Reviewed-by tags, otherwise unchanged.

v1: https://lore.kernel.org/all/20261111140655.34281-1-farbere@amazon.com/

Based on v7.4-rc2 (067c5c24cef2).

Eliav Farber (4):
  mm: drop the huge PMD assertion from walk_to_pmd()
  mm: don't report OOM when a huge PMD race blocks a pfn insert
  mm/huge_memory: don't warn when a page table blocks a huge pfn insert
  mm/huge_memory: use the large-page PAT encoding for huge pfn mappings

 arch/x86/include/asm/pgtable_types.h |  2 ++
 include/linux/pgtable.h              |  9 +++++++++
 mm/huge_memory.c                     | 20 ++++++++++++++++++--
 mm/memory.c                          | 19 ++++++++++++++++---
 4 files changed, 45 insertions(+), 5 deletions(-)

-- 
2.47.3

