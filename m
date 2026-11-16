Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855164;
	b=QF+Z6bwKCAqnmV94RrzNke2hiIlEuYbFW9muPQ69LVwSepVx8J3b/ZZKcBFDR9s99ekc
	 PjI3oauPnmYL7G/6IJCqMq/jxTbcrY+QFGeYd94RhdWHh7Kyg0VNchA2xzPe6hxJZd3qz
	 +I6wsenTj8I+yUQ4MCp2OgQ3BeLNzCPMcUMTDOcWkQ45eei3vcDCYLX6DboZo77HspN0u
	 5TdcQaeRKzdsZgYj4NeEbyjLHCGHwUrs/2aiKJ6A12SM15PBXFPEY5BkG/QBplbYv58S6
	 LrK6SEuGn0uJmfyi5Qw75qd2+N9HUDF1CvhBEvGnBMbcCjDLRZgrlmIzO36DBg7JE5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TJT4CBUbgD3xpezjgv+AsgOQys6XK1VUjumYM2wegeg=;
	b=dMDJqZrgwLXyUD/GSmOajG2rIdEHs3QiJfLNXPVUWrbbHND9PBSYheqZ/bV+1fJWp+5P
	 t3021LO0eapZVRGOmUbTaK2nTQXIgHv9cZFSyor20VWFZlqlclWgIpMABecbazCzzuNXS
	 3IL4dGyzlOO4LT02ZMTBdb5mQduNDQWvAQ4UD5ELa+hhL+Ivg2/hXxDNrnQW1yhrqUqxA
	 fHa2ZVVz6YcoX19p/DZpIArU8d75bdDxluKJPgJKzpIcA8+1J7s4TUUNvQGpGPxn/5YOQ
	 THWChFdYdH4thNv3fh2Zmmj0Lb+cPkQZlm7FYnRAIPvpRAK3GasbD7+pBo5eNG7aggg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wyLQ5Mgj;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9691606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9691606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wyLQ5Mgj
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso24277235e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794855162; x=1795459962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJT4CBUbgD3xpezjgv+AsgOQys6XK1VUjumYM2wegeg=;
        b=wyLQ5MgjxjsoQtM0gPvPL1Skkd0515VBuf3ATX7cSVOFqv7lRiIcZc7BgwfE0sTMaO
         /t9N07vlpHHy+HJmr02ctplUm7MZXxDS2snEKADzh2UmP6NBAAPVGGm/f8C5fYwaPNnN
         c2/ra2Ae/RiXgOWDUfc4ZN9jT8lfV9QfcCalHEQAADMZ9to500NgLfILGRrLQE2I5+RN
         g4BZ/9sz4SVqB8Sb7xFgNDpxsTZuwdxsHegUN81spoQjGmmRG712Ajmwuku89CAIdq0J
         6ymsuil6hEUD2qKazE/KPFYcB7iVeLz3wGu1E2HEJ37ml1QAxhm6dFxv7za9F5mTUtq4
         Pq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855162; x=1795459962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJT4CBUbgD3xpezjgv+AsgOQys6XK1VUjumYM2wegeg=;
        b=ZWZlwBPuDHoAbpIjI51x40t/zxxsjLKzuEQtQM/ibpmY0H5bXuypOTCnCJgIYu316a
         lsK5+W9TfXuGionZbRj/gp8y5t1EZfCfAZ10suD5DJGcjysiYPAn9n4NUZ8gJ+/7hPHv
         fDI44YaCzYiE+wHKWmiCUEW4uUccLD0sOEvcCHBPEAG0/1ydCwdW5Kq2P3XodBaZ5zik
         UBnnTc8hLjoUT2zSBNrvi7UjmyFcVsBZWQdqnsKqEpqx5O47S9XVxCRrUewmkpGGUb+l
         VpU5Az2q69qiihL1uw6FGaf7mfj1bft05GtSbYoUHVXAHW3uc38WMJPNSi5JwD0Txohb
         m3VQ==
X-Forwarded-Encrypted: i=1; AL+hErE0M0xRHfK1mXsxpePIZGqLxeloq6+LfExCeqABlrTdNmtMW5/u7yG/b5Bb3pmuHS4/jM1gLmz5iL04tco=@vger.kernel.org
X-Gm-Message-State: APuU4Z828oVT/XaCbfur8mGYsfnSppdVWaTjb/fo28bYGyVfMad8ouHP
	BuQasaW+vuqPaiG++IygICYpHILmYdrOvKmwO3yB4HtUvHYe4Oij0+WuW1s6Gg==
X-Gm-Gg: AYBFou12ivzs4/Bx5xYZOvr1AGY6pm5lq3l22/3ya7/9nYjhKUyzvkmL6TWshrYceN/
	u3/nd6GsEAi27SzAeTbjjFLkbTWHozpBEmPz7Mn7qsTTpJiniNgr2mfK0aWcq/W+dKZUCIIAAGI
	g9zUonD4mwb42Yp+bp33/GgxUpAiKVayNyOLJzLX8zLRkJmUpmeSafO+AlXqAMHa1ksGanu575p
	vHxWpNqFAtYcGHDdn7EGM0roLgnPS3UcUAcdwvHk5mnIq5FwBnWv4sE3fqFI+ICcKNoMfN8z6Kj
	4j+wJyFlqmdSzK87B1nE8DjY4sezrlMKfKQlR5nReHl31jG3irURoP5EG+jHe7J66cwx5NHXRd2
	HHYNb6NvNXsEAKyWSCpkk0/vuKKha+VsYu8y9c5e1nHrv1ZVKMbmLBaJJjGCaq68BGlrhm3dqEw
	a2GAkfeiTZtEHYLsRwppjl8xrqXRUV2s4OAE+XPO6lvyboYeCftcAlpTaGZzvyy9bgDq8lyS0TJ
	zwQNV2b/x8EcOrNo2nk+Bysjx7DG0aD8LTZLWSsZMuYVv8yYgHCKEd575n+BBMdc7LMCsIwJNR5
	uDIu1YR7ZkdIIFmVonc7vFw3y1+srZX7NrmHvFbV6ASF0/M675a69wPP1C+D9chYYGM=
X-Received: by 2002:a05:600c:506:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4bb55a5d6bbmr162373025e9.10.1794855162142;
        Mon, 16 Nov 2026 10:52:42 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm157961345e9.4.2026.11.16.10.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:52:41 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 18:52:40 +0000
Subject: [PATCH v2 2/3] mmc: renesas_sdhi: Make HS400 OSEL bit configurable
 per SoC
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
Message-Id: <20261116-sdhi_hs400-v2-2-de41f7a7f330@bp.renesas.com>
References: <20261116-sdhi_hs400-v2-0-de41f7a7f330@bp.renesas.com>
In-Reply-To: <20261116-sdhi_hs400-v2-0-de41f7a7f330@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794855160; l=4095;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=AnhaKOiPuDqc6xcLEGP7+1MeHlroB4vbW7YE9vOw010=;
 b=c5atoYCQWPfqNKolpifzoMYk00fDB2d23uepR6WSvcjIje1VR13Q73QWr5S3+oLm6nLE6oHxN
 gtTbd6VDSIMDnM6/wzMbjK2ycIwEimomYaSwy7GjWcGZMIwc10whUE1
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L and R-Car both use SH_MOBILE_SDHI_SCC_TMPPORT2 but interpret
its bitfields differently. R-Car uses BIT(4) (HS400OSEL) to control
HS400 data output timing, while RZ/G3L uses the lower 16 bits for tuning
delay and does not require the OSEL bit.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h               | 1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 6 +++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 ++
 include/linux/platform_data/tmio.h            | 1 +
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index a93e613e9821..8ae2ec04bd1f 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -42,6 +42,7 @@ struct renesas_sdhi_of_data {
 	unsigned long sdhi_flags;
 	u64 clk_mask;
 	unsigned int max_divider;
+	u32 osel_tmpout;
 	u16 clk_div_mask;
 };
 
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 56286431fd2c..7dfcf7f970aa 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -333,7 +333,6 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP	BIT(24)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_ERR	(BIT(8) | BIT(24))
 
-#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL	BIT(4)
 #define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
 
 #define RZG3L_SDHI_SCC_HWADJ2_1_8V	0xff
@@ -484,7 +483,7 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       (SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
+			host->pdata->osel_tmpout) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
@@ -621,7 +620,7 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
+			 host->pdata->osel_tmpout) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs400_bad_taps))
@@ -1233,6 +1232,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->clk_mask = of_data->clk_mask;
 		mmc_data->max_divider = of_data->max_divider;
 		mmc_data->clk_div_mask = of_data->clk_div_mask;
+		mmc_data->osel_tmpout = of_data->osel_tmpout;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index eaf21f93f5d3..37eeaa52f011 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -124,6 +124,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
 	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
+	.osel_tmpout	= BIT(4),
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
@@ -140,6 +141,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	/* DMAC can handle 32bit blk count but only 1 segment */
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
+	.osel_tmpout	= BIT(4),
 };
 
 static const struct renesas_sdhi_of_data of_data_rz_g2l = {
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 99b05c8c840a..501ca4355c34 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -72,6 +72,7 @@ struct tmio_mmc_data {
 	unsigned short			max_segs;
 	u64				clk_mask;
 	unsigned int			max_divider;
+	u32				osel_tmpout;
 	u16				clk_div_mask;
 };
 #endif

-- 
2.43.0

