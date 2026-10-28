Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191891;
	b=logjO1HPjp4JCf9VmULtngILb8zBSsoQCHGlu81o5BVKEihqruO4TIEIE8oGC1NUJv1y
	 BO1SBAUi5s2V8Mnlul1bINeYKJVCMd31L2rgg5cVG93fInRXBbmkG8YyyPF8KodTHiWNT
	 BsiL7KDWFfqxpj2Fq/tRR0zP0q+3KE1GSEPYKDIwhJGrj1zIc+V5aIbj45nPz0id9Gmlz
	 hk2F+aZlHTv17v8E9I4hNN/69fvwZCVO3MLK4TbYh55OGydhnB1IsZHsMODVSsN+n5saN
	 mTP81X2y9ZwknycTYZH5nL8IzZz2yUwUsQGRvvSh9JnezZtBxH5ZocEn57bUg4/5y8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EPIN4r3bCHjgjxlfFW6bRG3Tw08SL70nFhss8ybGCSg=;
	b=tpMF1r05D1SyzvgnwJsk8SM0CjQax5cWMX+fbKl/fwo27Kl4xB5msO8v/pvJBLXG1ntU
	 YG6lYKWts70xDPoLSl1OjMOJAGhQBkKkONTHA6oG5YJZ8/krf5s2Bm6p1RDrQLOwEnFj9
	 EVkFCkRtueFTA0nAyb6HjkDCTk0BU0aPQCeb8C3wzxRCR2HwRc9bZhRVZUBNBLTMJOLUd
	 bvTIUKzaxVTP8mb+gwK4lRF4/K/mtQnpZBAt4TPBPcy7YgaYv5N7ysngcouKXIoXQOb30
	 4lY5EkBGXlgsmhBwzOfauvl4gwFfquTb4b6c4LCTtXHXKO82AITBD8ERAZ/W32sw15Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qN+Rd84l;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB3560A260F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BB3560A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qN+Rd84l
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e00eee27dso681078f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191889; x=1793796689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPIN4r3bCHjgjxlfFW6bRG3Tw08SL70nFhss8ybGCSg=;
        b=qN+Rd84lWJWV99KGq+ug+5CnZPbZPurnZnLNs1WxlQ3FPRiOkx8b/piz87jDQ5gBsX
         Qrxd5sjNsuA+sEa6DNTqzYrsnFcPrvBcht0P5gE7HDfRLPS9l46s+t4L7Hfka+jrW0Gp
         o+LYBiZrqQdRDvEL6802tTx0A62m0ZTbS0b6FSx0ZoO8hv6GJih2NTjmv25ifc2207cH
         U5/AY9UnkM7Z8B9+0rLG5bmVnCn8Cvz5aBSrYxe2kup7aJYyYlvQbyBraW1mRE4nSVTO
         G2t3rr3SKoCqvOop9C2/2PiUYxmmrZBrebUd0VZ66jR2lo9Q8q2QzJaLAUo0jZizIwn9
         AWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191889; x=1793796689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPIN4r3bCHjgjxlfFW6bRG3Tw08SL70nFhss8ybGCSg=;
        b=Ht32W6djGfjAlFC0tMPvc/8I0mRfFukQPHEl7N5nIxPH/3ZC5hgPrpVduw4/uLjqio
         YcUCvgI73QhERdO9+lwaHqfuvLjpIjKUc0iUCUE0iba/jbL4b63XlxnED4RfJ3mDKp6W
         p4F56n6GBh0xbM0qqT/bVtaKuOjy1Um2FdZVHgKmxvjzBlB5EPJhMKuFqjARUT6lLEYC
         t15q9RX8DlYRjQc0aUOt+ojmkbs5NCLCJo5voChRiIyJ9A/5Zwq2idPo5djtq86pzWAP
         OFPa7dZ/xG2ogayXEAB6sXJ+MeQn7D0FqR2vmbQjadG2hQOqfpcOPXTudA0O5TzVX3GL
         YCLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOVWOuQOV5lfNtpWX6k30WcoytMJCgmlmpfUG2oNdchvsqZjoDBx7U9yqI8gss+0whbqI77PcHtGdaDvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLI4b/g/Do/mFqMpY6ev4ev3q68zLPEl+8OvdNgWE8r8G1f6ta
	ODQynRDzwinMI+c+Ztn+3AQ0TOvv/DgyZLE3TGuBjxX3JNrJEcyBujax
X-Gm-Gg: AYBFou0Y+DwCjT1Xc8vYjRlXeTAPyUztXWkMlR2kEoUukW+7R/Glude7bcaqIpG+UQl
	66vSL8qcSt4tYDo9/jnLNCzKTwVKH24r1mWPwOQd7THlQlK4kk9jC96B/TMRvGE10lpULjestBu
	xwGX/uR4FMWPBGp/5ibfDX+3QDHlHnfi49JaLYOmETbWtm3y1PEaTWgzBkxwjKlzN11meGvyScY
	npdTpXPtxYxMKVvJU7LPm12CXqRI1dFGh8BVu8HsbURAe8QQbQby6DD4qkYVptBimNL8kI+v46D
	bWf2X3l8cRgBnR0pUBEY4P/0UCN2vISMGE8XMyoCj2fH1gNeSFuAzjMIXQk4CR4hp4TAlGcteSs
	oKcsvwwBcazsr/SGE2pzmF+8HRuaBjpPaJhg+NACWpEc4xA+aDVMyUO3r94vhBBnAUGrKill+l8
	NqIERkYGncY2kO/bBEaCCFI8qdJ9dkkK5GKB9M+vQk5ZgBm6qmXwlf5+hnpZkoa8dPvIEzoYKFW
	ctrZaem97HRTxvtcdzspO3kzUtCfBDqEFvprK070F4w77UGVyaWZvMWMSxjnzA+DphS8duWX+N9
	X7QrBzLf4LbClX8T5MfmHx+d46hAi5XkBfRQBP/kqGprWrhRLK8rSzmFirCrcR1+zFA=
X-Received: by 2002:a05:6000:616:b0:48e:5c60:6a3b with SMTP id ffacd0b85a97d-48e5d5dfd9emr5759755f8f.46.1793191888219;
        Wed, 28 Oct 2026 05:51:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:27 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:24 +0000
Subject: [PATCH v25 07/11] mmc: renesas_sdhi: Add tuning delay support for
 RZ/G2L
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
Message-Id: <20261028-rzg3l_sdhi-v25-7-57f16691c2ed@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=8285;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=b6eCqPFTWxAak2EX8gMI+dPwy+ZnTC3KAx1E6G2XV+I=;
 b=nxunJ0fy24vAEKPkjbd1uS5m94iyoljlkjVsabPyiSQqu+772FwEns8B8gewyCdziweXG/gpL
 kh/5sdjVX8EBFWOgsnpniGWP5UQKyDU//m52MCLGPJNUfIUtyQkj5e9
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G2L and later SoCs (RZ/V2M and RZ/G3E) need a hardware adjustment
delay written to SCC_TMPPORT2 on signal-voltage switch during
tuning: 0x1 for 1.8V, 0x0 for 3.3V.

Add a TMIO_MMC_TUNING_DELAY flag and
renesas_sdhi_set_hw_adjustment_delay(), called from
renesas_sdhi_start_signal_voltage_switch() after the regulator is
set, and reset SCC_TMPPORT2 to 0 at the start of
renesas_sdhi_execute_tuning() when the flag is set and tap_num == 8.

Add a dedicated of_data_rz_g2l descriptor with this flag and switch
of_rzg2l_compatible to use it instead of the generic R-Car Gen3
descriptor.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * Updated commit description.
 * Updated renesas_sdhi_set_hw_adjustment_delay() with force_clear
   parameter
 * Added a comment in renesas_sdhi_execute_tuning() for tuning delay.
 * In probe, if the SCC registers are not available, it clear the tuning
   delay flag.
 * Dropped default masks from struct of_data_rz_g2l.
v23->v24:
 * Replaced GENMASK(7, 0) with CLK_CTL_DIV_MASK.
v22->v23:
 * No change.
v21->v22:
 * Updated commit description.
 * Added a renesas_sdhi_set_hw_adjustment_delay() call to
   renesas_sdhi_init_tuning().
v20->v21:
 * Added clk_div_mask to RZ/G2L of_data.
v19->v20:
 * No change.
v18->v19:
 * No change.
v18:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi_core.c          | 101 +++++++++++++++++---------
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  19 ++++-
 include/linux/platform_data/tmio.h            |   3 +
 3 files changed, 88 insertions(+), 35 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 86778d83eb7d..5c317ab29d92 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -264,40 +264,6 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 		 TMIO_STAT_DAT0);
 }
 
-static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
-						    struct mmc_ios *ios)
-{
-	struct tmio_mmc_host *host = mmc_priv(mmc);
-	struct renesas_sdhi *priv = host_to_priv(host);
-	struct pinctrl_state *pin_state;
-	int ret;
-
-	switch (ios->signal_voltage) {
-	case MMC_SIGNAL_VOLTAGE_330:
-		pin_state = priv->pins_default;
-		break;
-	case MMC_SIGNAL_VOLTAGE_180:
-		pin_state = priv->pins_uhs;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/*
-	 * If anything is missing, assume signal voltage is fixed at
-	 * 3.3V and succeed/fail accordingly.
-	 */
-	if (IS_ERR(priv->pinctrl) || IS_ERR(pin_state))
-		return ios->signal_voltage ==
-			MMC_SIGNAL_VOLTAGE_330 ? 0 : -EINVAL;
-
-	ret = mmc_regulator_set_vqmmc(host->mmc, ios);
-	if (ret < 0)
-		return ret;
-
-	return pinctrl_select_state(priv->pinctrl, pin_state);
-}
-
 /* SCC registers */
 #define SH_MOBILE_SDHI_SCC_DTCNTL	0x000
 #define SH_MOBILE_SDHI_SCC_TAPSET	0x002
@@ -358,6 +324,56 @@ static inline void sd_scc_write32(struct tmio_mmc_host *host,
 	writel(val, priv->scc_ctl + (addr << host->bus_shift));
 }
 
+static void renesas_sdhi_set_hw_adjustment_delay(struct tmio_mmc_host *host,
+						 bool force_clear)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+
+	if (!(host->pdata->flags & TMIO_MMC_TUNING_DELAY))
+		return;
+
+	if (host->mmc->ios.signal_voltage == MMC_SIGNAL_VOLTAGE_330 || force_clear)
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x0);
+	else
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x1);
+}
+
+static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
+						    struct mmc_ios *ios)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+	struct renesas_sdhi *priv = host_to_priv(host);
+	struct pinctrl_state *pin_state;
+	int ret;
+
+	switch (ios->signal_voltage) {
+	case MMC_SIGNAL_VOLTAGE_330:
+		pin_state = priv->pins_default;
+		break;
+	case MMC_SIGNAL_VOLTAGE_180:
+		pin_state = priv->pins_uhs;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * If anything is missing, assume signal voltage is fixed at
+	 * 3.3V and succeed/fail accordingly.
+	 */
+	if (IS_ERR(priv->pinctrl) || IS_ERR(pin_state))
+		return ios->signal_voltage ==
+			MMC_SIGNAL_VOLTAGE_330 ? 0 : -EINVAL;
+
+	ret = mmc_regulator_set_vqmmc(host->mmc, ios);
+	if (ret < 0)
+		return ret;
+
+	renesas_sdhi_set_hw_adjustment_delay(host, false);
+
+	return pinctrl_select_state(priv->pinctrl, pin_state);
+}
+
 static unsigned int renesas_sdhi_init_tuning(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv;
@@ -385,6 +401,8 @@ static unsigned int renesas_sdhi_init_tuning(struct tmio_mmc_host *host)
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, priv->scc_tappos);
 
+	renesas_sdhi_set_hw_adjustment_delay(host, false);
+
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 
@@ -717,6 +735,14 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	if (!priv->tap_num)
 		return 0; /* Tuning is not supported */
 
+	/*
+	 * As per section 40.7.8 (Hardware adjustment register 2, SCC_TMPPORT)
+	 * of the RZ/G2L hardware manual, if the tap number is 8, the tmpout
+	 * bits must be set to 0.
+	 */
+	if ((host->pdata->flags & TMIO_MMC_TUNING_DELAY) && priv->tap_num == 8)
+		renesas_sdhi_set_hw_adjustment_delay(host, true);
+
 	if (priv->tap_num * 2 >= sizeof(priv->taps) * BITS_PER_BYTE) {
 		dev_err(&host->pdev->dev,
 			"Too many taps, please update 'taps' in tmio_mmc_host!\n");
@@ -1267,6 +1293,13 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (of_data && of_data->scc_offset && ver >= SDHI_VER_GEN2_SDR104)
 		priv->scc_ctl = host->ctl + of_data->scc_offset;
 
+	/*
+	 * The tuning delay is applied through SCC registers, so it must not
+	 * be used when the SCC isn't mapped.
+	 */
+	if (!priv->scc_ctl)
+		mmc_data->flags &= ~TMIO_MMC_TUNING_DELAY;
+
 	/* Enable tuning iff we have an SCC and a supported mode */
 	if (priv->scc_ctl && (host->mmc->caps & MMC_CAP_UHS_SDR104 ||
 	    host->mmc->caps2 & MMC_CAP2_HSX00_1_8V)) {
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 45e0d8f5c64d..e934b35fc205 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -135,6 +135,23 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	.max_segs	= 1,
 };
 
+static const struct renesas_sdhi_of_data of_data_rz_g2l = {
+	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
+			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
+			  TMIO_MMC_64BIT_DATA_PORT | TMIO_MMC_TUNING_DELAY,
+	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
+			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
+	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
+	.bus_shift	= 2,
+	.scc_offset	= 0x1000,
+	.taps		= rcar_gen3_scc_taps,
+	.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
+	/* DMAC can handle 32bit blk count but only 1 segment */
+	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
+	.max_segs	= 1,
+	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
+};
+
 static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
 	{ 3,  3,  3,  3,  3,  3,  3,  4,  4,  5,  6,  7,  8,  9, 10, 15,
 	 16, 16, 16, 16, 16, 16, 17, 18, 18, 19, 20, 21, 22, 23, 24, 25 },
@@ -256,7 +273,7 @@ static const struct renesas_sdhi_of_data_with_quirks of_r8a77990_compatible = {
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_rzg2l_compatible = {
-	.of_data = &of_data_rcar_gen3,
+	.of_data = &of_data_rz_g2l,
 	.quirks = &sdhi_quirks_rzg2l,
 };
 
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index f684f4087a8f..77d3dc91c828 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -50,6 +50,9 @@
 /* Some controllers have a 64-bit wide data port register */
 #define TMIO_MMC_64BIT_DATA_PORT	BIT(12)
 
+/* Some controllers have tuning delay */
+#define TMIO_MMC_TUNING_DELAY		BIT(13)
+
 struct tmio_mmc_data {
 	void				*chan_priv_tx;
 	void				*chan_priv_rx;

-- 
2.43.0

