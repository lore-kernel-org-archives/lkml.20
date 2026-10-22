Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792703910;
	b=ipiv1B/fuUBgqmyZtyKnmLKhAGgiUjrOZen8hMqivKsrWqCcSMBLUcwfQr8IQtYgP3y8
	 HlyXaHaiyMGFsDbZiTya784xNWgKd9qSOcqa5umOzoZ69WbdneQJhTNrQqNYLrX1PsgMT
	 tvE+YTwtxo+k6HsvAXjVP7lmUQe/n3OZ4QFDlIAMb1CGN8km+PKYOtLdbxfIPje+eyIOs
	 kt2fgKXKf/oVIynw6TSgjC8Yz5CrDjMTsH5baBUU7dhiQOPvmegFCjPxuIE1BHysreRiR
	 g5vKjEM/R5Yey2VhnD68nC1OgMOgiLM8LAchaGJ0xXE1o4dWZHY+g7k8IzVwhZGicWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=WsTLwSG0j0rvcPTxUloruhaWzU98+XdsMcTu8lqR+tY=;
	b=cMvtg6JOqrj1zQR1DqYafmCd+a4mi/7/vEUyY/+O4qB71jg/D85rY4jXlNvjCBjjBIXD
	 5rpDTymSbKm46ozeZRN2fPeGe/HRnAJfPS2oh3r/hCyv3S0haGUtQ4oTgszdzp6dr9i34
	 M5dxDdQb39RlPuLmbAFhL/wB+0h4XcEXMnlMjvKVkQ/XH0ymxzYVYt6LDjZvmsS5Q57cx
	 VLzYMCyuIhuTyv26/o9M3HxTTaNX739mjEfH/qXAmd1NnSQqHCsZCxToXDya5T3uZol1d
	 xKgn9VktL+sVVXXOVyfr+1oEDWgk+DRe/aCnGUaUhmKyn6/fxUeu9iHhj+gtnhcJHRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=feedwtV4;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B54606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B54606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=feedwtV4
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6df7f544919so157228eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792703908; x=1793308708; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WsTLwSG0j0rvcPTxUloruhaWzU98+XdsMcTu8lqR+tY=;
        b=feedwtV4TJjqKCyepFs1ntK4KQAHY19WFwsBXYfd9S5IR65Z9uCdA8YDMvirAtZhfg
         4WpAq7mYG6z9xz92B2KFaBF5ZdhoCXWC0Sr0NP2i774o1Ghfi/J9iTZYX5pTEKzEra/C
         up2vtzJfR0gL+fy1QFpY/qlEjXWJJHKlxZZpd7jTeVaczLgbSopKUGjUSMPCTE6uqHf1
         00sV1w9VX3dyd5f2iIHkHVViyfBMIigBcv5aX/JkSv5AUZoXjX7GpxLpP3t1RxL76Shf
         2jBi+9s7Ftq4rAqK1klP0P2t7+gqh5J26ra9gdvlusLyArE8iIpp9NNnCMRBiEmgqLb8
         Iaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703908; x=1793308708;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WsTLwSG0j0rvcPTxUloruhaWzU98+XdsMcTu8lqR+tY=;
        b=lp2ZszCEhX5LZRILuM+AGjJe3I3qWSeloG98ty4ERO2xCIxsCK/umalmiktvMEY97e
         R7FKzbnrmmuKk+QsR5JYA4APkVqxvDQsF8wxaZE32RKJ1ZJ6+4547gu2TQpxZ5OIczWy
         QTbVrxKr+37G8u2CeUsnVR2rsSpUpEgm2jKDJbcqEouoWaP+sDSOYSV6VIg0JWeme9y7
         BL1JjrjRg4SYt4ale4BXJ4LM4bMY2c77g/jO6UeJpBYoKt/ZyWHDiW5Hjf03tWMlYoLP
         TGTm8gTissMEwPeNImoWORp4Cgxdq7syh1ie1D0wCT5lZuYOamFqlNGDPBZ5PhD8d8c/
         INeg==
X-Forwarded-Encrypted: i=1; AKwUvBwIqsTIxN0Kgh7LPXFnGL9OQXi+ASJz/UObfa+sVJuScwwMDhJz5euCm7QyKT/RL+2cBdZ5opJpYfzIrzM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3cIWTiiShOsZogAuVVKDedHbKe/s5azUSPB6Xdc2/m29RENFc
	xrTHUA/iZnIHadkY5niJF7wrBm3dsN8i/UzfGIm5UkdyZuF7lG8XAGbZ
X-Gm-Gg: AYBFou0cWFhXnCyBhDVOJund+g4f48svziVHRY9ElT72+oP+V4Yi/1V0oOj61DCOPy4
	qpc6ZaCHcSgyTc/7UstCi5T43WtAfDNpXTIQ7daKIxzjw3dVFluKWvlvJRp1X/Vl4CmtvWH+nLj
	32s3j8NfiineMA0tSGpmaQT1YKFC312mKcEwPabqBeE1/QcoSIzDh6Nuli3Z6oiWUA1k/AW5zAQ
	KqFu+44g6SwAvfmHry2joyB6niThlC5rMjmpfnuYjFhpZJOOQ21B4qegSEv2jSnuaqWcXw82npW
	fybScA/FQeZlO4xO0DU4Jdpu/TYFSvBifmpilwq8fpqlalkvRZNYpWl3FhCgctC+L6fUaZkyMWh
	zN5YdAtmwitsqGh1xmDW1H4BHtWmU1Gs2rpu4+XHZsdEcmLqc9yf9nDTtL3ob/SJsCJkISsFp4a
	5FclY4SQm9n7XUAXjT05hG1r3oYZMkc7jlDta94V4+OEcKyjTqhV7Ul9ZkIOkoYvQlZYXtIorSr
	L/AQiG10LvK+iXOEhJ71RBWZ8ccu5BWXZE/FLhkrxkjaPHHbr+HTpsZSQ0WNRUteKqw+jjPOGr8
	7rgvU+tV8BYLY5pxbKhia+JoS6cRI2GLhd4bxbL6xO2tx9eEFZINAdtqs0MvfLMOAZDY0lomrIs
	3a85RTTVqboCgYzAjM8NIdWhf0D0xWorChcf3Zl1FUA2bTVucTKbwyQCuLtMn2VifV8DRAfsqhF
	P3rnw=
X-Received: by 2002:a05:6820:3287:b0:709:529a:477c with SMTP id 006d021491bc7-70b88ac1066mr386352eaf.87.1792703908193;
        Thu, 22 Oct 2026 14:18:28 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbd362c1fsm250873a34.4.2026.10.22.14.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:18:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 15:18:26 -0600
Subject: [PATCH] dmaengine: mediatek: uart: make channel termination atomic
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
Message-Id: <20261022-submit-mtk-uart-dma-terminate-atomic-v1-v1-1-aa498ba5da25@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQqDMBBEf0Vy7lITS8D+SulhE7e6LYklWUUQ/
 71JPb5h5s2uMiWmrO7NrhKtnHmOBfSlUX7COBLwUFiZ1ljdGgN5cYEFgnxgwSQwBAShFDiiEKD
 MgT2sGnRv+66zFunmVbF9E714+z89nicX1Zu8VH1tOMwELmH0U42KmOLIka7n7jh+D1/b660AA
 AA=
X-Change-ID: 20261022-submit-mtk-uart-dma-terminate-atomic-v1-19693366ae4c
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The 8250 transmit flush path calls dmaengine_terminate_async() with the
UART port spinlock held and interrupts disabled. UART APDMA termination
uses sleeping register polls and synchronize_irq(), which can also wait for
a threaded handler or for an interrupt pending on the calling CPU.

Serialize the stop sequence with the interrupt handler using the virtual
channel lock and use atomic register polling. A handler that was waiting
for that lock must check interrupt status before accessing a descriptor:
termination may already have masked and acknowledged its interrupt. This
allows termination to retire descriptors without waiting for the handler.

If the channel does not stop, return the timeout and retain its descriptors
instead of freeing state still owned by the transfer. Continue attempting
STOP after a flush timeout, since stopping the channel is sufficient for
termination even when the flush could not finish.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..73d4b701ac85 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -256,6 +256,12 @@ static irqreturn_t mtk_uart_apdma_irq_handler(int irq, void *dev_id)
 	unsigned long flags;
 
 	spin_lock_irqsave(&c->vc.lock, flags);
+	/* Termination may have acknowledged an interrupt before we got the lock. */
+	if (!mtk_uart_apdma_read(c, VFF_INT_FLAG)) {
+		spin_unlock_irqrestore(&c->vc.lock, flags);
+		return IRQ_NONE;
+	}
+
 	if (c->dir == DMA_DEV_TO_MEM)
 		mtk_uart_apdma_rx_handler(c);
 	else if (c->dir == DMA_MEM_TO_DEV)
@@ -400,10 +406,12 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 	LIST_HEAD(head);
 	int ret;
 
+	spin_lock_irqsave(&c->vc.lock, flags);
+
 	mtk_uart_apdma_write(c, VFF_FLUSH, VFF_FLUSH_B);
 
-	ret = readx_poll_timeout(readl, c->base + VFF_FLUSH,
-			  status, status != VFF_FLUSH_B, 10, 100);
+	ret = readx_poll_timeout_atomic(readl, c->base + VFF_FLUSH,
+					status, status != VFF_FLUSH_B, 10, 100);
 	if (ret)
 		dev_err(c->vc.chan.device->dev, "flush: fail, status=0x%x\n",
 			mtk_uart_apdma_read(c, VFF_DEBUG_STATUS));
@@ -415,11 +423,14 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 	 * 3. set stop as 0
 	 */
 	mtk_uart_apdma_write(c, VFF_STOP, VFF_STOP_B);
-	ret = readx_poll_timeout(readl, c->base + VFF_EN,
-			  status, !status, 10, 100);
-	if (ret)
+	ret = readx_poll_timeout_atomic(readl, c->base + VFF_EN,
+					status, !status, 10, 100);
+	if (ret) {
 		dev_err(c->vc.chan.device->dev, "stop: fail, status=0x%x\n",
 			mtk_uart_apdma_read(c, VFF_DEBUG_STATUS));
+		spin_unlock_irqrestore(&c->vc.lock, flags);
+		return ret;
+	}
 
 	mtk_uart_apdma_write(c, VFF_STOP, VFF_STOP_CLR_B);
 	mtk_uart_apdma_write(c, VFF_INT_EN, VFF_INT_EN_CLR_B);
@@ -429,9 +440,6 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 	else if (c->dir == DMA_MEM_TO_DEV)
 		mtk_uart_apdma_write(c, VFF_INT_FLAG, VFF_TX_INT_CLR_B);
 
-	synchronize_irq(c->irq);
-
-	spin_lock_irqsave(&c->vc.lock, flags);
 	vchan_get_all_descriptors(&c->vc, &head);
 	spin_unlock_irqrestore(&c->vc.lock, flags);
 

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261022-submit-mtk-uart-dma-terminate-atomic-v1-19693366ae4c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

