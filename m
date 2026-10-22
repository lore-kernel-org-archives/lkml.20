Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699614;
	b=Vqzyd5t8KqSLnhuVKI4acnhMn5f9fN1C5ZmR+2ID2TVeNi2lBSUTmJYB49KKeLgVJmAK
	 +F2o7MxKsX2hEK3r9kbDNXiePnBSYa5bGPpYYsg4owO7zcxAuCmrzW4yK9dBfaZmw7nCm
	 zV17W7p+T+wIgbQs8hP2Gw4Q/khYsoeM6n7Bmwwav7nATnqbZ+mvt30IuVnBTeu32ni86
	 2cVihpIZt3gO2SFYC5f0ftqqqmpL0Esojd2nnDwIbe+tlhOYVgB1HbS9f0MUhzxantsYH
	 Bo1l7YKEC4XsKiR1bydhxwA9Ir4Ks7D5zNSRPiQN7IvIPXKc696tPI+XKWnLjAqWBTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699614;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ElpMWQpElxyvYVfod7vt+zc/cJPBYXPVQKctc5VqWXw=;
	b=msJLuA4nH56GSN0lc+4azujiENOLzJ8E08yryq5HsCLsup/IM3/EuzGXrybv0WemzxXi
	 WtZ7Orig8rG5UqEdxWXoW6JcVa57A3D6La71O8D34CW7LNVViI/1EiZCIrkut5/QqXt1B
	 WFZ4TG+3Jw2+hEJFgeWMFseYPdLCoo0GiaSuWzQtkt/3F8Y5jBS4ZI+C4odNO5TfO2q4B
	 cfErKim8SY6n8tV0NFsAiRsD1t+4EgvmQuOHJQA9Nqj/GKovDA46EgN2mpft03dRn5Q3X
	 tTqH0wpzYrc8kqmFJuJe0xu04JBzPE/bYrdxjR5etgC6SjiO5YhGeBXLzm/kfWte9eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D61460A382D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D61460A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20568c8c0so1673385e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699613; x=1793304413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElpMWQpElxyvYVfod7vt+zc/cJPBYXPVQKctc5VqWXw=;
        b=shvC5rMBNWbDUc0P+4VdHpAik8qx9A/IbhZFD4w6J97pVif05pMyEJHaq5LNIRi6f0
         4LUoLuJ/2MNqxW8DfdXBUqZIIc9G3EZxwGJUL5xLITAaheudGgPWJpiT8Y7eQUfylnXS
         vrrFDfJcqLTo15YEzwjo5N7StlX5QST6xph2Ok+otX3dePI3pzfJ0oN27hUt2ebvJMWy
         TDLglZzwVm9X+XD7LjiBG1eTq6FzhIJz73HgiNVJZnzksvCnx9OI3ReUMH1JNwBYzpTa
         e1+9ijY+YqSrZHf2g+rsNbZorz6F9MYlyM/urlYG3yUVX848wANnrRnwKAlXfBxFGrPK
         qo8Q==
X-Forwarded-Encrypted: i=1; AKwUvByq4Zu2bx9iqTmVHSxeCKxppzjqPmujV7IbNoHxmMe3UAW6jJJMRXoMk7JngnyWyGzsBa0+B2q4yAUQpkM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYE7o3t/By/Rr9qOr0biqbH5c8wVhe6mI02BapaM8m5+WLEgYK
	ErDooRwUBzepMR3RAvRkP8yt4Tw3FFcAFaaaJtQO3K7SHRlEuzM2rTN3
X-Gm-Gg: AYBFou3DZhTgLGl47ubVzgO9GEDkujA1tjFkspWbmUnr2lDhtHwfzwBo6O42UI7041b
	8LcEcGwzGJOWJ79eTkJujbX8xIHR8gRuxvQl0fDGDjP9ej6ldW/SHxPp+7ZA7dbZ75Y0UtkfN7+
	O+w78gNtE99K0zmuGmBdqJO3ZBk9Xq5go6JG89SaRrXfbocFd265uxX8aE5cAgnXUKUw2BSCKFs
	UEGARBtUdZ3p+Fz7/xfmxvLPPGIqmJNP24tUVdS08FGoEJ8+u+lJUId89pac0bx7tdPp5f9jKT7
	SuYlL8XU6phEMNdRelS4o2bfw0exrl4eZqXKCyLtvc7NLtJzvAzBMiLzYrks5nmVvJUeHRNbSHB
	a2pyTiIkL5IeFYFBVMOvimTKvLHPyh9bQSI543UQZhYblU1ZfytYqHFcgQB3fQx0As/GyUdF24a
	7ZTX8GzhQlDpu+Io+pY7d4IFqHEzqA5guZySkT5pQmJi7g3NKpUEWsk7HRankbgpoID8eMk136q
	uEgharvX0RP5ZdvAk0gCjK107pBcEDG62qmxX8cwgnzZQGnJW7rneDUqzPOr3CAKRbWIC50A325
	Cz90PvJra+Ojoi0j
X-Received: by 2002:a05:600c:4e43:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4a211ed57e1mr2298085e9.13.1792699612466;
        Thu, 22 Oct 2026 13:06:52 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:51 -0700 (PDT)
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
Subject: [PATCH v4 6/7] arm64: dts: amlogic: t7: add the ethernet controller
Date: Thu, 22 Oct 2026 21:06:39 +0100
Message-ID: <20261022200640.3101932-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
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

The controller reaches memory through a pipeline stage with its own
gate that nothing else claims, so it is switched off as unused.
The glue registers share a clock with the multiplexer, which probes
only after the controller has programmed them: unless the controller
holds that clock itself, the writes are lost and the port keeps the
bootloader's delays.

The on-chip PHY follows the G12A; no board in tree uses it, so it is
untested. It stays disabled for boards to enable.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 58 +++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..94ea22514501 100644
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
@@ -645,6 +672,37 @@ gpio_intc: interrupt-controller@4080 {
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

