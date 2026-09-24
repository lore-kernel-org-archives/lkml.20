Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8655328DA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271317; cv=none; b=r22BxZ1asCleFHvPnrkzb/HrOviHvAlOaoCV3+miSEBkLCRA4kvFZt+j9ftkr8y7vj7PDdSHFz5+IByjDz0LF93GPNZEguk0QY5buH1AREEjDKqy64+ej8h7pQv87Glx1ExXhVrwLw+CIb8BFuXIq9qJ9TWYXJ4v7FhLsvp/ois=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271317; c=relaxed/simple;
	bh=/5HjJCXZen9bxavIBWgRRyS5BsvN7q78soKT80yMa6s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mz6hfZ8TylZk7Rj8wcNtIYWevCfMxzsuJy4IBdl5IhQfJqya0IFpuvg5GvDjj/KCyTDgQLeinY2Jv2HcCnBdZs7drbctvvC6yWJ/7DgCZrL6Iv+XHm0OATjPEMeGFTmWtQ6vQFFFvzoHgn99lgmdIheZmxx9zoSagHqGIeeWaEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B9OR2MnN; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B9OR2MnN"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso11862a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790271314; x=1790876114; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HaY3giQHInn5O/nliw0nJVwoVW0YaeGKgr+RxcxHBtA=;
        b=B9OR2MnN6yjWffRY04+Fo303JwzwtZOYouS27nryn3qY0WHDYZBszyd7TSQmdawmlc
         sepu4/VKXYDeL2cxbQGhAx7pIf91gmNjnwvo7PJNZIf2GJIqCPhF9yIN7TJmZwv1XrTd
         QzkSWpdUnv55+I+3HTorLUeaYQHesb5Ywuad6ovbubgwFW4RGshsMWtjcP26tczV/Ti2
         iq9na+W+CFWLC11Cop5mXH3kGJy2HOs47tHqYWaR/4nd+MvZQfcdivOo301cd6OBffei
         vQAZb20vFyHV0Z60bRChWHomqjeM51ocm507VzV5vnjKAxNSmkiAlc59G3dihPvPmBX+
         R4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271314; x=1790876114;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HaY3giQHInn5O/nliw0nJVwoVW0YaeGKgr+RxcxHBtA=;
        b=xDLc2pWHCYSsAnID4LnMvk0+bj9PLIIi2CDaBo+XvrFGD0GerNLf4RIrYEN0VdprEd
         RwSRGWcqV140/bcahfs65MtQuf2yclAyeWMBMGlYajN6oSmuOTyBCoYa74abg/2j/4Br
         mw9wFEN4fDsg2O8uZcz7BL5XmtZjb1APTNJvDGEK4C3wJ6l629BAHrIEXCIaxH/310DS
         QZdAMzjaWmHNGwpvDJs5WRlnjyrYFHGivqHiMqtSA+nwgcZNCZxYsa7D4p5dMwxEQDw6
         GwwQfVzxnesa2HTOSKqcKIQ7v5pWznXJMJKHUIaqgkDpyaGyXOHSPpenyUt265C3grz1
         8B+A==
X-Gm-Message-State: AFuF++nfvrw9+qoFr2Wtm1FAru6FUJFNS6zeVTtfy2O88kNDxTrEskBl
	TiZ2NPLnlNJN+7+7eDK37qfoHvIUaHK9Y0fo/uuEIPHwPjk4gpi0LRK7PULTQVpg/BF46D9uM2c
	nWf2rIL/952QleXhYcFTscJJY2hhVNhP1jVLQXh/H3gUbZXBBewu/KTP10OnRNTfA9WRsvh1TWG
	eE5N0SW+N+jYZpAJqe0JwyUXamWbz1XfZznjdvYuaIJj5rtt0QoRWUpLo=
X-Received: from pgbdm10.prod.google.com ([2002:a05:6a02:d8a:b0:cc7:8562:ccf8])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:b08d:b0:3dd:a197:edfa with SMTP id adf61e73a8af0-3de0e97b53dmr3097217637.73.1790271313700;
 Thu, 24 Sep 2026 10:35:13 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:34:53 +0000
In-Reply-To: <20260924173501.856380-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924173501.856380-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924173501.856380-8-dmatlack@google.com>
Subject: [PATCH 07/15] PCI/ASPM: Save L1SS state in the saved capability store
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

Save and restore the L1 PM Substates control registers through the
per-device saved capability store instead of a private pci_cap_saved_state
buffer.

pci_restore_aspm_l1ss_state() needs both the Upstream and Downstream
Port's saved L1SS configuration, and had to fetch two buffers and decode
each by index. Read the saved values by configuration space offset
instead, which names the register at every use. Add
pci_read_saved_l1ss_ctl() to read one device's pair, so that the Port
and the device below it are read the same way.

Reserve PCI_L1SS_CTL1 and PCI_L1SS_CTL2 with a single request, since
they are adjacent DWORDs, just as the old code allocated one two-DWORD
buffer for both. Skip the reservation entirely for devices without the
capability, which the previous code could not do because it allocated
the buffer through pci_add_ext_cap_save_buffer() before looking at
pdev->l1ss.

No functional change intended.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pcie/aspm.c | 52 +++++++++++++++++------------------------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 16f22af98686..9d64c6aebb9f 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -59,19 +59,19 @@ void pci_configure_aspm_l1ss(struct pci_dev *pdev)
 	int rc;
 
 	pdev->l1ss = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_L1SS);
+	if (!pdev->l1ss)
+		return;
 
-	rc = pci_add_ext_cap_save_buffer(pdev, PCI_EXT_CAP_ID_L1SS,
-					 2 * sizeof(u32));
+	/* PCI_L1SS_CTL1 and PCI_L1SS_CTL2 are adjacent DWORDs */
+	rc = pci_reserve_saved_cap(pdev, pdev->l1ss + PCI_L1SS_CTL1, 2 * sizeof(u32));
 	if (rc)
-		pci_err(pdev, "unable to allocate ASPM L1SS save buffer (%pe)\n",
+		pci_err(pdev, "unable to reserve ASPM L1SS save state (%pe)\n",
 			ERR_PTR(rc));
 }
 
 void pci_save_aspm_l1ss_state(struct pci_dev *pdev)
 {
 	struct pci_dev *parent = pdev->bus->self;
-	struct pci_cap_saved_state *save_state;
-	u32 *cap;
 
 	/*
 	 * If this is a Downstream Port, we never restore the L1SS state
@@ -88,32 +88,32 @@ void pci_save_aspm_l1ss_state(struct pci_dev *pdev)
 	 * Save L1 substate configuration. The ASPM L0s/L1 configuration
 	 * in PCI_EXP_LNKCTL_ASPMC is saved by pci_save_pcie_state().
 	 */
-	save_state = pci_find_saved_ext_cap(pdev, PCI_EXT_CAP_ID_L1SS);
-	if (!save_state)
-		return;
-
-	cap = &save_state->cap.data[0];
-	pci_read_config_dword(pdev, pdev->l1ss + PCI_L1SS_CTL2, cap++);
-	pci_read_config_dword(pdev, pdev->l1ss + PCI_L1SS_CTL1, cap++);
+	pci_save_cap_dword(pdev, pdev->l1ss + PCI_L1SS_CTL2);
+	pci_save_cap_dword(pdev, pdev->l1ss + PCI_L1SS_CTL1);
 
 	/*
 	 * Save parent's L1 substate configuration so we have it for
 	 * pci_restore_aspm_l1ss_state(pdev) to restore.
 	 */
-	save_state = pci_find_saved_ext_cap(parent, PCI_EXT_CAP_ID_L1SS);
-	if (!save_state)
-		return;
+	pci_save_cap_dword(parent, parent->l1ss + PCI_L1SS_CTL2);
+	pci_save_cap_dword(parent, parent->l1ss + PCI_L1SS_CTL1);
+}
 
-	cap = &save_state->cap.data[0];
-	pci_read_config_dword(parent, parent->l1ss + PCI_L1SS_CTL2, cap++);
-	pci_read_config_dword(parent, parent->l1ss + PCI_L1SS_CTL1, cap++);
+/*
+ * Read a device's saved L1 substate configuration.
+ *
+ * Return: true if both registers had a saved value, false otherwise.
+ */
+static bool pci_read_saved_l1ss_ctl(struct pci_dev *dev, u32 *ctl1, u32 *ctl2)
+{
+	return pci_read_saved_cap_dword(dev, dev->l1ss + PCI_L1SS_CTL1, ctl1) &&
+	       pci_read_saved_cap_dword(dev, dev->l1ss + PCI_L1SS_CTL2, ctl2);
 }
 
 void pci_restore_aspm_l1ss_state(struct pci_dev *pdev)
 {
-	struct pci_cap_saved_state *pl_save_state, *cl_save_state;
 	struct pci_dev *parent = pdev->bus->self;
-	u32 *cap, pl_ctl1, pl_ctl2, pl_l1_2_enable;
+	u32 pl_ctl1, pl_ctl2, pl_l1_2_enable;
 	u32 cl_ctl1, cl_ctl2, cl_l1_2_enable;
 	u16 clnkctl, plnkctl;
 
@@ -128,18 +128,10 @@ void pci_restore_aspm_l1ss_state(struct pci_dev *pdev)
 	if (!pdev->l1ss || !parent->l1ss)
 		return;
 
-	cl_save_state = pci_find_saved_ext_cap(pdev, PCI_EXT_CAP_ID_L1SS);
-	pl_save_state = pci_find_saved_ext_cap(parent, PCI_EXT_CAP_ID_L1SS);
-	if (!cl_save_state || !pl_save_state)
+	if (!pci_read_saved_l1ss_ctl(pdev, &cl_ctl1, &cl_ctl2) ||
+	    !pci_read_saved_l1ss_ctl(parent, &pl_ctl1, &pl_ctl2))
 		return;
 
-	cap = &cl_save_state->cap.data[0];
-	cl_ctl2 = *cap++;
-	cl_ctl1 = *cap;
-	cap = &pl_save_state->cap.data[0];
-	pl_ctl2 = *cap++;
-	pl_ctl1 = *cap;
-
 	/* Make sure L0s/L1 are disabled before updating L1SS config */
 	pcie_capability_read_word(pdev, PCI_EXP_LNKCTL, &clnkctl);
 	pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &plnkctl);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

