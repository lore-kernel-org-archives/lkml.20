Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019168;
	b=X42+G9Q63kHkRBOGhuUo4tGbUI5to8pS2vLVV1XJNj36NIlfi42L/0nrZo/UpiaTNIRJ
	 IpWUxW9XJOFQxr+cljZXwcEDGec+4BpmgbX2bRC0IABaP2MeLAP01wP+2sI3Src81D2wq
	 ogMeRkZ5AirlHadiUnmgTO6OK9Jm9+QT9dt4UBGUaHNrarV34Elw5oWjyah+SxS2OfPF9
	 jhCOTQOEA1UUw0VpVv7oHxW7L4Da/Mht+Cf9KULAKSQCTIEwoPn7EAKCOypb68cdRDun6
	 nLaki9PDy0r3NBYaF4ekeTR/rbd/TRvLHg/+2OK/H4+iH8b01ZwvkLYObyxdHkL5nWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019168;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=XxBlJ450fGP5NE0P23Mw4mDA1i18VKdOWeLhUI4rES0=;
	b=XvoJoieYylxeNh/ZGABe26gkrxq45nUuHAyjktZ/dtzTll/TW3R0KxbUypQ2igRooOZk
	 9i/RPMr0P+pZlKyMN/8OllMCE11dgKJkS5ZQZcZbnK0WWb9JhmcXXOy5m1gfanJSZNqbD
	 dLj0LNTOxbirfKUpzc1kUKshOunTlQz2vVsB6giD4d68Oe4WyyjLH+QvZHd+j5J7bYgFV
	 RyfCw0X48jrtBk6gbKL85hUb705KvO+9qa5lhoK9ycAF5SNolb1G1x2/Hv89DDdXA2ekV
	 l0XoTW9WrmNlSuvK7XPFA6guN9ZQMZFAVR2/NqVIlFo0T0xRKG2bUDUoiO4yF5ubw7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=AlgiRuq7;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6D5606A31A;
	Mon, 26 Oct 2026 12:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE6D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=AlgiRuq7
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E4BF109A73;
	Mon, 26 Oct 2026 13:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793019162; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=XxBlJ450fGP5NE0P23Mw4mDA1i18VKdOWeLhUI4rES0=;
	b=AlgiRuq7A2ePvip9fex8piaNBG59JakTzjeRi3XN14FOb14aKXQbYAlZNgZWP4V8YmwFGz
	DEmSqOncC0hKIa0e9C+UGVKzX+DfdFblTironaPUW0jwH6ChFP+YpvvqrNJvTiLYI/4HXd
	3i+jtVg/GKRaV2nYKZ6EjmcBSGnW+xI6v/0yLbCb0tqDC1r2YvEANKYaMWP/xml7jDt6Rn
	gjr/QV0bEcq7mKfOgieTWv+hhJaW2Bx3oLywjqPchLDZvTCLPAsmWFsehypOJCIpFBHxwA
	9MJHOQdJOlSb5/0ZHPu80WTVTgGyBteV/r7zfcE0428JAegbDMeKWNUVuZGfLA==
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
Subject: [PATCH] arm64: dts: st: Update gpio-line-names on STM32MP23xx DHCOS SoM
Date: Mon, 26 Oct 2026 13:52:11 +0100
Message-ID: <20261026125240.76753-1-marex@nabladev.com>
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

Adjust gpio-line-names to match both STM32MP23xx and STM32MP25xx DHCOS
SoM pads respectively in their matching SoM DTs.

Fixes: 6642d6a47901 ("arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
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
 .../boot/dts/st/stm32mp23xx-dhcos-som.dtsi    | 54 +++++++++++++++++++
 .../boot/dts/st/stm32mp25xx-dhcos-som.dtsi    | 47 ++++++++++++++++
 .../boot/dts/st/stm32mp2xxx-dhcos-som.dtsi    | 45 ----------------
 3 files changed, 101 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
index 5d4624c3200ad..7a95f56bf857f 100644
--- a/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
@@ -20,6 +20,60 @@ aliases {
 	};
 };
 
+&gpioa {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "DHCOS-C", "", "", "";
+};
+
+&gpiod {
+	gpio-line-names = "", "DHCOS-K", "DHCOS-J", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&gpiof {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "DHCOS-E",
+			  "DHCOS-N", "", "", "DHCOS_RAM-CODE_2";
+};
+
+&gpiog {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "DHCOS-P",
+			  "DHCOS-O", "DHCOS_RAM-CODE_0", "DHCOS_RAM-CODE_1", "",
+			  "", "", "DHCOS-F", "DHCOS_HW-CODE_0";
+};
+
+&gpioh {
+	gpio-line-names = "", "", "DHCOS-I", "",
+			  "", "DHCOS-H", "DHCOS-L", "",
+			  "DHCOS-G", "", "", "",
+			  "", "", "", "";
+};
+
+&gpioi {
+	gpio-line-names = "DHCOS_HW-CODE_1", "DHCOS_HW-CODE_2", "", "",
+			  "", "DHCOS-M", "", "",
+			  "", "", "", "DHCOS-D",
+			  "", "", "", "";
+};
+
+&ioexp {
+	gpio-line-names =
+		"#ETH1_RST_P0_0", "#ETH0_RST_P0_1",
+		"BT_REG_ON_P0_2", "WL_REG_ON_P0_3",
+		"USB1_PWR_EN_P0_4", "USB1_PWR_STAT_P0_5",
+		"USB0_PWR_EN_P0_6", "USB0_PWR_STAT_P0_7",
+		"SDIO0_CD_P1_0", "USB0_SS_SEL_P1_1",
+		"#PCIe_RST_1_2", "#PCIe_Wake_P1_3",
+		"#QSPI_RST_P1_4", "#CSI0_PWDN_P1_5",
+		"#CSI0_RST_P1_6", "#PCIE_CLKREQ_GPIO_Q_P1_7";
+};
+
 &rv3032 {
 	interrupts-extended = <&gpiod 10 IRQ_TYPE_EDGE_FALLING>;
 };
diff --git a/arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi
index 23c25ea086445..3f3bdef05ce4e 100644
--- a/arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi
@@ -20,6 +20,53 @@ aliases {
 	};
 };
 
+&gpioa {
+	gpio-line-names = "", "DHCOS-M", "DHCOS-K", "DHCOS-L",
+			  "DHCOS-E", "DHCOS-J", "", "",
+			  "DHCOS-D", "", "", "",
+			  "", "", "", "";
+};
+
+&gpiof {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "DHCOS_RAM-CODE_2";
+};
+
+&gpiog {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "DHCOS_RAM-CODE_0", "DHCOS_RAM-CODE_1", "",
+			  "", "", "DHCOS-F", "DHCOS_HW-CODE_0";
+};
+
+&gpioh {
+	gpio-line-names = "", "", "DHCOS-I", "DHCOS-N",
+			  "", "", "DHCOS-O", "DHCOS-H",
+			  "DHCOS-G", "", "", "",
+			  "", "", "", "";
+};
+
+&gpioi {
+	gpio-line-names = "DHCOS_HW-CODE_1", "DHCOS_HW-CODE_2", "", "",
+			  "", "", "", "",
+			  "", "DHCOS-C", "", "",
+			  "", "", "", "";
+};
+
+&ioexp {
+	gpio-line-names =
+		"#ETH1_RST_P0_0", "#ETH0_RST_P0_1",
+		"BT_REG_ON_P0_2", "WL_REG_ON_P0_3",
+		"USB1_PWR_EN_P0_4", "USB1_PWR_STAT_P0_5",
+		"USB0_PWR_EN_P0_6", "USB0_PWR_STAT_P0_7",
+		"SDIO0_CD_P1_0", "USB0_SS_SEL_P1_1",
+		"#PCIe_RST_1_2", "#PCIe_Wake_P1_3",
+		"#QSPI_RST_P1_4", "#CSI0_PWDN_P1_5",
+		"#CSI0_RST_P1_6", "#ETH3_RST_P1_7";
+};
+
 &rv3032 {
 	interrupts-extended = <&gpioi 10 IRQ_TYPE_EDGE_FALLING>;
 };
diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
index bcf63e2ea9898..6febdbfe83649 100644
--- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
@@ -218,41 +218,6 @@ &arm_wdt {
 	status = "okay";
 };
 
-&gpioa {
-	gpio-line-names = "", "DHCOS-M", "DHCOS-K", "DHCOS-L",
-			  "DHCOS-E", "DHCOS-J", "", "",
-			  "DHCOS-D", "", "", "",
-			  "", "", "", "";
-};
-
-&gpiof {
-	gpio-line-names = "", "", "", "",
-			  "", "", "", "",
-			  "", "", "", "",
-			  "", "", "", "DHCOS_RAM-CODE_2";
-};
-
-&gpiog {
-	gpio-line-names = "", "", "", "",
-			  "", "", "", "",
-			  "", "DHCOS_RAM-CODE_0", "DHCOS_RAM-CODE_1", "",
-			  "", "", "DHCOS-F", "DHCOS_HW-CODE_0";
-};
-
-&gpioh {
-	gpio-line-names = "", "", "DHCOS-I", "DHCOS-N",
-			  "", "", "DHCOS-O", "DHCOS-H",
-			  "DHCOS-G", "", "", "",
-			  "", "", "", "";
-};
-
-&gpioi {
-	gpio-line-names = "DHCOS_HW-CODE_1", "DHCOS_HW-CODE_2", "", "",
-			  "", "", "", "",
-			  "", "DHCOS-C", "", "",
-			  "", "", "", "";
-};
-
 &gpioz {
 	gpio-line-names = "", "", "DHCOS-A", "DHCOS-B",
 			  "", "", "", "",
@@ -278,16 +243,6 @@ ioexp: gpio@20 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		wakeup-source;
-
-		gpio-line-names =
-			"#ETH1_RST_P0_0", "#ETH0_RST_P0_1",
-			"BT_REG_ON_P0_2", "WL_REG_ON_P0_3",
-			"USB1_PWR_EN_P0_4", "USB1_PWR_STAT_P0_5",
-			"USB0_PWR_EN_P0_6", "USB0_PWR_STAT_P0_7",
-			"SDIO0_CD_P1_0", "USB0_SS_SEL_P1_1",
-			"#PCIe_RST_1_2", "#PCIe_Wake_P1_3",
-			"#QSPI_RST_P1_4", "#CSI0_PWDN_P1_5",
-			"#CSI0_RST_P1_6", "#ETH3_RST_P1_7";
 	};
 
 	eeprom0: eeprom@50 {
-- 
2.53.0

