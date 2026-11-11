Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423888;
	b=G4RnHtGoHwiORqeQyokEKJgKK1EUUEYoA3MxAWjLcj9cgbj/yyKhb+5GT/1W/0DXrIDB
	 e2ZAdZC1JEaSpAOhM96CbsL6k58xES56VsGwo7Ec5SubkpLa1hJh0A1I1EF/U9fFBlBSi
	 Qye0E8lGMO0BUbM7ThjRGloaX7a9hzVpQvAKDc0WTF5G2ecIZBDHutGPeuoLrmdZ3E1mH
	 6SsdJVM2VciHqLKuViRHjvrV8thjgvsWhjCtFkQ9EGlWr08c4DzX6jlmw4bT6xFzjpMTb
	 WnD/JB/JPfCyDPdQvC8XufkqQ6cU5no1AazL0csRZn3JlvajnqMq7QSdvzFOegJZ6ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=PrbRgt2I4AZhKGeB3X2rrcoDbn6hGDT1j9aliR6cklU=;
	b=t9AdON+P7iR/W13iXAJugZE0M5YJumBmQeyb89IQ4Uz0Qw4At94ss7LRmkQR6AZR2vuk
	 jCaqKbMSwGis+6kp0AFYFkQLd2ukZBFcgocwWF6IU29Zb9yQOT42SrstAzL9q2Fi0z5SW
	 8RGK0y4ZMIwYqBTDwd0UNRZ8GPPH7L4rcaHDjyTt4CQ4gxiij30O4BFMOmVKt2Nmkhnt+
	 mBzd4xpUQvcS/Xff8sGmkYz4ybiIbY0ICAXtQHtn7QAL+eJKCMy5E9y0ykZwRufVY1v2y
	 8GWGHS5NP+g+8aqHgDJC9uYB6/SUNyJYRy231xcqE/vQ0fXR8FPN/cIoMROdPb93t+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bSy8tQN7;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807F5606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807F5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bSy8tQN7
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso1783712a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423888; x=1795028688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrbRgt2I4AZhKGeB3X2rrcoDbn6hGDT1j9aliR6cklU=;
        b=bSy8tQN7lMH6LUKC03tCO9XXLZC7SwCdtU/aNs4KuyGXUricJwN7c+dE9F2DoJt0rf
         zfY/PI2D1jKkCnzT8BSDoKT48uSxWP3R1qqBQzrmu3ryJ1X0OJ0CvrOMlEuP/qejnejT
         NCsdL8JJQpu+HcvCVtqBR9M/XrzcODw9Nnv3GFEc+3CIR4QcRYhy6JVU/OA9R4ybE/if
         KFS6uY99TdSJI8Dhnq1gDSdX01ReJKIpv394hNIVbeyqy47T+glhoRD9LVUwCV316XTn
         jAJxopEYbrA4zI+VFGGJUlGwJ24STb7/JkGHXRb/AeB2ndnZz1X3Yj1KG2RN6sDNznnE
         C3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423888; x=1795028688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrbRgt2I4AZhKGeB3X2rrcoDbn6hGDT1j9aliR6cklU=;
        b=ZIySsyr6Ddjo0fY2MiaQWOXlXnOqqYgSo6Ds2SC0XxhGZ7XpDb2V2wBcDkBKRK+Mwe
         VN0kvl2tyAdhCpE7PaZREGLda90WgObU+P6gmQDt8ZucOaaBrFKU+4EpDssZ2NcUvsaH
         OMeDQYYWEnJexzyqlhiYXxivYpoA+KgmLic/EWqpPMY7TULeUKDtOHM884XK7guqoZ1D
         KC7mEJjCuwkQM/M4+jQVpE1B9EPgO79D4WqaV1K9F/52LZvdxZ7nVELIpE7OnrPyg8UW
         z72Vn0vFL5DTnrY+FY5Hus0X3yzQ5csX+NRQn7SJiGZKRktT7HzgrJlGqwfIO72GWXet
         xA5Q==
X-Forwarded-Encrypted: i=1; AL+hErH6K2T1FhelBSCoRRyA0/+v2wk5HxXCa7YtTM9+0VipEbu5sRgePq5JboJmt10uonr09zBbNQ//CMiN90E=@vger.kernel.org
X-Gm-Message-State: APuU4Z86oVTJjhlm3DQhrAtiadq+GtoHRIlTdgZi1FaDbbfaSacBaUfg
	QLjFwV8ShLB2CFI8s5LwD79S6KspCE6oTe7NOX1QyYIGSQCDXTvvmKRK
X-Gm-Gg: AYBFou0RUyDa7hae5483M7T4gpIyxja0u6P09dIYgs+KtOxWyjuthKEheutXIwBEvyA
	Lu4hgzka+stGrZkVqndqDM+KF+SazvI3o6tPi6ykVZqMoFl8VheZwE9MjNA5aPRrjIfaFmi8JmZ
	3KrBfe0n75sL7KmNI6je54LTKG+k3HM7jTpWA4dzIe85AgfNLTmCm6s/4GE9oVxLxkaYnVnpHo1
	/EQY4fo9V9rHc7p0maOIG1MaptAaRAxwjQRwWGe2YlZD/++zohijLnC7xlrduFrJ9YTyJulmkGZ
	Vgp+F4H/wgbPab6MH+ovXYmx+NgD/RFdcmqg/0qss4O+F56/90EtkjXP5qCamXbpu9UxRzJVsQr
	kdg85Q93ZFFYDqX72/dQDJjYQJWJWmruoJDthkDigpxb0pPrI6U4/N0uZgTxxjQuTmcF6fHnTd8
	X1BhbLK3X+wD7lreBlnfgtkmoaOi4732PoTttuI+H70nWf3RgzVhZMAL4GZ34Nmpzd07EzvCenI
	s7VCfVrpsmiriyBSqyShVds1jqwLXCcBMvUSL2Gefe0j9BqhQg9pROdbCDOn/DMX6WeyRUVoTKw
	+tAitBjSHpn+PHrdLncFUzaUzwoWdTwcYA==
X-Received: by 2002:a17:90a:e7d1:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b182e9415emr3094237a91.17.1794423887377;
        Wed, 11 Nov 2026 11:04:47 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:47 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:04:01 -0300
Subject: [PATCH v2 5/7] ARM: dts: imx6q-apalis: Add Toradex Resistive Touch
 Display 7" Parallel
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
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-5-8129b21634c7@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=3352;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=eN7DvQ1E51+JeMrXQEgkpfFssIEPFBdeHdO7BmoHJX8=;
 b=5NJeH5jEmlLAdlRZBAIQgCXVcpiyPOftIb6QuJlQMcDPSElxKYbFx8QwR5gx8VE0bQtiAujaK
 kWmjaDj5Pw0DtP8TD82axOS+f5Z3LVZwK804fkVYt9rjkG9d7uAUk++
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Apalis iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++++
 ...-apalis-tdx-panel-res-touch-7inch-parallel.dtso | 30 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index d7f9b2b5bb493..fc9a68cbdd313 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -172,6 +172,10 @@ imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-res-touch-7inch-parallel-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -330,6 +334,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo \
 	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo \
+	imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -342,6 +347,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-res-touch-7inch-parallel.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 0000000000000..be2164dcd0369
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtso
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector (as featured on Ixora carrier board and
+ * Apalis Evaluation Board). Touchscreen is available only on Apalis iMX6 v1.2.
+ *
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/resistive-touch-display
+ */
+
+/dts-v1/;
+/plugin/;
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhr";
+	power-supply = <&reg_3v3_sw>;
+
+	status = "okay";
+};

-- 
2.43.0

