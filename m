Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423878;
	b=k6vgtnRWgsOWOuTxICT0gFdNdc4GXb7Q6qdQViIst+8wN4xhDGGFvvDz4SLVTQ2ubrry
	 ltCOitnCAjH7UQcR+u858SgJNf+0LEj2dYEYoVDndrttblb+UwI35PdwPxbdwR6IdbFe9
	 eEp778hnCEMQQtdqnuOnm+a9oqsHC63TEKnQEH0rdHsgamog3Aa0U6i2pmhcteMDlw9oA
	 VwMhMVLMdpSJaOjdd9l1Ayp/W3R1XgMfATmtNNYhwZlDUxAfQj8V/U9konka0AdeVMuOt
	 1diZ5ka9FaSJCLVH0R60EclZKbfUArxZNJm8qZpztgS64R3Sz2pV9i4CVNeZ/lNU/6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lnltaZLRhP4fBsVvq0mCqASYDVlLQyGo5RH8flPD4Rg=;
	b=kOIINAEZz4gdNYVOHOG9n6KZHpHCPrOsQ2Mqeiy9CbskTil6cyHRuFlqKwqvbrqFeGsB
	 /FI3tIY3HPCy2bA/oBEfM7+KeGDx9cd9VLX1+yBOQqSfC3BiW9IQdVQ3mk5lNUSdymV7v
	 8wLgj1my3PrypeANZ9Wmm9QQmW9x123uBLHBfB5/UxabLf99NPnCDScF2la2phNcsESmV
	 WyKy0sn6iCEQ7YwIDR5jsztf3LeYdFeLxdVo4yPsVfQ6ZLirAPhrVdmwrvaJs/cbtl5Z9
	 X+qhggBaEZKnSLYlNQWMgSKSSPaZHlIshxHqNSYd+A3dPPWHVzGLTDXqKjTY1HjcTmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V6hkcPQo;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5B4606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A5B4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V6hkcPQo
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso1440516a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423877; x=1795028677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnltaZLRhP4fBsVvq0mCqASYDVlLQyGo5RH8flPD4Rg=;
        b=V6hkcPQo5LyG/Y2nRJhz5Lpn2o1sO9QbY4WKKWshBLWzDRY1dgOA2mJXSQ9K4jSpKp
         4VrYBUU9Ssx6TzSeG2v4EQe6oePrJILetALDLGIKpXDenxfoGKtKGiVhC67XoIWat3Ue
         O1zqDWAtzgKmwSEUp1TlW+Fu7uDrnX/F8a+FX2tqlQ6FYQOYwsJh5cYsuoD8SGFAVJW9
         kc7NXstW+6Fs6o35xY1jxycMFL8S5hrGGDJQAbFVybQpA6O7lfMj2DcG64G9QrailG6K
         +7PIY0jRGvuehaz3CBpDltrwIoVU1V1WsAVV181dtPGaMUnXok/H4nQdLlIymbVHDRZV
         W7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423877; x=1795028677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnltaZLRhP4fBsVvq0mCqASYDVlLQyGo5RH8flPD4Rg=;
        b=a8QQ/BCONs8unG2gQpaUZ98VOW9KjHCpJ5CawuG2R9nnIqGTcuIDovFibR5Ey46PIK
         bICVYJLdDAMiUtIrdfLsesc+F3Hvg11Eh3mtdynRO1Ty+AiChgm6XlmoBPFJjGEd0R63
         oGGsWx6kuZUukoWQyUQfwBNMWM6YEl0haX+KEma3RckiFV3Ms26O6SI3+1uFYDp4lEdU
         OBfjZZW/fphx81Ndr/7oZsp8NRtb94NJ7ys+ETiE3BzKox8IPfQ17eA3/6JqXhTM/Wow
         m/jEf+unjg8RzMmPBofamIaqwFp2oICREEcFsa25ZyKaWpBb0v0/5QI3PZhks0czcjPH
         ug8A==
X-Forwarded-Encrypted: i=1; AL+hErEW1+cy1diaXjTrmYlsm3FWeuu8e+/YDIeHPqfU82YT1AUZtAFlXyMQFMcedb0nulzw97gtcM/q3WJTGMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UesweeabR4dI+ttRrgmtI3ktPZVjQtDfu0e00rz8tHlHNG57x
	SjH8a9g/bJoaoRwFTbPnwwA8OgIdMcITewplW13BIbB7/Hw0WkFP31Ad
X-Gm-Gg: AYBFou1OfrMuQjriAqbuC4pvvT7goLzhzz8laxQUWlcRAYzsP3Vf2w0/H2qDoHHq0ok
	vYeiVfFsrNpE4PpNpOF6/lsSWXiitdeCV31/ZiYWOYR8GnVL5dxNWJuUxPyYJDn7WPGp33JBEvQ
	xtc9SWYIpXf5Kb4/CWyPX187AGH+Al5NLprBkUSDs228Iz1L3CZDV1E+fUJFBY+ZD6E4nhgqqNT
	rmIlvi54+ctYSwmJd18DTSj/jRXCyijmvvyj9rj0WF4DRxgUnmPJjO85yuV8rn2nBPW2Km45qCn
	ULY8Ohod5hkJv3zrVKzuC6xCh7GzEfNIF/4MzfjQz48TVp7CX6MkXoK1TxhvRVH3FmepHJxzMp8
	dIYsNR7+Oxm8PxSLmK3Y9tdYu1MKaT3+QvXGo8H8zSefJ1YNIX95k+vttFDaMmRQ21lQquT5PKV
	ElA+HKmN8t8b6RX+spkYn0iWfwm/UIalq67xw3noerrEPIss6Vle03W1JYiLbKm3rZIPdBthoJ3
	7hXM4NlLL8FX1atZulMwsgcZIIDqVHtg+tzRhhunHKM2yslwD0FW4bW5TdqUm7zz6Wx2vbMNfjl
	keKG/aXA/6FGgt3lr8WuIcZLHyo9UnbqtQ==
X-Received: by 2002:a17:90b:1f90:b0:3a7:e11c:4e6e with SMTP id 98e67ed59e1d1-3b182f5a142mr3250774a91.59.1794423876623;
        Wed, 11 Nov 2026 11:04:36 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:36 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:03:59 -0300
Subject: [PATCH v2 3/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive
 Touch Display 10.1" LVDS
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-3-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=4455;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=oe0gNHFEkUnU4DGWTju+MJg1QgwQQbBq6PPLVxbI5NU=;
 b=lhQ2QCeAMTxHxA6IWvu2h/Y6r9QtaPWxJFG8efc2jLx/HSL0wnuHil7uHqrWS5Po1Lq2DorDn
 CGVUtSIkP2MBnzpcQOF+hJQg3ZiifuRvsFb33h7G4Vrw2sWkihPB98K
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

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
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++
 ...-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 53 ++++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      | 13 ------
 3 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index cc0f5f100892f..3b69669b27129 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -164,6 +164,10 @@ imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx-hdmi.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -320,6 +324,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -330,6 +335,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso
new file mode 100644
index 0000000000000..a84114e1d3fba
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso
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
index af038ac472261..8f5a9ab1f20fa 100644
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
@@ -735,7 +723,6 @@ port@4 {
 			reg = <4>;
 
 			lvds0_out: endpoint {
-				remote-endpoint = <&lvds_panel_in>;
 			};
 		};
 	};

-- 
2.43.0

