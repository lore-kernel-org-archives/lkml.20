Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D8F49B46D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683966; cv=none; b=e+3oli0O1CMbGSCc2rf+YoVzkgJ7ciYr0NXQhV3JR88+yLFfYCEY7ys+yMiKRtkLmDLzKqB+gdoEua8N9J+Lfy9fbcLhUXZ3Jq9iuEZbOn9PUHE3XvKXZKoYBee2QceUcvJXu8+rIBOAVTTy/4ZqItYSkj3Zz/P9g3+grS0iUuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683966; c=relaxed/simple;
	bh=YNadVpadLjDA0na2fK4MaKW0QAVOEpeP6sOsWElTD9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lo3L781SCfR0SJRUjBL99WqYV8a23+8HdZFNdpSPqZHVEZg8/yJg7eTa7kGk43RUHLXwchPLuJpRSUq10u3GWuKgSR0RgP022PyhoBhEVFK8F3UWMTwvVjCESz2s1Y4JeB0xq27E81H8JKvJYLuaIIMjDdd9M/BAhVyor84Y5HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqdbPj66; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqdbPj66"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so794915e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789683963; x=1790288763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p44TxhNKudxJKjuTHjYChz9yjXZoZjxwqz/JOTq8TSg=;
        b=KqdbPj66Ew80sWzO+3ciCxAIxmW50FyXOtjIp9gRul9PpWI3+M4HNugQB8gXolPG8D
         Rkldbez8mp6cznmCdXrqZrKj3qj7HrO0zZhi7oP+pykQvv++4m419bVOpO59ffZzki2m
         d4wZ/Rvdr9iEG8RP2dXHoR/XFeOJlAvqyivCkrjF792zGbSraS0aDokoAqP4GMJ2jgVP
         4ZVRWPZAZtfzSitmFxIklmMSznYuenryuNLmRVh0ctFmeEKYc/mivesoSCZQ8XwGxE6I
         bh+wPq3Zg187aa96WkPjjiCh9/LXr1fxLplOk/Pc9gDBFOQ07KxaXHYzSKCYfPQsVrxi
         s10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683963; x=1790288763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p44TxhNKudxJKjuTHjYChz9yjXZoZjxwqz/JOTq8TSg=;
        b=vk8wJWGlB8lU11JMPcZ4k/DAdl/kbwiyoAlvqtTErwXBVJvfLOs5IfQdOi7GKk41bn
         Qiu07OPZaIwaBKcSrOjaS/Be228xLa/Obtz9ULBtHNotjpfnTGZxvsTC38PTptgCdtZg
         pJt3cOLHyncFX5NzrSnIxazVbmVuqgpv/sTaw4C4e8ZT1Q34/TpdXeqOucNa0NIi2JpB
         I/E7FmSDXoQ9e3oSGDbqdlzHg6w6kvThTF1T3hNTiBblYWtkUT/m8IaHnK1dSAXelcgf
         xg912Ny9pekCYFAcqY0bNMp8cLWhdAoUfZBvmSX/xdrfXGnj5ZgKh0ro94nEX0vQRHYK
         BxPg==
X-Forwarded-Encrypted: i=1; AKwUvBy1j2m+fWYi5x5mf9r4Nd1JDbV+10DAsH+f5JdC1xvWwcpCR2GJ5exf0mH6G7Tmuk5AqhcvIko6zu4JnK8=@vger.kernel.org
X-Gm-Message-State: AFuF++nlMiCLHBp//3aL4WZJUJWWd2VrlO1VSB+QQW8DlysvqIYxbebI
	1UH+/GM+n2GYETO8nK/xWi5K8CgAaPpYP9HuJ5TCOljPP9qYHvHrq/f2
X-Gm-Gg: AYBFou0RWIOVCzLfGS+t88fSqTDPdOCHy/Nbd6wqWQCmT3eqmMAlb+AtBuTYDBbUXqa
	V4yAX+H19oY3y3ADMx5kCbK93oWMTEAL1wM6yzatsfyca4Sf+jRGcO36TOlVIg780de9d93tJbI
	/pwbMpNyLzbOhpOUvkk8fV5FCN+DTSyTchMMcZYGEIFO8PfNP+3QemA8m88yJsviwbtPlLbuEy/
	eHMDFLX1N47JEZtki8myBTTX8eqEHe8UcHPQdKz+YHtoiAHihkO7DfG5e8ydlxwLs6k+OAkmbCs
	sNNfg4WXfiBcQ7zFel7lTVeXef4qt2B3XBSAmWCdj0awk0Vt3g6yQCOV54ATo4Hujh7Y0cF5ur6
	mPrx6aK+uzTJg7uU/IfLRPHrBYDUoo56VuO1OMY2U0GvhrTusMGDob7JikK5ciLpvvGfpP+Tucp
	ia99xVK7RWI3iE4fWXiNbVhiGezddB0yXUOcPP0tYDpV7Tq/0mYyxvnbrtfq/U3njHIB6fcQAoa
	gdUhORPFkBgCkgD0xTYnDkbdXfxZ9UHZg+eoHYl+aTXIP2+C7d8tSfEQNXeSowGIdcZe7gtSPam
	XSMz2DJDugIeughXIjYBuw==
X-Received: by 2002:a05:600c:3b0a:b0:49f:bd3c:bc20 with SMTP id 5b1f17b1804b1-49fc573b7a2mr2953515e9.27.1789683962520;
        Thu, 17 Sep 2026 15:26:02 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm5583835e9.1.2026.09.17.15.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:26:02 -0700 (PDT)
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
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v3 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Date: Fri, 18 Sep 2026 00:25:44 +0200
Message-ID: <4f550d729c32725e96884b4ee3d10afa908bb15f.1789683864.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789683864.git.stefano.r@variscite.com>
References: <cover.1789683864.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM available on the Variscite DART-MX8M-MINI SOM.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Fixed reset-gpio polarity

v1->v2:
 - Add tpm pinctrl
 - Add comment on tpm reset line

 .../boot/dts/freescale/imx8mm-var-dart.dtsi      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index c7a9eb23e5e8..cb7998616a87 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -138,6 +138,16 @@ &i2c1 {
 	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
+	st33ktpm2xi2c_som: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_tpm_reset>;
+		label = "tpm";
+		/* active-low TPM reset line. */
+		reset-gpios = <&gpio4 31 GPIO_ACTIVE_LOW>;
+	};
+
 	pmic@4b {
 		compatible = "rohm,bd71847";
 		reg = <0x4b>;
@@ -452,6 +462,12 @@ MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
 		>;
 	};
 
+	pinctrl_tpm_reset: tpm-resetgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_TXFS_GPIO4_IO31		0x19
+		>;
+	};
+
 	pinctrl_uart4: uart4grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_ECSPI2_SCLK_UART4_DCE_RX		0x140
-- 
2.47.3

