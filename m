Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790421;
	b=XQ23SIqJqc2vc1HF9SRlrM3gJH6HcOkgOqw+kG4HMa6TPo4HiBEtMcYNukrg5Q2QCfNt
	 zObx174GAV9LwMH9qvlf9nYYDdPigUpDx1TpTqWFcxZ7Dmo/3DO1nj9ashnKbgU3KaH3Q
	 osnovwEu2aZ1sevs97ON5SdQ2Gf0Hsh1nU/OPEONof4Uf2mI2iLtZccohq+SF/sCnfzHx
	 86gijNNYkLax5D18buwMwY3P+s2PCZd1ItFKxF44w0KgIoTFCJ8l5N56trrIDAO/pBhy2
	 j4fAW4obcT2z5Br8Cv1peqhkaiUMzWAoM2WaDKpqC3WMA/0VI+kK6uWYlyR6KxFxtDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790421;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pn71ylw68hoKcWMtScmwb4UGZwFPZD+7J9Ycpz0hSGA=;
	b=dhRvKg2sX3sgiNZpRo8985c5tpJPOIQ35EmM/54TtuvPJOY7sJ9h0zNLO67hQLi8O8p/
	 XThGNPdhF5fPyDrRCvV04eY8Qd0MeauKECQetAGD16igZwvqlnkshit1GyXigFv9MC9A5
	 3jXlyC+1X9LcqnVoZ9Z5GhAzEKkR88KbrbRz+5Xm2Rfm7d/1jL0oBJ7c9DGUQo0O3YYYT
	 LFeqR71rQ+l7NmIss1nnvzZCIpBtPaQ3E4LCx4fRtB3Fr/T1Y/lwXXFuejRGJGmS/TLPG
	 KKvw4Fni1NbIZarEpX7hRwpfFEOuxa3pzEANa9iiM1joOMGUCUkM34lQQFbYUVLo1+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cknow-tech.com;
	spf=pass smtp.mailfrom=cknow-tech.com;
	dkim=pass header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=i9wmOrk7;
	arc=none smtp.remote-ip=95.215.58.168
Received: from mta1.migadu.com (out-168.mta1.migadu.com [95.215.58.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAF2606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDAF2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=i9wmOrk7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=q5GZcZWMOQIvRaqa09yIq33VkC0yOqXCBT7tjMXSkZw=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793790419; v=1; x=1794395219;
 b=i9wmOrk7S0bzmMdqlWDDqH7mKZDBEYModFLDCxormp2tBq47Z+SqWsplzwBAgFdE+gqxvops
 4B2pki6BCHAztSWRmaCt197Y3KbEW0flCQNYbQe007tnoxAU08fpz2x7W/sIJnnTXVltLSnuERH
 2xBdU+oEnylhXwBBfHob+ZTVsGeNqtsevSzR3Wk4vVOGGffaGgZD4gHyceLBPnj/LMtG5TOeiaz
 IWGqDSfD7cholz/mR2Vwv/nLf+emC+SBBpzE8So8KvYYnsQxDNVuLtft9iL2I6Rr2df3dSnGQxT
 3/B6P2S0xPJucKfjEN8m0ACqSomXAf+FdKnauiAkfsQIA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7eceafc41300d51d;
	Wed, 04 Nov 2026 11:06:58 +0000
X-Mizu-Trace-ID: 7eceafc41300d51d
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH RESEND 3/3] arm64: dts: rockchip: Add support for FriendlyElec NanoPC-T6 Plus
Date: Wed,  4 Nov 2026 12:05:06 +0100
Message-ID: <20261104110640.1132917-4-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104110640.1132917-1-diederik@cknow-tech.com>
References: <20261104110640.1132917-1-diederik@cknow-tech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FriendlyElec NanoPC-T6 Plus is a new board in the NanoPC-T6 series.

The main differences between the NanoPC-T6 Plus and the NanoPC-T6 LTS are:
- use of LPDDR5 RAM
- addition of an M.2 B-key connector for a 4G LTE module and a companion
  NanoSIM card slot.
- 10 pin header with UART and 2x USB 2.0 host got replaced with a 3 pin
  UART header.
- different audio codec (Everest ES8389)

Add basic support for it.

Link: https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6_Plus
Link: https://wiki.friendlyelec.com/wiki/images/a/ad/NanoPC-T6_Plus_2511_SCH.pdf
Link: http://everest-semi.com/pdf/ES8389%20PB.pdf
Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3588-nanopc-t6-plus.dts    | 91 +++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 442d322a20cf..8dfcfe16a400 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -209,6 +209,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-lubancat-5io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-mnt-reform2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-lts.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-plus.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-ok3588-c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-max.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-plus.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts
new file mode 100644
index 000000000000..f23ac4bd9f16
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2023 Thomas McKahan
+ * Copyright (c) 2024 Linaro Ltd.
+ */
+
+/dts-v1/;
+
+#include "rk3588-nanopc-t6.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPC-T6 Plus";
+	compatible = "friendlyarm,nanopc-t6-plus", "rockchip,rk3588";
+
+	codec_es_3v3: regulator-codec-es-3v3 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "codec_es_3v3";
+		vin-supply = <&vcc4v0_sys>;
+	};
+
+	usb2_port_5v: regulator-usb2-port-5v {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio1 RK_PA4 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb20_host_pwren_h_pin>;
+		pinctrl-names = "default";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "usb2_port_5v";
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&analog_sound {
+	compatible = "audio-graph-card";
+	hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+	label = "rk3588-es8389";
+
+	dais = <&i2s0_8ch_p0>;
+	routing = "Headphones", "HPOL",
+		  "Headphones", "HPOR",
+		  "INPUT1", "Microphones Connector",
+		  "INPUT2", "Microphones Connector";
+	widgets = "Headphone", "Headphones",
+		  "Microphone", "Microphones Connector";
+};
+
+&i2c7 {
+	codec@10 {
+		compatible = "everest,es8389";
+		reg = <0x10>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+		vdda-supply = <&codec_es_3v3>;
+		vddd-supply = <&vcc_1v8_s3>;
+
+		port {
+			es8389_p0_0: endpoint {
+				remote-endpoint = <&i2s0_8ch_p0_0>;
+			};
+		};
+	};
+};
+
+&i2s0_8ch {
+	i2s0_8ch_p0: port {
+		i2s0_8ch_p0_0: endpoint {
+			dai-format = "i2s";
+			mclk-fs = <256>;
+			remote-endpoint = <&es8389_p0_0>;
+		};
+	};
+};
+
+&pinctrl {
+	usb {
+		usb20_host_pwren_h_pin: usb20-host-pwren-h-pin {
+			rockchip,pins = <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&u2phy2_host {
+	phy-supply = <&usb2_port_5v>;
+};
-- 
2.55.0

