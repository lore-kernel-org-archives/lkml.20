Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3DC279DAD;
	Thu,  3 Sep 2026 05:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412973; cv=none; b=sgvZ/EOreZGVkw5t9DH3wTb/10Q0LWAY5I/xxrN9PCigG5x/VM2KLYRxaVvttM08BGI9QMIoIcuUpl5+5ohlJFYfFRkPRbdMx6KsH0hfdPl4lhIELKF1Z5oIgZTjY0n5D+wKZfTENIy2J56ZAo9oz4y4z34ToySA+pjJdCRvlRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412973; c=relaxed/simple;
	bh=s/o95S4FhU+jC7Wmsq/nZVakaBKql9Q4l/U0A1Bd3rU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iofSpD1tCuiKQZ6HnH8mBdenYtZIVkhJZoThwThCL7ocb9os8pb6e6n+KQvhmT4tKQG6K9Ue2aKH1cEZv+hWf/NRrJigNZP7gVUBYO+ZOPz6h+V6yr6p9mlySkbhhof4kTLorbIZV3gQrpMPT9UhM9zYS6hcezujxp+eZM9bM+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnCS3hNo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnCS3hNo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8164BC2BCFA;
	Thu,  3 Sep 2026 05:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788412973;
	bh=s/o95S4FhU+jC7Wmsq/nZVakaBKql9Q4l/U0A1Bd3rU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EnCS3hNofvaVajEFNKVq9X2rBDS45/aUsA514D5snmoM3f/fl4cDVYPM9iOjM1UGG
	 t86C3HXN13X1D807cDg/mzc90wF6Jp2QXUkxVreMzZuMKObzbuNfb0qDwWBNyy94yM
	 x77P1fVlaiTghacRVmgY6/FqxbgyWmOW8KZBTkx/Uxfpq5WpjvM5Cba1FsSPBcs/8h
	 4grKowt9Y0nmWa+W1JZtZxC65EzuTeepc7IXSsI7Km3PEZ8XlqvkiYQOjA4KOw7OHU
	 u11QAUiUORMKul/1J3uSQ2CcOuW+0fHYfQOWAM6MhYoFGy5dfCCxy/vRWFdAVSz977
	 j7vY2L78g3w2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63810C624D6;
	Thu,  3 Sep 2026 05:22:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 03 Sep 2026 05:22:45 +0000
Subject: [PATCH v3 2/2] arm64: dts: amlogic: a9: Add IR controller support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-a9-ir-v3-2-cd471c667c15@amlogic.com>
References: <20260903-a9-ir-v3-0-cd471c667c15@amlogic.com>
In-Reply-To: <20260903-a9-ir-v3-0-cd471c667c15@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788412970; l=2026;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=4XM6Y1ImcmUqhmzv2hftpr5nRrtgzRpUB7Li778elRM=;
 b=63m9tnftXu5IZ+wc3ZuSf+gJWRg95a1PrbZQBSsS44TEYCK0CguzK5jTIGsxhYlPlS5WEpG9S
 qkNSVznkurZC0y+XvOknrPY98hnowgM0KwsF4nYIDl4+wR/u7Srobnn
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the IR controller node for the Amlogic A9 SoC and describe the
corresponding remote input pin configuration.

Enable the IR controller on the Amlogic A9 A311Y3 BY401 board with the
proper pinctrl setting.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts |  6 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi             | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
index a6b380ca47a5..389c9de3dc3c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
@@ -38,3 +38,9 @@ secmon_reserved: secmon@5000000 {
 &uart_b {
 	status = "okay";
 };
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
index b0e0fadeed82..790109aa7c9c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -241,6 +241,13 @@ test_n: gpio@c0 {
 					#gpio-cells = <2>;
 					gpio-ranges = <&aobus_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
 				};
+
+				func-ir-in {
+					remote_input_ao_pins: group-remote-input-ao-pins {
+						pinmux = <AML_PINMUX(AMLOGIC_GPIO_D, 5, 1)>;
+						bias-disable;
+					};
+				};
 			};
 
 			gpio_ao_intc: interrupt-controller@4080 {
@@ -254,6 +261,13 @@ gpio_ao_intc: interrupt-controller@4080 {
 					394 395 396 397 398 399 400 401 402 403>;
 			};
 
+			ir: ir@14080 {
+				compatible = "amlogic,a9-ir", "amlogic,meson-s4-ir";
+				reg = <0x0 0x14080 0x0 0x30>;
+				interrupts = <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+			};
+
 			uart_b: serial@1e000 {
 				compatible = "amlogic,a9-uart",
 					     "amlogic,meson-s4-uart";

-- 
2.52.0


