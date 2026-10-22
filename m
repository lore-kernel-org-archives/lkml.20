Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672909;
	b=5ME0kH5YNv0QnYOnkGp7FsqcshGm0DaSAIp1WiVXX+0YH/Zwcsn6zHwxI8wL6LoiPse+
	 g/06vBd1aWkiZSfSmlpjJMnj6BW1B1i1mf6rFAR/cyWH5zvmi2xsMtIX2Ki2cWIhh+5+y
	 FVDvdP8ozZLppwaqNlWmZQ+lQFFqmK7k4rWUaynJYIT5dDoYiDpcQby3cd4xmbS+RM/Az
	 dYQO2BKB/ns6Qqkgy5mw5H26eGDUf+UEmlr4AeesAnk/B0L++k7mduNvQvztmKH4mceit
	 EXRncl++LUbkGf3weMPaI6S9iGwPRL6Z/dI84V6n0E5pYepK1XnUyWryh1eAfPhFNFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672909;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=SJbq/0wOnbvPIMJtKcmtse3uM3IzsSK29zH+AGSwz+s=;
	b=bZy2sRJozOS3fKx17ongCNge3F5w2NgzD6w9eI3GZxEGTNJN+ipxSPXUzhOcju7sbH2K
	 Ac8a4UoFJSCa7keWhyIWmi5q1dKjgqalxqgCNhKkxBtdwDASB5lNIMRlWzreEUy8vcTgU
	 Ib6tTT2FBOFK23NdZiRmbIuwyzNjkz30PlNeSc6izOgh2kx0V6yq7F+lpEzfz+72pOoo8
	 Y3T9S4gn34Jluip2kmDaf/N3Atir2Sr3YoV5GCOdtpSiTsQ4JMG5S9evqO6xdCRJVEWzL
	 bKIU+PiSEmlAvaz2GHWGuXgxzVyZ0iw2sYoiEuUgobHyJI1s8LORl+v+tH+OHRioYvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=C9F9sNuC;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B02606A319;
	Thu, 22 Oct 2026 12:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B02606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=C9F9sNuC
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFF671063F2;
	Thu, 22 Oct 2026 14:41:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792672903; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=SJbq/0wOnbvPIMJtKcmtse3uM3IzsSK29zH+AGSwz+s=;
	b=C9F9sNuCPPI19GLbN7IIa7VhIXPfYcTzqKUpOCajwBULhDJoKjQCTPfkzFOfPH/bEaTzis
	+Pz6PCWAIjCUpSzQa/JabukUESupasHMhFkW6hEJmNeWF/DGSvfiga86ck7dL1J1mn+0hA
	Q+JqUurkH820nmS9fbwtCXf6bbSwT/nGAn4dC9FaM5j3EkAiDf9St6gNtfXwDP8hsA0nR2
	Rv1T5INdwMkJr5VynUdit9lAC/OmWKWuPuKZgTTwZ0jKUqROMbiVZDNj53QzgSu/PrRQxe
	lOT+N/BImuxfceka91T+wV1YS63gpW0jlPtwQtwO4IhFry/mboi45MyA9/WLDQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] ARM: dts: stm32: Convert GPIO hog to USB connector Vbus supply on STM32MP15xx DHCOM PicoITX
Date: Thu, 22 Oct 2026 14:40:55 +0200
Message-ID: <20261022124138.185850-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
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
X-Last-TLS-Session-Version: TLSv1.3

Replace current GPIO hog with USB-A connector vbus-supply.
This moves the Vbus GPIO into port control, where it can
be enabled and disabled by the controller as needed.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 .../dts/st/stm32mp15xx-dhcom-picoitx.dtsi     | 27 +++++++++----------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
index 01c693cc03446..7f444bd4c58d3 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
@@ -16,6 +16,14 @@ led-0 {
 			default-state = "off";
 		};
 	};
+
+	usb_vbus: vbus-regulator {
+		compatible = "regulator-fixed";
+		gpio = <&gpioa 13 GPIO_ACTIVE_LOW>;
+		regulator-name = "Vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
 };
 
 &adc {
@@ -30,21 +38,6 @@ &fmc {
 	status = "disabled";
 };
 
-&gpioa {
-	/*
-	 * NOTE: The USB Port on the PicoITX needs a PWR_EN signal to enable
-	 * port power. This signal should be handled by USB power sequencing
-	 * in order to turn on port power when USB bus is powered up, but so
-	 * far there is no such functionality.
-	 */
-	usb-port-power-hog {
-		gpio-hog;
-		gpios = <13 0>;
-		output-low;
-		line-name = "usb-port-power";
-	};
-};
-
 &gpioc {
 	gpio-line-names = "", "", "", "",
 			  "", "", "PicoITX-In1", "",
@@ -132,6 +125,10 @@ &usbphyc {
 
 &usbphyc_port0 {
 	phy-supply = <&vdd_usb>;
+	connector {
+		compatible = "usb-a-connector";
+		vbus-supply = <&usb_vbus>;
+	};
 };
 
 &usbphyc_port1 {
-- 
2.53.0

