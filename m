Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753022;
	b=DbsHSgDOHd7Q88Pc8GFq99gXM/igjUX+h8sn/cKmCna2MfXawP6+gjCYMiVjocTBtsRf
	 BXSzWw6EZWUBjxWZDcfGoSljrOL9Um9jZxCumYJ75bqhL3zJ+q7duH2U6qjeqCyGaR8N7
	 r4llNC5TUtcK1Mobx9Y2kDVNeRiBQM9q2u3cFEETHekb3iZ7OXQIE8e+U6uyjAoReMiVf
	 vVvU0ahTZPYBzqKwTOqejscmC2vLeTaRHzSX56xCMZhThCti7yWu2ql4dn1ew5LD9qK8M
	 0l2WdSG00yIRMbMKp5vU7DfBRkCxRlZ/JZ7pq0LrgpGwriyI8MiWtxmETZOc/BWuQTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PvkfzsuQCCCBTer+HvQR59pMaHuODvI+445x+rDaQOc=;
	b=K4hY/qwkPC1b2cJGUG503tlaxyg1wfD2gqOaejVyMpMlpJsXStWKiRFz7VQc0mAq/2hM
	 Nj6WxB03iG+GOblAy9gsu6M9Zfz5WmNX9BOGzrSuzZfjR/o6U+saEYHEA4UVqWu+7ArNa
	 kyvOOss4LSPPr/SAhozoH6dD581tOu458qooFJjIZDKb66L0oQq2gTeWD1QfhC5aA0VkG
	 AOurB5d/EtV9njXm4bEanjiLMJ70dQAOWSK2ZuMfEKSSiwbmqUCOiRu6S4Z9ViIURH1Fv
	 kgPSm2+x+v02owuboQWZfVO428Zihzwpt6+ic9j6XwVX3LLwvkA/vfnrlkrZ/mKkORw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ObcV0h1M;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4921C606A33C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4921C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ObcV0h1M
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-70059e4dab6so100468eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793753020; x=1794357820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvkfzsuQCCCBTer+HvQR59pMaHuODvI+445x+rDaQOc=;
        b=ObcV0h1MRloP368BbCyiS+6FAfjdg/gjmHWWiX3btLauk4cvBQMztRvSOlKiguicWj
         FA3aNFIuRk1jgUjUpYn9VcxL/eV0VzNBhf0yOxBd0OeTLVjeWdT0++zjE5LNwLo8keV3
         zZZWdGiFBGUUdiQbVmhxG1Cg4BZMc8M8xhCTm2NkkVsfRXyrYNBZeNAQGZ+pb7BMy2Y8
         F2MblAxD6sAYiZkHxQ+TR0CB0fdWEYpip60+Ud1tJhLYSWIYQq2+ozXw6MfCqpMis/I0
         rpjbyA5GPx4cdPEbVMRNd6pmlqehGhbDdUoh5SUM1CgFXuBDGt+VGK7VMYv7/yiBhLzJ
         PeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753020; x=1794357820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PvkfzsuQCCCBTer+HvQR59pMaHuODvI+445x+rDaQOc=;
        b=oY/1hTl9o7EpKyXj1GD98tXMaScHYhWL9SK+ZuW68gbKnZx/8y4jjyRdYEBg49S5Xw
         6DvUbNVcBn+63fW6SO/q6KPAXsajQucIIWQZQXq8ipdVx7avy37ghS2pm5M+x9RPPTqZ
         QhN+nyHIwunEPYWHLYE1jcDLIaQxLbfwsFUPwAAk6WGPkUp7xjq2VsZFpD8z1nnhhx8e
         oh4B4/UXAjXPV7/SJ26GFbQpCqDkZw2z6phvT+IBJ47IwZbWKvEkESrCdEodlKKMf7Uo
         yVmyGlX4NrOSAb1KRNDKkIg57Vs8XUYE0foKhYwrICEJuayHZNzU+o5gAURtJzKqEY7t
         7G0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwRkT6VBeLhiXQs4mMLHS5KL95OBJaF7b0EJvNh64/IsGexL7w5XF3GoxsZy4xBe/vJK2T9+r0ipmgjQoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y22FBbFP3zKwPc0IWPpqF3voVYbSWaoZqLpmwxrWdJrXxmYV0
	SSQcLQq/6BYDOsAhtv0wzfBC5dGZ/v/TK2YwhO9s/RZcln2ArSqcHQq0WssrUI6TFJQi9qcT/+b
	kC6GGm88=
X-Gm-Gg: AYBFou18BfTk52X5jbI9oEg+MrWZDs1M+cYRwEiq/fxB34h+A5/GE5Gutmk1ZKAiWcG
	cuYnMJiyWnZJN46jUZi6qN3xKPfWZVpKHyqWBzUaYZbj2Oe6iVK6Sqc8AVaclnasEsKMXlSEwPz
	/3Z+IBmSsczMBgcEjYZkaEh+go8eeTX875pQ0X9UROm8BllV9+96uO9xuD409akiBiC9HI/aotY
	rXQVVnI0YXcJde5+rblLRaDrKUsmYi7wNmDLPD3cz9i2EX+Ugp/pzb2yV6s5Jx9fK6ZVDG0mDeq
	jrjY1owuGDdowsuYkZfXtIywmMiKu8nT0LXF2CKLHbdJKZx+6olZ1OujJK0c1Xz1gPdsGl3jVh7
	zvDvoPGq4nXZ3HjcOnbZgddN/ea/Y7nwG5/KjidXw9pY3ibfvnMLOGaE5TNGSqwgTTLhkd4h7Dv
	1sM8Exc0GvMP9e7Hpx1I+/+0og5EskF9nA7kJrZ3/iEkS9WUZaUvS+4++IkViJjIDqUSCKOVOeY
	VXod8BMUGT91oCQaer4sazik9wFQzao1CZsmAVJKW7Plyu6p/srpCb+ni+OYS2SdpMurV6A4ZeJ
	KX0jialoOPsb9OiAyFJPhfiiDd68KLJaxp38wD4AxdBJRMZ5hWBrZUs=
X-Received: by 2002:a05:6820:1607:b0:6d8:bba5:658a with SMTP id 006d021491bc7-714f24a07f8mr8269371eaf.43.1793753020211;
        Tue, 03 Nov 2026 16:43:40 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61f0c0sm513493fac.14.2026.11.03.16.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:39 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock driver
Date: Tue,  3 Nov 2026 18:43:30 -0600
Message-ID: <20261104004332.2141282-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104004332.2141282-1-elder@riscstar.com>
References: <20261104004332.2141282-1-elder@riscstar.com>
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

Define a new platform driver that manages clocks implemented by the
Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
and disabled, but currently only the clocks that are (or will soon
be) used are defined to be controllable.

Two registers manage the state of the clocks.  The registers are
accessed via a regmap supplied by a system controller.  Access to
the memory region is provided via a BAR on a PCIe endpoint function
embedded in the TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 MAINTAINERS              |   7 +
 drivers/clk/Kconfig      |  12 ++
 drivers/clk/Makefile     |   1 +
 drivers/clk/clk-tc9564.c | 288 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 308 insertions(+)
 create mode 100644 drivers/clk/clk-tc9564.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c25ee6e0f1c68..ee01aed56508d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28332,6 +28332,13 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC9564 CLOCK DRIVER
+M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	drivers/clk/clk-tc9564.c
+
 TOSHIBA TC9564 PCI DRIVER
 M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 37a8e35d41783..0d186150d0c75 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -293,6 +293,18 @@ config COMMON_CLK_S2MPS11
 	  clock. These multi-function devices have two (S2MPS14) or three
 	  (S2MPS11, S5M8767) fixed-rate oscillators, clocked at 32KHz each.
 
+config COMMON_CLK_TC9564
+	tristate "Toshiba TC9564 clock support"
+	depends on SOC_TOSHIBA_TC9564_SYSCON
+	select MFD_SYSCON
+	default SOC_TOSHIBA_TC9564_SYSCON
+	help
+	  This enables support for the clock controller embedded in the
+	  Toshiba TC9564 SoC.  The state of each clock is controlled via
+	  MMIO to a region managed by a system controller; this ensures
+	  access to the region is coordinated between this and the reset
+	  and XGMAC (stmmac) drivers.
+
 config CLK_TWL
 	tristate "Clock driver for the TWL PMIC family"
 	depends on TWL4030_CORE
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 52d138d4ffc88..a11a8326d79cb 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -111,6 +111,7 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
 obj-$(CONFIG_COMMON_CLK_SP7021)		+= clk-sp7021.o
 obj-$(CONFIG_COMMON_CLK_STM32F)		+= clk-stm32f4.o
 obj-$(CONFIG_COMMON_CLK_STM32H7)	+= clk-stm32h7.o
+obj-$(CONFIG_COMMON_CLK_TC9564)		+= clk-tc9564.o
 obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
 obj-$(CONFIG_CLK_TWL)			+= clk-twl.o
diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
new file mode 100644
index 0000000000000..8eeba85919703
--- /dev/null
+++ b/drivers/clk/clk-tc9564.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/soc/toshiba,tc9564.h>
+
+/*
+ * The full name of every clock has a prefix "tc9564" followed by a single
+ * character ('a', 'b', etc.) that differs for each chip/device number.
+ * Each clock's "name" defines the unique portion of the clock's full name.
+ */
+#define FULL_NAME_SIZE	24	/* Enough for formatted full name */
+#define NAME_SIZE	12	/* Unique portion of the clock name */
+#define FORMAT_FULL_NAME(_full_name, _id, _name)		\
+	snprintf(_full_name, FULL_NAME_SIZE, "tc9564%c_%.*s",	\
+		'a' + (_id), NAME_SIZE, _name)
+
+/* Two registers control whether gate clocks are enabled */
+#define CLK_CTRL0_OFFSET	0x1004	/* Common and MAC0 gate clocks */
+#define CLK_CTRL1_OFFSET	0x100c	/* MAC1 gate clocks */
+
+enum clock_type { PLL, FIXED, GATE };
+
+struct tc9564_clock {
+	struct regmap *regmap;
+	struct clk_hw_onecell_data *clk_data;
+};
+
+struct gate_clock {
+	struct clk_hw hw;
+	const struct clock_init *init;
+};
+
+struct clock_init {
+	const char name[NAME_SIZE];
+	enum clock_type type;
+	union {
+		u32 mult;	/* PLL rate multiplier */
+
+		u32 div;	/* Fixed rate clock divider */
+
+		struct {	/* Gate clock */
+			u16 parent;	/* Parent clock ID, e.g. CLOCK_50M */
+			u16 offset;	/* CLK_CTRL0_OFFSET/CLK_CTRL1_OFFSET */
+			u32 mask;
+		};
+	};
+};
+
+/* There is only one PLL */
+#define PLL_INIT(_name, _mult)				\
+	[CLOCK_##_name] = {				\
+		.name = #_name,				\
+		.type = PLL,				\
+		.mult = (_mult),			\
+	}
+
+/* The PLL is the parent of all the fixed rate clocks */
+#define FIXED_INIT(_name, _div)				\
+	[CLOCK_##_name] = {				\
+		.name = #_name,				\
+		.type = FIXED,				\
+		.div = (_div),				\
+	}
+
+#define GATE_INIT0(_name, _bit, _pname)	__GATE_INIT(_name, 0, _bit, _pname)
+#define GATE_INIT1(_name, _bit, _pname)	__GATE_INIT(_name, 1, _bit, _pname)
+#define __GATE_INIT(_name, _reg, _bit, _pname)		\
+	[CLOCK_##_name] = {				\
+		.name = #_name,				\
+		.type = GATE,				\
+		.parent = CLOCK_##_pname,		\
+		.offset = CLK_CTRL ## _reg ## _OFFSET,	\
+		.mask = BIT(_bit),			\
+	}
+
+/*
+ * Clocks are initialized and registered in the order of their IDs.
+ * Parent clocks must be registered before their children.
+ */
+static const struct clock_init clock_init[] = {
+	PLL_INIT(PLL, 50),
+
+	FIXED_INIT(62_5M, 20),
+	FIXED_INIT(125M, 10),
+	FIXED_INIT(250M, 5),
+	FIXED_INIT(312_5M, 4),
+
+	GATE_INIT0(MSIGEN, 18, 62_5M),
+
+	GATE_INIT0(MAC0_TX, 7, 250M),
+	GATE_INIT0(MAC0_RX, 14, 250M),
+	GATE_INIT0(MAC0_125M, 29, 125M),
+	GATE_INIT0(MAC0_312_5M, 30, 312_5M),
+	GATE_INIT0(MAC0_ALL, 31, 250M),
+
+	GATE_INIT1(MAC1_TX, 7, 250M),
+	GATE_INIT1(MAC1_RX, 14, 250M),
+	GATE_INIT1(MAC1_125M, 29, 125M),
+	GATE_INIT1(MAC1_312_5M, 30, 312_5M),
+	GATE_INIT1(MAC1_ALL, 31, 250M),
+	GATE_INIT1(MAC1_RMII, 15, 125M),
+};
+#define CLOCK_COUNT	ARRAY_SIZE(clock_init)
+
+/* Parent is the input oscillator running at 25 MHz; PLL runs at 1250 MHz */
+static struct clk_hw *pll_register(struct device *dev,
+				   const struct clock_init *init)
+{
+	char full_name[FULL_NAME_SIZE];
+
+	FORMAT_FULL_NAME(full_name, dev->id, init->name);
+
+	return devm_clk_hw_register_fixed_factor_index(dev, full_name, 0, 0,
+						       init->mult, 1);
+}
+
+/* The PLL is the parent of all fixed clocks */
+static struct clk_hw *fixed_register(struct device *dev,
+				     const struct clock_init *init)
+{
+	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
+	char full_name[FULL_NAME_SIZE];
+	struct clk_hw *pll_hw;
+
+	FORMAT_FULL_NAME(full_name, dev->id, init->name);
+
+	pll_hw = tc9564_clock->clk_data->hws[CLOCK_PLL];
+
+	return devm_clk_hw_register_fixed_factor_parent_hw(dev, full_name,
+							   pll_hw, 0,
+							   1, init->div);
+}
+
+static const struct gate_clock *hw_to_gate_clock(struct clk_hw *hw)
+{
+	return container_of_const(hw, struct gate_clock, hw);
+}
+
+static void gate_clk_manage(struct clk_hw *hw, bool enable)
+{
+	struct tc9564_clock *tc9564_clock = dev_get_drvdata(clk_hw_get_dev(hw));
+	const struct gate_clock *clock = hw_to_gate_clock(hw);
+	u32 mask = clock->init->mask;
+
+	regmap_update_bits(tc9564_clock->regmap, clock->init->offset, mask,
+			   enable ? mask : 0);
+}
+
+static int gate_clk_enable(struct clk_hw *hw)
+{
+	gate_clk_manage(hw, true);
+
+	return 0;
+}
+
+static void gate_clk_disable(struct clk_hw *hw)
+{
+	gate_clk_manage(hw, false);
+}
+
+static int gate_clk_is_enabled(struct clk_hw *hw)
+{
+	struct tc9564_clock *tc9564_clock = dev_get_drvdata(clk_hw_get_dev(hw));
+	const struct gate_clock *clock = hw_to_gate_clock(hw);
+	u32 val;
+
+	regmap_read(tc9564_clock->regmap, clock->init->offset, &val);
+
+	return val & clock->init->mask ? 1 : 0;
+}
+
+static const struct clk_ops gate_clk_ops = {
+	.enable = gate_clk_enable,
+	.disable = gate_clk_disable,
+	.is_enabled = gate_clk_is_enabled,
+};
+
+static struct clk_hw *gate_register(struct device *dev,
+				    const struct clock_init *init)
+{
+	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
+	struct clk_init_data clk_init = { };
+	const struct clk_hw *parent_hw;
+	char full_name[FULL_NAME_SIZE];
+	struct gate_clock *clock;
+	int ret;
+
+	clock = devm_kzalloc_obj(dev, *clock);
+	if (!clock)
+		return ERR_PTR(-ENOMEM);
+
+	FORMAT_FULL_NAME(full_name, dev->id, init->name);
+
+	parent_hw = tc9564_clock->clk_data->hws[init->parent];
+
+	clk_init.name = full_name;
+	clk_init.ops = &gate_clk_ops;
+	clk_init.parent_hws = &parent_hw;
+	clk_init.num_parents = 1;
+
+	clock->hw.init = &clk_init;
+	clock->init = init;
+
+	ret = devm_clk_hw_register(dev, &clock->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &clock->hw;
+}
+
+static int tc9564_clk_probe(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data;
+	struct tc9564_clock *tc9564_clock;
+	struct device *dev = &pdev->dev;
+	struct device_node *parent_np;
+	int ret;
+
+	parent_np = dev_of_node(dev->parent);
+	if (!parent_np)
+		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
+
+	tc9564_clock = devm_kzalloc_obj(dev, *tc9564_clock);
+	if (!tc9564_clock)
+		return -ENOMEM;
+
+	/* Note: MMIO regmap (no error checking needed when used) */
+	tc9564_clock->regmap = device_node_to_regmap(parent_np);
+	if (IS_ERR(tc9564_clock->regmap))
+		return dev_err_probe(dev, PTR_ERR(tc9564_clock->regmap),
+				     "failed to get config regmap\n");
+
+	clk_data = devm_kzalloc_flex(dev, *tc9564_clock->clk_data, hws,
+				     CLOCK_COUNT);
+	if (!clk_data)
+		return -ENOMEM;
+	tc9564_clock->clk_data = clk_data;
+
+	dev_set_drvdata(dev, tc9564_clock);
+
+	/* Initialize all the clocks */
+	for (u32 i = 0; i < clk_data->num; i++) {
+		const struct clock_init *init = &clock_init[i];
+		struct clk_hw *hw;
+
+		if (init->type == PLL)
+			hw = pll_register(dev, init);
+		else if (init->type == FIXED)
+			hw = fixed_register(dev, init);
+		else
+			hw = gate_register(dev, init);
+		if (IS_ERR(hw))
+			return dev_err_probe(dev, PTR_ERR(hw),
+					     "failed to register %s\n",
+					     init->name);
+		clk_data->hws[i] = hw;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add provider\n");
+
+	return 0;
+}
+
+static struct platform_driver tc9564_clk_driver = {
+	.probe = tc9564_clk_probe,
+	.driver = {
+		.name = "toshiba-tc9564-clock",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_platform_driver(tc9564_clk_driver);
+
+MODULE_DESCRIPTION("Toshiba TC9564 Clock Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:toshiba-tc9564-clock");
-- 
2.53.0

