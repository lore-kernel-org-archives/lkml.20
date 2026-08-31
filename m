Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7404C3FD96B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180670; cv=none; b=rT8J1kCDHnSTTDafdBYvJ2Q3PzSL5myxmWUax7v4sPgGdN7je8AC/pIQ9rL5DjrqiBESDEe8h4gtvPaGkccwfP8NK3+6kbX5qDJUUQzSS3Z/JEJc0hhqdXpUgeL+VcuXp4b2R47UyLwvcztPhbCNMvv71sWQjo4tUY401mfYmtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180670; c=relaxed/simple;
	bh=3CxNYvAUBRPqwMubS7xpsiSsUND6qJEQtgEj5reaQEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AK7bo7wUfo/Xh2HE/IWojb9ZYKiSWCV4WNnmQAmCwlKE2cqJKGOhO9So/N5+GJCuK9ugNz7tOdXgOo3l7jnea6EjdhaV2qvD7Za4QjumzeoI5fxb3WxyNLR8zmKfErhgqbblKJxgHZQ3aVXY/i1jwbXGDfjQOp8Wc7lnGiQy5ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5WEK1u1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5WEK1u1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so24336965e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180666; x=1788785466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54UdIJE+Sg5ieJ87p6AzFA6ZHammhS3SqsQJJruqOd0=;
        b=V5WEK1u1YOPMKNApymf/jDBaAiicdUAY4262b5p3of7KFvXShI7wuCgGcVuuuq+JRb
         AVo0qGTY7L5A+wdJDpaJiMDAtWkv2bH9qKBnDSV+sjsyyjqUm6wr+u3fBunHA0x4du0e
         1DLbLpo3rJU8+2yJbCjXxUbNx4ugtnlE0syF8RSEHJZru9V4swJlZ4G1yS4mK4u60U9g
         ksf9pohnvV7vDLanFhBOxrz0tMVgOcL3wxdmPsSTjk7xOP0z/DwyW1FQqM0ItMNYafHN
         2x0qczIOxjv67ocYWh6fh36QVCbRTuJiiJ+Co0KBQ4lpQSeLE+HpssKiMgXrw2VBkPPZ
         JDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180666; x=1788785466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=54UdIJE+Sg5ieJ87p6AzFA6ZHammhS3SqsQJJruqOd0=;
        b=jN683i9i/MYcB/EYO9rsOKJgvD/8thbzqpateaJqxnuMe/3kntQHqQd/5jQiv+I0wd
         5iBJCVNiA+lylWkXizX3yB64Y12GdVWvr09eBtgkWQuz3tS8aNWGBXRZakad/tnKDpD5
         ghp8mmnYBltqfZ902oKf4A0gfwXCS/NriAvAZMgsPzG0h5dKE+F8JHD/3/I0Wvvbq9yN
         KjuHOCg5xrLdLlC949f3XemScSv3Q3sXABMwnQfRds0vE/zjDIUmgr8VM8q2nRVbKeUE
         41GekIXobrtEE2Y5Zk3WrXYxC01H8DxuGlvkbuIY351iDHTraUUONDPPf4+zHd4OaPBc
         x97g==
X-Forwarded-Encrypted: i=1; AHgh+RroBaQ5vhlLmwVCWto/b5gSY5u9CWIJzaXMjTR6dmZdWJ69U+D8Rs2oD7/2xC0A7xKcMxpDEKrgeICG7ww=@vger.kernel.org
X-Gm-Message-State: AFuF++naAdkqapY1v5GqkuderfbFw0iz0nKvRHYf2pm04RDzFTwzRiWN
	jYhrLKV61BankCz66nkX3jGnoJUVm+KH0cDodYGX4Q2pEdIh9L5U1CuI
X-Gm-Gg: AR+sD13CZiUE0D1+fmfZn5fGcINiAvZiZ6XsW0dQ0yZ6zwKv7XMg9TZA2bO9uXMhZr2
	J8e5VzKRJ2nQyge17BrFOfWRdFjHEqSuXkNfunALiqbDU2kpcs9CLGjWujzdMGIK18CSTHfiycC
	lPAWJpEG6T6ghs5fRei9pbBLF7mooMw5H7CS8xsMhxS5dK4093hcl8wBHiotZ5InaQrnYQxxfWK
	u+fFsRIbnMLh4/TzEiAQQRuBQG/gTDO1nRVdNtCIBT75Wft34qeg+TeLZ8DyXph3vZ0oSQo9cHo
	p4FrBLyBwiAH9rtEjKCOFkDlzgl0nxDmGghN+EaFp9oUBNlMD+MlFXvbmu4jDVF45dSNdfTDU1s
	VHjUFuxyrN7N7FLKiyMqUxOhayzA9HUNAQlr6WGU/8FH3LbLHvLOTUMD3y+LkEBLS8X3ehXObY1
	MZ5NRXEIq6T6a5vmbvKm3w6cWq7D8RME7jYwdq3xizm45RbubSaJB8081qJaJ9gQ+ldtwBeNtt7
	hMdJ4y12OdexNxyNyGka/GEciXrZpObc3QB
X-Received: by 2002:a05:600d:8497:10b0:49c:dc11:2b62 with SMTP id 5b1f17b1804b1-49cdc112ba2mr13037255e9.7.1788180666180;
        Mon, 31 Aug 2026 05:51:06 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm116571225e9.13.2026.08.31.05.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:51:05 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v7 3/3] ARM: dts: imx7d: add Variscite MX7CustomBoard support
Date: Mon, 31 Aug 2026 14:50:25 +0200
Message-ID: <d1730ce19aa71d26e59a8ca9e383b0582906b43e.1788180142.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788180142.git.stefano.r@variscite.com>
References: <cover.1788180142.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite MX7CustomBoard carrier board
with the VAR-SOM-MX7 system on module.

This includes supported board configurations for both VAR-SOM-MX7
hardware revisions, with eMMC and NAND variants, and WM8731 variants
for the first hardware revision.

Also add the resulting DTBs to the i.MX7D device tree Makefile.

Link: https://www.variscite.com/carrier-boards/var-mx7customboard/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v6->v7:
 - Added common dtsi for wm8904 codec removing it from base dtsi

v5->v6:
 - 

v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - Fixed commit message
 - Fixed model names

 arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++++
 .../imx/imx7d-var-som-emmc-mx7customboard.dts | 23 ++++++++++++++++++
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts | 23 ++++++++++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts | 23 ++++++++++++++++++
 ...x7d-var-som-nand-wm8731-mx7customboard.dts | 23 ++++++++++++++++++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  | 24 +++++++++++++++++++
 .../imx7d-var-som-v2-nand-mx7customboard.dts  | 24 +++++++++++++++++++
 7 files changed, 146 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 1a2539fa19b4..37da667f9ffb 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -444,6 +444,12 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-sdb-reva.dtb \
 	imx7d-sdb-sht11.dtb \
 	imx7d-smegw01.dtb \
+	imx7d-var-som-emmc-mx7customboard.dtb \
+	imx7d-var-som-emmc-wm8731-mx7customboard.dtb \
+	imx7d-var-som-nand-mx7customboard.dtb \
+	imx7d-var-som-nand-wm8731-mx7customboard.dtb \
+	imx7d-var-som-v2-emmc-mx7customboard.dtb \
+	imx7d-var-som-v2-nand-mx7customboard.dtb \
 	imx7d-zii-rmu2.dtb \
 	imx7d-zii-rpu2.dtb \
 	imx7s-colibri-aster.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
new file mode 100644
index 000000000000..594ee2d2d23a
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with eMMC
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-emmc.dtsi"
+#include "imx7d-var-som-wm8904.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with eMMC & WM8904 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-emmc-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
new file mode 100644
index 000000000000..94c4b1fa5d6c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with eMMC and WM8731
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-emmc.dtsi"
+#include "imx7d-var-som-wm8731.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with eMMC & WM8731 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-emmc-wm8731-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
new file mode 100644
index 000000000000..d3fbf3b4b5a3
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with NAND
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-nand.dtsi"
+#include "imx7d-var-som-wm8904.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with NAND flash & WM8904 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-nand-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
new file mode 100644
index 000000000000..603b2dbf4c8e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with NAND and WM8731
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-nand.dtsi"
+#include "imx7d-var-som-wm8731.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with NAND flash & WM8731 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-nand-wm8731-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
new file mode 100644
index 000000000000..1c419251bedd
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 V2 with eMMC
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-v2.dtsi"
+#include "imx7d-var-som-emmc.dtsi"
+#include "imx7d-var-som-wm8904.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7-5G_V2 with eMMC & WM8904 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-v2-emmc-mx7customboard",
+		     "variscite,var-som-imx7d-v2",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
new file mode 100644
index 000000000000..68569111f3a3
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 V2 with NAND
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-v2.dtsi"
+#include "imx7d-var-som-nand.dtsi"
+#include "imx7d-var-som-wm8904.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7-5G_V2 with NAND flash & WM8904 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-v2-nand-mx7customboard",
+		     "variscite,var-som-imx7d-v2",
+		     "fsl,imx7d";
+};
-- 
2.47.3

