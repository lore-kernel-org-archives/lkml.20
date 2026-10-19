Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445491;
	b=nDMhLCXFSpD1Ovh54oz8KBMRgksJMBg3erAsMz2lwZ05hRtP8FHGjhE8lu2k7P1kz7sC
	 o+hSAd3l7Tn72FSCOFS7pvt1KprN2rh9eFQE6/XsaIkQ3m+0kxjvIDRTkE/EqmztK8QPf
	 vX6QV40BTyKXp8Ns8yTH3jWjC7DHqV6d+UJXQnOQUC4AJQS3Ba1B4cTF1pwuW8NlxwA/4
	 sQBV9JCQpc7OREcPeq6EIqdKPB1pTQifIWfE5LHxJyrkk9nbpNwW8CFPOUOBKCNsUphX4
	 aCBv+UhOIMpBcKI9x6EkWKpsGp+N6CaNrfeXfl62s/Rqf0PqXb/+5JGNax5n5ZjRbQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=rccGvdC4VDGY+kjlq/11HJtI0x1dTEfzAQPx1OmbdOk=;
	b=1AIdvATPp01S3BhA/oyeb029RSZz0UCIVXWosLP/JsUzB0jfUJQGEazqVSMva8v+KyRa
	 cI+EKHESCmx7FgknwPR7HyudgBS8ZSn9d0wBsDef28hpLw0alsLX6Pe0m46xUv3g388+J
	 vKFRZ7kbl/61SsdFAKKQRxxBHusACzEseSIRvgPWKmM3M7YzrhAChhyU1cGZq9Z/7egFr
	 MxH/B7cXsz2X2t69f23nu0QUM41vUf3fpTkYOIvbkBagnDVucxaYyIYwlovQ2cbR99Tx4
	 pXDpalBr2tNcleIYngphFNSjLjozcPYBcyoa4+Z5NO5FSIbnHgsGvUXgVLNRDr+P/nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="lCB/cTUN";
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D05160A3818
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D05160A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lCB/cTUN
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e987ec84afso23017175ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792445486; x=1793050286; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rccGvdC4VDGY+kjlq/11HJtI0x1dTEfzAQPx1OmbdOk=;
        b=lCB/cTUNtTm6nuMOARpJaIXSViDltOFlsZY5CpR1t80Lgxfrcb65X6T0N1e6nPpykp
         +so8acqBa57AwC5fiztUSP1b4afDLZb7q7INU+EbArTV96pjyqdyCx9nAYxJ4/YMn0Sf
         oWh5dSV/wUS2IvZRkH3GFsiRxIDvDkDhIrgM35mZqQC7qMpPBmIruMupt+oELCyhjE/q
         mtRDkQgyGRlAKLdhCbShfKitg/LjFGFptkYyFBwTs75UK52rjWVmkiIIFAlgWD4X7fbf
         Jl/EbAojnjlhRCI/iKWPXd/NnIv5+kycfRIk7CuiC3h0u4ux58GXgjAuAsRIkVmlifc8
         9J5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445486; x=1793050286;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rccGvdC4VDGY+kjlq/11HJtI0x1dTEfzAQPx1OmbdOk=;
        b=DPn1UoGwl6EyZO9Y2WzxwoEjMLeVHceODvsoKeqgoD3BjW+xsMzM6vhiRAT3Ah/NYv
         UdTwUBPMbxsLIKpQmdeTP1LDHzRGB5WhtT+CHXP6C7VEBiBQnUTEQA36DflJAY0bLSqt
         3eW+2WRQOUvK28ToZ/w1DAhGI2sKA4PlAFknsnaPzVKUh4ySVJ1K27ztgfhSqEtRGHIv
         kNobeTGwuFFjUDO11mPkfOWBplto99qS89IYA+ptIEy3iToTos9J5rUhEBKEuWCao8BG
         TA12UEQ8XEL/QQqd+uPSoHs1qBtMt+NDkVYGiDLsxDNRpbT+dYy8YUTeJcuSbcA+sOMZ
         hrFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzX3ROhnsbeGahrSfKImHFZ5qmEcsL6hz0LdeQdgEqcqLQKdxhIjZnAobFHCMTbAhqylXMKxhUOuxD5r20=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe7wBZktK8R7nW8GfovXImeIaN1fN//915YEqCUV6EHpK0Z/6n
	GkY08NwkIYWAG5IYjC4DiGSxb+9ZDFVPoH2XbpQ3xujyd3/ejLcGiSUv7LTKOlBekiOpGHkePf3
	JmV+AlqP+F+L78g==
X-Received: from plok11.prod.google.com ([2002:a17:903:3bcb:b0:2e9:5b68:4b7d])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e949:b0:2e2:d02d:a173 with SMTP id d9443c01a7336-2e9a6f59777mr77394715ad.49.1792445485578;
 Mon, 19 Oct 2026 14:31:25 -0700 (PDT)
Date: Mon, 19 Oct 2026 21:30:49 +0000
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
Message-ID: <20261019213054.3157159-6-dmatlack@google.com>
Subject: [PATCH 05/10] PCI: Skip programming bridge windows that are already programmed
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

Skip updating the window registers of a bridge in
pci_setup_bridge_io(), pci_setup_bridge_mmio(), and
pci_setup_bridge_mmio_pref() if they already contain the values being
written (ignoring the read-only low bits of the base and limit
registers).

pci_setup_bridge_io() and pci_setup_bridge_mmio_pref() temporarily
disable the I/O and prefetchable memory windows while updating them,
since the base and limit of each window are split across multiple
registers. This happens even if the window is not changing, e.g. for
every bridge whose windows were assigned by firmware and claimed, since
__pci_bus_assign_resources_one() calls pci_setup_bridge() on every
bridge that is not yet enabled during enumeration.
pci_setup_bridge_mmio() updates the memory window with a single write,
but skip unchanged writes there too for consistency.

This prevents disabling the windows of bridges preserved across Live
Update during enumeration, which would disrupt memory transactions
targeting preserved devices below them, such as P2PDMA from other
preserved devices, or MMIO from VMs whose vCPUs keep running during
kexec.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/setup-bus.c | 52 ++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index e8c94aa1d3c1..4bec76950f46 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -799,8 +799,8 @@ static void pci_setup_bridge_io(struct pci_dev *bridge)
 	struct pci_bus_region region;
 	unsigned long io_mask;
 	u8 io_base_lo, io_limit_lo;
-	u16 l;
-	u32 io_upper16;
+	u16 l, cur_l, l_mask;
+	u32 io_upper16, cur_io_upper16;
 
 	io_mask = PCI_IO_RANGE_MASK;
 	if (bridge->io_window_1k)
@@ -823,6 +823,18 @@ static void pci_setup_bridge_io(struct pci_dev *bridge)
 		io_upper16 = 0;
 		l = 0x00f0;
 	}
+
+	/*
+	 * Leave the I/O range alone if it is already programmed as needed,
+	 * rather than temporarily disabling it below. The low bits of the I/O
+	 * Base and Limit registers are read-only.
+	 */
+	pci_read_config_word(bridge, PCI_IO_BASE, &cur_l);
+	pci_read_config_dword(bridge, PCI_IO_BASE_UPPER16, &cur_io_upper16);
+	l_mask = ((u8)io_mask << 8) | (u8)io_mask;
+	if (!((cur_l ^ l) & l_mask) && cur_io_upper16 == io_upper16)
+		return;
+
 	/* Temporarily disable the I/O range before updating PCI_IO_BASE */
 	pci_write_config_dword(bridge, PCI_IO_BASE_UPPER16, 0x0000ffff);
 	/* Update lower 16 bits of I/O base/limit */
@@ -836,7 +848,7 @@ static void pci_setup_bridge_mmio(struct pci_dev *bridge)
 	struct resource *res;
 	const char *res_name;
 	struct pci_bus_region region;
-	u32 l;
+	u32 l, cur_l;
 
 	/* Set up the top and bottom of the PCI Memory segment for this bus */
 	res = &bridge->resource[PCI_BRIDGE_MEM_WINDOW];
@@ -849,6 +861,12 @@ static void pci_setup_bridge_mmio(struct pci_dev *bridge)
 	} else {
 		l = 0x0000fff0;
 	}
+
+	/* The low bits of the Memory Base and Limit registers are read-only */
+	pci_read_config_dword(bridge, PCI_MEMORY_BASE, &cur_l);
+	if (!((cur_l ^ l) & 0xfff0fff0))
+		return;
+
 	pci_write_config_dword(bridge, PCI_MEMORY_BASE, l);
 }
 
@@ -857,14 +875,7 @@ static void pci_setup_bridge_mmio_pref(struct pci_dev *bridge)
 	struct resource *res;
 	const char *res_name;
 	struct pci_bus_region region;
-	u32 l, bu, lu;
-
-	/*
-	 * Clear out the upper 32 bits of PREF limit.  If
-	 * PCI_PREF_BASE_UPPER32 was non-zero, this temporarily disables
-	 * PREF range, which is ok.
-	 */
-	pci_write_config_dword(bridge, PCI_PREF_LIMIT_UPPER32, 0);
+	u32 l, bu, lu, cur_l, cur_bu, cur_lu;
 
 	/* Set up PREF base/limit */
 	bu = lu = 0;
@@ -882,6 +893,25 @@ static void pci_setup_bridge_mmio_pref(struct pci_dev *bridge)
 	} else {
 		l = 0x0000fff0;
 	}
+
+	/*
+	 * Leave the PREF range alone if it is already programmed as needed,
+	 * rather than temporarily disabling it below. The low bits of the
+	 * Prefetchable Memory Base and Limit registers are read-only.
+	 */
+	pci_read_config_dword(bridge, PCI_PREF_MEMORY_BASE, &cur_l);
+	pci_read_config_dword(bridge, PCI_PREF_BASE_UPPER32, &cur_bu);
+	pci_read_config_dword(bridge, PCI_PREF_LIMIT_UPPER32, &cur_lu);
+	if (!((cur_l ^ l) & 0xfff0fff0) && cur_bu == bu && cur_lu == lu)
+		return;
+
+	/*
+	 * Clear out the upper 32 bits of PREF limit.  If
+	 * PCI_PREF_BASE_UPPER32 was non-zero, this temporarily disables
+	 * PREF range, which is ok.
+	 */
+	pci_write_config_dword(bridge, PCI_PREF_LIMIT_UPPER32, 0);
+
 	pci_write_config_dword(bridge, PCI_PREF_MEMORY_BASE, l);
 
 	/* Set the upper 32 bits of PREF base & limit */
-- 
2.56.0.212.g129ede20d9-goog

