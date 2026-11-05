Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902172;
	b=0WXSwdAcels2mLp4eluJneE7cNVg843KhlDv86aX7r2UAqazra/2hA8V1oLWX7heyeKi
	 C0j+DAKB+Q0NpDtR/kwDlVIdnic7V/K4D8j0UgO3gTT6B02dYD/ynjpVmFXuKuGILc9rr
	 5/S/xWM7TaTDAvCQEi/Q4FsP1VzOIWVg80Hxz8rjgINrqkk+Vr0xQ7lmw2SbomoV1534H
	 ihEbSjS3IgwqVRbjSrlX9wNxcQx0FKLGL2xNY30R5vWaVx6Fhux69XyRpMjUJ+fz7BtfG
	 u0AAYutO6MP6VvxdZzDVNSUs8S3NlV+DEUTLjFAWBEVGajLca9aN5bVF4DlhwAcMcEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Subject:Date:Message-Id:X-Mailer:
	 Reply-To:MIME-Version:Content-Transfer-Encoding;
	bh=5GceAxTvgoZumHd09mtdaNlgWlGDTHfFRc56YtOlEpg=;
	b=t3ZCxsvyWJintoGQftpHM+OP5gWLC+HsNaMS65B6Huv82bizU1Daa5w0pBkmz9hkiIPg
	 YpitVKADojjpoozrYfSZ6iVpdYCXe16A+sM7vfO2/hJ8OeuWhmQYbn/4F2DZ4s7SNlRlH
	 tP6F48/HkgvncZF0pclgbxtiWGY3EciFZbZyu8o+7snwTPiXuXR4zPpK8B6uh7CHW3iPv
	 ajxMOXnX9ms204v9jVFLv8bhvFXFR2ac/9Fj/juVCaGaRECkTjNkdV7gS/0X7bYTny0qb
	 QXsTUZvZTobQzbof0vxn8CGFBobJaff4YJlAAY82JAH1/5HsPdRLxoaIMG/mG3cxQCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U7WahdAo;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CB7606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20CB7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U7WahdAo
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so34111b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793902171; x=1794506971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5GceAxTvgoZumHd09mtdaNlgWlGDTHfFRc56YtOlEpg=;
        b=U7WahdAo+LA7Aq7qSeMehkEnvfKNbF+6fWy4qIOQ+vP9oC7vEn2tBC75c3C3JflwUF
         zMq5v1OojcKx5SEi7X8weJIlYXANhizZtZm3E9+Pduh60tdUQlR46iW+e2qKGRSDqpbA
         ZwCGLPYl/7vM2RVVVXZx7Kd/37/GVw6LgWi5vhcQHn7ZzbDgDjT7EzL+lkT52Ud9oDnt
         0KiLnj4/1qW3We+kMu11ouHGKBbYpjBVBjkLfEvhpuhVlkrXuNv6aUFQ8aWyO4TXCMZO
         YJ4BFpWrypLOvsa8RxuAnCHlhZDKmZzJEMEi5d9CVG7HtxJP+AW55PFOucfKL5eHpNUX
         jdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902171; x=1794506971;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5GceAxTvgoZumHd09mtdaNlgWlGDTHfFRc56YtOlEpg=;
        b=E6k2T+6BUfZSF0L9hJuzQeiu2qukhfPaJncZ/JEwxlIfbKe7pseNTwMbblHPQGrLj+
         QwEWxgPFhT1Uh22rEsqhRjzblrFW7VziE+ORtbC0bsadRIc8czgPoLuYxuosBBsdtbXX
         8dD9UhpAs5MoW3em+Ku56cUyhkJmn57FdgW1vwfma6X4f4F4/znDLKYBZjuV2Qc3CCMb
         7T6EoXhGkm7f44RqfWFXlo5w7d3NTC3DXcd/NJmiXb9tmUvPKYzAdEMQO/njyrqrVLsB
         W43oCICHs65xEl4NBffWEGm5ycVecC/AoEQy/E4wgj4K7W7xU9wwcDP5A/qHaISCW7sC
         gQwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvvsTT8tpyv6ddrlCuzwqy/I/PvkJPL8kCwYnH3BM8odui96FXLZjn/XsJiuttt3tetC7Q2gWrGcehjkI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cjKhgp7Gv2fqrUy4wWy9/FAZ0XiIVBcc1h+zGOo+481OAHF71
	wLAY9nNaqYCGbMw5TIdfai6WXrm6NVpidXPwktmjI3LuhoPKO30K51xJ
X-Gm-Gg: AYBFou1eUADR8Kn/5/69H0SwqyCEUvL83xlV34s77fMhJqiqsEIa9UGT9JelZzWbfyR
	q0O9fysxDQtujo0DOtQjjHEOp+oU4Uu9P54g2NfjXe8U4/DVoLTYH+5atgBxyvO7EeBtd6R7Ymr
	fZY0oi2A08NtRy62E2UQnge2zwtxt2l5as7rbgTlbRqvIjoGpyrbXZgAF4vsmMVpcHc48h3jSCF
	4rqr9nK0grx/jpbsSsHGI6kHUcnH373uxY7Al0Ky+yq+zQ1DdwTtzNQx2wg+U5GG7sLqLVIzwbq
	TF04l0E41gyzWCGM5Dk+xfjJX6A97ByP3E+aVZdp6s5IQHjjhmo67nPSv+gqN63M6FxvjX3Yxsy
	dhJA1H8VVZLlzqtCundGV40Hfog9Dfvdxraf3Bj7jKOqozcSTIOcFeMs6LCsbSghT4BxwBVM/RS
	iajuXRYiuA81DZ4+keQ7ZfRiD2ZFmEpsJVww4okEO3QSXF8YJLbGkIvlSya201CwRZGbwsaqVAD
	q8MJElx8SmtJ2RnZC5ssNQK5BNSHIUzOVFawPksM9iiTmfRt6sqgB/t6cOWMYy3E0mHbhB+rkQL
	vKpEu90P/bEczTRxIAPYhCz+zGysnMbyi8bKssrJxSIKI62Kn5o+NyeNDC8FUaTwEaMusmAPSBE
	OAIQLDp2Ue65neHmXDkiIpZWkbiGh5ZqEEA==
X-Received: by 2002:a05:6a21:8984:b0:3e2:95fb:8d03 with SMTP id adf61e73a8af0-3ebb2a58cbamr262300637.69.1793902171182;
        Thu, 05 Nov 2026 10:09:31 -0800 (PST)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb467f798esm2497170a12.10.2026.11.05.10.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:09:30 -0800 (PST)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 1/1] Documentation: hyperv: Update docs for PCI pass-thru device support
Date: Thu,  5 Nov 2026 10:09:22 -0800
Message-Id: <20261105180922.69256-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
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

Add a section to the documentation describing the IRQ domain and IRQ chip
hierarchy that is created for virtual PCI devices, including the
differences on x86 and arm64, and the reasons for those differences.

In the context of the IRQ domain and chip hierarchies, describe how the
CPU selected for effective affinity is spread across CPUs in the affinity
masks. Again, account for the differences in x86 and arm64.

Finally, rework existing text on how MSI messages are composed. Provide
an expanded section on the overall approach that Hyper-V takes to MSI
messages. The section provides more context on the handling of MSI messages
in the Hyper-V vPCI driver, and why it is structured the way it is.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
This doc update assumes that the patch to implement effective
affinity spreading for arm64 SPIs [1] is accepted.

[1] https://lore.kernel.org/linux-hyperv/20261101021928.52649-1-mhklinux@outlook.com/

Changes in v2:
* Fixed typos [Daniel Pereira]
* Fixed incorrect function pointer name that should have been
  .irq_write_msi_msg [Daniel Pereira]
* Clarified that only MSI-X table writes are not trapped to the
  hypervisor. MSI entries are in PCI config space, so are trapped.
  [Naman Jain]
* Corrected statement that all affinity changes result in a new
  MSI message being composed and written. No new MSI message is
  needed. An affinity change is communicated to Hyper-V via other
  mechanisms. [Naman Jain]

 Documentation/virt/hyperv/vpci.rst | 164 +++++++++++++++++++++++++----
 1 file changed, 145 insertions(+), 19 deletions(-)

diff --git a/Documentation/virt/hyperv/vpci.rst b/Documentation/virt/hyperv/vpci.rst
index b65b2126ede3..5355871c8c04 100644
--- a/Documentation/virt/hyperv/vpci.rst
+++ b/Documentation/virt/hyperv/vpci.rst
@@ -97,8 +97,10 @@ config space for the device.  This MMIO range is communicated
 to the Hyper-V host over the VMBus channel as part of telling
 the host that the device is ready to enter d0.  See
 hv_pci_enter_d0().  When the guest subsequently accesses this
-MMIO range, the Hyper-V host intercepts the accesses and maps
-them to the physical device PCI config space.
+MMIO range, the Hyper-V host traps the accesses and maps
+them to the physical device PCI config space. In CoCo VMs,
+an explicit hypercall must be used to access PCI config space
+rather than depending on a trap to the hypervisor.
 
 hv_pci_probe() also gets BAR information for the device from
 the Hyper-V host, and uses this information to allocate MMIO
@@ -159,6 +161,62 @@ ejections happen at inopportune times. Care must be taken when
 modifying this code to prevent re-introducing such problems.
 See comments in the code.
 
+IRQ Domains and Chips
+---------------------
+Early in the process of setting up a new vPCI device,
+hv_pci_probe() calls hv_pcie_init_irq_domain() to create an MSI
+parent IRQ domain for the device. This domain has IRQ chip functions
+to interact with Hyper-V to compose an MSI message and to mask
+and unmask interrupts. It becomes the parent domain for the
+per-device IRQ domain created by the normal Linux driver for the
+device when it sets up its IRQs -- e.g., the NVMe driver function
+nvme_setup_irqs() calling pci_alloc_irq_vectors_affinity().
+
+This MSI parent domain is parented to what the Hyper-V vPCI
+driver calls the "root" IRQ domain. On x86, the root IRQ domain
+is the VECTOR domain for the APIC. On arm64, the root IRQ domain
+is a domain created by the Hyper-V vPCI driver to overlay the
+"irqchip@<paddr>" domain created by the GICv3 driver when it
+initializes the virtual GICv3 hardware provided to the guest
+by Hyper-V. This overlay domain is named "hv_vpci_arm64", and it
+handles the limitation that Hyper-V provides only a GICv3 to the
+guest, not a GICv3 with ITS. As such, there are no LPIs available
+in the guest, so it must use SPIs for vPCI devices. While this
+is valid in the arm64 architecture, it is atypical. The Hyper-V
+vPCI driver glues things together by having hv_vpci_arm64
+allocate and manage the SPIs.
+
+**x86 IRQ domains and chips**
+
++-----------------------+-----------------------+------------------------------------------------------+
+| Domain Name           | Chip Name             | Notes                                                |
++=======================+=======================+======================================================+
+| VECTOR                | APIC                  | Spreads effective affinity                           |
++-----------------------+-----------------------+------------------------------------------------------+
+| <vPCI device GUID>    | Hyper-V PCIe MSI      | MSI parent. Per vPCI device. Created in              |
+|                       |                       | hv_pcie_init_irq_domain().                           |
++-----------------------+-----------------------+------------------------------------------------------+
+| HV-PCI-MSIX-<PCIaddr> | HV-PCI-MSIX-<PCIaddr> | Per vPCI device. Created when driver sets up IRQs.   |
++-----------------------+-----------------------+------------------------------------------------------+
+
+
+**arm64 IRQ domains and chips**
+
++-----------------------+-----------------------+------------------------------------------------------+
+| Domain Name           | Chip Name             | Notes                                                |
++=======================+=======================+======================================================+
+| irqchip@<paddr>       | GICv3                 | Picks 1st CPU for effective affinity.                |
+|                       |                       | Created in gic_init_bases().                         |
++-----------------------+-----------------------+------------------------------------------------------+
+| hv_vpci_arm64         | MSI                   | Spreads effective affinity. Created in               |
+|                       |                       | hv_pci_irqchip_init().                               |
++-----------------------+-----------------------+------------------------------------------------------+
+| <vPCI device GUID>    | Hyper-V PCIe MSI      | MSI parent. Per vPCI device. Created in              |
+|                       |                       | hv_pcie_init_irq_domain().                           |
++-----------------------+-----------------------+------------------------------------------------------+
+| HV-PCI-MSIX-<PCIaddr> | HV-PCI-MSIX-<PCIaddr> | Per vPCI device. Created when driver sets up IRQs.   |
++-----------------------+-----------------------+------------------------------------------------------+
+
 Interrupt Assignment
 --------------------
 The Hyper-V virtual PCI driver supports vPCI devices using
@@ -166,7 +224,7 @@ MSI, multi-MSI, or MSI-X.  Assigning the guest vCPU that will
 receive the interrupt for a particular MSI or MSI-X message is
 complex because of the way the Linux setup of IRQs maps onto
 the Hyper-V interfaces.  For the single-MSI and MSI-X cases,
-Linux calls hv_compse_msi_msg() twice, with the first call
+Linux calls hv_compose_msi_msg() twice, with the first call
 containing a dummy vCPU and the second call containing the
 real vCPU.  Furthermore, hv_irq_unmask() is finally called
 (on x86) or the GICD registers are set (on arm64) to specify
@@ -179,22 +237,8 @@ interrupts on a single CPU, causing a performance bottleneck.
 See details about how this is resolved in the extensive
 comment above the function hv_compose_msi_req_get_cpu().
 
-The Hyper-V virtual PCI driver implements the
-irq_chip.irq_compose_msi_msg function as hv_compose_msi_msg().
-Unfortunately, on Hyper-V the implementation requires sending
-a VMBus message to the Hyper-V host and awaiting an interrupt
-indicating receipt of a reply message.  Since
-irq_chip.irq_compose_msi_msg can be called with IRQ locks
-held, it doesn't work to do the normal sleep until awakened by
-the interrupt. Instead hv_compose_msi_msg() must send the
-VMBus message, and then poll for the completion message. As
-further complexity, the vPCI device could be ejected/rescinded
-while the polling is in progress, so this scenario must be
-detected as well.  See comments in the code regarding this
-very tricky area.
-
-Most of the code in the Hyper-V virtual PCI driver (pci-
-hyperv.c) applies to Hyper-V and Linux guests running on x86
+Most of the code in the Hyper-V virtual PCI driver
+applies to Hyper-V and Linux guests running on x86
 and on arm64 architectures.  But there are differences in how
 interrupt assignments are managed.  On x86, the Hyper-V
 virtual PCI driver in the guest must make a hypercall to tell
@@ -223,6 +267,88 @@ using all the vectors on a CPU doesn't happen. Since such a
 problem is only a theoretical concern rather than a practical
 concern, it has been left unaddressed.
 
+Effective Affinity Interrupt Spreading
+--------------------------------------
+For the APIC and GICv3 interrupt controllers, Linux must select a
+single CPU from the affinity mask to be the effective affinity CPU.
+While Linux is free to choose any CPU in the mask, a fixed algorithm,
+such as always choosing the first CPU, can be problematic in
+configurations with multiple identical devices (such as NVMe
+controllers). Each device has the same set of affinity masks, so
+the same CPU gets chosen for all the devices. Better performance
+is usually achieved for multiple devices by spreading the assignment
+among the CPUs in the affinity mask. No one CPU is overloaded
+and interrupts from multiple devices can be processed in parallel.
+
+On x86, the VECTOR domain and APIC IRQ chip do the spreading by
+tracking the number of IRQs assigned to each CPU, and choosing
+the CPU in the affinity mask that has the fewest assignments.
+Because Hyper-V vPCI device IRQs eventually parent to VECTOR,
+the spreading it does accrues to the IRQs for Hyper-V vPCI devices.
+
+On arm64, the "ITS" IRQ chip for the GICv3+ITS does the same kind
+of spreading for LPI interrupts. But IRQs for vPCI devices on
+arm64 use SPIs and are parented to the "GICv3" IRQ chip, which always
+chooses the first CPU in the affinity mask as the effective affinity.
+That CPU can get overloaded in handling interrupts. So on arm64,
+the hv_vpci_arm64 IRQ domain and associated IRQ chip provide the
+spreading functionality. They track the SPIs assigned to each CPU
+and choose the least-loaded CPU as the effective affinity. Then
+the parent IRQ chip (GICv3) is invoked to actually set the effective
+affinity in the virtual GICv3 hardware.
+
+MSI Messages
+------------
+In a typical guest on KVM, the VMM traps guest writes to a vPCI
+device's MSI/MSI-X registers/tables. The guest writes a virtual
+message (with a guest APIC address and a guest vector), and VMM
+emulation translates the message to program the physical device and
+physical device interrupt remapping (IR) tables on the guest's
+behalf. The guest never sees or handles the host-level MSI message.
+
+Hyper-V takes a different approach in which writes to MSI-X table
+entries are not trapped. The guest writes the device's MSI-X table
+directly with a host-valid MSI message. By contrast, MSI entries
+are in PCI config space, so writes to MSI entries are trapped to
+Hyper-V (or are done with an explicit hypercall in CoCo VMs),
+which allows for the possibility of using virtual messages. But
+for simplicity, Hyper-V treats the two cases the same and requires
+a host-valid message for both MSI and MSI-X.
+
+The physical IOMMU and its remapping table are owned by the host,
+so the guest must ask the host for the proper message. The
+"asking" is done by the .irq_compose_msi_msg function for the
+"Hyper-V PCIe MSI" chip, which is hv_compose_msi_msg(). The
+implementation requires sending a VMBus message to the Hyper-V host
+and awaiting an interrupt indicating receipt of a reply message.
+Since .irq_compose_msi_msg can be called with IRQ spin locks held, it
+doesn't work to do the normal sleep until awakened by the interrupt.
+Instead hv_compose_msi_msg() must send the VMBus message, and
+poll for the completion message. As further complexity, the vPCI
+device could be ejected/rescinded while the polling is in progress,
+so this scenario must be detected as well. See comments in the code
+regarding this very tricky area. A synchronous hypercall to get the
+MSI message would be a much nicer interface, but the code makes do
+with what's available.
+
+Once the host-valid MSI message is obtained, the guest must treat it
+as a black box that the guest does not interpret or modify. The only
+valid guest action is to write it to the MSI/MSI-X registers/tables
+using the .irq_write_msi_msg function on the HV-PCI-MSIX-<PCIaddr>
+chip. That function is pci_msi_domain_write_msg(), which calls
+__pci_write_msi_msg().
+
+Changing the affinity of an MSI or MSI-X IRQ does not require a
+new MSI message. The new effective affinity CPU is communicated to
+Hyper-V via hv_irq_retarget_interrupt() as called by hv_irq_unmask()
+on x86, or by the GICv3 gic_set_affinity() function writing the
+emulated GICD registers on arm64. Because a new MSI message is
+not needed, the default msi_domain_set_affinity() function is
+not used on the HV-PCI-MSIX-<PCIaddr> chip. Instead, the
+.irq_set_affinity function is set to irq_chip_set_affinity_parent()
+by hv_pcie_init_dev_msi_info() when the per-PCI-device IRQ domain
+is created.
+
 DMA
 ---
 By default, Hyper-V pins all guest VM memory in the host
-- 
2.25.1

