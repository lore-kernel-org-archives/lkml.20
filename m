Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203594;
	b=Yk+cJ5tgb4L44Q1/TRCihe8ipnjjbroLhaueF5e9yUpgzo1o7aiGg/1RvaC22Demp03B
	 WbwsXruWANVo24ls6+0skX1/+LQg3DUYiTxMymp8cIKkJx2KluiiDKkWtcAthtVP/aYzu
	 oI3mRbtBDF3nR/TvLH0V0D44NdeDFvyWnRtzXqor6J1g6YE2Z6RQgkaSvGIlxiJJ8OZno
	 U5IRZClp8oAUPwvZSF1RWqySBj1geaqbti1SqQ5IXQcrrPTDSNdEBhr45cMjxHkAvjIZ7
	 tA320jBcpHzT+LZsODtvGB95K3tknYtKwqDtjODZ4xP9/bk+GcXXJp4PBzzmdDt1bfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7ZA+lAyHuDEsFhqEslFfArNJzGGWxbNE92ukEzZuxNI=;
	b=pjAilp6E7+B22kPp+8Obj23ooRRHLgcAzQwGUhxQWEc4tPihU0PE0/GkJfVzkywzxRKg
	 OnOpdrIwxcR9/J+aiBjhoDYu4iJFpcLPmKX7S7ZI6fN1NVMW0NzyMKSA1ldLCQx7ZNawJ
	 hjr9yTW83z5Br1BQHoloEE3eRaXkq6oEtByCjRYqqZ4g+0Q2e5ENbCK9eYTpAd96hEQ8y
	 JlrDtuYwiSytGs8Vc6J8MnE8KzFznLmUjvFN2RC7jhkRkg1LvMoio05MLRYqyPdmylIdF
	 iU9U2mVwgROpyUAyGK2hN93hhdAKZaa4jLVcaFkj3HADlS+HRq8kyhTyT3GMeBClmQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cxt3iCfe;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4548D60A380B
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4548D60A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cxt3iCfe
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so8494765e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203592; x=1793808392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ZA+lAyHuDEsFhqEslFfArNJzGGWxbNE92ukEzZuxNI=;
        b=cxt3iCfeaXPmT0e03ZR6Gpu7Ti+yT+t39ypsg0oOnFF8HvvWrgTuKHbstmvDceG62G
         nxHNMwbr3vbApZ7ymqgN5mrcvKhVB0N0JB67VgY4T3ULqOZZi8W6gjnHK4baZX+OaLsK
         8VGtlexj07cz9Xk0JXKAHsoSFVtezCnqKi28n6QWh+MxLX6zSPeUVDEuMSGdZetZ7kjM
         iN4/MF0rCH8YJknGwMGmkpj8cTedHwTAkdky+8DAjwMTqGZfEp6TDzUMdLHYzYfYWTbW
         etjTUe4OyAyZ+b4Q4muqSikggEymJ1Tlj8tZocnMtIvwCpVBx5fSU+R9jMscUpyoJT3U
         Zhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203592; x=1793808392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZA+lAyHuDEsFhqEslFfArNJzGGWxbNE92ukEzZuxNI=;
        b=K6r35/YEvTfoNDHth31Uc9sQj/zfXiDlMZfLIHEoifb2EFilcnAsZTOQnqIOWYKC9m
         G8oUE4aoj0dlyfrunvxRRA3a5ar+Kdr31hDhSk+mu7l2QN7u2mvt4ko0XtfTp75F1Kj7
         1PB/8JmmMouoHcB6MHcO2X6yOeFVEvzaPsU0ekmhy2GxlrtzkFjDZuTYFCl0cOToHRcr
         DLpH2tRbN71jmHxwE44S3gnqllOsRNfBzt1Egt/XvXX3wz1SAnBlkGs7Ltdhlrf1p8hC
         ZiN1akuzfUhUOgo49V0W5tqI5dAs8axeh3EONC32xJR/u+Ch1uj3Jh5qzNQyGQ3lu5f1
         HaAw==
X-Forwarded-Encrypted: i=1; AKwUvBy+9d2GI/BCRheTzv1XSb8PEzKARDTmOuV9MhIl+mlUGu729GDrfXkEIaq3Ih/mGJfRbEqMfkP7fdsc3QU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQMZySw32WzdWEWpotb03gkIGzpIF9J/WTLA2/fouRzxeEJZSE
	JK6ZBmm8y8FMN5BOCrWcP7giYWf7DEg2TQCGujRF4B5z3qJ5tySyd/DFBU/pVPVHD2I=
X-Gm-Gg: AYBFou3azbSmOmTSs4V3TVu7BHoOcrjvf9MgNLyLLIyHj29/z2S64/l7ATq4RQipqSz
	o0xJY3pgyIrNKWFIgX1U8JDvGV6BUoRcTAqASa9FnuYOJQerOH+YVRMDtYEfizheyjzhU+WpMZ5
	m8T/nq2Gcnz9m/6iYWFfqL4P6j1qJRotLcnOg196bIxGyHHyy12pLaGVuvUcNx/2/XYtOhnyMgB
	/+A1wm9vEXmrEsK5/S8kkc3G+GQmrueUtQl07ARR1R4x8EbwHBoDT0sUUNSmJWTlRkMpKFSBEQr
	W44IfMtLoHeSHNO27jc+oNyLCELs0qze3466GJpWZWnMEEpLTt0phJBgxyEo105SzuqAbsMAIE5
	mterdODgWSatjU0WCDzo9dcL4mpvpE+BrS4ZiDqIwRAYLX1O/CHGMF2Qqe0b5A0A4LxYWqNSnn1
	8SXJ5KxW9UnGqw8kSIdaCEZ37VP7Tq4iCzRu4hexhDUVY1TAYOO3u2zB3QJTSNfXqCy+x1ok2Xa
	EEZNiEbJuYM/q7TbEthT3xCK1t/WVyG0Tj60eZsJmUKWF8OgOx6EKyqGbUbQst9JX7azaT4zITb
	jLYAkDknYK8vAarMxP3Rxe3NW1ydSVjUc0esL1VeW8EhvvFee34lHzaI+hJ+JXFq+uMZ5c01KnL
	fDXNbK0eWmkZw1gTZkACHY4cAwg==
X-Received: by 2002:a05:600c:3556:b0:4a2:1cc:6551 with SMTP id 5b1f17b1804b1-4a9678c3cadmr65712265e9.35.1793203591617;
        Wed, 28 Oct 2026 09:06:31 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:31 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:08 +0100
Subject: [PATCH v2 7/9] ARM: dts: omap: dm816x: Remove hwmod code for USB
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
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-7-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=2202;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=Ny6o+8O75PYtwR2Tbz8N21c8sCnj9yIYkNJzjWqiRRs=;
 b=e2Cm89NUh+NWLAqlSGnjPS9Qu2O++UotrEcH7tte7NtpZVzxvOd9M+H4nKGn+8JXxX8PSH1PL
 NQS5foBIQrUBlTbY4ZPammQ7bf2KFpxUI4ifneZh92O8oRNb5O/qxZD
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Remove the hwmod property from the USB controller node and the matching
code from the hwmod data file as this is now deprecated.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi      |  1 -
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 21 ---------------------
 2 files changed, 22 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index b839ee29e9eb..55f4b91fa1fc 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -576,7 +576,6 @@ uart3: serial@48024000 {
 		/* NOTE: USB needs a transceiver driver for phys to work */
 		usb: target-module@47400000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "usb_otg_hs";
 			reg = <0x47400000 0x4>,
 			      <0x47400010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
index 9b5c728fb7da..b9735b507d6b 100644
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -646,26 +646,6 @@ static struct omap_hwmod_ocp_if dm814x_default_l3_slow__usbss = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod dm816x_usbss_hwmod = {
-	.name		= "usb_otg_hs",
-	.clkdm_name	= "default_l3_slow_clkdm",
-	.main_clk	= "sysclk6_ck",
-	.prcm		= {
-		.omap4 = {
-			.clkctrl_offs = DM81XX_CM_DEFAULT_USB_CLKCTRL,
-			.modulemode = MODULEMODE_SWCTRL,
-		},
-	},
-	.class		= &dm81xx_usbotg_class,
-};
-
-static struct omap_hwmod_ocp_if dm816x_default_l3_slow__usbss = {
-	.master		= &dm81xx_default_l3_slow_hwmod,
-	.slave		= &dm816x_usbss_hwmod,
-	.clk		= "sysclk6_ck",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_class_sysconfig dm816x_timer_sysc = {
 	.rev_offs	= 0x0000,
 	.sysc_offs	= 0x0010,
@@ -1250,7 +1230,6 @@ static struct omap_hwmod_ocp_if *dm816x_hwmod_ocp_ifs[] __initdata = {
 	&dm816x_l4_hs__emac1,
 	&dm81xx_l4_hs__sata,
 	&dm81xx_alwon_l3_slow__gpmc,
-	&dm816x_default_l3_slow__usbss,
 	NULL,
 };
 

-- 
2.56.0

