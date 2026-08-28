Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5714734CF;
	Fri, 28 Aug 2026 15:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929952; cv=none; b=XU4tpgQ8dKdVhv18B6yeAQUntfHFi2gktsQ26U6UF/Pdsgn8XnEqFp/fKwovMmMCyHH3m2nzo4s16P5sUnThdt4+Tx3lVNPGa7JD2YhsoVI2eKh/45b1WBRs4XHTxQw08d9xDdO/hI5SRNn/QAXD0O9rI7zXeKgruCneVgoHBSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929952; c=relaxed/simple;
	bh=EByrDwbZ7vbSPBBb7PMWP5ccutEXvOYe9iRF9doq8VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aWA3HkcB432uKP2iLNGFUeZ4liIzqNpMvB8u1sQUHuJXXTiK4FRzexGK+NDlwIPQSp1tTmeydyvOJ2NExRJyW/yU+xvCw6J2/Br4S9botguxz0fCtlWwmhNogodK8vlQ/dq6zPzXZEmp/J8SPiq0MOu3f/UX48QUO0EpJG9guTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Wwk7fU7L; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Wwk7fU7L"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D962E11D12B;
	Fri, 28 Aug 2026 17:12:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929944; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dyxVPRe7gA0YmUL0zoIVLzWkneqc4zMa83/hw+4DcV0=;
	b=Wwk7fU7LguQo8ewDDjKRagfTfYPLHCaqbMoT6KP3qy1NZwGY2DAXBxjC439dtiRVkMbtgO
	jX3SabyJ/yGvHZEgSxjS8F7JyA41c5DruInjz85DDzHnAYqq6ZlBvMBkXzLzbwMTHktg0O
	ncqGT30979CJww8dOtsk5O9hApqPJKwm6yY3yqX/UdtvFYAl3KyzeZTujDybf0RDu/gDs9
	K3WKlWPPwoM8kvNRRNqhexlprPq0WfU/UwcL6jYJsFCOPGWKE4F9U0IlBeL3NlcsYkzPZF
	HJ9iw08iRGdXL7YdTHaMYK30LBkDMWvmSTz1XEBXjzZrjKs2m1Vz1/SLMXQo+w==
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
Subject: [PATCH v4 2/2] soc: st: Add STM32MP2 SYSCFG driver
Date: Fri, 28 Aug 2026 17:11:15 +0200
Message-ID: <20260828151216.175020-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828151216.175020-1-marex@nabladev.com>
References: <20260828151216.175020-1-marex@nabladev.com>
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

