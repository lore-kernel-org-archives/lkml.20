Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533103;
	b=ibHBxNvrDQJVpihsDetQ/BTpWU0l4EQ7UOpi0NyOUiU2egFv96t06nksf3W1or6FuMj/
	 umTIxyqIrfnqUAhjQIkGXfWTDIZwDSVPySGl9VdplhszFSo7whOFTinOMMRv3LJ33Lk1W
	 DWzWsV2Lq6eqhsKCUGjAupU+Li2z4ioxeQz8WQNhvBmlypE45nUnsxa3/ZDH0Djq18zSZ
	 4iAgMltAqq39Wdvnbet6hOWJ47JF4UdclLl/gPhP+Gy6zV9dft2NOziGN30h3xmgIr5Bw
	 YtwqcNPPtvt5BTm6IIJz2BhUpWKb/PI+4HFOnNSL3fcpPk8JRixqvy6xEupBNeUae6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533103;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Oz8dWcjf7rXDTaKG0QODSQJj+5RZeHztc806sWW1OO0=;
	b=tum7dznABsIGsyckZuRsyvGQHF3Boxp5iSbuQKGFmZ9rXuHwoXs92vj0+lnkKU/e1bc+
	 iQMMzSLaPiK1c4dBQP26VNQUentiL3Vawjg4tKsjmW7a8oy9YZSp7UteQua/fb9Y+ykVB
	 C9dUhpcQct9jd2+PlxykC2ZL9ORHNOxN7i+9zXNprVUl/EabPeRiYtAf6CaAIkaIIGAiS
	 gVGIRadRMl2tts0BJfaKNQGtjKgkG+AofhurYEvUJQEWKw2bwsJeZSFiRTvvjYE9X4L27
	 VJ0cACAXYyz9Is0Rh/FKP9YCRlqN3JknWT70oROBfbvR5AO9zzl2TW5l+m5J/ZfEM6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=gJqTdYxY;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=i0fAs03r;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B8C606A31C;
	Fri, 13 Nov 2026 01:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60B8C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=gJqTdYxY;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=i0fAs03r
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533096; bh=Oz8dWcjf7rXDTaKG0QODSQJ
	j+5RZeHztc806sWW1OO0=; b=gJqTdYxYiBdZPrLRv6YCpzr61BTjIWTC7+Cq8PaeeWFmTov81w
	cmJ7SjQEhI2tR36HHC4rm9025U7UfLIK1FDg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533096; bh=Oz8dWcjf7rXDTaKG0QODSQJ
	j+5RZeHztc806sWW1OO0=; b=i0fAs03rQM3uEt92DV4Sj3aI9qvKiransc75BJarjBxmqZ2pK7
	pLyHpY8XK0RSAdXHX/JeS8rKByqyBifvRzUCvqaGP1er8jozrrYVIsjeOA6Ki/PTDzp7DROF7uG
	WtKj4CBSZ9Sm6fd35hlJANM2FaQLI2KAdtj5TyEpgK5U4mHaSEC2nBTelQZl6kaJSbKnlHUEPXH
	3AZC+DyhKXfgiHQKuxR6JzB/XVUxMdIhfqmo9ChwgL3kW+vFbZR/0DN1cfrsyiW8Rjlt5OAMOH7
	S1/d7XAHMtw9vBWiBPAvmev5prydinDDBVjfHxAiVJ43+QnZLQypi2/3NWO9Lo9P59w==;
From: erebion <erebion@erebion.eu>
Date: Fri, 13 Nov 2026 02:24:49 +0100
Subject: [PATCH v4 05/12] arm64: dts: qcom: sm6350-lena: Enable Bluetooth
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
Message-Id: <20261113-pdx213-upstream-3-v4-5-4b01c50a821c@erebion.eu>
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
In-Reply-To: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794533093; l=3560;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=/vWQ4P7pZq3HW1/sDQRxLtN2hVS9OZwDfC+O7wbkcPQ=;
 b=C8NH6+KzxVIC6nTvLfM5FmtRpFWW5kRKQNsQoYpdzsx0ScS8R2m33k17NZTnN/fGMi+Vf6wsb
 kiOOHEtjGA4ANeK+hLgeAdPL9RSFnN2BNtiqsJmEWRg9pmeIxmHBJew
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Configure the required regulators for Bluetooth and enable it on the
Xperia 10 III.

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 4066de20ea23a..ff07810c3a6a6 100644
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
@@ -376,6 +380,32 @@ &qupv3_id_1 {
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
@@ -419,6 +449,72 @@ ts_int_default: ts-int-default-state {
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

