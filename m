Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445488;
	b=OI49J/ETl9FHR96/RlulqiEUDDYftuNArPmuRblvCSVEkG19JpurdVlEyLkvmt8959Ha
	 KdGnE3El8xKi4aKTT/3900xS9lrl1w/oJ0+fEEOjPqKdCC8LtVpJqxTD0jH1y0sHKYGGe
	 BMy/eG+r6IzYBCGVYRnXU1CNuqjsgYBrKJi6dYFKNFP5mq994Bwkas1SCHJq4FlVAD0uO
	 WRNhboqqWC2judlUFMhpIGx4u+so3tXu6l+W5qH5nY1WVX3bcWmPhummfDDRKXC0zHlrD
	 JTaLw+7xoxwUDZjTdfB9kmbnk1U93MD+GCcIR40/hCUpeRFldjuQy59sfVDxDbpiezw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+8+r+UgUrY8DXLFgmEvSoqHNnXfv9U//CDOtL9HGeYU=;
	b=m/VmeT/xs1mjKOf2hnanMoP+j3ZpCCDcbixhioJh+MKZgqH9Ze2BugUPV+CBn9T/6L1U
	 9zDDvC4lp5VbtszCJ43+rH867+QU52zYbNoNFzDXpHYaANoPvTF0eUWB9JMMOI10h5sHw
	 jMGGaLsS5QtDVuJZ6G/Ax9MGe7nsHR04IteQjGz8SVEQyzj5jEcvL9fHbh/s9LJBXQ50H
	 uAYwdOzSDCPPSUZPEzPYvoM2+3SHEoB9OMNpvWkSGex7pR2B8vCLp17WqGGHSynun0HlE
	 /7eOAD3YCSz+Rf1pIXtnpMZKeiunJJKostFLby96hoy9cLx3E8URf17F+5D8spK9oyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="FxBua4/s";
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D94606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6D94606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FxBua4/s
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so2950648a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792445487; x=1793050287; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8+r+UgUrY8DXLFgmEvSoqHNnXfv9U//CDOtL9HGeYU=;
        b=FxBua4/sC2oI6uxaytrezFsmEKgAUwfY4cUOp6d3l+MBVxLe9m6phtMDlBx38MB8gW
         NuxaWOaC5XODWKRIL/7EBfx5RHkdrdwfi03rXZULj5WxQqhNawBtfmmn62op+NWXtKnj
         3+FJgRdOFREBpR9/4YI6W+O7nYLz/cHj1UcgnmiGJmtXIfnM9jM0uyGe2Yfu3qg49CKt
         EmcGabXWNomie1cKOaAPgOPG2bd+ThnE8lXs7d1W3phnhrSGeU8Jwz81oPN6PdNezlNH
         uR2clLXofzm6l93+0fOyzxgy4IOvn7CPT7IcqmqP1V4FadVixYwv4oglVNufmur+gA/C
         GbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445487; x=1793050287;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8+r+UgUrY8DXLFgmEvSoqHNnXfv9U//CDOtL9HGeYU=;
        b=RsaYCMQcAQt+Got1vqVcJsKzc+eCB09d4e8i8Uv7hYcoaYe2a5ggdIiOcznyt6R6eS
         uDeBBy0Nuf9vvDRPSWNzpE4QpUpYUpPQ/bpXhDM0gBz08fx/Y6AqU1YG+5gavywzys/Y
         xhtKrrBl8gVtdDtnOzyqzj0ppXcjX02F9QB0X1OSgq5Y3a635H+Egk49PXKaULdVcnDb
         baTKvdJ+C/00DS1Q2Wt0HE9h6FrnDQOcB96cWwwtxnUE82aehrRGJlI0e1UpCxPb5Yzr
         /jOQlQ2oEvhrEyocsqO6+Sa3bq+tqmBNR8xWiv9xCQgJtYbi+4Hm3TDtRavHbWbYRF8J
         JHpw==
X-Forwarded-Encrypted: i=1; AKwUvBzu4Fukco7no5Wzq/oOwxCYfHcZmghCQNECRlkxLeuP3naTQVmRstU7HrLzgk6896pvsMXQ3ULWuFWmaRs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSObCTjQFh0PjXsphhT0QdLE5yRC5n8vdx5V3SGHtdwvqhM2RT
	VTAqvAyrDyEybgQR3BrWO8oo0OkWr+NthA+OJLG6kPA9hLaaPDbhLzaCIDXqI7tkDzc7qFIM/6j
	O+YUVPt49ysCgyw==
X-Received: from pglk6-n1.prod.google.com ([2002:a05:6a02:6b86:10b0:cc7:dd4c:a852])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:ac44:b0:3e2:1656:b7c9 with SMTP id adf61e73a8af0-3e226401953mr7453690637.66.1792445486484;
 Mon, 19 Oct 2026 14:31:26 -0700 (PDT)
Date: Mon, 19 Oct 2026 21:30:50 +0000
In-Reply-To: <20261019213054.3157159-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019213054.3157159-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261019213054.3157159-7-dmatlack@google.com>
Subject: [PATCH 06/10] PCI: liveupdate: Claim resources of incoming devices
 during scanning
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	David Matlack <dmatlack@google.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Logan Gunthorpe <logang@deltatee.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Claim the BARs and bridge windows of incoming preserved devices, as
programmed by the previous kernel, while scanning. Claim them for each
bus after its devices have been enumerated and pcibios_fixup_bus() has
run, and before the buses below it are scanned.

This ensures that the address ranges decoded by incoming devices are in
the resource tree before anything sizes or assigns resources,
regardless of how the host bridge driver sets up resources. Without
this, whether existing resources are claimed depends on the platform:
x86 claims them in pcibios_resource_survey(), pci_host_probe() and the
generic ACPI host bridge code only claim them if the host bridge has
preserve_config set, and some host bridge drivers (e.g. VMD) never
claim them.

Buses are scanned top-down and all bridges upstream of a preserved
device are also preserved, so the windows that contain the resources of
an incoming device are always claimed before the device's resources.
Outside of x86, bridge windows are not read from hardware during
scanning, so read them first if needed. Code that claims resources
later, such as pcibios_resource_survey() and pci_bus_claim_resources(),
skips resources that are already claimed.

Panic if claiming fails because something else has already claimed part
of the range decoded by an incoming device, since memory transactions
that still target the incoming device (e.g. P2PDMA, or MMIO from VMs
whose vCPUs keep running during kexec) may be corrupting it. Also panic
if a bridge window cannot be claimed for any other reason, e.g. because
it does not fit in the upstream window, since the bridge would keep
forwarding a range that the resource tree considers free, and the PCI
core could assign it to another device. Neither should ever happen,
since the previous kernel had the same resources claimed. A BAR that
fails for any other reason was never assigned an address (e.g. a ROM BAR
that the previous kernel left unassigned), so there is nothing to claim.

pci_liveupdate_claim_bus_resources() does nothing if the previous kernel
did not preserve any devices, so the only overhead outside of Live
Update is checking a flag under the PCI Live Update rwsem.

An alternative that was considered was setting preserve_config on host
bridges with incoming devices, which makes pci_host_probe() and the
generic ACPI code claim all existing resources. However, not all host
bridge drivers honor preserve_config, it is a firmware-provided policy
that applies to every device below the host bridge, and it would have
to be cleared once Live Update finishes.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 99 ++++++++++++++++++++++++++++++++++++++++
 drivers/pci/liveupdate.h |  5 ++
 drivers/pci/probe.c      |  8 ++++
 3 files changed, 112 insertions(+)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 72ad4fd00f7b..ac4525568818 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -184,6 +184,12 @@
  * The PCI core treats preserved devices differently than non-preserved devices.
  * This section enumerates those differences.
  *
+ *  * The PCI core claims the BARs and bridge windows of incoming preserved
+ *    devices, as programmed by the previous kernel, while scanning and before
+ *    any resources are sized or assigned. This ensures no other device is
+ *    assigned address space that an incoming device is still decoding, and
+ *    that the resources of incoming devices are never reassigned.
+ *
  *  * The PCI core adopts all ACS controls enabled on incoming preserved devices
  *    rather than assigning new ones. This ensures that TLPs are routed the same
  *    way after Live Update and ensures that IOMMU groups do not change. Note
@@ -1207,6 +1213,99 @@ int pci_liveupdate_read_bridge_windows(struct pci_dev *bridge)
 	return 0;
 }
 
+/*
+ * Check if the windows of @bridge have been read from hardware. Outside of x86
+ * that does not happen during scanning.
+ */
+static bool pci_liveupdate_windows_read(struct pci_dev *bridge)
+{
+	int i;
+
+	for (i = PCI_BRIDGE_RESOURCES; i <= PCI_BRIDGE_RESOURCE_END; i++) {
+		if (pci_resource_n(bridge, i)->flags)
+			return true;
+	}
+
+	return false;
+}
+
+static void pci_liveupdate_claim_resource(struct pci_dev *dev, int resno)
+{
+	struct resource *r = pci_resource_n(dev, resno);
+	int ret;
+
+	/*
+	 * Skip resources that are unused, already claimed, or disabled (e.g.
+	 * bridge windows that are turned off).
+	 */
+	if (!r->flags || resource_assigned(r) ||
+	    (r->flags & IORESOURCE_DISABLED))
+		return;
+
+	/*
+	 * Panic if something else has already claimed part of the range, since
+	 * memory transactions still targeting the device may be corrupting it.
+	 * Also panic if a bridge window cannot be claimed at all, since the
+	 * bridge forwards the range even though the resource tree considers it
+	 * free. BARs that fail for other reasons were never assigned an address
+	 * (e.g. a ROM BAR that was left unassigned), so there is nothing to
+	 * claim.
+	 */
+	ret = pci_claim_resource(dev, resno);
+	if (ret == -EBUSY || (ret && pci_resource_is_bridge_win(resno)))
+		panic("%s %s %pR: Failed to claim resource of device preserved across Live Update\n",
+		      pci_name(dev), pci_resource_name(dev, resno), r);
+}
+
+/**
+ * pci_liveupdate_claim_bus_resources() - Claim the resources of incoming
+ *                                        devices on a bus
+ * @bus: The PCI bus
+ *
+ * Claim the windows of the bridge upstream of @bus, if it is
+ * incoming-preserved, and the BARs of the incoming preserved devices on @bus,
+ * as programmed by the previous kernel. The PCI core calls this while
+ * scanning, after enumerating the devices on @bus and before scanning the
+ * buses below it, so that the resources of incoming devices are claimed before
+ * any resources are sized or assigned.
+ *
+ * Buses are scanned top-down and all bridges upstream of a preserved device
+ * are also preserved, so the windows that contain the resources of an incoming
+ * device are always claimed before the device's resources. Failing to claim a
+ * resource because something else has already claimed part of its range is
+ * fatal, since memory transactions still targeting the device may be
+ * corrupting it.
+ *
+ * This does nothing if the previous kernel did not preserve any devices.
+ */
+void pci_liveupdate_claim_bus_resources(struct pci_bus *bus)
+{
+	struct pci_dev *dev;
+	int i;
+
+	guard(rwsem_read)(&pci_liveupdate.rwsem);
+
+	if (!pci_liveupdate.had_incoming)
+		return;
+
+	if (bus->self && bus->self->liveupdate.incoming) {
+		if (!pci_liveupdate_windows_read(bus->self))
+			pci_read_bridge_bases(bus);
+
+		for (i = PCI_BRIDGE_RESOURCES;
+		     i <= PCI_BRIDGE_RESOURCE_END; i++)
+			pci_liveupdate_claim_resource(bus->self, i);
+	}
+
+	list_for_each_entry(dev, &bus->devices, bus_list) {
+		if (!dev->liveupdate.incoming)
+			continue;
+
+		for (i = 0; i < PCI_BRIDGE_RESOURCES; i++)
+			pci_liveupdate_claim_resource(dev, i);
+	}
+}
+
 /**
  * pci_liveupdate_is_incoming() - Check if a device is incoming-preserved
  * @dev: The PCI device to check
diff --git a/drivers/pci/liveupdate.h b/drivers/pci/liveupdate.h
index 4c4104025a7e..98d23e217308 100644
--- a/drivers/pci/liveupdate.h
+++ b/drivers/pci/liveupdate.h
@@ -22,6 +22,7 @@ bool pci_liveupdate_is_outgoing(struct pci_dev *dev);
 int pci_liveupdate_read_bar_masks(struct pci_dev *dev, unsigned int nr_bars,
 				  u32 *bar_masks, u32 *rom_mask);
 int pci_liveupdate_read_bridge_windows(struct pci_dev *bridge);
+void pci_liveupdate_claim_bus_resources(struct pci_bus *bus);
 #else
 static inline void pci_liveupdate_setup_device(struct pci_dev *dev)
 {
@@ -72,6 +73,10 @@ static inline int pci_liveupdate_read_bridge_windows(struct pci_dev *bridge)
 {
 	return -EINVAL;
 }
+
+static inline void pci_liveupdate_claim_bus_resources(struct pci_bus *bus)
+{
+}
 #endif
 
 #endif /* DRIVERS_PCI_LIVEUPDATE_H */
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 184d93aa8522..a53d0077a08b 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3155,6 +3155,14 @@ static unsigned int pci_scan_child_bus_extend(struct pci_bus *bus,
 		bus->is_added = 1;
 	}
 
+	/*
+	 * Claim the resources of devices preserved across Live Update before
+	 * scanning the buses below and before any resources are sized or
+	 * assigned, so that nothing else is assigned the address space they
+	 * decode.
+	 */
+	pci_liveupdate_claim_bus_resources(bus);
+
 	/*
 	 * Calculate how many hotplug bridges and normal bridges there
 	 * are on this bus. We will distribute the additional available
-- 
2.56.0.212.g129ede20d9-goog

