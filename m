Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E7548A2DD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962594; cv=none; b=G9h3cWhxBJ/Sg9y5noh+7KwC/wVwohjRJO8CEsM1JGmqwwZJBZfrM8g3vMd9fCOJYi2BYtPUPCzdo6M6rK8qF5fOufG8H03j6fRrZc+lM6OJ1OtwAZuk8odWlOCewCt+5HXtf4OVtzArfeobYMTU8LMpqWFSg+poYH1dmVY7z6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962594; c=relaxed/simple;
	bh=ty/CqdGUTnQN4EHyguBSFCp1Dym2vNReK6yStSRaXWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8WmnClmSTi8cr+mfDt2TBuRhYl5QJywwYbdnKtNYU8CzkbDA9wjiC64IzYNQzKJVVipGtSi3fvAL0gkqtPL6FlRQOw/aiIzrEscv0xR8yiz/zrmFDMvCJDppjdYFpyfb0wbdMj7bfmKC1gz7e6Lj1QS38+ya1vMYiN797P4JG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4daaPCa; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4daaPCa"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b001cd92bso54019f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962587; x=1792567387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AvWz/TY0T7HCNOvJmAbyRi0N/T41F5Dpvz1qDuxVX8=;
        b=B4daaPCaMAu9UfmMuykSlkUyvn4xpuJEgF9MzfsBc1+mjRgKdDVGHZ0+isfnr4BBiw
         TmTD8ixhfWgqscJwO+liGEY3FNERZpeYvoGgRrq+w7eHpVwd9HcEKporDSOkFmv7b54b
         Xo7q6yEHkBBZwtOEphoOKhxozmeJwDhf3D0DwVgBgF2glt9J5C6agAols4q3FmZeSue7
         C6/goJIFz8VHGmjjhDREV4KbfVT9yZNkBZGKQ+xbyi0foHOkcvUf52YPLjlD4kP/pnz7
         PeoiIfrCjPY4ul5CaGsPo7wcO1NhwxxDcgGaBZn4ytcsmy4zGWvIEYapnm//bVdaWLAg
         SxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962587; x=1792567387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4AvWz/TY0T7HCNOvJmAbyRi0N/T41F5Dpvz1qDuxVX8=;
        b=QfX1qdmxspTSUYMMA7znH41RJjADPnp1dzIncS3h6gZsoJlMhFL7cnaqlT3HeYJIBb
         rYlS0qMWQSvO/1OMMvF5SrM8/OMPue3oGgzBbgn2qaaTRYrtgAVq16Io764JFAA+wxGN
         QOsqxpMxBOiGuqhPUe6/L5SHZ/ptwSzXKZgOwKdZvWqxPRJyg+v7mvbMBI0zBpfXgqQl
         +0nC30Z8AGHVbRgoirUjyZVEenvFKwP2U+qbXz0et01ZIsBRHaYsKMgGpkK7mMiQYPH2
         oETZDM6Lia/EN/APd2RZ51jpsTxZnodGESMvChfbAkK2+f4HQxGPMzU/djUJK26ht+Z5
         hfbw==
X-Forwarded-Encrypted: i=1; AKwUvBwqwmp+ku4RLwwPuVQKC4aYffxvyFaGfvDJBGdZeaG6ciJAidvNiGWD9pdjs+3e/qeVo0un7RMgSib1Zo4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQFaXAn6VxIdrXHD2sc7+qdqhptA0tnIF0Oz+rBcsfEpm34xcP
	dLrxLtJM5I8jYaKTezAtPjGDOknPcqCZOwnehizICpAiPdmjvglkaIyh
X-Gm-Gg: AYBFou1XoVcUMFSgApQVKD4hYLggWT430xPZY9nF0Wzca9aFPHchk/oN5l6/EE3YNMM
	7eU72xibl7F+eWwqML2ma59gUU4WWk1Y0TpggN0GIcKzWW7gBFmJhzOGH9UXpUY0dcFAa6hAI9Z
	0HbFPxfGuRWHYF7rpSaCo/W3Cv/qKEw1HIK9r209XBvs1etRDNnAhy/FKradTqXTcNk+fWXnNLN
	YaL+A9YrnXM+IX1IX0QGurFfTM11AUUHDATg7Asr5IolfucKFoxrqX2maop/FUMopJs2Mw/V7hG
	tCom2azjqIEjYUg9/O2dKXsv+VWXY1R0cpzffEfgbuch07Sd3KqZql/A5ZzSQtSu5X+fJDkYOe4
	rjX8b2mavkcPI7fGXYVR0HX/Gf1rFoggS92Y/tozlBirWUdx+VgpuiKhbKgPqjG4kKJz88V1KI2
	GzLjkgZZ8HxaGNe8Gx+02wEpHyd/Mqb9tG9QgmygFJ/6/GuGEt9uGf3DrBJUAto07n12G5qWCr5
	VT0jxEFjl1Cp9gnPRu5wXFJcw6CJfW5KTD/T3bgo2J9AFjd3Yh8LDBS19zRhbb8et5B25Y54Nu5
	U0qIH9OBGO7ozgjd6D0Bk5PK5EduQmj51r0y7ui8N5xs5bPi6i7tLTo2/sSv3A==
X-Received: by 2002:a05:6000:25c4:b0:48d:db43:4ba3 with SMTP id ffacd0b85a97d-48ddb434e27mr14396343f8f.2.1791962586518;
        Wed, 14 Oct 2026 00:23:06 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:06 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v2 13/24] PCI: dwc: Add ZTE ZX279128S host controller driver
Date: Wed, 14 Oct 2026 08:20:53 +0100
Message-ID: <20261014072109.1759502-14-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support the two Synopsys DesignWare PCIe host controllers of the
ZTE ZX279128S SoC. The driver manages the controller clocks via CCF,
asserts/deasserts resets via the Reset framework, and manages the
analog SerDes and PLL via the Generic PHY framework.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/pci/controller/dwc/Kconfig          |  13 +
 drivers/pci/controller/dwc/Makefile         |   1 +
 drivers/pci/controller/dwc/pcie-zx279128s.c | 273 ++++++++++++++++++++
 3 files changed, 287 insertions(+)
 create mode 100644 drivers/pci/controller/dwc/pcie-zx279128s.c

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index dcfbe7e229..3a4008be84 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -577,4 +577,17 @@ config PCIE_ULTRARISC
 	  By default, this symbol is enabled when ARCH_ULTRARISC is active,
 	  requiring no further configuration on that platform.
 
+config PCIE_ZX279128S
+	bool "ZTE zx279128s PCIe controller"
+	depends on ARCH_ZTE || COMPILE_TEST
+	depends on PCI_MSI
+	select GENERIC_PHY
+	select PCIE_DW_HOST
+	select RESET_CONTROLLER
+	help
+	  Say Y here to enable support for the two PCIe host controllers of
+	  the ZTE zx279128s SoC. They are based on the Synopsys DesignWare
+	  PCIe IP. On the ZTE ZXHN H3600 they connect the MT7915 Wi-Fi chip.
+	  The driver only supports legacy INTx interrupts.
+
 endmenu
diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
index d4f88cfc62..379198ebd6 100644
--- a/drivers/pci/controller/dwc/Makefile
+++ b/drivers/pci/controller/dwc/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_PCIE_TEGRA194) += pcie-tegra194.o
 obj-$(CONFIG_PCIE_UNIPHIER) += pcie-uniphier.o
 obj-$(CONFIG_PCIE_UNIPHIER_EP) += pcie-uniphier-ep.o
 obj-$(CONFIG_PCIE_VISCONTI_HOST) += pcie-visconti.o
+obj-$(CONFIG_PCIE_ZX279128S) += pcie-zx279128s.o
 obj-$(CONFIG_PCIE_RCAR_GEN4) += pcie-rcar-gen4.o
 obj-$(CONFIG_PCIE_SPACEMIT_K1) += pcie-spacemit-k1.o
 obj-$(CONFIG_PCIE_STM32_HOST) += pcie-stm32.o
diff --git a/drivers/pci/controller/dwc/pcie-zx279128s.c b/drivers/pci/controller/dwc/pcie-zx279128s.c
new file mode 100644
index 0000000000..592a7f7c4e
--- /dev/null
+++ b/drivers/pci/controller/dwc/pcie-zx279128s.c
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ZTE zx279128s PCIe host controller
+ *
+ * The SoC has two DesignWare PCIe controllers with one lane each. Their
+ * clocks, resets and PHYs are managed through the CCF, Reset and Generic PHY
+ * frameworks.
+ *
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/pci.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include "pcie-designware.h"
+
+/* Controller wrapper ("ctrl" registers) */
+#define CTRL_CFG		0x000
+#define CTRL_CFG_EN		BIT(5)
+#define CTRL_STATUS		0x0dc
+#define CTRL_STATUS_LTSSM	GENMASK(22, 17)
+#define CTRL_LTSSM_L0		0x11
+
+struct zx279128s_pcie {
+	struct dw_pcie pci;
+	void __iomem *ctrl;
+	struct clk *clk;
+	struct reset_control *rst;
+	struct phy *phy;
+	struct gpio_desc *reset;
+	struct gpio_desc *enable;
+};
+
+#define to_zx279128s_pcie(x)	container_of(x, struct zx279128s_pcie, pci)
+
+/* The board reset lines are shared by both controllers, see host_init */
+static DEFINE_MUTEX(zx279128s_board_lock);
+static bool zx279128s_board_released;
+
+/* Limit the link to 2.5 GT/s and retrain it, as the vendor firmware does */
+static void zx279128s_pcie_force_gen1(struct dw_pcie *pci)
+{
+	u8 cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u32 val;
+	u16 val16;
+
+	if (WARN_ON(!cap))
+		return;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	/*
+	 * With L0s/L1 enabled the H3600 endpoints stop responding, so do not
+	 * advertise those states or clock power management until their wakeup
+	 * sequence is understood.
+	 */
+	val = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCAP);
+	val &= ~(PCI_EXP_LNKCAP_SLS | PCI_EXP_LNKCAP_ASPMS |
+		 PCI_EXP_LNKCAP_CLKPM);
+	val |= PCI_EXP_LNKCAP_SLS_2_5GB;
+	dw_pcie_writel_dbi(pci, cap + PCI_EXP_LNKCAP, val);
+
+	val16 = dw_pcie_readw_dbi(pci, cap + PCI_EXP_LNKCTL2);
+	val16 &= ~PCI_EXP_LNKCTL2_TLS;
+	val16 |= PCI_EXP_LNKCTL2_TLS_2_5GT;
+	dw_pcie_writew_dbi(pci, cap + PCI_EXP_LNKCTL2, val16);
+
+	val16 = dw_pcie_readw_dbi(pci, cap + PCI_EXP_LNKCTL);
+	val16 &= ~(PCI_EXP_LNKCTL_ASPMC | PCI_EXP_LNKCTL_CLKREQ_EN);
+	dw_pcie_writew_dbi(pci, cap + PCI_EXP_LNKCTL, val16 | PCI_EXP_LNKCTL_RL);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
+static int zx279128s_pcie_host_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct zx279128s_pcie *pcie = to_zx279128s_pcie(pci);
+	int ret;
+
+	/*
+	 * The board lines reset a device that can sit behind both controllers
+	 * (the MT7915 of the H3600 uses both). The first controller to start
+	 * resets and releases it; the second must not reset it again.
+	 */
+	mutex_lock(&zx279128s_board_lock);
+	if (!zx279128s_board_released && (pcie->reset || pcie->enable)) {
+		ret = gpiod_direction_output(pcie->reset, 1);
+		if (ret)
+			goto err_unlock;
+		ret = gpiod_direction_output(pcie->enable, 0);
+		if (ret)
+			goto err_unlock;
+		msleep(100);
+		ret = gpiod_set_value_cansleep(pcie->reset, 0);
+		if (ret)
+			goto err_unlock;
+		ret = gpiod_set_value_cansleep(pcie->enable, 1);
+		if (ret)
+			goto err_unlock;
+		msleep(200);
+		zx279128s_board_released = true;
+	}
+
+	ret = phy_init(pcie->phy);
+	if (ret)
+		goto err_unlock;
+
+	ret = phy_power_on(pcie->phy);
+	if (ret)
+		goto err_phy_exit;
+
+	ret = reset_control_assert(pcie->rst);
+	if (ret)
+		goto err_phy_off;
+	fsleep(50);
+	ret = reset_control_deassert(pcie->rst);
+	if (ret)
+		goto err_phy_off;
+
+	mutex_unlock(&zx279128s_board_lock);
+
+	/* Enable the controller, which starts link training */
+	writel(readl(pcie->ctrl + CTRL_CFG) | CTRL_CFG_EN, pcie->ctrl + CTRL_CFG);
+
+	zx279128s_pcie_force_gen1(pci);
+
+	return 0;
+
+err_phy_off:
+	phy_power_off(pcie->phy);
+err_phy_exit:
+	phy_exit(pcie->phy);
+err_unlock:
+	mutex_unlock(&zx279128s_board_lock);
+	return dev_err_probe(pci->dev, ret, "failed to initialize PCIe\n");
+}
+
+static void zx279128s_pcie_host_deinit(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct zx279128s_pcie *pcie = to_zx279128s_pcie(pci);
+
+	mutex_lock(&zx279128s_board_lock);
+	reset_control_assert(pcie->rst);
+	phy_power_off(pcie->phy);
+	phy_exit(pcie->phy);
+	mutex_unlock(&zx279128s_board_lock);
+}
+
+/*
+ * The Wi-Fi on the H3600 uses legacy INTx interrupts. Providing msi_init
+ * keeps the DWC core from setting up its internal MSI controller, which has
+ * not been tested on this SoC.
+ */
+static int zx279128s_pcie_msi_init(struct dw_pcie_rp *pp)
+{
+	return 0;
+}
+
+static const struct dw_pcie_host_ops zx279128s_pcie_host_ops = {
+	.init = zx279128s_pcie_host_init,
+	.deinit = zx279128s_pcie_host_deinit,
+	.msi_init = zx279128s_pcie_msi_init,
+};
+
+static int zx279128s_pcie_start_link(struct dw_pcie *pci)
+{
+	zx279128s_pcie_force_gen1(pci);
+
+	return 0;
+}
+
+static bool zx279128s_pcie_link_up(struct dw_pcie *pci)
+{
+	struct zx279128s_pcie *pcie = to_zx279128s_pcie(pci);
+	u32 val = readl(pcie->ctrl + CTRL_STATUS);
+
+	return FIELD_GET(CTRL_STATUS_LTSSM, val) == CTRL_LTSSM_L0;
+}
+
+static const struct dw_pcie_ops zx279128s_pcie_ops = {
+	.link_up = zx279128s_pcie_link_up,
+	.start_link = zx279128s_pcie_start_link,
+};
+
+static int zx279128s_pcie_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct zx279128s_pcie *pcie;
+	struct resource *res;
+
+	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
+	if (!pcie)
+		return -ENOMEM;
+
+	pcie->pci.dev = dev;
+	pcie->pci.ops = &zx279128s_pcie_ops;
+	pcie->pci.pp.ops = &zx279128s_pcie_host_ops;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ctrl");
+	pcie->ctrl = devm_ioremap_resource(dev, res);
+	if (IS_ERR(pcie->ctrl))
+		return PTR_ERR(pcie->ctrl);
+
+	pcie->clk = devm_clk_get_enabled(dev, "pcie");
+	if (IS_ERR(pcie->clk))
+		return dev_err_probe(dev, PTR_ERR(pcie->clk),
+				     "failed to get pcie clock\n");
+
+	pcie->rst = devm_reset_control_get_exclusive(dev, "core");
+	if (IS_ERR(pcie->rst))
+		pcie->rst = devm_reset_control_get_exclusive(dev, "pcie");
+	if (IS_ERR(pcie->rst))
+		return dev_err_probe(dev, PTR_ERR(pcie->rst),
+				     "failed to get pcie reset\n");
+
+	pcie->phy = devm_phy_get(dev, "pcie");
+	if (IS_ERR(pcie->phy))
+		return dev_err_probe(dev, PTR_ERR(pcie->phy),
+				     "failed to get pcie phy\n");
+
+	/*
+	 * Optional board lines to reset and enable endpoints. If already
+	 * claimed by another controller, treat -EBUSY as already managed.
+	 */
+	pcie->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_ASIS);
+	if (IS_ERR(pcie->reset)) {
+		if (PTR_ERR(pcie->reset) == -EBUSY)
+			pcie->reset = NULL;
+		else
+			return dev_err_probe(dev, PTR_ERR(pcie->reset),
+					     "failed to get the reset GPIO\n");
+	}
+
+	pcie->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_ASIS);
+	if (IS_ERR(pcie->enable)) {
+		if (PTR_ERR(pcie->enable) == -EBUSY)
+			pcie->enable = NULL;
+		else
+			return dev_err_probe(dev, PTR_ERR(pcie->enable),
+					     "failed to get the enable GPIO\n");
+	}
+
+	return dw_pcie_host_init(&pcie->pci.pp);
+}
+
+static const struct of_device_id zx279128s_pcie_of_match[] = {
+	{ .compatible = "zte,zx279128s-pcie" },
+	{ }
+};
+
+static struct platform_driver zx279128s_pcie_driver = {
+	.probe = zx279128s_pcie_probe,
+	.driver = {
+		.name = "zx279128s-pcie",
+		.of_match_table = zx279128s_pcie_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(zx279128s_pcie_driver);
-- 
2.55.0

