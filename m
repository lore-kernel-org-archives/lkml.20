Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069799;
	b=hUvN6NWfNNpiGNSeHnFXqSD9dWnQ0LP9L/mYYfkKopoMBcyGsgUBPDClLdgL/wCwQtv7
	 Tada27JQf5wPopM/ktb/xFa144pCBY8pmmQ7i46G9UvU2N55moF48GV4ZluUJT/4cwTz4
	 peElOb2KyePq6XjtA01Tsl2YaJxUognAcAMEHELfQJrdmnEbH+wjeI7qmDpCNR+HJOdP7
	 RddoOnBf/lQgihEQv1aZOGEidLExp1+ElkD9Z6bMvQYfE6rBrslgB0xW4ZdJlj07YI2a5
	 aJ1kZhlBeoMP6ZClw0zqllYKwZEUB8TQNnRNVjB1CC0imj4YbWqI82X61mk5sA2Xnbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=dwblYA+AM7o/Y2k567GfJxsiQOZ+wOooFaUgOxOAWwI=;
	b=e/KGKke4BXA1AWV4oRePhpeLtd70oR3wK9XmHTTr2ALElWHFMFdtIto2K9jusVvyhSzR
	 Cr6qvGKvPSURHle2Vq1R61gRFLR+L+7kHnHCkjbyJVh/vbQtv2yTKTR/DgzUp/emEuPNG
	 ICkfgWYraSy5SqVjjgMCjrBknM8QNSChWdtBE1l7i6D4l5GIxKFvhTeCDheZ4jNaIusfU
	 DfRzEDHOtrHXA9J7oyFvo+H0/igGJjMKgTAqryHUYqiBPGLLncy3WqsOld8wOc1pTvYtw
	 uSAijeprTOKhefXKdcuvNAbhOt7J5VBhNnwiToQa1+VF5FrI8Qz32aSBmKRyWM54o2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nVZMwR5w;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6619606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6619606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nVZMwR5w
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4d2f0f77124so4681597b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793069798; x=1793674598; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dwblYA+AM7o/Y2k567GfJxsiQOZ+wOooFaUgOxOAWwI=;
        b=nVZMwR5wpOy+EVFOyMv53gxZOse51S1NsUuHzYYFJWYp8nH6zxziBjeGohV4ILwl7Y
         0tE789BivvxUOYVnAOQWLX7PFFZ5fLI/OIMPuF1IdHdVhtcHvA1xGxUBpNNTammaDUlI
         HVKHyW46FBukwwp2Xkti0hlx8pzOT6PjqLn14+XNCWTs8DtW3aiAq40X0oymiynWcF/4
         pOwPAzani6XTN4Zz20cAVUFOlwnGe1zxpiGFnzJPPH9+QOuqW5HDRzU5YO5MAnJbJmOw
         I4gqqAYW9MLJgXjKGSBFuw9zlyXqLln6+rrKagm7xI9gvfp3xAXtiC2FZEBztwXur12p
         FdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069798; x=1793674598;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dwblYA+AM7o/Y2k567GfJxsiQOZ+wOooFaUgOxOAWwI=;
        b=q5LIcew3i3v371ZpavFx+9qCcpL8EZbMxa1tmokfNViu0DXiV9gqX3fA6G3GBS/wUI
         TXYarZBeBqo/zPWB7/RVaTvJeRNrb+ne+d/vcxFsoza76HoQk97I5kfu6WK6LWSl5Kes
         BoTRjbet3ab99syNOuwDQ8XqKmp4XCjlNImn/446TKqs+M/AWZ84lNRXPwL/uIwVD9Xs
         d1q3ZEP1DLQfG/9cD9v0bEqhryobql7bHi1OzS2llLAXgmnI+RY92vjUKo4yzBlU6/LN
         tO8ve+1nexE4eiv5BeJ+yxlQg2anYD5v2e7GcsBDI6hvwQEIWHNwNNUYn5eQgLJ1hZmF
         tNaQ==
X-Forwarded-Encrypted: i=1; AKwUvByLPRgdbuz2E6kT2coI/E+CkqbyE/35p0W6Hu+jHa/Z4uS9v7RYrAJ5Ool+dXWA06OOgygoMQIQCbHYEpQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKxOxWaFOS5Ssnfac5g/dQnvXmTYbEjU0Kebq+PQdl5l7zpIne
	MOztu1CGpTVwkS0hqLskg6R6xVkp9UjzIEmnWAV14CZ4L+7Ojd6JoOUFjcxfSHodUCWQP/PskPe
	qT/B3Phpa03DiHwZsd7nsuH/WiY6DKAfgmA==
X-Received: from iocou2-n1.prod.google.com ([2002:a05:6602:c302:10b0:9c7:a036:c41d])
 (user=kevinloughlin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:448b:b0:4ea:1854:b949 with SMTP id 5614622812f47-55c002fb936mr5589922b6e.33.1793069797304;
 Mon, 26 Oct 2026 19:56:37 -0700 (PDT)
Date: Tue, 27 Oct 2026 02:56:03 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027025616.1632690-1-kevinloughlin@google.com>
Subject: [PATCH 00/13] virtio_balloon, efi/unaccepted: support memory
 ballooning and free page reporting in CoCo guests
From: Kevin Loughlin <kevinloughlin@google.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@kernel.org>, Jason Wang <jasowangio@gmail.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Alexander Duyck <alexanderduyck@fb.com>
Cc: virtualization@lists.linux.dev, linux-coco@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sidharth Telang <sidtelang@google.com>, Punit Salian <psalian@google.com>, 
	Peter Gonda <pgonda@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Jacky Li <jackyli@google.com>, Steve Rutherford <srutherford@google.com>, 
	David Skidmore <davidskidmore@google.com>, Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

This series enables virtio-balloon free page reporting and memory balloon
inflation/deflation in Confidential Computing (CoCo) guests, starting
with architectural hooks implemented for AMD SEV variants, in order to
support dynamic CoCo guest resizing.

Today, memory ballooning and free page reporting are essentially unusable
in CoCo guests due to three main roadblocks:

1. SWIOTLB Bounce-Buffering on Free Page Reporting:
   Under VIRTIO_F_ACCESS_PLATFORM, virtqueue_add_inbuf() maps every
   scatterlist entry through the DMA API. For reporting_vq, these are
   multi-megabyte ranges of free buddy pages. The host never DMA-reads
   or writes the page contents; it only inspects the GPA to punch holes
   in backing memory. Running these ranges through SWIOTLB exhausts
   bounce buffer pools and wastes cycles copying gigabytes of
   unencrypted free memory.

2. Dynamic Memory Unacceptance & Re-acceptance:
   When the host reclaims guest physical pages via hole punching,
   the guest must transition those GPAs back to unaccepted/shared before
   the host reclaims them (rescinding PVALIDATE and issuing a GHCB Page
   State Change on SEV-SNP). Otherwise, any subsequent access triggers a
   fatal #NPF or #VC. While the EFI unaccepted memory subsystem handles
   boot-time lazy acceptance, it lacks an API or state tracking to
   dynamically unaccept memory at runtime or route unaccepted freed
   pages in the page allocator.

3. Acceptance Granularity (2 MiB) vs. Balloon Pages (4 KiB):
   On x86, the EFI unaccepted memory bitmap tracks state at 2 MiB
   (PMD_ORDER) granularity both to keep the bitmap compact and for
   performance: accepting and unaccepting in 2 MiB blocks preserves
   2 MiB host hugepage mappings (NPT/RMP on SEV-SNP and Secure EPT on
   TDX), avoids 512x per-4 KiB page state transition and validation
   overhead, and prevents RMP/SEPT size-mismatch splits. Because a
   2 MiB bitmap unit cannot be partially unaccepted, CoCo free page
   reporting and balloon inflation require 2 MiB blocks and do not
   fall back to 4 KiB allocations (though low-level PVALIDATE still
   falls back to 4 KiB instructions if the host RMP entry was already
   split). Standard virtio-balloon allocates 4 KiB pages and caps its
   PFN array at 256 PFNs (1 KiB descriptor), so CoCo guests must
   allocate 2 MiB compound pages while streaming PFNs in 256-PFN chunks
   to respect existing VMM descriptor limits (such as QEMU's 1024-byte
   cap).

   As a trade-off of requiring 2 MiB blocks rather than 4 KiB pages,
   the effectiveness of balloon inflation/deflation in CoCo guests
   depends on guest memory not being overly fragmented (which guest
   kernel command-line options like movablecore / ZONE_MOVABLE or
   background compaction can help mitigate). Even when unmovable
   allocations fragment some pageblocks, free page reporting already
   operates at this same 2 MiB (pageblock_order) granularity on x86_64
   and continues to reclaim contiguous free blocks opportunistically.

Key Design Elements in This Series
==================================
- Per-virtqueue DMA map ops (Patches 1-2):
  Extends virtio_ring to allow individual virtqueues to install custom
  struct virtio_map_ops. For reporting_vq, virtio_balloon installs a
  no-op GPA identity mapper so free page ranges are passed directly
  without SWIOTLB bounce buffers, while keeping the descriptor ring and
  any indirect descriptor tables securely mapped via the device-level
  DMA API.

- Dynamic unacceptance & SEV-SNP hooks (Patches 3-4):
  Adds arch_unaccept_memory() / snp_unaccept_memory() for SEV-SNP. Also
  adds exception fixup in vc_raw_handle_exception() for
  SVM_EXIT_PAGE_NOT_VALIDATED (0x404) and SVM_EXIT_NPF (0x400) at
  EX_TYPE_ZEROPAD instructions so speculative reads from
  load_unaligned_zeropad() that touch the edge of dynamically unaccepted
  memory are handled cleanly without kernel panics.

- Dynamic unaccepted memory tracking & MM routing (Patches 5-9):
  Anchors the EFI unaccepted table at base 0 when unaccepted memory is
  present, introduces mark_memory_unaccepted() with error reporting and
  proper locking, generalizes zone->unaccepted_pages to variable orders
  >= unaccepted_memory_order(), and updates mm/page_alloc,
  mm/page_isolation, mm/page_owner, and mm/page_reporting to route
  unaccepted pages back to zone->unaccepted_pages without corrupting
  them with page poisoning, KASAN, or init_on_free before re-acceptance.

  Generalizing zone->unaccepted_pages from MAX_PAGE_ORDER (4 MiB on x86)
  down to >= unaccepted_memory_order() (2 MiB) aligns allocator tracking
  with the underlying hardware validation/RMP/SEPT and EFI bitmap unit:
  even when boot-time lazy acceptance processes a MAX_PAGE_ORDER block,
  the hardware and bitmap validate it in 2 MiB chunks, and runtime
  allocations, pageblocks, and mm/page_reporting split accepted memory
  below MAX_PAGE_ORDER anyway.

  Note for reviewers: The three mm/ patches (Patches 7-9) are the most
  intricate part of this series due to the interactions between lazy
  acceptance, page isolation, and page reporting. Extra scrutiny from
  mm reviewers to ensure no page-allocator or pageblock corner cases
  were missed would be especially appreciated.

- 2 MiB compound ballooning with 256-PFN chunking (Patch 10):
  Allocates compound pages at PMD_ORDER in CoCo guests that require page
  state transitions, breaking them into 256-PFN chunks when queuing to
  the host so virtqueue descriptors remain at 1 KiB, preserving
  out-of-the-box compatibility with existing hypervisors.

- Balloon state transitions & CoCo ACCESS_PLATFORM (Patches 11-13):
  Calls mark_memory_unaccepted() on reported ranges and inflated pages
  before adding buffers to reporting_vq and kicking the virtqueue, routes
  deflated pages to unaccepted freelists, preserves
  VIRTIO_F_ACCESS_PLATFORM, disables VIRTIO_BALLOON_F_FREE_PAGE_HINT and
  unsupported VIRTIO_BALLOON_F_PAGE_POISON in CoCo guests, and rejects
  probing on CoCo platforms where balloon page state transitions are
  unsupported.

Why Both Free Page Reporting and Inflation/Deflation
====================================================
CoCo guests using lazy memory acceptance boot with their maximum RAM
declared as EFI_UNACCEPTED_MEMORY in the initial EFI memory map,
avoiding runtime ACPI/virtio memory hotplug. Prior to this series, lazy
acceptance was a one-way ratchet: once a workload spike caused the
guest to accept pages from zone->unaccepted_pages, those pages could
never be unaccepted or returned to the host.

Turning EFI unaccepted memory into a bidirectional lifecycle enables two
complementary mechanisms on initial boot RAM:
- Free Page Reporting (reporting_vq): Autonomously reports idle 2 MiB
  free buddy pages to the host for hole-punching, and lazily re-accepts
  them locally from zone->unaccepted_pages on demand without a host
  virtqueue round-trip.
- Balloon Inflation/Deflation (inflate_vq / deflate_vq): Allows VMMs
  that size guests without hotplugging to actively apply memory pressure
  (triggering guest reclaim) and enforce dynamic memory targets on boot
  RAM.

Architecture Support & Intel TDX Follow-Up
==========================================
The efi/unaccepted, mm/, and virtio_balloon changes in this series are
architecture-agnostic, with architecture hooks (arch_unaccept_memory())
wired up first for AMD SEV-SNP via snp_unaccept_memory() (alongside
VIRTIO_F_ACCESS_PLATFORM support for SEV-ES).

On Intel TDX, I think dynamic unacceptance should use
TDG.MEM.PAGE.RELEASE to transition private pages from MAPPED back to
PENDING so the host VMM can reclaim them (and the guest can later
re-accept them via the existing TDG.MEM.PAGE.ACCEPT path in
tdx_accept_memory()). Once TDG.MEM.PAGE.RELEASE support and
load_unaligned_zeropad() handling for dynamically unaccepted pages
(e.g., via direct-map unmapping under SEPT_VE_DISABLE) land upstream in
arch/x86/coco/tdx/, tdx_unaccept_memory() can slot directly into
arch_unaccept_memory().

Testing
=======
- AMD SEV-SNP Milan hardware (CoCo): Passed end-to-end memory pressure
  soak testing with live guest_memfd hole punching (FALLOC_FL_PUNCH_HOLE)
  and dynamic lazy re-acceptance under memory pressure on an internal
  hypervisor.
- Cloud Hypervisor & QEMU: Verified standard non-confidential
  ballooning remains compatible. End-to-end SEV-SNP balloon testing on
  upstream Cloud Hypervisor and QEMU has been limited so far (while
  both punch holes in guest_memfd on shared page-state transitions,
  QEMU's virtio-balloon still issues MADV_WILLNEED on shared HVA
  mappings during deflate); any testing help or suggestions on these
  hypervisors are greatly appreciated.

Note: An LLM coding assistant was used during the development of this
series to assist with code and commit message drafting and refactoring.
I have reviewed and verified all changes.

Kevin Loughlin (13):
  virtio_ring: support per-virtqueue DMA mapping ops
  virtio_balloon: add reporting_vq DMA map ops
  x86/coco/sev: add snp_unaccept_memory()
  x86/coco/sev: fix zeropad #VC on unaccepted memory
  efi/libstub: start unaccepted bitmap at address 0
  efi/unaccepted: add mark_memory_unaccepted()
  mm/page_alloc: allow lower-order unaccepted_pages
  mm/page_alloc: route unaccepted isolated pages
  mm/page_reporting: account for unaccepted memory
  virtio_balloon: add higher-order page inflation
  virtio_balloon: unaccept free reporting ranges
  virtio_balloon: unaccept inflated balloon pages
  virtio_balloon: enforce ACCESS_PLATFORM in CoCo

 Documentation/mm/physical_memory.rst          |   3 +-
 arch/x86/coco/sev/core.c                      |  13 +
 arch/x86/coco/sev/vc-handle.c                 |  29 ++
 arch/x86/include/asm/sev.h                    |   2 +
 arch/x86/include/asm/unaccepted_memory.h      |  14 +
 arch/x86/include/uapi/asm/svm.h               |   2 +
 .../firmware/efi/libstub/unaccepted_memory.c  |  45 +++-
 drivers/firmware/efi/unaccepted_memory.c      | 107 +++++++-
 drivers/virtio/virtio_balloon.c               | 214 +++++++++++++--
 drivers/virtio/virtio_ring.c                  | 136 +++++++---
 include/linux/balloon.h                       |   1 +
 include/linux/mm.h                            |  18 ++
 include/linux/mmzone.h                        |   2 +-
 include/linux/virtio.h                        |   4 +
 mm/balloon.c                                  |  67 +++--
 mm/page_alloc.c                               | 248 ++++++++++++-----
 mm/page_isolation.c                           |  44 +++-
 mm/page_owner.c                               |   7 +-
 mm/page_reporting.c                           |  34 ++-
 19 files changed, 824 insertions(+), 166 deletions(-)

-- 
2.56.0.307.g5fe7bd680c-goog
