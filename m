Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873014;
	b=u0asGFIVV2aCCE37H/V8I1wbJ+tyDf+WDdSiooSgt1ZsUk6JYItKxxm6i9wwB8nQ1CIb
	 brF59C15MzM51BuA36c6uRFvXAPFkh0uDWTWep5/2zx7LmCIlQzgWoOXQlZD7rytQa7AZ
	 ohwGiis5H9EibhSZOa7uh4ybJS9g2/RVCy3TtRZVkD4w+zv0pb+e4ZNxczRLPo1dqrvtE
	 jIO/qElzOFJZtxE1HrbjxZXDVLDarEJ7vDGfUG9R2wzx+HzlIRmBf38/f+9XpWTJl67aN
	 i4FDDLIiXOTgK2WcW8cs8ZgC2Jozd5igLxGMYgRUwSl1YMMNRakIVwINhXfr+VvLODA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873014;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=paduv/zXRliBqDWBFf1W5OOKpbqC02TK32FfMcPBmKs=;
	b=yp7y455wbsCmVKVvk+b9aTlpESRibOl/n2SNc+B7tytX7jzKt4y1ve4DHYQ6MqoY8+8i
	 SJP/O2DuUaKpngpQ/JPr/9nwPoT6mY9YKZ4iYt0zF+KvBTH4nP+l4XPtP0AIMi9szmjXI
	 VU1gwvcQv657jUiLo5JRff2B0E9phuCT00cpJrC2irmuGUjRkRMK2Cf33qcIlV0l10/c9
	 Zne///7tv5qCuTrvN2FgqoTbJEyN3rGqIXfEPekcZHSmNSs9AHylpvSxCFHSSeSeLernP
	 8doAl/0mAhGBBm8Y7q8v1ldKP5h4BwFsM3JXGuNXLE52vjcg6Ra/S5I3X/5G+wz8FTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD93606EE9E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD93606EE9E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so14857765e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873013; x=1794477813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=paduv/zXRliBqDWBFf1W5OOKpbqC02TK32FfMcPBmKs=;
        b=Q34xMaxo0AeBvSx5K43zHFqnIqFXHtP+RtSojfMKD92N3ohkQzf5qQzkEuYXRC9QAr
         bBvfEJJE+JM6MeEBL7tyUNQeLT49wU6EvP2OqD54ETBqxVyiihqNhILWXqNugeJZ1nBz
         /5TPaWX7gDbXKTDxJ+jxqgHd+hD3EfW3y4My0L4GylNQw+7eu+mnsLdZlSZlFzCCmOTU
         L2DlTeNGc2wC4j8bX9Iaf4jT/8olz09nCf+Q2chUajJ8OgZkyvVIHRk6wMAhbpH5/Ah+
         f5eHpkvo/AY8y/GJBpZLunnP+xwCpvZZpS6M6wBu90qGUNG8aXmkSpiWeymNFbydJwPW
         OYkA==
X-Forwarded-Encrypted: i=1; AKwUvBwlEzT7UHFlouIPYB/HI0cElID4CJSlsdGA3N4hhxUbmozDpsKLpUhhOU/xbCImNemMzbr575iwQvOBCXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TVhfdvPVMOeaDsySGFqqIriCQc7R0/776yfQwvowFoH1mdWqp
	shkfuReeuh7uqCxgsypKh2gliQzkpuMDUWzfSRLozxr5XEr6tAsXw6N/
X-Gm-Gg: AYBFou24qZP9UFiiVS2z2wqbb2iBUasbOupQ4XYXhrf+Xqc89dT0oV8zy2A7LEDlww0
	Y36hW7paPld/3i0UKFzBHyDLgjW5z35+uPdzVQZJrH8gBTH7MP8aEzW9puIjGpM+XGW5kbAuyPb
	GtwO8BNBy+JmtvhDmsmC8NyJ2B6FXk7D9b8/kznSlWeWFK6MpSGeOtJlXa4L7l3/Vo2QwZMkBi7
	uwUEwUKnugIwS8ac8/Tgki+FQpe3ZUexL1ie6Nzd8/XoAMqb4NrjgFQTKpaxO32mGhPcSyLxWNs
	bU6kIjJPDWzHc8p6QaMbtyM7+BHzy8oTQqsCDL9B40PBOYVJy4BPlcUuN8I9k83WutTlH8Ll3n5
	fooxbm/JR2niJgWR+6baBszEHuIW6o6B4vOOhLBuieLTsqvp3ztzUcxdwoiC7Uj76PV0JRVfDsZ
	EE0xA7SGq+HpEptP115apCInQeYjrIPlb4CPUR/h/oVYdD+esjO0JSZZ0UX5pZ3VdwsMaJXIgOF
	nBp8/+AxFRtB1vg3D8RltwQaYZU59Y3kTP79ms0LmC9kUBQ7va7cNBogNaFLTUInT+iJP3u56zy
	FL6VkQgFN/yf451tI08t5W/W1EXARK2gbLywbqTzSJkHO+FDChaGhRUDyaBJcYXY/TNDtdeOMVa
	VnU1yD6EJxM8n94YjJ8X48K8DRWo=
X-Received: by 2002:a05:600c:6095:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ac182dc30fmr364050625e9.22.1793873012541;
        Thu, 05 Nov 2026 02:03:32 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:32 -0800 (PST)
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
Subject: [PATCH v6 6/7] arm64: dts: amlogic: t7: add the ethernet controller
Date: Thu,  5 Nov 2026 10:03:21 +0000
Message-ID: <20261105100322.37816-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
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

