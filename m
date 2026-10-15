Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15473B6C09;
	Thu, 15 Oct 2026 22:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102787; cv=none; b=rz64jSoIPFHvZ4icLlCS2GTZ0XP1NZj5rJWfRau5Qrevaco0QWZ+4qCk5/itB1UPmUW/aYOadC1+JDGBnK3kDw20IRUfDv+gTwPBxAeZeX/xEaQET6zoPwKW31ZQwpeEWQhk5hk2U9HFQc85z+D3RJi+ZNZrzlGVpzCZJWMFyeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102787; c=relaxed/simple;
	bh=zYC23vYqOupME8bsNkviobBlTrCD1g7Lg4wAWFHTGa4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=oYIBi9zSagoNFDAvooP8tyv49J1/LGcg7nDoGjmBGltYplMAtdmjN2oeq416UNaJsydYqcxDaMCAJCvJzJyvrDEt8UGE5UtFPxhZzVVcoW96i4DrTRsIbQrTqJOSnA881zgzQffFYFhSBkMf4U7TrFgJYnFRcMdNnmrPaYh9MWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xlcFyC+o; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M53QR+lH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xlcFyC+o";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M53QR+lH"
Date: Thu, 15 Oct 2026 22:19:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792102783;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=niJm+D5M4iTRrEB5uieCSrfqGRz1DC5Jt2M8WRTY0wY=;
	b=xlcFyC+ogdLe/xg5peMls1BIR6CVIkxy3kojzpkn0QO99KPRTV2UGzKlZChUDotiOJu+S4
	NIcOG5HOIZsmQFuv/XGPugCOu5Pv+jO89RZpMaqdpbPt7BUBeaCkfz0e8sATYghpIA1pk8
	CUwQc1PCyIOEohDPaC7XGcNsm/O3OdlnrsY7a8/UDBOr4Luhiscl160TQKM7xxW91blCz+
	B7YiEMLjmHw5OAL6nFUGej1Y2S8F0jSTBh1pGLbc+gGOwsJ4efGgTT35QqZJ76u0wEQtDQ
	POMi9LNHrbaztnsCXYSFeWDBp7J+gwaan2CvCjpfheQgVsfkmZPLK4j3ozUs5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792102783;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=niJm+D5M4iTRrEB5uieCSrfqGRz1DC5Jt2M8WRTY0wY=;
	b=M53QR+lHyfcU8eevzsMOgPmxvWN9YmZfC9F4wl1KLEHdKgGSYSNlCtBiDspoQvMeBA1pLK
	3AcLo4rQmU6ObMCQ==
From: "tip-bot2 for Vidya Sagar" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/core] PCI/MSI: Skip MSI/MSI-X programming while the channel
 is offline
Cc: Vidya Sagar <vidyas@nvidia.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org, maz@kernel.org
In-Reply-To: <20260909164908.2562818-1-vidyas@nvidia.com>
References: <20260909164908.2562818-1-vidyas@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179210278186.2666988.6627455080590539739.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/core branch of tip:

Commit-ID:     2e2f69fc8ae2b280e1c5e01d876c17bc06dbe23f
Gitweb:        https://git.kernel.org/tip/2e2f69fc8ae2b280e1c5e01d876c17bc06d=
be23f
Author:        Vidya Sagar <vidyas@nvidia.com>
AuthorDate:    Wed, 09 Sep 2026 22:19:08 +05:30
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 16 Oct 2026 00:18:40 +02:00

PCI/MSI: Skip MSI/MSI-X programming while the channel is offline

The MSI-X Table lives in device MMIO space behind a BAR and the MSI Mask
register in Configuration Space, so neither is reachable while the Link is
down. While a Downstream Port has the Link contained by DPC it completes
these accesses with Unsupported Request, and reads return all ones.

If the upstream Root Port implements the RP Extensions for DPC, it
additionally reports that UR completion as an RP PIO error and triggers a
second containment event, this time at the Root Port, which contains every
device below it. So a contained Link on one Downstream Port turns into a
far wider outage that takes down unrelated devices.

pci_free_irq_vectors() is called from driver error_detected() and
prepare-for-reset callbacks, i.e. while the Link is contained and before
the reset and the pci_restore_state() that follows it, and it masks every
descriptor. Skip the programming when pci_channel_offline(), which also
covers surprise removal. The msix_ctrl and msi_mask caches are still
updated, so the restore paths replay the intended state once the Link is
back up, and report_slot_reset() clears the offline state before the driver
callback runs, so recovery is unaffected.  pci_msix_write_tph_tag() flushes
its Vector Control update with an unconditional read, so return -EIO there
rather than issue it for a write that was skipped; the caller disables TPH
in response. error_state is only set once containment has occurred, so this
covers the case where the kernel knows the Link is down; it is not mutual
exclusion against a containment event that begins concurrently.

This does not attempt to make every Configuration Space access safe while
the Link is contained.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909164908.2562818-1-vidyas@nvidia.com
---
 drivers/pci/msi/msi.c | 15 +++++++++++++--
 drivers/pci/msi/msi.h |  8 ++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 80a9db4..8a0133a 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -133,7 +133,9 @@ void pci_msi_update_mask(struct msi_desc *desc, u32 clear=
, u32 set)
 	raw_spin_lock_irqsave(lock, flags);
 	desc->pci.msi_mask &=3D ~clear;
 	desc->pci.msi_mask |=3D set;
-	pci_write_config_dword(dev, desc->pci.mask_pos, desc->pci.msi_mask);
+	/* Cached either way, for __pci_restore_msi_state() to replay */
+	if (!pci_channel_offline(dev))
+		pci_write_config_dword(dev, desc->pci.mask_pos, desc->pci.msi_mask);
 	raw_spin_unlock_irqrestore(lock, flags);
 }
=20
@@ -249,7 +251,7 @@ void __pci_write_msi_msg(struct msi_desc *entry, struct m=
si_msg *msg)
 {
 	struct pci_dev *dev =3D msi_desc_to_pci_dev(entry);
=20
-	if (dev->current_state !=3D PCI_D0 || pci_dev_is_disconnected(dev)) {
+	if (dev->current_state !=3D PCI_D0 || pci_channel_offline(dev)) {
 		/* Don't touch the hardware now */
 	} else if (entry->pci.msi_attrib.is_msix) {
 		pci_write_msg_msix(entry, msg);
@@ -976,6 +978,15 @@ int pci_msix_write_tph_tag(struct pci_dev *pdev, unsigne=
d int index, u16 tag)
 	if (!msi_desc || msi_desc->pci.msi_attrib.is_virtual)
 		return -ENXIO;
=20
+	/*
+	 * The tag update below is a write to the MSI-X Table followed by a
+	 * flush read, neither of which can be completed while the Link is
+	 * down. Check as late as possible, as the Link can go down at any
+	 * point. Let the caller disable TPH.
+	 */
+	if (pci_channel_offline(pdev))
+		return -EIO;
+
 	FIELD_MODIFY(PCI_MSIX_ENTRY_CTRL_ST, &msi_desc->pci.msix_ctrl, tag);
 	pci_msix_write_vector_ctrl(msi_desc, msi_desc->pci.msix_ctrl);
 	/* Flush the write */
diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
index 0b420b3..f987cf8 100644
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -36,6 +36,10 @@ static inline void pci_msix_write_vector_ctrl(struct msi_d=
esc *desc, u32 ctrl)
 {
 	void __iomem *desc_addr =3D pci_msix_desc_addr(desc);
=20
+	/* The Table is unreachable while the Link is down */
+	if (pci_channel_offline(msi_desc_to_pci_dev(desc)))
+		return;
+
 	if (desc->pci.msi_attrib.can_mask)
 		writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
 }
@@ -43,6 +47,10 @@ static inline void pci_msix_write_vector_ctrl(struct msi_d=
esc *desc, u32 ctrl)
 static inline void pci_msix_mask(struct msi_desc *desc)
 {
 	desc->pci.msix_ctrl |=3D PCI_MSIX_ENTRY_CTRL_MASKBIT;
+
+	if (pci_channel_offline(msi_desc_to_pci_dev(desc)))
+		return;
+
 	pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
 	/* Flush write to device */
 	readl(desc->pci.mask_base);
