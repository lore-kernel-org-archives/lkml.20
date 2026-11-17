Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933291;
	b=W76MUuiGbcozFa2Wk5joTN5nMirrhDTGfkstGVzpzZQLB7F8BlHwmxV2OA3gG4G6Z+hA
	 J8HwQhQ6ZYF6PgEmtPEKxX2wWXR6Ny1OIueuizIlFpeobMz+pnu5WarhDn9QAx4tthYXa
	 zlVQ2S+42YVkskNdb+4oY+hmRe9RKvF+8YmS1hTbzxLmr5M1CsOeFCcxmBy2w+S8JzFS6
	 6kbs8hsyE1kJCI5Y8bMYHvpNZjBCUuvpQvX/hgjaGSviUXwCnQr221LrLtvU/NLXMV1pn
	 xgL+LJUv0HrfIAmqrhZWvDNLvmjgMXsBNn0OP4iHKeO5qK4mrFBJtZdkyuozEX4m5fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=G4VqzAzyHFDWVHFLx84TvM4z7hRkGfZ+L7UI3ozJ8uk=;
	b=KsHfqHRPsnuaSp+pbegFJ1acCOuhUz8+EiqT+uHo359rUpK7etuzbIvq8cZ6bPAnCB0T
	 sLJwRB4ysfrztUtsETfqKCjerNAt5yGi1HmPsTpvZOa3GHsNR7aUZpnA3e88B9XjdEFRZ
	 BwA5EAgt55yUas+4tn7/w8S9ZehXe52Hr7YNsIEV20sdlMOgkV7/VFzZAy+akfpvxL2p0
	 gEliNwRbz8LI5XwySdaSIvT2cmzUCfiQTsl7f+ypENQS9ps/TCGAzyYamCVmyluSd8i1A
	 teWBcsX4Ao9DNdR03dCJXEoBNKahi1LjqmtJOeZlxw1xytFKrS7uNW4cDxkowMHRwmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwiyFm5J;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF0B606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF0B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwiyFm5J
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e46e449e8so3588041f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933290; x=1795538090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4VqzAzyHFDWVHFLx84TvM4z7hRkGfZ+L7UI3ozJ8uk=;
        b=rwiyFm5J5KcFTQQE+S1XsoqkqIrP4yBvmZ+PbLMSBCw6Q7uFf8dpnzdG/VD/2FkR7W
         iefd41L+YA8QWbSbBBc3PP13B3+9D7+UE8XFpfcHCAUInRS7H3BD/oLsjSTjPEpt04ty
         Vz6+WNsHsrhdDqOOd+D+iA0K4ZhgjHhGmWR4qLRC1oyADzjXFx6IEfT2intMfxEseJ+V
         XwPYY5+SlqS4It+XLva8w6zS/ymQdCF6Q6+wQjPZaLUDwTmwl2NzUbFkHpwArz7GeJO9
         3nKwmndaRUKxaSQqR7AZxDqn5+8S7Xoq1PIK/6jaEPbEXq3vM3MdQSY+45Nutp5Cbe5w
         sn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933290; x=1795538090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4VqzAzyHFDWVHFLx84TvM4z7hRkGfZ+L7UI3ozJ8uk=;
        b=1T0U+XkK6xfcIzH2D5cAdy55tWheap3b7BNYAZ/PLP8B4OJ1Ty33ljf9lG3tdg++dQ
         BzSj1MD+/dk5RKN+H+CBGvTplrMeaZpppv6VMD4/F9RuMkaXYX/s4yN3ihUWbVdYpvVz
         1QIIMpdoXKF7hRWf6wlcndBpDSH115lOqRKWCLlcZshFYEt2qUSQgIOttLojpcqxpyto
         EiGNWJlr2yA5tXVA3TJd/HNwS844hb6984plR86l9Z0jPJMRdxIlU9VPpMqR3qTHoPXz
         VC6OPVx9ubzisG+hwRLv9t5nb/pVejFHcnXN4Vyr+d+jYbgKtrKn+8KGYX5FGmoRVK4q
         4Fvw==
X-Forwarded-Encrypted: i=1; AL+hErFUYuG4ChivMl8/+ZQjKvPHR1y6EbYmAYexDRt/xPIPvo8DKniIOnBtnnuKanuagKfcdXoCs0Lvtw+YD2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z907cJxbncH/eL1bT7QMGmn0bB7cV9hGcecgcW27fISgHOD4O5K
	aH37Zpre5rXW5ZUmJ4vSn3xHRq4s0kP+CYPKp25eMzY06C4cXxv/LP6I
X-Gm-Gg: AZFdTZcqNlvNzZuAaa/FYluvaIJOg8JheB28QmKWAAgM25hG8lMfdt8VCfIJaRIn/+/
	+Fgkv3up1ggnXyWHWS7mHwy/zead0U0EJU8TfAtTH6ESDv5lmjXEGw4Rp2in0GsRrWq5MnLlC2r
	bzciiDAcTktwk7G0nzMz9Z8egGnPNSc/fdiAWq7T/EVGo1pQmNUDiGruFEfwmQCOQ/EQBOpsILK
	SINMTN4AAk0B8KkESV0QbqJVga9duTeS4aYJ+wyjEEm5EKbsrdgZCcWlskDd3SmYIqRw9BONry8
	7NRlX6znkoJJs81ETkqRsHq2I7q9IGXo4kTbuGexFRmVUVB9O6RDI1CSaEVVWOWNtJbgelt7Z0b
	x1eyIL63nOhBLu/cwGzQu2emjX3vZaNyh5nxBNfpfPxFFb6NXDqr6cwfoaSxtowLnRVK5+79V8I
	NoULP1Jj1KsUV3ZR6MEM0vet/9tI3mj+9+uMkldJr6k1mPkwkEOElRQJroCb2xEfuUm19DjjJsL
	H2BmpasDWP13CwM7tLnqvJMcGdXrPPDfrRepYJPib4olzN6khSShSJlgsNlodJd4vHWm7SvJgw/
	mU2JJMO9FG9jkeI3WAys/mZO4AV57ZO4vpW5R6DBhbfdzto513bpFLooEk2aZiyDerjFcaoC+Zt
	fuxwcEWmAVwM=
X-Received: by 2002:a05:6000:2dc9:b0:48d:f460:2c62 with SMTP id ffacd0b85a97d-49c71785323mr33874048f8f.33.1794933289986;
        Tue, 17 Nov 2026 08:34:49 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:9260:9c28:f0f5:e091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26672248f8f.16.2026.11.17.08.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:34:49 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 17 Nov 2026 16:34:47 +0000
Subject: [PATCH v3 2/3] mmc: renesas_sdhi: Make HS400 OSEL bit configurable
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
Message-Id: <20261117-sdhi_hs400-v3-2-b4659189db69@bp.renesas.com>
References: <20261117-sdhi_hs400-v3-0-b4659189db69@bp.renesas.com>
In-Reply-To: <20261117-sdhi_hs400-v3-0-b4659189db69@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794933288; l=4117;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=SYAfKvjWLRvmc21t371OTT6TgUwITNpCe9K/LsMWWmY=;
 b=pMXLHb46a/LS8oP3axfxPDPS+u+Wt6ygFOeiojPu8970sOZsOMNQM4qKK0lPrTkojh2FbGEwf
 QYo2hvyotaIC6kRABLxNCMDuudh/7gTsPksstD+VzD8D83djD7228eH
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L and R-Car both use SH_MOBILE_SDHI_SCC_TMPPORT2 but interpret
its bitfields differently. R-Car uses BIT(4) (HS400OSEL) to control
HS400 data output timing, while RZ/G3L uses the lower 16 bits for tuning
delay and does not require the OSEL bit.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
- No change.
v1->v2:
- No change.
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

