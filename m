Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735202;
	b=SLUHPRwyf+nezz49qB9TyUsfiMUTMr04gQTpDm3M4X7hlAGKec5GniJ8H8PYqP771UgJ
	 QtiALQ1a1ZS7T9r2g30w5n6GMLkal7vm8eWQmYQ+DD17w1+eyRb+wP2mfT5O4sihRDJYE
	 +GH2x5stvAplw1mBnn+KHunRNp5Nay6sWnhwL55i515U2wV3S0ngIWpRk0NqMGJEdQIRs
	 r0lMNUWr9M53cVLpoBr4pZK1eHwaaAGbZ1SOYvX2LwSq6dBLM9G++ZbSTB5jqpjS+TPuL
	 8cNIsVJM09XkH8bec+xyAvlYMcoS7Q8vWdwnQAf5zhGfkUdt7XRAdH8cSy9QPyRDWNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NlQp3R8KuFLhV9wrXx8XG9nak7uXzaBTY2y9ltCW+Ec=;
	b=LC8Xera3+D7jF+RCIg+Bl/AFmsO6NKpeM4MF0x439bfbdCSAIejRvpG0n530Klt35PFM
	 JcoowOSHtrDgH3kellycSD8/cf4w6h6hMV3ADeRQJiFyIx9u/xn7saKHx1+MZOEGGw+iI
	 V/H+tUKKYPiu18UNs62Umd+TzcVtnrp9LzfOt+jeJNVy7wf7F44NXognZL0MhKJ8iqMsU
	 QciD5KP+xh8j+aHKTyAlbC6LRSmrDYprW+6vcyfkCjNMUBJXJFqDbs6CDWmPbXSJ+BtWt
	 FRNJwV0zligb5aiiWlxA61SE6K1Ux10sEHH9ucuQHVvjdjRciD+E/6TySQ/NY2iu05A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pSk1uQwr;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C7C606A8A3
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94C7C606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pSk1uQwr
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6d290b10a35so879557eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735200; x=1795340000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NlQp3R8KuFLhV9wrXx8XG9nak7uXzaBTY2y9ltCW+Ec=;
        b=pSk1uQwrQ9+IhZo3tVwwW4sDd0IXKsvXfiY9bYZPx1icGRAr2hZVNhxDr/iSSRozAq
         sHvbcYqEHglKucpIZsRdVhpcO77N2p6LNvN+MN8s5rf/ebFxAScYN+qtbKfGtDmAZTpC
         mJIYB9RQgATzVINQlzLXyDrO6u6vohBh5Ooylwy3KXGXLnugXIrEqdR5DDaryY4KBhvl
         XsCXpxMVPZpDJRe9uTm7aD5aprL4YgKeRKfdSByLHoEzQ8Nh+s366tkUBLsJWFnNguH5
         6Lmnq7Fjn7ieWnENvtT2DLXJYrnn6E8tJnSEXH7c+b+lvnFcqM71K0lJJ0FeNTv8xhAH
         9zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735200; x=1795340000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NlQp3R8KuFLhV9wrXx8XG9nak7uXzaBTY2y9ltCW+Ec=;
        b=LDA2SfsPbz8Gz1MMg2QKHPkL1HkjGgyMs0Z8yIgeWgDDMpWdhP5CMpNjFZX32o+QcC
         s1v7d2RLNL0OVTK6pjrAeXCYT/UtsKSXBnA/0vl2zNJj/YaZez23l9MhFMJMB1dzxQoo
         C5ohG4BDKqZVf5WF4Cupk2QPaL6klfKKEcPyUNeUtF2aAHj+VUksC0gf5PkuLw3fK5se
         iSkSK3J6Bqo9cZCxyI8tRXkeX6S2UixklDX0bra2qiOo4TLyTNzXsdOGm+tovc4+wby7
         BddRUwaKV4zE5S4LPxkWbriokdOTG+3rYCmpw+1kJfahGuCUAp7VtgAGn11tvxIAdIct
         MzBA==
X-Forwarded-Encrypted: i=1; AL+hErFREfh9srL+Hk3PPJss6FOa/sQQwo6EMv+az3jQ38KQsWCgPSBNOzzSs1yE76/0gLtxlbGibUEZEPt3Wx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dkK84Xc1yEgMw0TKaM2/z26jLyMaZb6gS1BeH6jT8xYQR+DDm
	HU2u6op82fx+8oPNVMTkrwU9C/I0ni95LXYLYKqfOWnx1lCNXAkOfIiy9fLuKw==
X-Gm-Gg: AYBFou1mdGTA7+C+hGPaumCH/mjEfSLzI5eq/3OZEVsibV66MQNKh3VZ6Rwgeuexc7P
	GNUbTHKeyFbE6aRparttKuWshEoO9vH2LgMOxeQzM1EbZ1hCuJsGf2Sb6rKGgrv1UXv+EJMk9TM
	fITe/cQI0vYAc7ervgmLIAYJHgOlfWTEYXFiW0dT4VWGc8RhAzcb2c0dyuWHQRu22fimIIzsqyF
	NGOGrUGJQcXyhoIdYY8pHquxHI3fASh25bM07VVBmu782yHGn95yvO8jVkwaVzeWMO6hW3/9kH1
	TaYadTzmb0M/qU3GxyFReDWnA80VjwziH9t0QtrJ/QNAVpjpdByequcGX36GVeemgQtJaAfkY2C
	ipCjLTvU4+b7OX7tQFwAPgvuXBBkbGGJ7ygd16kJfSI2nJBJjSydf/HGCzWBFQhUztBn6c0zpGB
	8Ls15wOXo9oB1mXiNy4x7VeWciRiThw+AgNqEJXOkW3cs2TMudTCHqCEqiXcX8WfYUqvqqH74Jq
	JeKQKrEM3HxTlmd+0XdMmy8aHyKEc7zrcYjJy3pyrmq1snlb/A7jdL/49C7q56bMnA5G1fPTc0/
	InCwFhr8c1bY2yxckRoiR1oN3CAKbLkQjUECBHHh+7Xonq9zLk4RN0eVOOx/kJDb1Jmo/3uCJT9
	uB7M96umXzITp12iOimNcJOC/G56zcr2gnIt/sUwkoz/lD/AOKJpqb1PS9bzV/5dOT1aCn4EEoK
	C6vgU/05aaC+JvfGHoB98P06KgmDE85l+KEv+66raoaYDfaCm6HTg=
X-Received: by 2002:a05:6820:a711:10b0:70e:1dd8:6713 with SMTP id 006d021491bc7-71ab51550camr2956017eaf.71.1794735200601;
        Sun, 15 Nov 2026 01:33:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:54 -0700
Subject: [PATCH v4 6/9] dmaengine: sun6i: retire interrupt state before
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-6-043cd476a45f@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index c30e244e50ea..ab4474f0a8aa 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -503,6 +503,11 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
 	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
+	/* Do not deliver a previous transfer's interrupt to this descriptor. */
+	sun6i_write_irq_stat(sdev, irq_reg,
+			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
+			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
+
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
@@ -975,6 +980,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct sun6i_pchan *pchan;
+	u32 irq_reg, irq_shift, irq_mask;
 	unsigned long flags;
 	LIST_HEAD(head);
 
@@ -996,6 +1002,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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
@@ -1005,6 +1019,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
+	if (!atomic_read(&sdev->tasklet_shutdown))
+		tasklet_schedule(&sdev->task);
 
 	return 0;
 }

-- 
2.53.0

