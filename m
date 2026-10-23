Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725300;
	b=FR0U1KBLsPa/2tK/SwIBZCDR65JjR64LpWiDKuLa/y2awNe8yddihpXfQAUpIhKFF8m/
	 D4IeNrapB3nRTxRUED4OzgNTrxU1iZwCmdCqZHnWtgzSZsrtU7zXt2bc5dDqBPwjdccUg
	 FSMbzuunc6cx3+lCC9SLX8cEf0uoubeR4AosaiNbq1i2HQYSkdfqqKg0Rbeo5X0o1UjDh
	 0wO8ss15443suXIxtjK7SAaaNuBQfLal4+r3HYHO0WSIi3WXp+1acksfZQBXpyOZZ8Msx
	 DTsk+yEo8dPvpr1P5QglajuoA73l23A9na1i5bjdqkzYRLeGnhuMctnM4FiQCJdXP0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
	b=l58iV0haVtztSm5jlcuOwxFpIlcoEhxcsYH0mbNNZcQI9+4MoZQCvzlrFosFORGD0d6m
	 XORJ0z9+W+yS7BruGqLP/EtNuOe+tkFw76QpZoaG0dd52t3SU/5xiSOzgVPJJLwV9K/kh
	 vnZJ1ogGvP0gkzU+9kHKBdNtBlkfnUenvx8n88vo4Q4ZyVCk8TE1rzCsFZVZHpg0GR8wm
	 5CRYjQn3Po35OFPwj071X3pte4eqBnYxGp+FJ3lmsgN9es4iVYLG5NG+O27mF+gQjYd9b
	 8eAKdzHClhl8R9w9LUkuVuzu2CTFJnKVhmeqEUBnoKwO1AQ51U6E2ON1aBaYycr7rvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FSyRO3Jm;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2936606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2936606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FSyRO3Jm
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6f5a0893610so300057eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725299; x=1793330099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=FSyRO3Jms3E9Jf5Dvp+KldFAHs19x0a+sFC/yWDyB3yn3kmGAue8c2MNODXgnd+1SE
         Kf9iKg2wgxcIyrj6joHsbP5FxKhYPs0dsVywMuUaVGjIbTR6kfXSBMgLc+kHGHgyEnwB
         T2LGDmzDdsJGUaue5PPUx/8Gqulcr5a9xlYQT18Q9MANOrkCrsjqzYIQqo1//UJ8h6Ue
         mQ21DclioF0qM1wDcIUIDmmDDrOMXIU6aE/TrK/b4pNfr+qORTJ+E7DJIigEcua2lpb1
         8as7S4Tn0my/DkJltl1xKcBAVAO4/owwBfpfV3wSpoXNR/SuIthpbwOdW0KVpGuhBwZ7
         DGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725299; x=1793330099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=V3F1DsrymTM52DQQw3ON4FjBevflHCA2qTCG0sGSPdeVrf7Yp31IZPIxRzJMR+EVj3
         ONVi9T6g8XpZA5JQeLokVljP2FiWQlfy7givN9ObYDtQwShDDt7VGpmMmRk5VtRkFgzv
         pZz9fyAtS6E9H1tbJPeIPZFSIeIT7j+9jYf4fUawF6z5Bo0DUgkZ/irZewJCc36Q6PmR
         XLejX+FMs+0n3twUpgpavbRZF0l/0fixKRmmNAalWt6MlIv6XxqKJ2R0bhphj0hT3uWs
         Yv48iLfPlpOF4JwDPA9vjpbrZEDajV4O1T6dpzVLWdKhemKvyuPtEnM/6FzkmwijtR21
         pAdw==
X-Forwarded-Encrypted: i=1; AKwUvBz9DRPNGsNeBW0eJSqnSZNOj5hz9lpSTx35NLPWI4T3wPjCNOUaJIh+Lv713vP868vV0IwxSQJSi9s6j1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5qsHGCvtTDPHsCI4eruV+8BVCUQjirWYa8V2E5o7qgrw+La0m
	25hZeP8sPcNaIuCvNIRLJxP3Tj9O0dU5nK657g8U2q3MsKC3NCdcZPr/
X-Gm-Gg: AYBFou01bMQMgNe0Wwb6BrYW/I6JSp9y5h7o5dwksoV+s/GzO0FPYBHuawd/8bhzSjP
	mIsTuIgfkWaqzWjmcj6F7HO6jfb+JqY/mGfAF8JqKWegr1p7nIGRerg1yMdtbEfPu1RvsbugORb
	7s2z6Kn7dEYHfXN1rNh4taAEeFGqV553xklfkYG0uHMnEO2xCHL+WoK+sc/lpW9EhlO9wbqNcnJ
	4PVEQffw2+LRmDVdkPkAtL///GTbGvRMJR/K2UiFFt4YuXig0tDM4ikEQMuEfJYRPaVH5+K3zED
	O2PXP1L4L/5JFP29dnwW+Y6uyyq/cvRzJTVnIHxmEXjEwUPyTvJ3W4x4PjYyyIrTuQ1oOxiOo/J
	gL5copvt6hFuHzC1q1nvbMTHwTsxZrvO7y14KRgOVvzh9pHTAsuSD+tpyzyHEw8heEH9RJnYc3U
	WkPELxI5hiXHwbJdvtoMYSAI7eUxpYWQJOTyJwXW1vpWm003JIm5CqCQ+/tNZeoLsYMQAWI6lc8
	p56k5uZ2u08/7N5AQ4K/vtZnCO7vCELogeKt6ZVhI9t2x3zO7xgLG66giPT2u/lU1jx3UqEssyY
	9JiODuFBfS5LgSi1WrISuN/OCGPJ8sVp456JUGw/+vqEUUduLubvoebMwE5vRO3aCix6OWIynvu
	OdkETiPpdDpEUgKK4vsEzWVGNWVne91k8JYiiSspHGE2iZ5+RCQPLQcvqzEgNO2CnEdr4+pS1Ls
	2hz/Vd
X-Received: by 2002:a05:6820:a013:b0:6c1:f38e:7053 with SMTP id 006d021491bc7-70b8880e70cmr711138eaf.3.1792725298780;
        Thu, 22 Oct 2026 20:14:58 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:14:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:52 -0600
Subject: [PATCH 1/6] dmaengine: sun6i: fix physical channel index in
 interrupt handler
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-1-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

From: Hongling Zeng <zenghongling@kylinos.cn>

The interrupt handler iterates over register banks in the outer loop,
but the physical channel lookup uses only the inner loop index. It
therefore handles every bank as if it belonged to the first channels.

For controllers with eight channels per bank, interrupts from channels
8 and above are routed to channels 0-7. On A733, each bank covers one
channel, so every interrupt is routed to channel 0. This can falsely
complete descriptors for unrelated channels and corrupt their data.

Use the absolute channel index, calculated from the bank number and the
controller's configured number of channels per bank.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
[james: use the configured bank size and describe the A733 case]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 8752969366ff..9d94a37fcf10 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -603,7 +603,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		sun6i_write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + j;
+			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

