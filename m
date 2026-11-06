Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973564;
	b=K4EBEVpe6RlS7TCeE8KLIETX2yzOq25dozaFaggScqNTqhUdtQFPegOBVUMEXbMrO7nu
	 +edjyIvwsmKh2FhoMZPhUvKA+b9B9OBJvdDjrk/ZlyYKqx+Xs827vsXbBCzfblRHxMU7V
	 EWVly8Gt8w/4PY72GOYIMEaYMnO0YALI7sKmUgpcdM7kBQnfifraUy7V6JrOdOi+wjO1e
	 f88IVmpcKkxHIqMySKQVt37Qys+4iT8y7vvCkqsiWspCfhnUESDYgYV+pESmjLIDoMPeM
	 xy65MgfgrZg5Obkl3tVzCs4qg4mx9tgqLYN7PyS5s0+CtgCxNeO9DlsKTX9KDh/liAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973564;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=SI4s9n4IQSH6pJV54/q+Dr9ckre7mYuvpmmu3mka8pk=;
	b=AgAIm2vk/9CH4VpxdkpMqzd7zGFszBbMub9nG4LChrGxmFEdgThWgmPBriQqIDdbMaGb
	 GtQqVPmKMdkJnpJggsQRmRA55rGU4bUHtEaEpTR9DqQaq/lvRDY84REVHjTZfor/lCWG4
	 Q0oxRlZhBOHSeWCn4Cjsc/mmCn1R323cgm+24j6SXgVRqzIw4wWWptjHQqDjrU7mtLI9b
	 usHCmmXk+Ud6ib6SgqJAVb0OaI7dDExkA09Easfeq+z3MPv3/YesE99avYgvv6rC/rIdm
	 YGzV2csn465HAxSUKn1A9/R+Zo2V0/dxxx/psz/ILwzUplh0zhub5zgfu7tPHSdG0QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=hpNAVvB7;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F4C606A33D;
	Fri,  6 Nov 2026 13:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0F4C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=hpNAVvB7
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261106135921euoutp0186fb68fb0a152892b89d78ca811b6bf2~leXMBWoas0206502065euoutp01R;
	Fri,  6 Nov 2026 13:59:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261106135921euoutp0186fb68fb0a152892b89d78ca811b6bf2~leXMBWoas0206502065euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793973561;
	bh=SI4s9n4IQSH6pJV54/q+Dr9ckre7mYuvpmmu3mka8pk=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=hpNAVvB7IncKVnEmHT6u81TTS91bYQgKeccLMwJIaBFFDRHqKUTxUsHPJXzrNk/bs
	 ny2Mb+Z+oe9j1+qNGSC3XBEk0VO1QKmqGK/1SNLBZ2eLi/yVkLa5Xd7noE16vK06He
	 urZSmy+6+ordZNqx42sJ7broC4qjAZrP3Uz4CH3k=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135921eucas1p1193f0f620b8b86512ea678919f664194~leXLvIttb2282222822eucas1p1g;
	Fri,  6 Nov 2026 13:59:21 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135918eusmtip11eab69e4647ae812a2dae38d46f116fd~leXJtD9NI0076100761eusmtip1R;
	Fri,  6 Nov 2026 13:59:18 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 14:58:50 +0100
Subject: [PATCH v7 16/19] soc: starfive: Add jh7110-vout-subsystem driver
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-jh7110-clean-send-v7-16-68f7ea9913db@samsung.com>
In-Reply-To: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Andrzej Hajda
	<andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Philipp Zabel
	<p.zabel@pengutronix.de>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>,  Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>,  Conor Dooley <conor@kernel.org>, William Qiu
	<william.qiu@starfivetech.com>,  Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,  Manivannan Sadhasivam <mani@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>,  Byron Stanoszek <gandalf@winds.org>,
	OOHehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5628;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=Nm3r4ZNvtsdEVGrIuXeaQ8bzceGWdJ+TGzMMXcQmX0M=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9vSu+OXTJ7uB7D3l91gs62p+e6+28tOvhPm0/TVMHz
	dXb53yJ7ShlYRDjYJAVU2Q5uzHaSPIfw9Py449/wcxhZQIZwsDFKQATmXGfkWFH9DH35YteH3j6
	54D59HmztW81/NmZoiTYeSIxNj1O+cQsRobbXPyFai6lt5s+aZrxxF37X8P2viI3fkVTnc7eQ/t
	3fOMGAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106135921eucas1p1193f0f620b8b86512ea678919f664194
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106135921eucas1p1193f0f620b8b86512ea678919f664194
X-EPHeader: CA
X-CMS-RootMailID: 20261106135921eucas1p1193f0f620b8b86512ea678919f664194
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
	<CGME20261106135921eucas1p1193f0f620b8b86512ea678919f664194@eucas1p1.samsung.com>

Nothing in the video output subsystem can reach its own registers until
the NoC display bus clock and reset are up and PD_VOUT is powered, and
those are shared by every device in the region. Leaving them to whichever
consumer probes first works by accident and stops working as soon as the
probe order changes.

Add a driver for the subsystem node that takes the bus clock and reset,
holds a runtime PM reference so genpd keeps PD_VOUT powered, and then
populates its children. All three are released only once the last child
is gone.

Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: OOHehir <oo.hehir@gmail.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/soc/starfive/Kconfig                 | 16 ++++++
 drivers/soc/starfive/Makefile                |  1 +
 drivers/soc/starfive/jh7110-vout-subsystem.c | 82 ++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+)

diff --git a/drivers/soc/starfive/Kconfig b/drivers/soc/starfive/Kconfig
index e19994a212d4af49eaed595bab6fecc19677b2b3..d57480c42f2b6b06142b591e6ccef4909aced978 100644
--- a/drivers/soc/starfive/Kconfig
+++ b/drivers/soc/starfive/Kconfig
@@ -21,4 +21,20 @@ config SOC_STARFIVE_JH7110_HDMI_SUBSYSTEM
 	  for the "PHY" and the "controller", which have their own clocks
 	  and roles but share the register space.
 
+config SOC_STARFIVE_JH7110_VOUT_SUBSYSTEM
+	tristate "StarFive JH7110 video output subsystem driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PM
+	help
+	  This option enables the parent driver for the StarFive JH7110
+	  video output subsystem, which the documentation calls dom_vout_top.
+
+	  The subsystem covers the DC8200 display controller, the HDMI
+	  transmitter, the video output clock generator and the video output
+	  system controller. They share one NoC port whose clock and reset
+	  gate access to the whole register region, and the region sits in
+	  the PD_VOUT power domain. This driver owns those resources and
+	  holds them for as long as any of its children exist.
+
 endmenu
diff --git a/drivers/soc/starfive/Makefile b/drivers/soc/starfive/Makefile
index 36fbb6f984986e4794ffb2c6c1485b6644efc4eb..3b8b8a6847f9021920a9af7296c49e1c45114c34 100644
--- a/drivers/soc/starfive/Makefile
+++ b/drivers/soc/starfive/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += socinfo/
 obj-$(CONFIG_SOC_STARFIVE_JH7110_HDMI_SUBSYSTEM) += jh7110-hdmi-subsystem.o
+obj-$(CONFIG_SOC_STARFIVE_JH7110_VOUT_SUBSYSTEM) += jh7110-vout-subsystem.o
diff --git a/drivers/soc/starfive/jh7110-vout-subsystem.c b/drivers/soc/starfive/jh7110-vout-subsystem.c
new file mode 100644
index 0000000000000000000000000000000000000000..af632692e2139d9d07edd478a299b170ad1b7104
--- /dev/null
+++ b/drivers/soc/starfive/jh7110-vout-subsystem.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the StarFive JH7110 video output subsystem
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ *
+ * The display hardware sits behind a single NoC port whose clock and reset
+ * gate access to every register in the region, inside the PD_VOUT power
+ * domain. Nothing below this node can reach its own registers until all three
+ * are up, so bring them up here and hold them for as long as any child device
+ * exists, rather than leaving them to whichever consumer happens to probe
+ * first.
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+static void jh7110_vout_subsys_pm_put(void *data)
+{
+	pm_runtime_put_sync(data);
+}
+
+static int jh7110_vout_subsys_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct reset_control *bus_rst;
+	struct clk *bus_clk;
+	int ret;
+
+	/*
+	 * Take a runtime PM reference for the lifetime of this device. genpd
+	 * only keeps PD_VOUT powered while something actually holds it, and
+	 * an unclocked or unpowered access to this region wedges the bus.
+	 */
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to power on PD_VOUT\n");
+
+	ret = devm_add_action_or_reset(dev, jh7110_vout_subsys_pm_put, dev);
+	if (ret)
+		return ret;
+
+	bus_clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(bus_clk))
+		return dev_err_probe(dev, PTR_ERR(bus_clk),
+				     "Failed to enable NoC bus clock\n");
+
+	bus_rst = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(bus_rst))
+		return dev_err_probe(dev, PTR_ERR(bus_rst),
+				     "Failed to deassert NoC bus reset\n");
+
+	return devm_of_platform_populate(dev);
+}
+
+static const struct of_device_id jh7110_vout_subsys_of_match[] = {
+	{ .compatible = "starfive,jh7110-vout-subsystem", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jh7110_vout_subsys_of_match);
+
+static struct platform_driver jh7110_vout_subsys_driver = {
+	.probe = jh7110_vout_subsys_probe,
+	.driver = {
+		.name = "jh7110-vout-subsystem",
+		.of_match_table = jh7110_vout_subsys_of_match,
+	},
+};
+module_platform_driver(jh7110_vout_subsys_driver);
+
+MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
+MODULE_DESCRIPTION("StarFive JH7110 video output subsystem driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

