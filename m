Received: from mta0.migadu.com (out-238.mta0.migadu.com [91.218.175.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEF948F830
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783860; cv=none; b=J1qJCJ9HxloJ9QAE2EKMuylPF9dFCBAVDuaHYyehCNhZIrSmTQMQEp/8j7ZZcBmrQVNYQTO8YITaIjn1aSWgRd8ZsxJN0dvtzV4SpoH7jSnMBK4wPAfvFWGsde0mT+JTe47Xwcx/YiyM8dlxgm3Tdj4mBg2/RNCSRzhaUAHyb5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783860; c=relaxed/simple;
	bh=+PfgQR8CEfJqLpNHKcfKZtvUqGtZCAO1W2dqKYJta3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E36QM7WaAnhaRhNFIx6KKUwBQuNEUP6l0isJt+F36OkV1Q4xQ0j6dNZWqssoidgsGJ7XUgeuR+Wb9fVEdIoKN/8itYAozeyZJb9BYQEc5uIcRVOOdfhDAYQ69Gw0W/dCH//TleeZBQk7YiolBHw1+4bifWSWSyJ58v74Ao0IB6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=QSOdOmIU; arc=none smtp.client-ip=91.218.175.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="QSOdOmIU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+PfgQR8CEfJqLpNHKcfKZtvUqGtZCAO1W2dqKYJta3w=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788783853; v=1; x=1789388653;
 b=QSOdOmIUARYNXUYDLdxRVWljZelC2I9DrUqNn+zdeCsCsannLXu1VydQycsRLLf8x8FNkRWJ
 BuK1vKwkbt/GFtpxe1K3wKPDI+NYbvNYPkr66bM8dsYf05u0lDae4o9YPEaSOX1vbYf15CKW01B
 4jLCTLH/I3w0Id2KjgwsZABUF0aW28JnA4g8gJINDLCJersXkXzKTtSF8dufzJGtH/P1GeyzQdY
 8RfQ5SqjxOKOBKr1/n/tqMuYqaUoWhrg/7UQdqalAqw4h4P+N2TF60fcplbMlcgYjjhdPZHP/RZ
 TXhPQnmsTf/H37zz8X/0nhQV1adU5l/1nc3ln93ebmAFg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 377064ef5354ca5b;
	Mon, 07 Sep 2026 12:24:13 +0000
X-Mizu-Trace-ID: 377064ef5354ca5b
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Joachim Eastwood <joachim.eastwood@gmail.com>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Add support for FriendlyElec NanoPC-T6 Plus
Date: Mon,  7 Sep 2026 14:22:45 +0200
Message-ID: <20260907122406.1862398-4-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907122406.1862398-1-diederik@cknow-tech.com>
References: <20260907122406.1862398-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
index b677914cd3f1..1bdebf3e30fc 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -204,6 +204,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-lubancat-5io.dtb
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

