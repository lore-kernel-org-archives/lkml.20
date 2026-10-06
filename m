Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD1F3E5EDB
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318352; cv=none; b=uxnzJ8ligrSxHVjqiufdXHua+nV+6zfZ6BWOT77AN9ZIgjn88fdJZWzQhtGf6uldR7f8eXvpV8eT/5QnNXG9gCc3Cc0IpPFrY180HbYxXJdcVM87ozuRJoG2E+lT82PRXyz54fz5KPWa4s72ot1/4Zg1ncjW8igvXDtRE5NpzNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318352; c=relaxed/simple;
	bh=EOMVP3YQwkcIyqlWrQGFAqi7cRnWf4pYZmNhfVKctYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cTsF0VSgMe3a/eaZl8KTIX4RGvUG3jHkodiw4xC2F12XBEWxh6zDzcoZNPUAx1FyLqKFxIdPKzLWbNXTRuxw2SmsB6dLieMCKLjJLUEKEbLaZHK3JPwVE0jaGYIIU+C4ExsnJRLpuyYQmDkiiitofOBSXaf0e8LMkbePg05Rudg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Zoi0P0Nz; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Zoi0P0Nz"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6cf995766a3so824955eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318350; x=1791923150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+ILfk0/yu3AcCYfzlStmh4VnAqvAHjplZrGY6KB/T8=;
        b=Zoi0P0NzQI7obJSl8NJ8k3Urh4mofmZ//Wtl3y+BW+defDjgNGAa902sOUS6v81pR9
         RfxJvwD75zAsl95XF7WbHHa6Ai4wJP783tHpsomiiFH1gbdC7MHN0licp81jniNziCmU
         Szofe8L75M/KxFMnnZQW1NKIM4nln8nWM3ks5x1y3+V2gk4hVIG4LbpN3E7sYE5JC3wY
         tVLiOSyeZVroM0JTBJOc/zbAOinK8HeYBZZB+g7g6TrFvfjeeiBY1kA+YuqHXNJcOglA
         f6s6WwAm6g+3/R0ts4gdVGQzlXW7CwdGdHyevk8q6+LVA/Q5Ir5i/2KuTUD4g3pTVbPR
         TEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318350; x=1791923150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+ILfk0/yu3AcCYfzlStmh4VnAqvAHjplZrGY6KB/T8=;
        b=pqIgt3yWS+JZt3KRuJ8h9v4+pRocK6LQHZr2SUGk7IGbmuY8fXxx+ZeyITJunfCruQ
         yJlIV6JQEFO980Zs0K9b4Ip91qiWonfrm5reXnc+z6tdNssSXa+UCP20doOSPEjW5R1+
         JUgJmyRpf5M98lSfr8G+OggmKYrT0bHJLuZ0hwmowNKCzsCIkP207FyYulpB3rO3GMyS
         bA+Z02PhqgbXEnep6UNVSchQhxsz/a8/FDSM1ghNPV8ZBcgptVhHaP54NCbJKP51MXuU
         WNZasqWEeuA5w/z99BZdGbRhtq/52dwmORkI9I/n5Q+FKrgdQA1vghnLOV+Pp28YmZP8
         /lqg==
X-Forwarded-Encrypted: i=1; AKwUvBwyWGC92v1s/SOveNQNJVXr1b6ijS+6GfYuxQNBYIih80lAN7rCQHJZNBubmTBjvyShlnPKI0o6qbB0a7I=@vger.kernel.org
X-Gm-Message-State: AFuF++m3nsjebfQaYtynZ/DwzzFwYclO3hPnHY4XRU3OL8c8og6Le7W8
	7lX3ArzaCubYG+/6GBjXFqaiMFXapimxxf0Wk2StygevNLUhhSlbejDeDTsuClyoJkg=
X-Gm-Gg: AYBFou2nUIcJ90TtLgEURwAjMXYZpIhN/sgXXqH8l8hl30BYH0FdJ1AmlzsJZ+NDXDE
	fFvlv5rxiofFj6CBtWzkIgmwGAqo8D1URJpUdKt2jYK3ijkiD0y6MSv/3IzhtV3BcnKLqN9KRV9
	nhvNafbaglMHn6R8RO0bMf+RDhVNxqNt3XnusFgMUa2GuqbwtVdOJayVjc5dtTsz7Jkt0tZ/a2K
	ZCT1PdrxQ3weQEmSZrpr3VnRcXkbmOXhEM0cfcflusUItSjEXZi6AUMBiOFXts5st0/s8lUAwq1
	XvLxLFNfcCujvm6XpNdgqrSG7htGOxy9LTKQH9avEiDTP/Jiga6B3UUHT2yLTy6B7YodjUP4OxG
	drziGS4JOyvza6XVXxy1fXI9HawbC5Rx9soQyprbX4V+LpHuyDaR7E5ZxnmCqk0QjJJSWEZN+0E
	Jo1Iy+xewGzO1cfsep5bC3aswbd9GJ7rIb7b1D2cJYf7qu7Tw/tEHnn5BD1mu2ca066alsAAXcL
	g==
X-Received: by 2002:a05:6820:4c07:b0:6d7:c2d2:3bb6 with SMTP id 006d021491bc7-6e7a825d4a2mr306044eaf.74.1791318349916;
        Tue, 06 Oct 2026 13:25:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:48 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Oct 2026 15:25:04 -0500
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8395-genio-common: fix the
 panel supplies
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-4-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2385; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=EOMVP3YQwkcIyqlWrQGFAqi7cRnWf4pYZmNhfVKctYk=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVk6xsdsb38h2XMoZmyUXwDh+TV2jSd63sKWb
 LEAsaeGN0yJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZOgAKCRDCzCAB/wGP
 wOTwB/9qpjbVdEYGrVDi0toIg94lEZMC2rKuCDdP4g4DkG41TRMX0aSRt+zR3KkDxJ79JtVyIeK
 S+MIMyG8ojRbQ0JtT2MpPwX99fFJ44xH9o102h6vWagCYrVTTW/foDhJcKWL1r/LSZ3R2e+hdZF
 GWoHtZXRpEuqx1H8Du8FXvgPvATmIBKjVn1zNuKGT8xczC5l7VctkvrZ1m+TgdrzpvIVbWkCYV0
 i7jqtJ1kRXwdmsfY8j22vgm4OSBFZnW7fTwIpWgyiFu3ZpRg6n4ROXFI6k7A36VAL/MH9B7txNx
 pmagYP8bpZRWIwZGRsYixjEAafiGDg+mkOSiHsMiIg9lXTLf
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Point each supply of the Startek KD070FHFID078 panel at the rail that
feeds it on the Genio 1200 EVK, and add the vddp-supply that the
himax,hx8279 binding now requires.

The Genio 1200 EVK is wired as follows:
- VDD (backlight LED power) comes from VSYS through a switch enabled by
  GPIO47. That is the regulator previously described as lcm0_iovcc, so
  rename it to lcm0_vdd and feed it from VSYS.
- IOVCC comes directly from MT6360 LDO2.
- VDDP comes directly from MT6360 LDO1. The lcm0_vddp regulator only
  passed LDO1 through, so drop it.

The previous description pointed vdd-supply at the VDDP rail and used
the VDD switch as the IOVCC regulator. It worked only because the driver
enables all the supplies together.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 .../boot/dts/mediatek/mt8395-genio-common.dtsi      | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index aef908df530e..f415b6f71653 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -175,22 +175,16 @@ button-volume-up {
 		};
 	};
 
-	lcm0_iovcc: regulator-vio18-lcm0 {
+	lcm0_vdd: regulator-vsys-lcm0 {
 		compatible = "regulator-fixed";
-		regulator-name = "vio18_lcm0";
+		regulator-name = "vsys_lcm0";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
 		enable-active-high;
 		gpio = <&pio 47 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&dsi0_vreg_en_pins>;
-		vin-supply = <&mt6360_ldo2>;
-	};
-
-	lcm0_vddp: regulator-vsys-lcm0 {
-		compatible = "regulator-fixed";
-		regulator-name = "vsys_lcm0";
-		regulator-always-on;
-		regulator-boot-on;
-		vin-supply = <&mt6360_ldo1>;
+		vin-supply = <&reg_vsys>;
 	};
 
 	wifi_fixed_3v3: regulator-2 {
@@ -303,8 +297,9 @@ panel@0 {
 		backlight = <&backlight_lcm0>;
 		enable-gpios = <&pio 48 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&pio 108 GPIO_ACTIVE_HIGH>;
-		iovcc-supply = <&lcm0_iovcc>;
-		vdd-supply = <&lcm0_vddp>;
+		iovcc-supply = <&mt6360_ldo2>;
+		vdd-supply = <&lcm0_vdd>;
+		vddp-supply = <&mt6360_ldo1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&panel_default_pins>;
 

-- 
2.53.0

