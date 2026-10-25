Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938966;
	b=IC/upg6dDznhjf6pDL5uBF37HOSZXXAp7UfLab4Fro2c0+FtAl1sVJVMgnS/nHeFmiba
	 Wc4ROLCkfzBq977ybrc6GcO+bbzduMg4GQxoxAGjJaBC1Ydu90Z5B9WzOsQDza6PP5hOk
	 uivLUb0lhQvVeNARFVowXQS/ULA+uA8CFXSgAjI8xdQXMpx6C5xmVhgAGKAFZj4QiBpin
	 BKm94EO1zQaM40jWfNygfUWVLVjtUAJG8+H/cGhMxV2062Cy9uSjOM52y3Tz7YWMbq8bR
	 nWOTlcrbip6Ovt5e9ubFm7XTwzc1Tqu67KI2olVAU0yCOJQcdiI7/A1/etaKPrCiVNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=p8TpnlZQqHoJQXNIEVycNifGEfr+D4SXzqPcwNXn9W8=;
	b=P56eGCA6ZUexiL7jIyz6dUUpHYo8tfmZg9Kw/4ufJx9EHmBFkeQZbQ8EVvG9vaAkmMAu
	 fCek2TTxNQ8r4Ogas3ino4aygBUThnz0Cgl01getBp/poq8sslSL3L3kYx40qLV5r3EkY
	 ZWYlnxfMNXqmdJdzzt1GZRQq4AGc5CkoMahGUy0Uv+YpUuj7mtz4dox/zUCTuv2q6Y44M
	 HzCVaSC5g+Zlcpt3Q2s5hxbMZf4YewmrvVBQ71FBcFfZ71UskflAhOlxxWRbgqpYWkjBQ
	 xvJ6RlPik18/MCLRGFDWHRYlyQ1T5vW79TPvT9zJ/Tf32NIFkj53x84OYyGdAhrkmcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=Cd+eJOS+;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8030606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8030606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=Cd+eJOS+
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5e948e56af3so1052779e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792938965; x=1793543765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8TpnlZQqHoJQXNIEVycNifGEfr+D4SXzqPcwNXn9W8=;
        b=Cd+eJOS+FjQLrBMI/zwBU/J0yCDimXZpTafuLGZEXKGswbNzoADWiQsd6i9lxs9mHW
         1lWEt6iGV5YfwFy6cFVjzme0kNPsJT98ph/bh/w4l7jif9Vh/j02ripCcE+sHh663kF8
         iY9Sq1jhtUARqDTu1Cmv7b4fA2KTjYHMtO5azkqVeg1D5OPrRvv4WulCHC9mTKLzLhk3
         1dH+fujsrpJrJJQ9IaNoh9V04KGqt9buReHyOTNFgBlAcPlaI95b7Tnjd9Z+jiRD92Cu
         jMx+YLU2m7voMMWRQU2OBJg7y4NoXhl5gdwvUc6kt0uBnfBbVNdjVt6aoEN5x6NuiIYF
         NUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938965; x=1793543765;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8TpnlZQqHoJQXNIEVycNifGEfr+D4SXzqPcwNXn9W8=;
        b=nQwpAifBP4RisTwvu5tMjd6BBxqtfXcz/uL8Mf8ocordWDBBdI5v5zaYvr36fhDqJV
         +vW8bH6mEYxrYoQ3qE3t6f0Wj332n4kr2jPq5Nzgays3xUMsT4A/uXCjdN/swqSOh05q
         TBQ8Hfct1z6O6NP5EKpqmDWFS9f6rCt8tF1OixFSkkH6vhCnDJCyHGyFkKURYU+i+p/h
         xuEty2Bo8L6ESBGyY87Di0LYeyovpPPIEUNMKvT+XxdBXWY0R/dDvDB59JAl9V1jdx2N
         5OqQebVjDJ4JRM4rHW/ZqO7f2orEcJsyKb4s9c1jx/7De0DE1gy7wwpwJV4hkV5RtSe8
         nxrw==
X-Forwarded-Encrypted: i=1; AKwUvBzwk31gWwohZp0NnfKwgPestLId1rDzE9jia8nbZEs0HxCI0agVRNPqgWybm3lmLAHf6BV0n+qwxcbB9Lo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGwxqG/Iaa6orptFQIAf2jndpTDpK5Un9fLNUi7HJ7l+98OKfJ
	iqGaQSEI2wLX5sMZn0BBIvA9zqg5HfbTa4tEYslp4eWp7YY98hR6K/Z9wIkKEUcQ5Vw=
X-Gm-Gg: AYBFou0YcB358jbvftuPFPwOH1InH7jWYbutdx0bZ+GqXnSB/9uByBhb8MlLLrjuW++
	iwAPXE6+ik7Fths1bqqekvfgunxDzAdxAWzyZv8ILCOHKgVZ8CIjk/m0y7/pMrhwEcb5ZmD+DIj
	5xSR3TbbDzh0OE2QSWDmYXUAFcyVetLH/o6ZNavP5FYPOZczLFty/ERo+ltRgclaTQU/nke1VXx
	AImBblYH8R8QCiNIc6qD5etO/c5UyAw+6LvNv69k3gXUVKya94QhIaib0f5EsL94jSkfk3JaSKo
	gBOacMoMpjQH5lw8+/Wn8Sfpvbz/nScg6sATiMuKP2vcMdRtoTK7Ah2jsurlh0Sz6NlTzWg5/cq
	Zlq54BQ9dgdvw++sBWrVqEmIgtP0leuKoXmm8Hs4IQeNOW6hXA/Xb4uNmrTxDnkevnF59vrRAiy
	DJmKKGjYSlq6vtsEjMuznvyNm4y13482m8BNc3FPZebJ0rNOuTCxdwcqM0Gcp0Oxi0GLskKASfy
	XSn5zMIxwzGFcGkqIdDp6JK/cRYs3/Mla0LXRgoWTjfG2i57Pg3/6GyXpVNCoN+5jMfzxmJzbJl
	DX79hOyChQKzKc8c0CHp8ic1fMmMUY0rgMDKjAe2yVSSTw0Yut8JkiRsC2uPYDgBwjwDERID9He
	+
X-Received: by 2002:a05:6122:1b05:b0:5db:4749:1737 with SMTP id 71dfb90a1353d-5ec231f5be2mr1218362e0c.4.1792938964559;
        Sun, 25 Oct 2026 07:36:04 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234618c9sm5531291e0c.11.2026.10.25.07.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:36:04 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Alexander Graf <graf@amazon.com>,
	"Andersen, Tycho" <Tycho.Andersen@amd.com>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	David Matlack <dmatlack@google.com>,
	"Heyne, Maximillian" <mheyne@amazon.de>,
	James Gowans <jgowans@amazon.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Praveen Kumar <kpraveen.lkml@gmail.com>,
	Vipin Sharma <vipinsh@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	"Woodhouse, David" <dwmw@amazon.co.uk>,
	Luca Boccassi <luca.boccassi@gmail.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Jork Loeser <jloeser@linux.microsoft.com>,
	Chenghao Duan <duanchenghao@kylinos.cn>,
	Zhu Yanjun <yanjun.zhu@linux.dev>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [Hypervisor Live Update] Notes from October 19, 2026
Date: Sun, 25 Oct 2026 10:35:33 -0400
Message-ID: <20261025143601.2564170-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi everybody,

Here are the notes from our Hypervisor Live Update call held on October 19.
These notes are intended to bring those who could not attend up to speed
and to keep the momentum going between meetings.

----->o-----
LPC 2026 Recap & Takeaways

* Track Placement for Subsystem Topics: Following a successful experiment
  moving KVM-related live update talks (such as Orphaned VMs) into the KVM
  Microconference, David Matlack and Pasha agreed that subsystem-specific
  live update topics (e.g., VFIO, IOMMU, PCI) should target their respective
  subsystem microconferences next year. Now that core Live Update concepts
  are established, presenting directly in subsystem tracks ensures the
  relevant maintainers are in the room while freeing up time in the
  Live Update Microconference.

* Focused Core Sessions: For future Live Update Microconferences, the group
  plans to be stricter on topic selection—focusing the track on core,
  cross-cutting architectural topics (such as versioning and LUO core)—with
  longer time slots, minimal slides (2–3 slides), and discussion-focused
  sessions aimed at concrete outcomes.

----->o-----
Cross-Subsystem Versioning & Compatibility Strategy

* Post-LPC Alignment: The Live Update BoF organized by Pratyush Yadav at
  LPC helped clarify maintainer expectations and establish a path forward
  with Sean Christopherson and Jason Gunthorpe without blocking ongoing
  series.

* Minimal Expandable Header First: Rather than trying to lock down a full
  versioning UAPI upfront—which requires extensive scrutiny given permanent
  UAPI stability guarantees—the group will start by introducing a minimal,
  expandable serialization header (with size and feature flags) and updating
  all existing serialized structures across upstream Linux to use it.

* Next Steps: Tarun Sahu took over sending the initial expandable header
  patch series from Pratyush, as it directly unblocks the guest_memfd and
  KVM preservation work.

----->o-----
PCIe Persistence

* PCI v10 & Target Kernel Retargeting: David Matlack posted v10 of the base
  PCIe Live Update series, adding ACS egress control vector save/restore per
  Alex Williamson, kernel-doc improvements per Mike Rapoport, and a flags
  field in the serialized structure (to be replaced by the standard header
  once available). Because v10 arrived too late for sufficient linux-next
  soak time ahead of Linux 7.4, Mike Rapoport noted off-list that the series
  will now target Linux 7.5. Pasha will merge v10 into liveupdate/next
  immediately after the Linux 7.4 merge window closes.

* PCIe Core Roadmap & Upcoming Series: David published the PCIe core live
  update roadmap to the mailing list prior to LPC:
  - PCI Save State Refactor: Posted upstream to restructure PCI save state
    data structures in preparation for VFIO preservation.
  - Peer-to-Peer DMA & MMIO Preservation: Ready to post this week. Preserves
    bridge windows and device BARs and avoids destructive BAR sizing during
    enumeration so preserved devices (and Orphaned VMs performing MMIO) can
    continue memory transactions across kexec.

* Testing Strategy: David is currently validating the peer-to-peer DMA
  series using the VFIO live update kexec selftests under QEMU with PCI
  config space write tracing to verify that preserved BARs and bridge
  windows are untouched across reboot. To enable standalone PCI core testing
  before VFIO support lands, David plans to prototype a selftest kernel
  module (a minimal no-op PCI driver that binds to a device and preserves
  it via LUO).

----->o-----
VFIO Persistence

* Full Preservation via no-IOMMU Mode: Vipin Sharma returns from parental
  leave on October 21. At LPC, the group agreed with Alex Williamson to
  restructure the next VFIO series so that it lands full VFIO device
  preservation in a single series using no-IOMMU mode (preserving internal
  driver state and skipping device reset across kexec), rather than landing
  a partial series that resets the device.

* IOMMUFD Integration & Ordering: Once the complete no-IOMMU VFIO series is
  in place, Samiullah Khawaja's IOMMUFD persistence series will hook into it
  via a single small patch calling IOMMUFD preserve/unpreserve/restore APIs.
  Samiullah clarified the dependency ordering: userspace preserves IOMMUFD
  first (preserving core domain state), followed by VFIO. Because an IOMMU
  domain may have multiple attached devices where only a subset is being
  preserved, VFIO calls into IOMMUFD during its preservation step to
  preserve the device-specific IOMMUFD state whose lifecycle it owns.

----->o-----
IOMMU Persistence & LUO Core

* IOMMU v6 & Architecture RFCs: Samiullah received review feedback from
  Nicolin Chen and Baolu Lu on v5 and is preparing v6, incorporating
  LPC UAPI and design updates. Additionally, AMD and ARM IOMMU preservation
  RFC series have now been posted to the mailing list; Samiullah will review
  both series.

* Dependency Ordering & Early Freeze: Samiullah will defer his LPC proposal
  for explicit FD dependency tracking and batching in LUO. Following
  discussions with KVM maintainers on how live migration enforces strict
  ioctl ordering in userspace, Pasha and Samiullah agreed to enforce
  dependency ordering on userspace during preservation, while using Pasha's
  new user-triggerable early freeze patch as the synchronization point to
  resolve any circular dependencies across file handlers.

----->o-----
tmpfs File Preservation

* Refined Retrieve Design (O_TMPFILE + linkat): Building on the LPC
  discussion and subsequent mailing list refinement by David Matlack,
  Pratyush Yadav, and Pasha, LUO will create the restored tmpfs file
  directly during the retrieve ioctl via generic arguments rather than
  backfilling a pre-opened userspace FD (avoiding races with concurrent
  userspace accesses).

* Unlinked File Creation: Modeled after openat(2) with O_TMPFILE, userspace
  passes a target directory FD and flags to retrieve, and LUO returns an
  unnamed, unlinked tmpfs file FD on that mount. Userspace can either keep
  it as an anonymous temp file or link it into the filesystem namespace via
  linkat(2). This keeps LUO completely agnostic of filenames and variable-
  length path strings.

* Patch Series Split: David will include Pasha's generic retrieve argument
  patches in the next revision of the tmpfs series. Pasha's early freeze
  patches will be split out as a standalone series, with Pratyush reviewing
  them on v1.

----->o-----
KHO & Scratch Memory

* Scratch-to-Bootmem Rename: Pratyush reported that the patch series
  renaming KHO "scratch memory" to "boot memory" (bootmem) is queued in
  liveupdate/next.

* KHO XArray & Sparse memfd Support: Pratyush has implemented the KHO XArray
  data structure and is integrating it into memfd. Pasha and Pratyush
  discussed using sparse memfd preservation (large virtual address space
  with unpopulated holes) as the primary motivating use case and selftest.
  Supporting sparse memfds without faulting in holes requires updating the
  pinning path to pin only populated pages and disallow new page faults
  after preservation; Pratyush will evaluate the fault, migration, and swap
  path implications.

* CMA Pinning Bottlenecks & Scratch Memory: Pratyush noted an Ubuntu bug
  report where KHO's pre-reserved CMA regions restrict pinnable memory for
  GPUs. Tarun has been analyzing CMA allocation behavior: normal movable
  allocations default to ZONE_NORMAL until it fills up, leaving no room for
  pinned allocations in ZONE_NORMAL because movable pages are not migrated
  into CMA (ZONE_MOVABLE). Tarun discussed adding ZONE_NORMAL-to-CMA page
  migration with David Hildenbrand, who agreed it would be a valuable
  kernel improvement to alleviate CMA pinning pressure while longer-term
  alternatives to pre-reserved KHO scratch memory are investigated.

----->o-----
PowerPC & LoongArch KHO Support

* Real-Mode Execution of kho_populate(): Sourabh Jain reported a review finding
  from Sashiko on the PowerPC KHO series: kho_populate() was being invoked
  too late during boot, after several early memblock allocations had already
  taken place and could overwrite preserved memory regions. On PowerPC,
  running kho_populate() prior to any memblock allocations requires calling
  it in real mode (before the MMU is enabled in start_kernel). However,
  generic kho_populate() uses early_memremap(), which returns virtual
  addresses that cannot be accessed in PowerPC real mode.

* Architecture Mapping Abstraction: Sourabh and Pratyush agreed to add a
  lightweight architecture abstraction so generic kho_populate() receives a
  usable pointer—continuing to use early_memremap() on architectures like
  x86 (where the MMU is active and uncached physical accesses are slow)
  while allowing PowerPC to pass a direct real-mode physical address.
  Sourabh plans to post the updated series this week.

* Static memblock Array Limit (128 Regions): Sourabh also checked whether
  populating KHO regions before dynamic memblock array resizing is enabled
  could hit the static 128-entry BSS array limit. Pratyush and Pasha confirmed
  that 128 entries are shared across architectures and sufficient for 2 + N
  scratch regions (where N is the number of NUMA nodes); if ever needed,
  dynamic resizing can be enabled as soon as the first scratch region is
  registered, or the static size can scale with CONFIG_NODES_SHIFT.

----->o-----
Guest Memory (guest_memfd), KVM & Confidential VMs

* KVM & guest_memfd PoC Series: Following LPC discussions, Tarun Sahu is
  preparing a combined PoC series (VM preservation, vCPU preservation, and
  guest_memfd preservation) by the end of October to demonstrate the end-to-
  end ABI for KVM maintainers, after which guest_memfd preservation can
  proceed standalone. To unblock this, Tarun is also incorporating custom
  arguments for LUO preserve and retrieve ioctls alongside the expandable
  serialization header series.

* Confidential VMs (TDX & SEV-SNP) Require In-Kernel Live Update: Pasha,
  Sagi Shahar, and David Matlack confirmed that confidential VMs (Intel TDX
  and AMD SEV-SNP) cannot perform host kernel updates via userspace live
  migration / copy-out flows: guest memory and control structures use
  physical-address-dependent encryption (pages cannot be relocated in
  physical memory) and architectural state (TDX SEPT tables and VMCS pages,
  or SNP RMP/VMSA state) cannot be exported to userspace. Consequently,
  in-kernel KHO/LUO preservation of guest_memfd, VM FDs, and vCPU FDs is an
  essential requirement for updating hypervisor kernels running confidential
  VMs. Sagi noted that Google's internal copyless TDX migration uses this
  same in-kernel transfer approach.

----->o-----
TDX Module Preservation & Orphaned VMs

* TDX Module Preservation Status: Sagi Shahar reported that TDX module
  preservation across kexec is working. He is now connecting it to TDX VM
  preservation, where the main remaining hurdle is traversing and preserving
  Secure EPT (SEPT) tables across kexec. Pasha pointed Sagi to the EPT
  traversal and preservation implementation in the Orphaned VMs RFC series.

* Orphaned VMs Supporting Series: Pasha posted two new upstream patch series
  supporting Orphaned VMs:
  1. Read-only KHO: Enables the lightweight Linux caretaker to read preserved
     KHO state without full KHO initialization.
  2. CPU Hotplug (Online/Offline) Performance Improvements: Standalone
     series accelerating CPU offlining and onlining, benefiting both general
     host operations and Orphaned VM physical CPU preservation.
  Because time ran short, Orphaned VMs will be moved to the first agenda
  item for our next meeting.

----->o-----
Action Items & Next Steps

Pasha:
* Merge PCI v10 into liveupdate/next right after the Linux 7.4 merge window.
* Split early freeze patches into a standalone series (separate from generic
  retrieve arguments).
* Move Orphaned VMs to the top of the agenda for the next meeting.

David M:
* Post the PCIe peer-to-peer DMA / bridge window & BAR preservation series.
* Prototype a standalone PCI core live update selftest kernel module.
* Incorporate Pasha's generic retrieve argument patches into the next tmpfs
  preservation series using the O_TMPFILE + linkat model.

Tarun:
* Post the minimal expandable serialization header + custom LUO preserve/
  retrieve argument patch series.
* Post the combined KVM VM + vCPU + guest_memfd preservation PoC series by
  the end of October.
* Continue investigating ZONE_NORMAL-to-CMA page migration for pinnable
  memory pressure.

Pratyush:
* Review Pasha's standalone early freeze patches on v1.
* Evaluate memfd pinning and fault-disabling changes to support sparse
  memfd preservation with KHO XArray.

Samiullah:
* Post IOMMU persistence v6 incorporating review feedback and LPC updates.
* Review the AMD and ARM IOMMU preservation RFC series on the mailing list.

Sourabh:
* Post the next revision of the PowerPC KHO series with real-mode
  kho_populate() mapping support.

Sagi:
* Review the EPT preservation logic in the Orphaned VMs RFC to integrate
  with TDX SEPT table preservation.

----->o-----

Next meeting will be on Monday, November 2 at 8am PST (UTC-8), everybody is
welcome!

Join Here: https://meet.google.com/rjn-dmzu-hgq

Please let me know if you'd like to propose additional topics for
discussion, thank you!

Best regards,
Pasha
