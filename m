Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191889;
	b=HwlGaxx8eHph/UzCqOFaVP0g8WQkuM6DhLbXcxrq4U/T8mUVnubifnfguObMTGJ1eIaX
	 oYfaa4b4+1fvS9MSqQA5HB5IiEpeCJS0exnlYZibeDVg8N381Q5S4qOxghv+c+pu6UsvI
	 i4x008/QXde8VP0Sb/pbVyar3TuK1CkjabjHZPqnEw7VOk7nnYlPD71POTto/IOPC3HMS
	 6nuVC8xsHB+/xvLeAQ6M3Jb59F/AklQGZWyKCXZazx5x+IyliQDuUNfplCXIchnMziWrv
	 wfA1SEFEMSyp12/zMUTCTt6J3lV4QkbplaNNKlOuDhoTAf8S2vn31fmQB/m6T7awRIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ddP2tvF99I/T141/A+gWhvbN3hboCdFeGuQB06Tv2b0=;
	b=MwpACHLtOz4KLH2JWJAiqdEXv6E10QoV+1pt+rOcoEFJW5OUm1jJKnJ+UsgG4u73tWUR
	 HPlySKjB94JCI3Zpp+PnbGRf55mcRa6eb4GFRm+f5pWEWUH5rRMMPTkmTm/3vhLf75P2y
	 LYmt+xo6Hc1O4Oc1pbKULY1NBCXndDymnIo7n8v8MOMg0MwWUinr8Emo66NBJtd6cYHsM
	 ZMIMS4puYSA/79YUh9GuS6+fSvbfEa0qYnBtAu/QqjUa36SPiv0TdXPkO1aJqS3bxNy2+
	 CPPi7EW9b2sXrt89QXNi/JeOqZE8E75vAnP1YJGhXhx+wZPtLum9jiyiuahyS+Bbeew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IL5UIErK;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7201860A3817
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7201860A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IL5UIErK
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e10a70540so582671f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191887; x=1793796687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddP2tvF99I/T141/A+gWhvbN3hboCdFeGuQB06Tv2b0=;
        b=IL5UIErKM/lQd2sgYQ2SdH52+xW3kobCm/N5cfmX8+XFWTpGyNGeyInMxwRTROHizD
         +LmDPGH+yYW3cbybhD5OXjHLQ5654K7wq4UnlxiGGguPcQzwLfzJ9XZmEy/SgXFqGzB6
         V/Tn+YyMszstLGt+CgxuFIYkARQ8jTOp7AoiaA/VJ0d8aRkv/CewP1QWQaiocjc0uPXw
         9/FuR2rwQZrJeP5VLVWbL1K1ss6AhGFIdk4MwnMclfFt6z7X5+uu51UbrTdOYxP3VMWl
         6Ck1wPeLEoE9tAOIFZXsFNfEL3CCZP2dzPvMLTZ+4KFSG648YonOB1S7lM07aaZtsb9M
         MQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191887; x=1793796687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddP2tvF99I/T141/A+gWhvbN3hboCdFeGuQB06Tv2b0=;
        b=XxwZT/lZTwYAmboZm70wJKKoPXwZ5+TXh3/hw3WrsZEZZ+hRsNFACq7i9POBEsJsO0
         OCAVNztL7zEZc+ASHSKwD9kLR2sbnMubMqSC8a7Sb+5F1mKGW9leZasaqbGt/EFhR6Av
         skKRi2ap2QZunIWId8onieJeDf6CXFO3EvLKKgJNE82t0U4VYmb+KA1V1xLqVXDHUljj
         T+Wg08z7PP4F4nENwD4eud3jWBtvCZUzO75C4CpEnoABxPwoHfa9Nf+EPPcku+I5QagU
         VfemznvAp7j+WZ9y/pWfyvw8PL58NN/AxUGCiM66wY0jjTFNV85nDgOXEdFyapLry6Ac
         4kYA==
X-Forwarded-Encrypted: i=1; AKwUvByiQahSqB26n67/lpKZ+IZDOJALlEDY5Q5HpVnnV9jEDN4dABoSDCg30mRShA5jSg+mzDctMNbzwkyqI+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNmp2Uu2soh67Q3yafW3K7lQKNnfC2Yl0V1bdZCyEcRXoBXIhy
	MP9u1Dy0MMmMJJTi64Gm2f9DJcGM4OcdWV2welv+Gc9GaCXI+ErExG+C
X-Gm-Gg: AYBFou3UzpCsQHvcSNdAtoB93eGrHOgf3eiffLLsF5ErxISmGy9+LErzG6Epw2s7Hu6
	atZaZNokXiwXdhQyY/2errCGyMTglQpWspMyEgi8uIg1WDfvNsy26b4ZuOd0EuTDy89hhBxcmRy
	bOovaMqejdpObQLwnZ+M7XCs3kp5cXX8RJQKNYD+V5oUU7Sk4vudsoR6MsgtINqL16m2+7PxmyH
	z3jtOR/cz+j41/uC4l/+m6VL5nvmflJjKdM9wm3uiFqHdnaIjARJrtlHsmi6uSuT/Sd6qu68ppV
	l8CXT3kUUmBIePJhlesssF4TAbC9WbVh+frLliYMX5d+2Bxex9R4E4vcw8KeNhFczgt8FOMOylh
	ONyO5G5kIDcbrDoKt8pnI1HNjYfTODhisupr16RT101AbSmX9c+Fbhh+hQzkf6dOXr2U/9duhfH
	KQKGghJz7WKm/r6RTCHjkV58WmUz5CHUbbpg5Dp37DyQme3x4eiBBX6AIaW5DeR6bSoVVapiy5w
	OLX9rtNVu19LJumwhz2EAWf8lSS1H5JbKaB4BdtTPZX5raoxkpEYHZM9/YZ3jqu2vVvlG4+kRzt
	Ui60uGzVOk9wt72wODcn+wpBC+ZC05AOCUpMJ1YZFb9hnWxnEPjlVdouZ1UR3IIfprA=
X-Received: by 2002:a5d:6108:0:b0:48c:54c0:4cf3 with SMTP id ffacd0b85a97d-48e5d5c8a50mr4188115f8f.28.1793191886781;
        Wed, 28 Oct 2026 05:51:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:26 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:23 +0000
Subject: [PATCH v25 06/11] mmc: renesas_sdhi: Make clock divider mask
 configurable
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
Message-Id: <20261028-rzg3l_sdhi-v25-6-57f16691c2ed@bp.renesas.com>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
In-Reply-To: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=3021;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=NV58WXFwlSqcA9STMr65g+9y2UmbhN8wHlp/bQXqlI8=;
 b=FR2J1qyfFrzrgjVYnS/CxYTKleL8E1J0oQGmZDc04CvBxDWktJydaSolk8scnDIcqQxcb3Yal
 KO7o8AgRAAuBRXyD4RqEUz6n9Y/9DR4oqlfJLHXheOLgl3uIBuLrDVS
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a clk_div_mask field to renesas_sdhi_of_data and tmio_mmc_data
so each SoC can specify its own divider mask instead of the
hardcoded CLK_CTL_DIV_MASK used in renesas_sdhi_set_clock().

Default to CLK_CTL_DIV_MASK at probe time when unset.
This lets RZ/G3L, which has a wider divider field, reuse the same
clock-setting code.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * Updated commit description
 * Dropped initializing clk_div_mask as it use default value.
v23->v24:
 * Updated commit description.
 * Replaced  GENMASK(7, 0) with CLK_CTL_DIV_MASK.
v22->v23:
 * Assigned of_data->clk_div_mask in renesas_sdhi_probe().
v21->v22:
 * Updated commit description.
 * Added clk_div_mask to of_default_cfg and of_rcar_gen2_compatible.
v21:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi.h      | 1 +
 drivers/mmc/host/renesas_sdhi_core.c | 6 +++++-
 include/linux/platform_data/tmio.h   | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index b759376103d7..3c991f6b988b 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -42,6 +42,7 @@ struct renesas_sdhi_of_data {
 	unsigned long sdhi_flags;
 	u64 clk_mask;
 	unsigned int max_divider;
+	u16 clk_div_mask;
 };
 
 #define SDHI_CALIB_TABLE_MAX 32
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 500ecc357095..86778d83eb7d 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -232,7 +232,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 			clk &= ~SDHI_SD_CLK_CTL_DIV1;
 	}
 
-	clock = clk & CLK_CTL_DIV_MASK;
+	clock = clk & host->pdata->clk_div_mask;
 	if (clock != SDHI_SD_CLK_CTL_DIV1)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
 
@@ -1146,6 +1146,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->max_segs = of_data->max_segs;
 		mmc_data->clk_mask = of_data->clk_mask;
 		mmc_data->max_divider = of_data->max_divider;
+		mmc_data->clk_div_mask = of_data->clk_div_mask;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
@@ -1194,6 +1195,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (!mmc_data->max_divider)
 		mmc_data->max_divider = SDHI_MAX_DIVIDER_DEFAULT;
 
+	if (!mmc_data->clk_div_mask)
+		mmc_data->clk_div_mask = CLK_CTL_DIV_MASK;
+
 	dma_priv->filter = shdma_chan_filter;
 	dma_priv->enable = renesas_sdhi_enable_dma;
 
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 27ea21c00419..f684f4087a8f 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -63,5 +63,6 @@ struct tmio_mmc_data {
 	unsigned short			max_segs;
 	u64				clk_mask;
 	unsigned int			max_divider;
+	u16				clk_div_mask;
 };
 #endif

-- 
2.43.0

