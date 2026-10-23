Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798725;
	b=cQ2xxluuvyPowvQz72pSBetYH7AgWx8pMPeKjXLALg2jmAfNjBPV3GfhWK40umuvGDvy
	 9JOfE7xsxKnedmsghdMHq8NbOegCvnMc3poguxvixszJwIfg9h1B6ZgemdAVn+S5IbB9N
	 As6w5WFEFzuUivk376i5sDWqI0BdIvPD9vxeYjDyAF446p5gg5V2WznCsq75dfN/2UBDw
	 0x9+sMQadH+zDta7qMiB4sxQBesQHd8FBYJhkR4pqQwn7qt8cwNxHtIKSXHLqa48ET+vc
	 ESTl9IFO6aszkEcwjUeaFeyiWDQe0RYF8chVZXEZGs4eN1USJy46JqcNHo3wUG3jBZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yK+VB9i3XnDuZ2aB6oRjlCMBfgt+FvmOgzszXtH8SUQ=;
	b=rl+eHJP93+qdzxKAsDFN2b4yRcWMACkWnkg8x9redd1pDlEwabml3K7mP+/1Yw6b256O
	 ow2XvXHPkLd0AJGtGvuENYHPEQnootIRIutkYKHChgkqezSje4mU4LXOgtPfSGXWqJTft
	 qCpyTBFT3UFrA08q2sC0Mw0Zv6+vxfDFBFjLQOqqksONjNq0EMW69VGKUP9jFrUE0eY5K
	 U4Mhz4xCFMJ2nWv/lKnHCNnQCtmQqZfhlhcHNHbnKwKtLCf+/lk9flNJy2+etIx9UAJKk
	 WtPV5eGzanZGvSroSnpf9LAYGk5ltPcXFbcrUjuiOxdZhW2zw2yrAiYck0+mCSNrDKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="oX/IpkS2";
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516D2606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 516D2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oX/IpkS2
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6dd7070699eso992355eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798724; x=1793403524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yK+VB9i3XnDuZ2aB6oRjlCMBfgt+FvmOgzszXtH8SUQ=;
        b=oX/IpkS2mUaZ1JTxGCYrbvDWzWxioQ9ONOBDtMNiu2KP81eHSlHLFSgUK1JWLqmJUL
         9XQi+QVypStBgsdQ9U5t7jSQmaUmSNW7QU3ZlZmGkV/pCsrnH0vwSXKO+NnvTWn3UBHc
         RBQ3OCLDPXDPs80bX9Lr98I8JW9nJpjrH4jXq5Ugk+ksjZyOYRfybZsM6b5xmYM5jaH6
         ZnNMHjtHdiBxQK0eM7jreaEMuZYlRpybI7YykFNyS4ieq62QmBrG4LH7O6Q82MN+YfWS
         +63OaM9+4rhmInUa2uHS3WZk/jaw7eMCNoJfb0lPmi3acnWCw0Ry187BT21AxGZopaQF
         GU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798724; x=1793403524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yK+VB9i3XnDuZ2aB6oRjlCMBfgt+FvmOgzszXtH8SUQ=;
        b=pAfE0/O73XeoCrv277KXjMm3k8l06/Xgs/KGXnBaMMyyNf3ne8l3bJK0cu1Rt3uD/Q
         ULWhVITQqwOpb8U7x41o3eK1jiv+WvGej84Ptfi5c5yrZcypisoyzDQTcFoGy6zeIqkQ
         AeU8gg7jEFGBoy0BOjnpfsYilpTxA/LllQiHwMrqyBz9w8TZqSUHrdScCp8P6fhcKlng
         1UsJPdtzL0qxAc7ayx1zD9MUvHrj/PsrZ+qnIN1Ri5SWY1XmLZu37zE8gjNetdTmJc/z
         RVAwfKM3TQ8xSS3eVDuaDCwYA1iEQvDoFrf5K2sQMqUDXsF04HJGdyJi/EM4Vd57i4dN
         GdYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqMyWki35XkBUsz5F5hQ0KT7wJQyLho4HrStx+Kxp31DpyObP0LKq4re5IL0HZMILBm3DAFmzLooejuJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLS5jdJADZG5p4kR2/8rP3uB1mv/J7w+Kxx3dRyRUvEXbc/XJx6
	nZhz/viSUjikqvXvygafcoDwBKzkjfK7c0Q95t0ocrxuhpnf6xaHOV7F
X-Gm-Gg: AYBFou1XzUaEyFFEJ09sR4uDkwfhexFdWKMR9C27TTdJwjCRlgtr0aNWZkxHE57hZxk
	GTDuKCh/T+SDfYGBfuQO/yuboN7x7zVPiDx6aY/dKHx2y0fL+w5U9drx8YFdfdtGl+jX2aGj0fK
	+Vtiz2TUgC7MRscgn5xLBRKScwJ0GYd02mEVDq8p+HFgSzMKsjKF897KylGK7bJWXWFA15jCarW
	bOOmpcEP+yxKZo8HWbhEenGtkT1MVxbtYT8nAUJFhG+s8hfJLPEJFZBXpP4z9JwWFeCmZQIwbmR
	KN1X9dLNCcJbqwe1RVFIWDfhgU49nX2ngNPcuqvNYO74KkqW/gOhcRJ1CSMuRzeJipp67nCeetz
	90JCKr2ZSl9UBvTYph4VtTKLk0W9VatnmR4yZ8J52l3SKd7rOtOr32TZpb2fMUk7dSJrfd7Kz/S
	8XOEjsB0rAK8c5jdQw3brWq4livz4vMnBQWO/vCzupCBFh5Cp/Gxr4g4a2E7TrfQrZ8JMdpE8oH
	o30RF5hY54BQXi2PnZOdL26dJQrcNc7/E7e4cNRyKAnkm5zf8XO/VNBJbVD77UL6iAgKWMgBSmI
	qP24497C3Iix8G6l+74PjUn2ISJUEPUMeaykaJC3Qn2NmWZ0BOw/wqADIJQr7PUjPV+vkoeBJVM
	gJt1FPUBOcjHPhsa66r7xeguO4+kazA7FwHhHmsk8samYV6HzmYEVQbIP1aHBvRzYJM3IIu+k92
	mov62psWXoagTSyfR6w0lL4y/1
X-Received: by 2002:a05:6820:83dc:10b0:709:244b:b4f8 with SMTP id 006d021491bc7-70ba0ebf5f5mr161408eaf.63.1792798724223;
        Fri, 23 Oct 2026 16:38:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:27 -0600
Subject: [PATCH v3 8/9] dmaengine: sun6i: synchronize callbacks before
 releasing channel resources
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-8-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The driver has no device_synchronize callback. dmaengine_terminate_sync()
therefore returns after stopping the channel without waiting for the
virtual-channel tasklet. That tasklet may already have removed completed
descriptors from the shared list and be executing their callbacks. For
example, serial8250_release_dma() frees the RX buffer and unmaps the TX
buffer immediately after terminate_sync(), while those callbacks can
still access them.

Use vchan_dma_synchronize() for device_synchronize. Channel termination
excludes the interrupt handler and allocator before detaching the channel,
so they cannot schedule another completion for that transfer. Also stop
the channel and synchronize when freeing its resources.

Keep terminated cyclic descriptors on desc_terminated until synchronization
finishes. vchan_complete() may retain that descriptor outside vc.lock.
Ordinary active descriptors have not published a callback and can still be
freed by terminate_all(). This avoids accumulating descriptors on each
8250 partial-RX flush, which uses the atomic termination API.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 25987f550707..b83138745bd1 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -999,12 +999,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
-		vchan_terminate_vdesc(vd);
+		/* A cyclic callback may still hold this descriptor outside vc.lock. */
+		if (vchan->cyclic)
+			vchan_terminate_vdesc(vd);
+		else
+			list_add_tail(&vd->node, &head);
 	}
 
 	vchan->cyclic = false;
 	vchan->paused = false;
-	vchan_get_all_descriptors(&vchan->vc, &head);
+	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
+	list_splice_tail_init(&vchan->vc.desc_allocated, &head);
+	list_splice_tail_init(&vchan->vc.desc_submitted, &head);
+	list_splice_tail_init(&vchan->vc.desc_issued, &head);
+	list_splice_tail_init(&vchan->vc.desc_completed, &head);
 
 	if (pchan) {
 		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
@@ -1103,14 +1111,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)
 {
-	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	unsigned long flags;
-
-	spin_lock_irqsave(&sdev->lock, flags);
-	list_del_init(&vchan->node);
-	spin_unlock_irqrestore(&sdev->lock, flags);
 
+	sun6i_dma_terminate_all(chan);
+	vchan_dma_synchronize(chan);
 	vchan_free_chan_resources(&vchan->vc);
 }
 
@@ -1483,6 +1487,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0

