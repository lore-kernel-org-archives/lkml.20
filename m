Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962045;
	b=iQku3c0fY5VX+kcbDAtjyp7PD7l5Jwwv14qtNCh+6GgX+4B3WXUBphqBR8CZKJctQi6B
	 fWsDvKrQ7jnFpXw6lAKcAl0L8hSr0gCOX7g/1VStsiru4yQDyAFjpGX0B1Ma/O88Py+9a
	 cvr+97nUE8eZVumL/cI4xn91f3GdX3uJcGRT97JfmOxeypb80cp981TWIP1kyFoLBZuvN
	 6tDtqEuLqkBJddbN8kSe9huMiOLZJnlSq9SEYglLjD7HSLIrrW2829J30bx8nIQ1FwNke
	 zGJbhYe0paKADx/pzPO1Mm5Mg/77MODwP20b6kKn3RHmLYSEprc6F6gKZgyRkWkt3Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962045;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=u0/1yZqyMqZgrqdKxjA/v+I1p+wWzkCYmQc60+OXlpY=;
	b=p115mVyolu/JBjlDuV3I3WcaNiCIf8V+l3PcdMS4zMmwji+s5HOEG2ItAAsCReFW2pgV
	 0R1ll+MwsuCK/z5ryhkDcT5RnaF3w+0T9thvdGn96WKpLfzGKZhT+vr8NARPFLLYvOh2Z
	 3ij7O8ksOJNcnV2TA2KpYFvNMSrunTEEv1ZEI+VZElyFAAcQW6ZB/v5/wGQ3iq3TLi0fD
	 iATuDO6UF13YMVnq6wisbfBnDA/E+u6lmzq9B8zCZBCbf5dneduWDtAjLcg/0Tkv8Nl3I
	 XIpNGoX1DQmQRG646yerBgjaEvtTJ5asv+1uLSiQP0Yf5zsCpf8m7KgMKE+crOYTUoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=G3EOz9Ac;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603B5606D836;
	Fri,  6 Nov 2026 10:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 603B5606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=G3EOz9Ac
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07N1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:12 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07N1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962033;
	bh=u0/1yZqyMqZgrqdKxjA/v+I1p+wWzkCYmQc60+OXlpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G3EOz9Ac458kVeD1Ou6QJVwzbATectXcOTrc3xZpBpbWUV3PIiiqDARCf3SCm87TE
	 59x2hBYH0F0rv4VGZOf+p5xA+byFm34VZRBiwLsb5fhr09uwqeHEcTPf0s49JfWfI+
	 jHOZRWO9Apek3y8+MOG4eoW9X37WHACPZ+xp4jnk=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 08/10] arm64: dts: amlogic: meson-s4: add the USB host
Date: Fri,  6 Nov 2026 11:46:57 +0100
Message-ID: <20261106104659.54656-9-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Add the two USB2 PHYs and the USB glue with its xHCI host controller.
The S4 has no USB3 PHY, so the host runs USB2 only.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 8bbd70e52a29..155997649dc3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -770,6 +770,26 @@ cpu_temp: temperature-sensor@20000 {
 				amlogic,secure-monitor = <&sm 1>;
 			};
 
+			usb2_phy0: phy@3c000 {
+				compatible = "amlogic,s4-usb2-phy";
+				reg = <0x0 0x3c000 0x0 0x2000>;
+				clocks = <&xtal>;
+				clock-names = "xtal";
+				resets = <&reset RESET_USBPHY20>;
+				reset-names = "phy";
+				#phy-cells = <0>;
+			};
+
+			usb2_phy1: phy@3e000 {
+				compatible = "amlogic,s4-usb2-phy";
+				reg = <0x0 0x3e000 0x0 0x2000>;
+				clocks = <&xtal>;
+				clock-names = "xtal";
+				resets = <&reset RESET_USBPHY21>;
+				reset-names = "phy";
+				#phy-cells = <0>;
+			};
+
 			eth_phy: mdio-multiplexer@28000 {
 				compatible = "amlogic,g12a-mdio-mux";
 				reg = <0x0 0x28000 0x0 0xa4>;
@@ -988,6 +1008,31 @@ mdio0: mdio {
 			};
 		};
 
+		usb: usb@fe03a000 {
+			compatible = "amlogic,meson-s4-usb-ctrl",
+				     "amlogic,meson-g12a-usb-ctrl";
+			reg = <0x0 0xfe03a000 0x0 0xa0>;
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clocks = <&clkc_periphs CLKID_USB>;
+			resets = <&reset RESET_USBCTRL>;
+			power-domains = <&pwrc PWRC_S4_USB_COMB_ID>;
+			dr_mode = "host";
+			phys = <&usb2_phy0>, <&usb2_phy1>;
+			phy-names = "usb2-phy0", "usb2-phy1";
+			status = "disabled";
+
+			crg_xhci: usb@fde00000 {
+				compatible = "generic-xhci";
+				reg = <0x0 0xfde00000 0x0 0x100000>;
+				interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_USB1_TO_DDR>;
+				status = "okay";
+			};
+		};
+
 		uart_a: serial@fe078000 {
 			compatible = "amlogic,meson-s4-uart",
 				     "amlogic,meson-ao-uart";
-- 
2.56.0

