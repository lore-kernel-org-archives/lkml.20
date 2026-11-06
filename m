Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966349;
	b=5g93O/hkd2MbD5M7CXC1fq3agjo/0yJNxVlWbP1oisSKHGfeEfgDviEW17Jea4c0GpDd
	 clWKMLM3R44SrMbRCda/M94jzgZhL0xjcUrKw7bfl4q5FUKdrr3aDpnSQwpRK36taGLol
	 NIoOjE/6fuzTN6SDLX1jT1OeO6nuc+GHBi7ciBAtvD+VlJuh7xB99bXXI9dzIXItvt0jE
	 J+PbfCBeflbqw4ocXdAu2HK/xkrV67FXpGhuVYYKWH9k5O4IzyybBJYaRZvXkqp/AUZ35
	 +olsFajJghkhlf+2/+82MGfDHsF1vq/hlF+6OJff4lp5xiPOWrQZneKGDb0qlW9W8Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3gfT2KnSDa6gjtkPu06/Qn1c0SgyDeDk7qsUKKdleQk=;
	b=TpcwaqoX9qLqonbumHBnIFLRpTIH7KwlGqVatv0SvGCVpQ7cSkuAb55mBQhJ7jb49/Ox
	 RbEet9C9hQ4a3+z0yjCwUxWwXbbtSXYHuj0+ivcw1iii1BVErU7dAl18lmvbsv0AJOHGA
	 CdynIcOsTORXOAyiz70WxnTYFWU1O+7ETo/t/0jR7Yxl/4nMyq9nvstLQvYKOTrudAUym
	 YvL3xpmrOGvxsj0tNyqWYZXayqoPnvxI7zgCTxgodClRHNCSNJfarPuXTnsJ1M7wits9f
	 8j5FSAKOX+rpVVbbPAwdMISdsTsBrk6xTo4auVDvGwUeis1UNl1rCCbWFExJp9ueLIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFdWdY+S;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1383606D834
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1383606D834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFdWdY+S
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so6891965e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966347; x=1794571147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gfT2KnSDa6gjtkPu06/Qn1c0SgyDeDk7qsUKKdleQk=;
        b=iFdWdY+S6jpN2egzYfj4wK/pmjmJ4uNpsDsA0eK6wDfwRDb7N9rZ3pCrc3vi1LYVLy
         F+0JGvcdTchBuxbB1a98hhIkOKzAqYETHJtYZYNL/771XEV1Yn8O8yynRoaNPINU/NR9
         aoWlokzsEf44b/+SUteCvm1iMWSDjeyC3pG1ZHT2pAi5pygzMr7oh6qrMkK9Mu5USQ4P
         QKw8SDTvvYemRLy2NI3bfdTNZiHh1MUxAKZGTNVs3jSJONqSeopZbxRekGnpgAXYrE/j
         AUdtmk4bs5Q1ToSeClImInxLIz4icIagxdJea+TA2POPRi+hUx9hGg9VhT3I5CLG12pK
         lAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966347; x=1794571147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gfT2KnSDa6gjtkPu06/Qn1c0SgyDeDk7qsUKKdleQk=;
        b=CQquOI0uKbvtt5UPXnhudWhdbqasrEjWi6luXQeT45/LeAggf+N9z7WxnjKORmtfzf
         L6aB8iLr1r3xnK54lsVMB/Wdmug950ZXsZ2yTNbGLgMCPl8No7zEx6ShkYKqD9TC0X8l
         L+KrwMGHBunsbytQMMkYGPbXVoi/Zm3iBjzjJRXg/aVXJLBSIlU4GqpOdGKopdW7e5pX
         GTBAc5RSsRXCbbcSRf3vl9HUUqIJgUHw27fCbJTHfailfV6enWAIL0ADCAhd//J9orIV
         jz7UWROhmhvJUwEh/i2i/g0LQC/2R8Mtn+hCwhCBlMaLlFlt/hwECMRTj9VTqBC6n2c5
         gGKw==
X-Forwarded-Encrypted: i=1; AKwUvBy8UwQppIqJQrGrISfe4BZCrFLOmT79TUlbiKnJNrlgf20QIhEDdIx0ukIzx2pNlhJxRNfNXTEiP4URll8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y4q3PRwshop7MZAfgl/KW8H1bqjrSVDCh+iwoPfcd6zZ5GFGu
	6JEK4tfe0RzfvpN/Wmsz6OXzp+uuJ8AqT4s+VjXlYvJlb9cKdA/mWZsd
X-Gm-Gg: AYBFou3a5x7gCgDLEO+iJcYIFa4V7VRCBQQX7aj3yOnbgotqjRwCAVVyvfeNYXrG9UL
	PNpQSV1MS7QyJ2URDtOKgHvZpn9e7y+ttkRfMqA83ybbsquqhCqSiOcZjXuwb57NwoA1LLuRtJX
	ulnus98K9vteq9CnHow5dYB4FmDdYATUkgnE77ZNjorjhmySeZzuu22sr6Jy6q5GcwmPKKxlk/x
	lHCATvqWpGq+AaSUjDnLVpJKg+k0wisMkzm5llLyMYXmIyNvjiMmdqoWi8YxbrjHXT0Wa7ehk3F
	ED3HyfYF3dBOhbk9JnaEJwEfR8H1D4AgUYD/uMrLhCCcqZ9Ksw9OqPaZKOZHanmv2NbZ/k5aTCC
	WWilNgpMUwbzd4yOv+u9vt4JVS2mJXK6xU6ARC7z5+KtX0ngaAprn25Vc3B7bWCt1+aaGwUu9FY
	C7Jyovv1pBfdvxPE1fJpE/CTQVycTZ1CFPesOHEyWBBYAuAryVYA9mPMuLUJPO5CIN6XGQBafRS
	z1L9Gp/XoTiSEAvgzaqKHjcksLfm0pdQDvvs80JSUtqpzsJKg/HphRUmzt0dEwxdId7c2IFhmai
	ZBkWNDHZMNL2Tv24y7737qYQoQlZY/BrIqHg8ADMG2JrG+EyyVRmimtTC+s3ivps9q/nh7ek1Wv
	kggOc/KG5pLPNuaphkNfGul4hzvzEUUc7kShLtpjo++TnTUYXKkIcJVk=
X-Received: by 2002:a05:600c:6995:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4b6dfe8f2edmr35197115e9.25.1793966347438;
        Fri, 06 Nov 2026 03:59:07 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b76b5d52a7sm4849775e9.1.2026.11.06.03.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:59:07 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v11 5/5] clk: en7523: add support for Airoha AN7583 clock
Date: Fri,  6 Nov 2026 12:58:50 +0100
Message-ID: <20261106115852.189098-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106115852.189098-1-ansuelsmth@gmail.com>
References: <20261106115852.189098-1-ansuelsmth@gmail.com>
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

Add support for Airoha AN7583 clock and reset.

Airoha AN7583 SoC have the same register address of EN7581 but implement
different bits and additional base clocks. Also reset are different with
the introduction of 2 dedicated MDIO line and drop of some reset lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 249 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 249 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 8e24eef651a1..821a5f5ad4d8 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -13,6 +13,7 @@
 #include <linux/reset-controller.h>
 #include <linux/spinlock.h>
 #include <dt-bindings/clock/en7523-clk.h>
+#include <dt-bindings/reset/airoha,an7583-reset.h>
 #include <dt-bindings/reset/airoha,en7523-reset.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
 #include <dt-bindings/clock/econet,en751221-scu.h>
@@ -166,6 +167,14 @@ static const u32 crypto_base[] = { 540000000, 480000000 };
 static const u32 emmc7581_base[] = { 200000000, 150000000 };
 /* EN751221 */
 static const u32 gsw751221_base[] = { 500000000, 250000000, 400000000, 200000000 };
+/* AN7583 */
+static const u32 gsw7583_base[] = { 540672000, 270336000, 400000000, 200000000 };
+static const u32 emi7583_base[] = { 540672000, 480000000, 400000000, 300000000 };
+static const u32 bus7583_base[] = { 600000000, 540672000, 480000000, 400000000 };
+static const u32 spi7583_base[] = { 400000000, 12500000 };
+static const u32 npu7583_base[] = { 666000000, 800000000, 720000000, 600000000 };
+static const u32 crypto7583_base[] = { 540672000, 400000000 };
+static const u32 emmc7583_base[] = { 150000000, 200000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -368,6 +377,138 @@ static const struct en_clk_desc en7581_base_clks[] = {
 	}
 };
 
+static const struct en_clk_desc an7583_base_clks[] = {
+	{
+		.id = EN7523_CLK_GSW,
+		.name = "gsw",
+
+		.base_reg = REG_GSW_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = gsw7583_base,
+		.n_base_values = ARRAY_SIZE(gsw7583_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_EMI,
+		.name = "emi",
+
+		.base_reg = REG_EMI_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = emi7583_base,
+		.n_base_values = ARRAY_SIZE(emi7583_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_BUS,
+		.name = "bus",
+
+		.base_reg = REG_BUS_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = bus7583_base,
+		.n_base_values = ARRAY_SIZE(bus7583_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_SLIC,
+		.name = "slic",
+
+		.base_reg = REG_SPI_CLK_FREQ_SEL,
+		.base_bits = 1,
+		.base_shift = 1,
+		.base_values = slic_base,
+		.n_base_values = ARRAY_SIZE(slic_base),
+
+		.div_reg = REG_SPI_CLK_DIV_SEL,
+		.div_bits = 5,
+		.div_shift = 24,
+		.div_val0 = 20,
+		.div_step = 2,
+	}, {
+		.id = EN7523_CLK_SPI,
+		.name = "spi",
+
+		.base_reg = REG_SPI_CLK_FREQ_SEL,
+		.base_bits = 1,
+		.base_shift = 0,
+		.base_values = spi7583_base,
+		.n_base_values = ARRAY_SIZE(spi7583_base),
+
+		.div_reg = REG_SPI_CLK_DIV_SEL,
+		.div_bits = 5,
+		.div_shift = 8,
+		.div_val0 = 40,
+		.div_step = 2,
+	}, {
+		.id = EN7523_CLK_NPU,
+		.name = "npu",
+
+		.base_reg = REG_NPU_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 9,
+		.base_values = npu7583_base,
+		.n_base_values = ARRAY_SIZE(npu7583_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_CRYPTO,
+		.name = "crypto",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 0,
+		.base_values = crypto7583_base,
+		.n_base_values = ARRAY_SIZE(crypto7583_base),
+	}, {
+		.id = EN7581_CLK_EMMC,
+		.name = "emmc",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 13,
+		.base_values = emmc7583_base,
+		.n_base_values = ARRAY_SIZE(emmc7583_base),
+	}, {
+		.id = AN7583_CLK_MDIO0,
+		.name = "mdio0",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+
+		.base_value = 25000000,
+
+		.div_bits = 4,
+		.div_shift = 15,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = AN7583_CLK_MDIO1,
+		.name = "mdio1",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+
+		.base_value = 25000000,
+
+		.div_bits = 4,
+		.div_shift = 19,
+		.div_step = 1,
+		.div_offset = 1,
+	}
+};
+
 static const u16 en7581_rst_ofs[] = {
 	REG_RST_CTRL2,
 	REG_RST_CTRL1,
@@ -543,6 +684,64 @@ static const u16 en751221_rst_map[] = {
 	[EN751221_USB_PHY_P1_RST]	= 3 * RST_NR_PER_BANK + 7,
 };
 
+static const u16 an7583_rst_map[] = {
+	/* RST_CTRL2 */
+	[AN7583_XPON_PHY_RST]		= 0,
+	[AN7583_GPON_OLT_RST]		= 1,
+	[AN7583_CPU_TIMER2_RST]		= 2,
+	[AN7583_HSUART_RST]		= 3,
+	[AN7583_UART4_RST]		= 4,
+	[AN7583_UART5_RST]		= 5,
+	[AN7583_I2C2_RST]		= 6,
+	[AN7583_XSI_MAC_RST]		= 7,
+	[AN7583_XSI_PHY_RST]		= 8,
+	[AN7583_NPU_RST]		= 9,
+	[AN7583_TRNG_MSTART_RST]	= 12,
+	[AN7583_DUAL_HSI0_RST]		= 13,
+	[AN7583_DUAL_HSI1_RST]		= 14,
+	[AN7583_DUAL_HSI0_MAC_RST]	= 16,
+	[AN7583_DUAL_HSI1_MAC_RST]	= 17,
+	[AN7583_XPON_XFI_RST]		= 18,
+	[AN7583_WDMA_RST]		= 19,
+	[AN7583_WOE0_RST]		= 20,
+	[AN7583_HSDMA_RST]		= 22,
+	[AN7583_TDMA_RST]		= 24,
+	[AN7583_EMMC_RST]		= 25,
+	[AN7583_SOE_RST]		= 26,
+	[AN7583_XFP_MAC_RST]		= 28,
+	[AN7583_MDIO0_RST]		= 30,
+	[AN7583_MDIO1_RST]		= 31,
+	/* RST_CTRL1 */
+	[AN7583_PCM1_ZSI_ISI_RST]	= RST_NR_PER_BANK + 0,
+	[AN7583_FE_PDMA_RST]		= RST_NR_PER_BANK + 1,
+	[AN7583_FE_QDMA_RST]		= RST_NR_PER_BANK + 2,
+	[AN7583_PCM_SPIWP_RST]		= RST_NR_PER_BANK + 4,
+	[AN7583_CRYPTO_RST]		= RST_NR_PER_BANK + 6,
+	[AN7583_TIMER_RST]		= RST_NR_PER_BANK + 8,
+	[AN7583_PCM1_RST]		= RST_NR_PER_BANK + 11,
+	[AN7583_UART_RST]		= RST_NR_PER_BANK + 12,
+	[AN7583_GPIO_RST]		= RST_NR_PER_BANK + 13,
+	[AN7583_GDMA_RST]		= RST_NR_PER_BANK + 14,
+	[AN7583_I2C_MASTER_RST]		= RST_NR_PER_BANK + 16,
+	[AN7583_PCM2_ZSI_ISI_RST]	= RST_NR_PER_BANK + 17,
+	[AN7583_SFC_RST]		= RST_NR_PER_BANK + 18,
+	[AN7583_UART2_RST]		= RST_NR_PER_BANK + 19,
+	[AN7583_GDMP_RST]		= RST_NR_PER_BANK + 20,
+	[AN7583_FE_RST]			= RST_NR_PER_BANK + 21,
+	[AN7583_USB_HOST_P0_RST]	= RST_NR_PER_BANK + 22,
+	[AN7583_GSW_RST]		= RST_NR_PER_BANK + 23,
+	[AN7583_SFC2_PCM_RST]		= RST_NR_PER_BANK + 25,
+	[AN7583_PCIE0_RST]		= RST_NR_PER_BANK + 26,
+	[AN7583_PCIE1_RST]		= RST_NR_PER_BANK + 27,
+	[AN7583_CPU_TIMER_RST]		= RST_NR_PER_BANK + 28,
+	[AN7583_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
+	[AN7583_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
+
+	/* RST_PCIC */
+	[AN7583_PCIC_PERSTOUT0_RST]	= 2 * RST_NR_PER_BANK + 29,
+	[AN7583_PCIC_PERSTOUT1_RST]	= 2 * RST_NR_PER_BANK + 26,
+};
+
 static int en7581_reset_register(struct device *dev, void __iomem *base,
 				 const u16 *rst_map, int nr_resets,
 				 const u16 *rst_reg_ofs);
@@ -1170,6 +1369,43 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	return en7581_serdes_phy_register(&pdev->dev);
 }
 
+static int an7583_clk_hw_init(struct platform_device *pdev,
+			      struct clk_hw_onecell_data *clk_data)
+{
+	struct en_clk_priv *priv = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	struct regmap *map;
+	void __iomem *base;
+	u32 val;
+	int ret;
+
+	map = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu");
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->base = base;
+
+	en7581_register_clocks(dev, clk_data, map, base);
+
+	val = readl(base + REG_RST_CTRL1);
+	val |= REG_PCIE_HB_RST;
+	writel(val, base + REG_RST_CTRL1);
+	val &= ~REG_PCIE_HB_RST;
+	writel(val, base + REG_RST_CTRL1);
+
+	ret = en7581_reset_register(dev, base, an7583_rst_map,
+				    ARRAY_SIZE(an7583_rst_map),
+				    en7581_rst_ofs);
+	if (ret)
+		return ret;
+
+	return en7581_serdes_phy_register(dev);
+}
+
 static enum en_hir get_hw_id(void __iomem *np_base)
 {
 	u32 val = FIELD_GET(REG_HIR_MASK, readl(np_base + REG_HIR));
@@ -1323,6 +1559,18 @@ static const struct en_clk_soc_data en7581_data = {
 	.hw_init = en7581_clk_hw_init,
 };
 
+static const struct en_clk_soc_data an7583_data = {
+	.base_clks = an7583_base_clks,
+	/* We increment num_clocks by 1 to account for additional PCIe clock */
+	.num_clocks = ARRAY_SIZE(an7583_base_clks) + 1,
+	.pcie_ops = {
+		.is_enabled = en7581_pci_is_enabled,
+		.prepare = en7581_pci_enable,
+		.unprepare = en7581_pci_disable,
+	},
+	.hw_init = an7583_clk_hw_init,
+};
+
 static const struct en_clk_soc_data en751221_data = {
 	.num_clocks = EN751221_MAX_CLKS,
 	.pcie_ops = {
@@ -1336,6 +1584,7 @@ static const struct en_clk_soc_data en751221_data = {
 static const struct of_device_id of_match_clk_en7523[] = {
 	{ .compatible = "airoha,en7523-scu", .data = &en7523_data },
 	{ .compatible = "airoha,en7581-scu", .data = &en7581_data },
+	{ .compatible = "airoha,an7583-scu", .data = &an7583_data },
 	{ .compatible = "econet,en751221-scu", .data = &en751221_data },
 	{ /* sentinel */ }
 };
-- 
2.55.0

