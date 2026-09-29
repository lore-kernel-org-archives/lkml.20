Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C11514770
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681973; cv=none; b=iuaZx0Hnq+VzUF3qV/r7awCThzGikf2ER/I44rQoCx0DVRVGVdFs+OdN2V7fmog+IfUKc5QzV0veeRVuu5LvBESB2BoDlJsnX9Otr+tW84poktIz4y1XVwZbXbYRpY+OTgq1LmzBzd8ETaFMASNAhebT3YD/nDNQINUZbxU3lVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681973; c=relaxed/simple;
	bh=T6oyyZ1OmUQtcizbJTVYqDItD0M2/u7yxPjl5L0tbRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPhn8B1wiXKwUn+eXE+dWYjcgp1+pkuiFhId5EJxq97jgPWszYK0cGvwcDZYDd7WMAx+GCtYChnkppOalYbLKjiIPz3GxmH54CZahrh7J7jz8W7qzO1KLv5jvPO5CECzb4QPerJFaH46OgVhjbA6vkCrUe7pl48fiwIJNs537f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r3TAsm14; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r3TAsm14"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aef5d66c1so565028f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790681969; x=1791286769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJZnIfcVotnzoqueKnSieoe1NqcfR9JqTQC9ehUZTao=;
        b=r3TAsm14e0I1ZcCBqky843sOUVl8INBsGGipFm8A7nSMOmdqG2F4asH2fhJKiBVj/+
         ALxREQfBrYnEFon0zQLcumZGWB9E2JrhuVWs5eidH66qjER62m1uTONWTglG/v4KCaRK
         Ir+6zsJtAkR4K6fVGHY6kzF6X7PdWVYCKg2JXAD5ij8iU2eJYvQdm2eEs99RqMpvF6Xc
         N6LSShZ8ZQhypJoaUNTj/HpbrsUR7jXPVlJdfzGoMJsQAEmjELX8yefJKik9JsDl0q/U
         NSr7j5UFHrFKnfbDyRRqgeXCYhMiuv6a6nbtFdwDEs2xaM+oQJQE8RIzZ8zlC5lKEbtY
         kX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790681969; x=1791286769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJZnIfcVotnzoqueKnSieoe1NqcfR9JqTQC9ehUZTao=;
        b=qQf9w1Q29gseSGDHa+0ueL6V4fk67CYpQdBqp50I3xSg0oAsv1JaIGAqYnF5ULdw12
         VqrBGJC1Y+5PwmrErduXOkI5iEGA+VGSjgONT5jmj2bu/WQGDEiDzTvKL1toLdjeYOAY
         voLY7sFyuQsjOsf2wyp1aIwmsIVvmR5+3QIWcZC00gBHDNB0cMVdiMhtlvK0Fq4g5tKM
         iad7RWP2jG3ReJYkIXBIUTJPkjbnTNRsFQUzP10qWbVmG32ee42SjloncB+U74YRsyWx
         MiG30hcRk4sCZxM6STaYx7hJwGWf1bu93CBEo73jL0M9/DO+qnwLRKxx+46U1Ef+3nC2
         uAtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoX0AFKWoMROcU98l5oDxTBWzS62oNMO3A9+SGHC8eyMMa+g1IOCAhvV0hTsEv/Nvy0hIwjTlaXUQ9adg=@vger.kernel.org
X-Gm-Message-State: AFuF++lRF2x9p6InKlDw8x1rDypgqSJLg7jR5EdrwkDiH2dPFBAu6G9V
	ii5XIoQajo/9RgezUwB2Fvsw+f/OTESizCOUkg9D2M7llyToRk+PUEaX
X-Gm-Gg: AYBFou33G6ohjN3SEjko0QmAjtobCqR4msZ6LYFQHxCvobgETIalVRLSMVYIBQ5Ut3S
	Gtmu9fWvek453azWWN3VgkgPjIYW6fVpH7HJACbxMxhxthWzTdiBwGdcsuGSJnD+XeqC/qiE1tD
	08gP0FkM2ON0eRGm3pzRwggyHAtSGm75WBVNcF5E9eIHwOBbnusbddTTQ2fxOkEkRiAS8ICnt5W
	3pWHKOKGU51aaalHghsBNfYN75cgzdPlMmwXOpS5p1D6e+wr40bC6+TLDjHFE85GcbklfvaqjJX
	R61SQ8MMA4VF+sRoJHAao9erwg0mFfL9zFMjhMuVPkt8mcxubNnHdRHEI2JyPWb4W3fR5uxf5at
	T8UUfWII+aT767XKxm7WRtjYHtPhNQ3Ao/mYJSmb/twK2unkLej0grWBvMszTwzAjO76cLzC8BV
	TuiBJ+N6kO1JoOhT2aziQvU8qjfZEq04gJr/aTRNlZFdNc8f3jXPQFBpsoE3s+PUCIoiSii94Uo
	eFLoRcLg5WsgxMW+aHPxyWkOvF8RgjIow4O4ILWMvQx4XjGywXM+9LACZPFUcJhfVNPjjGod810
	I6e9h+f4eE3xKMjxvw==
X-Received: by 2002:a05:600c:4ecf:b0:4a0:108:3b54 with SMTP id 5b1f17b1804b1-4a001e8c316mr98667025e9.32.1790681968981;
        Tue, 29 Sep 2026 04:39:28 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm83215565e9.14.2026.09.29.04.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:39:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] clk: renesas: r9a09g057: Add ADC clocks and reset
Date: Tue, 29 Sep 2026 12:39:20 +0100
Message-ID: <20260929113921.119489-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clocks and reset entries for the ADC controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 22 ++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 2fa5a620bbd9..b62bb9a87989 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -35,11 +35,15 @@ enum clk_ids {
 	CLK_PLLGPU,
 
 	/* Internal Core Clocks */
+	CLK_PLLCM33_DIV2,
 	CLK_PLLCM33_DIV3,
 	CLK_PLLCM33_DIV4,
 	CLK_PLLCM33_DIV5,
 	CLK_PLLCM33_DIV16,
 	CLK_PLLCM33_GEAR,
+	CLK_PLLCM33_ADC_PCLK_GEAR,
+	CLK_PLLCM33_ADC_PCLK_DIV2,
+	CLK_PLLCM33_ADC_ADCLK_GEAR,
 	CLK_SMUX2_XSPI_CLK0,
 	CLK_SMUX2_XSPI_CLK1,
 	CLK_PLLCM33_XSPI,
@@ -137,6 +141,12 @@ static const struct clk_div_table dtable_2_100[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_8_10[] = {
+	{0, 8},
+	{1, 10},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_16_128[] = {
 	{0, 16},
 	{1, 32},
@@ -173,11 +183,18 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
 
 	/* Internal Core Clocks */
+	DEF_FIXED(".pllcm33_div2", CLK_PLLCM33_DIV2, CLK_PLLCM33, 1, 2),
 	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
 	DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
 	DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
 	DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
+	DEF_CSDIV(".adc_pclk_gear", CLK_PLLCM33_ADC_PCLK_GEAR, CLK_PLLCM33_DIV2,
+		  CSDIV1_DIVCTL0, dtable_8_10),
+	DEF_FIXED(".adc_pclk_gear_div2", CLK_PLLCM33_ADC_PCLK_DIV2,
+		  CLK_PLLCM33_ADC_PCLK_GEAR, 1, 2),
+	DEF_CSDIV(".adc_adclk_gear", CLK_PLLCM33_ADC_ADCLK_GEAR, CLK_PLLCM33_ADC_PCLK_GEAR,
+		  CSDIV1_DIVCTL1, dtable_2_16),
 	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
 	DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
 	DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
@@ -566,6 +583,10 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("gpu_0_ace_clk",		CLK_PLLDTY_ACPU_DIV2, 15, 2, 7, 18,
 						BUS_MSTOP(3, BIT(4))),
+	DEF_MOD("adc_0_pclk",			CLK_PLLCM33_ADC_PCLK_DIV2, 16, 7, 8, 7,
+						BUS_MSTOP(3, BIT(9))),
+	DEF_MOD("adc_0_adclk",			CLK_PLLCM33_ADC_ADCLK_GEAR, 16, 8, 8, 8,
+						BUS_MSTOP(3, BIT(9))),
 	DEF_MOD("tsu_0_pclk",			CLK_QEXTAL, 16, 9, 8, 9,
 						BUS_MSTOP(5, BIT(2))),
 	DEF_MOD("tsu_1_pclk",			CLK_QEXTAL, 16, 10, 8, 10,
@@ -669,6 +690,7 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(13, 13, 6, 14),		/* GPU_0_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GPU_0_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GPU_0_ACE_RESETN */
+	DEF_RST(15, 6, 7, 7),		/* ADC_ADRST_N */
 	DEF_RST(15, 7, 7, 8),		/* TSU_0_PRESETN */
 	DEF_RST(15, 8, 7, 9),		/* TSU_1_PRESETN */
 };
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index dec0f7b621d6..759983e8b244 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -148,6 +148,8 @@ struct fixed_mod_conf {
 #define CSDIV0_DIVCTL1	DDIV_PACK(CPG_CSDIV0, 4, 2, CSDIV_NO_MON)
 #define CSDIV0_DIVCTL2	DDIV_PACK(CPG_CSDIV0, 8, 2, CSDIV_NO_MON)
 #define CSDIV0_DIVCTL3	DDIV_PACK_NO_RMW(CPG_CSDIV0, 12, 2, CSDIV_NO_MON)
+#define CSDIV1_DIVCTL0	DDIV_PACK(CPG_CSDIV1, 0, 2, CSDIV_NO_MON)
+#define CSDIV1_DIVCTL1	DDIV_PACK(CPG_CSDIV1, 4, 2, CSDIV_NO_MON)
 #define CSDIV1_DIVCTL2	DDIV_PACK(CPG_CSDIV1, 8, 4, CSDIV_NO_MON)
 #define CSDIV1_DIVCTL3	DDIV_PACK(CPG_CSDIV1, 12, 4, CSDIV_NO_MON)
 
-- 
2.55.0

