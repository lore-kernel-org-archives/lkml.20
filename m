Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798722;
	b=prEBTvz+20OksX1Iblo+UI2anJ6T1NBzaQ1+VoX2FWhlxyW5pJTx4VVIeJWvwlYNSeAl
	 JaR25gJfrEF/3AsosfPOJwvD7rAkXoxheeAEbCUbboWapWH0x4XXINsb7wfOQ+QSWmh+E
	 EnCXo7vyqFy6Zs5dM8193YGQ2Z+knu5K6pGgnaoMPtdTwbO2P5Qqg2h/aSQDyKIFCNUGQ
	 CzvAB9EfeCteHBLo4+Bl3FWj3YsIons9xD737hXxRkjhzv/LGghd4T6hJQhGj8896ekKS
	 RIMAcTn3dJB90dNS9IJ/+mpbKzc/Duf1oC0seKDDnhQ/f9ZLeQHZWER50aOPF5zgmKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zkFWZrZqrOF0fJWX5siiys4KdKUOKCNqH6flFHqQFIY=;
	b=lGpYhkdJsoJ9ywMiRSe3fi8GJI64rRIOl9nWiuBA8A1bBoH394+E7O/2qPPlr7jSCfOW
	 CWNwmjXpgSsHxfG3G+SS7yGR4v8lmx+WFXsHwNx0EDb8xSXdMP0MGO5IJ5yGirpSz1RwW
	 IrKGcGGd9UO1N2TAnMHcnZ7oyPjKQ9mrcYycv80U7pML1wilDujQfUk+gMsPboV54zbnd
	 SeiR6bSXpbzWmPZdi5vsSumW2mSVvBzcWwa4iixn23kiOw1S3oUeVSXYQbtvAEg8CN+s1
	 sse0haRdAb88RJb+/ivamKFHOtX/Mif9qS0g8fQVO4Pf01RRRrV03OwOzYbbhKcC7mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LjndMgrL;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D386560A2614
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D386560A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LjndMgrL
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6cfed5dd083so1020080eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798721; x=1793403521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zkFWZrZqrOF0fJWX5siiys4KdKUOKCNqH6flFHqQFIY=;
        b=LjndMgrLzw5Reh9tPtxf75MEcjNbZ12dALmdS996WEl0ejX/a2H3dh8ateDVBm0cNy
         ljtF5sVGIYCWQ8O1wBkhjAGFXe00ho4ZY23r3AFA+Z6JkyPH0/pAjvSd7yNHeIfPbGlz
         uhjn3bggvV8gKtEdQhm9NoO8YSkim8AJ4BiOViR5KaM5bpl1OYLtKlvvB/Cz42AzVD/b
         zj+R5bpYuIfJsKaIMxEZAV0A9WhP15e/i49AxRPD/K7ulMrZhlDNNBF9uYjubUmLcs3F
         UFOgcvBwCh935Y//kPHLwtuBVEPOdtEcsC3i+93D3nc+pXe0xb7gsvDCTaGDy5y0Q4J4
         rP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798721; x=1793403521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkFWZrZqrOF0fJWX5siiys4KdKUOKCNqH6flFHqQFIY=;
        b=ljLgQBDD0fCc/NfpMXr3IhpkOUiC67FatavNmKo/UBz/EgroXO4tHEtIOTlSi1WmMq
         9wiQnmst7ClClV7/OT9BnnAO2DC52B5Iqc9t027AZfC0IHXBjc4ovv4ZatHbXy8xXzFl
         tgtDsA8Ml5j6MJFs5mYMcrpsfAflZES555uy0IX0+AS4Wf/qNLdm8iuXzc31UdzPg4Fl
         shAZ0zKC6z0hdcnZj+/zWcorTA+HuKOZavm13RkQfjUXio6/0PpDsuufPyvF2m4W6tPn
         zThhmDZDGmWJrDozlKYjzrOoqZvaiM1BBowzgjsUe1etRDUgrUcmi9jTpST0V4WPQFPJ
         hltQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/N4466lKjQC5hO9S+5ECKjumwcTuUbHd5TslRX9MmxQ/V8e1BnsscKuLczYDW55i+i12cmaXnRDvworI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv8J3qOG6Nm5tHyzB92e1IG83OtBZMwSPz+DP2It/I7qtaBEjV
	5E3aV90KAjMUic0JxlPMKWfMeiEv4Yu1PRTOxrVlJrHR/qF94W1ixqc8
X-Gm-Gg: AYBFou1dk55OrT602okMKd1aXnqIZyOD5g9kdN5Yg/ykNtZ9M677jc/zJ+Vfn3oBttk
	j1V9GCZ3ncnIdE5pvPAqd6S+gQFJw4pjyMC4G8tfarpjGf/tXlPt/OQ5TZx22FbQwad0FiJU894
	GbLN5i1l3/SNbmVdX4lDhho+2CdZ//Eu+h0EsLvZ0ZtniEwQP6zVHbe3Ybuim08XngnRTtRLPCU
	hMMS7Uj2ZDJvj3rhVI4o1yE5RKaijBQrNxQJ6wIOHduPC3yciSBSNNI1eF4Hi46ACzGbbO51YQ4
	EyZ911qxd50iQSlp2umxeJKuwqwrHFztIBZ5aIVVkhPwoATcNUw5xoYZOMWjl2CP6qBGlf3NwXB
	xdnezmhtidlBx5CzzSaWWsGbHN1Al5Lqjlfh9E4uQLchbStquMofDkeu0M8qmbJRNc0jAcDT6Yz
	xuyKmEeTeTo6SOmu5FkiTbycsLfBG3A+NmXKbuZtVSXot25NxwfffqlUnbGyH4Bwhf+C/qucayD
	fvDRGPN0Y3VHkMRJOwkn42cEaS9t424ljrZinbKdGAm0T98nEvVnamLw1aQu+tfwx1M+djhKI3z
	1ijpPHA37AXZkYWFZhhrqSmJ4JYk1N2dVzhylNxTFyRwGai0B77mDY7fUBNt8tsyyPCo80E7NZm
	hd+Daya/Y/OGMlffmNRh9zArQjXBQUFnlJM+qsBREhIV4HaKzTj+XRPmU0VRFKe/HvCGh2LIn7R
	YxH/U=
X-Received: by 2002:a05:6820:7093:10b0:70b:8379:c145 with SMTP id 006d021491bc7-70ba0da0506mr162964eaf.28.1792798720713;
        Fri, 23 Oct 2026 16:38:40 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:25 -0600
Subject: [PATCH v3 6/9] dmaengine: sun6i: retire interrupt state before
 reusing physical channels
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-6-ef1acb0be768@gmail.com>
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

Termination stops a physical channel and drops its owner without masking
or clearing its interrupt state. A completion latched by the old transfer
can therefore be delivered to a descriptor installed after reassignment.

Mask and acknowledge the stopped channel's interrupts before releasing
its ownership, and clear pending status before starting a new descriptor.
Keep these register updates under the same device lock used to sample and
acknowledge interrupts in the handler.

Schedule the allocator after termination so pending virtual channels can
use the released physical channel even when no further interrupt occurs.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 900bb629ba3b..dab17b3863fc 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -501,6 +501,11 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
 	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
+	/* Do not deliver a previous transfer's interrupt to this descriptor. */
+	sun6i_write_irq_stat(sdev, irq_reg,
+			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
+			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
+
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
@@ -973,6 +978,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct sun6i_pchan *pchan;
+	u32 irq_reg, irq_shift, irq_mask;
 	unsigned long flags;
 	LIST_HEAD(head);
 
@@ -994,6 +1000,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
 		writel(DMA_CHAN_PAUSE_RESUME, pchan->base + DMA_CHAN_PAUSE);
 
+		irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
+		irq_shift = (pchan->idx % sdev->cfg->num_channels_per_reg) *
+			    DMA_IRQ_CHAN_WIDTH;
+		irq_mask = (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) << irq_shift;
+		sun6i_write_irq_en(sdev, irq_reg,
+				   sun6i_read_irq_en(sdev, irq_reg) & ~irq_mask);
+		sun6i_write_irq_stat(sdev, irq_reg, irq_mask);
+
 		vchan->phy = NULL;
 		pchan->vchan = NULL;
 		pchan->desc = NULL;
@@ -1003,6 +1017,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
+	if (!atomic_read(&sdev->tasklet_shutdown))
+		tasklet_schedule(&sdev->task);
 
 	return 0;
 }

-- 
2.53.0

