Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370722;
	b=uSNBk5eBE2zXwQluQjEUVXlq9FRZ6i2qdFsXz3ZKb/9GPxuB0LyCm7EOoLpqrJSQAmiV
	 dBifjbNMC43nXf2Snsr0FEynm5pLAYvJ0hZmoz3QEAINV6imKyC2H4HZs6RckVIQR9A/f
	 HtfRD5867iTyf7kQSCjLb4tfPmSADrOKvpPUO/nmhmJy6QMiXE/m+6CqFM3DowtRCdvdE
	 bn0XfCDv/op92bIHW5QiDsZZZDhi4r7QqyVJGLgcyyHVYAPhlQsMCKLeCF/61zt4jvXRY
	 WMj4LI3tfYd1sb9H6bP4DPx2eg8e//RNNmYz/ayahFuQTqQEOKpbZPeqtt7qN4uUy6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=49Bl1zt6UwoVqWzxPK8W1b7lN0nB1VkYxdH3jRP5reI=;
	b=Za5At4lTnPp2C8r6qyrpI0kvZ1ugsAOPuyLl15d0N0dXwSnt5i3c/XL9VClkaeu884DB
	 +DRaRyjz66O0M9oCWqjRHnn8urap+0XIdtD/9h67ce6wEA73FcgQ55Ptga35dksXE1Gjj
	 bjhKv/iAi3saS98nEXax8ryOjnojjW+KQrtxDyDVFylVSiZQc7JPXsPuuSuteZfajcjHB
	 UVITvDAvnIxMoVhZCs+AjbGcB4e6Bl8Sto3sWFhg8Ppy/qD2h5lsnSu2JKVJDTZYnxabX
	 2+j70mdXTQciPoOKXxOqY5ri0gqMYJ8yrL003MLDhZ14Kus8b70BmJkkxGcU4eQkVmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZRoYqVO;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C9E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92C9E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZRoYqVO
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a17a332ecso1454142eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793370721; x=1793975521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=49Bl1zt6UwoVqWzxPK8W1b7lN0nB1VkYxdH3jRP5reI=;
        b=GZRoYqVOzFQ9NKugWeeCfemabJywoYT1e4+ri71JacGwHc3z1S7aCKftP9etDPCRQ8
         +wHucdQGaXt8YvGFWcyUy4GPb1wia6wOtfPZkF2Yosk8Wco37sEfNQspU27j8c+m9Rv0
         hURd6+hSjjjwjKpUN4IPSBbtYuzwrIhbDfCj9PNO2R37a5f16NvC/+n5Gw9zaRLR5vyB
         729CnX5XFkEbJ2WlaRxWNhGhXA1O9JEvu9/tRGbsUIauhqROT+5BsXNBbz4d+7Sl1FY7
         lQGAbSPIXspb/EeYgu4rVco+KjZLQx5yIzQgCj+uo8ZFgdNuav6tktWtj4LhxtFJ/ijB
         ju8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370721; x=1793975521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49Bl1zt6UwoVqWzxPK8W1b7lN0nB1VkYxdH3jRP5reI=;
        b=uUU3QCI5WXSqL+zZ5oJbiagwd1/EHITEWg3zSasxdXDm50eAUX2/iayBx1ujdu9gQC
         PR0+ta8CNCwS+iwm2V8GWfC2qWA8+FC3QktM7vHKS37rbu4knQs2xfJhuFyV56FhK0er
         RWniU9GaelbTTGV19Me/ArtyGBW72CAjSCz19x1Bmm4z+KG1gKKW2ZhzyEBH97SSLeU7
         fFhSc7Xfm+Y4reIgEv1JIMf2XLF3xEvFjpmfPgRoWnyPsGd+y7KPMAHX/CBR6lFwesHY
         7kaXaXMF37H6xYHvMuLDM4QQKGHMDmWXH6FBkkkYnFrZwvXJ4wIq+4vlMnChySGyqdK3
         /8Ww==
X-Forwarded-Encrypted: i=1; AKwUvBwj3t6LEENxKCeBkm7LLR+d2T7vt7IFdntsHsGbAS3BIx+D8LjglE6s8hAbW3yh5wNf8+gUwP541OhsEn8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfDcv3T0J4irJnaPNseFnUkx0K+EUVBH1PGl4PE5DNjP1LV/+1
	Uc4OUFdfgifGEOcnUrmWnsXV8mI1t7nxtm0huEeChtpRy6MRcQzufMKw
X-Gm-Gg: AYBFou34FaAqJz7HEdNjt7TZHxavAtGOMFhkgGqtz5HhXlRFoj/CJ8BbjsSg8uagaar
	liHUNcvMVioeB3XTdRsIFH1nHUPa7Og/a73bs1kvQCmf9mUMVOi4x/Q8GdPQ7LUINAfTH/elinf
	Vw+EjVNe9DznTjAJoSApwraEkCQzK3WI2mH4xj5rvuoYMKWEWTux9ij08TIX8mTgmccE+TCRHbZ
	Y58pcqHX4m306vQ8YVzJBnbcIwKv7qp5WqoZqf07lcwHKx/1AwDc0nookfd7j7wjodctDEEa9l0
	N6MqdAT9yzlFbiQ4yB95Sr0x18c6A7nPSuEiZLjUzVgYKf9oZoRAB3mwKSUY8tPef2dDPAtCnVu
	6yHclNSGHwSflgdan0rmbCJWt6eD7LkvPy4yYUPKzhE2A9tEMu8TAEDWQX7w+EdD9VCanxWr+wf
	ioSCTaR/XvSYlIwBqtsssoWygTSkZIfMzFQM+mK2/H+RfDFSbrByzGRlEUYF2+N1c+cf8BPCt6I
	C80IsFbm2/XAbA8jXpTaVn2sMIRzWCOJvqSc/3MNsQxlAJtoeqnK2+YNaap9kXyCyh/Qvdf0emN
	0rNJXurSaJq8KKHiyJ3EUPtINAwqB1TBTnagn+THEMuvEQ+p09C0IV1EApI/fxqEgrRuiHlL8MV
	QImcPO+62vtDytHf+0hY5hukbZaIrGaS+DNM8L1xRfvcAIIG3ZkcAzcx3GPjg7aOnhw3Gov9/2+
	LD3j+RYA==
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr5397671eec.28.1793370720407;
        Fri, 30 Oct 2026 07:32:00 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm9438146eec.26.2026.10.30.07.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:31:58 -0700 (PDT)
From: Codex <samarth.colleges@gmail.com>
X-Google-Original-From: Codex <codex@local.invalid>
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH] mmc: sh_mmcif: unmap DMA buffers only after the transfer has stopped
Date: Fri, 30 Oct 2026 14:31:51 +0000
Message-Id: <20261030143151.2916788-1-codex@local.invalid>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samarth Narang <samarth.colleges@gmail.com>

When sh_mmcif_end_cmd() is woken by a data error interrupt or a DMA
timeout, the DMA descriptor may still be active. However, the function
unmaps data->sg before clearing BUF_ACC_DMAREN/DMAWEN and calling
dmaengine_terminate_sync(), potentially releasing the mapping while the
controller is still accessing it.

Since data errors can be triggered by the card, a faulty or malicious
card may cause DMA accesses to continue after unmapping, potentially
affecting reused IOVA or SWIOTLB mappings or causing premature cache
maintenance on non-coherent systems.

Move the unmap after DMA termination so that the mapping remains valid
until the transfer has either completed normally or been terminated
synchronously.

Fixes: eae309836509 ("mmc: sh_mmcif: Terminate DMA transactions when detecting timeout or error")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified through static analysis of DMA lifecycle
ordering and has not been validated on hardware.

Since the request pages are not released until mmc_request_done() is
called after DMA termination, direct-mapped pages remain owned by the
request. The potential exposure is therefore limited to the DMA mapping
layer, including IOVA or SWIOTLB slot reuse and premature cache
maintenance on non-coherent systems.

The fix also relies on dmaengine_terminate_sync() stopping the channel
correctly on both MMCIF DMA providers. However, shdma clears CHCR.DE
without confirming that the channel has stopped, while rcar-dmac polls
the bit for approximately 1 ms but only logs a timeout if it remains
set.

 drivers/mmc/host/sh_mmcif.c |   23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
index 8bd9cdeda..7b33f832b 100644
--- a/drivers/mmc/host/sh_mmcif.c
+++ b/drivers/mmc/host/sh_mmcif.c
@@ -1173,15 +1173,6 @@ static bool sh_mmcif_end_cmd(struct sh_mmcif_host *host)
 	time = wait_for_completion_interruptible_timeout(&host->dma_complete,
 							 host->timeout);
 
-	if (data->flags & MMC_DATA_READ)
-		dma_unmap_sg(host->chan_rx->device->dev,
-			     data->sg, data->sg_len,
-			     DMA_FROM_DEVICE);
-	else
-		dma_unmap_sg(host->chan_tx->device->dev,
-			     data->sg, data->sg_len,
-			     DMA_TO_DEVICE);
-
 	if (host->sd_error) {
 		dev_err(host->mmc->parent,
 			"Error IRQ while waiting for DMA completion!\n");
@@ -1208,6 +1199,20 @@ static bool sh_mmcif_end_cmd(struct sh_mmcif_host *host)
 			dmaengine_terminate_sync(host->chan_tx);
 	}
 
+	/*
+	 * An error IRQ or a timeout wakes us up while the DMA transfer may
+	 * still be running: only unmap once it has completed or been
+	 * terminated above.
+	 */
+	if (data->flags & MMC_DATA_READ)
+		dma_unmap_sg(host->chan_rx->device->dev,
+			     data->sg, data->sg_len,
+			     DMA_FROM_DEVICE);
+	else
+		dma_unmap_sg(host->chan_tx->device->dev,
+			     data->sg, data->sg_len,
+			     DMA_TO_DEVICE);
+
 	return false;
 }
 

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
