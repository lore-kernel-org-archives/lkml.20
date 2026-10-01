Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED2F4BCABD
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844201; cv=none; b=kS1x4diOHueYlOpj6pU+cwzxIzq0cIgdPQsTRipEz60RhxRydJwjOCc0qaMFs9BlFYQhOi5o6jffboSqzSzjpNQJeRF9YxS5h80zhPu69scUJRFuIJRfe/PtCAFk16dxprmGM8H0dVb4dgwFZt/epFuhTkukUct34qKP+8WXjoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844201; c=relaxed/simple;
	bh=wxElBAXB6uVNMhJYd8MDjWzdFURgnAS4XjHbavkVIDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bHy5BiJ5WnqjsEqQMsE+GMq18f0LrQddqu04sunTRy3ynJ5eNj8QCUOYRnDRyLYTiTywqQ/xCRXmpCH/y/6/50na87u0quna2/dcE3DczCdIrIzcCXMs+Y9W0gasouWKPJu9FtQtxbPpkMx8mIq5T1PhB04e4Z5190tEFkrFAek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDaHXfFG; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDaHXfFG"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so39048975e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844198; x=1791448998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Atuw9lBz57e/hUpSiZ8WQ/Sj4OSIXL2+X4pHB8jkTYs=;
        b=XDaHXfFGVZ5E5+XOw/ygTyS6gIccBpjiO3g1IUWUnNqiWG8haEJNTO+8CqvdMTgu0U
         WI38G+tn/0vbqqSLV2iTNsaxLMcblAqGJfdNRW/7Ffh/3DzeA4VeWB1tJ6dro6rJb3Uq
         yuEzAEnEfe+m1KP3Eo5n3GNvDrZPCmuxPeQwas7ZwWwRzgy3HFoGyxQmLvI/3wKUfHPm
         ziPKNJVE9JHc7zKJUx9CbcNkgAuFdVUgbGAZnM8RbjnuYKoj3I4nHLlGAqebLalcDuFG
         Zd4fm9qE9mCQn5XmpZZLgRjxsfcXkgbOuXPl/7x/3WRroDWvJm3BCgOipBIAQ/e5RUCh
         6m2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844198; x=1791448998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Atuw9lBz57e/hUpSiZ8WQ/Sj4OSIXL2+X4pHB8jkTYs=;
        b=vKZbK1SaCU9FiJSBIDe5HKLXNA/tHawrJuoDfTqXyUxwg+SaQNc9iZovpXUbTc5MTR
         BTNXvVuiXn1i50c3/nZNnBOr5qCdZ1MOaBSgYBj+RdvNe5T3ix12Dni0CIyZoQQYH2uj
         6XqFWOU5y8+KX2X7nWxX+r/wZc4t9pyezu6B7Fi3d7Tgwsm3hyI7RUKIAeH5mRQcfb+g
         /VV6QI88o3Tne9i2UWTjn6Z7hjTS1QaA+1GxYNP6uvAgDVPXD41VdMeAI2tGZYCoqsxq
         wq6o9aR3bdmrGCUBVxG3U3+FIu2AdTZHX0JiWdkiYDNPkW/sxOmlvVNYEwrSPrlhbIW4
         jOZw==
X-Forwarded-Encrypted: i=1; AKwUvBwwe1OALD8Tsg+f9fmycE2hWmKsiMp/7qtqxMncEHTgZDCUP5aRAYpjK10JGTJlBpbI19uW7hCpYUpnbRA=@vger.kernel.org
X-Gm-Message-State: AFuF++nAX/t532qwRhcBFgMuC64bkMFudJaj8cBW76Z/roacuU09s4re
	2589xR4bAPgQ40kdEcwCZNhHr9LjWnF5OdnzkddpGiNeAomKo4pUetERtDP7y6fA
X-Gm-Gg: AYBFou1pAk9a+7YcrNjeAWImD5V6Xbe2jgWRCv2dGfHXmSlT+Ulpn0YZ4RR6NIqwu/k
	SfCvVAbK/DquBj24WudjFYh5/qY4I9NIRsteOGMSLmX9koQ7CgtsnxZNp++USJYIYkopm1cwtwL
	tqLAwkyDysU9U1iduFZtGyyveXuuEhzXZMSgRQnoXL17rX5UtTjqzbA0Rc3SlHL5/7FryV/lU2p
	QjfYTFpeROpiuWibwqxFy9q4AUf+NZmm7wUVT6HAXdi0IIpSgZjMgGa8BqZSmVYejw1MOW1yCsI
	73PAgd6A1asVHImxrs62OolNSyCIgQHqiKGbV7TTXkqo8iC5JzBf8hleJtW3rHuD8krpemtWjJ1
	H5JSgNgxuPs4i0VrdcQYANsYRxIigV1+tw0TvB6v4bDYD19HuJbpmhHiLqGGNXk9FujyA4Apw4X
	ydWGhUdQn+dO1siwVOcSlmmf1d9EX+ofjO9UeQUhbeLSkX6HQ/+6b+OgdHeh3uPpUMQitPmM8M6
	JF/EVfImsDrNUPQfrcZO998PxH7HyllW/PbHhNk1X4UVflEq6CWt+g47hA9WQJZen35AYZ4+g==
X-Received: by 2002:a05:600c:4445:b0:4a0:1b14:e845 with SMTP id 5b1f17b1804b1-4a01b14e85dmr65548535e9.2.1790844197683;
        Thu, 01 Oct 2026 01:43:17 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f949709sm78177885e9.12.2026.10.01.01.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:43:17 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 10:43:11 +0200
Subject: [PATCH 2/3] arm64: dts: freescale: imx8x-colibri: Add Cortex-M4
 remoteproc support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-v1-apalis-colibri-imx8-dtsos-v1-2-21881dc324c1@toradex.com>
References: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
In-Reply-To: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M4 remote processor available on the Colibri iMX8X.
Use the same entry address and memory layout as the iMX8QXP MEK.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index 2415487d3a5d..b71bffb9dad4 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -86,6 +86,18 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "usbh_vbus";
 	};
 
+	imx8x_cm4: remoteproc-cm4 {
+		compatible = "fsl,imx8qxp-cm4";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&lsio_mu5 0 1>, <&lsio_mu5 1 1>, <&lsio_mu5 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
+				<&pd IMX_SC_R_M4_0_MU_1A>;
+		fsl,entry-address = <0x34fe0000>;
+		fsl,resource-id = <IMX_SC_R_M4_0_PID0>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -97,6 +109,37 @@ linux,cma {
 			reusable;
 			size = <0 0x1a000000>;
 		};
+
+		vdev0vring0: vdev0vring0@90000000 {
+			reg = <0 0x90000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@90008000 {
+			reg = <0 0x90008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@90010000 {
+			reg = <0 0x90010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@90018000 {
+			reg = <0 0x90018000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@900ff000 {
+			reg = <0 0x900ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@90400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90400000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	sound-card {
@@ -487,6 +530,10 @@ &lsio_pwm2 {
 	pinctrl-names = "default";
 };
 
+&lsio_mu5 {
+	status = "okay";
+};
+
 /* VPU Mailboxes */
 &mu_m0 {
 	status = "okay";

-- 
2.43.0

