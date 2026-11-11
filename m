Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794431440;
	b=34wXTesmLuVJVf9StA6Usd69AOdXHqDgr9thWIerV9Hgi12G+i8GZ+btbHwtwU6QfuFX
	 6P/6JobPHz/YYVml7JHE7U1rsa/L4KzhKt874e/aFSzzfGhDBR1SnRLHHnB2uF2cXacwb
	 vdTi2/cb7rH7HtaDPSIY/ga0wN8K+v2sQ/RS5vqkcB4JIXppET7xZzCvSiEXJuf7QoS7I
	 iWVTnq48bBoaQs3yeVq4+7zimi9wXv4z09CUMcggm6QImSFJQPZFkmf7VaVXzgbx9hUGo
	 +TLTrPG1zjqo5lfSyGC1yLgzqakD6BOBS7rSYVMjtTuEzlCCo6V7NV9sD11PaRAv8cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794431440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=r8AUQA6KaaSP0401Cp0Pm+i8FjqoJHWRTLuh0q617+w=;
	b=YknEfLyO0D60Uf73T5Zwak2pTvq03ldJitWFToSmj4MKZ7/Llq6sCU9SHJOtlYYqPJKg
	 Kw+pEj1qR5ATz+TsXS71YKNtJoS/38KC/ySfJIkVihGSyhsgnSbQMecX6ed5/LjUt5Kat
	 Giy3+WsnaOXpoce4m9eqTO0ymaFPblYc4zUECdfY7R8OKMPGCuFPG6pqr8X2rEM1XxYIo
	 E0ZDg7v6R9CQOKP2FlCoMT1O/PLj303hBSEjBwk+aC3Fbl4f6dm0q85m4bGp9yeaHW7oH
	 8gf5atj+pr4g4DA+SdhbggHMONcwGCW5Znh1l1rHbavTQticaM6UQn99TvQY1i78GDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=JM7qDhmQ;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A8F606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3A8F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=JM7qDhmQ
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-990703f817fso1694496241.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794431439; x=1795036239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8AUQA6KaaSP0401Cp0Pm+i8FjqoJHWRTLuh0q617+w=;
        b=JM7qDhmQBOVrPB223L/T/5wk9VCVf/GPS7fuHwESN60ZmigPVpsAt8Wi2mZOtdpv0Z
         /a7xtgd4u0qDSj5kuQ4B5N7pkm7SG749yKZRWuPgF6VJG1FoZ9j+V5wNQDIzXyvI+s/x
         ggW9mkmRsAnzIDCUW1k9oAOdygbSKQMkF7Ojhb6ikclRagsMWz0IbQ9DIcCSs8MX9uFH
         EezHq9ZSPDoRZmCmdPBOeEcJDLMKB+OyaSVKT2S4m6RdT27RaYLiWlRDLRbrd6UFOJHN
         pfSNg6dXk6O1Q6KGifuacQ2zGd1ts+S034MdigO7CMIbTGxeRUZ3NpSjKzaooEfGRbn8
         6HzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794431439; x=1795036239;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8AUQA6KaaSP0401Cp0Pm+i8FjqoJHWRTLuh0q617+w=;
        b=mUdny/5VsJk8YC8nxkJ1Wdb0j8S7wppqRL/EUZcY5B3LbvjBtLTOs2Z4bCz7PyMfki
         DYXOt0FrPA6LRuQVjVq/YktaxKrUtFwTgfWNA2Z4sZJbtn45+MOETHFWgUDtcjnkgx0X
         0pWXgJozq07Jw721Vpl/ALokC3hILDleG4NlriGmdFUZ0Ao8pxB1KerSJjZT/YXt/bL4
         3n5TOl6hgY02mGDvsP8LYMGONYyFXKFj/NroqaZUtgBZtC1Yb88RoHDzEMD6aycN4NFN
         EHCPW6o3SuFzvtKvuC5vE14t/yRcFMnhTKHFPpPelVr5gCSBjh/5uG723aXzC9P0BGzU
         0o+w==
X-Forwarded-Encrypted: i=1; AL+hErE3Cx9rNITg0VuFXQ0qoj+RNYc9u8S89KJvz54MeqzE1rq8old6G7539GULXf37It6s4H9yruIA+cLeZak=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SaRXkOsNRz9uuNKS9eKKz3BuK7L64uRKOLvsX7Y4Xu1CDOHr2
	1O41GlyTwJMbKk5FSzp1IrhJHp51fGA/Vgmv2S8291NiSeKKdIfY7o50BHs1OgDwCWQ=
X-Gm-Gg: AYBFou3Of6zo/kcjE2RcpmFNh23ZPoOBSR/i2v2A4H63YGeRYrxtnuWo2924FP0i6vd
	DegonaofTG7hq0rj3yVr5kl3hCLaHpvnh1NQY9iw9wL1CFYvSJziBRwXuSUCC5HhPPZTBcp27XZ
	9J/7MhNWtDqsm9MbUaTGnxhWXJLzo6fVHNZNzGs2ngay7yI+B8GLe6M3lOc+Hfq9wH+uDMLm44p
	oQo/hFi5UPDWLTLevhEUtzWi8eJdRaSkXfMWN3fntsNotuxKtWo2avbhDZf4QVp3Ffd5Gjg6SZQ
	qHu3erqPBOcrslwciaDuDFk5PAmy+qODUFCM8OLAee4ZVZ0nB52mFRBh6qPHCWQUl1cuMCV1DdU
	E5X1srxXpeZ2vtOYzyGioAJidM/PA6RJx6eCdSGtsickHfT421BLzPCRGKqDcxM6gWwOus/ZqD5
	49mxJrve5jSYvA/Iwqj+N7WyXXlWym2x1CXhhflYS8WDjj17c5jcMmSLcTs6fUK/ReWdN6D1fSN
	WhY3/dIadCiArvqe8nk3VN6doo0MLNVUnv/oxhF7/oh4ceLcpAp4/8LhHbdSUWt9uDTltNnsmj7
	h7k1Al23ROEBjOsk5Uy5ey0YGVDXWsGvO97PgXk/8G9vnwqRgQV2AIkbUe0h+S7ZLTnH14gJrzN
	/pgYeY2vjG45g0HV2c0Vw+iIdXr74uSUEEpEt1/E/eZA30z3c6frW
X-Received: by 2002:a05:6102:4496:b0:7c3:1395:a090 with SMTP id ada2fe7eead31-7d4fb2a592fmr1781381137.6.1794431438861;
        Wed, 11 Nov 2026 13:10:38 -0800 (PST)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023847absm4914038137.8.2026.11.11.13.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:10:38 -0800 (PST)
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
Subject: [Hypervisor Live Update] Notes from November 2, 2026
Date: Wed, 11 Nov 2026 16:10:30 -0500
Message-ID: <20261111211035.3297484-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

Here are the notes from our Hypervisor Live Update call held on November 2.
These notes are intended to bring those who could not attend up to speed
and to keep the momentum going between meetings.

----->o-----
Orphaned VMs & Linux Caretaker

* Shift to Specialized Full Linux Caretaker: Evolving the Orphaned VMs RFC
  architecture presented at LPC:

  https://lore.kernel.org/all/20260920193650.3373435-1-pasha.tatashin@soleen.com

  Pasha moved from a standalone KVM-only caretaker runtime to a specialized
  full Linux caretaker kernel. Using Linux directly avoids reimplementing and
  abstracting KVM execution logic in a separate environment and enables
  handling VMM-level VM exits (including select virtio exits such as pvpanic).
  To stay lightweight and isolated, the caretaker boots strictly within its
  assigned memory and physical CPUs—skipping PCI discovery and device access
  entirely and leaving the global KHO tree owned by the host machine owner.

* Supporting Upstream Series:
  - CPU Hotplug Performance Improvements: Standalone series accelerating CPU
    offlining and onlining to reduce physical CPU transfer blackout time
    between the host and caretaker domains:
    https://lore.kernel.org/all/20261019011446.834487-1-pasha.tatashin@soleen.com
  - Read-Only KHO: Introduces a read-only KHO mode for the caretaker kernel
    (currently awaiting upstream review):
    https://lore.kernel.org/all/20261025174017.3870481-1-pasha.tatashin@soleen.com
    Following discussions with Pratyush Yadav and Mike Rapoport, Pasha will
    continue enforcing that KHO-preserved memory outside the caretaker's own
    RAM is excluded from its direct map and mapped read-only on demand,
    preventing accidental KHO modification and avoiding unscalable direct-map
    / struct page exceptions. Read-only memfd changes (previously prototyped
    solely to exercise an end-to-end selftest) will stay separate while core
    read-only KHO is reviewed.
  - Early Session Freeze (LIVEUPDATE_SESSION_FREEZE): v4 is posted upstream:
    https://lore.kernel.org/all/20261026014948.162559-1-pasha.tatashin@soleen.com/

* Caretaker Handover Lifecycle & Session Pinning: Pasha walked through the
  caretaker lifecycle: a global session (e.g., session_lc) holds the
  caretaker's preserved physical CPUs and boot RAM memfd. On the outgoing
  path, the VMM suspends the VM, freezes its LUO session (resolving circular
  FD dependencies and committing metadata to KHO), and tells the caretaker to
  look up the session by name; on the incoming path after kexec, userspace
  stops the caretaker before retrieving and resuming the VM session. Pasha
  discussed adding an optional LIVEUPDATE_SESSION_FREEZE_COMMIT flag (avoiding
  "_IRREVOCABLE" in case an explicit LIVEUPDATE_CMD_SESSION_UNFREEZE ioctl is
  added later) so frozen sessions remain committed in LUO if the VMM exits.
  Pratyush Yadav, David Matlack, and Samiullah Khawaja noted that session
  protection is symmetric across outgoing and incoming paths: while the
  caretaker is actively using a session's preserved resources, the kernel
  should pin / hold a reference in LUO metadata so userspace cannot unfreeze,
  close, or prematurely retrieve and release backing memory (e.g., memfd
  pages) until the caretaker stops.

* Session Isolation vs. Global KHO Tree: Pratyush and David Matlack also
  asked whether the caretaker needs visibility into the global KHO radix tree
  (whose primary purpose is excluding preserved memory from early boot
  allocations, whereas the caretaker boots from dedicated RAM) or could be
  handed only its target LUO session payload(s) for stronger isolation. Pasha
  noted that the caretaker currently maps KHO nodes read-only only along the
  lookup path at retrieve time, and will evaluate whether KHO tree access is
  still needed if session physical addresses are passed directly.

----->o-----
Cross-Subsystem Versioning & Compatibility Strategy

* Expandable Serialization Header (kho_header_ser) v4: Tarun Sahu has v4 of
  the minimal expandable serialization header series ready to post, adding
  entry_size alongside feature flags per Pratyush's review feedback and
  updating existing KHO/LUO serialized structures across upstream Linux.
  Recording entry_size in the header is necessary for early-boot array
  deserialization (such as luo_session_header_ser entries), where callers do
  not inherently know the entry size written by the previous kernel.

* Header Naming Alignment: Tarun asked whether kho_header_ser should be
  renamed to include "feature" to distinguish it when prepended to
  kho_block_header_ser. Pasha and David Matlack agreed to keep kho_header_ser:
  every serialized structure starts with kho_header_ser, while KHO blocks
  naturally follow it with their block-specific kho_block_header_ser.

* Custom Preserve/Retrieve Arguments & Version UAPI: David Matlack is working
  on custom preserve/retrieve argument support alongside tmpfs preservation.
  Pasha suggested landing the serialization header series first and starting
  upstream discussion on the kernel version UAPI in the coming weeks.

----->o-----
Guest Memory (guest_memfd), KVM & Confidential VMs

* End-to-End KVM & Confidential VM PoC Series: Tarun Sahu prepared a combined
  PoC patch series to demonstrate the end-to-end preservation ABI and future
  extensibility for KVM maintainers, structured in layered stages with
  kselftests for each:
  - Non-confidential VM preservation (guest_memfd, KVM VM FD, and vCPU FD
    preservation + selftests).
  - Intel TDX preservation (feature header + selftests, thoroughly reviewed
    with Sagi Shahar).
  - AMD SEV-SNP and ARM CCA preservation (feature headers + selftests,
    prototyped/LLM-tested to illustrate cross-architecture ABI coverage and
    noted accordingly in the cover letter).

* Rebasing & Split Plan: Tarun is cleaning up the PoC series and rebasing it
  onto kho_header_ser v4. Once kho_header_ser lands in liveupdate/next, he
  will post the PoC (marked not-for-merge) to anchor ABI review, with
  standalone vCPU and guest_memfd preservation series prioritized next.

----->o-----
TDX Module & VM Preservation

* KVM PoC Integration & HKID Preservation: Sagi Shahar confirmed that TDX
  preservation is integrated into Tarun's combined KVM PoC patch set. Ongoing
  work is focused on resolving Intel TDX Host Key ID (HKID) preservation
  across kexec.

----->o-----
PCIe Persistence

* Merging PCI v10 & Sequencing for Linux 7.5: With Linux 7.4-rc1 released on
  November 1, liveupdate/next is now open for Linux 7.5. Rather than delaying
  David Matlack's reviewed PCI Live Update v10 series or posting a PCI v11
  that would require re-collecting Reviewed-by tags across the series, Pasha,
  David, and Tarun agreed on a two-step landing sequence:
  1. Pasha will merge PCI v10 into liveupdate/next immediately so it begins
     soaking in linux-next.
  2. Tarun will base kho_header_ser v4 on liveupdate/next and include a patch
     converting PCI's serialized structures (alongside KHO, LUO, and memfd)
     to kho_header_ser, requiring review only on that conversion patch.

----->o-----
VFIO Persistence

* VFIO Live Update v6 Posted: Vipin Sharma returned from leave and posted v6
  of the VFIO live update series (based on PCI v10). Moving beyond the LPC
  prototype (memmap + DSA), v6 uses preserved memfd as the DMA backing source
  in no-IOMMU mode and has been validated end-to-end across kexec on both
  Intel IGB and DSA devices. Community reviews on v6 are welcome.

* PCI Save State Dependency: To get v6 out for review without stacking another
  unmerged series, Vipin included temporary manual serialization of PCI save
  state into an allocated buffer. David Matlack noted that because the
  kernel's current pci_saved_state layout is code-driven and not ABI-stable
  across kernel versions, his PCI save state rework series must merge ahead
  of VFIO. David will review VFIO v6 while Vipin reviews the PCI save state
  rework series to accelerate landing it first.

----->o-----
IOMMU Persistence & LUO Core

* IOMMU Persistence v6 -> v7: Samiullah Khawaja received Reviewed-by tags
  from Baolu Lu on the Intel IOMMU driver, IOMMU core, and IOMMUFD changes in
  v6, and plans to post v7 soon.

* Preventing memfd Hole-Punching Hazards for IOMMU Mappings: Samiullah
  started an upstream discussion (mm/memfd: add F_SEAL_PUNCH_HOLE) to prevent
  a gap where userspace maps memfd pages into IOMMUFD and punches a hole
  (FALLOC_FL_PUNCH_HOLE) prior to memfd preservation—discarding pinned pages
  that existing seals do not block so they are missing after kexec. Per
  feedback from David Hildenbrand, rather than introducing a new seal UAPI,
  memfd will set a sticky flag whenever a hole is punched, and IOMMU preserve
  will reject memfds with that flag set (leaving standalone memfd preserve
  unchanged). Investigating this path also uncovered and fixed a bug in
  memfd_pin_folios().

* Hitless Replacement & IOTLB Conflicts: Upstream discussions continue on
  hitless IOMMU translation replacement across kexec and evaluating potential
  IOTLB conflicts.

----->o-----
Agenda Rotation for Next Meeting

* Deferred Topics First: Because the first seven agenda items filled the
  hour, Pasha will continue rotating the agenda so that the remaining topics—
  tmpfs File Preservation, KHO & Boot Memory (bootmem), PowerPC & LoongArch
  KHO Support, and Resource Accounting & Session Handover—are covered at the
  beginning of the next call.

----->o-----
Action Items & Next Steps

Pasha:
* Merge PCI Live Update v10 into liveupdate/next for Linux 7.5.
* Post the next revision of the early session freeze series incorporating
  caretaker session pinning / lifecycle updates.
* Evaluate whether the Linux caretaker still requires KHO tree access if
  session payload physical addresses are passed directly.
* Rotate the deferred topics (tmpfs, KHO/bootmem, PowerPC & LoongArch) to the
  top of the agenda for the next meeting.

Tarun:
* Post kho_header_ser v4 (with entry_size) rebased onto liveupdate/next,
  converting PCI v10 alongside existing KHO, LUO, and memfd structures.
* Clean up, rebase, and post the combined KVM + guest_memfd + confidential VM
  (TDX, SEV-SNP, ARM CCA) preservation PoC series once kho_header_ser is in
  liveupdate/next.

David M:
* Review Vipin's VFIO live update v6 series.
* Continue work on generic/custom LUO preserve & retrieve arguments alongside
  the next tmpfs preservation series.

Vipin:
* Review David Matlack's PCI save state rework series so VFIO preservation
  can rebase onto ABI-stable PCI save state structures.

Samiullah:
* Post IOMMU persistence v7 incorporating review feedback and tags.
* Implement the sticky memfd punch-hole tracking flag check for IOMMU
  preserve and continue hitless IOTLB replacement discussions.

Pratyush:
* Review Pasha's read-only KHO and updated early session freeze series, as
  well as Tarun's kho_header_ser v4 series.

Sagi:
* Continue working on TDX HKID preservation across kexec with Tarun's KVM/TDX
  PoC series.

The Group:
* Review Pasha's read-only KHO series and Vipin's VFIO live update v6 series
  on the mailing list.

----->o-----

Next meeting will be on Monday, November 16 at 8am PST (UTC-8), everybody is
welcome!

Join Here: https://meet.google.com/rjn-dmzu-hgq

Please let me know if you'd like to propose additional topics for
discussion, thank you!

Best regards,
Pasha
