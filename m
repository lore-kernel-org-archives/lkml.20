Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3E337C930
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788490052; cv=none; b=hkH1ThAhS7ZVYul4DTRGCv534lKG7DxzjwJdshbL+6U46komC7bTTrsj3XuhqJ1VPoaI4pFLVfYVcYXNimJXR2nUs/JVrY2aEH0K7f9wQR4+47RBeQUoIcK2dBnzTQNvyvAcjdI3sFST3L8Ko0JM1Pt/kDwrRr4TzwUlrRdZbgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788490052; c=relaxed/simple;
	bh=f3I2++Pmx/vytiLyovYrsjZla1y8Q+Vry1mf28ARdmI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mopcrVHhFroxwptMu7fUJ4zd/0J1qFHTQdrRlBH9oImzHjZXS7Ro9eoL8UVBBED0M7wT+lEu6CXasfH0FNk9WqefeQ4nFOZcshw29qsSVt9QKFXPrnCFYgCOU4HBXpH5ExPmCOtAf0OdHMMr6aukbtxySLRrW4kfVy3ACwoVqNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=FV56/iu9; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="FV56/iu9"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66c70f69d3fso455812d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1788490050; x=1789094850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxY6qhOONdJBthzGvWEGTMppcR7CBwrMwbeMuLpGO0o=;
        b=FV56/iu9E2h9sq2i6adgWFxhuogIXEohnXl2Uc3hdwkeBpdJvK7ynbQSuE0TShiiXU
         SzEVvtUvNUHcRNgeWP8O7c0ZtZqqC33xpITpjwsVaMgkiJYsWCypuQNFGLKTH4VPzEMl
         dO57dfXTJEvEiARIFCYu9F9cOVhMvg3fld9akNbOfo34dwgbBe6hNCu3ll9giUE0733z
         2XwKzp8M8QERs3BRbGVWEM78u0Ri2QYDO2OIT8jShXJein/b+B3g8Dw6ebIE0rqu+Abc
         4BOF0VAIdbDhVo+LGguQIecWxTFl2+IitK5f1DQ1KC59Ak/U765NchTQmAKdpL+IdBxa
         6+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788490050; x=1789094850;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxY6qhOONdJBthzGvWEGTMppcR7CBwrMwbeMuLpGO0o=;
        b=mvzrLsMq5rgcwkOmaR5LsR/LwTIaLYsQu2/RiDay1fGlj1GK0HosEKarnTsGYR3h2k
         C3qDHdfJpyaYmpweuBYYMhdw0SOLBabqkhzY0+M3/ucXm1byTBqAvDeJZV/jkhewkbnu
         RLFuzaix2zcnRi7Qdq4yW8FKVgXl7afvKTihlGrWuzRUHj4zN/cThd3ql0t9SpQg29RN
         FJLOXpsFXSvgRDcPb7gpCj6A5bRKVTZ9i5lMMBh+/nB96YCe2jbo8Pw0HfwoiDWeo41e
         +ubJkXVDDon5lhAsBRo2WHlU76yo9mSwByoINypHXXt35/hVsk9g/02CrPw8lTT2DgFG
         zuJw==
X-Forwarded-Encrypted: i=1; AKwUvBwHyyeN/vKsTNtlgtMsRsSqIp3n0tOpJaVWnsslRsBImGY7M7B3apw/LlelCYgOQIk9BtZ2HjMUt+nIW2A=@vger.kernel.org
X-Gm-Message-State: AFuF++nkDXocTpeicRhR1BVl0GAc2Z4bIgT/KmBcMvLJzH7WvvYWcFHO
	9K5+k2Oji8nTVFvVFDtsKhlLbbcD39O2hvAno9n0bmri0GYyzOEICcckFOT2ml11J9zzQ1mUusH
	OqPrw
X-Gm-Gg: AYBFou3WxsEaSnRbExQwHZj8gLc78UEx0ubfeqkrPTO4U09/mpGAXTmOkSlpDO4mtpG
	55V42Q6HhfGHspa1IbarsI48AxRR6ttv2xS89u9FKVSoyCVzO420rcC0UxOXvgg4rmpLe13PW2k
	MpO7lFTU9MyEDADG8YLs+dfz6WImXm3E/CAkNcPqpXcJmZDZdf35khZcZfxFsXmcP9W7nG9JVi1
	ckwzdLOW9pAhr1QTQJPhSevWY/+SLpV4RIxFm7h1fXjvoxmLCSPqI8e96JkS2HKh0NL8dj3xr+K
	YdEAsCxNvhw/6MqZYk3Gl/nRtjyxzOovw9Vl8G31C85gS7BYgUM71DpaAAK3+xCOXLexMUi6Y4I
	huXi1m+giZhh0GeP2+gydS5jBuVSf8x7Ko1wpo4Q0vHseH1b6fskPD1GheMV306WYm2if4E2Le1
	XtHV9IUzMO4Q+ricBqY7Erhm/vcf6u9FMuDZTDEokcPe6mkrPrtkGGbHtCy2t3P/UiVOa5rzLiy
	zFqTXVJO0lOOwPvBQv5hu+kvyet7lhn96eSL+762e3nclcSivVfPmMq2cX3AIrk822jG0Jf8eit
	sj/DVg==
X-Received: by 2002:a05:690e:1a1f:b0:66c:486c:aa1b with SMTP id 956f58d0204a3-66fb5aa022amr879870d50.38.1788490049588;
        Thu, 03 Sep 2026 19:47:29 -0700 (PDT)
Received: from soleen.c.googlers.com.com (53.47.86.34.bc.googleusercontent.com. [34.86.47.53])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149315127sm9475207b3.10.2026.09.03.19.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 19:47:28 -0700 (PDT)
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
Subject: [Hypervisor Live Update] Notes from August 24, 2026
Date: Thu,  3 Sep 2026 22:47:07 -0400
Message-ID: <20260904024724.3815033-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi everybody,

Here are the notes from our Hypervisor Live Update call held on August 24.
These notes are intended to bring those who could not attend up to speed
and to keep the momentum going between meetings.

----->o-----
LPC 2026 Proposals & Microconference Planning

* Status & Notifications: Review decisions and reply notifications have
  been sent out to all authors who submitted proposals to the Live Update
  Microconference. Attendees are requested to confirm their attendance and
  notify Pasha of any registration or travel issues for Prague.

* Session Timing & Format: The schedule is being finalized; time slots are
  expected to be 15–20 minutes total (including Q&A) given the large number
  of accepted topics. Presenters are encouraged to keep slide decks brief
  (2–3 slides) to maximize interactive discussion on technical hurdles and
  unblocking upstream progress.

* Orphaned VMs in KVM Track: Orphaned VM proposals were accepted into the
  KVM microconference, which takes place immediately prior to the Live
  Update track. Attendees are encouraged to participate in both tracks for
  comprehensive live update coverage.

----->o-----
PCIe Persistence

* Landing Plan: The PCIe Live Update series will be merged into the Live
  Update tree (liveupdate/next) right after the Linux 7.3 merge window
  closes, targeting Linux 7.4. David Matlack collected additional Reviewed-by
  tags from Samiullah Khawaja and Pranjal Shrivastava.

* Upstream Review: David followed up with Bjorn Helgaas to confirm the
  landing plan and request his Acked-by. If no reply is received by the end
  of the week, David will reach out internally.

* Structure Versioning: Cross-subsystem data structure versioning will be
  addressed as an independent follow-up rather than holding up the current
  PCI series.

----->o-----
VFIO Persistence

* VFIO v6 Status: Vipin Sharma was delayed due to personal commitments
  (relocating) and plans to post the v6 series next week.

* Subsystem Landing Path: Following consultation with Alex Williamson, it
  was confirmed that VFIO changes will go through the VFIO tree, using
  immutable branches for dependencies that touch core Live Update or core
  PCI.

* End-to-End Demonstration Strategy: Alex noted that because live update is
  marked experimental, seeing a working end-to-end demonstration would help
  build confidence and expedite reviews.

* No-IOMMU PoC: The current VFIO series performs a reset during freeze and
  does not yet preserve virtual config space or PCI restore state. In
  addition, full VFIO device retrieval post-kexec requires IOMMUFD support.
  Because IOMMUFD recently gained an upstream "no-IOMMU" mode, Vipin will
  build a working end-to-end proof of concept demonstrating continuous DMA
  across kexec on a separate repository branch, while posting the v6 series
  upstream.

----->o-----
IOMMU Persistence & LUO

* IOMMU v5 Status: Samiullah Khawaja is preparing v5 to incorporate review
  feedback regarding device removal, rescan, and rediscovery handling.

* Device Retrieval RFC: The Phase 2 implementation for device retrieval via
  IOMMUFD is functional on GitHub and will be posted as an RFC series
  shortly to begin upstream review.

* LUO Core v3: Samiullah posted v3 of the incoming and outgoing session
  management series (get_incoming / get_outgoing), including updated
  in-tree documentation.

----->o-----
PowerPC KHO Support

* RFC Patch Series: Sourabh Jain posted an RFC series enabling KHO on the
  PowerPC architecture.

* Memory Reservation Ordering: On PowerPC, Kdump memory reservation happens
  very early in arch code, whereas scratch memory reservation occurs later
  from generic code (start_kernel -> mm init). On the PowerPC Hash MMU,
  the crash kernel must reside entirely in low memory (below 4GB), which
  exhausts low memory and causes subsequent scratch memory reservation to
  fail. Consequently, the current RFC disables crash dump support when KHO is
  enabled.

* Use Cases & Roadmap: Pasha noted that cloud hypervisor live update targets
  often do not configure Kdump or use firmware-assisted dump (FADump),
  making the initial series without concurrent Kdump sufficient as a baseline.
  Sourabh emphasized that enterprise environments will ultimately require
  both crash dumping (via high memory reservation on Radix MMU or FADump)
  and KHO to function together. Pasha will review the RFC patches.

----->o-----
Guest Memory (guest_memfd) & Compatibility Strategy

* Backward Compatibility Concerns: In upstream reviews of guest_memfd
  preservation, Sean Christopherson raised strong objections to merging KVM
  preservation without a clear backward compatibility plan (specifically for
  kernel rollbacks, where an older kernel must deserialize state preserved
  by a newer kernel). Sean cited Intel VMCS AR bytes handled via microcode
  as an example of maintaining architectural compatibility without breaking
  software contracts.

* Alignment & Roadmap: While Linux historically guarantees UAPI stability
  rather than in-kernel ABI stability, Sean is treating backward compatibility
  as a prerequisite for merging KVM changes. He also requested a clear
  roadmap for KVM state preservation (clarifying why VM file descriptors and
  VM type are preserved alongside guest_memfd) to ensure serialization
  structures are extensible upfront.

* Unified Versioning Proposal: Samiullah suggested using extensible structures
  with capability flags to decouple serialized formats from internal kernel
  layouts. David Matlack noted that Logan plans to post an upstream RFC thread
  proposing a unified versioning and backward compatibility model across
  subsystems (KVM, VFIO, PCI). David will invite Logan to present this model
  at our next biweekly meeting, and Sean will also be invited to align before
  LPC.

----->o-----
TDX Model Preservation

* Proof of Concept: Sagi Shahar demonstrated successful TDX model
  preservation across kexec: running a VM, executing a live update kexec,
  and subsequently launching and running a TD VM on the new kernel. Code
  cleanup is underway to share with the group.

----->o-----
Orphaned VMs & Development Environment

* Multi-Architecture: Pasha presented updated results
  from the Orphaned VM prototype
  (https://github.com/soleen/orphanvm), showing uninterrupted execution
  across kexec on ARM, Intel (Simics emulation), and AMD (QEMU emulation).

* Continuous Workload Results: A guest workload continuously writes to a
  2MB page while the host monitors write throughput across kexec:
  - ARM: ~3,715 loops/sec baseline -> ~5,000 loops/sec during kexec (throughput
    increases during reboot because host interrupts are quieted) -> ~4,700
    loops/sec after resuming under the new kernel.
  - Intel and AMD showed similar uninterrupted progress across reboot.

* Modular Architecture for LPC: Pasha will present an architectural breakdown
  at LPC to divide Orphaned VMs into reviewable upstream components (e.g.,
  separating physical core preservation from vCPU file descriptor
  preservation, an in-kernel caretaker thread, and suspending vCPUs when
  physical cores are not preserved).

* Emulated Devices: Addressing Tarun's analysis showing ~52 misconfiguration
  VM exits/sec from emulated devices during live update, Pasha clarified that
  emulated devices requiring host VMM MMIO handling are intentionally not
  supported in the initial Orphaned VM architecture; hardware offload (e.g.,
  smartNIC/accelerator) may be explored in the future.

* Repository Access: Pasha will send David Matlack an invitation to the
  private development repository.

----->o-----
Action Items & Next Steps

Pasha:
* Review Sourabh's PowerPC KHO RFC patches.
* Send David Matlack an invite to the orphanvm repository.
* Finalize the LPC Live Update microconference schedule and session timings.

David M:
* Follow up internally with Bjorn Helgaas on PCI v8 if no reply by end of week.
* Coordinate with Logan regarding the upstream versioning discussion thread
  and invite him to present at the next biweekly meeting.

Vipin:
* Build an end-to-end working demo of VFIO live update using IOMMUFD no-IOMMU
  mode on a separate branch.
* Submit VFIO v6 series upstream.

Samiullah:
* Post IOMMU v5 addressing device removal and rediscovery feedback.
* Submit Phase 2 device retrieval RFC series based on IOMMUFD.

Sourabh:
* Continue discussions on the PowerPC KHO RFC regarding memory ordering
  trade-offs and MMU constraints.

Logan:
* Post an upstream RFC/discussion thread on cross-subsystem versioning and
  backward compatibility.
* Present the proposed versioning model at the next biweekly meeting.

Tarun:
* Continue upstream alignment on guest_memfd and KVM preservation with
  Sean Christopherson.

Sagi:
* Clean up TDX model preservation code and share with the team.

The Group:
* Confirm LPC attendance and notify Pasha of any registration or travel
  issues.

----->o-----

Please note that there will be NO meeting on September 7 due to the US
Public Holiday (Labor Day). The next meeting will be on Monday,
September 21 at 8am PDT (UTC-7), everybody is welcome!

Join Here: https://meet.google.com/rjn-dmzu-hgq

Please let me know if you'd like to propose additional topics for
discussion, thank you!

Best regards,
Pasha
