Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572341;
	b=DTgnSOe+lFXxhVzht8yH4hxGtekTuUOPEWfNsKbut+5KVG1q84e1meZvKOQ3HioEXDSi
	 BYJDDYPVJLxqoPPSaE5weyoHxeQ3wSuUvMNjMM35UwlO82oxHzpLTDQ57U9aNWZSXGfNM
	 osXhhztQhajRhCn63t+yFCUYty1dTDZV32o9BqVUk0vadJfHv+z5uoGVHtf93OQxEQjoN
	 Z3oe6Xs1832Nw5/PGOI+ZzdVvjymr/z6JK3CehvicKryVhV5t9aKa3AeOy8SImqB26uOy
	 bhtmR95OjgDz3Jz/AYKvRQDDjHDcolY8IUf/fDOgjWM8KHQ3RH2Z6KC+5RKuGzA3kag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572341;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k8LUINT1uPJGcPtj79NOLQhhl8W2gjYoDk+VmjrsPuU=;
	b=Ga4fZ65BefuR4ozKeis+tgFe2HzN6qb8sPakTkmvIZos6b8WzCLLAjM3nSwo5fFnOH3o
	 gG3u+XpV2JEqffdAmpWSLEafDn3kU81ZHAczPTFs+65FAzI/lHsA6Uns15Uqs9dn2BXxY
	 soKmtwUMyC3JsJphatQWgnFOKzsPjfl4aEPKXJ1yV5R7UEz8m6u+VzBOMH/y8ZdRrEz9O
	 cSFAkTSp+iWyZb6oIPWt2aJhvjMbJp2JyKXANKg0wsdQTRW5hkJPXiigWQPfsq2nkB8xb
	 d/A5xhE4/mIWUWHXwVppJOZsGchoonGn1MVvEesc0n+x8Ujv6ILK+vz4okhsNg4SPiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E576560A3808
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E576560A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-497614c95f0so390337f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572339; x=1795177139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k8LUINT1uPJGcPtj79NOLQhhl8W2gjYoDk+VmjrsPuU=;
        b=N/+QCF2ZVp4gYthTSpJuj7u186kgruFD8bCSny+J/YkMOvTgiwT0wrPzHBSC61oiaL
         nsjUfdZ+P4DIOyHQtnXuuhRl+8iQZajZX+vgZxScvwkSPv5bQts70/F9kKkXSDZM49/U
         I6N6OOhJUFgSQWwfzh/kgIcsQwLRk+HnfHt+iVXayYmzvuGLEfD1kRr3ptJZffa8ZF/M
         hEURR0vsT1jSIYkT/yvb36EQBmKXfp8i2okvp9CiP4b3vIHaCyTKDs07pXbXgM8Ypvas
         IC4Z89sdfD0f2ZraNyssxpNiCDpk7Oo5oT2Yhnw5PVIh/+97yjbOEW4bMO7H14t7ACuQ
         XczA==
X-Forwarded-Encrypted: i=1; AL+hErGVeSZlNJW9IbdQveGZEEpLb/y8pC7g6pBN+CwsR7M78kRXUsHZLPvlmNusyuYJxxNmzk7T4SGoKpB6SuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y71ASHzX4nVnCCuTUHwcjk0v+bnda5ZVg5z2t2koHp1DtPPJj
	VAGQg3ApilnIBN6VcXo7Z+dtExT1MpjYzElXLpBA8/v6A9f27Ah8QGzw
X-Gm-Gg: AYBFou2/C6fXSPAwr9J6oyx/pAs6HQJfMjzSSnQ4FiWFgiV4eyOpqInvQYtnsfnIvzh
	cXBmZUpzoYtTxUp1s3NJvIbaT1ePzZoiq/xG+pG8XgbNP4kBYqxINEHVLI18lNLEy6hoVneD/TB
	AZ/PZFmJ/KSm97SpuaxKkpwMbbrxKcZLRJ7Fx8/yxSq9cdDmVeV3p6zb/vYogOwGEZ0pMOz1OP6
	5vqUkVvOotYFn2ZfB7DQsTp0a5mkNyj/Q7NjvPA98gcpevvf25elgLj50BE0xGfvrjCLVTi/Sj3
	JKyZzkXWBFvLdGaIAmttwVohJsHuRjM/0iDseDYRsBOJByUv7ctuKEQdhxdaCZ4UY1JqAJ2dqYj
	dWFI17WvRf1S35tZ02oJ9a4GVR9qZ/qNH10fapXePg1rd1jnfLnSJUD4dp3t2F/VkxKDvANJkF6
	L1rKSIPUQKWPVF2+fKnOFrjlLzfPGj7wHicqHfnTZQWZGC93lPczndOe+NnW2S1UUh2NVg1+Elo
	KcID4YMSX9ABmtpy+rVu/Jcw9lYtomgQI8NS8sCY87dNCMQFVASkKT6uUzb0QM53ABQyvA7Dde/
	sVNogbl2NZvApa1ravPuWyUIG/20Sw/8vvkypxG7w1kjnQhQFSKOHsq73o3avkvm3VBpaQ/kgW8
	0/ij0JdJRjVz7LajCT/vo8alA
X-Received: by 2002:a05:6000:18a9:b0:498:88f:14c8 with SMTP id ffacd0b85a97d-49c73259e2bmr5745745f8f.9.1794572339177;
        Fri, 13 Nov 2026 04:18:59 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:58 -0800 (PST)
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
Subject: [PATCH v7 6/7] arm64: dts: amlogic: t7: add the ethernet controller
Date: Fri, 13 Nov 2026 12:18:51 +0000
Message-ID: <20261113121852.334604-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
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

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 58 +++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..c6797688805b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		ethmac: ethernet@fdc00000 {
+			compatible = "amlogic,t7-dwmac", "snps,dwmac-5.10a";
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
@@ -645,6 +670,39 @@ gpio_intc: interrupt-controller@4080 {
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
2.56.1

