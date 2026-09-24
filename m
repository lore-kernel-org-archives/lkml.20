Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA84841D23A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271317; cv=none; b=q3XCE1CM+sTxCM0lxC2VyhNxT7Mo+XUdSPzXPf4wp88KEAwx6drCsJaBvq8q00pF6TvkBS9kALb/ZmuS2IwRoOAULUL7tLXjHEHiNED5X7RiNolkgxvsYY/ZMNnXYQsyo2VU3eELh4uHAQsIwsgiBN/ko6hufEkLlnXnwwnXA4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271317; c=relaxed/simple;
	bh=anC/3+joCZQHYgZOTAIFQPCTbfuTiYNUuxsKS68/ArA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OWkV4vZG/iIrEpJeVSwmpN2KHRGA0zyKBjsqAkNNCrbN9ELao254Xg8V5g9YFgnKWpfBJxPXNzvaANbZWFsrIzBTMSeEFCUEBlUlu13DGNj3xwbeZYTA008C13Wr2o6pgr21A2L/jr7GQGuc4ePwd6KmHId/DF7j0AGYAlh/giw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WorfeeB4; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WorfeeB4"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-85602449126so190394b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790271315; x=1790876115; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y60xW3TpxqTBbPYvTrQ94YIZwmg/m6Sy4R0GJoihbbA=;
        b=WorfeeB4dBxsYUWGCijtv0tEBR9060ENvgSaWjx8jfgpN65RXXrQFyARckoSnCJoK4
         sHEt2U1IrSacUAVCL/MVs96yFqsJ18MnGarCyJej8WWb6QrvpeV7REntkzOwJDxiGzq9
         8JP8fdfoZIQeCUIl3YTqbi0JhBNXdVnxJEzSk7iUgyGPVRSArXXsVm/7YjiOJR9MvDyv
         AKUnqb/ZRtIQda3CvvIJkcFtLbCWgffioKPQk0yGGY7WkHqe+aHvRGJ7j1RNmktjWh/c
         pRLHKykucsP0SeYUWkqfCTYtONYPFIadUvTm0r1EgBkyxhWCvwjy/zTRW7gYh6VTCucB
         KVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271315; x=1790876115;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y60xW3TpxqTBbPYvTrQ94YIZwmg/m6Sy4R0GJoihbbA=;
        b=rq5blglRBSRFY7Uby3cTOOogIQTtf7B2JcYD3iiP7BDSyVUvYMPtrecLKbOkmzyM+i
         vB6O7/0DVa8oaumxAEiEm+KyLFxtp4kQh+Y3WhQSpw1KtdWlgGh4hq+aAdyoQ1zG3CqH
         h/oYAKHkbi2CnyekRhQ0sEagpiAAD8JU4E0NH1L61cTrkm1qBxql89NCSCW8CIVqQutm
         5zoQjKsPF5yTGjDNAeR58m4ZzMzsdYT+pO5ksqA/UwXr8TdtDZXZCoU5mSHC4wHLaajR
         OHE6pJ8HZsSYCsVzRspzRq7u9Az28OBmAxQqTYaMsbvT2roW7ORGXDSyX2UeppxK5wN8
         XLjQ==
X-Gm-Message-State: AFuF++lPAXyKrjddGe4GuNOezST4rDe/vrsK2kJ/MVHgyX17LDaM5A8Q
	PNK91eQTdWcwrLj9nz4OTR2q5SDjXU9cvTOGDnKyKOWqm0Ytki7ep/1nMVSU7Q28dBEjE34QB2w
	UTdNS+puZVRJZebSUDLTcSTl6Kqy+afUuPiaRr+wvJYRBtwLVQTS/RA90K4jBrb22i6tmxsqwWS
	sBJ++L3e/bojRTQnghDwEVoXAkQ4kBqX9Rqv8TSXnl5GgFs1OyL3EWmzE=
X-Received: from pfbem41.prod.google.com ([2002:a05:6a00:3769:b0:877:cfaa:5ea3])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3307:b0:878:34d7:6a37 with SMTP id d2e1a72fcca58-87e9ef54169mr2679356b3a.43.1790271314522;
 Thu, 24 Sep 2026 10:35:14 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:34:54 +0000
In-Reply-To: <20260924173501.856380-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924173501.856380-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924173501.856380-9-dmatlack@google.com>
Subject: [PATCH 08/15] PCI/AER: Save AER state in the saved capability store
From: David Matlack <dmatlack@google.com>
To: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Lukas Wunner <lukas@wunner.de>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Save and restore the AER mask, severity, capability and root command
registers through the per-device saved capability store instead of a
private pci_cap_saved_state buffer.

Describe the registers in aer_saved_regs[] and drive the reservation, save,
and restore loops from it. Previously the three had to be kept in the same
order by hand, and pci_aer_init() encoded the register count as a bare 4 or
5.

Report a reservation failure. pci_aer_init() ignored the return value of
pci_add_ext_cap_save_buffer() entirely, so a failed allocation was only
noticed later as silently missing AER state.

No functional change intended.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pcie/aer.c | 79 +++++++++++++++++++++---------------------
 1 file changed, 40 insertions(+), 39 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index d8dcd238fda1..765899cf4046 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -352,53 +352,53 @@ int pci_aer_clear_status(struct pci_dev *dev)
 	return pci_aer_raw_clear_status(dev);
 }
 
-void pci_save_aer_state(struct pci_dev *dev)
+/*
+ * AER registers saved and restored by the PCI core. PCI_ERR_ROOT_COMMAND is
+ * only implemented by Root Ports and Root Complex Event Collectors (PCIe
+ * r6.0, sec 7.8.4.9) and so must come last.
+ */
+static const u16 aer_saved_regs[] = {
+	PCI_ERR_UNCOR_MASK,
+	PCI_ERR_UNCOR_SEVER,
+	PCI_ERR_COR_MASK,
+	PCI_ERR_CAP,
+	PCI_ERR_ROOT_COMMAND,
+};
+
+static unsigned int aer_nr_saved_regs(struct pci_dev *dev)
 {
-	int aer = dev->aer_cap;
-	struct pci_cap_saved_state *save_state;
-	u32 *cap;
+	if (pcie_cap_has_rtctl(dev))
+		return ARRAY_SIZE(aer_saved_regs);
 
-	if (!aer)
-		return;
+	return ARRAY_SIZE(aer_saved_regs) - 1;
+}
+
+void pci_save_aer_state(struct pci_dev *dev)
+{
+	unsigned int i;
 
-	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_ERR);
-	if (!save_state)
+	if (!dev->aer_cap)
 		return;
 
-	cap = &save_state->cap.data[0];
-	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, cap++);
-	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_SEVER, cap++);
-	pci_read_config_dword(dev, aer + PCI_ERR_COR_MASK, cap++);
-	pci_read_config_dword(dev, aer + PCI_ERR_CAP, cap++);
-	if (pcie_cap_has_rtctl(dev))
-		pci_read_config_dword(dev, aer + PCI_ERR_ROOT_COMMAND, cap++);
+	for (i = 0; i < aer_nr_saved_regs(dev); i++)
+		pci_save_cap_dword(dev, dev->aer_cap + aer_saved_regs[i]);
 }
 
 void pci_restore_aer_state(struct pci_dev *dev)
 {
-	int aer = dev->aer_cap;
-	struct pci_cap_saved_state *save_state;
-	u32 *cap;
+	unsigned int i;
 
-	if (!aer)
-		return;
-
-	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_ERR);
-	if (!save_state)
+	if (!dev->aer_cap)
 		return;
 
-	cap = &save_state->cap.data[0];
-	pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, *cap++);
-	pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_SEVER, *cap++);
-	pci_write_config_dword(dev, aer + PCI_ERR_COR_MASK, *cap++);
-	pci_write_config_dword(dev, aer + PCI_ERR_CAP, *cap++);
-	if (pcie_cap_has_rtctl(dev))
-		pci_write_config_dword(dev, aer + PCI_ERR_ROOT_COMMAND, *cap++);
+	for (i = 0; i < aer_nr_saved_regs(dev); i++)
+		pci_restore_cap_dword(dev, dev->aer_cap + aer_saved_regs[i]);
 }
 
 void pci_aer_init(struct pci_dev *dev)
 {
-	int n;
+	unsigned int i;
+	int error;
 
 	dev->aer_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ERR);
 	if (!dev->aer_cap)
@@ -415,14 +415,15 @@ void pci_aer_init(struct pci_dev *dev)
 	ratelimit_state_init(&dev->aer_info->nonfatal_ratelimit,
 			     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
 
-	/*
-	 * We save/restore PCI_ERR_UNCOR_MASK, PCI_ERR_UNCOR_SEVER,
-	 * PCI_ERR_COR_MASK, and PCI_ERR_CAP.  Root and Root Complex Event
-	 * Collectors also implement PCI_ERR_ROOT_COMMAND (PCIe r6.0, sec
-	 * 7.8.4.9).
-	 */
-	n = pcie_cap_has_rtctl(dev) ? 5 : 4;
-	pci_add_ext_cap_save_buffer(dev, PCI_EXT_CAP_ID_ERR, sizeof(u32) * n);
+	for (i = 0; i < aer_nr_saved_regs(dev); i++) {
+		unsigned int off = dev->aer_cap + aer_saved_regs[i];
+
+		error = pci_reserve_saved_cap(dev, off, sizeof(u32));
+		if (error) {
+			pci_err(dev, "unable to reserve AER save state\n");
+			break;
+		}
+	}
 
 	/*
 	 * Advisory Non-Fatal Errors are masked by default (PCIe r7.0, sec
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

