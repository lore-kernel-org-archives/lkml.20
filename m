Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421204;
	b=X1YD1WiSmKdoZwgUBsRiVbBTPyRcgXhvrTXd+9/0lsBRQjwnVGYJPYeGTVjE9LZgGS5o
	 iHIg9OkXnF9KV0s52Xy8svfTH/Qbr/pMLUj//4sLJXfYLrAtnYucNFs6sU0XkjtkIveob
	 ZAoIZoi4MZm3yyYM9Yzk1IJV7bjbzwFwTHsHv6RkIYsqM6PWc6ykK9AAL5nVKLfpAwtph
	 EtXmGxu0pb5rVd80j3niS0h9SzzM2tSaVJaY9BJrA3HGF/6c4umKv4wiINbfMI46mPra5
	 7KEs3K7iPVNT/TQ84B2XcNhMjhPRke3zk0cxfx9xgMP9PVIt7f+Ucz7QNOB1ZauY+lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=z0f4UdFcdCIjne4UCGJfkh/TdN8nWfrGk1TSR9G6FV0=;
	b=UzGfp2cn+Aypr2/CXXOVWDZBX4vLwMk6Eptpi5M/Xp7GTZ5/WHiOPO/RcLGdh75AQe7r
	 e4nKJQevv3AeDPlBTt27KqmP8Mb8sypLe0DJhLYhf5vznH9t3QJg/1e7m6m+bxVc/m37s
	 zuKGN4ibAPRxctUwVbRnLxFaBhZjW0a2iLqd4hj46CM7o8E1A485zXFbSRDKrv1t32FbB
	 P6XGGCH/Dflk9d9ApauJKpF4Rvo2TliAnFbIn9/Td08XWaDIx1bE5ZedjVgou86ldjHZ7
	 sUw7Wp/dGBf161Y6EemjWo1o9epnXcNhHjJoBet+N2GMreiGYt0nPRe5B2oyzh1NCnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U0tzUGjA;
	arc=none smtp.remote-ip=74.125.231.135
Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E0C60A2626
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6E0C60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U0tzUGjA
Received: by mail-oo2-f7.google.com with SMTP id 46e09a7af769-8210db80578so972902a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421203; x=1795026003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0f4UdFcdCIjne4UCGJfkh/TdN8nWfrGk1TSR9G6FV0=;
        b=U0tzUGjAwng2+s2J1UV3v3um5q/VRhNb9EduXTJqZdHChZtjt3TD/6RXGRZzYlS8ci
         zUseboiHy/4BNGI2ZbgxNgujUCbi/CsvHOJQuvmir0fisoLy6GPxR9xTeci15d3YGniJ
         K9Lj+mx28DZ+3jjc0j6CGyxc3SM66YKLj0ygds/KtAKPgRPwnQCa9750Wray8XFCNv+k
         iOCfDzDJob0lVvnWHpruA3qmRYJVgG39ChqxQFpM/mAiK0HBn97MUWJP/Bh1nZKWSEnB
         3wUA68tWCJc1fKXnuANIuHHPqma7JSVl7FpSiWJhWxV7+AH8R05A6Yg4I2cYrCZmR4aa
         FbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421203; x=1795026003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0f4UdFcdCIjne4UCGJfkh/TdN8nWfrGk1TSR9G6FV0=;
        b=s6crTOTUsdzr2VVKiceh43QyvPC1E8kYhfbM1pv0zKALjg42gv2QjhKNLFLIAOjU+9
         tKTDQ5H7dB91KfD2dEBXhktlUtB43j01gdQhOEx/Srj4y5SCC+GoPMh33JwhXoP+FOgV
         2p2gaE7Ici6WzrCqNgfWdbp6KQxoykkRzv3Wcn60ymVaJIwNzUk4E0fzqmYFdQN4qrAf
         IDrkdV5md1nyPvZPSMP3HeIvOHXQSyBN4IGUQ9/06J11+6q4zAHXpLPVgyKF8u8xAjjR
         N0hchK8odXbFhfCj28ZmMqtrvYF/8IkHoZ5727K9EuTiQoJsZ8kleGk4TksnXMdh5L/9
         heEg==
X-Forwarded-Encrypted: i=1; AL+hErFwCToRiXh+pRf9Z9MUp9hbElrBGyb05ydX2A3RiiKVWTfp+lIk4+oIOeyFnBaRgc0A/8XwL191nrIJGlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YHJTrIAUNeQsqMceh1Lk4IfmlOH0EmDxbZ0w3S+nqHnHsTIyz
	g2bmQIEdpbolcmUodeBj+eBMNAz7MSbnoXLLivVRawU0riXQmy1YPHix
X-Gm-Gg: AYBFou2JyMjc77hm1bne63DdFllYf8PMACL9awFnYatPIBcNrgQWX2iBr5IowCewJbg
	ERjIUs7rSzBMg4qOceBVBqVICHYx6xdQnwSy5uYCHzZuDGchwY5X9c4gciLo7jMxE81ceYMz3gK
	HmTdznfjZqpHmQQqfXpo6vZ1Rq2t/h36V1pUe2XcNkHVYMi4GMrC/GzH1GjJ0bA+XJLcouNcDqt
	FPGIJu/tbzalteMHrLdoXoirlLkvFrQpJGZRIgY6Xr0oNQdZB2su8UDeUgstkCAe2+qn5u190jv
	bHpmUmh+VaEy3lKvnRbslerRZIUKWtlD5y9bX+IFQYur7e1Iyi+i2P15umqKFiOEEAQr2UI9rj2
	y7ChzrsafNFnivbTKytBq60xRXGj9tMS9G8qR4O/wZi6N8rlPzjMGGzKlPsEz+cjNQGdrCSoMjK
	o6YFV/RsBPK5TrX7qYwVMYwOs6pShTrcCOtwErhhiWUF14v6G7Qxv5LCivZBQoiWLdvhvR/1Sz5
	h6Pa2Mg2BS8BQIRpifAUFTrCzDmy6bndo0Y/Zgh9nNK4tMeKRzEHUqGUbPtJNp8VCpx2x8yW5JI
	UwUcnOilgY00vvQe0p+tdciMK5O0ShrklosMF72W67g77ZTZkb+ItL8CimJrA9bJcTIQJzHXwns
	BqKPI4q0vuI8gg8khsNqvMPvpx0iUk+RCIp3+nl8IUQ==
X-Received: by 2002:a05:6830:441e:b0:822:b69c:ff69 with SMTP id 46e09a7af769-860f28de64cmr2729842a34.21.1794421202523;
        Wed, 11 Nov 2026 10:20:02 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:02 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:51 -0600
Subject: [PATCH 2/5] arm64: dts: mediatek: Add MT8173 Amazon suez
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
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-2-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=18179;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=hCf0Jfx8ZicMF1WTD0P/zCRw3DvlUgDhQImb5eIckQ0=;
 b=RY9o7ybffNTQKDMVPTpRLshVcJJMO0tdVsbaThAPYQbdI2oK4R43TV67pIs3N7uh8RR9elNfI
 SLIrYBKrJrABHN2ewRW7Dpz8FQL7HPKV9y4Jv/hmHKJ/8xqPW7hrEIv
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Add a device tree for the Amazon Fire HD 10 (2017), codename suez, an
MT8173 tablet with an MT6397 PMIC and 2 GiB of RAM.

This supports the eMMC, the microSD slot, the micro-B port as a USB
peripheral, the panel and its backlight, the touchscreen, the
accelerometer, the light sensor, the charger, the lid switch, the power
key, CPU frequency scaling and the board's skin thermistors.

The board needs a PSCI 1.0 firmware, such as upstream TF-A. The stock
BL31's CPU_ON never powers on the secondary cores.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 .../arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 676 +++++++++++++++++++++
 2 files changed, 677 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a86fb313b1a9..ec85d7c49d0d 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -93,6 +93,7 @@ mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18-dtbs := \
 	mt7988a-bananapi-bpi-r4-pro-cn18.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-amazon-suez.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
new file mode 100644
index 000000000000..6fd7777eb491
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
@@ -0,0 +1,676 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 Ryan Brue <ryanbrue.dev@gmail.com>
+ */
+
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "mt8173.dtsi"
+
+/ {
+	model = "Amazon Fire HD 10 (2017)";
+	chassis-type = "tablet";
+	compatible = "amazon,suez", "mediatek,mt8173";
+
+	aliases {
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	lid-switch {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hall_pins>;
+
+		switch-lid {
+			label = "hall-effect-sensor";
+			gpios = <&pio 124 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			debounce-interval = <20>;
+		};
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x80000000>;
+	};
+
+	backlight_enable: regulator-backlight-enable {
+		compatible = "regulator-fixed";
+		regulator-name = "backlight_enable";
+		gpio = <&mt6397pin 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops@90000000 {
+			compatible = "ramoops";
+			reg = <0 0x90000000 0 0x80000>;
+			console-size = <0x40000>;
+			record-size = <0x8000>;
+			ftrace-size = <0x20000>;
+		};
+	};
+
+	/* Board skin thermistors: 10 kOhm NTCs under 39 kOhm pull-ups to 1.8 V */
+	thermistor-0 {
+		compatible = "murata,ncp15xh103";
+		io-channels = <&auxadc 0>;
+		pullup-uv = <1800000>;
+		pullup-ohm = <39000>;
+		pulldown-ohm = <0>;
+	};
+
+	thermistor-1 {
+		compatible = "murata,ncp15xh103";
+		io-channels = <&auxadc 1>;
+		pullup-uv = <1800000>;
+		pullup-ohm = <39000>;
+		pulldown-ohm = <0>;
+	};
+
+	thermistor-2 {
+		compatible = "murata,ncp15xh103";
+		io-channels = <&auxadc 12>;
+		pullup-uv = <1800000>;
+		pullup-ohm = <39000>;
+		pulldown-ohm = <0>;
+	};
+};
+
+&cpu0 {
+	proc-supply = <&mt6397_vpca15_reg>;
+};
+
+&cpu1 {
+	proc-supply = <&mt6397_vpca15_reg>;
+};
+
+&cpu2 {
+	proc-supply = <&mt6311_vcpu_reg>;
+	sram-supply = <&mt6397_vsramca7_reg>;
+};
+
+&cpu3 {
+	proc-supply = <&mt6311_vcpu_reg>;
+	sram-supply = <&mt6397_vsramca7_reg>;
+};
+
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "boe,tv101wum-nm0", "novatek,nt51021";
+		reg = <0>;
+		vdd-supply = <&mt6397_vgp6_reg>;
+		avdd-supply = <&mt6397_vgp6_reg>;
+		havdd-supply = <&mt6397_vgp6_reg>;
+		reset-gpios = <&pio 105 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_pins>;
+		backlight = <&backlight_lcd>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+
+	port {
+		dsi0_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "evervision,ev-ft5726";
+		reg = <0x38>;
+		interrupts-extended = <&pio 14 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&mt6397pin 12 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_pins>;
+		vcc-supply = <&mt6397_vgp3_reg>;
+		iovcc-supply = <&mt6397_vgp4_reg>;
+		touchscreen-size-x = <1200>;
+		touchscreen-size-y = <1920>;
+	};
+};
+
+&i2c1 {
+	mediatek,use-push-pull;
+	status = "okay";
+
+	mt6311: pmic@6b {
+		compatible = "mediatek,mt6311-regulator";
+		reg = <0x6b>;
+
+		regulators {
+			mt6311_vcpu_reg: VDVFS {
+				regulator-name = "VDVFS";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1393750>;
+				regulator-ramp-delay = <10000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	accelerometer@18 {
+		compatible = "bosch,bma253";
+		reg = <0x18>;
+		mount-matrix = "0", "-1", "0",
+			       "-1", "0", "0",
+			       "0", "0", "-1";
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	bq24297: charger@6b {
+		compatible = "ti,bq24297";
+		reg = <0x6b>;
+		interrupts-extended = <&pio 9 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&charger_pins>;
+		omit-battery-class;
+	};
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	backlight_lcd: backlight@2c {
+		compatible = "ti,lp8557";
+		reg = <0x2c>;
+		enable-supply = <&backlight_enable>;
+		dev-ctrl = /bits/ 8 <0x47>;
+		init-brt = /bits/ 8 <0x64>;
+
+		/* In the order the vendor kernel writes them */
+		rom-14h {
+			rom-addr = /bits/ 8 <0x14>;
+			rom-val = /bits/ 8 <0x0f>;
+		};
+
+		rom-13h {
+			rom-addr = /bits/ 8 <0x13>;
+			rom-val = /bits/ 8 <0x01>;
+		};
+
+		rom-11h {
+			rom-addr = /bits/ 8 <0x11>;
+			rom-val = /bits/ 8 <0x06>;
+		};
+
+		rom-12h {
+			rom-addr = /bits/ 8 <0x12>;
+			rom-val = /bits/ 8 <0x2b>;
+		};
+
+		rom-15h {
+			rom-addr = /bits/ 8 <0x15>;
+			rom-val = /bits/ 8 <0x42>;
+		};
+
+		rom-16h {
+			rom-addr = /bits/ 8 <0x16>;
+			rom-val = /bits/ 8 <0xe0>;
+		};
+	};
+
+	light-sensor@23 {
+		compatible = "liteon,ltr559";
+		reg = <0x23>;
+	};
+};
+
+/* Consumes the VPU, which is disabled below */
+&mdp_rdma0 {
+	status = "disabled";
+};
+
+&mfg_async {
+	domain-supply = <&mt6397_vgpu_reg>;
+};
+
+&mipi_tx0 {
+	status = "okay";
+};
+
+&mmc0 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc0_pins_default>;
+	pinctrl-1 = <&mmc0_pins_uhs>;
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	hs400-ds-delay = <0x14015>;
+	cap-mmc-hw-reset;
+	non-removable;
+	mediatek,hs200-cmd-int-delay = <30>;
+	mediatek,hs400-cmd-int-delay = <14>;
+	mediatek,hs400-cmd-resp-sel-rising;
+	vmmc-supply = <&mt6397_vemc_3v3_reg>;
+	vqmmc-supply = <&mt6397_vio18_reg>;
+	/* HS200 tuning fails on the default MSDC50_0 parent */
+	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
+	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
+	status = "okay";
+};
+
+&mmc1 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_pins_default>;
+	pinctrl-1 = <&mmc1_pins_uhs>;
+	bus-width = <4>;
+	max-frequency = <200000000>;
+	cap-sd-highspeed;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	cd-gpios = <&pio 1 GPIO_ACTIVE_HIGH>;
+	vmmc-supply = <&mt6397_vmch_reg>;
+	vqmmc-supply = <&mt6397_vmc_reg>;
+	mediatek,hs200-cmd-int-delay = <4>;
+	status = "okay";
+};
+
+&pio {
+	charger_pins: charger-pins {
+		pins-int {
+			pinmux = <MT8173_PIN_9_EINT9__FUNC_GPIO9>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
+	hall_pins: hall-pins {
+		pins-hall {
+			pinmux = <MT8173_PIN_124_KPCOL2__FUNC_GPIO124>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
+	mmc0_pins_default: mmc0-default-pins {
+		pins-cmd-dat {
+			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
+				 <MT8173_PIN_58_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
+				 <MT8173_PIN_59_MSDC0_DAT2__FUNC_MSDC0_DAT2>,
+				 <MT8173_PIN_60_MSDC0_DAT3__FUNC_MSDC0_DAT3>,
+				 <MT8173_PIN_61_MSDC0_DAT4__FUNC_MSDC0_DAT4>,
+				 <MT8173_PIN_62_MSDC0_DAT5__FUNC_MSDC0_DAT5>,
+				 <MT8173_PIN_63_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
+				 <MT8173_PIN_64_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
+				 <MT8173_PIN_66_MSDC0_CMD__FUNC_MSDC0_CMD>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		pins-clk {
+			pinmux = <MT8173_PIN_65_MSDC0_CLK__FUNC_MSDC0_CLK>;
+			bias-pull-down;
+		};
+
+		pins-rst {
+			pinmux = <MT8173_PIN_68_MSDC0_RST___FUNC_MSDC0_RSTB>;
+			bias-pull-up;
+		};
+	};
+
+	mmc0_pins_uhs: mmc0-uhs-pins {
+		pins-cmd-dat {
+			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
+				 <MT8173_PIN_58_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
+				 <MT8173_PIN_59_MSDC0_DAT2__FUNC_MSDC0_DAT2>,
+				 <MT8173_PIN_60_MSDC0_DAT3__FUNC_MSDC0_DAT3>,
+				 <MT8173_PIN_61_MSDC0_DAT4__FUNC_MSDC0_DAT4>,
+				 <MT8173_PIN_62_MSDC0_DAT5__FUNC_MSDC0_DAT5>,
+				 <MT8173_PIN_63_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
+				 <MT8173_PIN_64_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
+				 <MT8173_PIN_66_MSDC0_CMD__FUNC_MSDC0_CMD>;
+			input-enable;
+			drive-strength = <6>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <MT8173_PIN_65_MSDC0_CLK__FUNC_MSDC0_CLK>;
+			drive-strength = <6>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins-ds {
+			pinmux = <MT8173_PIN_67_MSDC0_DSL__FUNC_MSDC0_DSL>;
+			drive-strength = <8>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins-rst {
+			pinmux = <MT8173_PIN_68_MSDC0_RST___FUNC_MSDC0_RSTB>;
+			bias-pull-up;
+		};
+	};
+
+	mmc1_pins_default: mmc1-default-pins {
+		pins-cmd-dat {
+			pinmux = <MT8173_PIN_73_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
+				 <MT8173_PIN_74_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
+				 <MT8173_PIN_75_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
+				 <MT8173_PIN_76_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
+				 <MT8173_PIN_78_MSDC1_CMD__FUNC_MSDC1_CMD>;
+			input-enable;
+			drive-strength = <4>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <MT8173_PIN_77_MSDC1_CLK__FUNC_MSDC1_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <4>;
+		};
+
+		/* Pulled up so that an empty slot, which grounds it, reads low. */
+		pins-insert {
+			pinmux = <MT8173_PIN_1_EINT1__FUNC_GPIO1>;
+			bias-pull-up;
+		};
+	};
+
+	mmc1_pins_uhs: mmc1-uhs-pins {
+		pins-cmd-dat {
+			pinmux = <MT8173_PIN_73_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
+				 <MT8173_PIN_74_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
+				 <MT8173_PIN_75_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
+				 <MT8173_PIN_76_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
+				 <MT8173_PIN_78_MSDC1_CMD__FUNC_MSDC1_CMD>;
+			input-enable;
+			drive-strength = <10>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <MT8173_PIN_77_MSDC1_CLK__FUNC_MSDC1_CLK>;
+			drive-strength = <10>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+	};
+
+	panel_pins: panel-pins {
+		pins-reset {
+			pinmux = <MT8173_PIN_105_MSDC2_CMD__FUNC_GPIO105>;
+			bias-disable;
+		};
+	};
+
+	touch_pins: touch-pins {
+		pins-int {
+			pinmux = <MT8173_PIN_14_EINT14__FUNC_GPIO14>;
+			input-enable;
+			bias-disable;
+		};
+	};
+};
+
+/* DISP_PWM is on the main display path, although the backlight is on I2C */
+&pwm0 {
+	status = "okay";
+};
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6397";
+		interrupts-extended = <&pio 5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6397rtc: rtc {
+			compatible = "mediatek,mt6397-rtc";
+		};
+
+		mt6397clk: clocks {
+			compatible = "mediatek,mt6397-clk";
+			#clock-cells = <1>;
+		};
+
+		mt6397pin: pinctrl {
+			compatible = "mediatek,mt6397-pinctrl";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		mt6397keys: keys {
+			compatible = "mediatek,mt6397-keys";
+			mediatek,long-press-mode = <1>;
+			power-off-time-sec = <0>;
+
+			power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+		};
+
+		regulators {
+			compatible = "mediatek,mt6397-regulator";
+
+			mt6397_vpca15_reg: buck_vpca15 {
+				regulator-name = "vpca15";
+				regulator-min-microvolt = < 725000>;
+				regulator-max-microvolt = <1125000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			mt6397_vpca7_reg: buck_vpca7 {
+				regulator-name = "vpca7";
+				regulator-min-microvolt = < 700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <115>;
+			};
+
+			mt6397_vsramca15_reg: buck_vsramca15 {
+				regulator-name = "vsramca15";
+				regulator-min-microvolt = < 931250>;
+				regulator-max-microvolt = <1150000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			/* The A72 cluster's Vsram despite the name; cpufreq couples the pair. */
+			mt6397_vsramca7_reg: buck_vsramca7 {
+				regulator-name = "vsramca7";
+				regulator-min-microvolt = < 931250>;
+				regulator-max-microvolt = <1150000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			mt6397_vcore_reg: buck_vcore {
+				regulator-name = "vcore";
+				regulator-min-microvolt = < 700000>;
+				regulator-max-microvolt = <1125000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			/* 150 us per suez_evt/dvt, not the 115 us of evb and elm. */
+			mt6397_vgpu_reg: buck_vgpu {
+				regulator-name = "vgpu";
+				regulator-min-microvolt = < 700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <150>;
+			};
+
+			mt6397_vdrm_reg: buck_vdrm {
+				regulator-name = "vdrm";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			mt6397_vio18_reg: buck_vio18 {
+				regulator-name = "vio18";
+				regulator-min-microvolt = <1620000>;
+				regulator-max-microvolt = <1980000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			mt6397_vtcxo_reg: ldo_vtcxo {
+				regulator-name = "vtcxo";
+				regulator-always-on;
+			};
+
+			mt6397_va28_reg: ldo_va28 {
+				regulator-name = "va28";
+				regulator-always-on;
+			};
+
+			mt6397_vcama_reg: ldo_vcama {
+				regulator-name = "vcama";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vio28_reg: ldo_vio28 {
+				regulator-name = "vio28";
+				regulator-always-on;
+			};
+
+			mt6397_vusb_reg: ldo_vusb {
+				regulator-name = "vusb";
+			};
+
+			mt6397_vmc_reg: ldo_vmc {
+				regulator-name = "vmc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vmch_reg: ldo_vmch {
+				regulator-name = "vmch";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vemc_3v3_reg: ldo_vemc3v3 {
+				regulator-name = "vemc_3v3";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vgp1_reg: ldo_vgp1 {
+				regulator-name = "vcamd";
+				regulator-min-microvolt = <1220000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <240>;
+			};
+
+			mt6397_vgp2_reg: ldo_vgp2 {
+				regulator-name = "vcamio";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vgp3_reg: ldo_vgp3 {
+				regulator-name = "vcamaf";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vgp4_reg: ldo_vgp4 {
+				regulator-name = "vgp4";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vgp5_reg: ldo_vgp5 {
+				regulator-name = "vgp5";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vgp6_reg: ldo_vgp6 {
+				regulator-name = "vgp6";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vibr_reg: ldo_vibr {
+				regulator-name = "vibr";
+				regulator-min-microvolt = <1300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+		};
+	};
+};
+
+/* The micro-B port is also the charger input */
+&ssusb {
+	vusb33-supply = <&mt6397_vusb_reg>;
+	dr_mode = "peripheral";
+	maximum-speed = "high-speed";
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+/* Consumes the VPU, which is disabled below */
+&vcodec_dec {
+	status = "disabled";
+};
+
+&vcodec_enc_avc {
+	status = "disabled";
+};
+
+&vcodec_enc_vp8 {
+	status = "disabled";
+};
+
+/* Its firmware never starts here, and its suspend then fails every system suspend */
+&vpu {
+	status = "disabled";
+};

-- 
2.56.0

