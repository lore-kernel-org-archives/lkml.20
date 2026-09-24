Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626FD4CE67D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271318; cv=none; b=FzqcZ6v/c4bdiZP8JNopApdzi52hMsrTR9fq7MEqoIAq/H77eGje8DkDVg20R+FVWr/4aNb0Ip4IkS3CkwE661G9tKXzAsiVp0u67DDzqtFlxRl/BsynvYT5ZxNhVymba1AsqAzajowazeDOVPN3gjfvQudehefiqqCYF3M+jNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271318; c=relaxed/simple;
	bh=+2XkVyc+d7lmXngp5c27amWCxF9xLyfF2JbamA+2GNw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BjDL8SCcZpxfIyX4tTTlYtwa3QdAdp0aiBEQT2jeuZAFens8ESJUfw+LuLFrPADhennrgIPcGeT98CuJ+ak9CMYpyjncnCFZaMuJOBi5KPgg12wH1O4Ph8ybPlWlLWScOIXYMSoqmOx4mdDEt5h8ql8LWWFCHsZd4Urrtdts+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IMo1iSg6; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IMo1iSg6"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso20488a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790271316; x=1790876116; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KIWUowhWgqgcS9B9uJaCFyMmng9ri0RWLxjQM7dDfo=;
        b=IMo1iSg6ZlPmqngl8OO/uAltkihWLmN+p6f8L7DrwHnrbnXFTQzoLSNGNVu9W/0A3i
         ytU2E+gn0VJdES50wxizhtyR4UJWfdegwZtSkE5GFhPXuZwZ43cnzLJwAXUVVE8Gb7Xx
         PPmWkQPwvSktrPf3OsrSkKGOhy3rPhYGXFQKvuLn0OIToFYZGFXTfp2XFSKyaFUtVrBL
         5Dy/raaTlx2M+if0Lwi168kV0E6R0cstCMRRqtO2dFDxYzX9A1SFfXtK3YPbhWZ6gH+5
         ex4Fbk6hnQ5hr1V17EMYmb0vlGyR0R4oPSImaDUI6uP7dy3TWLtfy2u2LHm6kDsk6q/i
         ef8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271316; x=1790876116;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9KIWUowhWgqgcS9B9uJaCFyMmng9ri0RWLxjQM7dDfo=;
        b=UuKkx8plyRjarGgejl/1e7g6ZPMvfBAcYoZGH1F+q1yByjj0x5zPyj8NGH8Q6/9f8T
         88gRS3jzzw+pa7/9LAFNkhXSxTmrbOx1wIxajGXelIESWw1OFqs3eC0A6Q3WJydfHAMZ
         130nnPSOM4jutirNnx2SKe930L4zqDRMg05nsHgBqa/qol2aM0XwMsFgb5lqrXzczPjV
         sXLYk+umKgrQ9Dn4J5DALIoCkUaXpMnMmgRGq1Wya7HZKoqdTLT57ZLGJQ0ugzEMf3YS
         0eySbQzZJllYlrH/PDyz9gMsIpwIdrMgQ95hpzUFEFUXAGqwqoi6OLOJoi4CE5qy8Mhp
         /AGg==
X-Gm-Message-State: AFuF++lfIC89i+a7/bPg2FRNMON2HJd5F40FKFJ0q6bS0O8UZnDNdgO6
	56LI/xxikigv2rNSVUa2fhRp0gcmCluKSyNnYG8c/96ZH6sAPGvWdI7ukBQhSAUvPhBKi2HJZUS
	X5DjrwV3qvu5NqA8zuujb5BanCRT1qllCEZzxwE67WC/wcGGdDKXrNIrUmSsdyCutXkSulVX/fY
	w4WokdZVxXJTCVbi+/dU4PFxF6e3qOp2mbPF5YHQE9r8hdeiC1zlnZ4Wg=
X-Received: from pfbmt15.prod.google.com ([2002:a05:6a00:6e6f:b0:87f:a748:7030])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:b7a6:b0:3dd:651e:b71d with SMTP id adf61e73a8af0-3de0e7445c3mr3228498637.24.1790271315360;
 Thu, 24 Sep 2026 10:35:15 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:34:55 +0000
In-Reply-To: <20260924173501.856380-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924173501.856380-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924173501.856380-10-dmatlack@google.com>
Subject: [PATCH 09/15] PCI/PTM: Save PTM state in the saved capability store
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

Save and restore the PTM Control register through the per-device saved
capability store instead of a private pci_cap_saved_state buffer.

Report a reservation failure. pci_ptm_init() ignored the return value of
pci_add_ext_cap_save_buffer() entirely, so a failed allocation was only
noticed later as silently missing PTM state.

No functional change intended.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pcie/ptm.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/pcie/ptm.c b/drivers/pci/pcie/ptm.c
index bd3bd39f6372..a9e29e19b0f9 100644
--- a/drivers/pci/pcie/ptm.c
+++ b/drivers/pci/pcie/ptm.c
@@ -53,7 +53,8 @@ void pci_ptm_init(struct pci_dev *dev)
 
 	dev->ptm_cap = ptm;
 	atomic_set(&dev->ptm_enable_cnt, 0);
-	pci_add_ext_cap_save_buffer(dev, PCI_EXT_CAP_ID_PTM, sizeof(u32));
+	if (pci_reserve_saved_cap(dev, ptm + PCI_PTM_CTRL, sizeof(u32)))
+		pci_err(dev, "unable to reserve PTM save state\n");
 
 	pci_read_config_dword(dev, ptm + PCI_PTM_CAP, &cap);
 	dev->ptm_granularity = FIELD_GET(PCI_PTM_GRANULARITY_MASK, cap);
@@ -90,36 +91,18 @@ void pci_ptm_init(struct pci_dev *dev)
 
 void pci_save_ptm_state(struct pci_dev *dev)
 {
-	u16 ptm = dev->ptm_cap;
-	struct pci_cap_saved_state *save_state;
-	u32 *cap;
-
-	if (!ptm)
-		return;
-
-	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_PTM);
-	if (!save_state)
+	if (!dev->ptm_cap)
 		return;
 
-	cap = (u32 *)&save_state->cap.data[0];
-	pci_read_config_dword(dev, ptm + PCI_PTM_CTRL, cap);
+	pci_save_cap_dword(dev, dev->ptm_cap + PCI_PTM_CTRL);
 }
 
 void pci_restore_ptm_state(struct pci_dev *dev)
 {
-	u16 ptm = dev->ptm_cap;
-	struct pci_cap_saved_state *save_state;
-	u32 *cap;
-
-	if (!ptm)
-		return;
-
-	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_PTM);
-	if (!save_state)
+	if (!dev->ptm_cap)
 		return;
 
-	cap = (u32 *)&save_state->cap.data[0];
-	pci_write_config_dword(dev, ptm + PCI_PTM_CTRL, *cap);
+	pci_restore_cap_dword(dev, dev->ptm_cap + PCI_PTM_CTRL);
 }
 
 /* Enable PTM in the Control register if possible */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

