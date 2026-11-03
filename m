Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723845;
	b=PyJnzwrp6kQptCYjdvx1ZKB07o7MUSJV9IRJq0VqJZ81bLaOVg55J/21g97E3rPDFK/8
	 XjC7a6qn3QEF3sEZnzadJlQDF6ZH40r2fNCXMAYmDoXBQEzOEz9oXJc1nBfzL/tnmCSKB
	 E1RbZbKMtnJkfkitV221RceTc4keUjhUWtkcYn0I+BIIQex2mygH/o5RVesCdusMnyWYu
	 jeIfLjpU5gr3FyCZzSH0V778dDoOYCUzaPIJFtHQivlJrCjbQ6EgevcDsPWN2nAHBGXa4
	 AEyoEaob/g9SLhCNB//TmfQy8QgEGx48Rg/7QsgO9OSzUwASm4ofxyeb7H0+QkbQJPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723845;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=paduv/zXRliBqDWBFf1W5OOKpbqC02TK32FfMcPBmKs=;
	b=NnYpeLf5BIsoB0EcGkHNhm14utzL3n9EBTr75RroTSoCiBuveqrI0e6hEePrTYcOxo5K
	 NIk5rHInya6+aSLUS+5HOuTTVnOxWre0slq9p36H2t4Gt5YPPKurZJU9otpaIKIZfZHAz
	 JcG4fOFUrhZPindk1TPvZ2nJDlr+cQyQ24JqywdPHDul/oXS+btDXQWDhKdl8tc271KvV
	 oRb3xkgWkjzTLKR3dUEjyZaTaDqRC4yEFiyB8JOvTd4In+lKQt3GgiXIsNqX3twqwMl0e
	 XzkHgWwwNbeT7LQL4+mvNgDKz+MTBB/tfqgmjK7NxwdS+Z4IaOxjN0sm+uc23qNi7mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9C56082BD0
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A9C56082BD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so35683085e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723844; x=1794328644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=paduv/zXRliBqDWBFf1W5OOKpbqC02TK32FfMcPBmKs=;
        b=qOjbQwUKR/Nhgjg4CrvHabCMUtjgleKAkTk3nvKZCpijwQAPWR9d3Zy9IwecmY/Ioz
         YeeyAPnQdrYDlu/WsbAghUJCBNq4rYbNvydomSgolB3InjjPg+EYqOGGcpGSdMXgSkxr
         dPUglvmTRQ93lQOt2p8mKh1IHqRPFntryWdKMH/kDUPCMukr3X5o5Tc8GCommYaHGBMs
         QUF43Vi+L5ypuDba5AvRJJ9256ToN9xfpRW7PcXFyi9Q65fp2NympT5ScqAkh/AnOj2X
         OJq0sUYtweRyhia2fSpC0eP5Hbadr9GPq3y1Hp1/kt22ztlDtQRKu4Lif9rcQDAATYks
         TNsw==
X-Forwarded-Encrypted: i=1; AKwUvBykeEOQx8Njimuw5rjtNZfReALZWnLxL32EpPf3CxKI3vMVSY/9ahDGbG02GbAR30hjUA8fsJSlRMcgQVU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/96Xct+3oDQBQwPZBr3gSzKZ3iNb67q1RfkART73IRfU5Ga/WF
	2PEezaPqYVepOxX2yJWnQloGE2Gawk6fSkbi7sCSSW6RV4s7tNmMAawq
X-Gm-Gg: AYBFou1i2oF9lze75SiCPFOrxdmnPKZyX/RT5qczR1/S4svf1vKO9vRw76ywRJZ+dqa
	g8qDKsfOX+oU3TiGJBFuQudkiWH/njIJuznLHrhtude9LIbObhFMkp3kqXh8c0O+FiUhHslCJCj
	eBj2d5ckOvZqV/oR5U45BARTCSEFyGngRpb5lQfXA1kn8a2Dk8VCzD5jYzX0BJYsB42DLfZ0kSb
	rESEzQfV29bAX/ZaWiQK/exLCrynrxrDB2M+3OKwc9XsQR5U6jc6g4BBU3rd7rT6j4Z23jzUwwf
	AALyBlXM+IGEavcEWjQDv99mHe202jkSW9AY6KA1xeDxn4aVuahbGpb1VNomZI2CU91rhQkBwYO
	flHKob3gr/TXTwe/U8+ex8SJhd2Ij0ry6+zskvG6il1V2wWYxWOY0Byoc5OlpMWbMvQ3QEr6R36
	14Sv+RaeJvTPFV06pWT3K6aLfGFBQ0qWw9s3oISKMA9Kdp2pWkgrgkaGGimAG3ww7iFNC6CN5Qc
	qzrEjHuBlfj9wCe7g6kz4fl19Ce5hQdXHvGvgLTB+01P9PqOa9T/nKyJFCwQXeatGtGQn6dVYW+
	q5dT/0h7+zjhkGjSwB//qcRgF1puuV3iL/1QrtDOmwUrnj0AbS8y/LdWFH9MZWI6pzl4ychBTIZ
	tSyjLJAPposjgd7ooxLca3vprdw==
X-Received: by 2002:a05:600c:608d:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4ac18b7dcdbmr311763505e9.19.1793723843721;
        Tue, 03 Nov 2026 08:37:23 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:23 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/7] arm64: dts: amlogic: t7: add the ethernet controller
Date: Tue,  3 Nov 2026 16:37:14 +0000
Message-ID: <20261103163715.385394-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
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

The SoC has a Synopsys gigabit MAC, glue registers for the interface
type and clock timing, and a multiplexer that points the management bus
at the on-chip 100M PHY or the external pins. None of it was described.

The controller reaches memory through a pipeline stage with a gate
nothing else claims, so it is switched off as unused. The
glue registers share a clock with the multiplexer, which probes after
the controller has programmed them: unless the controller holds that
clock, the writes are lost and the port keeps the
bootloader's delays.

The multiplexer and the on-chip PHY bus start disabled: a board enables
the multiplexer with the controller, and the on-chip bus only when it
uses that PHY.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 60 +++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..f15fd8f6cdd2 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,33 @@ gic: interrupt-controller@fff01000 {
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		ethmac: ethernet@fdc00000 {
+			compatible = "amlogic,t7-dwmac",
+				     "snps,dwmac-5.10a",
+				     "snps,dwmac";
+			reg = <0x0 0xfdc00000 0x0 0x10000>,
+			      <0x0 0xfe024000 0x0 0x8>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clkc_periphs CLKID_SYS_ETH>,
+				 <&scmi_clk CLKID_FCLK_DIV2>,
+				 <&mpll CLKID_MPLL2>,
+				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
+				 <&clkc_periphs CLKID_SYS_ETHPHY>;
+			clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline",
+				      "pclk";
+			power-domains = <&pwrc PWRC_T7_ETH_ID>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		apb4: bus@fe000000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xfe000000 0x0 0x480000>;
@@ -645,6 +672,39 @@ gpio_intc: interrupt-controller@4080 {
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			eth_phy: mdio-multiplexer@28000 {
+				compatible = "amlogic,g12a-mdio-mux";
+				reg = <0x0 0x28000 0x0 0xa4>;
+				clocks = <&clkc_periphs CLKID_SYS_ETHPHY>,
+					 <&xtal>,
+					 <&scmi_clk CLKID_FCLK_50M>;
+				clock-names = "pclk", "clkin0", "clkin1";
+				mdio-parent-bus = <&mdio0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+
+				ext_mdio: mdio@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				int_mdio: mdio@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					status = "disabled";
+
+					internal_ephy: ethernet-phy@8 {
+						compatible = "ethernet-phy-id0180.3301",
+							     "ethernet-phy-ieee802.3-c22";
+						interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
+						reg = <8>;
+					};
+				};
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
-- 
2.56.0

