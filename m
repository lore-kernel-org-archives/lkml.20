Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963382;
	b=Co80byWVIEN70lXlE6H1p5n/RxCriiI/zm/WYImaLuO3yo2P2Rz8zDdDSkV4RuoAVShY
	 rsM7zABBUs7mVd1AE6lisqhnFXrUC+rP221Fd8eYWkjWXTOTY2s4y9aBik++a988c4NtH
	 y4cFT0Mt08dO/bVZyp6/VX4oXdXB/9cs5KBmLKIi2VkVl68b6lCkA4hKx4oH4wumb3SBk
	 /HmEnDnO0xD0SUeV/CQO6JTRLo/QZkVSTPvmkBDne1hXftUSWhufBuOzbkacSP0Px6fhF
	 1eYsz/TAFO7XqFf4Ih28cAVrrB+BfONyb9ZNPm2vXF/gvTxgHcgs0EOsMeCRWhxeuzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=BWcDzxQK0pTA9biKkdBzLn0pBzrznEMEU1JG6hko4Ko=;
	b=fQAts1Eck6aW+oInX5ra87EpcVwS35aLqY+I8jMZV/00GzfHRZkJyiE4YenXBjk/DK8C
	 rmpes/Ts+jJxu4g5+cDSwXyFofLHLv2Cr1syq1QYYL0C2b+MWj2YjE0a0TBTaXrrAhpj4
	 HmLcXhQAca6cRdqYi60kNG/kVkh4WHjP8qAQH7tw1eqFxQxpAkQFu6AN1ZUmXVPwqEcbK
	 PlSfhL4feBTHmF9Hi3XRZ7SuPomDAE2toWa4pOO/LsRmalT8bJSb5/I819vr9+0czFysR
	 sWWtYO+WGA9zSSFFbhRTZq5R87xNJETg9Qj29ryF1BkNcRTYQuyzBXZ9uJPkdbN7IAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d0G9wFIn;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C1D606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3C1D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d0G9wFIn
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48fd2e38825so340214f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793963380; x=1794568180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWcDzxQK0pTA9biKkdBzLn0pBzrznEMEU1JG6hko4Ko=;
        b=d0G9wFInjcwuTfC1hrbp0Hw8NHdvSLr8a0dWQD4ilmF3sNgXqfXAE/kyxgV/JEhQ1B
         lp5Xa4NY0jfIFzbUdk39RJSArZBnlaB+IBXGor4CKlLhQzZhYvSCq1Ysei2fmMBbFvlg
         vNTkAZcSNRJJI51hh7RjMP6XNVO4UL0Smhi8seDwL2NntpLc9FvNkWBDVmsMjJ9quzjz
         mN9nZFhtn0y92gX6BtwD+74yiN0SPHPe5gHCj7KRBsroGw7rct/AfwtAOfn1BvMq/hhk
         HpQLBkgZEgFnFAr4eMUBdEvYAZ/bzmOZOS3ULKrybM620aksNvtKT9/NTUuxQQiGPzSt
         VuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963380; x=1794568180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWcDzxQK0pTA9biKkdBzLn0pBzrznEMEU1JG6hko4Ko=;
        b=tsZWg5z6P9DHtKgqORoN13TFiJW172aVoaEruPEy4PYlDfrJYskKDfIdlwSIHS03lm
         T0AA3NkyLqCZCN2HpvjWsmGLtb7xITU768+/b/cjdK51xXnUM0+yMTUMoxTmGaPdezM9
         Tun4VjM2iTGQXPfmiNhP14Jtyaf2df0vTcqQMH+JkvtZNtYbxIPYQYmnkzJ9MJXVlJyA
         3xhYoX7uQcg3ugF7H+5N4aUl8NaR9EG2W74qum1CEe/N4Wn8jzfxRB95d5z48Wh9oaeT
         n528+6jcS5QEV42Jqov92aZw7vJIKLCOPNs4TbU0FoVeNT6RDUGQHxCX9qBbDjc4g1p1
         4aig==
X-Forwarded-Encrypted: i=1; AL+hErE4RqJKVlFLQTdPGz5LYmWD3sl7rFi5cCNuh+TSTeNbRTObnXoD0VUWsU5ZdfO4rXrqfts/tJqQobDKvZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vjZkInHJl3yJCLfX/fqJsKIGim6blQgn0xMPtpvNMDqyjfGO5
	U53ZKoohPVl1d061BOiC1SxwmbIxz7kg+SF5YnUqBSMzpX3SGwqQ0PCG
X-Gm-Gg: AYBFou06znbVsgkAPx3ww/2+XSUk51kaXilZMZuZ3ujqgi3fG6wtWNd9QCXJcnC7OqG
	GwgyMOnqmi8mqP4gsX2lQDSgq6nC+GBlo/atP2oo+faFnW7wQKVS0k1SpTwenDMTHtkvF9t5++p
	g2quPW+7R3ZPqE5Lms4OxG/Bi0hGaSMnZQSwkmIDHUrhM+r8FgCO/UK9xhZuRShgODlxtpNDQmV
	jmpK8lDtNMc8OTvySI7ah1fHTPcpx5JCwv6lOCwBG9R0UQuOZmIdrxqm+syuckEeOlGG5e2/4pL
	UwvOaeXiPKV6748dNd80AV2OTq/jXToTwZ68Mbxok5JP6wwpbhyFyIG9ndOEkEKSiIOqGv/Mtve
	ooFF89E50urLdu8ulA7AMW6CYVLKyEh94VUI29mAeNFhQtPUOdDoums4ZI4+g1Tdev2BBlnLHh6
	e5n2B3gxXA+Bz17aghuBHxF9cjOZJVu0dXoT5KyzjxDScdB1OdClPP3gZTTccW+2EEBztqE5s2V
	kdSLCdnkT2xhhcSCqW1mV1+23ufgtY8hkZEIgnEiguqU4t9mTIsNuSHvpZTzD/xBDu9d2OkBHjD
	bbhzq4TYobxJL7qAXOg0pxBeKw7KhK8yusrWtdR/Dvzi0JQzVlYI3YWc9kjZv8yCqtYYoJZgdXh
	0Ay8xfSCakRkBXDOEV1c0IMHbK8TJE1LLDY1RdFVQiG/PmuRg2GBiT3N46jksg0OU8VEGMmCeQg
	==
X-Received: by 2002:a05:6000:2c04:b0:48d:faa4:5b66 with SMTP id ffacd0b85a97d-4927702ecc4mr4354863f8f.36.1793963379926;
        Fri, 06 Nov 2026 03:09:39 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:1de5:ca41:50c1:3f2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d087a3c5sm2768243f8f.0.2026.11.06.03.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:09:39 -0800 (PST)
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
Subject: [PATCH v2 1/2] clk: renesas: r9a09g057: Add ADC clocks and reset
Date: Fri,  6 Nov 2026 11:09:22 +0000
Message-ID: <20261106110923.164090-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106110923.164090-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261106110923.164090-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clocks and reset entries for the ADC controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Renamed adc_pclk_gear to pllcm33_adc_pclk_gear
- Renamed adc_pclk_gear_div2 to pllcm33_adc_pclk_gear_div2
- Renamed adc_adclk_gear to pllcm33_adc_adclk_gear
- Renamed ADC_ADRST_N to ADC_0_ADRST_N
---
 drivers/clk/renesas/r9a09g057-cpg.c | 22 ++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 2fa5a620bbd9..5a98b797ca3e 100644
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
+	DEF_CSDIV(".pllcm33_adc_pclk_gear", CLK_PLLCM33_ADC_PCLK_GEAR, CLK_PLLCM33_DIV2,
+		  CSDIV1_DIVCTL0, dtable_8_10),
+	DEF_FIXED(".pllcm33_adc_pclk_gear_div2", CLK_PLLCM33_ADC_PCLK_DIV2,
+		  CLK_PLLCM33_ADC_PCLK_GEAR, 1, 2),
+	DEF_CSDIV(".pllcm33_adc_adclk_gear", CLK_PLLCM33_ADC_ADCLK_GEAR, CLK_PLLCM33_ADC_PCLK_GEAR,
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
+	DEF_RST(15, 6, 7, 7),		/* ADC_0_ADRST_N */
 	DEF_RST(15, 7, 7, 8),		/* TSU_0_PRESETN */
 	DEF_RST(15, 8, 7, 9),		/* TSU_1_PRESETN */
 };
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index fa6caf693a72..218c13659c34 100644
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
2.56.0

