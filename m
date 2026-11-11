Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.1.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406027;
	b=Xc3EN/zrvUkLNMyJmylpCRIDJKpq7VT2TDNBfPFGPXtnM945mNtl8ZN1GVt1rtB9qY2v
	 K0a965BXdgwKNz+R61n1SXmBZu2zBQ4eJ//bY353YcD9pbeimDvPsujKcG75FZiMm1UjW
	 HI1RsjCSbVOwHZrm3Tb9AO2TWfuQ1wUdi2GUuyMJrvEcb48YwXt+uKfxMr7fNiyy7HI4/
	 gAvjM6AG/T+PGf6Al2g4vMSl+Fi6Pt8YZ8fCcUglREqfuGUm1jsWj8sNT9aq6KS1SV05R
	 JR+BBchZn2x5q+QxdLmblWkaZVCKOx4OGxv/ZrsUOU/Y/mIvtojxc/j1lH0GcpL7GWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406027;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=K2nNRLcpYTPb5gaqwgdSOeA/IdYOEH/Ikmqus0O+Qls=;
	b=CaW3ADCUyeuGtdvDSsao9qhgBUFECNnyMMAsvQf5LDborvf2ssl+UxDS56g1yYaVebJE
	 16X1JVrK2K2/a2pycj2FbR9h6LRZrvF9sSpMWWyNj3XLKTaW8UAxvQEKkKbh0Wb+hLQNg
	 5USiHMzQ6qvAAyuMaxaGwwL9DqPGwS58SxVLvoSxenm+5s5APid9sjVnpcddw2+vFIxcP
	 lXy27QqzJ44oyBNLcTppgNH6yndYQZyl0qFrCL1gzLqKWmkJ0Xht0HWBYp1RgIYAlvlre
	 H3h3EDgoSeSNi5j9GIZEXaYctdL0hZ94exEeywOoeYwkufCD7iEBUZgACnzZju4LcPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b="f7Qy9/BD";
	arc=none smtp.remote-ip=44.246.1.125
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4805B606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4805B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=f7Qy9/BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794406027; x=1825942027;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K2nNRLcpYTPb5gaqwgdSOeA/IdYOEH/Ikmqus0O+Qls=;
  b=f7Qy9/BDN8VlRu7eCmwsF/zLPlmEDm/2e5pK5/A/AQD0NfLmIcVDiVqr
   j3ai1JSKHJGYm5FDKkwgN2m30qLGSRsm96wP65OS40VZXqluTWBu2jeEs
   GW1wNyGALS797eXsf9FWaEAjJ62SVW5s6JEJyQmp5+yZC++X3r2Q+wclE
   Qd/nKFV5155ssqFvhu4wQIVokpFMYp4ABcwNbJ7n6c3kE7qZwg/amxSsH
   vIOIIbsDHojlc1s7BAQIjPcjn0S/B8fNy9+KUMH61NanvmXqsoAGA4dlX
   RjWD73RP1EsY2bJhTQYTBghkY1SJq9iq+4ZxVHxUqrNNuJAWIzKmyt+M9
   Q==;
X-CSE-ConnectionGUID: G8P4hRZMTzy/IyI356dWfg==
X-CSE-MsgGUID: c0RFt+J3Tli3GAOeA81K3A==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33724742"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 14:07:04 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:21398]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.212:2525] with esmtp (Farcaster)
 id e07d0b7b-3834-4409-be63-1f6699e7212a; Wed, 11 Nov 2026 14:07:04 +0000 (UTC)
X-Farcaster-Flow-ID: e07d0b7b-3834-4409-be63-1f6699e7212a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 14:07:04 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Wed, 11 Nov 2026
 14:07:00 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, "Ryan
 Roberts" <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
	<baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
	<usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
	<hpa@zytor.com>, <x86@kernel.org>, William Kucharski
	<william.kucharski@linux.dev>, Vishal Moola <vishal.moola@gmail.com>, "Alex
 Williamson" <alex@shazbot.org>, Peter Xu <peterx@redhat.com>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Eliav Farber
	<farbere@amazon.com>
Subject: [PATCH 0/4] mm: fixes for huge PFN mappings
Date: Wed, 11 Nov 2026 14:06:51 +0000
Message-ID: <20261111140655.34281-1-farbere@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
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
  2. insert_pfn() treats a NULL return from the PTE map as an
     allocation failure, so the losing fault reports VM_FAULT_OOM for a
     mapping that is healthy.
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
loses the write protection. Run the pgprot through
pgprot_4k_2_large(), with a generic identity fallback for
architectures that encode the levels alike.

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

With all four applied the same test runs 51200 colliding faults with no
BUG, no warning, no OOM and no incorrect data. Debug counters placed at
each site in a throwaway tree confirmed the recovery path in patch 2 is
taken rather than merely not crashing.

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
the same purpose. This series on its own boots clean and was
cross-built for riscv64, the other architecture selecting
ARCH_SUPPORTS_PUD_PFNMAP, so insert_pud() and pud_leaf() are compiled.
checkpatch --strict is clean on all four.

Based on v7.4-rc2 (067c5c24cef2).

Eliav Farber (4):
  mm: drop the huge PMD assertion from walk_to_pmd()
  mm: don't report OOM when a huge PMD race blocks a pfn insert
  mm/huge_memory: don't warn when a page table blocks a huge pfn insert
  mm/huge_memory: use the large-page PAT encoding for huge pfn mappings

 arch/x86/include/asm/pgtable_types.h |  2 ++
 include/linux/pgtable.h              |  9 +++++++++
 mm/huge_memory.c                     | 20 ++++++++++++++++++--
 mm/memory.c                          | 20 +++++++++++++++++---
 4 files changed, 46 insertions(+), 5 deletions(-)

-- 
2.47.3

