Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575935;
	b=RwgwR++xPqgosgbnLqduzPFWXb91q9Z9jbii9mCmwVxh8PAlqBs8/Vl6BND1jTI4k/QD
	 S0KsGQjSeFQP7Vjo89V/2hpOKb5JxD594FMSzLRePE41vTPc35gLUDykXnRsE91MPj8Mq
	 qmUzyzZy2RTlaySS9PkoyMK2iinavF6/wh+C0RKTu2prmjrVI4DmRD6TgF/yjMgjXbL7F
	 yM+Z6OxZ2nwRlet9CD1ZqgYOVmN2r+ettygxDWgH93mh4mE55Pj065Ae6sr92Fl0Yx0Tc
	 FXKyqAkDFfvy6zCwJZlxKGJ7QPHISxrJ47PLTJ3gkW3vq3ZeGmmWcYW8F1nGTjGXzKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575935;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ND/3oI5ocRwDwHOmoJ1ijdVHImjKSjAJASVb/3HJ26Q=;
	b=RWw+XhI/UF0QSSPcIwYoIpF4Z80Q0UbXE+5gppRqzHEsevDKf0jgzYLlbY4t8/j81fli
	 1naaD6Llun7+I/JyMHEmjOUOHYjJkvhMQZxvP/2ynbpMeDWxxqlMmOhFYyr3pufv1vH0c
	 PWmZ51kNFNDz7LwC3xHUQAZdhZT1UJSpUrfkKZy2fNo+BRFjHO94L9RcErtRNb3/xStIG
	 RfsSXxllb+edrMUghiEIuZ3bATU3rHrt6HxD2VwnmHi1qv6WVaAzjH9KzrhvoL1i+ORPO
	 qXP4HElXl+KifWeDf7SpQtAYBGUY/ftD5xZ3lhxBNV3sXQysVRdfCE2dJ00cNs2bFDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b="o0CQTuA/";
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=iWm2eOKZ;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A06D606A326;
	Sun,  1 Nov 2026 23:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A06D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=o0CQTuA/;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=iWm2eOKZ
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575932; bh=ND/3oI5ocRwDwHOmoJ1ijdV
	HImjKSjAJASVb/3HJ26Q=; b=o0CQTuA/xGPS5C3uBKotF6Wr/+zg5tIj9Muql4mmhiqP08cNH0
	TZgTBJIliUIx6ahVsVB9cQnrfr5D1oqoPKBw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575932; bh=ND/3oI5ocRwDwHOmoJ1ijdV
	HImjKSjAJASVb/3HJ26Q=; b=iWm2eOKZmpqnyw45CXtSlpp5f43N0jdrAJ03U+GWHVqaj3Gr8K
	WIYw5oH97K/BfUuj3Hmr7Fd5Z6tb78u5s4ErtXPWguqPPFgKFRQhyL5S6pIr4N7mPIcEr6ugUW9
	1IJcYb9EsO2kk2q6tMdgw3gQ1qVvBzG+up+3bJqfItQFWZ7YY/rEXUJDVZXNLv5mwypeqa4efTZ
	M90kB2Xso+RM+tKNOK/OQtI4CpRZJ5HovF5UL9R3LdLA776W2WnA/lwQhBy/y66BxfLKS/AoSrt
	PDWWMzVYlazb3hJkh6M7DW3xvIReh5FyPHjQApVXWsqlSr2DesliIbyiIFNuY9JArrA==;
From: erebion <erebion@erebion.eu>
Date: Mon, 02 Nov 2026 00:32:09 +0100
Subject: [PATCH v3 05/12] arm64: dts: qcom: sm6350-lena: Enable Bluetooth
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
Message-Id: <20261102-pdx213-upstream-3-v3-5-cdc3be96d257@erebion.eu>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
In-Reply-To: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 erebion <erebion@erebion.eu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793575929; l=3560;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=WvQ3IoLuVyqCt6UZKrwiXhMWvCiWZYnRMZClt2J/kBo=;
 b=5q6yrMeuHIiAUzc6jP05FIWq53YbG6ghTR8VfxVtkdEd66XVY5qGzZzqac5AV7CpU146P397j
 /9W9dV6zhHdB4BG4gikd/v5pFPg+vXUqsCUym/u1Pq/RduM2WvXG1qo
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Configure the required regulators for Bluetooth and enable it on the
Xperia 10 III.

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index ce351a3fa8727..f1958f4bad05a 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -19,6 +19,10 @@ / {
 	qcom,msm-id = <434 0x10000>, <459 0x10000>;
 	qcom,board-id = <0x1000b 0>;
 
+	aliases {
+		serial1 = &uart1;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -387,6 +391,32 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+/* UART1: HS UART for Bluetooth */
+&qup_uart1_rts {
+	/* We'll drive RTS, so no pull */
+	drive-strength = <2>;
+	/delete-property/ bias-pull-down;
+	bias-disable;
+};
+
+&qup_uart1_rx {
+	/*
+	 * Configure a pull-up on RX. This is needed to avoid
+	 * garbage data when the TX pin of the Bluetooth module is
+	 * in tri-state (module powered off or not driving the
+	 * signal yet).
+	 */
+	/delete-property/ bias-disable;
+	bias-pull-up;
+};
+
+&qup_uart1_tx {
+	/* We'll drive TX, so no pull */
+	drive-strength = <2>;
+	/delete-property/ bias-pull-up;
+	bias-disable;
+};
+
 &sdc2_off_state {
 	sd-cd-pins {
 		pins = "gpio94";
@@ -430,6 +460,72 @@ ts_int_default: ts-int-default-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	qup_uart1_sleep_cts: qup-uart1-sleep-cts-state {
+		pins = "gpio61";
+		function = "gpio";
+		/*
+		 * Configure a bias-bus-hold on CTS to lower power
+		 * usage when Bluetooth is turned off. Bus hold will
+		 * maintain a low power state regardless of whether
+		 * the Bluetooth module drives the pin in either
+		 * direction or leaves the pin fully unpowered.
+		 */
+		bias-bus-hold;
+	};
+
+	qup_uart1_sleep_rts: qup-uart1-sleep-rts-state {
+		pins = "gpio62";
+		function = "gpio";
+		/*
+		 * Configure pull-down on RTS. As RTS is active low
+		 * signal, pull it low to indicate the BT SoC that it
+		 * can wakeup the system anytime from suspend state by
+		 * pulling RX low (by sending wakeup bytes).
+		 */
+		bias-pull-down;
+	};
+
+	qup_uart1_sleep_rx: qup-uart1-sleep-rx-state {
+		pins = "gpio64";
+		function = "gpio";
+		/*
+		 * Configure a pull-up on RX. This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module
+		 * is floating which may cause spurious wakeups.
+		 */
+		bias-pull-up;
+	};
+
+	qup_uart1_sleep_tx: qup-uart1-sleep-tx-state {
+		pins = "gpio63";
+		function = "gpio";
+		/*
+		 * Configure pull-up on TX when it isn't actively driven
+		 * to prevent BT SoC from receiving garbage during sleep.
+		 */
+		bias-pull-up;
+	};
+};
+
+&uart1 {
+	/delete-property/ interrupts;
+	interrupts-extended = <&intc GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
+			     <&tlmm 64 IRQ_TYPE_EDGE_FALLING>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-1 = <&qup_uart1_sleep_cts>, <&qup_uart1_sleep_rts>, <&qup_uart1_sleep_tx>, <&qup_uart1_sleep_rx>;
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3991-bt";
+		vddio-supply = <&pm6350_l11>;
+		vddxo-supply = <&pm6350_l7>;
+		vddrf-supply = <&pm6150l_l2>;
+		vddch0-supply = <&pm6150l_l10>;
+		firmware-name = "crnv32u.bin";
+	};
 };
 
 &usb_1 {

-- 
2.53.0

