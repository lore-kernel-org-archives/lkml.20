Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991483DAABE;
	Mon, 31 Aug 2026 23:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218057; cv=none; b=mFIAuhpxq9xnYkZB0JGPn8f60B4W57LYHYdR0a7FyKQ51wDtgtquJ7F4yLaObV7NOmO8M021LJEk8nSwXW3aClME8T+L3wAchtfyZtvPcCDwxJa3mmtH9L38lMVFhYf2cqlrq2adkYMuqjTF6XtxIcr8MY95ntvlD54/MphRH+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218057; c=relaxed/simple;
	bh=vCqRibqUw0ujaqjjMunaqG6UBr9RmM6P7zuT1Js6OyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZuZFvizWy9X7nrljpJbDJLpvaWbx83BHg3QKTYR7lNdhthKB6AMNLdLRasbAoZbZU++JDmTqgRG3BU35r9ZKFzzfeg1xo6J8macMoBTbGsS2JEMHOc3jcniVEZdA50ZlPMeVcYmg6T+FxMx5cgVHJLpu+KNRrDquzHQeS72Jts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=YgUWpuZG; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="YgUWpuZG"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8FB711C9C7;
	Tue, 01 Sep 2026 01:14:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788218049; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=G/4pCNbo+upZ0k4TXQBP77fIXcguXQOHsC6hBkuc0Xw=;
	b=YgUWpuZGHTshL6IDcQat5bRGu7CykG7AwTpDVquTxx4NpMuWvVnUwXx5+fKTPpjSbUNj65
	+C2Cz035Fxhmc95azaWcpGb9fQNmFQs34IuVPjNwE8w09xOAY1SkyjledBxBSiu6G6gyow
	sc+p9lHD6aI72xm0fEhB7eF9LUuLoB9nq3px97u9Zc438OOKiwbi+z7XNcPAzBuNmOpAhz
	AtLrz5E+ckVhbr3v53sh9QjKsHYdQ5TXsmR4msbNsLiUt9yEh20S7hES5eahy53ic0/kaT
	6YmGRv30Pqzz+LK7llHNpVz0vyw1VH7pIrKsseFiXtSK/ktazSgOG+wPnb2U0w==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 2/2] soc: st: Add STM32MP2 SYSCFG driver
Date: Tue,  1 Sep 2026 01:13:25 +0200
Message-ID: <20260831231359.136475-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831231359.136475-1-marex@nabladev.com>
References: <20260831231359.136475-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add trivial SYSCFG driver for ST STM32MP25xx, which binds drivers
to its subnodes. This is currently used to bind USB PHY drivers to
subnodes described in the SYSCFG DT node.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
V4: New patch
V5: No change
---
 drivers/soc/Kconfig              |  1 +
 drivers/soc/Makefile             |  1 +
 drivers/soc/st/Kconfig           | 12 ++++++++++++
 drivers/soc/st/Makefile          |  1 +
 drivers/soc/st/stm32mp2-syscfg.c | 33 ++++++++++++++++++++++++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 drivers/soc/st/Kconfig
 create mode 100644 drivers/soc/st/Makefile
 create mode 100644 drivers/soc/st/stm32mp2-syscfg.c

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index a2d65adffb805..dfe5cec592626 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -24,6 +24,7 @@ source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
 source "drivers/soc/samsung/Kconfig"
 source "drivers/soc/sophgo/Kconfig"
+source "drivers/soc/st/Kconfig"
 source "drivers/soc/sunxi/Kconfig"
 source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index c9e689080ceb7..894bd6ebaaa4d 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -30,6 +30,7 @@ obj-y				+= renesas/
 obj-y				+= rockchip/
 obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
 obj-y				+= sophgo/
+obj-y				+= st/
 obj-y				+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
diff --git a/drivers/soc/st/Kconfig b/drivers/soc/st/Kconfig
new file mode 100644
index 0000000000000..2a9d6a77be450
--- /dev/null
+++ b/drivers/soc/st/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "ST SoC drivers"
+
+config SOC_STM32MP2
+	tristate "STM32MP2 SoC family support"
+	depends on ARCH_STM32 || COMPILE_TEST
+	default ARCH_STM32 && ARM64
+	select SOC_BUS
+	help
+	  If you say yes here, you get support for the ST STM32MP2 family
+
+endmenu
diff --git a/drivers/soc/st/Makefile b/drivers/soc/st/Makefile
new file mode 100644
index 0000000000000..5ca313476ca93
--- /dev/null
+++ b/drivers/soc/st/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_SOC_STM32MP2) += stm32mp2-syscfg.o
diff --git a/drivers/soc/st/stm32mp2-syscfg.c b/drivers/soc/st/stm32mp2-syscfg.c
new file mode 100644
index 0000000000000..102430f258606
--- /dev/null
+++ b/drivers/soc/st/stm32mp2-syscfg.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+static int stm32mp2_syscfg_probe(struct platform_device *pdev)
+{
+	return devm_of_platform_populate(&pdev->dev);
+}
+
+static const struct of_device_id stm32mp2_syscfg_ids[] = {
+	{ .compatible = "st,stm32mp23-syscfg" },
+	{ .compatible = "st,stm32mp25-syscfg" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, stm32mp2_syscfg_ids);
+
+static struct platform_driver stm32mp2_syscfg_driver = {
+	.driver = {
+		.name	= "stm32mp2_syscfg",
+		.of_match_table = stm32mp2_syscfg_ids,
+	},
+	.probe = stm32mp2_syscfg_probe,
+};
+module_platform_driver(stm32mp2_syscfg_driver);
+
+MODULE_AUTHOR("Marek Vasut <marex@nabladev.com>");
+MODULE_DESCRIPTION("ST STM32MP2 SYSCFG driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

