Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733615;
	b=gTt+YoFLdh9W/dt5OHstVjaSTVo8zVryD26e9OKqCf4jl8Sv7yCYvxmHgWVBPZRLcZKm
	 lK9Rin8Cgn4UIza1gyw0hX23hSVfXU/VCMaPAXoKz97HUY9IqsVkc6veZLMfkyhb7LhKu
	 Fcb+W8Ul/PvupmCcN/hk+e31/RKy17cvsB6L6eB9vBsEHwcm8e9OhdfuMQBE4JG9PLdE4
	 ojk909UNaUsceGcpUcoPDbIFLkOl2c80127K9h1e2a5/6lEKHvltdTrXXQXYbzxstvUX7
	 QWEoIpOG32P6ecH1C+rNd9N+gTtNevnUNMbYRz4lLzJ/q+UTqWdQTF0HIVcMs7FcNqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
	b=mS9jYyw1MfOBU/ODL07jht4LDJU9bZzy6TawK4BMyOrizB4RR8Qi5VGgj+9ieAcIRL9X
	 8EomLAAUH/qzxLmAZi2C6ZlZxyiftVPrS5/ZLtYQOPnknV6yFCXqRqbdt33gBUz8rA/vt
	 2j5SEqVSj0WWdbYPhY4q7Fv8G6NWhQEAPNZBu3WS63RyGRSlQF3SF7aWJiDnZka07MCwC
	 QgExs67/nYt9Q5OjKvit7zGYBUBwJn0z20RYWmJ6f9oG84OD4xzL14dGSmiAHwgjfK2yx
	 Gni59mMkzhsJIv2bilv9LBI7etenAGaAjojESQQbr6Pr721YLk3zGAFiMGjTVsFUiLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h/s53A8m";
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8051D606A89B
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8051D606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h/s53A8m
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-71acdd32a53so425531eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733614; x=1795338414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
        b=h/s53A8mMefJ9KOFiILUdjqUOgaMr2//upkQg9YZ27fnYNbl9MnbYzB57neI7LpJ+/
         TqRTvytNrFzQEE8Xsa1QhDzYc5XOYlqd9P0y7DZ+KD/MukbnTTJHqtYJKwtVHTHZcMet
         5rtdfjJnREuLWcRl+2LeQ43kSaiDbSLs/nFSJybBx4dOo0GrReS9O5a2qdZIcYg4chtt
         Bm2YFV6ekmEQDzbwTpgRuENIH34vvsNt88hTD/p3VwcWgppZrdjgRUHXLcXbrn5+ePIe
         I+i+B6rNcTGoCb6Y3fJ9M994MgzUuHv66tN3AdGNBRiYtNTOYdB2K+WzXcKZIPSqEiwU
         8u7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733614; x=1795338414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
        b=TvPfUsfAwHeYZQW+Zi2Ww/3vshE6OSxBhealy3l/SAzvofFthL/geUf/oaFJJASTGq
         32M8VzISLBb6I39qPHlzJWeulJ0a/NDb9q1qjKGaY8pGL1ihOFMD5qiMzOeq41i78HO2
         kfSaobBRlxYwX2OxCHdTXTgRPWhRYQgPfJDK4jQxBShY3/0ACd0sKWHAAvqeCLpjfiXJ
         lDUGvfnNy7fZRE6VNLbz/1E1+COBVjTh21FhIlZRw9ezmBDQ81TcGpp/uQdn39jtde4p
         B1V7bNpmkhhO5UNI31twNunr2ySOuygp5uYEDHP4AtG+OfxOxrF6gzI2euGLRoHX2FHv
         FaVA==
X-Forwarded-Encrypted: i=1; AL+hErGtVzGkxuxok1npD0AiY6dVzpX4IeLfC32BRbBan6/zQC75WUQwEUpRvxbkOOROyYbp+3REqg5XeDhAI6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/maz/ue78fLKPjCYHc0xIzY2WL2En/F5hBk90OaFrodDW7TVP0
	qigAnd1lg4/ud/x4P++IJrTw8I9Ng9qGH6xjReOp2He4HMeiLU+B22t1
X-Gm-Gg: AYBFou1XqgjtC0QZFilRuQ+lBY7t81JlWH39fYc0Wkn2IeX8qgQvVFehPuZxvxzbHyY
	6VxKuExsPgfFlVHwEggDMefsd1hoix+PNaU8dxsFdxuUKgotmmP862jqo+9BrosBOSZu32yj41K
	kDSRLxabG7/5jgyiI14O4GVMPH8IvGtNsIiijSibDGqGuxFu1j1mqcGrYGPkUDPRIrIsmkzL6q4
	ELPpsQIDVpExDVTYJSwr9k1aB/sMt0e/HjfBkREdh5kTgF8JhcxrDx3UKCJzWURbD2abxqYgYUm
	BwOkjU/XvA2vqbJcdKMzXivKOSnz2bEi0jdAWKanTs81emWbYaV2i2zltL0e8ETs1VZEInm6J5p
	mgWxbjifjpAyPBuP50PoP73vtns0e3INNH3Y8l75Zt2PmU25G/rJtCjmTKrLX5OHNEuip96Fzlr
	7MBUgq3CkCOxFwWbIoT6KbpQON6XfyQSx/Wgu8ptivTt5zffaRWwyNgvNIXq0Bh31YBt+gVg5IR
	sAiop5JIeWjWU3eWav3MP+gjO8j40U6BrTHENnoDxq++l3hH5iqP7NMFUx8p+GNbdJywOCaFntz
	v5c4ilP7Gw5FSaR16TNIFOnLNSxJ2I6LS3Mxal3VM75wYM8hWAmhb1FEJQoSpthxUxRCa1zbbm0
	OhVXCgDckrfS1UbLaSH5edhXdUTyLH3IOxMa8lkaP3d2Z66F3CPK0g3kFF5nCi8pTn8CeEyT7fo
	k/mVOHqB2ubeantPFs9QoR2F0NzH4J6Usz0HX5xHpHzVU+0VLCKRvR
X-Received: by 2002:a05:6820:1caa:b0:71a:e9eb:6b9b with SMTP id 006d021491bc7-71ae9eb6f5amr480181eaf.21.1794733614395;
        Sun, 15 Nov 2026 01:06:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:06:36 -0700
Subject: [PATCH v2 3/3] dmaengine: sun4i: retire interrupt state before
 channel reuse
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
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-3-fb7d258702f8@gmail.com>
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

The IRQ handler samples pending status before looking up the physical
channel's virtual owner. Another CPU can terminate that owner and start
a transfer on a different virtual channel using the same physical channel.
The old pending bit then passes the new owner's association check and can
complete its transfer before the DMA has finished.

The handler also releases a completed transfer's physical channel before
masking and acknowledging its interrupts. A replacement transfer can start
in between, only to have its interrupts disabled or cleared by the old
handler's deferred cleanup.

Clear both pending interrupt sources when disabling a physical channel,
and read the status back before allowing the channel to be reused. Disable
the sources before releasing a completed transfer's channel. Re-read and
acknowledge each pending event under the owning virtual channel's lock,
before completing or rearming the transfer. This rejects stale status and
keeps the old handler from clearing a replacement transfer's events.

Fixes: b096c1377d1e ("dmaengine: sun4i: Add support for the DMA engine on sun[457]i SoCs")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun4i-dma.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index b0c91dab62f0..6ecc45cadd91 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -400,6 +400,13 @@ static void set_pchan_interrupt(struct sun4i_dma_dev *priv,
 
 	writel_relaxed(reg, priv->base + SUN4I_DMA_IRQ_ENABLE_REG);
 
+	/* Do not leave pending events for the channel's next owner. */
+	if (!half && !end) {
+		writel_relaxed(BIT(pchan_number * 2) | BIT(pchan_number * 2 + 1),
+			       priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
+		readl(priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
+	}
+
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
@@ -1125,14 +1132,13 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 	struct sun4i_dma_vchan *vchan;
 	struct sun4i_dma_contract *contract;
 	struct sun4i_dma_promise *promise;
-	unsigned long pendirq, irqs, disableirqs;
+	unsigned long pendirq, irqs;
 	int bit, i, free_room, allow_mitigation = 1;
 
 	pendirq = readl_relaxed(priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
 
 handle_pending:
 
-	disableirqs = 0;
 	free_room = 0;
 
 	for_each_set_bit(bit, &pendirq, 32) {
@@ -1142,10 +1148,13 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 			continue;
 
 		spin_lock(&vchan->vc.lock);
-		if (vchan->pchan != pchan || !vchan->processing) {
+		/* The channel may have been reused since pendirq was sampled. */
+		irqs = readl_relaxed(priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
+		if (vchan->pchan != pchan || !vchan->processing || !(irqs & BIT(bit))) {
 			spin_unlock(&vchan->vc.lock);
 			continue;
 		}
+		writel_relaxed(BIT(bit), priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
 		contract = vchan->contract;
 
 		/*
@@ -1183,7 +1192,7 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 				vchan->pchan = NULL;
 
 				free_room = 1;
-				disableirqs |= BIT(bit);
+				set_pchan_interrupt(priv, pchan, 0, 0);
 				release_pchan(priv, pchan);
 			}
 		} else {
@@ -1191,21 +1200,11 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 			if (contract->is_cyclic)
 				vchan_cyclic_callback(&contract->vd);
 			else
-				disableirqs |= BIT(bit);
+				set_pchan_interrupt(priv, pchan, 0, 1);
 		}
 		spin_unlock(&vchan->vc.lock);
 	}
 
-	/* Disable the IRQs for events we handled */
-	spin_lock(&priv->lock);
-	irqs = readl_relaxed(priv->base + SUN4I_DMA_IRQ_ENABLE_REG);
-	writel_relaxed(irqs & ~disableirqs,
-		       priv->base + SUN4I_DMA_IRQ_ENABLE_REG);
-	spin_unlock(&priv->lock);
-
-	/* Writing 1 to the pending field will clear the pending interrupt */
-	writel_relaxed(pendirq, priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
-
 	/*
 	 * If a pchan was freed, we may be able to schedule something else,
 	 * so have a look around

-- 
2.53.0

