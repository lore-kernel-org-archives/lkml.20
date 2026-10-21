Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617208;
	b=4WaasayASjqHbhnE9oDia7FPTlldGiUlBPTZKyIMf9vbEhIlKpe9TDPpDul1Gj3k9d2f
	 gW7JUtYuXGzsyv3tidx/lXgieibMf+5VTCIFxpH6boB9GYoM3zR4SYG3YDtPMXOLgz8De
	 Xw8m8gGR1xnG2Zxobc32ZvwUQZ6YxUcwIXG1eTj/H4Q4ErTlXfFSojEzB3m/4Qz92T0DW
	 UV+Emc8jRGZRTvu5Tqd/2zggc3v0iVIS1iTv3wtjumPKMGp9EJcvAB09FTouSQOmDdghK
	 /OspGntO21VEDvT8H0jv0FwEWv2K17gCtkoI+IydbTRrMs/Gtd/eSIq0NWf86+EHAQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=/7ngeHbVYERGvM2jFGnKfOGGvB7UaeEskne35/Ksbe4=;
	b=II9EZ+Z58c97zs6Ms4gCNHhknwaK3KOBpRYes59qYjoTXczJdmNjZbFi2XBfjsrL2AoQ
	 m6zf5WAv7rotSsjDHLDgVYBRNK1w0fbhfowDoHvMXtGjchrQ/WAYpup+1qEG66OCU0Spi
	 8Kh3WEN6Ml3Q8rLf9mdy0Yq7AKKy0ePcTWlcrz+u9SmkoS8vO05ixnxLn5hMEEoRsXP9F
	 C3lxom4usz4MyWF625zNhqEW53NeOwuvdRiS3kWK7X3fblYhRByoqK+MQDUI5ORT6Ykb8
	 y4P0G/RcdnYsufuWEDwPf2XbIftFGuwY2HMb69KCrIVzWg4vKXTW9fIvKfaVdJECmRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nXBxexHO;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3182A606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3182A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nXBxexHO
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-823b938464fso888810a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617206; x=1793222006; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/7ngeHbVYERGvM2jFGnKfOGGvB7UaeEskne35/Ksbe4=;
        b=nXBxexHOKlOPbmS+f73MXn9AAeg37WWhsukvk/EEljTr/RmjADJfk1hxNV5fNamtQU
         0VGdRUdivQ0ie+pZtDaodRtq1/260bP1B0O6LPh0catbldbRXtoUQjxM4CAyUkXMS5Ef
         yuzJ76g2o/UaMxeR+td6gR2cNb05kmqOwpLx3wozI/S2jpY9+Tt4xa+e7xF9BYArkbK0
         6x8My1bGfCh1cMqe4b5h0GuXyxorTX01HbdDzq+zwJXAQ1dk+UaSizRn5t0J5oAZrrQj
         eKWlxnhmt4MSj4m59D0KpkDNde+2hYnenMbPTYZpSX4H5+Tw1doFN7gijWDZEOfLkIMe
         0Ekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617206; x=1793222006;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/7ngeHbVYERGvM2jFGnKfOGGvB7UaeEskne35/Ksbe4=;
        b=dHlo3XBKs2xB24cXJ9GtIw3mPR/knvTwXlgNFel7xl2XtQ1VwdA8Ls51FhICBheF3y
         s2cFU3ctZHY9bp61J2pwWAt5eiwpJF2IXrdN63LBemQ7FSplBRk29woL+1y2ob8WgRCQ
         A5uwZXxjzGEpRvCyjP3t2zcygmPqQEvOtH6W6fQburN6SADHnAbf4npwDgsYnKhehcVT
         rNlfsBxVazbk+6cuJV3kawLLLC4a9FGivuYzkzqTccVcBRKBkNpR4ybYoaYA0OZBX8o3
         j2LVlWcRArAQ/qBAOwRbIy5KIg6Q9tVUhh0E4jdaW8orO7fehDuyAUHZ2kINFzQmQmJo
         5xrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTMpPpaTGK5JWXvX2Mk9JaOTgY942sGXACjypYvi3Oe3ckycDBz7Wtu9uN2mcCivqzT3AiYqJq+ZI7Xkc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTfRdz/wtZ3giS8N5dO7Ovs6ANY9Zdpichv12blzKGeUH4N4g8
	qDUDJFlX0lUWDF1dPn1PV3Nyb0y2XV0O/hR9YuYOhnIFuMCSxQ3f6udN
X-Gm-Gg: AYBFou0vJPiUUniKuiphhAw1maf0wPjTye9zV2vsjQNsyX+5LcnQgAWkcgj5V3naLj/
	BXssFuBHxk3vM9iEccn3nJgkCNTYI5b4IvENrlV4LqfwRi2rx/ev7+q4jFcbGgn7g83yW8DUb3J
	pwkzXoBUs4uSoNBOw6mHACCgUD7foW1jiHqdgPkpq41sRUQ1tIbGN2SqScyN1ZL+5Tg5NBbg3b8
	uW7HD4HdZh8ahbnoNvoDO/GQ2asP/b/LGr/CpnovUo/6lV2WENsEPjomm+eWR2OhgLd2eDxMz50
	DNGQEbiB9icEJs2KJqVjoi9e23B7E37rLCoet3UxW8F9qaCSWs++a0F0KqUxwS2nfoPVgGgJQtI
	rboMAB3nVrSKbKCmUAzjI5AQiI+ApUhb5VrXfxKdsXLJPoeG9aaQTcYQD3unCr2rm7aqduKrUO5
	vBqp9D5yQDHLBg0FXpBblZQpk6yTca9TyITmUPaC8uaWUjcdYqNNXyht1jO1byX6swmMXCm9/Yu
	9VDBLEvaB8Sw+G4MUx0M3DNYn/eu/pZ4jnmU15TLUVXOTXiyEs9xShE5vmd5rmamegTFCGSct/H
	KtAqyFAfTjzgmhrPrFn8XgrTaVuA/TrjhOJERpLbUsXUHuKo0l3/HXw4z1sX89y6ID7xvS0iunN
	aWMNY6Zt7KR76X+jDaGPMlNNaWP3/pmBMITwRUXehmKmmKq+ShclE2WZX+BaOQCTvSY7G/dq13i
	jqn6Y=
X-Received: by 2002:a05:6830:3495:b0:806:9a8d:4b9b with SMTP id 46e09a7af769-84d0890bfcemr2646685a34.15.1792617206105;
        Wed, 21 Oct 2026 14:13:26 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbcdd9d82sm3219421a34.10.2026.10.21.14.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:13:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:13:24 -0600
Subject: [PATCH] dmaengine: mediatek: uart: synchronize completion
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
Message-Id: <20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQ6CMAyA4VchO9u4DVHiqxgP26hQzQrZBlEJ7
 +4mx79pv64iYiCM4lqtIuBCkUbOoQ6VcIPhHoG63EJLfVZSK4iz9ZTApxfMJiTovIH4YTeEkem
 LsChQTevaWta2uZxEhqaAD3r/n9zue2fliS4VuWxYExFsMJkpo2wi98R43O+27QdSLGkzqAAAA
 A==
X-Change-ID: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Long Cheng <long.cheng@mediatek.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Terminating a UART APDMA channel waits for its interrupt handler, but
completion callbacks run in the virt-dma tasklet. A callback already
removed from desc_completed can still be running after termination
returns. With no device_synchronize hook, dmaengine_synchronize() does
not wait for that callback either.

Implement the hook using vchan_synchronize(). This lets clients finish
asynchronous cancellation before reusing callback state or freeing DMA
buffers. Keep the callback wait out of device_terminate_all so it can be
performed without locks acquired by the callback.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..7583c287da5d 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -440,6 +440,13 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static void mtk_uart_apdma_synchronize(struct dma_chan *chan)
+{
+	struct mtk_chan *c = to_mtk_uart_apdma_chan(chan);
+
+	vchan_synchronize(&c->vc);
+}
+
 static int mtk_uart_apdma_device_pause(struct dma_chan *chan)
 {
 	struct mtk_chan *c = to_mtk_uart_apdma_chan(chan);
@@ -514,6 +521,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
 	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
 	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
+	mtkd->ddev.device_synchronize = mtk_uart_apdma_synchronize;
 	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

