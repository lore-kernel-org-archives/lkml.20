Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218E6418A2D;
	Fri,  2 Oct 2026 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928873; cv=none; b=sX7kKjxfhGCJencU0Y2ntkz/Nmy8BOkcrEpWpD6M4wqw+oq670xFdTOqpiwxKrAc1UUffYiUYMtsZNaVaLwANkHHWrkyMqmzEJob+GKok3NxNLr9UpSpIc3WP2utB9caTv4W/Y3JgfLvBxx8Otgm6N+DbNNjlTWSYs0jQHgNuvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928873; c=relaxed/simple;
	bh=UASPh3cVrDmWHmDONbDeOlMYR1Yy8PNmnR8ytczc0b4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9jSbf8qyzT0tBRma0aSyY39Vv59Ci6lRZGEoQAcjXy31zTxBrag7a9IBh8SeUvWk/tGyQijQu2k2k2EVsA1IiePStJZNpHKVTohfte8dwNBR1xsjGpOxmAiIJ9Q2yaDe+GEjj+h8dY92MsBnlPmwTKq+X8O24eYn8weLSw99cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=dvHmJ71p; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="dvHmJ71p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=sG8CQcCWRtaNQErwW9LpzQptko3SCWKSnAzOYEFMvfw=; b=dvHmJ71pvhREuxcYouQCDn+VaW
	TvNUHTJSIzMtwKimeQ6DR7qJSRWTk4IUUhlwLfLS/0mZRYCexwweg8XOJM5wRWFBT474vqeEg3bCr
	rrmXRpAkB1wpCbNjB5VRwbcPn5HMYKQY5u9uFEnbCHZq5b0v/Zfm0pgDCQFYfpWfTS1BMfeV1CBAY
	SLjFZ9RR2Ebe6HJRi7FFSl9vEptUWqA7/4B4efxSW7BvtkvIvwuHzR1MOhecoNBfBgqDXo867R4qi
	/ZyTog9RU34CIeGH3mS7YIlowHHVRUvFbtDjh28HyXV+i7PP2tKssz9lC5pcVSTkIVu0/QsqVLw6P
	aW6iKVzA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPQ-0003O2-0O;
	Fri, 02 Oct 2026 10:14:24 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPQ-000FgI-05;
	Fri, 02 Oct 2026 10:14:23 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 5/8] ARM: dts: imx6ul: Add parallel display DT overlay for TQMa6ULx
Date: Fri,  2 Oct 2026 10:14:06 +0200
Message-ID: <20261002081417.2092471-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
References: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28141/Fri Oct  2 08:26:12 2026)

Both displays are attached on X4 and differ only in display settings.
Note: Due to hardware wiring a 24-Bit bus-width has to be used.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  4 ++
 .../imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtso  | 53 +++++++++++++++++++
 .../imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtso  | 53 +++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 08d88adce2b7e..3d34af776a5bb 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -421,11 +421,15 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ulz-bsh-smm-m2.dtb
 
 imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
+imx6ul-tqma6ul2-mba6ulx-cdtech-dc44-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo
+imx6ul-tqma6ul2-mba6ulx-cdtech-fc21-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtbo
 imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ull-tqma6ull2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ull-tqma6ull2l-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtb
+dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33.dtb
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtso b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtso
new file mode 100644
index 0000000000000..12bafa497067e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2018-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Markus Niebel
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&backlight {
+	pwms = <&pwm2 0 20000 0>;
+	brightness-levels = <0 2 4 8 16 32 64 128 255>;
+	default-brightness-level = <8>;
+	status = "okay";
+};
+
+&display {
+	compatible = "cdtech,s070swv29hg-dc44";
+	power-supply = <&reg_mba6ul_3v3>;
+	status = "okay";
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5406";
+		reg = <0x38>;
+		interrupt-parent = <&expander_in0>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		wake-gpios = <&expander_out0 1 GPIO_ACTIVE_HIGH>;
+		/* reset-gpios is controlled by stk reset */
+		gain = <20>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		iovcc-supply = <&reg_mba6ul_3v3>;
+		vcc-supply = <&reg_mba6ul_3v3>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&lcdif_out {
+	bus-width = <24>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtso b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtso
new file mode 100644
index 0000000000000..36a055d34c354
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2018-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Markus Niebel
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&backlight {
+	pwms = <&pwm2 0 20000 0>;
+	brightness-levels = <0 2 4 8 16 32 64 128 255>;
+	default-brightness-level = <8>;
+	status = "okay";
+};
+
+&display {
+	compatible = "cdtech,s070pws19hp-fc21";
+	power-supply = <&reg_mba6ul_3v3>;
+	status = "okay";
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5406";
+		reg = <0x38>;
+		interrupt-parent = <&expander_in0>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		wake-gpios = <&expander_out0 1 GPIO_ACTIVE_HIGH>;
+		/* reset-gpios is controlled by stk reset */
+		gain = <20>;
+		touchscreen-size-x = <1024>;
+		touchscreen-size-y = <600>;
+		iovcc-supply = <&reg_mba6ul_3v3>;
+		vcc-supply = <&reg_mba6ul_3v3>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&lcdif_out {
+	bus-width = <24>;
+};
-- 
2.55.0

