Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0614A8A1B
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637236; cv=none; b=DjWBL9LFJx8DmHGIeEnVMLU2jB5aEnnxdAyZTzsuYYvca3N7XdSy8rAYlEoqIx3GyHCjTZZALf/FBl5QCSURqY1knjRu37ahVdZirugPfnhORZrlxLdwCpr1XQOrAaKfeQhyDvW+RXvPzZ4GX80sLEfdwU8KhSdBN4OheUqpkRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637236; c=relaxed/simple;
	bh=I3mvtx0Ku7o4wZPkC8Z9k+objo+CZJZNuiJWkR/XnRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6rRnWGFMExgauqxnvSf3DS84C/qoE8lWEfKKLFv1t4lf/tzK1u/jwA//kNDv47FSCGRtgqnd3K4/bds0axjwx+z3NyCuShM53cL2ZwMqW5+g9ACTLrlW75j00Nneb3o4A8urjkZPvaFfdbrVGhFPUuPkqPnjaqOuW7ZiIOb/uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8n2lzvj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8n2lzvj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49ff680331aso4914945e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637233; x=1792242033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSOY2agxT2iMt962Kcsg74ayJKaWCLdSy8T10g4JvDc=;
        b=S8n2lzvjoLYztV3Ss/yKmPcrgF4ncUbknJ6Ue9MtllrDZzRJnYkVLsopB7FkfIPE9W
         0N384mcdp85pOPZrCGtFnjh6zrIrqdfANKZ9sWIynUhUd5fijjscKXN7ixSKIEuNjJtL
         40Q1To07pGpdStX6yT3lUOecvg6IZpjMAnlwnla1ottMWkjeJVp/UWOtJdMAvysEw2Yy
         hPvyz+uQX0VBGtSQ3EFLYqlbxbEpjSVrK+sEwYmkUCFhbPb5pH8vQ1Lxc1QCG10+8scu
         A4Co7LoN4fo9PXuGX7YWa4I2JvAbfHBvyLBIBYoHx6KVxXluQ4RNShwdFSlniSbsNgdm
         lU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637233; x=1792242033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSOY2agxT2iMt962Kcsg74ayJKaWCLdSy8T10g4JvDc=;
        b=Bv+uDy4M6fsQ0LTFPFe+WxiDO4mFfno785oobUaGnBbZyKJ7nsNEaODFcTDauYHaWk
         MG/UNoF+ABdJkf52JGzeqTkzAmR8j3XHrAFHgZCLfKTbEJ8uJ3RenZUxk6wdmdJR2Kuf
         2CYq8B/TsdSyixCeRIOoES0H7LTZx8SkhAJw2+gVtvsZ4qvAO+aN4o1Ez5Z50+j2/uHw
         njR1hUms2PkTOWuG6DQPCajlwDfT3ZPud2yEkwOB+8avlCB4DcRxvZb2k36Tw6L3YgiQ
         ic+4rqLh8aSDUaG/dbXKYeOBeq+VEKDJZ9IjtkVsGnX3LoJlAFGr+2QNXJnoHoPA7R78
         iGLw==
X-Forwarded-Encrypted: i=1; AKwUvBx7LLxlkOTgvIQ112o7rEAamkRC4+Xs6Ys4qScabjHIAideIjsH/IFFk98656yCchky+q9/JLu4KUXF7w4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBUnT09VSZtbMHd5i37FjnPCeKXqBsxJJvF8OZxMgFiCSANXFw
	8flPIteK7E/c2wu5KONP7PrizMiLGBXAc/Y+gV3mMvtPh1dwxYmJpRlq
X-Gm-Gg: AYBFou2f9Qym7Q6/w8XeVvX2LjDkKR2S9dAuifjL5uRs6FlNwqc8TPQ/vJfiNuhygsy
	mdg/V21cVQuvpknsKTNGa1KhJJGAw7gvCFYmmna+uUk+8ZUwCt15TRbnjwK8yvpOs7tu0uJxXIi
	pYHrLYxYxLAvX2ukndW86SEcapJ7haZtt2cZy61V69nL+ztHs5hMcunVkxfVqCn9a8Hg0J/OHXf
	2a8xENFIkIusHN9RhlarcSsq2LJNskKKDNS+rMCB36ASQQiIMOffycfBra+Q1NthXzuXBk/rH8D
	K/Tb6ArnQcXnEmj/PkR9EFzQrXWEDK4hhd1kj+2ffVRIHUqSfa+7dGuw7JXRU0w2moMUD3l/x84
	tDlsnPq7vw/NyY4fww+S5ujyJvKIyB7VZopUpLPPcvLSY+M6qJLdy2PyjwGew83bWPHWjCcm9kl
	9USqOkTo3sB7V4bQfvT/7gQXPUJwV4oXdUW1FX6ZBAhStldykBMWE0AYCmNamnZ4CfEEZ+hYWHG
	wR37XF6G80+6tXasJlik+MODu0n9Kv4eKY5flmbngJ0HlRDLfCKPm4rW1fVjhFXM5f78IzfGnNf
	jbihxv7wjuziXtPCvDBdrfPPGi8pPyraobNgorl6CMvoplPDC2Ax5WgoqIIeGmzBOcC4I+Dv
X-Received: by 2002:a05:600c:19c8:b0:4a0:1a7f:2abb with SMTP id 5b1f17b1804b1-4a18e47ab20mr94757755e9.11.1791637232698;
        Sat, 10 Oct 2026 06:00:32 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:32 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 03/24] wifi: mt76: Serialize MMIO reads with outer cache maintenance
Date: Sat, 10 Oct 2026 13:59:41 +0100
Message-ID: <20261010130024.177503-4-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apply the existing workaround to current mainline mt76. This depends on
the preceding ARM API and needs review together with that API.

Assisted-by: LLM

The implementation is refreshed from the existing locally signed mt76
patch; this new draft still requires review of the final dependency/API.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/dma.h      |  2 +-
 drivers/net/wireless/mediatek/mt76/mmio.c     |  6 ++---
 drivers/net/wireless/mediatek/mt76/mt76.h     | 23 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt76x02_mmio.c |  2 +-
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |  2 +-
 5 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.h b/drivers/net/wireless/mediatek/mt76/dma.h
index 7694764feb..721c54b92f 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.h
+++ b/drivers/net/wireless/mediatek/mt76/dma.h
@@ -107,7 +107,7 @@ mt76_dma_handle_write(struct mt76_queue *q, u32 offset, u32 val)
 	u32 _offset = offsetof(struct mt76_queue_regs, _field);		\
 	u32 _val;							\
 	if (!mt76_dma_handle_read(_q, _offset, &_val))			\
-		_val = readl(&(_q)->regs->_field);			\
+		_val = mt76_readl(&(_q)->regs->_field);		\
 	_val;								\
 })
 
diff --git a/drivers/net/wireless/mediatek/mt76/mmio.c b/drivers/net/wireless/mediatek/mt76/mmio.c
index 73d47608bf..95c6fe27f3 100644
--- a/drivers/net/wireless/mediatek/mt76/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mmio.c
@@ -11,7 +11,7 @@ static u32 mt76_mmio_rr(struct mt76_dev *dev, u32 offset)
 {
 	u32 val;
 
-	val = readl(dev->mmio.regs + offset);
+	val = mt76_readl(dev->mmio.regs + offset);
 	trace_reg_rr(dev, offset, val);
 
 	return val;
@@ -53,13 +53,13 @@ static void mt76_mmio_read_copy(struct mt76_dev *dev, u32 offset,
 	int i;
 
 	for (i = 0; i + 4 <= len; i += 4)
-		put_unaligned_le32(readl(dev->mmio.regs + offset + i),
+		put_unaligned_le32(mt76_readl(dev->mmio.regs + offset + i),
 				   data + i);
 
 	if (i < len) {
 		u8 tmp[4];
 
-		put_unaligned_le32(readl(dev->mmio.regs + offset + i), tmp);
+		put_unaligned_le32(mt76_readl(dev->mmio.regs + offset + i), tmp);
 		memcpy(data + i, tmp, len - i);
 	}
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 62b41c8bb7..54b63ba614 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -20,6 +20,29 @@
 #include "util.h"
 #include "testmode.h"
 
+#ifdef CONFIG_CACHE_L2X0_IO_LOCK
+#include <asm/outercache.h>
+#endif
+
+/*
+ * Some SoCs deadlock when an outer cache maintenance operation runs while a
+ * PCIe read is outstanding (see CONFIG_CACHE_L2X0_IO_LOCK).  On those, take
+ * the platform lock around device register reads.
+ */
+static inline u32 mt76_readl(const void __iomem *addr)
+{
+#ifdef CONFIG_CACHE_L2X0_IO_LOCK
+	unsigned long flags = outer_io_lock();
+	u32 val = readl(addr);
+
+	outer_io_unlock(flags);
+
+	return val;
+#else
+	return readl(addr);
+#endif
+}
+
 #define MT_MCU_RING_SIZE	32
 #define MT_RX_BUF_SIZE		2048
 #define MT_SKB_HEAD_LEN		256
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
index dc7c03d231..0fdf2e3a2a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
@@ -357,7 +357,7 @@ static bool mt76x02_tx_hang(struct mt76x02_dev *dev)
 		q = dev->mphy.q_tx[i];
 
 		prev_dma_idx = dev->mt76.tx_dma_idx[i];
-		dma_idx = readl(&q->regs->dma_idx);
+		dma_idx = mt76_readl(&q->regs->dma_idx);
 		dev->mt76.tx_dma_idx[i] = dma_idx;
 
 		if (!q->queued || prev_dma_idx != dma_idx) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
index 8007e62004..4c57e66a21 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
@@ -36,7 +36,7 @@ static struct mt7915_hif *mt7915_pci_get_hif2(u32 idx)
 	spin_lock_bh(&hif_lock);
 
 	list_for_each_entry(hif, &hif_list, list) {
-		val = readl(hif->regs + MT_PCIE_RECOG_ID);
+		val = mt76_readl(hif->regs + MT_PCIE_RECOG_ID);
 		val &= MT_PCIE_RECOG_ID_MASK;
 		if (val != idx)
 			continue;
-- 
2.55.0

