Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445482;
	b=V5EHVsHDmrAmtxTm3TzIikX/f3+2+NoMPtgGZfWrGEipvHRqN5VEfHUQHw+2iBaD5Adx
	 OQRA2kQvsgYlkGL1f4YTpuDnH8/CPEMP45jWi2QoU7Xhttww6zs2nslvT0Oi9vqt4hnPT
	 fslQD6X2iAQBTDYZElFnC+SOQ18stxddSxuXpUho8L71m5nkfpS1CZ7eFNo3S6PqgH+vS
	 l39gtgLX0os/bRVPJdEzZQxsDaqiMoX+89oxmDATNRljnI60Q6Cf7QkaDVB6fCZ7xQ2ER
	 dt380mCIb8Yon53fotRTbZI/tkbPVVXP2WlZk6K0IK9n/vabnwCJ6PhkTZs/qxbjYgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=C0Zll4v1/3YDrC6QBHjix9780IIPkFEga7v4jahmDjE=;
	b=GgrGMJOY3jr2ZPvMBsr9Y2p9IKGiCRT+5BrQxkfvl1NdyLU9fXxCpwwYUT4z5FdgzKV4
	 z2mxOYHOsB8zTDRNYKIVBsEOz5cxnfMRjPDzFh/z3VNs7pItu4lN3eGQkaxmEqDIlscNe
	 tqJgbNw7cwnL4pYg4+Mx4JKCk882nOItE/jwcVGb8zWNHGjBgL0g4dF3Z+HRW6TSzpiHf
	 YzOoaLcRaB1wDiBQqtsx4GQo+ycd+2p/iFXXDbDCl2iBIOUFsWOKhLJm0GP/OlhprK9X1
	 w4FxusgX08ekwphk/nnxR+3rLX1y7n8veYScIQKqe8EN9rgbfl+qRge/pg4ticLeWPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NBFkJeVM;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E9B606A322
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68E9B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NBFkJeVM
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df8d1e91c9so36409295ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792445482; x=1793050282; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0Zll4v1/3YDrC6QBHjix9780IIPkFEga7v4jahmDjE=;
        b=NBFkJeVMyxdbH98zHz1NMHulh/7X5HewFVCuGz+xnYtysZf7WinWjJe9PaH8TlPnza
         t1dCb7taJpZ/AlfKcpCBosBe/GZrkz4DhdnHk1P5D5wYRW1HmuaxGRA3zsGDM4ryDvCB
         izadfbOZ3yAm6qEfHHdzqqhplnSAuVbyHsVh/VgJ2j9iD50jo4t8GBgIlqc+yMaMHe81
         E7WHvRl1vUIiZzBHWbbS14thXGuud80N9t/iR93oW35F5LuB1F+GhJXv2DijqRISrBOJ
         my0We9gTKNBf038MBPCHvWXktzcS67P/l7xgywffh5jIYcQL4b5zV4yTQ2TR4GgdCrqH
         s4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445482; x=1793050282;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0Zll4v1/3YDrC6QBHjix9780IIPkFEga7v4jahmDjE=;
        b=H4XFhLqWIRBe5ny8Vw8+rKu5sFwQ1fekFNd0F+72LoTRVhTqoNH3SrrKdCQp3SvSQf
         TNIX+IFPtgm395OHmbpPObUSa8Q/pZERz1/MpvoEpq2vxNJO+NydWCGnBaKqpCOf2kJr
         jF46bRGfLqe04MTKpLEJiYzJmM/hgMZWRumjMyXg02EJSKSgBpIq1GNzKu0b7/cG3Dnk
         BfNK/jjJ7U+DC9pqd3ua2+n0snsK/+mGloXlrWqwYEQgy7SqQmH8G2Ms/i807Of6smFo
         LmyV1aoNrjs6xXWfytpDYw1nXWUtTKNcq016ZzbmuUt313mkwqfxnVLAnRiQOHJ09oEA
         cwmQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7e4u7QqXiI1lgaVN57UeUtvlUuvM6oMZHPOlBMPhFKh3ge7s7TkI/7CY9KBqfd6PABE2n56GA5eZk5z4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnnbI4nMeNEdXlRgsPD5PTCpy0dhmDIbidK/8EJb96b56XfQiL
	QxIyhb3MyQJccMV4/LE6wYoXqXfp/LVtT+1994mHrm080z0C8NA/4+hidGBm3ZedtqwYWzM8Ayl
	GjLIwWLYqVKCKlQ==
X-Received: from plbbi9.prod.google.com ([2002:a17:902:bf09:b0:2e3:c3e:def2])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e84a:b0:2e9:4b65:368e with SMTP id d9443c01a7336-2e9a6d1eaa1mr80079565ad.15.1792445481409;
 Mon, 19 Oct 2026 14:31:21 -0700 (PDT)
Date: Mon, 19 Oct 2026 21:30:45 +0000
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
Message-ID: <20261019213054.3157159-2-dmatlack@google.com>
Subject: [PATCH 01/10] PCI: Factor out BAR sizing from pci_read_bases()
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

Move the code that sizes the standard BARs and the Expansion ROM BAR,
including disabling decoding while sizing, out of pci_read_bases() and
into a new helper, pci_size_bases().

A subsequent commit will obtain the sizes of the BARs of devices
preserved across Live Update from the previous kernel instead of sizing
them, since sizing requires disabling decoding.

No functional change intended.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/probe.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index debe0ad1ef68..9187f1d91766 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -323,22 +323,11 @@ int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
 	return (res->flags & IORESOURCE_MEM_64) ? 1 : 0;
 }
 
-static __always_inline void pci_read_bases(struct pci_dev *dev,
-					   unsigned int howmany, int rom)
+static void pci_size_bases(struct pci_dev *dev, unsigned int howmany, int rom,
+			   u32 *stdbars, u32 *rombar)
 {
-	u32 rombar, stdbars[PCI_STD_NUM_BARS];
-	unsigned int pos, reg;
 	u16 orig_cmd;
 
-	BUILD_BUG_ON(statically_true(howmany > PCI_STD_NUM_BARS));
-
-	if (dev->non_compliant_bars)
-		return;
-
-	/* Per PCIe r4.0, sec 9.3.4.1.11, the VF BARs are all RO Zero */
-	if (dev->is_virtfn)
-		return;
-
 	/* No printks while decoding is disabled! */
 	if (!dev->mmio_always_on) {
 		pci_read_config_word(dev, PCI_COMMAND, &orig_cmd);
@@ -350,11 +339,29 @@ static __always_inline void pci_read_bases(struct pci_dev *dev,
 
 	__pci_size_stdbars(dev, howmany, PCI_BASE_ADDRESS_0, stdbars);
 	if (rom)
-		__pci_size_rom(dev, rom, &rombar);
+		__pci_size_rom(dev, rom, rombar);
 
 	if (!dev->mmio_always_on &&
 	    (orig_cmd & PCI_COMMAND_DECODE_ENABLE))
 		pci_write_config_word(dev, PCI_COMMAND, orig_cmd);
+}
+
+static __always_inline void pci_read_bases(struct pci_dev *dev,
+					   unsigned int howmany, int rom)
+{
+	u32 rombar, stdbars[PCI_STD_NUM_BARS];
+	unsigned int pos, reg;
+
+	BUILD_BUG_ON(statically_true(howmany > PCI_STD_NUM_BARS));
+
+	if (dev->non_compliant_bars)
+		return;
+
+	/* Per PCIe r4.0, sec 9.3.4.1.11, the VF BARs are all RO Zero */
+	if (dev->is_virtfn)
+		return;
+
+	pci_size_bases(dev, howmany, rom, stdbars, &rombar);
 
 	for (pos = 0; pos < howmany; pos++) {
 		struct resource *res = &dev->resource[pos];
-- 
2.56.0.212.g129ede20d9-goog

