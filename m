Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773563;
	b=mUY2Kelnoczn0HWtyQskE0npJpfKjsh2lobh15RERAoRXdP99v/5GE6paWke8/uv53CD
	 ZKx7FgiljFy/l9ystPGvQqNqrcliPLju0j1yBN3u1x9jmRN7kkzDchN3pxoesOH9KSBTL
	 ovh4LRVmp+brFe8DZjvBozsX7GmUeF+zwM27X6GCy5j2GCgH0qUC+xSb3rbs8us3hjqil
	 CrScNt/iZM+3TPJnkwWr5VtswgewPnUf9wXN+Ok5dRGHDZnwsCQ/29r1VAzJPPSUi6MP1
	 SKjt/H7ZMC05BwNp+ZGC3DzZTM+vU+QyhIQwUzg0odQf5JLJIpeqnijbApRRjkA/OaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=lYAY31DLg1K8Ctq3iMNb+HOdz/jkumjLa2+Nxs3EUCs=;
	b=lmjQT27nqFNCpaEraqjLAFCqEd62KhbD7ESJWNXBiHd1cftoxIj3/5ppIb/DlRfVd4KD
	 AZVsKrQfgpnPXi5pHdu5qXg2SNGMW0ZV1uzukWy7mDa3dpO1esbqFoqUCfte1kB/9ae32
	 WnfDhjfydKNWK6Knpm+hDhzjVYk+TqWEDJzTYRvi8oQyhxI4TzU191TMYLBcFa9rxd+Xh
	 l1amenwHJ/mG+A+PFnM1/YUD0XuOk8400b440jkoxKTjEQR00WjXNhQTtdFg/cF6ilN1K
	 /KjxPlfofAag5Ip69ZH//ohRuNz+zPSYlKirKGxudOSKoctpL9eYwWG3UAcALOFyBCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0e7JhfjQ;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAB5606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EAB5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0e7JhfjQ
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-539a57a0b1fso123177b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793773561; x=1794378361; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lYAY31DLg1K8Ctq3iMNb+HOdz/jkumjLa2+Nxs3EUCs=;
        b=0e7JhfjQ9MoWUh6sekxxXaf5UzD0LVBYqyUr51Xg33wVXycS5kkHsl5M14daG4pAIA
         SZfOgjcmQST1Z8/L9SQe8toKRMQqsLVqK5sX2KAT5snkwUvuPOlIA1x6Xp0tF42alf8K
         leEXM86lGcLJTcY989HzBadbzwYGFceBg/RbdbigOBQMc/MY+zZyGiwqe1Y6zjSnJsy1
         BlT2Hz9ps3QRZGWANub3opX/KAZm26jOjzI68Co1welvrWFRudosvf9OBhkeMBNEnxPv
         vFPj4dVsg9vtHdEwNMNIv7fXRk3TQeUVm635EmzUN3vp3ekb7AnJzbe/z8K1o6iYCc5J
         tAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773561; x=1794378361;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lYAY31DLg1K8Ctq3iMNb+HOdz/jkumjLa2+Nxs3EUCs=;
        b=aAKJlY4z9C8bHhZCNO+9uSKk/oZ8Kw+fIj6GL2L9LuvP8VK7q0o+6XY1fAmxCBsayz
         w9I7wyq3pKl8qf9OGvsPezx2Q4VszWLH2tRWz1xM5q6r3nz4keJiDJkJxJFWRJuncLZY
         AFeCX8Jp6WVtMT4eweEeYqvYQ9tVFjfCr9qncYrTS816JC48BejcPAA/2zXkFj3FlBx7
         Vkcaa3xriXKDNsu8XhZIxVM7gDgfmNEkMZyZXiTwQf6PJ71BlsXe3iWzNw0Mk+U7t5Y7
         ttMlqBFcogmO3RQH2KorPiToHm4oUsl/877qryVYfGhpZwznOQzC+OujcBXzG4UIA3tW
         n6CA==
X-Forwarded-Encrypted: i=1; AKwUvBwDIaTJ0QKbxITlBIYTIlBH6K3QIg9uZVDkqqQIl3OVceajm0p8U9FEHyUVqb7UVrJzn6D7vtuLlBE8N7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SieU1/TqR406K3b6wRYQVb9J9N2/T6tqaUeA74H2jZldyen/j
	Ylg0eSU3ZOEhMena/MahF7Iax3oUpygDOI4ngN0xaQr7lXqCwvBaim6S
X-Gm-Gg: AYBFou2O7lgtEuDe5s2fGZAQOgGtKCoVHjUi/F5Y+v8WyhqW10GMLYutIznLb4Qw1O+
	0ulLim4vWADfIW48mFe98+25ZJItW8zpEdSTAdh4/eEoCsAPCOM1wNFtHNM7iZ43jBoMm4J0SD1
	b/epj93P/qfu6xHbzb21wRrTxSHsYsSdQ+9cb9BzEW2Rd6q3MJT7RMpIyHxZc7FqZF44ZduUDs/
	zCWqT/+6NF7sHKe29SVf6F8zS2nbiZl8T+jCkz4YbrjN4HYvYyRRDvXTV1hich5t5hpyU61mLjh
	QmqJRwxXIA34/YGkjIM+ZqtUn8h7jPg8CgykCPkPgDfiGt9ZMPk7aQYbcrX0HFNbNTZnYBXld0g
	iawBI44hw7/cCBBlwZOUgDxTpne6GBjMXvZokrRLzYkUGd0Blb/A6UbhDI+Ajeqdc/AGMsPNkXm
	WeUs/uAMJDpeTEpsOuuN2qe0/jweCpvrK3uf+l+r+nRjV2IjR8I9IlvxwHdzlYwtYRRjoPcjE+X
	7AWzXAYa/IRd5+/W86nBAcXybJ18ZDBbvgN7bgHy/ly4rS2xTw7RgCGjZ2qwhp3+EsRRs8seFfV
	15sGns9tNhROiv17Avwnd6kh1svVOp+5tov2gq2p0KkUg/KL8T4hsc9rC5sPvOI3aySKG59lIPD
	8oVwKoijF8oc+BBcCwTEF0E4q45hnClp2jRd9bU1xxRYV1CkFdzNmRXaqsNgzcU3tSf5XZBI7YL
	ClKG6hIVVE54y7rgXLzJ0Q0DZeg6IBFonnOYjz3KL2TcxmJMM+LAM9
X-Received: by 2002:a05:6808:4fcc:b0:4e7:c6f2:75a6 with SMTP id 5614622812f47-5640deafdb6mr12232306b6e.68.1793773561572;
        Tue, 03 Nov 2026 22:26:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm956795b6e.3.2026.11.03.22.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:26:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 23:25:58 -0700
Subject: [PATCH] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
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
Message-Id: <20261103-submit-sun4i-dma-callback-lifetime-v1-v1-1-4c5a0653104f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ7CIBCF4as0s3YSBg1Gr2JcAB10FNAANiZN7
 16qq5dv878ZKhfhCudhhsKTVHnlDtoN4O823xhl7AattCFSe6wfl6T1yQfBMVn0NkZn/ROjBG6
 SGCdCZ+iklVHuaAL01rtwkO/v53L9u4ce7NsWh2VZAXMhtUGJAAAA
X-Change-ID: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

A cyclic IRQ queues a virt-dma tasklet with a pointer to the active
descriptor. sun4i_dma_terminate_all() frees it without clearing the queued
cyclic callback or waiting for one which has already started. The tasklet
can subsequently access the freed descriptor. There is no
device_synchronize callback to let clients drain these callbacks before
releasing their own resources either.

Serialize both half-transfer and end-transfer IRQ handling with termination
under the virtual-channel lock. Recheck the physical-channel association
after acquiring that lock so an IRQ which looked up the channel before
termination cannot use its detached transfer state.

Move terminated cyclic descriptors to the virt-dma terminated list. This
clears any pending cyclic callback. Retain them until a new synchronize
callback has waited for the IRQ handler and drained the tasklet. Drain
callbacks before freeing channel resources as well. Termination itself
remains usable from atomic context and from a completion callback.

Keep freeing other collected descriptors immediately: an in-flight
non-cyclic callback owns its descriptor on the tasklet's private list.

Fixes: b096c1377d1e ("dmaengine: sun4i: Add support for the DMA engine on sun[457]i SoCs")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun4i-dma.c | 46 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index 225e4a53502b..b92cd9c8676e 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -293,10 +293,20 @@ static int convert_buswidth(enum dma_slave_buswidth addr_width)
 	return (addr_width >> 1);
 }
 
+static void sun4i_dma_synchronize(struct dma_chan *chan)
+{
+	struct sun4i_dma_dev *priv = to_sun4i_dma_dev(chan->device);
+	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
+
+	synchronize_irq(priv->irq);
+	vchan_synchronize(&vchan->vc);
+}
+
 static void sun4i_dma_free_chan_resources(struct dma_chan *chan)
 {
 	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
 
+	sun4i_dma_synchronize(chan);
 	vchan_free_chan_resources(&vchan->vc);
 }
 
@@ -322,7 +332,7 @@ static struct sun4i_dma_pchan *find_and_use_pchan(struct sun4i_dma_dev *priv,
 	spin_lock_irqsave(&priv->lock, flags);
 	for_each_clear_bit_from(i, priv->pchans_used, max) {
 		pchan = &pchans[i];
-		pchan->vchan = vchan;
+		WRITE_ONCE(pchan->vchan, vchan);
 		set_bit(i, priv->pchans_used);
 		break;
 	}
@@ -339,7 +349,7 @@ static void release_pchan(struct sun4i_dma_dev *priv,
 
 	spin_lock_irqsave(&priv->lock, flags);
 
-	pchan->vchan = NULL;
+	WRITE_ONCE(pchan->vchan, NULL);
 	clear_bit(nr, priv->pchans_used);
 
 	spin_unlock_irqrestore(&priv->lock, flags);
@@ -970,13 +980,13 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
 {
 	struct sun4i_dma_dev *priv = to_sun4i_dma_dev(chan->device);
 	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
-	struct sun4i_dma_pchan *pchan = vchan->pchan;
+	struct sun4i_dma_pchan *pchan;
+	struct virt_dma_desc *vd, *tmp;
 	LIST_HEAD(head);
 	unsigned long flags;
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
-	vchan_get_all_descriptors(&vchan->vc, &head);
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	pchan = vchan->pchan;
 
 	/*
 	 * Clearing the configuration register will halt the pchan. Interrupts
@@ -991,10 +1001,20 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
 		release_pchan(priv, pchan);
 	}
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
 	/* Clear these so the vchan is usable again */
 	vchan->processing = NULL;
 	vchan->pchan = NULL;
+	vchan->contract = NULL;
+
+	/* A tasklet may already be using the active cyclic descriptor. */
+	vchan_get_all_descriptors(&vchan->vc, &head);
+	list_for_each_entry_safe(vd, tmp, &head, node) {
+		if (!to_sun4i_dma_contract(vd)->is_cyclic)
+			continue;
+
+		list_del(&vd->node);
+		vchan_terminate_vdesc(vd);
+	}
 	spin_unlock_irqrestore(&vchan->vc.lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
@@ -1128,9 +1148,15 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 
 	for_each_set_bit(bit, &pendirq, 32) {
 		pchan = &pchans[bit >> 1];
-		vchan = pchan->vchan;
+		vchan = READ_ONCE(pchan->vchan);
 		if (!vchan) /* a terminated channel may still interrupt */
 			continue;
+
+		spin_lock(&vchan->vc.lock);
+		if (vchan->pchan != pchan || !vchan->processing) {
+			spin_unlock(&vchan->vc.lock);
+			continue;
+		}
 		contract = vchan->contract;
 
 		/*
@@ -1138,8 +1164,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 		 * interrupt (odd bit)
 		 */
 		if (bit & 1) {
-			spin_lock(&vchan->vc.lock);
-
 			/*
 			 * Move the promise into the completed list now that
 			 * we're done with it
@@ -1173,8 +1197,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 				disableirqs |= BIT(bit);
 				release_pchan(priv, pchan);
 			}
-
-			spin_unlock(&vchan->vc.lock);
 		} else {
 			/* Half done interrupt */
 			if (contract->is_cyclic)
@@ -1182,6 +1204,7 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 			else
 				disableirqs |= BIT(bit);
 		}
+		spin_unlock(&vchan->vc.lock);
 	}
 
 	/* Disable the IRQs for events we handled */
@@ -1276,6 +1299,7 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 	priv->slave.device_prep_dma_cyclic	= sun4i_dma_prep_dma_cyclic;
 	priv->slave.device_config		= sun4i_dma_config;
 	priv->slave.device_terminate_all	= sun4i_dma_terminate_all;
+	priv->slave.device_synchronize	= sun4i_dma_synchronize;
 	priv->slave.copy_align			= 2;
 	priv->slave.src_addr_widths		= BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 						  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

