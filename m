Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792840953;
	b=zlg9vlmWaJXQITpaTxtjL4IDXH4ZRigguePGzrZ+TYoFlHfHo6oieADcgUXZaUqBkDCC
	 DdZ9+/1NnsAmFuP4CoHCUApySFF4SwMv+nSebcLpBcs6o2+WiaWyuanNQN2SYgolorCT1
	 AnfBdZcSm9FUriSaX2zMlLdmA8SzXx9tN90KMPSL7En4RVVzPARRVngkIV5e1EXQUxKAj
	 MkU2IvWm6IY9RPgXj1qP+IXijhzpNwe4N0tr1dhwpyxInAGUVS3bZPDQPIo8/Pw2B/qzu
	 BHF6BX7OXSftkrf0fCRdYsczBq1sPDUwHvnsNVJgCiFatEMdHtSDxSARJjFIaAt6hzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792840953;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=awFUVFQFl2aokNrGILbfhfi1yrW6BY6+nDPRstEcjbo=;
	b=DgbGIdMCkRPi3aXRt+AVeW7m9xztD1S8wBHSdeEFN4+RgeOs27fjDRIjcSAjKTiEuUEA
	 FLOCKL8HjWyonq6RtVYqifuXeYk/MBrqz94m0kyUVDPmioYxV50kwRaRgAi9LSxu6ZWuf
	 XzRE4IaYxnfhCUJM5geOhLstMInXZ34xxrbESmEMpbFqDHb55jwo512aCxMgPgADHPExu
	 G2QjQ9WE+kyMjNlkaMx0s7hZeJ84TR3YuldmPWlQWiYjPsyds9Gba/LEYZ3axG9FHX9B6
	 AuCouN4XCfEq5CHNJQRnCmuT0JAL5on1lG7maUtjAV0rMPtoVeWYtvptlvQsBb/rfCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXglNm7P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80850606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXglNm7P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD601F01825;
	Sat, 24 Oct 2026 11:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792840953;
	bh=awFUVFQFl2aokNrGILbfhfi1yrW6BY6+nDPRstEcjbo=;
	h=From:To:Cc:Subject:Date;
	b=RXglNm7PSqK+gxnjmBhH6zN9XHL8sHDAwLcyOhjBO1Z/qvEs1vhKvZM6BycKejIBk
	 6fq35rTu9zHyUWxolLBrmCcwDPrgDdW1Nan1++050Mp49dE33VoPdP4WROfkMDxXFB
	 cjqAPxffvvR6+7ewkn8fuHS20Myl4JKrjG/htIfxY0iRHS5rRauVllLbS9iQm+lErm
	 cCoMeFJcHiHRxKbNgf0vH2vBEhYB2F9u2agYLOinlEUDtydeOu56mZkm+zEC9zbdqj
	 8Ri6lNcoms4TPkVJAKHhS4XtIFZKR27KpvdvXRmSfHtAv2SZ+LslzLrzz/6PO6wLMU
	 u7878apONAZvA==
From: Mike Rapoport <rppt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] liveupdate: updates for 7.4-rc1
Date: Sat, 24 Oct 2026 14:22:27 +0300
Message-ID: <20261024112228.3384682-1-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
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

Hi Linus,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git liveupdate-v7.4-rc1

for you to fetch changes up to 9a6a70aefe77f6fb9ff2b3037dcf87f6dff65c8c:

  kho: do not reserve empty per-node bootmem areas (2026-10-15 11:37:32 +0300)

There is a conflict in mm/memblock.c and mm/mm_init.c and here is how I would
resolve it:

diff --cc mm/memblock.c
index e6fdf95a0534d,f5aaa38cfa313..0000000000000
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@@ -2885,8 -2885,7 +2885,8 @@@ static const char * const flagname[] = 
  	[ilog2(MEMBLOCK_DRIVER_MANAGED)] = "DRV_MNG",
  	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
  	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
- 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
+ 	[ilog2(MEMBLOCK_KHO_NOPRSRV)] = "KHO_NOPRSRV",
 +	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
  };
  
  static int memblock_debug_show(struct seq_file *m, void *private)
diff --cc mm/mm_init.c
index 2e55be1457385,24a53d5f0893d..0000000000000
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@@ -684,10 -684,10 +684,10 @@@ static __meminit void pageblock_migrate
  	const unsigned long end = pfn + nr_pages;
  
  	for (pfn = pageblock_align(pfn); pfn < end; pfn += pageblock_nr_pages) {
- 		enum migratetype mt = kho_scratch_migratetype(pfn, migratetype);
+ 		enum migratetype mt = kho_bootmem_migratetype(pfn, migratetype);
  
 -		init_pageblock_migratetype(pfn_to_page(pfn), mt, false);
 -		if (!atomic && IS_ALIGNED(pfn, PAGES_PER_SECTION))
 +		init_pageblock_migratetype(pfn_to_page(pfn), mt, isolate);
 +		if (!atomic && IS_ALIGNED(pfn, PFN_DOWN(SZ_1G)))
  			cond_resched();
  	}
  }
@@@ -769,12 -757,17 +769,12 @@@ static void __meminit __init_deferred_p
  	if (early_page_initialised(pfn, nid))
  		return;
  
 -	for (zid = 0; zid < MAX_NR_ZONES; zid++) {
 -		struct zone *zone = &pgdat->node_zones[zid];
 -
 -		if (zone_spans_pfn(zone, pfn))
 -			break;
 -	}
 -	__init_single_page(pfn_to_page(pfn), pfn, zid, nid);
 -
 +	zone = pfn_to_zone(pfn, nid);
 +	__init_single_page(pfn_to_page(pfn), pfn,
 +			   zone ? zone_idx(zone) : MAX_NR_ZONES, nid);
  	if (pageblock_aligned(pfn)) {
  		enum migratetype mt =
- 			kho_scratch_migratetype(pfn, MIGRATE_MOVABLE);
+ 			kho_bootmem_migratetype(pfn, MIGRATE_MOVABLE);
  		init_pageblock_migratetype(pfn_to_page(pfn), mt, false);
  	}
  }

----------------------------------------------------------------
liveupdate: updates for 7.4-rc1

* Several small fixes to KHO and LiveUpdate selftest
* A series that renames "KHO scratch" to "KHO bootmem" because this memory is
  way more important in kexec'ed kernels rather than in the original cold
  boot kernel and the new name reflects it.

----------------------------------------------------------------
David Matlack (1):
      selftests/liveupdate: Prefer KVM and HVF over TCG in vmtest.sh

Kamalesh Babulal (1):
      kho: docs: fix scratch_phys debugfs cross-reference

Maxi Saparov (1):
      kho: do not reserve scratch memory in the kdump kernel

Mike Rapoport (Microsoft) (1):
      Merge patch series "kho: rename "scratch" to "bootmem""

Pratyush Yadav (Google) (5):
      memblock: get rid of CONFIG_MEMBLOCK_KHO_SCRATCH
      memblock: rename KHO_SCRATCH to KHO_NOPRSRV
      kho: rename KHO scratch to KHO bootmem
      kho: rename kho_scratch= commandline parameter to kho_bootmem=
      kho: do not reserve empty per-node bootmem areas

 Documentation/admin-guide/kernel-parameters.txt |  15 +-
 Documentation/admin-guide/mm/kho.rst            |  18 +-
 Documentation/core-api/kho/index.rst            |  38 +--
 arch/x86/boot/compressed/kaslr.c                |  12 +-
 arch/x86/include/uapi/asm/setup_data.h          |   4 +-
 arch/x86/kernel/e820.c                          |  11 +-
 arch/x86/kernel/kexec-bzimage64.c               |   6 +-
 arch/x86/kernel/setup.c                         |   2 +-
 arch/x86/realmode/init.c                        |   2 +-
 drivers/firmware/efi/efi-init.c                 |   6 +-
 drivers/of/fdt.c                                |   8 +-
 drivers/of/kexec.c                              |  16 +-
 include/asm-generic/kexec_handover.h            |   2 +-
 include/linux/kexec.h                           |   2 +-
 include/linux/kexec_handover.h                  |  16 +-
 include/linux/memblock.h                        |  30 +-
 kernel/kexec_file.c                             |   4 +-
 kernel/liveupdate/Kconfig                       |   1 -
 kernel/liveupdate/kexec_handover.c              | 358 +++++++++++++-----------
 kernel/liveupdate/kexec_handover_debugfs.c      |  24 +-
 kernel/liveupdate/kexec_handover_internal.h     |   4 +-
 mm/Kconfig                                      |   4 -
 mm/memblock.c                                   |  56 ++--
 mm/memfd_luo.c                                  |   3 +-
 mm/mm_init.c                                    |   6 +-
 tools/testing/memblock/internal.h               |   2 +-
 tools/testing/selftests/liveupdate/vmtest.sh    |   2 +-
 27 files changed, 332 insertions(+), 320 deletions(-)
