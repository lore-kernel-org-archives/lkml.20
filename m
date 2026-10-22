Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680413;
	b=Usy+Nh0uWMDJNlcxUl+9IumzVSrQyzAH71XSjxrlrqnoNr1Ownq2NIOJiPCMsyVPScTQ
	 +oP8TyWMJKpOYUhepujtJ37viVfBZQyWOSbRHdQmyVqfYs9tadEvv/q3rRkXnIb9FR5Oj
	 exfKVYwKJoir5XS6NWSY2lkFJ3ab4vu49xvxS1G8LZdk1GwBy90Y3Qo6+s/Do+Inu7yIk
	 B2rJbsudfJqTZX5xHRpYJe0OllF7Fs2K/KpSkeCkjJog325a+LBElqeaYJVpX6LTxkICo
	 ijjLTaQxpMVfQSDMu0RpJ99t18bUTkUh/m1qKpS14JaPBYvHIw9W6XakZSUfvbshT0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
	b=gWGYTtYm1p0SKTDjydMADoZCPRgKH4mxsxy0/AMp3zFFhqxYkpWAsQ9QsAtmdryVU3lH
	 IJgtc1rSOh+1m6YZmUP8LI4IjVMz4cLQ1hlhUNC44SgORU49j2YRMBzkWqOACm3xc6aPk
	 SRH27uEcaRuLuRdRFntzOjUuwMjkvy9tMQaauNds9vpkEnDgPdib658x9jM44+JgCZHHS
	 xASdvjH9siQ9agl5lKpMVrCJkS2SO/SS8PpxyQDV5Y+AiPhHmFx6CAuNW+xtqF7ugtlfj
	 kFLroeE0s9nmxbwVr/e8Y3jJN3LZ6U5GKzznw0RAs1CjQMUojePXbzhXCWWjvYrkLDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GZ2SPGAL;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86420606A332
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86420606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GZ2SPGAL
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1383067f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680412; x=1793285212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
        b=GZ2SPGALuWUI6MJ+Gu5jkSj2P3tt/pSOxejns+quWcJWBTQVLktPVimrPvQEe5WgRq
         VrvCID2/cZUhNklU5EyRaGuIqOL7+NMGTzOsDe1LfnzXk/3f0HDUPCgijY2ZwE4siLEo
         WAEPyxdAQOpRZfpE5111YeBo3CTv7z23EVdSfI/11VX8iYOndcrNDDorqHxwP+NdSsuq
         cVYBtfPpBtuBM1J/BXRrJy/Z2jVBuEa05SpTcYgxHQ/ukBjDJLCtjBTWVdNWEzwL9CYk
         uXEQMjOijnJJOtMF0drDtmbc7BdEavz3RXQ8dmD3vCZpA9i6vryZDwxRrAtQrnzKpHtj
         q1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680412; x=1793285212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
        b=yWN/rhFZj/dYcyRxEMI7rZie2OLRxmtRZs+8f4W5u3K12etPB+Lha20dc8om7dzI7C
         1xj0y+Bwae0fWp6RA3pQ2QKd0vaSXlLimZ7joljYsK8kdadBvHznH6G5jSQsTxN1iqA5
         Ywq7MsqQjvrVHB9zy/vX4CLp1x4tgfWE+yYKnEgHzThQ8R3AHKErDpAn65ZlZu/epJAB
         nq2SltOwIvKWX59Vo5o9U+UYIYIBM7cHf6dnLZ1JgNtv4HqtAdL0KmFP66m/U1m3RViy
         TjoBmWjVz9FD6HYt+vNcaL23EHpMCLd+TbGm1vGR6jAO8DMnFPVKvNcizvirk3irvTD5
         QBQA==
X-Forwarded-Encrypted: i=1; AKwUvBy3RV+/csLaUWiPe+0iiF3PXXgGVnuzjYLPDh/vCm/c5mdUZ9rxMS2hBudL0wl+JW0EPw6ThDI6FAfm3Ng=@vger.kernel.org
X-Gm-Message-State: AFq9FYLczhztrvvDK5Uwu7CBs64qCn3YrjCE9HTK6TkNF98QOMPso8L7
	7avaB45WIn6HwAH5ve7dLPb/bMGLmyCLLS03ylRqjVshwYItXnkh8SOf
X-Gm-Gg: AYBFou0TXx5Owc9CK0WcgGUl/LYB/BazaVJFNFCXwePPP7dgDAkoUElWRdsNM+t6kos
	JTvmW//OVGHmHr/vRo+4rivWSlSlIoAIqnHcTCgOlGb7kAmKbw2WcPcp5eqagp4jQEf4iKeYlH/
	B4d+dm/A4SBGWwu+BFUIkSnVBvLv9CVxNsUK8Tm1w2U5bf++2YJYNTbupUio4EPNi+6itHbeI35
	F5MXjtirtXcpbswoahrrcmkba9ve4afyh6CPonLQJpxDhNWpJ5prfaeTKKldhqInDXn/L9N7Ap6
	JdZVlN5I/cGs9eNcQawJTIT68GmtrFBMrSBhWAboC2iVHAfjKbR+7Hpg+GNHev7ob2DZD4BXntD
	zqYiXTxiaOlh4ftmte2iO7i6LSWt05Nml7Mz1+Q6TbU7BNEa0HQCw4xmAigoSo8djj9O7G58TvK
	Z8Soza+Q3Vpuyz41TlqA/sOVgVkMA5lKe9Df8AiM5K9eCnCnbMWrcYMD0mshmVwcTf2rZwV1Gv9
	Sgrq/t/b9AbHSuZM2B1j5tJgiTW/55/FkPb20h+JMpLYPvL3k4qlDKJDaGFQIKga8nhEcr9lGRp
	udZSj0scgYNWQ/44rt275mo54UtsomrG6b6b5+6NlOQiqiZuboFOLxDg
X-Received: by 2002:a05:6000:4b0a:b0:48e:1080:3a92 with SMTP id ffacd0b85a97d-48e264c9785mr11826653f8f.32.1792680411774;
        Thu, 22 Oct 2026 07:46:51 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm13672146f8f.24.2026.10.22.07.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:51 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:46:45 +0200
Subject: [PATCH v2 2/3] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 camera connector nexus
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
Message-Id: <20261022-v1-smarc-imx8mp-cameras-v2-2-cfe3d25e7aed@toradex.com>
References: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
In-Reply-To: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The SMARC Development Board exposes two 24-pin camera connectors with
reset and power-control signals routed through the SoM GPIO expander.

Describe the connectors as GPIO nexuses and add stable labels for the
camera buses and CSI receivers, so accessory overlays can use the
carrier's interfaces without embedding its GPIO routing.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     | 26 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   | 10 +++++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index c28d63293149..e0096388fbfe 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -13,6 +13,32 @@ / {
 		     "toradex,smarc-imx8mp",
 		     "fsl,imx8mp";
 
+	smarc_csi0: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_0_CON_RST     (pin 11) - SMARC GPIO2 (P110)
+		 * CAM_0_CON_PWRCTRL (pin 24) - SMARC GPIO0 (P108)
+		 */
+		gpio-map = <0 0 &som_gpio_expander 2 GPIO_ACTIVE_HIGH>,
+			   <3 0 &som_gpio_expander 0 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
+	smarc_csi1: camera-connector-1 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST     (pin 11) - SMARC GPIO3 (P111)
+		 * CAM_1_CON_PWRCTRL (pin 24) - SMARC GPIO1 (P109)
+		 */
+		gpio-map = <0 0 &som_gpio_expander 3 GPIO_ACTIVE_HIGH>,
+			   <3 0 &som_gpio_expander 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "J64";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index eb8b9db7e3cd..e8e718ef7822 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -587,7 +587,7 @@ &i2c2 {
 };
 
 /* SMARC I2C_CAM0 */
-&i2c3 {
+smarc_csi0_i2c: &i2c3 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
@@ -616,7 +616,7 @@ eeprom@50 {
 };
 
 /* SMARC I2C_CAM1 */
-&i2c5 {
+smarc_csi1_i2c: &i2c5 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c5>;
 	pinctrl-1 = <&pinctrl_i2c5_gpio>;
@@ -655,6 +655,12 @@ fec_phy: ethernet-phy@2 {
 	};
 };
 
+/* SMARC CSI1 */
+smarc_csi1_rx: &mipi_csi_0 {};
+
+/* SMARC CSI0 */
+smarc_csi0_rx: &mipi_csi_1 {};
+
 /* SMARC PCIE_A */
 &pcie {
 	pinctrl-names = "default";

-- 
2.43.0

