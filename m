Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4C2277026
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792305367; cv=none; b=d4ljQxgi6rgMoSmT2Qb0yIfiLENdPbVtl8oBnCLhuxHoOmSDD0FJ5MK5FGJGGVxahtAkm/67BF9WpuTDCY6ndNuGalthkVm3kJFVr5G3/vCoZLRUUvFycBk2tQt4E1BNOXt0F8s0affOfGxkx3esrc7ko9WOsElmy1C1S9lwqKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792305367; c=relaxed/simple;
	bh=DIGgGFRxBYdsTRjIcDx9TRGq2bO/g80rLfHpx6FotjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SvGXdUaZvFpPkbHKuZeORPKmHYKr3ODFtC0IVi0OV1E6UReM0l3tpHVM6MdF68kgPS+4PhQxvWoF/ur9szx42gzEDbzfBNRxp/WgzchQE2S75x8wufhYtrVmN25Hm/Mp+Svv59Nt5mdIG0mjFanFRr3wsq8+VfyiqHE2iaxoGrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mv0KWeAK; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mv0KWeAK"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so131130b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792305366; x=1792910166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tCpwVytRBHG001ylJlx6CLpltdlyxsoct+VeDjqc/64=;
        b=mv0KWeAKzCnIQoce17NAZH4uFb/O/MNTayDJf1iOcM+2IL03BHKjoz2GYA+VnG4ko+
         +tI/aM/2nFp0oNHSnm7dki34Lo7vsw5o+lGRKugyoIgPi7BXFAXmGbySeBUt6tARk8VP
         oqmy4Ua1Tzn8LWlHYJqh0H9di6+Zn4uDSaqTnp7uDgOdanm9YjswVNssHeeCAutwahC2
         8nZBlB9yW/nasWY16Q6LnMcSeqI0u95heYlsKEpUsSuULMea9ml6xyaFlHkcpE/3hrts
         GGMLSKAnzG6L+Ubc7aePkLMNQgH6kT3u2Eq/DiY17sDZhiPr8wfLIIFNiiwU2o9qJ6tP
         UHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792305366; x=1792910166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tCpwVytRBHG001ylJlx6CLpltdlyxsoct+VeDjqc/64=;
        b=Uk0vlS0nm62v5yvYhHJm3jT0pej/y0jaBwkIXTk0fpMHVGEi5rgjS9TqMhrn1lZAWr
         j1hRNPjt3MwTUq78lnGg9pstT4/6wJQUS58TvzbjCTMedPwB3YvmAZpAsw+jhVSIUy7G
         9pLxsJnOHg97/bu7CTBC48pc8oBNgNwaMPDmocAkNAYds554izYoBKE4JlBCsp7iSQm9
         1stAy07V0kkqTzVxhNEbWWGenkV6IABmN5L8hyONO7AUozJKAsGfSNjWU5/TebbQja3s
         /tG9QdAwGfY7ybwtsswx51HNOcrbNXMeljUwK7rE37BrPWpIQljYbUFx0wEoHaviQlZL
         WFPg==
X-Forwarded-Encrypted: i=1; AKwUvBytYaru+5EOj9FsN2d4EYa6OltpeSkORX+kKlU35lbe35IDDOw4n+dpeLDtWn7UOcAjb5lteCRCKCaDrnk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxJO5YnDlpqYo0hen2Fm9Mg1DGyGh82zGrrZyv5kwnHCwv1aiI
	XM50X/kcKbmWMQDGXUGsmdIe3IgWzlnYWyw8Tq9yRhBoPV/704xpaQrB
X-Gm-Gg: AYBFou3yuq7dp5kbZZiVjYG+PEPDr5uHfYL0T8+rLkhxs9qfQoyfr/SAmL4zCGrt/Vz
	/fNVB9EXwsyjz4iAt9g6gKi42ObWTNXqNpllV1Fso4Elgp27sBwt8g3wpcd/nJyCnOPAsjdtIjZ
	fqkftOVwEunWMTfSrmV42+mRHs/T/6H9ob3joTHdgk4sJT0TQt63KdZVp5FfpiNMDYlDauzdPoa
	Gu2/P5eeq6w8TXc6lSQY3H5WMRQK8IyWnmw2y4hcTximV8ItpXAnb6JeLdgTKp+agrmTB/3Xz02
	r2jaj3P9xjjVvKLgSaYf6lOQgN96lsXyQKwa5gqlvc5UYO8wdHSx2YM9Wm0ZzxZyS+UxsR2uQnn
	4afM3ahF+/Brl982d+n1LiHhYEvvELhW6ZHLsJzlvgapvDMoRgJvv9PQBSuFlOBcbcFzkly2gAI
	dyfMw6q+qC5IfTLdRyjxCCh6gFFGkOQsfQgrFto4U727CNvJ8AZiZZcDTNWqnszHUB085WcR5ar
	BnRZwzGk/Zc4c941g==
X-Received: by 2002:a05:6a00:13a0:b0:89e:ad95:e01 with SMTP id d2e1a72fcca58-8a04be6af1emr3279470b3a.46.1792305365889;
        Sat, 17 Oct 2026 23:36:05 -0700 (PDT)
Received: from [127.0.1.1] (2403-580b-35b2-8--43b.ip6.aussiebb.net. [2403:580b:35b2:8::43b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57653ea9sm2718874b3a.32.2026.10.17.23.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:36:05 -0700 (PDT)
From: Kel Modderman <kelvmod@gmail.com>
Date: Sun, 18 Oct 2026 16:35:30 +1000
Subject: [PATCH 1/2] arm64: dts: rockchip: Move SD card regulator to Orange
 Pi 5/5B
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-opi5pro-amp-v1-1-05c84e91bf6d@gmail.com>
References: <20261018-opi5pro-amp-v1-0-05c84e91bf6d@gmail.com>
In-Reply-To: <20261018-opi5pro-amp-v1-0-05c84e91bf6d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Dennis Gilmore <dennis@ausil.us>, Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Kel Modderman <kelvmod@gmail.com>
X-Mailer: b4 0.16.0

vcc_3v3_sd_s0 switches SD card power via GPIO4_B5 on the Orange Pi 5 and
5B, but the shared rk3588s-orangepi-5.dtsi is also included by the
Orange Pi 5 Pro. On the Pro, SD power is not switched and GPIO4_B5
enables the headphone amplifier instead, so the inherited regulator
claims that pin.

Move the regulator and the sdmmc vmmc-supply into
rk3588s-orangepi-5-5b.dtsi, which only the 5 and 5B include.

Fixes: f47af8ebbe53 ("arm64: dts: rockchip: Add Orange Pi 5 Pro board support")
Signed-off-by: Kel Modderman <kelvmod@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi    | 11 -----------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
index 6e081bc06c..13351e4130 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
@@ -67,6 +67,16 @@ vbus_typec: regulator-vbus-typec {
 		regulator-max-microvolt = <5000000>;
 		vin-supply = <&vcc5v0_sys>;
 	};
+
+	vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
+		compatible = "regulator-fixed";
+		gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_LOW>;
+		regulator-name = "vcc_3v3_sd_s0";
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
 };
 
 &gmac1 {
@@ -218,6 +228,10 @@ regulator-state-mem {
 };
 
 
+&sdmmc {
+	vmmc-supply = <&vcc_3v3_sd_s0>;
+};
+
 &usb_host0_xhci {
 	dr_mode = "otg";
 	usb-role-switch;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index fd0efa8d1b..615e914fdc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -39,16 +39,6 @@ hdmi0_con_in: endpoint {
 		};
 	};
 
-	vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
-		compatible = "regulator-fixed";
-		gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_LOW>;
-		regulator-name = "vcc_3v3_sd_s0";
-		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_3v3_s3>;
-	};
-
 	vcc5v0_sys: regulator-vcc5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0_sys";
@@ -297,7 +287,6 @@ &sdmmc {
 	no-mmc;
 	no-sdio;
 	sd-uhs-sdr104;
-	vmmc-supply = <&vcc_3v3_sd_s0>;
 	vqmmc-supply = <&vccio_sd_s0>;
 	status = "okay";
 };

-- 
2.55.0

