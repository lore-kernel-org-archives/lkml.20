Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735204;
	b=1DGJG3uCG4rwrjI0wLfyhDj4E9/7Hl9ENfWGIqDMJdfMZdelLHJysdLiHSUr99hQyA2F
	 cktPK6/PkBVTkI7RPmNkKGAXRuGwa2LQb8QKTlpQjydmegq6cO34uus+3DbFbYB7We8YV
	 GwDALqextyAevShuL1aKyl3BUFh2TI9QEQIv8WVHEJj1R/iSm7mivbj9L6OgjvbA9lAhJ
	 1KaBzHLOH+H994jzjWp7+UFhwr1zLDHEZFSc9NX2HPJG/m/A52NFsTQs9cVtcASJGD6dI
	 Sjd6EQXIfXqtICN/f3+kL8GYGBeOSW2GJwAU+eiOBWyffx/ZUJiEQBTiUZy6Khx1C9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=lLq7Tf1B3BpSLBANTG+leF3RFU5GTaZTVgWe2BOgm6s=;
	b=w5zHWPQ8ch4LGd82vKDlGgZP2f4Ji2W98xyZy0CS95DTJrIa8RKSz7oDPRh3ER05qJcU
	 KYYgSC97FZkRTTjfeHuQULss5Q+GI5ugGEW0Jk0H+CfK+7XDIWFZxxy1q9W1HiJ7R9Gbr
	 7umCs7QQnrpv0S90XcsDcNSsjbBvbRZqL155dcMj74kTJas9cwg9uPo+Sh/JR/AEDoGV+
	 ASq8Hm7lvBUXXYdUOpy/OjwNWG596RL0oh+XGe1k0PiVTzEkYCuwjJA4iMTvHttQ/HcNH
	 c3pDaty/3P19/8RsfPJeu2UnpI1tWEZVVYV/F1GTACLyPUv3TDXtYJCJdc1R1JYUvdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IpyWNPZd;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968AA606A8B3
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 968AA606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IpyWNPZd
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-71acdd32a53so428021eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735203; x=1795340003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLq7Tf1B3BpSLBANTG+leF3RFU5GTaZTVgWe2BOgm6s=;
        b=IpyWNPZdqceAlFctVKztCOgO9NxIIZRdBOkA02Ciwd1vmjP2LCTInxAT6oE+bLK+e0
         njTA6+b58A+09rZGrffxmzxqSPADp939jLPkQpLwCATgiZExRrsJXk7qxSmV3dMoJByo
         n9swLTzD76yJW1uaP4jAOfqSjy5kLy2edvBsSFG52H4J1x0baNbPKpXJrcouwacMYFTe
         FUwhVYcSUdgnFBtDfwpJO6sY2GGL8wn0A1skz1lS6PiXMW/KA8K3J9Ux1923y9SG7yQ5
         /OOfNLkLrIxArqjkmT9wLNZzmuNvGQkSF+7XtMYklArZbsmDHfxDe461+X3FF6y0lWqa
         /2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735203; x=1795340003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLq7Tf1B3BpSLBANTG+leF3RFU5GTaZTVgWe2BOgm6s=;
        b=o83Jg/40EoB8LLgbi/nQP+tDSf00OY7/c4hR++ZygWXfnlqBwWz9Io97mhzcogxIUd
         1bRunwBQjQA1zddS3bOGpVG1XNbXqGiyMahAvxL9DPqjtcGYVi/vSsnJwg2ord46ZZLg
         Tp3/7Nxdl2LvANUeMqh7XLcIFd9gtrSKiEicMQzRe1NUtGRR8Wix/Dm49QCGajCJhhlK
         Z53Bag2VYlov6yp5H/pdgzzXqLoGQXi0UVKp+ertVWSUX1kdhD3yCZfGtzZtoxKtmGrm
         tKy1OUsbl/omhtq+CmocEXDLKduZIPzYYQDeLCMFxLWpG3phIsoXItEzEACz34AhKSN3
         yLUA==
X-Forwarded-Encrypted: i=1; AL+hErEHpl2SVTlnsW+L01UTnhz1HRai/ebApYlP2oI70e6e6mqefAWoUdNYkgZ+wmT9wkRM6OM0W2d0+ir4K3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sABijp3qpJoIQ31Wl+I1McvDdDG7cDWHcCd8/L9iu5GVhwcg7
	m35mqh0PISXOM5Xf7bGTqhtIsJiq3D6dEc0hNbFns2fhLnGXh9uL882l
X-Gm-Gg: AYBFou3LfEPymAOVxK3gZRpORCDCOjpzsZSzipeprjC1IHxr52luKUV+6nes/RJkWOC
	vPPG2rv97pEMxYcfGbQ/HI0kTulGJzyej56WPaK3X8b5TQHr0Y76yMypjVhb9UG/0XvauM9kZdl
	8WsH36bdFS9fG2DJVtauti/wrDHkcEIJz1EX0hlmyGdGogomwASEgQv9CM5Wlm4jVbhT5CpYsX6
	nZwOXQxQtj1Ugp+DFFrNAHg6p/tUrNXQpwEzodZUWRm0EcId6SHWekvbVj61n+oIPRLgLuc5VaV
	QfVsyGpxL9yv3yT291tKGHelx0vgouifDwDHQi5yAmJNihCCtFG+iEc+svm2rxfp7wDNeAzeGUi
	UoANTVW1EIk0FyiiuwIHH3tF1N0EhZVgzHFDD7gb0Dee0X+lLBeIofobcJEEYiQTZddgiRjEcGx
	xMyprDrjsRXLYF8vuLLtT8L6LWBCCdBXIYDm8cXKwvt2cmZUI3KpsVEgcpW8DPOGA4ayZny8AFe
	SfPQ3uArCRehouCtXSCz1Yn+77P2NNX/myhZeRH6uAtFC9v5Y2lQxGyYfAGrBQn4n2aAHqkh4bv
	i5wag0bI+itWHUu1wpyzSJhvDZGtJgaFGrsWUdB398Ty+fNAgJCwPgMHMHKCvVh/zLamWAgZ8zR
	6ljzaHAi1ZtnW8iGuqDFDFsnQgt9r4huH3rP5Y+ryvHjEqAdBkHGnu7TL9Rsa9XuDkLQSvyEFFj
	QXDELOaa2IwC8my2OPUBJd4Qlr9Bfs6A83jXmugdKufuv6/t242gE=
X-Received: by 2002:a05:6820:3416:10b0:6cd:3ffc:64d7 with SMTP id 006d021491bc7-71ab51acb62mr2760644eaf.82.1794735203521;
        Sun, 15 Nov 2026 01:33:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:56 -0700
Subject: [PATCH v4 8/9] dmaengine: sun6i: synchronize callbacks before
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-8-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 14f1f463005e..8f8443e14719 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -1002,12 +1002,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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
@@ -1105,14 +1113,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
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
 
@@ -1485,6 +1489,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0

