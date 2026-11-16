Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830542;
	b=YtuadCYXm9ZuIImx6mexTFLxkD2vfnw3uyx4mA6z+gUnm1x8Nwkfr/JZYWKZifDaVN89
	 H4k84u3/3hsVe6s0ykFez1tqpfa1gqWC9gvewfsYo8NjboYzVxHeWVGDqO5qeQmj311Fw
	 pZPed74SDdwKNqhVTrvwHLdgBA0kVa7+3D8J8Lnck6nU9OokKt5XC5iYVzNn4gz0pKDp8
	 IpUrM4cXZnPWay595jRXE7VXmTITHE7jn/Y+ZDtsODoN7ignBL3L2hKRfcqamzWJdO5x3
	 zzOBiRlCrCYMJrGeWzYsIAQHxWCDQZcoypNej02PleW/allUdw5cadsO6a+oV96jtWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0LcVzoQKL0bsokOHWsWsVAJ1s1LCZ3P+TDaOc2v7pus=;
	b=xiyE/8ugN5PjPR+eDH+sD/3eZ27BYzmv+6dFssDLww2WTaFJcKJIda4XtD0Ko46Jyzhv
	 5V23kyCJYZd9iftQHO0fOX8kgN3pBvLuChC84SHSAtmFuTPLGYFP4RjUEsXRyT3mSRSrM
	 mQRx3Esl4GRo44dRRsF6WA/CainwF18+ua2xn8pBDViAAWlTTHSDI2O3smnSEoU0qssJ5
	 oZ1gczs4FuGyFiGvSQrAPdjPrxZPRNKQ9VVD/V7cQXLgRA0U6mVslj/MoxQsM0FR2l1R6
	 Nt1HeQL130N1b8ScZS9tJRge0V1Ty8KLWEgt9rswfyYUbJ9qHeiqOFuP/CdSoa77Ucw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nsYTPBFn;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9972B606A88A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9972B606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nsYTPBFn
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso18757445e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830540; x=1795435340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LcVzoQKL0bsokOHWsWsVAJ1s1LCZ3P+TDaOc2v7pus=;
        b=nsYTPBFnByBvont31Bz/qtogyCLMB4xedKGIjxFDZj62qtJqvpqgL6Zx1PKwfIa5q7
         h5Y/O8duQjNutXxjb1+pyJPwpUDpy+pHcG681AQN9IpAFg4F7j0lH1fFpf0MX9mbsj06
         08T8t8weOGxNUjAvZfU+E5hBqxU28SHocKUr/hAP2U8e2afOh4qHpwqnYf4v5LdtFZaY
         99LURbf+nmkrJhTlNwT/QPiLywJ/y6/yHakTEPyEzyHNhp9ByCDDhvAFF5DX/G0kmDRl
         fBdIrw8bcXpcUpvSUctc8AU+6i+bMqe/fX8tf854Srk0rv90wv1gUg0wARmV7sgk6zF2
         gE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830540; x=1795435340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LcVzoQKL0bsokOHWsWsVAJ1s1LCZ3P+TDaOc2v7pus=;
        b=q9+Wjnxrla5NeQBS9ktYpafFk5M7DocbaT6WHbgfEho8YE1N+sNTX5TzroIeNsa3cu
         RDBsjQ+bUThuYxKfBi62mGh7OpxmhYlryf1a7bFtOqEmOkYWzTf7zFSS8QZSNhbNAus4
         nzl+XQTTZBwRSgyh/hTblsM+Ixqm2+jrVFL/JlRyUd5JF0k/vzFvVx1VkUQlu/n+uUfh
         FsQM5L5WscQK0PV8Gus/y6n/xlw8pn+aDutzw8fS88uwSNPatthWhaH66Inv4TqtOyyN
         aHpyRMqwZ0U438rHYleW04QcQUahUi4gYg3bZt/2TxwN8tJxG96LQi2FGBon3UmeXBNp
         qXyw==
X-Forwarded-Encrypted: i=1; AL+hErFu6hjRrHgxDhF/i1jrvpAAwtpY+V0P1yKa7jU1FUbmbg3juraWfgX/cs/ZHAlxYkkDFjWT8cXqXlzw1GU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QDbBWfGqkSNbYqEoOGtvNQ4LTGsPg44Jadd4SXo/hNXmpSW2T
	iuFru4CX/WpH2N9Q4+Wx3QZlqs+kIB0QjqhKaZ9baj/NfPEU8/SixChom8Cytw==
X-Gm-Gg: AYBFou3ceh11ZFZ4eiK2uP3nHCF9En6WWTOcnaEIajNoprCXQ5iMXM8A+FvCh8Y1YhR
	JEwgQdhhaBBGGDxykjiEMpAyc7kVpVGqzY6EWbNsJdeNo5u9MEMmEter6jueCV5zr7ifMcXpZdM
	gzZTQxMRwIRYDgjYYojl0aB4mhbKg2i6tPkH9xJvT+chcF+6iIKD7ny5wFT0Py2NY93JaAmrO6x
	V0EFyNyq1Mr2UzIclXPJTQfQnLoOp6e7MSoJplODiW0HYlMYpZ/YoQLPdWF+Lt9gAAW00VNCK07
	FzlDNHKu0O5YjBhMHSLevIYRUJmKxw37WbH8LNZiyJZxMsXBOthxFrO36Z11wmaP+ZQAOYKFo1c
	PyfUaawQKGICk29IXwMXkBmH7eKsfo4/NB6X2QiL6cjYwxlJprbk6X3eBzZ68/XeW6RSb40rxfR
	JgpNRlaUT66z6vJ7PY7uLcGCRPmOhPp6aFwkeNUeq67EvwZedhYCE0LPHEu+pIy7B+NKd6GR8/r
	HFbL8V6Nwg5dBp4P6KRYeAo0EcEplaWcKqOcE543rb6s251te5BywwHMMEEV8CFeqIKKlnCMkjZ
	PuWZIdO0rplXsTUBHnc4/mkvcgSh3gBbUxXHG6olxSagHBZQ/2rEdTkGStojcEaNVQ==
X-Received: by 2002:a05:600c:524d:b0:4bb:68b9:f615 with SMTP id 5b1f17b1804b1-4bb68b9f88bmr120047345e9.17.1794830540041;
        Mon, 16 Nov 2026 04:02:20 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm395562805e9.15.2026.11.16.04.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:02:19 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 12:02:17 +0000
Subject: [PATCH 3/3] mmc: renesas_sdhi: Add RZ/G3L HS400 support
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
Message-Id: <20261116-sdhi_hs400-v1-3-c5bedd312408@bp.renesas.com>
References: <20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com>
In-Reply-To: <20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830537; l=6088;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=oC8XI52dgMrks2U7cRSaACFaiml902PICrgQDRba1+M=;
 b=GK+gmQd3LyUWIDHhs3v3iW73j6qFhTUXBLJUZm5L2mmn2c79h0cFompgotfMRnTN0v5M8BwPE
 SwczoxErMSCC6cDGd2WDXbv+rIfvMNJFnvYy+hYI5krGOlFT9TFIf8j
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add HS400 support for the RZ/G3L SoC.

RZ/G3L needs a second HS400 enable register, SDm_SCC_HS400MODE2
(offset 0x020), alongside the existing TMPPORT2 path. Add a
TMIO_MMC_HS400MODE2 flag (bit 16) for controllers that need it.

RZ/G3L HS400 mode does not use internal divider and supports
only one divider value "0" in the SD_CLK_CTRL register.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi_core.c          | 38 ++++++++++++++++++++++++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  3 ++-
 include/linux/platform_data/tmio.h            |  3 +++
 3 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 7dfcf7f970aa..f15f766b7666 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -135,7 +135,8 @@ static unsigned int renesas_sdhi_clk_get_rate(struct tmio_mmc_host *host,
 {
 	unsigned int freq = clk_get_rate(clk);
 
-	if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
+	if ((host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER) &&
+	    host->mmc->ios.timing != MMC_TIMING_MMC_HS400)
 		freq /= 2;
 
 	return freq;
@@ -259,6 +260,14 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 			clk &= ~SDHI_SD_CLK_CTL_DIV1;
 	}
 
+	/*
+	 * RZ/G3L SoC HS400 mode has only 1 divider value.
+	 * Other divider values are prohibited
+	 */
+	if ((host->pdata->flags & TMIO_MMC_HS400MODE2) &&
+	    host->mmc->ios.timing == MMC_TIMING_MMC_HS400)
+		clk = 0;
+
 	clock = clk & host->pdata->clk_div_mask;
 	if (clock != SDHI_SD_CLK_CTL_DIV1)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
@@ -315,6 +324,7 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018
 #define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A
 #define SH_MOBILE_SDHI_SCC_TMPPORT7	0x01C
+#define RZG3L_SDHI_SCC_HS400MODE2	0x020
 #define RZG3L_SDHI_SCC_HWADJ4		0x022
 
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN		BIT(0)
@@ -350,6 +360,9 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_TMPPORT_DISABLE_WP_CODE	0xa5000000
 #define SH_MOBILE_SDHI_SCC_TMPPORT_CALIB_CODE_MASK	0x1f
 #define SH_MOBILE_SDHI_SCC_TMPPORT_MANUAL_MODE		BIT(7)
+#define RZG3L_SDHI_SCC_HS400MODE2_HS400EN2		BIT(0)
+
+#define RZG2L_SDHI_SCC_TMPPORT2_TMPOUT		GENMASK(15, 0)
 
 static inline u32 sd_scc_read32(struct tmio_mmc_host *host,
 				struct renesas_sdhi *priv, int addr)
@@ -364,6 +377,18 @@ static inline void sd_scc_write32(struct tmio_mmc_host *host,
 	writel(val, priv->scc_ctl + (addr << host->bus_shift));
 }
 
+static void renesas_sdhi_set_tmpport(struct tmio_mmc_host *host, u32 tmpport)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+	u32 val = tmpport;
+
+	if (host->pdata->flags & TMIO_MMC_HS400MODE2)
+		val |= sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2) &
+		       ~RZG2L_SDHI_SCC_TMPPORT2_TMPOUT;
+
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, val);
+}
+
 static void renesas_sdhi_set_hw_adjustment_delay(struct tmio_mmc_host *host,
 						 bool force_clear)
 {
@@ -374,12 +399,12 @@ static void renesas_sdhi_set_hw_adjustment_delay(struct tmio_mmc_host *host,
 		return;
 
 	if (host->mmc->ios.signal_voltage == MMC_SIGNAL_VOLTAGE_330 || force_clear) {
-		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x0);
+		renesas_sdhi_set_tmpport(host, 0x0);
 		if (hwadj2)
 			sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ2,
 				       RZG3L_SDHI_SCC_HWADJ2_3_3V);
 	} else {
-		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x1);
+		renesas_sdhi_set_tmpport(host, 0x1);
 		if (hwadj2)
 			sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ2,
 				       RZG3L_SDHI_SCC_HWADJ2_1_8V);
@@ -486,6 +511,10 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 			host->pdata->osel_tmpout) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (host->pdata->flags & TMIO_MMC_HS400MODE2)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2,
+			       RZG3L_SDHI_SCC_HS400MODE2_HS400EN2);
+
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
 		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
 		       sd_scc_read32(host, priv,
@@ -623,6 +652,9 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 			 host->pdata->osel_tmpout) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (host->pdata->flags & TMIO_MMC_HS400MODE2)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0);
+
 	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs400_bad_taps))
 		renesas_sdhi_adjust_hs400_mode_disable(host);
 
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 37eeaa52f011..d9b9f9663386 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -165,7 +165,8 @@ static const struct renesas_sdhi_of_data of_data_rzg3l = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
 			  TMIO_MMC_64BIT_DATA_PORT | TMIO_MMC_TUNING_DELAY |
-			  TMIO_MMC_INTERNAL_DIVIDER | TMIO_MMC_HWADJ,
+			  TMIO_MMC_INTERNAL_DIVIDER | TMIO_MMC_HWADJ |
+			  TMIO_MMC_HS400MODE2,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 501ca4355c34..81a37d6baefc 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -59,6 +59,9 @@
 /* Some controllers have hw adjustment delay */
 #define TMIO_MMC_HWADJ			BIT(15)
 
+/* Some controllers have HS400MODE2 */
+#define TMIO_MMC_HS400MODE2		BIT(16)
+
 struct tmio_mmc_data {
 	void				*chan_priv_tx;
 	void				*chan_priv_rx;

-- 
2.43.0

