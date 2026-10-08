Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE753A3830;
	Thu,  8 Oct 2026 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450983; cv=pass; b=O9UASNscW9bhBpoIUUmKTDHwZdzHTLPSXoVt/icGua0RMSkFoZFEb9KWXp/5rotTX45LZLiJIsfaYq+EqYuBoM+3vuzznH5v1PGh8akIkOH0xnOQQk4a2jZuaIRKz8lDXnEGMkoY96B4EzVi4A5+TBDNDM7f5uccvDx5o8eOA3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450983; c=relaxed/simple;
	bh=oeNocdBtGSNtf4Oc8ZdgL9NyH9DsOP0rYtNm5SDKuuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sVCmj9KSDEx6542ptgfAOXmtUFHWNkMqnhUnE1NH6Kfm1aGp/5mS6mJ0qNqFk6r1lX37mQRAquKF5oCOKH7Ns5DL0wmyDWK7wBdZnmwYhN908pvrhso1Dr3oT3Zpl10SICK90shaPt7nh7VPkymuC89SrfnnrckGRJrvJvevHzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=Cv9Osw04; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="Cv9Osw04"
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:4b01:1e0e:d42d:4ec8:33b2])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A35A920236B;
	Thu, 08 Oct 2026 11:16:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791450969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UaplkSRGqxbhrj1hN3GAnSe1S7ZD9fZ7xSQQdPnw3wY=;
	b=Cv9Osw04VC4rVCwjeeME3KYX5nL0qh1krdpZqDYbrTwn4qsHWVqg/VivexQxmS5Qe24zTN
	YRELmHg5/mQgMVZUEqZXm4yV8qa9VphqbpZc/8n14pnk7bLsFnGC9oEvRFMBIjj5cCJgxb
	LlPRkc5n1MDOoRozfa6ysgauO+8J3PEy1OymI5avsqkkk13AVALwi6LCuH9eQqqnHYz3/9
	4F4Gtn+hx+oD1CZbH0uc3yjLW3DWzqtjQZftBbAx8rhuVTWciP63OlcQSRDIME6of6VOnp
	HFQvIi19x/DOXkbtMpIQFRrFsN6sLnKyfRIF8BtE85+hVFhKZLFPHAQASvy1NQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791450969; a=rsa-sha256;
	cv=none;
	b=YnISrEZzZGzhajlskrl6TLydqQQeXRDKE5tIGMx4V6uAOZyroT6GebBCSKT/Zj1A/10LFH
	zqNqh+kp0nOQjfZmFqT1akxVkTJcDaLebwj+/FlAJxkIYYRP9VI8RjPjXjRwwiYXvJbjhc
	676UbsDPiEC8NsiYA1SBPnKqbSw3FXTxhunuX6pdV7FcjF8DDRNisCLGj5KQTqi7/mNKKd
	yIGSxUUIXPnT9o4iO6bidU3Tf/KUlGRdCTEXiAh2fXUvjU4+SX4vJSLhuVExbsfIdRBrV0
	8N1A2MXeAdQLrZ+nz4KEMSrJbg87bmISmRuH5N7ZUKt3ipHhtGE+MK1vqJi2yw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791450969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UaplkSRGqxbhrj1hN3GAnSe1S7ZD9fZ7xSQQdPnw3wY=;
	b=auAixPFWK5I4JCs2dLN5KFff/kXgD629RUw+qqF9NKTLkiGHNOUFSetwSqTv9cWpxtRd24
	b39onPlp5XEIKnz6E+lkMvOAgAQuxbZSNjgePpMiRyUiSk9MeJmTULeBPAURNTWbeKCZi2
	IQFPOQ2AKMI0j5FPneNk6Mdl4FRXo3GYnuwtRku+Du4hbyz49MZb+wq9pgEa0GOJLqoOFN
	lWk91xuAGD0+2pA1MZrxLM0+m69bR6b80x3ffp5ji1mdx1tUViGK8+TjCjrTaN7nlXGHL9
	GgdXNkblafY+6/LoYKlh3rOc3YAcDIXmg+rhnduYkOXoESIeDIDdPKr0iRzWEA==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Thu, 08 Oct 2026 11:16:01 +0200
Subject: [PATCH v9 3/3] arm64: dts: imx8mp-skov: support new 7inch panel
 board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-3-11fa90f531fc@pengutronix.de>
References: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
In-Reply-To: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3740;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=oeNocdBtGSNtf4Oc8ZdgL9NyH9DsOP0rYtNm5SDKuuM=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bx+AgLh8lS66abzNT70xeWICD2KsjgnL1awEv1d/ZnT
 /dIdVZ1lLIwiHExyIopsqgsrOAT9fjgGTlNhAtmDisTyBAGLk4BmEi6GMN/l5D5Nj9D5qUtkDvw
 9ebHf6Y8uU8UYiY9k9lx6n3hId6Yv4wM88Vfv/jQZNWcP9M0eJWK8/1PR32WcEm+kLledio46dh
 MVgA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622

This board is similar to the already upstream
imx8mp-skov-revc-jutouch-jt101tm023 but uses a different 7" panel.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
 arch/arm64/boot/dts/freescale/Makefile             |  3 ++
 .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 38 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5599e45ffdcec..59d2430a6d0e3 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1153,6 +1153,7 @@ properties:
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
               - skov,imx8mp-skov-revc-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
+              - skov,imx8mp-skov-revc-jutouch-jt070tm041 # SKOV i.MX8MP climate control with 7" JuTouch panel
               - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP climate control with 10" JuTouch panel
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
               - skov,imx8mp-skov-revc-touch # SKOV i.MX8MP climate control revision C with touch panel
diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index d706290b8dd02..dd69992e9e17e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -476,10 +476,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 
+imx8mp-skov-revc-jutouch-jt070tm041-dtbs += imx8mp-skov-revc-touch.dtb \
+	imx8mp-skov-revc-jutouch-jt070tm041.dtbo
 imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
 	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
 imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
 	imx8mp-skov-revc-tian-g07017.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt070tm041.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso
new file mode 100644
index 0000000000000..7b3535f47f3ed
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	model = "SKOV IMX8MP CPU revC - JuTouch JT070TM041";
+	compatible = "skov,imx8mp-skov-revc-jutouch-jt070tm041", "fsl,imx8mp";
+};
+
+&{/panel} {
+	compatible = "jutouch,jt070tm041";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@2a {
+		compatible = "eeti,exc81w32", "eeti,exc80h84";
+		reg = <0x2a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupts-extended = <&gpio4 28 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1024>;
+		touchscreen-size-y = <600>;
+		vdd-supply = <&reg_vdd_3v3>;
+	};
+};
+
+&lvds_bridge {
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
+	assigned-clock-rates = <0>, <358400000>;
+};

-- 
2.51.0

