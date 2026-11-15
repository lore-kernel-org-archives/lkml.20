Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733614;
	b=ePjTVpjU3mrvNpCabRGQUAtyIcPNhwoDRoNcZZSG4j3OB9WUlXXZ/LlspBHr2qqhBf1H
	 rz5bzM8qhh1qKVPlxEv3qI3Kj3EinroTqXFXAgtqlxesJgtGuTU18n0bwnboi6r5CBQRI
	 WG276yLmARSOzQ1GtoetmOnF9HGlidlP4lKAM5hdbO3XWzGZkQBLfbLXTRlYL6yHZ2Xis
	 i5vM4jQ6qqGzfWM1XqNw1bxODA9FHfZhiIZdU9l13DyrO7XGOj3zLddjygc5VLvEAzQ51
	 vE+JG3dyL5zhX7Daquo7h9YfT48dAnMAphCpfb9RtX6SWSs/xjTHk2xCtQ/a9jLU7cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
	b=F2smU9bAP5Ni5DiC+Y8YIkfpBUYiCT+2eAiNEvOwN4an+P1v5GvKVY6cfG4cVsL4IJu8
	 4l9k/WNjRTIuU2gBMMuMkNFJ75+uUOawjAmOjqQm/p+OjyA3eFnvnAU4vB321MgazcjLt
	 qsZPvvrQpGfYSotVtjdU5RtV2UHA6AvXPpwnEzFtQYyp/Kt/u1nNaqWj44ZO3CHOAzXeZ
	 AS5Fd3+mWLmmlm+i+zpDowcCZhmW5d3wRg8fmOZM4deKejZNWHX34jrxLiV3Dh9KliEd0
	 3iQr/wwO0fEObNe2v08ByHhHjXTUxhUxPf21ttu0OJJZhKtMYvk8VIMT4S7KA3ogYcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnbXuAwx;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25063606A88B
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25063606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnbXuAwx
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-716d052dc23so887586eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733613; x=1795338413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=ZnbXuAwx5T5O1JUnj5pidVvTj+f2fCOow+VM8wPOgwU3UluNuyKXeAnyRG11ynJ/77
         b6GZlSuu+YyWGA46RP7X0NsqnDKs2gDYtV71JZ5yZv4qbBhw9vP5L53JIhtyChmYR4qD
         C5TAp/SWRuDOIrItTy5gRCuS7jrGINaHZvnx3qAsRRVC3/6Ntf3yRqo2MayX+7j9DKzo
         n1xwc9GfQVzwZK8XOCwWFrOf3LxVGRyM70AqU4aNcrDkEDPcH/uXoQYYnmBnXPvQovjR
         mGsVD/UVJEa5AyE5YU71FBMk+wGpg1hz2NBtVkTXxQl2Re5nVhcvoubIMc196p2fiYPw
         FLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733613; x=1795338413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=Jq6MyB7jy+mvxG5c8c0vqJBH53NPIDQYKfsH90DpxavNY5Yp897c0w+0mmaebnlvZp
         U0t6nv8cPBvLLb2SBSaV5L/zvVIKjvximtsJTXM6cGxJck9FL+iEmFZkPRSv5+hkmOyx
         RbHrIfsrlmTnHitCIwcb0P1DscrZFG234VHUc23Qt8LApg3sCjKdmuxHUAB74vc1eKVS
         OP0eJm4IaxmxcNLbyJ7dmg7BVLU0MgdBDBDCjPQ6TabK5fYfkCY/ddCdJfh+mKHWVlrw
         vd5YUzqp6Z73g0vW4j0Zq/6vgHZhGxIzjhtcrV5Xv+uI5J5Eyb3Rl7FLwXTn4vxzQMTr
         nnAQ==
X-Forwarded-Encrypted: i=1; AL+hErEENdquOKYWBXhoqUdaQqirfAcWgMhKPMFQIcYkEi3dVHuzeFXv4I6lT4mS7l5CJUYn627l1C35BjZlKY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/on/2+8ncS4G4HURRid/PyQBuQqYSM1aoNkOTMDNheHT4U8kB
	VktdWnqDt2QU/rUH/DkdlVU1BkoDi+gDSoLovjHNPq1SRCCwE2SIsSgUhJRffA==
X-Gm-Gg: AYBFou3o0ljvOpPkFqiUz3gKSwzBykXcf8zqnNfBJd6AYS35uNrxjuyGr+jc3EPUrrO
	Aqi5tvG6HuUZvdb7ybgMxHZ7nMWZfufmojl5ZtYPG37Qdi3E9et6pSg1ES8GN2qNcn8sUfwhICI
	5BqYr00gCp4KQ+fSFdRxg0zrpkoxnTJRRMdzOttLtbz0TJ8/XqQfsXnXvTJxfgA2hSpUwne8qG4
	KZEDPCQEYlVJ3h0GSgQpIIXcKilBRxYgsvh6T9BpW3339uR3s+Phhtgw1BlYV3h9v016kUgOD9o
	2wAPS3USIGI2MfSIieSrjlafT9R03c1IK/vRLvvM7NnvhqEu2UiA+4BnZKHDm8VfIP1DOyzRana
	wfJkWoFsi9ZqK6qWpvq2eCVVpAssAeb26o1YSvUU6q6hgu76n/ibzBWczvWkATUvRR9QPcmxQ9x
	ujC2wJqbvqEVhkoYtHTM+m+MDuI/5ELHQGw3XLmHcNR0hNzC5Ha86sJ69qG9EA38lWimfjWOsxj
	FoyrgjpRCvuruWuVNQfRI3j5COmIuo//Pa4Jdg3FccAo1fWL+8oVMpZVPkaM+f57wpPUje7ymXs
	RUG0vyyXwgU2ltnfj+T5s47r0c9SPP0XvCyMv/3Y2fG+zdaIcjTwxLwQw/QlBwAwONM6yM9bpRJ
	jWzJfobSI1mM6LBsrM0PSOmfNubYYqohNKU4ZDh0hMPWJH0h8WPCjllcVMpue3tmuOovUhN+fH5
	hy6ZhR8fwJOdVughIcCsKp2PfuYUBHm1WEKz5J2wYatyzF+4Oub35H
X-Received: by 2002:a05:6820:1c98:b0:716:d143:4692 with SMTP id 006d021491bc7-71ab50b23e5mr4407570eaf.33.1794733613075;
        Sun, 15 Nov 2026 01:06:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:06:35 -0700
Subject: [PATCH v2 2/3] dmaengine: sun4i: retain cyclic descriptors until
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
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-2-fb7d258702f8@gmail.com>
References: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
In-Reply-To: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
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

Use vchan_terminate_all() to retire descriptors until synchronization. This
clears any pending cyclic callback. Retain them until a new synchronize
callback has waited for the IRQ handler and drained the tasklet. Drain
callbacks before freeing channel resources as well. Termination itself
remains usable from atomic context and from a completion callback.

The shared helper retains all collected descriptors. An in-flight
non-cyclic callback still owns its descriptor on the tasklet's private
list and retires it when the callback returns.

Fixes: b096c1377d1e ("dmaengine: sun4i: Add support for the DMA engine on sun[457]i SoCs")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun4i-dma.c | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index 225e4a53502b..b0c91dab62f0 100644
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
@@ -970,13 +980,11 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
 {
 	struct sun4i_dma_dev *priv = to_sun4i_dma_dev(chan->device);
 	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
-	struct sun4i_dma_pchan *pchan = vchan->pchan;
-	LIST_HEAD(head);
+	struct sun4i_dma_pchan *pchan;
 	unsigned long flags;
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
-	vchan_get_all_descriptors(&vchan->vc, &head);
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	pchan = vchan->pchan;
 
 	/*
 	 * Clearing the configuration register will halt the pchan. Interrupts
@@ -991,13 +999,14 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
 		release_pchan(priv, pchan);
 	}
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
 	/* Clear these so the vchan is usable again */
 	vchan->processing = NULL;
 	vchan->pchan = NULL;
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	vchan->contract = NULL;
 
-	vchan_dma_desc_free_list(&vchan->vc, &head);
+	/* A tasklet may already be using the active cyclic descriptor. */
+	vchan_terminate_all(&vchan->vc);
+	spin_unlock_irqrestore(&vchan->vc.lock, flags);
 
 	return 0;
 }
@@ -1128,9 +1137,15 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 
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
@@ -1138,8 +1153,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 		 * interrupt (odd bit)
 		 */
 		if (bit & 1) {
-			spin_lock(&vchan->vc.lock);
-
 			/*
 			 * Move the promise into the completed list now that
 			 * we're done with it
@@ -1173,8 +1186,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 				disableirqs |= BIT(bit);
 				release_pchan(priv, pchan);
 			}
-
-			spin_unlock(&vchan->vc.lock);
 		} else {
 			/* Half done interrupt */
 			if (contract->is_cyclic)
@@ -1182,6 +1193,7 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 			else
 				disableirqs |= BIT(bit);
 		}
+		spin_unlock(&vchan->vc.lock);
 	}
 
 	/* Disable the IRQs for events we handled */
@@ -1276,6 +1288,7 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 	priv->slave.device_prep_dma_cyclic	= sun4i_dma_prep_dma_cyclic;
 	priv->slave.device_config		= sun4i_dma_config;
 	priv->slave.device_terminate_all	= sun4i_dma_terminate_all;
+	priv->slave.device_synchronize	= sun4i_dma_synchronize;
 	priv->slave.copy_align			= 2;
 	priv->slave.src_addr_widths		= BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 						  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |

-- 
2.53.0

