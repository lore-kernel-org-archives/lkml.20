Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304624;
	b=i8k0l75gQb9kkp3qzPWTgOFEfRMgAf5Q7bfQXNgb9nTaM5eLMAPJlJllfHPs1OqI0HsD
	 GfteX07+VhaQcZMZt9TpTd9mtMDQk22y3tFPnm9cVR53J+V7PchWWrVPJqy0bdMca/+wq
	 41JRBG7Z+zKJYkew4vOdJC8ViDUDGprVzcI9eXZy2VGyg3hI5NiE4IO7VaFLX6orIKKk9
	 NAovDNL0BhMsCs7FhEkPZFZJkiMOb3w+/y+8Zc2nEBaeMsUa4EHKcYeeHp8Dqjc5sptJ1
	 M3pPmhbctiOUGQrdR14mHEXOkkX/Bp5rne8P6bX8D4ArF0FUFtIjc5oMAsHBLq/lqRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FQVoN2DIK9tE472IrCzkbLgC7VY9Ri60XsntnBv9TC4=;
	b=UYslkY5H2KCTy5AC4XGwJlsY7tzim/SZTNlrEnpf4y4gPoAWyP+bTWqr5S7qf9Dl8uJI
	 +nt/56W6A3X8Ytoe96r080cCaYngEl4VEbWH3liW49FkAvVLRlr0HhibqEfIYWezXnKTp
	 TMJCI4JnQ3l0DUWo0mOdY+augHF6Jsyq87dT6Sqo1PmQ/Pshg80YOjDv9gKFqLBveJaUt
	 z5VuytQRLWpV1QaqbtrdVXRe6IQRftKGBUM2NeKbOUKj+CYNauHVyQsj108Jy2PPtz69u
	 m8bvTDiciNPOwFgPO5lh3Mwfp6Dv61VwHkEXe/0EzbBx1a8Xnp0cSdODEZcTer4bnvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vYaLbiLH;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA49606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AA49606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vYaLbiLH
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so2752363c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304623; x=1794909423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQVoN2DIK9tE472IrCzkbLgC7VY9Ri60XsntnBv9TC4=;
        b=vYaLbiLH+Ml7HUhkCVIdy0ckcfKS15GmMl7M7vvVOk0a8iaoCp0Y7GZH41N9ZjnUrd
         w/7+FI4zgMUdIBMi9nDw8JfoowjqGh2gDp6X5pfyMcV09Dl9S0rFtTYEZCa0QJH406il
         9g0N5dNNj4OrmBItDlJ/akSL4nT7epVTNvZsi/N4BqDnoOOqMGacDwgSkOdOVdTa3dvI
         mkAFmiW41h/XOhkxNvW4gAB7I9f0B5r/2JJUJBzZJvhgHOeX6zliPiUm7rrprcsO4vAc
         q9bZeGosL2rO5XL860sLKyG9P/cPcgJD3mLXGIf48kgkMUqR8Qgi1igL3i+rRoyQ+L/z
         OSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304623; x=1794909423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FQVoN2DIK9tE472IrCzkbLgC7VY9Ri60XsntnBv9TC4=;
        b=ygi4dFbY8YYO89CsZV4j72aSS5OdFffSPqFI7dADNdHaDVppcp/56PfkaE04GrGKPo
         +YIKMJbGL3WJPcAuqN26GFvPhuQ2ik02KAw8eFsiQ7PuecUjO6mIJsq2Oyxsjop7+tak
         M0ETJekWvlTYHX9LVFIPQhblN8yLghb+4VAYFHhYXPEtoyr2VUmltN4r1avqcg2KLkUn
         b3GtRQAGs7MiZnBpRmJVQCbuN7pfkdGfVXy773bnpJPjrAmkCnZA+BLKZtviWlApCN74
         dE29+girmkH0vV8upeZgS4A57u4L2wIcGhB45e5FUoIoKgZomcNlYXjCPc4FJCUusVGU
         DSLw==
X-Forwarded-Encrypted: i=1; AL+hErGq1Cma/yMbE0dgBPqZ3Kn+TWdVMkcW4D0WoScHiqCIATIoqjxVQbd+PJWIC3Hvo8rJCwplpS42a5uJwSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IEdhozGxvpo5j0oZZvh7+f61pdElsbFGl4SKTU7nwHYWHbbfa
	GG+kqkn8Hz1qeDQZEpr+jIglS77AG0BCKu4OYrZTu7ee4B7RaafxAPHn
X-Gm-Gg: AYBFou0Fms80go1SPrUficTTnmFD88P1gtZ8BgSzgPoCZHk57fD9DloIglBIcz586Vr
	2wUJ0Wnaf820adX92pKY1uu4iPh9a12W0R+wxvYxMvWEYTbEZG9O/+GCjGuiyVYqVnCotz2J2bI
	IFgignn8Ypr84LhgMUZQWlOY/10yjIdGP2IfhzuGHW1oXWFA/w+6Jb3P8b/7Pkb3JLJuOxjBGmB
	8aNaAt2d9vFKbhgo0Ma6evF6JqAc9w32yzh27s6BzFawoqbhi+krMJtmCJcD+yiRXfuoMyhCG7i
	yVIyeMJCAEkDf2jm+idJs3rOrwLAUOptzelSFkEZ7isByX18jKljBtDWKfjQdUo80nkm2SaQEN2
	VURlTqy9y7i7WUFPO0Ly1SjMsiL8aKJAlktxiQ9YTWz4aCeORp2GQeuViAbcXj6odP5LadgPD68
	ZMFh+GZXOIUHd6B60L03k6a9OI5DHB1Lm/Rm7DJh4BUEF7w/kcf5mLkWkChpt8wd0hWQZ5nm5gT
	3REeczUHX3msusR3RRCY/dPRfbyXLZpgMjDMbyOfU+uM8s8znhyx3nz7rzVt1rNYAOiwfvWoA0e
	CAaSTtAzxdfOCgV/wBIQmJBUngQ6FVt0J9mkm1PxszJgxNrFoqEmO0iQ/b5Y17q6MPPoKmkI43H
	97wmNpqjC8AowVcQK+uUXVlR/tXkr4LpFFPJOk15DcIr7
X-Received: by 2002:a05:701b:420c:10b0:1b2:6cba:7f48 with SMTP id a92af1059eb24-1b3b5fff737mr3087655c88.31.1794304622608;
        Tue, 10 Nov 2026 01:57:02 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b75d42sm5203801c88.20.2026.11.10.01.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:56:57 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 4/6] ASoC: dwc: Fix DMA fifo_size calculation
Date: Tue, 10 Nov 2026 16:55:23 +0700
Message-ID: <20261110095525.504660-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110095525.504660-1-phucduc.bui@gmail.com>
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

fifo_size should be the FIFO size in bytes (depth * width / 8), but
the code shifts by 8 instead of 3. For capture the parentheses also
make it always 0.

Use depth * width / 8 for both directions.

Fixes: 52ea7c0543f8 ("ASoC: dwc: i2s: Add StarFive JH7110 SoC support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index c5773f191db7..b0d3413c27d2 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -664,14 +664,14 @@ static int dw_configure_dai_by_pd(struct dw_i2s_dev *dev,
 			idx2 = COMP1_TX_WORDSIZE_0(comp1);
 			dev->play_dma_data.dt.addr = res->start + I2S_TXDMA;
 			dev->play_dma_data.dt.fifo_size = dev->fifo_th * 2 *
-				(fifo_width[idx2]) >> 8;
+							  fifo_width[idx2] / 8;
 			dev->play_dma_data.dt.maxburst = 16;
 		}
 		if (COMP1_RX_ENABLED(comp1)) {
 			idx2 = COMP2_RX_WORDSIZE_0(comp2);
 			dev->capture_dma_data.dt.addr = res->start + I2S_RXDMA;
 			dev->capture_dma_data.dt.fifo_size = dev->fifo_th * 2 *
-				(fifo_width[idx2] >> 8);
+							     fifo_width[idx2] / 8;
 			dev->capture_dma_data.dt.maxburst = 16;
 		}
 	} else {
@@ -711,7 +711,7 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 		dev->capability |= DWC_I2S_PLAY;
 		dev->play_dma_data.dt.addr = res->start + I2S_TXDMA;
 		dev->play_dma_data.dt.fifo_size = fifo_depth *
-			(fifo_width[idx2]) >> 8;
+						  fifo_width[idx2] / 8;
 		dev->play_dma_data.dt.maxburst = 16;
 	}
 	if (COMP1_RX_ENABLED(comp1)) {
@@ -720,7 +720,7 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 		dev->capability |= DWC_I2S_RECORD;
 		dev->capture_dma_data.dt.addr = res->start + I2S_RXDMA;
 		dev->capture_dma_data.dt.fifo_size = fifo_depth *
-			(fifo_width[idx2] >> 8);
+						     fifo_width[idx2] / 8;
 		dev->capture_dma_data.dt.maxburst = 16;
 	}
 
-- 
2.43.0

