Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869454;
	b=vt+4r+4u4cg+uv4rOhYa9S749f/D8ATLycdxIpjo78WQwebnnLXlR0wT7o+vJQ/2P1tr
	 ouILo4jbDCRlufhBqpZub3UFep7SfnXnkliHOOQEXmqIDLHhjWOislhMg6q58RrFHsjgp
	 g1nK214xycShbhp1XFyS7Pi3MctU3OTGabzqgaNu6l+y4wYRBui2TcsbFCHMTN4rz6lRA
	 7laXOU+4WNynJBjl88mKhf6aPP3a2JPj7T9qTNa+FpCjv74Fc9s1ICiiFZLD5Z3TFc9PP
	 XXY3NmLSgU78KO1y0cSCV1WriQLVN9ZChs53vR6tcmPWKaRqY5SgVCXpC3GqTcADisw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869454;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=HdzBusJ2m2oIJwvG8r/gIEsWxjBy4zz4R3lKt0q2ErQ=;
	b=e1ZCdvAsrNjhiJVjAzvcOwxzm3ERty7lqo0yw//5b2BKv7VM0FDHJRQJCDqxGaae4pkM
	 g7nPAXLPtYGgTbXuKx2Mwprdu80m/UdrIxDLX0GOkPvi3ae1BEfzEyUrRxa2yHbQ5A2D1
	 gyf6DQY+OagUvKHMSxgJTs3QMsuEYPcD7oq3FocXU7zoMWAHZv0RwMLgW+SZEd652UAFP
	 rS/a3dievoTeAiQdBqB2G9/Dxt1O+SRvlJ84y77NOvlYdbiEZzrXbXgL30r4iMuBdusWS
	 2PQQVNiOM3VhyqfV4TePXcY6YYg7Twm2r5tBy+mMvfwgU1AAO/4VeCFKInDZweOLMAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=NOdUCWXf;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=liaGC5tB;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1BE60A260E;
	Mon, 16 Nov 2026 22:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF1BE60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=NOdUCWXf;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=liaGC5tB
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869435; bh=HdzBusJ2m2oIJwvG8r/gIEs
	WxjBy4zz4R3lKt0q2ErQ=; b=NOdUCWXfzdCJHm+7KNssXMRDeL/Xk4GG8IXcnK7CDSNcnETx0B
	gpon7j+UT5saKCKqeNrAy0pSNH5hyYysUbAQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869435; bh=HdzBusJ2m2oIJwvG8r/gIEs
	WxjBy4zz4R3lKt0q2ErQ=; b=liaGC5tBTg7Kpfieyi9cLjekgvF4EFXZarGiWSGo26nhb460Ky
	SDkAIl6aZJZxNw+TmkUVnoDST1hMMFX7NgGzSHQU5AEh1EFeSu4RdF2PgTnOg2jPAldU9Ej+Q+S
	3abfjTEF+XRT4HjxAdbrEtiXf4cCaR1m2UXzb6ECJ+blNUqxK/fwXShm5I5o3Ii47oNOsowVKTG
	QiLCUYZpRgg1FBkCqaNMSGzTMjUjFobdHuy5JW3ylLe9I7qUsb1temtIVEsIZ5wbXDCo7jh7jV4
	hdKM9leOQp5IuyO0qMd17DZa+fb67hrYVI5UfKrdvUZaJxf5EUujMLQGDQdkzf6aYIQ==;
From: erebion <erebion@erebion.eu>
Date: Mon, 16 Nov 2026 23:50:35 +0100
Subject: [PATCH v5 05/12] arm64: dts: qcom: sm6350-lena: Enable Bluetooth
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
Message-Id: <20261116-pdx213-upstream-3-v5-5-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
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
 phone-devel@vger.kernel.org, erebion <erebion@erebion.eu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794869432; l=3560;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=9i1AK5BOSgoKjgzyzIvOIdNUt//20/4Ya8X1h1Kh+Tc=;
 b=1G2aGckki85dghvVOGe/Y0Ra2AWsT9XQpp1oUQoKqnS1q93uzSxgcutgbSHDIwVdrg3lZ1Vm/
 hv63uXDxbpzD7riDzvlUZ3gHf+Yk+2grjSI+MxMRUGr1sYbcAjhKyct
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Configure the required regulators for Bluetooth and enable it on the
Xperia 10 III.

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index e8808865bf6fa..12bf5420530d3 100644
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

