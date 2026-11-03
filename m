Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735065;
	b=y8CRFiZY0+iGFvDfKxVbSS1N4Pbpa7hLd1ySh8NdGRC0bBsaLLIQ7OL9FC6CwZueSmDo
	 9a+CIZUmZBwWITvPbPIwGmweHnfNu3xkmk2yKqDVYfmyeY+svqZ+1P7L9PgG+wsM4roHo
	 mT5rSMt4UE6ejKwDtd8NpjXSP0DuaBufrYJv0RFhsHSV0s8KxhsRKFRVa57OFFkSll+XH
	 df93LphvnsGrQX54ksvxrhcIv9KnKPguQfoc2CB9nn/ej0m6pr+hArKKusmY1T3q9YKdc
	 +wkmGQMqhl0FwllX/28nG5gt8eHV5Fm5qVoMtRwlP+PeC1/H++c5qWDdDiU9xL59/2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BPBXAYTXYbMEy8QV6jnqhXPs04AFPqS/cjIJVil8Sr8=;
	b=J6KC9ov4EvXUQ6KW5sMW2zA54CXdpt+ANhazXREX7m84TkuuySDDoG63fMXFA+j1kIoj
	 6jT5DpHLhIwOiskUygKmOEjdsezmrDbGbe2FG10F2Oz8IEu7X8T1YVhmyVZO/T1xSqnjj
	 WtDTPBNHuo36ZOZzKG2AqubvfiHr+cQqBGCs5ASs4pM7NctToLEJ2uh9OB69Fkwj2Ft95
	 1ltoC0W2dZ5URi8IoiDU9n77wYxpQGuBvz1yn0Lck7f71IU7InRXXXRgNDuySWU2R+KPX
	 MwkrB+lGw0aBlUtDRGjD53xXwFXtHNps+84LjyAQSUR1Sc0f261cbMxIIKBuRpswOOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IW8J4INq;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D97C606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D97C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IW8J4INq
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e0d885929so3686097f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735063; x=1794339863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPBXAYTXYbMEy8QV6jnqhXPs04AFPqS/cjIJVil8Sr8=;
        b=IW8J4INqEGAdY8hNt3SIZADC368TOfaj6kW9Z1AUeNH1NGvtLmaMfggT2mUov8LyfL
         VjamePxOIt20UAQDfSDKKCQddTucqQr6+FX+WwGfULV/wmeZfmul5qH/SfWCtgZu5aY4
         HfyQPmqXpphbD5hO3XoEnw2ILIss+qmkIWhsKStnFCjXMOaRUZ0FUZn2ICa0lEZCvgLH
         dnnyIJnnKTUwldfciGQfwUzo/EbWQFDM93mFnkgCj3g7OlzrGU1FXv+gxYIEMlc6K+gx
         ecVpKdK+Ny1Nmv/5EwrFnGIPyg0XpQ5zxxlWwlW70BnMlhoZSe0aFQ4U3Wn8YjDbrzem
         39oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735063; x=1794339863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPBXAYTXYbMEy8QV6jnqhXPs04AFPqS/cjIJVil8Sr8=;
        b=TZqPj8MgqZMeEdYpkzNHfGsXPco7qiTte/gJaAaLYXLXahz5PvwMLSRJJUhX5yAWd6
         AwgoMBV8DEPMmdHRbba+YE8RzWrpueU/nhjhH9vA3h0v5SWwbu5mS0pkNq9pankqn48N
         le0mq6xnA6zXglh7tFoM+n+/VqUy10JB4NhnRycgMZnRLegEJdPRvB2XvKEuSOFxAA1B
         xECfaIwaabXVO25T3IZHqdHrtiGlPWcVzWK1+VZrE3h5czZ0xFinGYqu0f6wkVoSbnMA
         2Be/jcDxLtdtHoSMpNHYf4iyQO9zhg0V263dUoCjM160ToS0oJLc36bEqwacqzPX5U9g
         a+xg==
X-Forwarded-Encrypted: i=1; AKwUvBxTSUNgG4UEBT04JiPcYAFRO/pEjIiOUzybqi4ILxkASs2WnoXYVGhiV0zHEHfLxwLi2QnGKU3lMaQMFGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cvYu5/VtIOieWoFopOUn/Xn+d/h/m47WoYL095KGSn4gRqbIf
	Afn2yViX7FAIUxtW4mMgjbyPl/i4tF4JYNs8CnuZ/eURqdyK8nGUHC7p
X-Gm-Gg: AYBFou2V+BkHcPE6YQ5b/Cbdtu6uzWeEhC38Mr4qCllzJmqmPwrnXMxrVU8FUZS4gs/
	euX6WOl/0EbA2KO3gVs/Q9W4g4XKGbhsPH83IPeG/Zl9axstaGd9CYw14HhH9h9Apnh8a7XvCE9
	FI3khNLw/RHMw1Hovt9dFuU4dmczqEmZncPjBJO67XFnw47WswakGXps6UDFBeQCG0J/w55toth
	Cp3RLKYlGAMbjNy1ZFwTLmU0NJNAFOquIhEDSmMXMV9hRlgIUktcaXCLltl482mnMsbFzpMQXrt
	n3ZoZZHLj+IsC8xK42H44eRoRkfPqSB00CfNj7G75qZNYu5PtrW8+hMVx0kFlMgbRLu5darN7EC
	uI5qm/N1syoi1lZPbwO9WmFuQeeC4pHML7Ea338/lyEiX4zrBZgG/wqxu62Apk69cWTIETSb8wQ
	JzykHO3tmb1FzV4Fkdh/KM2Wl/FaSsboLaB+s5Pcp1egSR+uC65fCtqDRgmEfYoJXCuobg7UE5V
	Ui+DFCJj6IrTX1dz+4V64h3wMs32qhGx0kh9kwwlPuB7N5rF4dSPIL0SBg7vo0Th1zTXXquQyLU
	HnerxGvxfpQR/cS3ePvETLRlm/nsQNxh8lmbkK4WXuzoKKSrAFD0zuIRj6QJE26OiPvyVetrZuP
	J5tDBHZ1Cv3CV63wvEPpv3D+3jDm5b/uYAg==
X-Received: by 2002:a05:600c:1d29:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4ac187a7678mr344557325e9.21.1793735062696;
        Tue, 03 Nov 2026 11:44:22 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a93232f0sm82557885e9.10.2026.11.03.11.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:44:22 -0800 (PST)
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
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v15 2/3] phy: move and rename Airoha PCIe PHY driver to dedicated directory
Date: Tue,  3 Nov 2026 20:44:07 +0100
Message-ID: <20261103194410.6632-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103194410.6632-1-ansuelsmth@gmail.com>
References: <20261103194410.6632-1-ansuelsmth@gmail.com>
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

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 MAINTAINERS                                         |  4 ++--
 drivers/phy/Kconfig                                 | 11 +----------
 drivers/phy/Makefile                                |  4 ++--
 drivers/phy/airoha/Kconfig                          | 13 +++++++++++++
 drivers/phy/airoha/Makefile                         |  3 +++
 .../phy-an7581-pcie-regs.h}                         |  0
 .../{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} |  6 +++---
 7 files changed, 24 insertions(+), 17 deletions(-)
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (100%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index a9c78e635764..d56142c8fefa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -785,8 +785,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
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
index 105fbe408aa2..4ac7475dccfa 100644
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
index c6dd02003bbe..dcc88a3cbaa7 100644
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
 					   aspeed/	\
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
similarity index 100%
rename from drivers/phy/phy-airoha-pcie-regs.h
rename to drivers/phy/airoha/phy-an7581-pcie-regs.h
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

