Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735206;
	b=yC+RiZ9Rvm4PcAfCSrYVKaE7MWttVtzqLFntqgEdInWpRxbSdTTv3f1LcycrKh3f1tKr
	 dXqHmYrDxnQ8itI+4Il9XQP5NOl5nh8Km5R3Ax8j0axAafDhYd9Fq9kzoKuIm/xgYcsHF
	 gCX5SNY1+1ePdwSZRQwZlbKN/OwlKJR4QlgTLKXzSScEHSph0MOfXgxT6LFAk0P/Leciy
	 aRiNU4X7mBs05l3HwCleFX4aifL6H0qcwdcMdGMStahZEPw7aGgwP8c2xLisYgXMisnC8
	 0+8qUiByTSGeXJRazJ0ll8H23hBKkhp9xsFVHBUg4ufbl/f7lYjhDSv8TiP4RJpZrtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PuczV2jozFUeyJsXtX8bgTt59XDEa5cGyADBIgej+KE=;
	b=sxXl9ti49GndgZ6/KJufVPRmjU/92jmUs3JKGNFv1HmmD1RPpowz1W0sYIKtH8CjqN9D
	 vqUIfk7skKjVO9Qeaovc/DiUEYifKpudf4DUbyJdJ8Py9ctX3BC5q6as75hKVicY2DHIc
	 Z3bwrJANxmnCi7NFYZ4vRFq45NA78NqtjUyEH8RKxNXc1qHUesiLarS3EsQi/GjB5voJW
	 H0xclJCS/+Y4ktUxFnIRb7ui1jlltOKwHbecWfEN2wFioyN2TkGWA8Yi+21F+VXH4MjjR
	 5C5PxQgHQ4806z6/CWI4X4wZnmaZnEu1LGMnCwTHeqsjjMyqWCFO+SF2O+aVp+qXHPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEj59C2r;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1EF60A2603
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D1EF60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEj59C2r
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-71acdd32a53so428024eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735205; x=1795340005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PuczV2jozFUeyJsXtX8bgTt59XDEa5cGyADBIgej+KE=;
        b=PEj59C2rYSl+quIcKTy9dV9+5SuhTpvAT2KDDAuzgsQBLvmnNlEET4u5uAC76Sf1Zy
         3/4PovDy8uKhKxBxSv/cVQ9f0/SN5gyLl4odEOi0edPTRaX4ELapu9bk6C5dHaBvrWmK
         1GVI2tHz0bvRCmFCFu1EhCeB0qJqsoCXnYOURXflf5yMk/7A4WNZrmSVgghBKzN6QTOe
         sknbs2Rk157BMvySDqe1jemIz1GfnoPBt7Un3s7sIcrH/b8aMVoUiL6gkKRHNnTXAb3z
         HjnpREoNDWwbPivwwr0bSzHqnpV30LT+sEcZCCUVnnZD6nsaPu0TMDI9rR8n3t6oFshk
         bgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735205; x=1795340005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuczV2jozFUeyJsXtX8bgTt59XDEa5cGyADBIgej+KE=;
        b=tDw9N+bLKSHLfj8QCHgUZ2zAruB9+MoD+wd8wZutwSEBx6RgmdtgBA5X5+cw6seCeK
         8hkTRNLzsLHiQegb4UXGHkkBPRR2vBShz+hgwfBvyOK7u17YAV3qWzIwfp11fZieu0V4
         /GNaAymfTfv+Z/sO98Pzv5GsF21d3ZQ97roqrWl82SchLwUX0FkYpVUKtgTl0Mh/bHAk
         tnoRzwoM2ugEkg90WZJ2D7dRtQE1ykC4feS6o/z7OceV3tsoSElxl231hI2ykjRRCIqg
         +FGJWpF3EZcLbMh6Cn6T520SLkVHeuIJAvGln0sJSdjSUAyFaQq3pe1VQKv/lqDg2C/R
         qthA==
X-Forwarded-Encrypted: i=1; AL+hErHlq0vxCjdygKscjnz9qMI/AaABkxI56gQOJkmnsZQPL5DPluLnon6rQyjqu2i5mWceECPQJ1ikU9S/vXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZwHJXm+TQ9o0s3ifO/S9S6yDpuvUxT/ADWfNRwGtug6rYv8Xa
	uS3HnlQisX4uiX4alDuZXaJ3wiq/Hdixv5DTS4GErTQHlw2KoWvTv5Om
X-Gm-Gg: AYBFou1nrPGC6B4G0iw3ygdyHhhUR7O1qkcaKf+vfEDlSV1cqaIu9HAMJ5EKu52eKLv
	FGPpPHIUXQRma2EBwM90aeqTtLx2u34IliAestuqrBGyPL1el7zUwzFP792BdbadGD0BsCKt6Vf
	bNnK4UL1npxDo9hv/R0yMNPdVywMgrCUsoABVT1GqxC3fagGiT4adZuKzV3DSfsVqj0oFu37y+N
	qKI/hEg8T8RmFAdfFxpW4KAaIeKVJb0gP8D8vlIv5deqsuqyawLr6h8ZRKHWp3KOPtKRS5/N71J
	GLlhLP2G2BP+Vh2xDsZ6GZJq2Mb3i0oH5ZiFPH5PFZ9ImbgfWbKSjPbRDqrH7qV3c1+h/G6E0Up
	1e60sTpyrsF7jhtEG5oermP8nXDyVp+D0BzrEsG2o1XqAQBXOMiQnwt9o3gB8OTqs00CnJjmrpd
	Idzf3IaSPkJpS5TkR88Zx46Lo6jXwhmzPkAxWXglT5FX+Eplj4L18C1zaYY64wgegY1BUZA2omr
	a8CFJhqQX+4Zxxy7qLk5JdPt79yMvlJQsJznXu02jcDuEjzdozFzjOhPfQtvbg7VUceSRiiYryU
	Np6ZFccAW6PEtcpfUDwZTDTfXkXuGJpPFDCx848ni9wfBcti6mX3fGnDCCHRl8mW99P7jPpTNR5
	qpwYmW/NV38/BNwvgxliuxOUGfhbQojWtFjOnR/oJam2oe6MsBvxfH9qSmZPytz9ULwPfRcXCAo
	5SzrmoHrejZdmB4Y32AXeFyQhllnFsUWzm6qAEvaWuzY4N0FRIuUI=
X-Received: by 2002:a05:6820:5604:20b0:716:c2df:d9a2 with SMTP id 006d021491bc7-71ab505077cmr2942230eaf.44.1794735204957;
        Sun, 15 Nov 2026 01:33:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:57 -0700
Subject: [PATCH v4 9/9] dmaengine: sun6i: keep cyclic state with the
 prepared descriptor
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-9-043cd476a45f@gmail.com>
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

Preparing a cyclic transfer sets vchan->cyclic before the descriptor is
submitted. A finite transfer on that channel can then select package
interrupts and take the cyclic callback path instead of completing its
cookie. Merely preparing an unrelated future transfer must not change
the active transfer or the meaning of queued descriptors.

Store the flag in sun6i_desc and consult the active descriptor when
selecting interrupts, completing a transfer and terminating it. Finite
descriptors retain their zero-initialized flag. This also makes callback
retirement depend on the descriptor whose lifetime is being ended.

The shared state was identified during the H616 cyclic UART RX review.

Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 8f8443e14719..7316631545c3 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -191,6 +191,7 @@ struct sun6i_desc {
 	struct virt_dma_desc	vd;
 	dma_addr_t		p_lli;
 	struct sun6i_dma_lli	*v_lli;
+	bool			cyclic;
 };
 
 struct sun6i_pchan {
@@ -207,7 +208,6 @@ struct sun6i_vchan {
 	struct sun6i_pchan	*phy;
 	u8			port;
 	u8			irq_type;
-	bool			cyclic;
 	bool			paused;
 };
 
@@ -509,7 +509,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
 
-	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
+	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
@@ -612,7 +612,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			desc = pchan->desc;
 			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (desc->cyclic) {
 					vchan_cyclic_callback(&desc->vd);
 				} else {
 					/* Completion transfers ownership to virt-dma. */
@@ -913,7 +913,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -1003,13 +1003,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		/* A cyclic callback may still hold this descriptor outside vc.lock. */
-		if (vchan->cyclic)
+		if (pchan->desc->cyclic)
 			vchan_terminate_vdesc(vd);
 		else
 			list_add_tail(&vd->node, &head);
 	}
 
-	vchan->cyclic = false;
 	vchan->paused = false;
 	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
 	list_splice_tail_init(&vchan->vc.desc_allocated, &head);

-- 
2.53.0

