Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494298;
	b=2Ih5ZIg8dmWnlTX7owOpVecAgiwNO8dqMQiy/K1eFy/id/Gd3FdeHskzBgYyq9bKuyEE
	 e9+3Ks+WvWYqPXbCXGXKwZmhyzpX0xIoeIxJijIpBlw5Fhuu/aYjlwZXYQtGY3pfoqp9s
	 bBCqerxhOmJaDNoYVYaV23ZYgWS1HCQJ+06dsocnAyD4cgPJC6dCsqYMv5RdaCTMszON6
	 1WWQV3cYp759CCOyhhYjMc7DYvo4+ci3RmuiLs7wzONS1fS26niacClYbfeoUhFkEuLBP
	 vIZJb40fogyxeuHcFn+hEiqHcNps2Hjn5JJdw4bHJhJea25qZVEhldRquYemtIGo3KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XAIZnoux/n2tbjv162cNDAMdWgGrOolZSCwfLvbKHTE=;
	b=YwGkC64Rb0gsGbxnUOhzeQiWZJG9Gcshc9CXc7LWCCYhsaaarns1dCRrGscVakn7oAT1
	 JYF4sq3CgZ+XF+fWwJ8Ha02KI4ecLjm7MXp5brEGEqZwCjh3fqF2ky6xf/ScaCi95gLoT
	 iZ9eKbyZNfhhnpESuceOVDj7PSBFXH95G7k6PcQdK2x3BLLl/KG/ic01hit6xwWmgt0HB
	 gGnPd6PPvJWza2WrVfKdXfWT1XWFM8ghVCpjBbxXWtc9n9/PQE1lFxYhcznXd5E8I4ePG
	 bRyKXozxTCNCNXWBwXMGqcH2+Ho9ZVxvElTWdjiOj1H8jexxZxnvSxrVy2V4E7GdILA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JO7lYcQL;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2313606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2313606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JO7lYcQL
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2dbc0a8d4so1508831137.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494297; x=1795099097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAIZnoux/n2tbjv162cNDAMdWgGrOolZSCwfLvbKHTE=;
        b=JO7lYcQLJt5UJkm5+GVxyPeJX84yxzbD0FxSFeMQ9kdlLif6/eW6Q+qhEDIC02SESa
         H1fG9rAjjWGL1SXzojIs9HlG65mPyWLPxT35AoeCI9k+UhCTjT6qyi9Xn5speIMzdGbF
         KS2YjZ3mPEMm6vNFQITUIqH4uHU6DrTp+2pbmjw7AXqufi+M4BUS0qbrn4Dweu8Z5tnX
         w5z3B+fu/FcpOQYEYxQmLLBTqeEI8B92SLW8F98BApbgeiZuoqCXD2bWlEtC5jnevUdd
         Iwx5WFg2XeFYECOvklFcPp3YqxwCDoM3Se151eSm1d6WdN3gIBmprJLSst1Vpsqcr2Y/
         LHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494297; x=1795099097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAIZnoux/n2tbjv162cNDAMdWgGrOolZSCwfLvbKHTE=;
        b=U45ffWP/B0WGRXLsBpSCx0FoQKyQ0qItWCXLU5lUZ091NqRyAgLc7pRPAAhLm0DTx7
         9+ciEyf93cvIV7W3oWA6/QhK7wcpmtZpnx/Enuq3TvaMH3BQmMImkp0w1fluS9rUkC9Y
         09909jWGrjnTVaEZWKUKck2q5u21vXziyxGJpfnEulA/bJIf5UPu9PkdoTfZ/fO3wr+3
         7/+yxwswh83iSoQY85EPHdB/87nuY898r0mQKngkO0v1YqzjyEzHR6IXPz4CT6EDKZG1
         4jKvQVj+N0/3K8C9KM1L35STbF9CdnrULeOGmeu8yErWPctzkcacvEg/uDf7vMI8DFWD
         1Ldw==
X-Forwarded-Encrypted: i=1; AL+hErHsraXplzlkZpjFNv0VgiS1p5c9uH0mmfaei4qjJzHctbc10RNtOzv1yVRHoHJk8H9F2BEWvxBlaUZiLNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+5m+vlvX6N5dFbORLTqVfcFQOIA81XNrJTUk63GNRCgcB5ecr
	P6vTnQHvtSZUpbpeFGEbHm6dRfK5ZDs17MA7MPrDkauxf/FVZ184yj+pETkIo0Sp
X-Gm-Gg: AYBFou3Argp5aP++aejc6hh4dPQmApzKX24VvtQk0O+dkYC2RWVd3Lw/61ohrQJ1MkW
	RAAjAKN+SgikL5kPSJnlsDsEE6Tl4n6fAH4nabo4N3ATx0meT4tQWLcQ1yRSCjXREzJWgVYXhUf
	zplqstvZnXzeCZoTqDo8XzvHqFbtO4ZZZ41ruFkLweFFzSewGAZcvZl93S2v26cMZPSgra1wZcc
	CJVsR+gjPmoOuqiFVvIpcQXzRZQ0HGvOwl3SqSDs60YDySs971lAg+4ioBVGyhf14sRt1t8Bkvc
	+a8qFZcfCojF/hhbTOkHKjYOLQilnNsLdvUvagwo5qpFa/ieZkarDkALZg/hRPk4QenV695bvLZ
	QD/O5dDkkzvidw+tBS8iCX0DhDzb7lx5xzBn+9XQNCBd6XE/ESWiZFSwQVPXRogZT3trfVZqjNr
	3VE/BSNoYuL6GqKTeCttErM6urygie8a8vQVBwLMWs6LCBUJRW5hDzux2+6sWEgIw2LGT7nAB3G
	pkD4CFFDko/OoJfHRDBEq/oTTIS6Zi9JOQrl6UzwC3giwRSRmushk72Yc9d2dg8SfzK2fsPn2j4
	aW4LoDriI3fMZDDWwgaC57KaD1AS6uT8UT1FJboEFtVA5GNj5UICr10=
X-Received: by 2002:a05:6102:c4f:b0:7d2:75bf:2fb3 with SMTP id ada2fe7eead31-7d4edd1c21dmr1830857137.1.1794494296470;
        Thu, 12 Nov 2026 06:38:16 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5177230241.5.2026.11.12.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:38:16 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Thu, 12 Nov 2026 11:37:34 -0300
Subject: [PATCH 2/3] arm64: dts: freescale: imx95-aquila: Add GPIO
 pingroups for the Lotus Carrier Board
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
Message-Id: <20261112-b4-v1-aquila-lotus-dtbs-v1-2-ca150bb4b0f9@toradex.com>
References: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
In-Reply-To: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794494281; l=3366;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=E6ByCUL0N/O7LejHb/X4auWSlo2ji9+18EP0glmb2AE=;
 b=kfiguU1plVyEnzHlHbVhmFtsvSJI1nrPiCltOAJzbi1SapThDG0yPx+EWCJJJBvaKpqrocvLg
 RtvqJCcTPwkD5IZL3ScBoHZCa8ifHFmHWe7d6TDcrTjEJPFevtjwiEb
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The PWM_4_DP and I2S_1_* signal pins, except for I2S_1_BCLK, are used as
GPIOs for SFP+ low-speed signals on boards which contain an SFP+ Cage.

Add pingroups muxing those pins to their GPIO functions and update the
gpio-line-names properties with the newly added GPIO pins. Additionally
extend the modified gpio-line-names arrays to their full size.

Also add the I2S_1_BCLK pin (AQUILA_B20) to gpio-line-names, as it is
used as an Isolated Digital IO readback on the Lotus Carrier Board.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 61 ++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index dbb0b44583a55..369d5aa469ce7 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -277,7 +277,29 @@ &gpio2 {
 			  "",
 			  "AQUILA_B42",
 			  "",
-			  "AQUILA_B43";
+			  "AQUILA_B43",
+			  "", /* 10 */
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "", /* 20 */
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "AQUILA_B58",
+			  "",
+			  "",
+			  "",
+			  "", /* 30 */
+			  "";
 };
 
 &gpio3 {
@@ -323,18 +345,20 @@ &gpio4 {
 			  "",
 			  "",
 			  "",
-			  "",
+			  "AQUILA_B23",
 			  "AQUILA_C22",
 			  "AQUILA_C21",
 			  "AQUILA_C20",
-			  "", /* 20 */
-			  "",
-			  "",
+			  "AQUILA_B21", /* 20 */
+			  "AQUILA_B20",
+			  "AQUILA_B22",
 			  "AQUILA_C23",
 			  "AQUILA_D23",
 			  "AQUILA_D24",
+			  "AQUILA_B24",
+			  "AQUILA_D25",
 			  "",
-			  "AQUILA_D25";
+			  "";
 };
 
 &gpio5 {
@@ -1041,10 +1065,30 @@ pinctrl_sai2: sai2grp {
 			   <IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_SAI2_TX_DATA_BIT0	0x11e>; /* Aquila B22 */
 	};
 
+	/* Aquila I2S_1_MCLK as GPIO */
+	pinctrl_i2s_1_mclk_gpio: sai2mclkgpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_RD2__GPIO4_IO_BIT26	0x31e>; /* Aquila B24 */
+	};
+
 	pinctrl_sai2_mclk: sai2mclkgrp {
 		fsl,pins = <IMX95_PAD_ENET2_RD2__NETCMIX_TOP_SAI2_MCLK	0x31e>; /* Aquila B24 */
 	};
 
+	/* Aquila I2S_1_D_IN as GPIO */
+	pinctrl_i2s_1_d_in_gpio: sai2rxdata0gpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_TD3__GPIO4_IO_BIT16	0x31e>; /* Aquila B23 */
+	};
+
+	/* Aquila I2S_1_D_OUT as GPIO */
+	pinctrl_i2s_1_d_out_gpio: sai2txdata0gpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_RX_CTL__GPIO4_IO_BIT22	0x31e>; /* Aquila B22 */
+	};
+
+	/* Aquila I2S_1_SYNC as GPIO */
+	pinctrl_i2s_1_sync_gpio: sai2txsyncgpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_TX_CTL__GPIO4_IO_BIT20	0x31e>; /* Aquila B21 */
+	};
+
 	/* Aquila SD_1_CD# as GPIO */
 	pinctrl_sd1_cd_gpio: sd1cdgpiogrp {
 		fsl,pins = <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0	0x1100>; /* Aquila A1 */
@@ -1070,6 +1114,11 @@ pinctrl_pwm3_dsi: tpm5ch0grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO06__TPM5_CH0	0x11e>; /* Aquila B46 */
 	};
 
+	/* Aquila PWM_4_DP as GPIO */
+	pinctrl_pwm4_dp_gpio: tpm5ch3gpiogrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO26__GPIO2_IO_BIT26	0x31e>; /* Aquila B58 */
+	};
+
 	/* Aquila PWM_4_DP */
 	pinctrl_pwm4_dp: tpm5ch3grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO26__TPM5_CH3	0x11e>; /* Aquila B58 */

-- 
2.43.0

