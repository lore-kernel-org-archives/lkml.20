Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAD151477C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681973; cv=none; b=ld4teUzAgvrqUAAGUqdr7+CJywZu9laiGMY2PJgmfoJudG+E3irNFcWa7y9SaNc3tCs1sVDZ8tZgDSHfFlrbWuYXfm9Mc1s1R9nknu1vPiBNkFNevn3u7lCB2YUEJVTHSB5Kh3yHgqefyT+lzbuGoeRQQx/rz0PfUsr5918fHR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681973; c=relaxed/simple;
	bh=2Mu45L5BARy+ps5xY5B43FwHSGdIF2xZMGNAyYhbb/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RF5SocLc51ULYn6Rrrl4URAcUIbau1hyStKFnbwCQ0CCdemNfro12or3P6CGmDJ1Ku7gap5No+8pdD5wKkoaetUWrWU07OsBFbyL0B/+kon5pnvQe/J6gvTAMWCbLQ8ghvrVBK9rTRtxtCFKL1d7HaVCc66QV0YM9vt4OGcuqSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOgBeKBe; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOgBeKBe"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so22888025e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790681970; x=1791286770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YS0haltmyIBpZtM2yu+Y4ol89PxPMhiw1pJAIKA+MII=;
        b=NOgBeKBetcHSFoCk1MFIRmA4KH5hdDFWwH83JgI8EFRLsR+UvieRqN/ncW2YeOLntW
         /7w4qOuW81sN56Z8F3HYVe5Tt9owqeGOhG0IU6sj/scLAXRAnF6KclbQql8xjfsYa2E9
         A61rJVScah3znPUG6jq0x3EOaHXa3J2iIks+NwDTgkiJIOrYf/BBxSyMfqauMutP8VY6
         4fBWJyglkSJYDwErUzWJL42gAVV0ApgJFadbYZfQ63/qhdd6CZMXQE1ScEUcKoOg6srE
         m00u5VdMIEVNSZ3VFV3fJywIu4s8EZCNNKYkQgILMSlK3T+NNEH8y5NS6Jb9MKQQ2z8k
         jnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790681970; x=1791286770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YS0haltmyIBpZtM2yu+Y4ol89PxPMhiw1pJAIKA+MII=;
        b=S7f8Pyj0+qeAVZGgPsT9RMioECgQupAOskbmiTjLNQtDk8DuY5nLNGYfVn3nMd5Ldj
         7o1AKBxiFZjf/9NuRN1VqJ4nRV+1mMMcVW7N4qbcsj2CFuCZ5aLv0T9j3xooG2sHe+tv
         lxi4ICPiqoT/bSjkFvTyAPTw3XZK745u6sDPNTZ5YjwozG+mCmq7+hePzVJZMlDNqh6p
         Ayd3k888XTYAcAZK54e+fppxPve8sMeuOBIv/oINrhpyFhkLIhCViNfWMpMAaWA9PxCX
         zyuUcdSiqimm4jFJEaTcUTMHs+xu5dk7A+fZzl1KXU+MeYBL9qxj52a0yMEXsuQaR9/F
         /zQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXwMGKf9FuLBjgLxPmageqT1OQPXgzqgkdcpf4kJSB/PM8OWy8gG9GWixHg7uiY74WEcX7F8KJCKSFziw=@vger.kernel.org
X-Gm-Message-State: AFuF++l8ADs3zjJz+IAX3VkJmjfyR7MTYYCcnnP6rawXLABpuJDVVvDO
	Zr/RRm/O6xTng2VVOomptQwTIdCcKR+F/AYwTfB4MxYizUAkA4yuMyTS
X-Gm-Gg: AYBFou029ws7J7uSM7ueJ2qXfvB5dC+eSuikV0h9QFz1Qw7eDH8QEKNHebaOgAosiZH
	92H6i6X8tazyON4G7qHGcPnuS/zO2w/ln68yhym82aWrgr4MLwJO3Th68S03Zm0lKDmIOy5RirZ
	IP9zhVmH86Li7OCSNltJneMMQ97wu7TEXYL4nJnWosrfvCoWpwREMiT9RV+0d30J+npFhoeOTr0
	E9c5/D9XqXGjLHv1sODuzAtHfmMIiJ9dSehLjFE90ENWqLDFOFY3MFcapJd6OAN2NCrqZjR0YFi
	SI1/A9L2G5J8NxGu98Uc7kqUWkfbhbCVA29aqFCRMlP19udMdCPiGv54dW/DBcNW1rhxZ2gjJU3
	gS3jDnRix5N+OkRLwGZlhPmsl6ksuLzqBQvMZTqKNujeDi3YNwC3461ar5U/qTs6x2AneQZ0V3C
	s4B/gYJs9g+Uo2P9NJ3k+qE0naGlgWTJ1Ryl4njSKhrnB8onBSWBndSLdN81h2JjMMAW01JkOsF
	nTCXf4LTvbJNz8IR6UJVbVy7UTu8pNK0Rr1AnakQX+n+QJKOqmNxD2F/3CewOHuC6FBsg9rwepU
	OS4CPo5Ud2Z5ZqsJxQ==
X-Received: by 2002:a05:600c:1d1c:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-49ff06bcd5fmr208937585e9.8.1790681969910;
        Tue, 29 Sep 2026 04:39:29 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm83215565e9.14.2026.09.29.04.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:39:29 -0700 (PDT)
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
Subject: [PATCH 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
Date: Tue, 29 Sep 2026 12:39:21 +0100
Message-ID: <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/clk/renesas/r9a09g056-cpg.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 51c1e322826a..6bf8f9ca16e6 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
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
@@ -135,6 +139,12 @@ static const struct clk_div_table dtable_2_100[] = {
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
@@ -171,11 +181,18 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
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
@@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
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
@@ -634,6 +655,7 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(13, 13, 6, 14),		/* GPU_0_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GPU_0_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GPU_0_ACE_RESETN */
+	DEF_RST(15, 6, 7, 7),		/* ADC_ADRST_N */
 	DEF_RST(15, 7, 7, 8),		/* TSU_0_PRESETN */
 	DEF_RST(15, 8, 7, 9),		/* TSU_1_PRESETN */
 };
-- 
2.55.0

