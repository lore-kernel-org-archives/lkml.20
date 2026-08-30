Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59FA3B47C3
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105795; cv=none; b=Pc7qsawHPxcKSX0OJdN4Pduix7uQSolt6ycP73szavj0Soj2DSyFUXkM1UlwiccyvTSFoKGFqI7lQwdw3DxzcTS+vdHu7CgY1J9D9Ifnkqbyq1mp63bvFyoMhOnURyybst4P63ICTE1eXCj9N3Y32LszOimPWdy/AxmwM8InpBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105795; c=relaxed/simple;
	bh=rEJ4KTmox+ccwWAw89Nn+ghoNGNMAhzu089oc+TQ3vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mduHBRqgdytC7klcLOnEFMMPEUYwinMISsaCkThm7Sk52LvDqBTbG8nnHD05NqBgzYKuKfoW5OSRWDOyVzWUraBabN+d7SAoZ4XNTArwafaPKznan6XV7ipjsfJYYGrjSowDyyDF+i6WX341XTYL5NfWZ9p3PednnPQ60qECt6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ON/YEe73; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ON/YEe73"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca80d708489so1787782a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105793; x=1788710593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvNTfLw6tGTRj6Jb6QoSk5fmPXA5ASCBLAMOlppetrE=;
        b=ON/YEe732A7av6dkBWGiNtD3ARIkRWgHbbc1l1PbtNr8UMg7Dw/HKFqVbjD3a/AJax
         ZWWCZ9NjsdWpwNa402hISMGTO3bDlkQHB4O82hwyPYFTH+1o3COCdsJo9mlLtRyhrplU
         FUXtCOHOdkm12Qd4pkUcNmWkFwTMLVhf4yXCKLK1/W87Gp/3N5/XsrzBxzzFJbiYsXpQ
         +xftHihQLQz/EBUt7HvBEZK4WQThTadPnqAbpkspQSIdCr1w6qij+KxTURJ0pWa8Hi/G
         LKmTRxq+kGuj5cCokngsYmh50dAwetrx8pn74CSO1BlyBQr66gk8Oz0h4BBxbEEHoNl3
         qZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105793; x=1788710593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvNTfLw6tGTRj6Jb6QoSk5fmPXA5ASCBLAMOlppetrE=;
        b=W6074GF9tdEuks09mTKyBr5lyu63J6WEmTqocskweYo9bamOlqHF+hHwmBqR4/y0O5
         n439Y7ACJIfmxEdN4Huv5XjxEy3Ejo8tynYB0n+63xRTwPU1AeA84YyOLPv+PGkgVlJb
         P+ClVrrGCOxcTHTdyIk2ibLfV2CNr5FtDW2k9ssQUOmoDYtRnpjZvVh75AIXiQsitAJA
         bCn9bXwBnKedBePvzlIZ9j6dYgL2A9GOwwZlf/06jb0mwGBcCeuum9dwrUCLTpD62QHZ
         MPwJnVJiUqlqR6joY4cVY0lpKlOT8xHKIKd30KqkU0jJeqbeQJtFrpb/k8evtwkAr8JB
         QJFA==
X-Forwarded-Encrypted: i=1; AHgh+RoscWxTRNzqU0xQKvP4IBELpXD2lhTiv8VISWkg1+zY715a90ykl760XIZLmF4zocPdwcTxGabT8SPMs5Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mpycrGr9ZgZPYLd6oecS3ACozM6HAyerK5VlumCXrsXjJ+G8s8
	etc1nhFKhx3X7uQskU2j4V7qZKeYWQbgWQDLSx3uzzISE4s21cMcFOKYVcU7R3yS
X-Gm-Gg: AR+sD10EpQuFer1/We9Llbess0s+E94cdshhLwfdnepMlBTHURrpyo+gq8oMShdnXFn
	1QVzJfebZaGFUzgMgxsJm70hTgXlbbEm650IusU3ZYMPxjLiYSE/FIO/KoAG8oWXVyOiAnmBp82
	S2lnIK2nlXY7E5rG+885AmrL9TneNodFNhABQ8+JzXz/rQU4NIeJheZaZsUsAmQW1mpoY79JrpF
	F2QqayaYnnvEC5+0Lb9QEByFvA5ujsfsI/Pt3DyWqzq1iKFp+S8eliGyyzkPJcATtFVPfjAUEtM
	Do4YR/3IBeuAb3ATr8ETxZ/dgqID2nv9nxrb6sH2P9XBeknFXWUFmxUtSGJyVf4PMvqNKm1oOfr
	Gygicye0jr036131/Epma6sosGbrVkooXzJ4faBmZjooCdXtpLw7/IguBwsDCS6/hCooB0QkLv0
	FRUb2ynvqTNObGqhpQZ/9UVjvu6fIww4NAFXLDytl6PUngvmE3AhZyMuyI1AAMm9S82k/j1h+pF
	59K7wbS1X+x/8Lzf4khEnB1Ix96/hIKItkm+bC9U/qgxWyrwl5c
X-Received: by 2002:a05:6a20:7343:b0:3d3:aed2:6f21 with SMTP id adf61e73a8af0-3d5d988fde2mr2031204637.21.1788105793018;
        Sun, 30 Aug 2026 09:03:13 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:03:12 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 4/5] media: hi846: Add 6MP and 8MP modes support
Date: Mon, 31 Aug 2026 00:00:24 +0800
Message-ID: <20260830160025.211384-5-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830160025.211384-1-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
mode for years. This patch adds 6MP and 8MP modes to maximize sensor
utilization.

Note that these modes require 4-lane MIPI CSI-2, as the downstream
driver only exposes 2MP, 6MP, and 8MP configurations in 4-lane
operation on the target device. The register sequences are extracted
from the downstream Windows driver.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v5:
- Use separated fields instead of raw register values for PLL cfg (Sakari)
---
 drivers/media/i2c/hi846.c | 154 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 153 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 648192521344..719598938638 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1028,6 +1028,106 @@ static const struct hi846_reg mode_1632x1224_mipi_4lane[] = {
 	{HI846_REG_TG_ENABLE,			0x0100},
 };
 
+static const struct hi846_reg mode_3264x1836_config[] = {
+	{HI846_REG_MODE_SELECT,			0x0000},
+	{HI846_REG_Y_ODD_INC_FOBP,		0x1111},
+	{HI846_REG_Y_ODD_INC_VACT,		0x1111},
+	{HI846_REG_Y_ADDR_START_VACT_H,		0x0172},
+	{HI846_REG_Y_ADDR_END_VACT_H,		0x089d},
+	{HI846_REG_UNKNOWN_005C,		0x2101},
+	{HI846_REG_FLL,				0x09de},
+	{HI846_REG_LLP,				0x0ed8},
+	{HI846_REG_BINNING_MODE,		0x0022},
+	{HI846_REG_HBIN_MODE,			0x0000},
+	{HI846_REG_UNKNOWN_0A24,		0x0000},
+	{HI846_REG_X_START_H,			0x0000},
+	{HI846_REG_X_OUTPUT_SIZE_H,		0x0cc0},
+	{HI846_REG_Y_OUTPUT_SIZE_H,		0x072c},
+	{HI846_REG_EXPOSURE,			0x09d8},
+
+	/* For OTP */
+	{HI846_REG_UNKNOWN_021C,		0x0001},
+	{HI846_REG_UNKNOWN_021E,		0x0235},
+
+	{HI846_REG_ISP_EN_H,			0x014a},
+	{HI846_REG_UNKNOWN_0418,		0x023e},
+	{HI846_REG_UNKNOWN_0B02,		0xe04d},
+	{HI846_REG_UNKNOWN_0B10,		0x6821},
+	{HI846_REG_UNKNOWN_0B12,		0x0120},
+	{HI846_REG_UNKNOWN_0B14,		0x0001},
+	{HI846_REG_UNKNOWN_2008,		0x38fd},
+	{HI846_REG_UNKNOWN_326E,		0x0000},
+};
+
+static const struct hi846_reg mode_3264x1836_mipi_4lane[] = {
+	{HI846_REG_UNKNOWN_0900,		0x0300},
+	{HI846_REG_MIPI_TX_OP_MODE,		0xc319},
+	{HI846_REG_UNKNOWN_0914,		0xc109},
+	{HI846_REG_TCLK_PREPARE,		0x061a},
+	{HI846_REG_UNKNOWN_0918,		0x0407},
+	{HI846_REG_THS_ZERO,			0x0a0b},
+	{HI846_REG_TCLK_POST,			0x0e08},
+	{HI846_REG_UNKNOWN_091E,		0x0a00},
+	{HI846_REG_UNKNOWN_090C,		0x0427},
+	{HI846_REG_UNKNOWN_090E,		0x0059},
+	{HI846_REG_UNKNOWN_0954,		0x0089},
+	{HI846_REG_UNKNOWN_0956,		0x0000},
+	{HI846_REG_UNKNOWN_0958,		0xca80},
+	{HI846_REG_UNKNOWN_095A,		0x9240},
+	{HI846_REG_PLL_CFG_MIPI2_H,		0x4124},
+	{HI846_REG_TG_ENABLE,			0x0100},
+};
+
+static const struct hi846_reg mode_3264x2448_config[] = {
+	{HI846_REG_MODE_SELECT,			0x0000},
+	{HI846_REG_Y_ODD_INC_FOBP,		0x1111},
+	{HI846_REG_Y_ODD_INC_VACT,		0x1111},
+	{HI846_REG_Y_ADDR_START_VACT_H,		0x0040},
+	{HI846_REG_Y_ADDR_END_VACT_H,		0x09cf},
+	{HI846_REG_UNKNOWN_005C,		0x2101},
+	{HI846_REG_FLL,				0x09de},
+	{HI846_REG_LLP,				0x0ed8},
+	{HI846_REG_BINNING_MODE,		0x0022},
+	{HI846_REG_HBIN_MODE,			0x0000},
+	{HI846_REG_UNKNOWN_0A24,		0x0000},
+	{HI846_REG_X_START_H,			0x0000},
+	{HI846_REG_X_OUTPUT_SIZE_H,		0x0cc0},
+	{HI846_REG_Y_OUTPUT_SIZE_H,		0x0990},
+	{HI846_REG_EXPOSURE,			0x09d8},
+
+	/* For OTP */
+	{HI846_REG_UNKNOWN_021C,		0x0001},
+	{HI846_REG_UNKNOWN_021E,		0x0235},
+
+	{HI846_REG_ISP_EN_H,			0x014a},
+	{HI846_REG_UNKNOWN_0418,		0x0000},
+	{HI846_REG_UNKNOWN_0B02,		0xe04d},
+	{HI846_REG_UNKNOWN_0B10,		0x6821},
+	{HI846_REG_UNKNOWN_0B12,		0x0120},
+	{HI846_REG_UNKNOWN_0B14,		0x0001},
+	{HI846_REG_UNKNOWN_2008,		0x38fd},
+	{HI846_REG_UNKNOWN_326E,		0x0000},
+};
+
+static const struct hi846_reg mode_3264x2448_mipi_4lane[] = {
+	{HI846_REG_UNKNOWN_0900,		0x0300},
+	{HI846_REG_MIPI_TX_OP_MODE,		0xc319},
+	{HI846_REG_UNKNOWN_0914,		0xc109},
+	{HI846_REG_TCLK_PREPARE,		0x061a},
+	{HI846_REG_UNKNOWN_0918,		0x0407},
+	{HI846_REG_THS_ZERO,			0x0a0b},
+	{HI846_REG_TCLK_POST,			0x0e08},
+	{HI846_REG_UNKNOWN_091E,		0x0a00},
+	{HI846_REG_UNKNOWN_090C,		0x0427},
+	{HI846_REG_UNKNOWN_090E,		0x0059},
+	{HI846_REG_UNKNOWN_0954,		0x0089},
+	{HI846_REG_UNKNOWN_0956,		0x0000},
+	{HI846_REG_UNKNOWN_0958,		0xca80},
+	{HI846_REG_UNKNOWN_095A,		0x9240},
+	{HI846_REG_PLL_CFG_MIPI2_H,		0x4124},
+	{HI846_REG_TG_ENABLE,			0x0100},
+};
+
 static const char * const hi846_test_pattern_menu[] = {
 	"Disabled",
 	"Solid Colour",
@@ -1136,7 +1236,59 @@ static const struct hi846_mode supported_modes[] = {
 			.width = 1632 * 2,
 			.height = 1224 * 2,
 		},
-	}
+	},
+	{
+		.width = 3264,
+		.height = 1836,
+		.mipi_clk_div_2lane = 1, /* dummy */
+		.mipi_clk_div_4lane = 2,
+		.fps = 30,
+		.frame_len = 2526,
+		.llp = HI846_LINE_LENGTH,
+		.reg_list_config = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x1836_config),
+			.regs = mode_3264x1836_config,
+		},
+		.reg_list_2lane = {
+			.num_of_regs = 0,
+		},
+		.reg_list_4lane = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x1836_mipi_4lane),
+			.regs = mode_3264x1836_mipi_4lane,
+		},
+		.crop = {
+			.left = 0x46,
+			.top = 0x172,
+			.width = 3264,
+			.height = 1836,
+		},
+	},
+	{
+		.width = 3264,
+		.height = 2448,
+		.mipi_clk_div_2lane = 1, /* dummy */
+		.mipi_clk_div_4lane = 2,
+		.fps = 30,
+		.frame_len = 2526,
+		.llp = HI846_LINE_LENGTH,
+		.reg_list_config = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x2448_config),
+			.regs = mode_3264x2448_config,
+		},
+		.reg_list_2lane = {
+			.num_of_regs = 0,
+		},
+		.reg_list_4lane = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x2448_mipi_4lane),
+			.regs = mode_3264x2448_mipi_4lane,
+		},
+		.crop = {
+			.left = 0x46,
+			.top = 0x40,
+			.width = 3264,
+			.height = 2448,
+		},
+	},
 };
 
 struct hi846_datafmt {
-- 
2.55.0

