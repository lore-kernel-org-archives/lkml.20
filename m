Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649218;
	b=OjCAkbtj5ddnINh9yXTKe2wFsqGoVqBj2zRaWv80dy6NVRSoj0lwXvTUOZ+Zmnb5yksz
	 cmfTWPbn5BEsEdeJ2Ej4WMPXGFXTTtIn6geKC6O8Sqynkd6p/FfKnLQJGyy3pYlovSs/J
	 P/2NisOvAf2eAj0x/0NxQxT32BwkstFbMGEHs4WlOWxXxVqBW4dtGnnPavbhE4wJjrvn/
	 IUECihGgvWm3/TpJDzNCDvqOWbHI+Sztche/LjiuGzJtUTaYPjMZ0hF/VSNToTVjcV0jF
	 FrCeXeWWY8TXCgzcNg2SW2vMr0mPuQSKSVFnBdby4ktrWK1R2XLDuf7s0xvIYUoAAjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WgXqLTaB6oglxj40wRZgSM14LGgOyB0NNgDc9089WV0=;
	b=4gbEjXJP7sUR1PvjUIgSnl6wa4NtDoze50c0ZkQwmNb+JkAliKtUxXj5OYxNA8ylg9uk
	 LHNepCRlN9CLrIIhmJOzKaB/ByLiuVJ6+c67yMbJOGburq1IbNGqRysMS9uBcktaYO0nG
	 j97RCLL52W55XLizbGZ2WxHosXr5Iys8ma30gaXob2sU/8q66orQ14Kvy2nTzO19htBVr
	 OLFIcJTosFRIIGobOQ1GRGdndYbjhIc6Sp740MBWOvxeK1N8SO7cRJa2n/WlWxbuAx8jY
	 PIkwD8h2dYqb1XTgLX9Roj+b1XUBCZ7ETQj5KWw6LGWmYzIAPsHV2MgsgC1do/tcI5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MWbw5Usb;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF24606EE98
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF24606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MWbw5Usb
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so17182495e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649217; x=1794254017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WgXqLTaB6oglxj40wRZgSM14LGgOyB0NNgDc9089WV0=;
        b=MWbw5Usb0cbBGRLJ92ZAJTrt0QFWs5YZyCyeW437/ftTQrr8PtGiFmnH6ZDDDeRgK+
         wDuPaD5LbUuySlWSjcZCPbDWmXxbLaK5YMEQFj3iGBQIAlM9MK5/agI/Q2qKTV/ajFAa
         Wdx7yFaqiGmQgySrAFn78nj7xAzevwiHYL97Gm9f790QUlegSW5XHaG3RQoglML5uErR
         0bddC7twe9dOkG0IcwatIXRokwYaWpss8ebERcFu7LpsOPKtw2F85pH/ZEFBiY+VQY5i
         l+truFJzXk6kXZKZ8/M6if1xbVRKYJL6r7LwwewjlJ36+VIuwtzLdqXPmWDsXIvsDeP+
         BSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649217; x=1794254017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WgXqLTaB6oglxj40wRZgSM14LGgOyB0NNgDc9089WV0=;
        b=LY+QsuzNl5WbUubFzeYjOi7J7KAkUevxW5EMHn5A2LuRSWYiOmvFm/PPfAdWskZcjy
         jGpEn6tnLYeF0MR6E8CppmpGIc0DOx9ahdpDEyuo+3VKkkAkMgcFGA6KtycatuQzdrfJ
         VV75Nc0tVkXCqoyPkhW78FiQbqn3RBZTgUXO2GhAiDoDzt3Jo6EzDGukvaOfjJSBtLd2
         oJKxp/hZ5ZTRuiQAL2Yb19g5nEsMiaY9LiwMrCuqOWlZTZDXkjoSO8EXUH71XPCldhdI
         UHlmBjPJ1HMkTxFdbYTP2d3CQpH/lLFwV1liAaNp8W4bscIbPeXAoLQOVvkAFvYvkZ+P
         ScLg==
X-Forwarded-Encrypted: i=1; AKwUvBwvzaI0hA55y952C7ywGIdfKkoMpN5GB34SLE+hi9XkO+33/GtwrMuKNkHrrKa6riA3l1fccDQv+VPRhlE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2scHirKfQ2dataHkVncr8RShEEoAX5hIxA5CRCLpb92RusQX+
	rj8Fme8WyDeCq0gd0A+ogpyf12dmRomMM042KGocXFepWqvMnX+28U6CYBL8mrNdoOo=
X-Gm-Gg: AYBFou2wb7PqP7Wuq8IoaXKPisFB8qHzlcIg8VpXTmF4rgyU+OqQ/Q9TmjLaR5zBTYU
	no10P71c4YfxXVNXwLTkKsVX8YVU+joR2YbBKIylZZWVMPbELcvFU1nQfsjjtEcfU9bvC4U/ZUU
	iDF21iUGHeiwfYOESbPqMMp3doVg0+vHRWNJbIpHyiw0hL8KDP+dyTOgIBKRe6fEy2RfX/yamRX
	91raocsC+QrRjvrLhr9WiqFwN7OuO7yR2W2cNrO2nSAtKWQCNDVO1dYxZ/TwXe1dQEj/zxfbBXc
	WdMaXc6EJ2R+1lAeOiKeA4OiP6jkRHlaQRqkFy6qE0P2vcDLaOfBjkxgw/mpSIINp0YkBq4avvf
	sqe1WkKY8ekGXZ+9eXZQQE1EXVPSN4GrSVNsYRQ7A3c5diHpaZUY+h7k1ToHKuyd21CMLq+/XfP
	5ZUzOXFftc0tju3WL3iNI3nXY22OS3AzvTgU2/ghSM+f/K+eFL1Z0TMK1VUow5wdxZBFnYwl9Id
	jq+iIw+iUwQePQrPC4cGYYLhgk6/x91DzCAWP5M424DWW6cZ8wmghqkeenfisZT0YisOz+v4RB/
	TyYy/mxdO+zKw9WLsipNyE6lP1awG1Yf5dtO52IZdXAkTfvNTFlBCeyygaYucIVhuH2YX8FpoAu
	o/FTOcSxqLwbjwnTJVcDfPsrxhZoSc15oRdk+za0aOlrZnrY=
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr271307785e9.17.1793649216650;
        Mon, 02 Nov 2026 11:53:36 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:36 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:52 +0100
Subject: [PATCH v3 6/9] ARM: dts: omap: dm816x: Update USB node
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-6-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=2863;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=EJnKkiuemSceXMhSCbPdhy5GFuqZDHKo16lb5OWeVfM=;
 b=ESCjvnfz5BaaRmtGIY0BXm6cWwwqwJZz//AnUTjaN8AjdB+wYwYVBSVpHdY1qsQm/aRw6J459
 nTfcAhJhQm5APUGdpa6Zx677/Klogwl+XT/qmDwr+30RfMu+RVgFJIi
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

USB node was not working correctly with DMA enabled as the supporting
code had been updated without updating this SoC's device tree. Bring the
device tree more up to date so that it works with DMA enabled.
Removing deprecated usb_otg_hs `ti,hwmods` property in DT node in favour
of ti-sysc implementation.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 40 +++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index 1e8d225dfb2c..314e5e580c8b 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -573,18 +573,26 @@ uart3: serial@48024000 {
 		};
 
 		/* NOTE: USB needs a transceiver driver for phys to work */
-		usb: usb_otg_hs@47401000 {
-			compatible = "ti,am33xx-usb";
-			reg = <0x47401000 0x400000>;
-			ranges;
+		usb: target-module@47400000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x47400000 0x4>,
+			      <0x47400010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_SMART>;
+			ti,sysc-delay-us = <2>;
+			clocks = <&default_clkctrl DM816_USB_OTG_HS_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ti,hwmods = "usb_otg_hs";
+			ranges = <0x0 0x47400000 0x8000>;
 
-			usb0: usb@47401000 {
+			usb0: usb@1400 {
 				compatible = "ti,musb-dm816";
-				reg = <0x47401400 0x400
-				       0x47401000 0x200>;
+				reg = <0x1400 0x400>,
+				      <0x1000 0x200>;
 				reg-names = "mc", "control";
 				interrupts = <18>;
 				interrupt-names = "mc";
@@ -621,10 +629,10 @@ &cppi41dma 11 1 &cppi41dma 12 1
 					"tx14", "tx15";
 			};
 
-			usb1: usb@47401800 {
+			usb1: usb@1c00 {
 				compatible = "ti,musb-dm816";
-				reg = <0x47401c00 0x400
-				       0x47401800 0x200>;
+				reg = <0x1c00 0x400>,
+				      <0x1800 0x200>;
 				reg-names = "mc", "control";
 				interrupts = <19>;
 				interrupt-names = "mc";
@@ -661,12 +669,12 @@ &cppi41dma 26 1 &cppi41dma 27 1
 					"tx14", "tx15";
 			};
 
-			cppi41dma: dma-controller@47402000 {
+			cppi41dma: dma-controller@2000 {
 				compatible = "ti,am3359-cppi41";
-				reg = <0x47400000 0x1000>,
-				      <0x47402000 0x1000>,
-				      <0x47403000 0x1000>,
-				      <0x47404000 0x4000>;
+				reg =  <0x0000 0x1000>,
+				       <0x2000 0x1000>,
+				       <0x3000 0x1000>,
+				       <0x4000 0x4000>;
 				reg-names = "glue", "controller", "scheduler", "queuemgr";
 				interrupts = <17>;
 				interrupt-names = "glue";

-- 
2.56.0

