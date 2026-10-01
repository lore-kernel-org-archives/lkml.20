Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3747047DF95
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870075; cv=none; b=ncOrg77D0BkIvF+oemIef8hoI3kIABJLMiczPwGRCIzibDFPXMRrxLMInJzncvuxcUZQWs9vwkBD8eBWB5VZKtQT7OlIhwB5ZUcWcQPVUZ4wa3HMzd4gEE2sdxHFulJgoCkVOMAEBMn4IaM64C/roim32xH9C5YjrcG4BErw+sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870075; c=relaxed/simple;
	bh=dHV1S0743ZWwIgXm5VDJrijPJE34+rYwyTI38JNTUhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7X7Ru035L3pL21WO1BmnbFDRKT07bnsceoNH0SXdbpFOVgPqsFLOa4pJobth9wUaof7glU8oGAmXipy+S73OfoNorK6yFjeR82UGlk1US0PA7LB4bC5/4Q2AkcLk4MQCZdSZ4tf+j9dP8lupnuUoByYhpNZ5Irc9Aw4EpWGeYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHzqv+VU; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHzqv+VU"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aef5d66c1so1930504f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870069; x=1791474869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5CGv0/6w5gVrsPF9zExhSI+JtnFir6oWba07h7nJSU=;
        b=HHzqv+VU0HDAXoZu14Mz/iYfR3we/1cTpNqGip+tuO1RRpyAxdQhwdVR7VdSruJifZ
         KkeYWFHtu8ZA3kBU/kgFXW+vSSVu0QAwgAdE/zIQOpavhFaulpuw6sN7jIdmaKWwI5JK
         dUvqM5HufJI/1jyUETGQu7yrgyTyeUZKJSsnNbjjxV42p4BW8IovUhmYcNBVW/cAzu/j
         ejG7cORYTvC4OqKLpdDHJdlr8Rh7ohH5BQWnM/V/W0otwLNZl6o4g8TPb+w4DK5lkvUe
         UiMmR0OQme5KSxI64joFdWQxmwCIFbyG2u15WE/ufXb87wEV7f5qR64UhbG4at/QFeIv
         ez2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870069; x=1791474869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5CGv0/6w5gVrsPF9zExhSI+JtnFir6oWba07h7nJSU=;
        b=ma1k4UPN+i1+9QdvVvCbR9761ZsH58Je3I6X+xV/ga9rt9NgTG4ygKC705jL7tp5Vc
         IuviGPh3ypSrbuTRt0OFgCdGbLkfhgyqdS0plL5pROLOB1XjNVh8EjQNGScNmTO+XDDP
         1a7UbiCgr+jgXZc1/ekwmVr/zWCrfbwClO0e3HDsCEBIG94Gqxf3OwqsDNyOTclqR/LH
         rXonh5oHibZtzQxJaOj2bEVbhqczBXH45ILVkRRzDGGC+SnBocw9TPWoPhpZeA+aNxyX
         EaR2rKqruDst/DPKv7lBKy995SEvOI89m24dfOF/d9oY8glS4S4FGom4fbUALHX9MdVP
         nhww==
X-Forwarded-Encrypted: i=1; AKwUvByiDtQcIvwGjpViIVH+NtXkeAljaBcarK3Gtd1mFms3SbBVddDu89dodyc+au9a2KbvEEYCxmFsCkx7mWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmzVXI0f+YBu6QCJ5DJd9RXyqv/Z/nTADGwrxwiOe5jShjbWJ3
	rm/lSj6ITx8c03+1ax/GXb7h58td8j0Vt85S/JJKzSEPQOfeF4IGUQcO
X-Gm-Gg: AYBFou3PM1HMFDwJeQy9vLbakonNWObYRxsifzh4TH+LmK+zuRxZEFop23XSQgBtuh5
	SVfdE3+nfY7Mv9aYfigu3K6+0qSZ4n2Hqdfb27i/DkeTeIUnZ8pvKN33pqAT8QRq9LHU2Vj+D3O
	MYF8aleyVCGwmKeyYYZkqX9hjAOdn5t+GCfti/WjIXrSLED057u+u8n/ZSajLmzi0u/ajmSdP8/
	87YFUnJd0UAMZbLmcdov8JZThaYhaqqaJBOWdhy6h1QMSfV1nhgVIvug87oRQuwbyX4+x4WvSoJ
	iFtovmwAzrS17VEU0KbciMM7beb8L9Al45/TGqP47BTQFDnYv+I/phlcS5q3kGgIAbhULsz6EBG
	OqVn3ox6pkZPYm1+rCQ+oLnWXuxfrtIJi1Y17zdPxK6DnBnBVm24lawRLY0epe93rJGkgsMfaRE
	ZqES/xm0sB6U4ZrR2jQ9Rt2HQlDZdLQ/Au1aIbglFfdIzlawIVVf5io66xIeGOoTQYwsLTjCh1M
	LTxRl2IEee7HmlRfu2rOkbIV7xZH2NEKtuqA5pDq2HEYCjqxRgCIOsHZ+W1tgOqSuZJY6SQId0b
X-Received: by 2002:a05:6000:41c6:b0:487:81c:6de with SMTP id ffacd0b85a97d-48b1271f670mr44164f8f.34.1790870069033;
        Thu, 01 Oct 2026 08:54:29 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:28 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 10.1" LVDS
Date: Thu,  1 Oct 2026 12:52:53 -0300
Message-ID: <20261001155412.3177428-4-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via the Apalis iMX6 LDB.

The panel is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the
touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Remove the panel-lvds node from the Apalis iMX6 dtsi, as it is an
external component that does not exist at the SoM level.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++
 ...6q-apalis-panel-cap-touch-10inch-lvds.dtso | 53 +++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 13 -----
 3 files changed, 59 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 32d77a59c4358..23fcc80d7f309 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -99,6 +99,10 @@ imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-hdmi.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -233,6 +237,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -243,6 +248,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 0000000000000..a84114e1d3fba
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Apalis iMX6 LDB
+ * on carrier boards with a Toradex standard LVDS display connector.
+ *
+ * https://docs.toradex.com/105952-10-1-inch-lvds-capacitive-touch-display-1280x800-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	panel-lvds {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3_sw>;
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+};
+
+&atmel_mxt_ts {
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	lvds-channel@0 {
+		reg = <0>;
+
+		status = "okay";
+	};
+};
+
+&lvds0_out {
+	remote-endpoint = <&lvds_panel_in>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index 5fcd7cdb7001f..e52b55a386f7a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -95,18 +95,6 @@ lcd_panel_in: endpoint {
 		};
 	};
 
-	panel_lvds: panel-lvds {
-		compatible = "panel-lvds";
-		backlight = <&backlight>;
-		status = "disabled";
-
-		port {
-			lvds_panel_in: endpoint {
-				remote-endpoint = <&lvds0_out>;
-			};
-		};
-	};
-
 	poweroff {
 		compatible = "regulator-poweroff";
 		cpu-supply = <&vgen2_reg>;
@@ -738,7 +726,6 @@ port@4 {
 			reg = <4>;
 
 			lvds0_out: endpoint {
-				remote-endpoint = <&lvds_panel_in>;
 			};
 		};
 	};
