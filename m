Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F16531B0E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271315; cv=none; b=JM9SPS1UTpvVHbNtvK2+TOFA9zo4aT5bWfFF2bSyL/4ZrGTFjb6d+CtSp3C1ofmh4CWiahI3zFHx3hdC8UbNsaX2Rv8p1tWcOvE1J6rOHJXWimKF14IFBC/hH0hjvEGYgFGluxR4wub1BVG1Emg4N72vVp+FBkkeClcqPumfHhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271315; c=relaxed/simple;
	bh=JRG3t7bLEQ9mo4ZbR+G7oYZ9TFdP7irOqPQlDNMN5Ng=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KSIEF01del71VKfZ7AuUp2UuzOqF8j5cf72BHNMwaPvUD1zrQQMbKPs/WhOuK6/z9SsJks7jcVSCGUtfsII+umGTBFo6ewmgqjUSSiRStiJfOLj5csYxBiObxjCOFMjeTjDzUB3tDBq8nEISbFjnOqX0l09zydyaG9Fwjdfkuzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hKdZ3AJo; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hKdZ3AJo"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df5a65671eso654365ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790271312; x=1790876112; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYR5MAb0ktDGLlkQWDn+bRn8aUIoebMDEJfJ0HSFDY0=;
        b=hKdZ3AJo4IxZ5AySqzmLndMjNEseocWDaSzCsEN25B3oKmxhYckCfJ2tqtPMtVn8cC
         UneG16pkJvNsv2zLk46t1GQ/DdQ99ZkdnsVxnbMQkf4yh/Cvp/5jrORN0jJDrJ9Clrf+
         G8LRfrKSKzeUkZvNuLVyeezVVRFST56/zPnTLILkqnov/ZvghPTOpnW62uLnFtivHGxY
         CUff1A6cSCFH6H3REpSKuPGDoHvuNYt4mmdW/KGph7qHRNMiJAu9zwCpdSyfSyk3/LqQ
         Jkbp3nfgWbHr/DC+Eg1h+IpCLG7dOO93HZaPteQUMs2O9lhXPZuJPQ09T4WXwxeoyaRN
         h89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271312; x=1790876112;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYR5MAb0ktDGLlkQWDn+bRn8aUIoebMDEJfJ0HSFDY0=;
        b=SjEKKTNW/0N0EY+lnuGl0h49qpa9KMEj/E9YOgISqrw+n3fw1HNblnn5kdDnoIJFG0
         FjSIghiajecHlHuXCzKFDQvQ22U2PkpLyQxbPt8zLUg8u8dEWbo6Zei7oIMVVJIView4
         yxoMiZ3UuL6beLkC0RCCSkVankRP1hrLVnnMM7OO6qlYrb5FwR/cTtL9+aDG6+SbL5jt
         TcA5pdamLBVLknXfWR4AT/lYg8W0LPSnRnO04kuUE/zzW1kjIaYd4b1HbiqTyC+2OuJL
         ZrxknHene9mA6pwfCi8CzKDTxm/JhxSJXBozpb7BGzeyCqBQUzwj4J9LgDcotxhZ2hHl
         69QA==
X-Gm-Message-State: AFuF++mBlUWLajhpVT7EgRJ7ZWGPhkyLHqBfKCdxlfjg6IF7rgz9MBqw
	94hEg5hmvJAI6S3yCocoRnUFBmj/Keq8mnCotLG9OuJas4aeYu1+NUlVeiuqyb7XATIxElg+Fle
	efDk1nnc4DH2wAo56hJdRefuuldJhl/nbp8QOX9b5s7z5O0G5r0pnU9m5dPCGrkBP3C9v08yKBP
	cm/Vm4I0cKff2uSfP4BFQK/JMJHcST+bl5pZLQOQ98dz8qap8tbhQTqfg=
X-Received: from pleb19.prod.google.com ([2002:a17:902:d413:b0:2df:6eb9:45a2])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:19cd:b0:2d7:5da6:2af4 with SMTP id d9443c01a7336-2df7dea6233mr20998285ad.4.1790271311978;
 Thu, 24 Sep 2026 10:35:11 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:34:51 +0000
In-Reply-To: <20260924173501.856380-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924173501.856380-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924173501.856380-6-dmatlack@google.com>
Subject: [PATCH 05/15] PCI: Save PCI-X state in the saved capability store
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

Save and restore the PCI-X Command register through the per-device saved
capability store instead of a private pci_cap_saved_state buffer.

Reserve the register by its configuration space offset during device setup
so that the save and restore paths no longer have to locate a buffer, and
so that the saved value can be found without knowing how the PCI core
happens to lay its buffers out.

While here, make pci_save_pcix_state() void now that it cannot fail.

No functional change intended.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pci.c | 43 ++++++++++++++-----------------------------
 1 file changed, 14 insertions(+), 29 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 1c2c572aa49c..9e49806c6891 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1733,40 +1733,26 @@ static void pci_restore_pcie_state(struct pci_dev *dev)
 	}
 }
 
-static int pci_save_pcix_state(struct pci_dev *dev)
+static void pci_save_pcix_state(struct pci_dev *dev)
 {
 	int pos;
-	struct pci_cap_saved_state *save_state;
 
 	pos = pci_find_capability(dev, PCI_CAP_ID_PCIX);
 	if (!pos)
-		return 0;
-
-	save_state = pci_find_saved_cap(dev, PCI_CAP_ID_PCIX);
-	if (!save_state) {
-		pci_err(dev, "buffer not found in %s\n", __func__);
-		return -ENOMEM;
-	}
-
-	pci_read_config_word(dev, pos + PCI_X_CMD,
-			     (u16 *)save_state->cap.data);
+		return;
 
-	return 0;
+	pci_save_cap_word(dev, pos + PCI_X_CMD);
 }
 
 static void pci_restore_pcix_state(struct pci_dev *dev)
 {
-	int i = 0, pos;
-	struct pci_cap_saved_state *save_state;
-	u16 *cap;
+	int pos;
 
-	save_state = pci_find_saved_cap(dev, PCI_CAP_ID_PCIX);
 	pos = pci_find_capability(dev, PCI_CAP_ID_PCIX);
-	if (!save_state || !pos)
+	if (!pos)
 		return;
-	cap = (u16 *)&save_state->cap.data[0];
 
-	pci_write_config_word(dev, pos + PCI_X_CMD, cap[i++]);
+	pci_restore_cap_word(dev, pos + PCI_X_CMD);
 }
 
 /**
@@ -1786,11 +1772,7 @@ int pci_save_state(struct pci_dev *dev)
 	dev->state_saved = true;
 
 	pci_save_pcie_state(dev);
-
-	i = pci_save_pcix_state(dev);
-	if (i != 0)
-		return i;
-
+	pci_save_pcix_state(dev);
 	pci_save_dpc_state(dev);
 	pci_save_aer_state(dev);
 	pci_save_ptm_state(dev);
@@ -3579,7 +3561,7 @@ int pci_add_ext_cap_save_buffer(struct pci_dev *dev, u16 cap, unsigned int size)
 void pci_allocate_cap_save_buffers(struct pci_dev *dev)
 {
 	unsigned int i;
-	int error;
+	int error, pos;
 
 	for (i = 0; pci_is_pcie(dev) && i < ARRAY_SIZE(pcie_saved_regs); i++) {
 		unsigned int off = dev->pcie_cap + pcie_saved_regs[i];
@@ -3591,9 +3573,12 @@ void pci_allocate_cap_save_buffers(struct pci_dev *dev)
 		}
 	}
 
-	error = pci_add_cap_save_buffer(dev, PCI_CAP_ID_PCIX, sizeof(u16));
-	if (error)
-		pci_err(dev, "unable to preallocate PCI-X save buffer\n");
+	pos = pci_find_capability(dev, PCI_CAP_ID_PCIX);
+	if (pos) {
+		error = pci_reserve_saved_cap(dev, pos + PCI_X_CMD, sizeof(u16));
+		if (error)
+			pci_err(dev, "unable to reserve PCI-X save state\n");
+	}
 
 	error = pci_add_ext_cap_save_buffer(dev, PCI_EXT_CAP_ID_LTR,
 					    2 * sizeof(u16));
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

