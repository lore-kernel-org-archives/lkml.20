Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002250;
	b=dwmG3CqkF6gHlgs0Fjm/lShKtBK3Dj06S41CBx9d3BBZkgweuU4bkWsL7kq53h1jHOnL
	 RfXOrcs6rAK7ZnylDsopDxeelb3tVcZUn0h7R2AGEHTdKRfNTikPvabofc1j4Yk8DJ86f
	 kvLBnp07xeVJaIVbmgs7uq/RLDJg9vkuhwvjjACgP5gc65mXMWyQQNlz24BPJ7LvKzDyY
	 Ov/fNK/fvKTf7vjpibRpwo6u375vw5X8CYfTXqEKKN8i/qQh7K0V5qHlhqV1fPU7FtWce
	 0CeG9TcMH1Ex4/aJ+mlZxI+htB1NaNrXtsM/8nHnYVmf/KDF/OCdLBSywcdAtPLRGDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002250;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=sWWjal4kg7Bb+zbbKRMSSMoIbhDieiVkL3VfmhZSjks=;
	b=k6wrb2l4Mr7gCATPWlhx4iSLSdsmvgtjX/Z600udVMzU74i6riL9F3URBm2OrqjfDkD1
	 hdlcBivmvJcKNwdNjzgjl+cwhCg9kqjMt/A+KV4I6imqGzEKxf8Upbme7de4tAP3XGuGu
	 AB8SDFTzXlYQtZ4YKtjifA21luT9pdRvKDIuuzYgfDxrvY/4uBuHVrjJVx6WHzjx60jqG
	 Frtcu7cgah6jI9+zAMcaiKlMhMSi7BiuR4x74hygmfkFQpawqJoqYyH2e1IH3I15CWmFc
	 flDuHKM5+MbDaQNCwC1AcAkxiGDRfqWW7ZtHB5wTn0R6Wx+9dtzUMe9hnjHEy6LN0Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Y0OFJrYE;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA96606D815;
	Fri,  6 Nov 2026 21:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABA96606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Y0OFJrYE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794002240;
	bh=KU/YEFe4JzRFcgmGM8I2qV26IQDEGg/npT6S9CcZluo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y0OFJrYEBo/ZQ67iXHxq68DAVcxSc/5yJ65BxIMtmzxoi6mIORZMgZo0OSnbpeK9W
	 F3k6upV8o8u3wonv2/Bc21V5yWa6Oo46Vz6D5UtXwL6oyVP54EMV6hCy54YSWpYdZ5
	 zFprHrXSAkKITZVb3Ue5s3YcCvAU/OsLOhZPFqj+sFIJOtvhpeRLSD3PyWmlsO7tRG
	 yBFAdKOLn077SceHMW05PzJazRH8qpcQnlGpltvZFipyyt5PvyUNq5oOgnpKiwbSD1
	 nY1HpfIGbhIpG9JLdNf/4Zc986KZoQVMDrJAFTW16L6aZ6zjFImgY16Epq5wj9eV7C
	 H/NFutHBdiGJw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A910517E0A80;
	Fri, 06 Nov 2026 22:57:20 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 19411480035; Fri, 06 Nov 2026 22:57:20 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 06 Nov 2026 22:57:10 +0100
Subject: [PATCH 5/5] arm64: dts: rockchip: Add Bluetooth to RK3588 EVB1
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
Message-Id: <20261106-rk3588-evb1-dt-updates-v1-5-bdbe16223589@collabora.com>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
In-Reply-To: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2510;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KU/YEFe4JzRFcgmGM8I2qV26IQDEGg/npT6S9CcZluo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGruTUDhUQVicPoNxtxccVrec0dAAQEnlbepf
 Z4vNAZIrbhsJokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7k1AAAoJENju1/PI
 O/qaWycP/jrWeVm6udq9KbIRARBPUsUY5H8nx4/zJ59EvCTZ0ELerG4Mp+NWNlMs3HtbqwUtbd0
 COZCYCtnI25b0kRefTr2GOJFk6qmWnVguUlbGB2Wlr4Sqr+3WSngSdDYZ26cxBbsEiOMeZPOP7o
 J5ckOgx8/nx4Z9Sc1FFoU2yGzqtwKwAI7F/UD5ryLVazmILZSWiSRkgxkNsdrd8Chm6iR4WSfO9
 Z0kJ4Aq7prDbDCYuwzPnBW85MtapNLhYBUC/Tze9z8j0Wf6QfsZISfmP6shagUDs6Hbu8qaZk2p
 qiPzhMQ+OwT3M2aHFUKQMzwY+J4sayWdurhmnFVs4CoG/zmdcxgjqK3qAlrEgsKV6DrYI2noIyI
 Cg8Zj5FSEUBxjBhlJ/+T00VQISo96rmS3RnNiwysDEfZTrMvNh95QyBCIGwmfv/nYl+5qQkFNOU
 LCr2aHFApUjimDjhhcBCTNzvHVDSjk9ZBbf+AcVsUq1iSLEbSZMGLnC4pJYlJhi0dVA7uiSqgeJ
 dsINdbO+nAcaWwRVHW+oLaIOuyo/TZLmhWz0D6KUDHt9Vq7f6A9p/+zfvGJS6WsNifN+G5M/tgO
 Ueej5Cwc6FcUxQ5T4Cp/pVRNAOwNu+NzXJyOjfEijP+imyQXfe846m2rxHnrQEvrWtZ+VIj5V62
 a/B/iTW3EsUblJCSbm58plA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The RK3588 EVB1 has an AP6275P WIFI6/BT Module. The WLAN side is
connected via PCIe and already described. This adds the BT side, which
is connected via UART. BT is also connected to I2S, which can be used
for BT audio. By default BT audio is routed via the HCI UART interface
instead.

The added I2S complexity is avoided for now, but would require the
following steps:

1. Setup "brcm,bt-pcm-int-params" in the bluetooth node
2. Add a simple sound card for Bluetooth using &i2s2_2ch (using default
   M1 pinmux) on the CPU side and "linux,bt-sco" on the codec side
3. Extending "linux,bt-sco", so that it supports 2 channels, because
   the Rockchip I2S hardware cannot output single channel

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index 327ca13b60f0..f578e7dd5aa1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -695,6 +695,20 @@ speaker_amplifier_en: speaker-amplifier-en {
 		};
 	};
 
+	bluetooth {
+		bt_pwr_en: bluetooth-pwren {
+			rockchip,pins = <3 RK_PA6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		bt_wake_host_irq: bluetooth-wake-host {
+			rockchip,pins = <3 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		bt_wake_gpio: bluetooth-wake {
+			rockchip,pins = <3 RK_PA1 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	rtl8111 {
 		rtl8111_isolate: rtl8111-isolate {
 			rockchip,pins = <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -1522,6 +1536,29 @@ &uart2 {
 	status = "okay";
 };
 
+&uart8 {
+	pinctrl-0 = <&uart8m1_xfer &uart8m1_ctsn &uart8m1_rtsn>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio3 RK_PA1 GPIO_ACTIVE_HIGH>;
+		interrupt-names = "host-wakeup";
+		interrupt-parent = <&gpio3>;
+		interrupts = <RK_PA0 IRQ_TYPE_LEVEL_HIGH>;
+		max-speed = <1500000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_wake_host_irq &bt_wake_gpio &bt_pwr_en>;
+		shutdown-gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&vcc3v3_pciewl_vbat>;
+		vddio-supply = <&vccio_wl>;
+	};
+};
+
 &usb_host0_ehci {
 	status = "okay";
 };

-- 
2.53.0

