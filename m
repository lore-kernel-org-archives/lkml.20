Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925791;
	b=BKybR5Z3rDXsOH26CPZECE+5UlwujqeYHzEyHWf5ea/nigV3Lo7MRjQhB3ZZ3Nd/QeIr
	 lTblklr0zQdbnlWKMercWMONwaZWYNgjIe+fnJmGnUYhZtMHzMQRezV9lM5AFKaTasZOM
	 2+5d4IEvVEWMKFwx+Ql9TaBwNfq9P/Y5dLEez/36nE+++UbAqCctg2uM1+JbcPO5bQT+n
	 U7d8BGweOXLE65Ap93jHHUliOn9DzT2UHMwB0yrRKnbQEtthBj0uWkDEiCyO9NvnHnt29
	 +UjQ3yeFhXOB20qT7qQFoOevd6m3OcsTZDtpuCp1P9BZNuiVrIl5Atmoa9QSPScp0tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VfIh1JSY3MeIq0CEtKa0epmsvwLqQj8oYtgMnnQZzbo=;
	b=MYzrxPE/WiSBl2pVohxko+LyaJ/WQO4tvA7Izx4vykDSSf2qHKr7RBI3oC3KImRvJSwI
	 +eOO0j3ySDcfAvejIkasaurtPEEOoLRqSnLAMasPkDi0lP2X4kJykb4OO+v3sTfJ6svmO
	 0B3uHL4qCVzMiwSSX7raxaPxiZ4Mq/2g/5Je86Afwh1sxkl+5QIFN34UiiwjZF2NPNrPb
	 vf1f/CtSeaTdXzcYIKyPGXD+0L+9gSCXgKzPAc+plIeHK1Icp3kbCowqw/rFn0toFY24o
	 Qhu20YA5ROtKjMRoXlAwhVrip1hAZTh4BXTcCcoWVf9pYsf7ou1RR3+fhLL+9/p/pZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p+nSHsB3;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE44606A336
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DE44606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p+nSHsB3
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cc89e86e9eso85732b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925790; x=1794530590; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VfIh1JSY3MeIq0CEtKa0epmsvwLqQj8oYtgMnnQZzbo=;
        b=p+nSHsB3NVQ3/VN95+llHuQrwOSf9rabn1to0JLMo69u9oII+ko+BKDLNSxxg8aQQQ
         Keh6EvXI12h8ds93cvj8jDWZhLHgcPKL1nWrnOxV3QnEI8baNcksmI31Ptyl4jRmyMXm
         I0+nHgmB+x2jOovCBjRp2gaB0B36guv3bsx9azgkxvoiE2kkPNMtpudNu/axRRkm+ZBU
         dx/g4XMPLCKgGByzOc955d0LaXHbegZ2C3ZPYajpTBwXphKQeO2vQWFDQG9bC8YEHi1Q
         b6gjKyxu5LwzwkmuljzQg3J8SUkhF/quNbhyO8jV0ugz5iKh4vi3sDDJBGZpm9DgxJc2
         C3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925790; x=1794530590;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfIh1JSY3MeIq0CEtKa0epmsvwLqQj8oYtgMnnQZzbo=;
        b=s7jVKPYYfdPm2n7KfLRPuFnVc79mnB52d0Ye1p9byjPbLcpNz7rH0YpPQogqm7Ic2k
         DH+0i+KH2JZsMZWC2G7ekoBt5+OEEvbrIZWhsdLLJDinun2icyfsCJNq5UNGkAkdQMKG
         vr1FcOcvGv0qV/dGL13g49aX5ax6h95f93q2YzgotEIm8G1BiK5s15P92nH+EXtmloUB
         BgXypkG6PQtEUKoFUxGyWb/esylN4IGZ5DQlQLnqKqe4Ve+Jz7L9/J9yi0yToto7J141
         eYfLhxwbIHpOnPZTWq403TMJdW19OUxOPtSLZE9f8M0apFkWsKEgloDaxqpmkOYL0B2d
         +imQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ3FxfKoa4/o/8CSPc+6m2ZC0SgUZuyTOVdiV1cVtMSCPPMeFe5aMWevV4hvZ66Ohz3uCAoOTfK0MhZGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vh3ancoPZgxnr7YUAZOEH6iWdOoWzsorNBtWps07PDThXD7Xz
	zD51l27cWgy+apTKhUDPQ2tJxMp+gMHqcw6DigypN2GM4CzmBUXhjWekgZdWEslVcH+VI9kKCqz
	50qzvXzsY85Xa7w==
X-Received: from ioo11-n1.prod.google.com ([2002:a05:6602:864b:10b0:9e2:221a:fd83])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1a21:b0:561:fa43:1b2f with SMTP id 5614622812f47-567e0fc17c3mr657310b6e.20.1793925790093;
 Thu, 05 Nov 2026 16:43:10 -0800 (PST)
Date: Fri,  6 Nov 2026 00:42:12 +0000
In-Reply-To: <20261106004218.604799-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106004218.604799-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106004218.604799-12-dmatlack@google.com>
Subject: [PATCH v2 11/17] PCI/DPC: Save DPC state in the saved capability store
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Cc: Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, David Matlack <dmatlack@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Lukas Wunner <lukas@wunner.de>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Save and restore the DPC Control register through the per-device saved
capability store instead of a private pci_cap_saved_state buffer.

Key the save and restore paths off pdev->dpc_cap rather than
pci_is_pcie(). The old code relied on the save buffer existing only when
the capability did, and the store has no per-capability entry to check.

Reserve the register in pci_reserve_dpc_state(), called from
pci_dpc_init().

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pcie/dpc.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index b7f79266f66d..16203e9ef240 100644
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
@@ -400,6 +384,16 @@ static irqreturn_t dpc_irq(int irq, void *context)
 	return IRQ_HANDLED;
 }
 
+static void pci_reserve_dpc_state(struct pci_dev *pdev)
+{
+	int rc;
+
+	rc = pci_reserve_saved_cap(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, sizeof(u16));
+	if (rc)
+		pci_err(pdev, "unable to reserve DPC save state (%pe)\n",
+			ERR_PTR(rc));
+}
+
 void pci_dpc_init(struct pci_dev *pdev)
 {
 	u16 cap;
@@ -408,8 +402,7 @@ void pci_dpc_init(struct pci_dev *pdev)
 	if (!pdev->dpc_cap)
 		return;
 
-	if (pci_add_ext_cap_save_buffer(pdev, PCI_EXT_CAP_ID_DPC, sizeof(u16)))
-		pci_err(pdev, "unable to allocate suspend buffer for DPC\n");
+	pci_reserve_dpc_state(pdev);
 
 	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CAP, &cap);
 	if (!(cap & PCI_EXP_DPC_CAP_RP_EXT))
-- 
2.56.0.455.g6c5a503b38-goog

