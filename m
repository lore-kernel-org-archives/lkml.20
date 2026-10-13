Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362E14AF9D1;
	Tue, 13 Oct 2026 06:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872477; cv=pass; b=YLPVZ/OD71Wsnp/3WqrC8x+gP9HFtTAtSA6XyKftJKh7PI6whr/LBZXrEJFxE/weDt8SiHyuV890iYlXDOzmmvxOpIv5TTXHSNDKZvfriBAzFQHpx7IqRsyW3aAD+z6qLfCMrM5M0ui3kW43xIkRro14ZLyg7NnBrfPAD3pDGyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872477; c=relaxed/simple;
	bh=P5vuRBOhbsEcKT08GtUQmWhheq+TMxl8t6Locrjd+DA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B6o9I8NPNxqitAUXLVX90Q+2rxN9su9oYRdK1usQiK5bK2xuJkb85aLBsQbtw3doVMfBGKgH41QfXazbCs/JbykbJ9zOee1NyK1Wl3gYlgILeN84E5Pz8OwU0rNJzJmjiuJ2jYRBePBgXWPf9OVnxDfeDuoJrtZXoGHdFcOiyAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=ECvHbm2z; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="ECvHbm2z"
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5A372201EEF;
	Tue, 13 Oct 2026 08:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791872473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YeFbqI9jChUEohbrQpD0CokfPutK/1MCz5spsJNN6w=;
	b=ECvHbm2zB9mtTCyuScgBbKXlRNyzZF106jVE3X57a4f85VrAzvY0KPMEQNl/Cx8Ph1Qus2
	hIKi+X70oKiKIkJhDzAQHaqU7OlFKuvQgTyncvZrXfY9ZO2rU6+1HIVy2UKYFJ2de2ILVQ
	VC9EPCWVUJT7sbnMbS6YHu6DOMQHGVexjEovudaLLRU38moLuHvIJDJ5WT6w7oybS0phrH
	1crlzIuzcNYGLMz1aFd1Trv4UVC29Jk1Gv0FIOPQ8MXMeAq+FS3+Laa7RydpwMZM8p/3iR
	2F3EgrkJCn0jwFxZtFzbZ2nFOswduwr2TZ1N1u6fYVIr3Z2cZ50eyD9eaPuxsQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791872473; a=rsa-sha256;
	cv=none;
	b=Uj1OnPz9PEOJgDBPHfMSY5+90Uc0MbWytFdIEf9S7sIDmBOfkV+GG2wkPDaH9vY7AQgBkp
	MYYGV72AP0DNiO6AOt7bmCQ1+7DdrKtcKZEH6Asg06lo3u7rE5qRLJ9MWZWY+25m5uvGiq
	18cBvEM+5lLpUmYBfGsoWlhT+63JIFnzn0kRgKN4lcyubkOliZ/6v2CKS9ufCAf0fQ1nYF
	kJ8y0qqvxq3Ur36pc7SzgWPHy6BjxCLkcBHblTy7z6RJRrePEVQdjldPcPNFDTaBAjAF/q
	MZ2s+2GASnQ96m9ug/Q/6d2GCS+gDuJ93+OOO9CWVCOKf2vXKePRDl07u/37BQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791872473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YeFbqI9jChUEohbrQpD0CokfPutK/1MCz5spsJNN6w=;
	b=MkqFpx1mv64U+ynGYn+ix1gRBaeMJ4qTYXhOGevK+kYTydTe5xGFfVL0NOZmvXuUxxkDKj
	Jix3r7I8fwHfv8v1lt0y76E0oihVoHb5/U0zFbkgE+Xh5HluyThVWcdiZF89alQL09SYjB
	58uaob9yYwdnliOFL+R2hWIMQJAIa+tL5rpWp/cFdQJ13m82Z1omGTYjVM2racunQvzCNF
	WXyRxIHvPJc2lpva1poHrIrvb458DEjvWybsUOWGi6erKJRm26z/2oQcT0KL5FBuDRoiqZ
	eG+vm5LfIPJ3lWVcyrtaKXbO98++oZ+pzcSP9S8gmWCtcvleg+ojEbTjkhDUnQ==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 13 Oct 2026 08:21:11 +0200
Subject: [PATCH v11 4/4] arm64: dts: imx8mp-skov: support new 7inch panel
 board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-4-b97ad841598b@pengutronix.de>
References: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-0-b97ad841598b@pengutronix.de>
In-Reply-To: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-0-b97ad841598b@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2667;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=P5vuRBOhbsEcKT08GtUQmWhheq+TMxl8t6Locrjd+DA=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bZs9ef1919Knn4mHvyuSCr+XphGxvdN/Hrf+xetHr2W
 vZ3Yv5eHaUsDGJcDLJiiiwqCyv4RD0+eEZOE+GCmcPKBDKEgYtTACbC4MnIcOAt6yfxuIRrgbcZ
 /remRkwMPvjMbsOih7Kl1pNtK9P7tjIyHPr+Wi/412WBznSDuq+eM3t1sx48jRZTOnZ3reovgz/
 cDAA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622

This board is similar to the already upstream
imx8mp-skov-revc-jutouch-jt101tm023 but uses a different 7" panel.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 ++
 .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 38 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 7c1b61249778e..d06f50bfc2043 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -708,10 +708,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
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

