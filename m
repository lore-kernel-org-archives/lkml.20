Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094714477FF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752722; cv=none; b=NMR1/ehp9gd9HphOEzkNZSEq1L72RMv+wH1eioKLpuAPtpUMphvH7xkWP5a7ATTRjRgBUjCjRRandWd85z0ZvkcSSAGkeK7nI8Kyc1qpI/Is7+PysyguAP6OJa0CZlzhVDoeuv16A5lXVJtf5ztz3v2kOtbqxX2nFSD4Mfwm5K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752722; c=relaxed/simple;
	bh=/rJ9B/hgXkahECedK4+OpETFgP8OP0ShsZDq8JLOhB0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQpjot4+dLPzhtQ41Syi79I4SkZnfVW+o0HvfQMRUfQ0jpwEJC/LM4/Ft1MbI3W2jw8rZukj4zSWq+XEFmP6OhlIU6R4KFP9HmNoPCJueD/BjD9YfL5y6lJ7+FI1e8bhh95xkpaK41FBlpduAcKOsEgfSLT1c+Tx5ne62AGtPpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+5CVpFn; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+5CVpFn"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso23083995e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752718; x=1791357518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OBFy3gRg9djAHfzdZsNUfVoPCNaFFvApu+nxOmSEsi0=;
        b=m+5CVpFnmLycnqtlfFUWs69BncQret0I16Z13fBRqFCKse+eOlw70pDh3uIYoHcPNW
         a8fPSm1v2BM/ePfT9fHQSD+Kxi1MbvoJTJFTli4PdN7i509gteWWvgS7YsiwHAL4i1R8
         JwH8uzrLojjef3/Ka8brCMVXCYgP6U6fWxE6oAUVLcUUQzhMTuSGlHf0MHWLWsQjTLLb
         qMNsXzWRnwd+gAZI8u360GCPDC8UfTdmHDuIdkLLv+zW0LJYMVs4I4/z7/JWdpg9U915
         0AgRSzMHwfeEdbdG7XBTNorJKQ7+FTkrWH/6f/ds45HYKce365/YrqUWHePVS82JsXtN
         DkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752718; x=1791357518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OBFy3gRg9djAHfzdZsNUfVoPCNaFFvApu+nxOmSEsi0=;
        b=lhL8rjtDwiAIKAt02Qu5FePWNzbPgj9CrSTbrlPAB6QujSgkbNQnZ3qhtS7tfftaA/
         xdwJqLsF4jKHovxSMH4O6AHq8TKui0ln4UjLZyFPOVwk/gEW5VksXgOLb6gl+CZgFHuo
         9rcsY0lMlm9wN6ym+Dl4HNEjNt2zgglPZnKt2whVT1i81iVm4p6DeeG4d+8j+2sEflNB
         tmDLB4KBw8Ya8VRnjcxKT8t8pjcoBrH21YZ4CBfgumi3hcYD2FZMXuy/xTqrIP6S7iRU
         fI/g1546I/iJ5gR1+fTavX1hDmG68UckltCvfadm4Q8rsSxaBuHh3rWB2Y2Aw+9YP3Le
         B+Cw==
X-Forwarded-Encrypted: i=1; AKwUvBwpCybov+cmTv2pqpZZmR4oqM8hqKqjRqrwG2x7+Tin64Ru5W4v5U0K0qpsHZpM2i+6vfwchtiZPRZjx0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mrUJ0K2p2oUXDX7xwDY2mg0DHbaIMea6uuAnHfJcK8rrkzwPkt
	AqVvMAjq4I1HV5VWc4hyJ3ILyLoC35cRivy+jXgb+07Y3RxO+mLTDLhk
X-Gm-Gg: AYBFou12r3hdqGYc/P50uYxSoZDiDtJCKwQ6tZq9XUxjWMIh3bmIApcoN+dMfNrmHuB
	8Svts8+iZcO5y70x3ot7JlNSl5/odiRNoVi40UYyoQd0VssKfIwMu7xQ74HaYgx2onMjt/Wsu9D
	ra0k90NtpEx/KXJNEFZ1SczmD0LocIfmhJxt1qra8jZIRcuFe7w5TzLW8KS4P/th57wuv80wBZ0
	1wsr4oWrivOPUhgNVwIPacv9y/uzLVttsCi7JMno2k91nl1vLy8E16RFrmzIkbue9LKV6EBmfZq
	hOpjmXp2whjEUuYS0CAkRW1bMoKXSkbZLdqrIfCj6Oyr09nOjalJpML5iUt+uYmUipkR6gw26zJ
	HrqNiUyJj5CagwJ+wljkENVKdsDgTHlx8ABG+sq2Hf0HFSdmwEpApsO4rMQjSnfuME+QycJkG42
	AVNMZLAdr5XxcmuoyX/RDNC6THQsUTFYfYjdt7cWHZqo8i+P7B4BnMOEkgnv0BJ9/jGbxlxujTa
	4Fp3wFrlkiJJP9PIpefeIdkNGygmlVHvuv2c0IgR2W8jpLwuF9Dd3rp+lSnmaiF
X-Received: by 2002:a05:600c:37c4:b0:49f:ce78:356b with SMTP id 5b1f17b1804b1-4a01b125598mr5076455e9.28.1790752718096;
        Wed, 30 Sep 2026 00:18:38 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e79e4sm10590905e9.2.2026.09.30.00.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:18:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 2/3] phy: move and rename Airoha PCIe PHY driver to dedicated directory
Date: Wed, 30 Sep 2026 09:18:18 +0200
Message-ID: <20260930071826.48811-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930071826.48811-1-ansuelsmth@gmail.com>
References: <20260930071826.48811-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To keep the generic PHY directory tidy, move the PCIe PHY driver for
Airoha AN7581 SoC to a dedicated directory.

Also rename the driver and add the relevant SoC name to the .c and .h
file in preparation for support of PCIe and USB PHY driver for Airoha
AN7583 SoC that use a completely different implementation and
calibration for PHYs and will have their own dedicated drivers.

The rename permits to better identify the specific usage of the driver
in the future once the airoha PHY directory will have multiple driver
for multiple SoC.

The config is changed from PHY_AIROHA_PCIE to PHY_AIROHA_AN7581_PCIE.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 MAINTAINERS                                         |  4 ++--
 drivers/phy/Kconfig                                 | 11 +----------
 drivers/phy/Makefile                                |  4 ++--
 drivers/phy/airoha/Kconfig                          | 13 +++++++++++++
 drivers/phy/airoha/Makefile                         |  3 +++
 .../phy-an7581-pcie-regs.h}                         |  2 +-
 .../{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} |  6 +++---
 7 files changed, 25 insertions(+), 18 deletions(-)
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (99%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b9946c532af..d2f2a491f3c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -765,8 +765,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
-F:	drivers/phy/phy-airoha-pcie-regs.h
-F:	drivers/phy/phy-airoha-pcie.c
+F:	drivers/phy/airoha/phy-an7581-pcie-regs.h
+F:	drivers/phy/airoha/phy-an7581-pcie.c
 
 AIROHA SOUND DRIVER
 M:	Christian Marangi <ansuelsmth@gmail.com>
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 19f3b7d12b7d..e93951a4a898 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -46,16 +46,6 @@ config GENERIC_PHY_MIPI_DPHY
 	  Provides a number of helpers a core functions for MIPI D-PHY
 	  drivers to us.
 
-config PHY_AIROHA_PCIE
-	tristate "Airoha PCIe-PHY Driver"
-	depends on ARCH_AIROHA || COMPILE_TEST
-	depends on OF
-	select GENERIC_PHY
-	help
-	  Say Y here to add support for Airoha PCIe PHY driver.
-	  This driver create the basic PHY instance and provides initialize
-	  callback for PCIe GEN3 port.
-
 config PHY_CAN_TRANSCEIVER
 	tristate "CAN transceiver PHY"
 	select GENERIC_PHY
@@ -168,6 +158,7 @@ config PHY_XGENE
 	help
 	  This option enables support for APM X-Gene SoC multi-purpose PHY.
 
+source "drivers/phy/airoha/Kconfig"
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/apple/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index d7aa516bcc49..4ca4a07963fc 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -7,7 +7,6 @@ obj-$(CONFIG_PHY_COMMON_PROPS)		+= phy-common-props.o
 obj-$(CONFIG_PHY_COMMON_PROPS_TEST)	+= phy-common-props-test.o
 obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
 obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
-obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
 obj-$(CONFIG_PHY_ECONET_PCIE)		+= phy-econet-pcie.o
 obj-$(CONFIG_PHY_EYEQ5_ETH)		+= phy-eyeq5-eth.o
@@ -20,7 +19,8 @@ obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 
-obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
+obj-$(CONFIG_GENERIC_PHY)		+= airoha/	\
+					   allwinner/	\
 					   amlogic/	\
 					   apple/	\
 					   axiado/	\
diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
new file mode 100644
index 000000000000..9a1b625a7701
--- /dev/null
+++ b/drivers/phy/airoha/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for Airoha devices
+#
+config PHY_AIROHA_AN7581_PCIE
+	tristate "Airoha AN7581 PCIe-PHY Driver"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Say Y here to add support for Airoha AN7581 PCIe PHY driver.
+	  This driver create the basic PHY instance and provides initialize
+	  callback for PCIe GEN3 port.
diff --git a/drivers/phy/airoha/Makefile b/drivers/phy/airoha/Makefile
new file mode 100644
index 000000000000..912f3e11a061
--- /dev/null
+++ b/drivers/phy/airoha/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_PHY_AIROHA_AN7581_PCIE)	+= phy-an7581-pcie.o
diff --git a/drivers/phy/phy-airoha-pcie-regs.h b/drivers/phy/airoha/phy-an7581-pcie-regs.h
similarity index 99%
rename from drivers/phy/phy-airoha-pcie-regs.h
rename to drivers/phy/airoha/phy-an7581-pcie-regs.h
index 58572c793722..b938a7b468fe 100644
--- a/drivers/phy/phy-airoha-pcie-regs.h
+++ b/drivers/phy/airoha/phy-an7581-pcie-regs.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2024 AIROHA Inc
  * Author: Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/phy/phy-airoha-pcie.c b/drivers/phy/airoha/phy-an7581-pcie.c
similarity index 99%
rename from drivers/phy/phy-airoha-pcie.c
rename to drivers/phy/airoha/phy-an7581-pcie.c
index 56e9ade8a9fd..81ddf0e7638b 100644
--- a/drivers/phy/phy-airoha-pcie.c
+++ b/drivers/phy/airoha/phy-an7581-pcie.c
@@ -13,7 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include "phy-airoha-pcie-regs.h"
+#include "phy-an7581-pcie-regs.h"
 
 #define LEQ_LEN_CTRL_MAX_VAL	7
 #define FREQ_LOCK_MAX_ATTEMPT	10
@@ -1279,12 +1279,12 @@ MODULE_DEVICE_TABLE(of, airoha_pcie_phy_of_match);
 static struct platform_driver airoha_pcie_phy_driver = {
 	.probe	= airoha_pcie_phy_probe,
 	.driver	= {
-		.name = "airoha-pcie-phy",
+		.name = "airoha-an7581-pcie-phy",
 		.of_match_table = airoha_pcie_phy_of_match,
 	},
 };
 module_platform_driver(airoha_pcie_phy_driver);
 
-MODULE_DESCRIPTION("Airoha PCIe PHY driver");
+MODULE_DESCRIPTION("Airoha AN7581 PCIe PHY driver");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_LICENSE("GPL");
-- 
2.55.0

