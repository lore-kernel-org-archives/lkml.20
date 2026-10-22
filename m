Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698060;
	b=0CugSQmaRNUTIRRgf4Erqy3iEfMP/U9gfY/U/kSHEH1sE+0Z4CURgEzM40g87KHO7JJY
	 E3keQw9Tcy7R71J5SuVo+9oWx2GldH8etg+hiQQ+f0ETJVMavxGLNkXXJa0yq+CaJx90Y
	 hytA/KuxxLpFIjjJceJ5GrsbRHNUmj9JrpT0PrmA8JZlECfOVuYqrkuE8URPaXJlXbFdp
	 Ofu89Ksh10l9jsMam4iI4WXC/Aypa6ue8KZqB5Xmfvi1OJOwtdvyKYQVuDOJD5vkqLDA7
	 4NW7HQJwqHGZRdaeXYmBAz6BrmcKn623Hs7Retoj446LFTTNZFVQJayjWAVpz3pdy7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=rMu7gYcxvQNy61MemzFOFXFmQujG4mGCgZD776uY0wk=;
	b=fZ/65wm8oxthcqZ8hEhfJtws88l/ZweR1UgbSXZgm4xygYCJWBLkFV0pe6HkNlw0OvoC
	 4hhuWXpcDGBmovMJcJDoLHn3R3qcSorps3wTgc9HStztJqFCludBsv9hgmsKAuvdasbgv
	 T5izD4Ua1hQ20sk5Hhw5srTBwDre6cDCwglUB1Uaz2Bhwxmk+siZ4GzEZTEcby87sBkBP
	 znDif4WSi2kQeObaQloChAPOciczrs9mM4wktKtigKNgacCEV2DLNnpukxfo2XWfPAZqF
	 2lRMqge0lXqPUHsXs0IOjeVU8I2kC5SUI0/6rN9B/RBSmePvxrE2S6aJUGF6n8yAJ8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kfRYEeIa;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038E9606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 038E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kfRYEeIa
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-70b875f6f1fso105306eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698059; x=1793302859; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rMu7gYcxvQNy61MemzFOFXFmQujG4mGCgZD776uY0wk=;
        b=kfRYEeIa7DkLyy5+7TTOAJvwhXxE09LCxrE8jesDq+E8ioWfi9aeMvlnUFx6uaB3E6
         fFJWWNuSRiv0sRkQAAh6NZhIp/e7uDCjcDbZruZWVlchkaXjxGqihaQWOQ5zKouAMbQf
         /uKVmCpFhEuZZlaaNIKG9JBFfOgdUphRTS3ZqMwBuEZloS3iqGKulzKODVfglsl+dCkz
         KYk7y8B3HA7SvVrpYWVgTbxorLEpxIrrmiOlJnBFaqzb/tOBS0q/WBGEuhh3nnjyGZCD
         Joy7OcPErsmlhdsuBNx8tq8ut2RfMl2QXUhV8DmiHIp0dbcSDfowUbWedb2Eh5QHjLYM
         UUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698059; x=1793302859;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rMu7gYcxvQNy61MemzFOFXFmQujG4mGCgZD776uY0wk=;
        b=s7hQHuSzI5ZjACLIdIWYiE6N4mLgzVG8RmBVTQYgPXnMr20wF9IytbRT7uqf/f4Jpc
         wh5ISf8VrK1B3QP2oIAOsU/oJpeQXha3i1wUiGwImeY8QKbuYIygTNAjZDzbRcM+iOtj
         sS5nGjZJKO9UBNaXOv97uhsXYKf6XRW+8eS+ObfYhz7VFtglv/9x8jhJ6/VcDMRW1SLo
         T/t8Dv0RIz77QJQrZ/p6VVP0FzFrGunmOnXGnKm+NdskFhsAC3kxBud/7B4TAGcXDuOg
         XdgvGEH0fxLKA6cFJU/MenjKHvD6Sk2RZbXjxikOt0F43QTzjbLb3N7yDL3xF1jRtvtZ
         Lksw==
X-Forwarded-Encrypted: i=1; AKwUvBz3Z7PCYNxSmecPgCgCe307ryA1jxJYiPQmeQepBc6ho6WSo6YubuyxJ6C1Q6BSZYDYMedcEAswlOhJ/jE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxBgDwTgrZPaAfXjLibvOFlo+qjRHgCDi4rW1VUsEB4vmJHFvl
	lmgzvJyVaFrsWeGW/6T1gdBn9fFvqNPnJmj2x1Tf2M3wC/NddXYZlG3e
X-Gm-Gg: AYBFou3rTFkXK05EO3ABcZJP2fHT60xo8Kh5W7A6AgR5YbfvKDMXClOqdZ5UcdJcJi4
	1esZH2UbO4F4ltH0fp2uyqKBNimXj83p7lXzV/fAHUcnJr5CYWE0gk5TqcJCBOLRMReV72A1ka4
	oFuQaqVkfps+RMM0GTaJBRxLoZU1DI+xHOx7sEWrmtauvyEqmXr0k5LK/igrJd5fjBOS8k1EI1f
	tmQdsAItvrqKT9Kveu6zIek8ejh1a/picMlRxB6tyTNHH5VINLwt5IZJ5PJl5P/9o0HQWMdrUnN
	FNBRhp9c4vkHoU9Bsh0kdLdkZqlaxSaYRo0IRtLUeE6+kbF77vBM4s7Fze/HcBF0HXtbsOGZSOd
	PT8yVFCztlEMbrGqAVZ5Z9CM5mSiQvIdgVEOup5kYuldvIj67+744UPoHXMUMP6IX+AOrqUu9Ue
	5AJJosmflkLz/LCbT7xYPGpmkEyIXasEQ54Mqz1icZ8yu7uDXxA9LWNaQ0l4ykUQL5YAk8yymjS
	yOhKidDOS/LUjdA8oBnx3ruvrGjAt0pEd8D8hAUTSODAbJY2lwwjgYsntC7pWs9Px6ClnkwS29v
	6aEr3NtIcnBr9bwKqSTvUpAXKRl2k/bou9aTfWq8HaKyUNl2K6myqveGoL9ubegajYGZm2v27P2
	bPlRQ+q/p0x+4MdXGcuZYi3BNbjKhM9niukRTxSyf26iWLQfmrA7iSPVKCHssFo73t17KCcI6Lw
	LkWWj3blBItBpdhkV6+RECRUXf
X-Received: by 2002:a05:6820:6784:b0:709:8fcf:6d9a with SMTP id 006d021491bc7-70b88aefe41mr234594eaf.78.1792698058797;
        Thu, 22 Oct 2026 12:40:58 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b8b2c4561sm42639eaf.9.2026.10.22.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:40:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 13:40:54 -0600
Subject: [PATCH v2] dmaengine: mediatek: uart: synchronize completion
 callbacks
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQ6CMBCFr2K6dpTyI8SV9zAsShlg1LamLUQk3
 N0WTuDyTd775luYQ0vo2PWwMIsTOTI6hPR4YHIQukegNmSWJumFJykHNzaKPCj/hFFYD60S4GY
 tB2s0fREmDryoZJUlWVOUOQugt8WOPtuTe73nQHmg9JEcG41wCI0VARNPgYm6J43nfRcaAzlv7
 Lx5TjyS/lKKVpB3Zckr2WGX81uvBL1O0ihWr+v6A72DrsYIAQAA
X-Change-ID: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.li@oss.nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Terminating a UART APDMA channel waits for its interrupt handler, but
completion callbacks run in the virt-dma tasklet. A callback already
removed from desc_completed can still be running after termination
returns. With no device_synchronize hook, dmaengine_synchronize() does
not wait for that callback either.

Add vchan_dma_synchronize() with the DMAengine callback signature and
use it for UART APDMA. The shared helper wraps vchan_synchronize() so
drivers can assign it directly to device_synchronize. Document that the
termination path must have stopped the channel and prevented new
callbacks before using it.

This lets clients finish asynchronous cancellation before reusing
callback state or freeing DMA buffers. Keep the callback wait out of
device_terminate_all so it can be performed without locks acquired by
the callback.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Add a documented vchan_dma_synchronize(struct dma_chan *) helper in
  virt-dma.h and use it directly as the UART APDMA device_synchronize
  callback, following Frank Li's review [0].
- Link to v1: https://patch.msgid.link/20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com

[0] https://lore.kernel.org/r/atoz6M7RHU14_a3J@SMW015318/
---
 drivers/dma/mediatek/mtk-uart-apdma.c |  1 +
 drivers/dma/virt-dma.h                | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..6bc4f20d8b06 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -514,6 +514,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
 	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
 	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
+	mtkd->ddev.device_synchronize = vchan_dma_synchronize;
 	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index 59d9eabc8b67..f1fc3bf48275 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -234,4 +234,19 @@ static inline void vchan_synchronize(struct virt_dma_chan *vc)
 	vchan_dma_desc_free_list(vc, &head);
 }
 
+/**
+ * vchan_dma_synchronize - DMAengine callback to synchronize a virtual channel
+ * @chan: DMA channel to synchronize
+ *
+ * Use as device_synchronize when device_terminate_all has stopped the channel
+ * and prevented new callbacks from being scheduled. This waits for callbacks
+ * and frees terminated descriptors through vchan_synchronize().
+ *
+ * Context: non-atomic context, with no locks held that callbacks need.
+ */
+static inline void vchan_dma_synchronize(struct dma_chan *chan)
+{
+	vchan_synchronize(to_virt_chan(chan));
+}
+
 #endif

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

