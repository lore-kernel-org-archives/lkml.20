Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=144.76.98.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792800005;
	b=CksLYHQ138ij3wVF80C0sfgm4Xy2sfhX8FzXoD6esGwn+COWDkMuki044LNn08O4rdFb
	 aetEtX8OO0SSZQnYBH1VzobSg0yaMJYNu7eLc7Uffkmbwi4DQWKybjbKuhWEieLr2D/uk
	 ri2LTFP/GeqTIoY2QU6yug1l6rrPkwUGxP5wKbqznLJAuC8z/4mkZVz9xQTjVorTCfEVF
	 Lpg0g4YREpQJFyBnvdfEkg9wgKHy2kTg7o1iBhKfp7c7vUQjOTtjFSMM0d6J8VxArM1Sb
	 Am0DW4LpwDqN43FJrHPoYGHX1JlsY3solVfwEyReKk35kPbfJiULfh/bAfKbl8n4X5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792800005;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2sW4NG1o44Sm+IiRWo8sNqIjvs8pjqW7WvpxzKFVpkc=;
	b=1dBrbhZK08FwikipddHvlWg8S4/rWjCvhVQgSiPixdiNCCTBdtjDhsJFoVI/cf+uUW0o
	 c8iAuXklFJm3OcmVW4+D8Z7EFIti+9nbg0zYzGAl5BS4JmTcueCux2ODl415hSTIM8Esl
	 wYkoZzLq/JUEjWhvNwb2jdL3gx3gTxEs6bKzzPZ9zgwCMEjAWA+WHtdxRBMigMKyoIPIq
	 4agVfB38cDn7qdciHZZh3HoLSkUkMgx21knHKRjkkmEyr7+1nBx8lKHW3sx0/nEssXEpE
	 zb4xEL/X/e1I35hVDSG1sHSp5wlHPqJfXsrfe4QIdCCYGOXxpvLJVWNOiOvEq6xd8kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rojer.me;
	spf=pass smtp.mailfrom=rojer.me;
	dkim=pass header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=Q5iodtEY;
	arc=none smtp.remote-ip=144.76.98.110
Received: from mail1.rojer.cloud (mail1.rojer.cloud [144.76.98.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74449606A323;
	Sat, 24 Oct 2026 00:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74449606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rojer.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rojer.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=Q5iodtEY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1792800002; bh=X6UhdmMXOtXV/Hzkqp1DtptslFwWC4nSvNqkAO2/h+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q5iodtEYB4CI5F6ReAOByUmCSX8U8GtFH+IingrFPmsum6f1vUMBdxTsvVHuW/GhZ
	 WQeS9YkoLShMO83tAcIAIJgxqIeM1TknUzqn9LsuSfo7pll37ti71zBhuLYdu4bQrq
	 ToM6X3F8DI971AhRNsh9l8iI/zgNku+u0nVQkic+92Q8qBKla1RV6jMqUtlx/yOfHc
	 wQrp+j/gjrnXr6vfPCCDDIPoaVaOUzsLydT3tBxTolWP0L9AzVdVUOXEX30gqYSQga
	 LllowSHwgYT/MFPjUvXrpd+VyPkuEdB7TFoYhsdiNOlU46f/41h8YKXvjg1o3v54C4
	 J4SCHcu0JSRSg==
Received: from nbf.lan (212-5-142-134.ip.btc-net.bg [212.5.142.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id 17EF81271FF;
	Sat, 24 Oct 2026 00:00:02 +0000 (UTC)
From: Deomid rojer Ryabkov <rojer@rojer.me>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sergey Bostandzhyan <jin@mediatomb.cc>,
	Jensen Huang <jensenhuang@friendlyarm.com>,
	Deomid rojer Ryabkov <rojer@rojer.me>
Subject: [PATCH 2/2] arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S Plus
Date: Sat, 24 Oct 2026 02:59:59 +0300
Message-ID: <20261023235959.2988087-3-rojer@rojer.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023235959.2988087-1-rojer@rojer.me>
References: <20261023235959.2988087-1-rojer@rojer.me>
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

The NanoPi R2S Plus has an M.2 E-key slot wired to the sdmmc_ext
controller in 4-bit SDIO mode, where FriendlyElec fit an optional
Fn-Link 6222B-SRC (Realtek RTL8822CS) module:

  - SDIO signalling at a fixed 1.8V (VCC_18)
  - WIFI_REG_ON on GPIO3_B0, 32kHz sleep clock from the RK805 CLKOUT2

Enable the controller and add the power sequence. The SDIO pins need
8mA drive strength for SDR104 tuning to succeed, as in the vendor
device tree [1]; with the SoC default of 4mA no sample phase works.

On boards without the module the controller gives up after about 0.2s
("mmc2: Failed to initialize a non-removable card"); nothing else is
affected.

With the mmc core change for the module's CMD11 handling at a fixed
1.8V [2], the module is tuned to SDR104 at 150 MHz and works with the
rtw88_8822cs driver; without it, it runs in high-speed mode at 50 MHz.

[1] https://github.com/friendlyarm/kernel-rockchip/blob/9238df9d21e835bba35c8ba5248784387936cb2e/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2-rev24.dts#L144-L172
[2] https://lore.kernel.org/linux-mmc/20261023232813.2983368-1-rojer@rojer.me/
Signed-off-by: Deomid rojer Ryabkov <rojer@rojer.me>
---
 .../dts/rockchip/rk3328-nanopi-r2s-plus.dts   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
index 6ba4a74cb1f..db19a18ae45 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
@@ -17,6 +17,15 @@ / {
 	aliases {
 		mmc1 = &emmc;
 	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rk805 1>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_reg_on_h>;
+		reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &emmc {
@@ -34,3 +43,50 @@ &io_domains {
 	vccio4-supply = <&vcc_io_33>;
 	vccio6-supply = <&vcc_18>;
 };
+
+&pinctrl {
+	wifi {
+		wifi_reg_on_h: wifi-reg-on-h {
+			rockchip,pins = <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+/*
+ * SDR104 tuning fails with the default 4mA drive strength, use 8mA like the
+ * vendor device tree.
+ */
+&sdmmc0ext_bus4 {
+	rockchip,pins =
+		<3 RK_PA4 3 &pcfg_pull_up_8ma>,
+		<3 RK_PA5 3 &pcfg_pull_up_8ma>,
+		<3 RK_PA6 3 &pcfg_pull_up_8ma>,
+		<3 RK_PA7 3 &pcfg_pull_up_8ma>;
+};
+
+&sdmmc0ext_clk {
+	rockchip,pins = <3 RK_PA2 3 &pcfg_pull_none_8ma>;
+};
+
+&sdmmc0ext_cmd {
+	rockchip,pins = <3 RK_PA0 3 &pcfg_pull_up_8ma>;
+};
+
+/* Optional M.2 E-key SDIO Wi-Fi module (Fn-Link 6222B-SRC, RTL8822CS) */
+&sdmmc_ext {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-mmc;
+	no-sd;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc0ext_clk &sdmmc0ext_cmd &sdmmc0ext_bus4>;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_io_33>;
+	vqmmc-supply = <&vcc_18>;
+	status = "okay";
+};
-- 
2.53.0

