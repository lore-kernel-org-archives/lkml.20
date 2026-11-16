Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855165;
	b=gz3dz5773lxYtLbBcOd/idsAdUTh9Y/UnZgqpeHH5WAb1xZo4GAp9k4bZVgEOe6pdTSL
	 bxCojBEWBe89taqV60Mj/v2FEWSDZfTlZxsVrJwYz4WIZOcrNC8mWUq16Zkt95NRusk3y
	 CpKCEJg/wsnypviD4/eLUpopTwxakYBSz7domTZ4WMmyeKw98xMeciqYUl6dJg5zBpwwN
	 S5Q2yfrANkHwKQESFtHTX72pE9IJKlZlpvi+3qs6fiQBDBj8cp6LADPwO887iUZbkiS3A
	 R3xa8aUgDplqPU0JTPnLECHXIVxc8C4vSVOmX5/cMDP/W0tj494gXQUPoZ0D8BPGS6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dnESQZB66ZqtLu8qDe7KJpPX20rrkH6E5cL34m1eAjk=;
	b=GE0FHn9Hx7U1YKt4YU7AYvsrjeJBr5Luj2WlCeUki9fBC4mHHo/VFiKzBCH8n3/ZdAhQ
	 oRDqgFGogkPAPxl16mEh++6PbS6LhPlnCbnSOhYtr1rvlRie2JjtVI3c6+B1VMbJVOrGw
	 s1HSERxnzJbI1F2St4kVH9hN/HPPpm1hEgGQXO1mdWYxjh8ZMPtXnbrA+QfV7esPtjM8M
	 PcGj9VOWQZE2J7/Ii2XcIODXG0UtzF6Ry2TXqThkl+XJQEzfBqgwqp1c0T3/pwylQgMqm
	 Gl/d3KXN8DP83zsdr/DpUQCVFlwoIGLecmAgHA+7CiMznS8uN8G2sRPuPgcI/ekRsJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MeEs0rAb;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FA3606A8A3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92FA3606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MeEs0rAb
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so19746965e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794855163; x=1795459963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dnESQZB66ZqtLu8qDe7KJpPX20rrkH6E5cL34m1eAjk=;
        b=MeEs0rAbBqdpQTtPaZAUaHzwQuaajnsJkfMmed7vGCCuK/Np4aDjJYaG19/5LCBnHO
         3iwFlZ5Tk8R9RG2XTkmUHFzyqlee5C4ica3JcNBjOsnd6SKxbz9Cd4cyJoHYmnQ2xQ1A
         P1UD/nhaUOpm8/zaMPqO0cqwsHOdNHCUP/uH+eJZ9xsiXIYBvccN3NdbPBH1j9Ouz7Yl
         A1USMd0RjstTye73wY2QuCR2DQSlPE4z254LM0rZzvOFauoMCkKXqzOMpO4RU146lkWw
         HReMe3YhBPi2bYDa3g5w0WpfDBeff3QBgJvXkFzbzJhK3oAksaFpVx7EGMWZyldpOlgM
         TLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855163; x=1795459963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dnESQZB66ZqtLu8qDe7KJpPX20rrkH6E5cL34m1eAjk=;
        b=Zk6voe12QxCib85HHuQ4i4KIVAl3fDaBunNFabQ9CyGJJXju7WpTwe1jK33WALapGo
         o9YuNIkiYEEc/U05E1Wwdp7e3j/xexgn+GxVF+tQq+LXNQ7WWXMEjTjPWHhGZjagmqWp
         izo9WkxH9QGeAljcIPl1y0KS9bufcdqedXe4oWAdlbQiV26cQG8/27bV73BwUaTpQdQX
         Eitegoz0Z22/UVwEdKAqeGNygJ1tWVJPRG6uMHmAF/ijaiNFZ/d1nK2sFfYpLWbpCI9V
         FO/9U+VeSwYdWUNGQRP4vBfaFCnBtpnXiGlx7elEK70ae9Ejv+066JTa5+wq0wCg5bzl
         JzLQ==
X-Forwarded-Encrypted: i=1; AL+hErEf6G3WiPkaMAZVn+bXROfnKxxuHX6WdDaQ4xmMjc0/IiXq4w5ZlDalh2sDB8/Y2JegXcrXvsq6uHKWniU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vw6IIq/oItntkHDusQvFI8NIklM9o7nZ8Jl6qMAwe1vnfleCG
	04IJCFjHjL22Zi4R8xvhnZy9PZejtIo4EFCquAJZllVyjqDv+ONKFhXM3TW60A==
X-Gm-Gg: AYBFou2TmWXJP4plRax7ZyaznrBD4q0RHytyEtAxM1u0PfujT/4p7mra0ySd1xQHfHA
	v2Cu8VxopHT884afT4NLqOfmRsvsLx3DkqEOPB1rBbc7lWlfZQb4kT0MPOJK99s4uHqd2iZ9G0s
	uk89ms2RPAC83YkDQd+ez/3Y3mFMnfKye5V8J8l2mFGnYCEeLR+DrNLRkMi1Yjlqw2zWKhW7nsm
	S5s4EPBIGyfqPu/AaksUMZJocK4o5MHWT7r43XwrMDaqJgHBJwjinUAGBTsvt6NWW3gFYTiGnZr
	t2iiq0lXJUuR4Uz1dUzz9EhQIAEtl5T58sxpB2Hbqzs8Bw+VkfRlLRN3dl+LMnEx1TRUaVqzs13
	jmI5YQc9x8gfaCX6b1eRe+jmDZkRRFWkjP1UcjdYE3Yaw3weP9hNIy1o8UserZU/69Yn5KuYgHn
	ffFTlc9nFLUi92bQDAO+RGcxNpNn7bZpGlFn5HTNRikdtWE9+bdXhx660hJ6Bq7/pxGf+Gp1v7M
	tw0ySl896ggcDPsI3EmJaCo6e6Jj6bnsQS20FtKzExR69x7ukPeJCMYwknjTkBKYXg8yRF7Asii
	wFRQkXBeQ1T0mF7p5IbfsyT1KoN8TWXZabGcrkSpcYTHdpKtfI3drM1yyZXxnHk4kDIx0LGSdbU
	o3zRou1YNXjo=
X-Received: by 2002:a05:600c:81c9:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb55a65b31mr234258215e9.18.1794855162899;
        Mon, 16 Nov 2026 10:52:42 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm157961345e9.4.2026.11.16.10.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:52:42 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 18:52:41 +0000
Subject: [PATCH v2 3/3] mmc: renesas_sdhi: Add RZ/G3L HS400 support
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
Message-Id: <20261116-sdhi_hs400-v2-3-de41f7a7f330@bp.renesas.com>
References: <20261116-sdhi_hs400-v2-0-de41f7a7f330@bp.renesas.com>
In-Reply-To: <20261116-sdhi_hs400-v2-0-de41f7a7f330@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794855160; l=8502;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=zSh1witOWgk70aQXdLbB1vUXnJMNBizQ3rQrfFp6sRo=;
 b=zU21SwipWnY3BNuItVFANLBfF6cJhVhygSBvpXQMHKuOYeWD9fL0yDFg8sNF+WCaIZaXLR981
 cMOQT618E9+ApeBBeXIb7ggAFzPgi5OSIBNcXuqH1CM3wUeGAUpiCXT
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
v1->v2:
 * Using ios.timing to decide whether the HS400 divider restriction applies
   is wrong: mmc_hs400_to_hs200() lowers the clock while ios.timing is still
   HS400 and then walks through DDR52/HS/HS200 before prepare_hs400_tuning()
   clears the HS400 bits, so the divider could stay at 200 MHz or prohibited
   non-zero dividers could be programmed while HS400 is still enabled. So
   tracking HS400 hardware state for RZ/G3L clock programming using 2
   variables hs400_active and hs400_clk in struct renesas_sdhi.
---
 drivers/mmc/host/renesas_sdhi.h               |  2 +
 drivers/mmc/host/renesas_sdhi_core.c          | 63 +++++++++++++++++++++++++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  3 +-
 include/linux/platform_data/tmio.h            |  3 ++
 4 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 8ae2ec04bd1f..d14cfd873bb9 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -94,6 +94,8 @@ struct renesas_sdhi {
 	const u8 *adjust_hs400_calib_table;
 	bool needs_adjust_hs400;
 	bool card_is_sdio;
+	bool hs400_active;	/* HS400 enabled in hardware */
+	bool hs400_clk;		/* divider bypassed for HS400 clock */
 
 	/* Tuning values: 1 for success, 0 for failure */
 	DECLARE_BITMAP(taps, BITS_PER_LONG);
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 7dfcf7f970aa..66da2d1e9370 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -133,9 +133,10 @@ static int renesas_sdhi_clk_enable(struct tmio_mmc_host *host)
 static unsigned int renesas_sdhi_clk_get_rate(struct tmio_mmc_host *host,
 					      struct clk *clk)
 {
+	struct renesas_sdhi *priv = host_to_priv(host);
 	unsigned int freq = clk_get_rate(clk);
 
-	if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
+	if ((host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER) && !priv->hs400_clk)
 		freq /= 2;
 
 	return freq;
@@ -226,12 +227,33 @@ static void renesas_sdhi_sclken(struct tmio_mmc_host *host, bool enable)
 	}
 }
 
+static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
+					  struct renesas_sdhi *priv);
+
 static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 				   unsigned int new_clock)
 {
+	struct renesas_sdhi *priv = host_to_priv(host);
 	unsigned int clk_margin;
 	u64 clk = 0, clock;
 
+	if (host->pdata->flags & TMIO_MMC_HS400MODE2) {
+		/*
+		 * While HS400 is enabled in hardware only divider 0 is allowed.
+		 * Leaving HS400 (e.g. mmc_hs400_to_hs200()) lowers the clock
+		 * before the core calls prepare_hs400_tuning(), so disable
+		 * HS400 here once a non-HS400 clock is requested.
+		 */
+		if (priv->hs400_active && new_clock &&
+		    new_clock <= MMC_HIGH_52_MAX_DTR)
+			renesas_sdhi_reset_hs400_mode(host, priv);
+
+		if (new_clock)
+			priv->hs400_clk = priv->hs400_active ||
+				(host->mmc->ios.timing == MMC_TIMING_MMC_HS400 &&
+				 new_clock > MMC_HIGH_52_MAX_DTR);
+	}
+
 	renesas_sdhi_sclken(host, false);
 
 	if (new_clock == 0) {
@@ -259,6 +281,13 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 			clk &= ~SDHI_SD_CLK_CTL_DIV1;
 	}
 
+	/*
+	 * RZ/G3L SoC HS400 mode has only 1 divider value.
+	 * Other divider values are prohibited
+	 */
+	if ((host->pdata->flags & TMIO_MMC_HS400MODE2) && priv->hs400_clk)
+		clk = 0;
+
 	clock = clk & host->pdata->clk_div_mask;
 	if (clock != SDHI_SD_CLK_CTL_DIV1)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
@@ -315,6 +344,7 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018
 #define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A
 #define SH_MOBILE_SDHI_SCC_TMPPORT7	0x01C
+#define RZG3L_SDHI_SCC_HS400MODE2	0x020
 #define RZG3L_SDHI_SCC_HWADJ4		0x022
 
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN		BIT(0)
@@ -350,6 +380,9 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_TMPPORT_DISABLE_WP_CODE	0xa5000000
 #define SH_MOBILE_SDHI_SCC_TMPPORT_CALIB_CODE_MASK	0x1f
 #define SH_MOBILE_SDHI_SCC_TMPPORT_MANUAL_MODE		BIT(7)
+#define RZG3L_SDHI_SCC_HS400MODE2_HS400EN2		BIT(0)
+
+#define RZG2L_SDHI_SCC_TMPPORT2_TMPOUT		GENMASK(15, 0)
 
 static inline u32 sd_scc_read32(struct tmio_mmc_host *host,
 				struct renesas_sdhi *priv, int addr)
@@ -364,6 +397,18 @@ static inline void sd_scc_write32(struct tmio_mmc_host *host,
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
@@ -374,12 +419,12 @@ static void renesas_sdhi_set_hw_adjustment_delay(struct tmio_mmc_host *host,
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
@@ -486,6 +531,12 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 			host->pdata->osel_tmpout) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (host->pdata->flags & TMIO_MMC_HS400MODE2)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2,
+			       RZG3L_SDHI_SCC_HS400MODE2_HS400EN2);
+
+	priv->hs400_active = true;
+
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
 		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
 		       sd_scc_read32(host, priv,
@@ -623,6 +674,12 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 			 host->pdata->osel_tmpout) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (host->pdata->flags & TMIO_MMC_HS400MODE2)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0);
+
+	priv->hs400_active = false;
+	priv->hs400_clk = false;
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

