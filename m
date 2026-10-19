Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445484;
	b=t9NmFXrrfNbxMovAppj+SJoxkoqEydM3/5LjQ04VSbDOcsbPf5YBPVSDyK3EpgcLTsvy
	 reGFHMvW92uq0Ikq75MPtIE1SZG6mfQmRVn3go5ScL+4VXC29yLi6gdor+G+ml2WxrEWr
	 r/XDODtV8gFXAGOpcNNDPbUeLnmN3dyfx2pAUI2mTv/Ta5TCl9ww4AkokRdQnTz3BXX/v
	 z7JU1h4XxsyKSABC1GxX6w81yWtgANZiJS6dQ4kOcVy5sBfefSKyOmF0HlTlBii0B26c6
	 Rk9p/JtJNFyiB+SW9+PpBEA8TbIe7o/Ks4r6ZfMALhR2Exlb8XgegafVYvkh6RbQKfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=OlOiZMSQAlq56d5O025wMJ9SWaeJFCSne26CemMgHno=;
	b=cUCqgh8BB0es4bIwR2d0hTxwhat5bAxOJxRurb2wTEHu6D0/c28MJKOZ6pQUZf3iEvb2
	 G7RHMny+Hm6EbbsuIocPqTI10E9y03tDo1yMDgTX3W9yCWaHDG0DRbsiMRvqRmvhJzw/z
	 l59k9cD5s41I2/YxarnVEB9iqSQEM7PSOuZLp05/mgWyrzk2cRRuXGMOgx1HCQ5tV6C4M
	 6k+kCsW7+5vyAk/GR7eZOlcOtnOGoDv40LxDjQ7/Md9iVGjFF+sdB3k2+Be2Ja2zfRI32
	 aeSHSQteySOaWjIrVUNbA5oAGksGo9wemuLPPh9oGkG/HIia0XWIukib/+hWNn1ffZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cRVrNlCF;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937BD606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 937BD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cRVrNlCF
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8ad8c5f80so40418525ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792445484; x=1793050284; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OlOiZMSQAlq56d5O025wMJ9SWaeJFCSne26CemMgHno=;
        b=cRVrNlCF9w/4azGXpmG9dwZuRXxSnQTSYK1LT3QO69unTOKZnx3YicN4/TwXs/Cox8
         vDBR/+QohvszWXvUxx8fuoL05UU6h4TEpVotDQeG2x3vRtGzK0hdKNOIlG70IsSPkkrC
         sUl2hdcOiv9zTd5zvBKZ+hm5P4cVcAMMQLrf/GImmSjTJrZk6q26qXqGP6SocFlgQ0JR
         1D1DzAv2LnBH6FKBUCGJGdsyHrJBqqzu6k78x4WU3fiB1QvU2XVJnIp4w8GXnatzrYm6
         DPP3femYI/qGSVOvkSALLf+3Qn/XX+HD0WeCA0dmSgr7ESz4g/nx0KDzxpOV4ONuYKqe
         blFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445484; x=1793050284;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlOiZMSQAlq56d5O025wMJ9SWaeJFCSne26CemMgHno=;
        b=De2c6rOYRVKbgbFKRRHKk9AffWTu7U2l3/nYQ4xy953cHKLlXzGrXARN3xciqnnNHn
         CkFFs2btQCIdxa5j2JdsnmCj0cxiGIYa5zevkZXcQqE7xwTb1X/ICkEBDNE8m0oEx4mM
         Rl7L+3aYW7B5g9xWjh6I266gomQJz2y/UfG+59VUGV2dzccg200MHtronkH/2BbZekbN
         amZllkYPtlHOHAap8DHo/KKI1m8fD+vRlQFUSLU9jL7fFetEYEiDpHgOdf5QWE0EHvI6
         3Wuqpcd64EhNXmFYSjc/pEhpeqVH51HXSBB/n5UxI7IES1NRSsolg5teygoNd8gYhLHJ
         H6/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwGwyzpoF/ecqXRXTyQkIdik7cMqsg+vgabEuMYkvDYnwjKYzwCxcCzsx71KWA4wnE9in2P3IGi/87cKzY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsFEmwEImsK+4KWifyk+ul6kRCpNKcr7+wbNhT8hFvROM/7xZZ
	+rUhEAQ7Gmyj7S2iZJ6rdGj609eovBdzpNAP6Z9q3IxgZ1xuHDq1ewEkYqWFHbqB9nqJ0RweNWc
	QEd2I0i8gvPGZRw==
X-Received: from pllx8.prod.google.com ([2002:a17:902:7c08:b0:2e8:31af:11b0])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f607:b0:2e9:8505:5471 with SMTP id d9443c01a7336-2e9a68343d5mr79186475ad.7.1792445483766;
 Mon, 19 Oct 2026 14:31:23 -0700 (PDT)
Date: Mon, 19 Oct 2026 21:30:47 +0000
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
Message-ID: <20261019213054.3157159-4-dmatlack@google.com>
Subject: [PATCH 03/10] PCI: Factor out bridge window probing from pci_read_bridge_windows()
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

Move the code that determines which windows a bridge implements, which
requires temporarily writing to the window registers, out of
pci_read_bridge_windows() and into a new helper,
pci_probe_bridge_windows(). Probe all windows before reading any of
them.

A subsequent commit will obtain which windows are implemented by bridges
preserved across Live Update from the previous kernel instead of probing
them, since probing can temporarily disable windows.

No functional change intended.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/probe.c | 44 ++++++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 3cb2e481eddf..473e4389ffae 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -520,19 +520,14 @@ static void pci_read_bridge_mmio_pref(struct pci_dev *dev, struct resource *res,
 	}
 }
 
-static void pci_read_bridge_windows(struct pci_dev *bridge)
+/*
+ * Determine which windows @bridge implements. This requires temporarily
+ * writing to the window registers of windows that read as zero.
+ */
+static void pci_probe_bridge_windows(struct pci_dev *bridge)
 {
-	u32 buses;
 	u16 io;
 	u32 pmem, tmp;
-	struct resource res;
-
-	pci_read_config_dword(bridge, PCI_PRIMARY_BUS, &buses);
-	res.flags = IORESOURCE_BUS;
-	res.start = FIELD_GET(PCI_SECONDARY_BUS_MASK, buses);
-	res.end = FIELD_GET(PCI_SUBORDINATE_BUS_MASK, buses);
-	pci_info(bridge, "PCI bridge to %pR%s\n", &res,
-		 bridge->transparent ? " (subtractive decode)" : "");
 
 	pci_read_config_word(bridge, PCI_IO_BASE, &io);
 	if (!io) {
@@ -540,12 +535,8 @@ static void pci_read_bridge_windows(struct pci_dev *bridge)
 		pci_read_config_word(bridge, PCI_IO_BASE, &io);
 		pci_write_config_word(bridge, PCI_IO_BASE, 0x0);
 	}
-	if (io) {
+	if (io)
 		bridge->io_window = 1;
-		pci_read_bridge_io(bridge, &res, true);
-	}
-
-	pci_read_bridge_mmio(bridge, &res, true);
 
 	/*
 	 * DECchip 21050 pass 2 errata: the bridge may miss an address
@@ -582,8 +573,29 @@ static void pci_read_bridge_windows(struct pci_dev *bridge)
 		if (tmp)
 			bridge->pref_64_window = 1;
 	}
+}
+
+static void pci_read_bridge_windows(struct pci_dev *bridge)
+{
+	u32 buses;
+	struct resource res;
+
+	pci_read_config_dword(bridge, PCI_PRIMARY_BUS, &buses);
+	res.flags = IORESOURCE_BUS;
+	res.start = FIELD_GET(PCI_SECONDARY_BUS_MASK, buses);
+	res.end = FIELD_GET(PCI_SUBORDINATE_BUS_MASK, buses);
+	pci_info(bridge, "PCI bridge to %pR%s\n", &res,
+		 bridge->transparent ? " (subtractive decode)" : "");
+
+	pci_probe_bridge_windows(bridge);
+
+	if (bridge->io_window)
+		pci_read_bridge_io(bridge, &res, true);
+
+	pci_read_bridge_mmio(bridge, &res, true);
 
-	pci_read_bridge_mmio_pref(bridge, &res, true);
+	if (bridge->pref_window)
+		pci_read_bridge_mmio_pref(bridge, &res, true);
 }
 
 void pci_read_bridge_bases(struct pci_bus *child)
-- 
2.56.0.212.g129ede20d9-goog

