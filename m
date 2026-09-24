Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453495328DF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271320; cv=none; b=L+bCbplTorEusHuATpJ5f3z0oYR7+jnrftalR0ce4w6ZYPop3z+qCrU48OMMErOvB1nH+VxcmE/gLOqkZTLum+3vhNLOqMesrLf0T5VjL1vNFsmNmoBNXSjYSS6FK4tr6ON3sKrgqAIWigWnVViM5wgatDI1gawz3/DNYffluVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271320; c=relaxed/simple;
	bh=wlzwBRRkT915UBU//Zu2aYj8WOraUMnExfBZIqou6R4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XSyZMF/J5G1obw8EHWluhZWSnOjqUrGLhfNyrDWvUNcOqejAbtSY+c6PXRwE8r3QEpXu64XvN3CKdv54pFzB1JGfaBBqljd3ZEsMrJPQe96lk5Nt87XRD9Ursfr7OTVfqcQGVTqXwYa5UajCgU6PHhdE2umjjtWCaJ6ZPO7bp3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uyBnhmO/; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uyBnhmO/"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39af92138f9so101145a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790271317; x=1790876117; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K99KP4+ZdUEIy16B2JsKwnOlIfNzTFpXvKThE7YBS/A=;
        b=uyBnhmO/ITryktwS/7NmQO/1Axp0M0qmVdfDUCdxs1Zpl60uLe3VUco7jxNJxmvb+L
         VJO1e9Fr+bTRBP5XAABEUMLc2wXIU5/f1bh0yQbjO5nZt9lwulH5UqAFRcPnuTF1qQtX
         4wllgu71rCmxRQpWl2BNhjKgXrA2Jv74rUr+uhP0IxcoLfkYCK7h9/fcl+wosIFBwBBK
         qeQcKL3c93VeFqxbtgTKMlcuT3ttPgfduQQvwA5wYiTABgzVO8acruH8lBxbzjkkxlwQ
         W3AsAjQHdjdJ4xtqMlfz3mg/i3E7C3Oc8d9DlQNm5dtOD1FNTThUA/FplpjEfThz5Kyp
         LxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271317; x=1790876117;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K99KP4+ZdUEIy16B2JsKwnOlIfNzTFpXvKThE7YBS/A=;
        b=uFIXjdu+c08AQmpCRphJ1FUxrQDQPekjGan4L51RlTuQtldTL5lcnYT07qK+66JAh2
         qZbzR4lw1YSEz8KfFvm4V39jNO6AgFGO3PluiKU1MjYBcA7chjK1D1I/6sujWg2EpgQs
         V1o3vXEUGf+Ys6GvxWcNN/u5dajCpQ43jebhHfos2kE4faN12x7U0ObhKVVPf3OVlDxf
         KqkEOpii+SQpZVAtPZJqeNTOJj06gG2obbPMxjWvPwlinof1t26LenLmhB8CPl4MOwMl
         ehcfBQgP7StYNy0h3TQomEkRSMYBlA5+xfBljjYT5HyvuKg/dNMxug/oYJJS+0lt4q9J
         Z8Eg==
X-Gm-Message-State: AFuF++m96g9QmljDuhUFybbGhV1uvRq4Xo3yD4XhBfo0PDIdnIHcbCZl
	Vn8tsObOHqpa2xDNdJnDSbStfgaDqw7XUYoDJ0pBM0fz2xOcnUQDy/82F7Cc92HzosF4uZ5o4yg
	KvztPjhr5lJVfq2mlPENJyIGHwwG5NeoUKPftmAj8tRNHF3RdHWRVRFYwXJddZnFkWPh+KaAIdI
	Qb8Y9IVvHwQrXtk2wMGysDQCJ3nwzsRC6dpofRg6wfnRELuMuj/lSKZGw=
X-Received: from pjqo18.prod.google.com ([2002:a17:90a:ac12:b0:3a0:42b3:e871])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2ec7:b0:39e:6c68:fd89 with SMTP id 98e67ed59e1d1-3a098b2133cmr2058390a91.30.1790271317025;
 Thu, 24 Sep 2026 10:35:17 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:34:57 +0000
In-Reply-To: <20260924173501.856380-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924173501.856380-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924173501.856380-12-dmatlack@google.com>
Subject: [PATCH 11/15] PCI/DPC: Save DPC state in the saved capability store
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

Save and restore the DPC Control register through the per-device saved
capability store instead of a private pci_cap_saved_state buffer.

Key the save and restore paths off pdev->dpc_cap rather than
pci_is_pcie(). The presence of the save buffer used to stand in for the
presence of the capability, which the store cannot do because it is
addressed by configuration space offset.

No functional change intended.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pcie/dpc.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index b7f79266f66d..6f40cf2c712c 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -45,34 +45,18 @@ static const char * const rp_pio_error_string[] = {
 
 void pci_save_dpc_state(struct pci_dev *dev)
 {
-	struct pci_cap_saved_state *save_state;
-	u16 *cap;
-
-	if (!pci_is_pcie(dev))
-		return;
-
-	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_DPC);
-	if (!save_state)
+	if (!dev->dpc_cap)
 		return;
 
-	cap = (u16 *)&save_state->cap.data[0];
-	pci_read_config_word(dev, dev->dpc_cap + PCI_EXP_DPC_CTL, cap);
+	pci_save_cap_word(dev, dev->dpc_cap + PCI_EXP_DPC_CTL);
 }
 
 void pci_restore_dpc_state(struct pci_dev *dev)
 {
-	struct pci_cap_saved_state *save_state;
-	u16 *cap;
-
-	if (!pci_is_pcie(dev))
-		return;
-
-	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_DPC);
-	if (!save_state)
+	if (!dev->dpc_cap)
 		return;
 
-	cap = (u16 *)&save_state->cap.data[0];
-	pci_write_config_word(dev, dev->dpc_cap + PCI_EXP_DPC_CTL, *cap);
+	pci_restore_cap_word(dev, dev->dpc_cap + PCI_EXP_DPC_CTL);
 }
 
 static DECLARE_WAIT_QUEUE_HEAD(dpc_completed_waitqueue);
@@ -408,8 +392,8 @@ void pci_dpc_init(struct pci_dev *pdev)
 	if (!pdev->dpc_cap)
 		return;
 
-	if (pci_add_ext_cap_save_buffer(pdev, PCI_EXT_CAP_ID_DPC, sizeof(u16)))
-		pci_err(pdev, "unable to allocate suspend buffer for DPC\n");
+	if (pci_reserve_saved_cap(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, sizeof(u16)))
+		pci_err(pdev, "unable to reserve DPC save state\n");
 
 	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CAP, &cap);
 	if (!(cap & PCI_EXP_DPC_CAP_RP_EXT))
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

