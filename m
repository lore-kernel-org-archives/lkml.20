Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019132;
	b=esvlvqvwCtDSI/QFzOEjY6skIyjIaRpE8YUzn5P3W5rqLYnYZzdQxSYLkYy0cAsZOEth
	 LhXhwXiOkswoQYWOxpkMIppk9i5smcpf5dFzh+4qWSLnRz9h/Vf0/h8prpTVXAflwRRB9
	 1SnE8yISe+J2ZfblYrGR9emqesLmGCck9VhDLd+RXbI85xBZlnw+gcPXm1UNwdX9yyuE/
	 dX4q4AdYmOODiyffkess/UkUcp0K8SQ95xr/toyL53p+X3UKN+x5jm3a7YekiZmJ6o15v
	 ey4vHsuEnpWVCMzABFPUyeDS6M/jdrvP5pT7LybhGtVYSxDCtgGZ318Se91g1UMlYkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019132;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=ONPO9iv+gG/8/my8a4wsEXO1rhD3B0oGFhZA4jXD498=;
	b=k6s8M7UV2a+eqyd8guivy84D2q2Koxn8hqA+dLjuSvW/DW8eH2tCN/i5IPquxN1FvWS5
	 IzoO3zxb6djyVxvRYvF9Lm3kz61cpNDSeEpPU9a62dO4NMH6HlC+xudUubuI59yL/3uZN
	 xNNWsRQ/6o3TOJ3skYOzRrSAbGx8CK8ujAG/DWz/U/XRQGivEK2bLR0U4tuYQ3IcJwicd
	 JYFDto79PnXqNWn3ik93/O65lz1gm0s0uXBwPgo3hUeLk/LVMepVItK9PunCLcUlxDXiQ
	 jFU9c1pXkHpoAVvRkq/wqEs5eprGG/HFs8FnmnmK5ccUv4J/8qJAHdPwvlF/qncoxfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=eSWucYVB;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF17606A31A;
	Mon, 26 Oct 2026 12:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AF17606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=eSWucYVB
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DD01108493;
	Mon, 26 Oct 2026 13:52:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793019125; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ONPO9iv+gG/8/my8a4wsEXO1rhD3B0oGFhZA4jXD498=;
	b=eSWucYVBc5laiV8IH04jLFMhd1NqSSAgVFtoBYhzz8ofkfrMWNiTQScay55YlczBNsLLzJ
	NkCDA6A6AMVK50wEPUP4VnM4TV5eiFVgienl86d5xGXbMlPjQyJETeSyc1CemKKD0GKRBb
	f0wsWwV2mdC7KDSw5j7GEA93jiXGxlCU/7IBFGNTeHmBBprrVJUlMkWh9KL6Q/k5BMjcXN
	iO057G9cQcL0Imoi+xSqROEys44E+lxaRiG6oYhOdD9AFgAdNrhLBQLQMw/v0Rq/6O5pV0
	Wepe63+vL175llrR9nEo2NwiJxhDK6cdtWDq3OLmqfpQCnDw32O7HTanq2ZlKA==
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
Subject: [PATCH] arm64: dts: st: Move Bluetooth to USART2 on STM32MP23xx DHCOS SoM
Date: Mon, 26 Oct 2026 13:51:38 +0100
Message-ID: <20261026125201.76716-1-marex@nabladev.com>
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

The Bluetooth chip is connected to USART2 on STM32MP23xx DHCOS SoM,
adjust the DT to match the schematic.

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
 .../arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
index ffdcceb2fa237..5d4624c3200ad 100644
--- a/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
@@ -24,7 +24,6 @@ &rv3032 {
 	interrupts-extended = <&gpiod 10 IRQ_TYPE_EDGE_FALLING>;
 };
 
-/* Bluetooth */
 &usart1 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&usart1_pins_a>;
@@ -32,15 +31,9 @@ &usart1 {
 	pinctrl-2 = <&usart1_idle_pins_a>;
 	uart-has-rtscts;
 	status = "okay";
-
-	bluetooth {
-		compatible = "infineon,cyw55572-bt";
-		brcm,requires-autobaud-mode;
-		max-speed = <3000000>;
-		shutdown-gpios = <&ioexp 2 GPIO_ACTIVE_HIGH>;
-	};
 };
 
+/* Bluetooth */
 &usart2 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&usart2_pins_b>;
@@ -48,4 +41,11 @@ &usart2 {
 	pinctrl-2 = <&usart2_idle_pins_b>;
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "infineon,cyw55572-bt";
+		brcm,requires-autobaud-mode;
+		max-speed = <3000000>;
+		shutdown-gpios = <&ioexp 2 GPIO_ACTIVE_HIGH>;
+	};
 };
-- 
2.53.0

