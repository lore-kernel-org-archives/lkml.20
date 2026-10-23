Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780965;
	b=E4aMBKYtRWyfA06TAe+J0J7iRRltT575UfCdg1sORrJFHc/VA59lJV5FguTk7n8P4tpO
	 3I/G/wgK7wedhAZXqmwLeOAs/jlpTmo9My+LRQBWTaYgXUaaH5AVhGe61Q6UumhDpYvRw
	 8FbiZN5msrzted/PuUxGojzWjauWbK89D4R5b2NkSQe7oiFQzlFtmtr3xKueEjrH/hkR/
	 uTms//hZNemN4DLBse4Fj4uKE4R2VgtIJwUOawVj5t5fEnwreHiKSGtoxEseIn2gatmg/
	 wDNQHLbXpFhOCl7VfpIoVUr9HervKGQk7QO0efXdWEt1TrKGnBZpkiaBcEh3LlcTdEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
	b=K1URIfwMOUEJaQ4xqmzc5mAXpNcVFAz7EpOlERUh2WGe4I/rHpNJDPJNypjSQ4PkIyX1
	 +gbJe8OuySPL70JI9jSMfb23ovzVGxGRw09eO83Fj6y208/Hw3R6EE7vnqa7/FGc5HwRL
	 oHjY7wQ/q1oZef80NCRnyBR+T7kx8da/78DThJafA5rek1fvbFQtKW0GDRdin9SJ9D/9Y
	 ENOzbxPRRE456clcqomNsOemAE2yiChDmPUgX+GXHv7B1IWJr5sSJNPqU2NH/3TLanIBw
	 OahRnI1f3F2VNScCA67cpVuDCuJL7bZKDAsCgZI8oaxu0PaoElF8P583/T4c8IAeggA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=boAmUDgX;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8153606A328
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8153606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=boAmUDgX
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-847ac7ccd85so736860a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780964; x=1793385764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=boAmUDgXp1hX3kYPRavRSDi/Dfdi4D7sJxbXiSJRV98P+/YkSgSgqCBpcS0U6Padpi
         SvIh4brqcif1qCnWZBtg07XkoDdwxPzxbBkUVU3kuG25SjJHJuJS9U5zRa4YfgMxvy3p
         NGdxuGXPhT679NodQEH7OlBovG7Zf/eaFaEYT161Tc/DVC3/VfRYH+a+kom9PTnL8jhR
         ik0k9sDWd7F8uten/xEGvLIpnM/JBq3TUVcMOc5T4WxRHwemMnVMAPOiHRgyAOxPlwZW
         JX6zrseRPIxDusVPtZsNREFYpz9+1jCtm56ROoYIJ5AkCh05eHH7R8ht6Rj2ED6tN28A
         RKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780964; x=1793385764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=UDAqxFfBIDddWIREBCy0iYltmTUbeTu/jCJHv0FLdYIenyo179CRw/xHclsi8mBQRt
         0mdRvPxXGmWDIsBYlA/v47XavwwOj0eJ5a6Yk2jk8I8t8pRbFs6Yt1RmCaMTFKB5Txjq
         r9qiwSVqmsDAUiFN+bibQfFmbrqnQAhSgVRigw846wNbrRqYVxqO4s/aEp2M01gtMrMY
         rkL03OlTAzQvBtYn3d521TFwtyRqybr79QK51xweYQZh12j3vpeKSHuxZSN+AZp+/EeP
         +zz8wGxCTciNNZ7qwPGJIVL0p6VClYd+R+WUlUl94+bgp2r49CPtb+DhjVqbkbYh5iU/
         KCwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxl5L2Bs8XxlhmjmAlyMuJyBrf9lcLexmthnRD0Srcjj8vjdO8fdoB5X7aSDR7S98IAm6MKx750ORPPye4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRbDr/qnruGG/AKOV3F6qYHFG7OOB5O8RXuT13rD4GcZ2kYwQn
	LWO/oa1MBxvNNC8mB0Tg3mleEgNh8cDhHjqiH5rrqrWscfPkrS2ZvmXM
X-Gm-Gg: AYBFou0Tif2oz/3sAqXE42AWknVLdao28MrTH1pvVBUbv2tNdcw70qlsvttfrfd5LCu
	feYWCs/s3trGrdnF7xN0umbzIolzHWG2ftcCfZK1YaoHLrPZK9OZFkyxBwyr/j80hR0lTInjA7X
	Hvei2rJXiOtvB9K37jwgEVp9EK8rBml5r4Ahm7rMYfarLFyUay0HAiqXSgRzUiSK9pu8T8QNJSj
	NInPycPjkZP8FrB5aU0JqTptfMRvFl0yRgoHgoqTH8KYlkCEj0ovbWRFF4OcpfgPbPAruxf1tfv
	Fd1rc4y4oKYobfGAr2sEAMeMqAWdHKrycJ54+RoeYjlFtPXXDWHdjrCxCVfcjD7r/2xtDibdTBA
	AbzjJTDyNBKaXdJZIkow3UIHS/ysMWLxUCfLOn1+ibsfR/wGV4BxwWzgrUMD0dPyemkAD9OgW9T
	t0fI6Bwo+CCDg+qmjCXpnSj2ZPaIY5Kziqs7Xq2kqsQ3yYWS9IkaGEELJWN5pH7JHtUvUP0JPJe
	YEkv41hnYWahG6MmMSpKHelyOzdHmSm3BfQI5pa9TYQag/gA1mEDktmHNqb1I2fKxpK9Eq6kX6H
	bJ1w+Bpks6cL8NnlXNMHB9/HbZ71EnJra0r9E/XFDgMrOfkc/CHSicNrrIb6In5vWdgSfnIzJPD
	lEcgpgIfQ8fk6d2sdyvmqGrQXB6Rr++3DX/Fw5mJXfvrmv7L8IAVRI98uxaE79wm3F/uW/+HIa6
	W/ig==
X-Received: by 2002:a05:6808:30a3:b0:4cb:818f:d56e with SMTP id 5614622812f47-55c0020ff8amr68675b6e.22.1792780963715;
        Fri, 23 Oct 2026 11:42:43 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:35 -0600
Subject: [PATCH v2 1/6] dmaengine: sun6i: fix physical channel index in
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-1-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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

