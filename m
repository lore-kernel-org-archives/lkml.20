Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B80493D42
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947941; cv=none; b=qK/Az4zqEVrIco2mJYymjn436eKcIxjLTVj0Ohz5VPCSmZN4Ou3F8IpsG/MGwxNDgkCUlRyDVsgZraSH57/u7fq4SeuHCIAIlp46Zqf7GEssHi3FOoKvebGy2t2dE1ahTCptQqZT9uKf9qaGKz5TT69jnoSodnx4fFt1x0kI+ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947941; c=relaxed/simple;
	bh=jGF7Uptp7PeUJv+mf2mKrbCqxmD4rFQSTNs6N/+yV6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZvcE7kjmsJNLYT0fuN2ldm7ImVTSukFhf5I0W9ju8hn1eNvjpI9kdfZbPCJt+RFcynuh2qIXymEEd1viTAsxOHXqXHX7ooxI6lsaN4vuBfSuNX9JUCyeU6Y2cyZDgDFBwTz2Z4OLnxb2GG3WjfSkD++EQDONpnOFUs8n70Umurs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmAWabdp; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmAWabdp"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afe3b2383so2430874f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947938; x=1791552738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
        b=MmAWabdpaSDcb+sSIfETpYSXfWwl/TOpAhk84RITYLmRGkhmT6aDR6LEfSnL5OAgJf
         uYU9ZJ/DNc/vf0TCEAltjAVxbDbNj2g+4u9jXKF64iG+brWaD7NqH99N+h2wl+4+DPDO
         NQk2RRMdqTLNEGnYqOkASO304HszrVOs9VH/P3oq4hbbjR+ELXmyrYdrDPj3B+y1Bjac
         aIaDcZAbkzSU4oOqm5CGrZq95fSTju+BzR/g/ipI+pay+I+Rlc6z4QR40Xd8TKCwmdtH
         4+pDuadKvmghKrM5MvQRWXBsGwWTCXWnWPp46G3DA6AaKOaaF6yRbs8rJgpq39BouDVe
         dpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947938; x=1791552738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
        b=ZAAZcyFMiHOyZ9I2SCTRmXQYBh3heAu9oYn+zM6HC8yLN/kOxKJRgs54mTK5j+E7Jh
         FilM4jPstr+Qd05fN6H2QXeXhft3UqqvjGpxX72aDlR5oiXTJHxaI0N2l1NTz6FcqT1l
         c2An/9gY3agzuKoDUUQQElzSadegZ3XeJy7LKGBT5JXyRWSF8m4mDxVcUazCV6AHe3vy
         d+9pF2ypxZM2j7JRygEitPXzuRVzSb0504a4ZJ5Z7I4NsfjdtVucWPUqo3TM3VSkdnb8
         KZGtMTd5uOduCe9oQO6kUi5t8mcfnFgwXKsBRC0bvXZd+g3DXiPAsT8JWoMJGZnIWLhp
         i6CA==
X-Forwarded-Encrypted: i=1; AKwUvBxdDOI274PL5Pt2Gqe+BMhZGYyopbmhZ872VNMjRZTe6HFAEaQTrLTgsgf6ctbvQGtqFrNEqpIpA9G5FcI=@vger.kernel.org
X-Gm-Message-State: AFuF++n9bDQ5kHlk0bHOqS+MYmEHTAv6d3Jpr9/tvDsU9ikKmzXUvy51
	Q271gJIK8A9At68TEpbVXS1Kbltcq/HV3Gpd9jh9KvJyq8U9xB0aHTt0t9AEdcv12BY=
X-Gm-Gg: AYBFou00XTuXqiVZrFReSruTAeH/ilGrd5N27BOLhnklY9xsuQnwQ63Y1D8gDh0D25e
	TUjRrQ5tyt4KAqJRwby6jgACMPFHNO4FUyudAiN02exVsJxKfEhwpDxJ0OMwd8Zs931fmgpshQw
	tZxvVmWWhAbqNvEby6kLRTlwkJJipWO/UeWqMVUKmlGmyWWevtSiWs8uRBNb5HRB9f4Ua2cIQaR
	5tBv5GPOXc/I+Y6qDQ5+L9m93DP1qJ+XPRoIHkVQuL2qEEutNms6Yc4eL5OhmkZE+a7ukqO7XwK
	YTWhVWkRN4oL5ImakBdWp3+6Ei8XxRKyKXe22Zgg5EcmpXfrRAOECVBxFnAgsvZvHCQUtWk50GQ
	JSJPdPKzcOh84RnL3lEeLYILFDP8bLS8erVsrotEcmCYVVfJEuLMK6Ej1VGexInERiKRkEZR6l+
	pBPA7kQWg1aeyjiU8GEO7T6LMI/yZq5bBn0fl6QyCZPBmROzKF9hRD1LibYp2zv+GHlg324d9a5
	KkwB+eiCpeq8sRCCkiSIa71MW5OgvfFiyXEHp2NJlU8GNxtKNzPcjP9WDlp1Wfy+ZT5tB+gbmcV
	h6NVp9wt
X-Received: by 2002:a05:600c:154c:b0:49f:fe88:e7d1 with SMTP id 5b1f17b1804b1-4a02769c438mr56562015e9.15.1790947937422;
        Fri, 02 Oct 2026 06:32:17 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9bc0sm5809855f8f.41.2026.10.02.06.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:32:17 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 15:31:30 +0200
Subject: [PATCH 1/2] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 camera connector nexus
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-v1-smarc-imx8mp-cameras-v1-1-a0e89182c625@toradex.com>
References: <20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com>
In-Reply-To: <20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com>
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

