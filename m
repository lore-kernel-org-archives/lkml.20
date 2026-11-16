Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838542;
	b=t+/Aw+DIgBDiYIOGrYozB6KZ87uN8BaEPH+xZJu81VnpUsGCs0NnZSF/M6PQ5oT437ho
	 /dbfUO5/5q0m8uA1z9x0VjlQtI+ItWV2X2MSDORMULICoGFbH6n8wT2r7iLraA4GaJs1m
	 NleqG94qmacMS9tqmdLbG0ktWZNnmZqdQ4JI1Z6aOPaBp9gxz022geBVkq9nN8SVJQXwg
	 IruB6hR2DX84vEH6V08udlXd9hoiIHQw9C2uMnoEE+lqYh4J0PgW8xRYe02vzuiK6RiRm
	 P5kuAxJDTN4PQAZYijnoICj3MIO2Qyz34X0LzM0lukucqRO9ozdvlaR8q/FGVsIMkfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838542;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ZmeARabfdEOi3PPZ96dBxEZL3vDEXEkKVWiX+j0djeU=;
	b=IH7a4KsMAgQ/BgE+W7UP2L8ud+n1OUUCkN+j9+OOkCaeNUY2Ysv+9+cw5KHiNTqHlMhz
	 67FWn8c3u29hdbuNLdsWs/Jh9PNv2J/8/b8EQF99iakF8OjmFDVSWGorPY0VX77+JE8lC
	 JHi3aMKY6LcDMIBlGPZqusJUzo+E9lB+zjS7YydOIGQViZwBKmK3ZeSxy4+ScEgOWWPJv
	 6F8oL03u9EAnCSQ8Az7XgPQQPmvi4p1SOLM3r+8thb/l4+l016hTdduN9jTaMTLLAeRWT
	 pnmazxmHIxvhireTDEbTiLr8SivQMMYI9DBw1jIQ23MVg+vzQOePc4lf8mboA8WHcXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kt9prDvC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C93606A333;
	Mon, 16 Nov 2026 14:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kt9prDvC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A975D1F000C4;
	Mon, 16 Nov 2026 14:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838542;
	bh=ZmeARabfdEOi3PPZ96dBxEZL3vDEXEkKVWiX+j0djeU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kt9prDvC44VP1oUFIDE4JpL9BgjoE8yIWeNGcFt/B/vW7tWe/BCnGBmam4G3Un0uF
	 GNWmMsWIb/+jFfNZsIW1TA90zRXybFjNXQv8zUBPF+Z3mC9JlDXKhEw9Arf08lMEqz
	 nY128Vl16TLOaGIxK67a9fiV44DrUDCsnXYR9viVPXqXDTXSinZJqhPO0LzRdkWkMr
	 Z8nTSLxopkA76nrw8aXH3OIKHSNTV5bbi6wYSJnEnCFE6R/MeAjUms8Y3jfSvkeIr7
	 b6rOZyOL0LZ5NVK9BrcLsEE9RX72Kj/q9S3KvGFRZE++3t8XPiWaNmIwJbFcuJf9X5
	 bzcUiJJGCBQMQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/8] arm64: dts: synaptics: Add SL2610 Ethernet nodes
Date: Mon, 16 Nov 2026 21:54:41 +0800
Message-ID: <20261116135442.4827-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116135442.4827-1-jszhang@kernel.org>
References: <20261116135442.4827-1-jszhang@kernel.org>
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

Add the first DWMAC controller in the common SL2611 dtsi, then add
the second controller for SL2619, including interrupts, clocks, PHY
interface control offsets, queues and AXI burst configuration.

Add the shared MDIO master selector as an mmio-mux child of the global
system controller. Leave the MACs and selector disabled for boards to
enable according to their wiring.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/boot/dts/synaptics/sl2611.dtsi | 41 +++++++++++++++++++++++
 arch/arm64/boot/dts/synaptics/sl2619.dtsi | 36 ++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/synaptics/sl2611.dtsi b/arch/arm64/boot/dts/synaptics/sl2611.dtsi
index 663fe6034ba0..f6e2ce21ed19 100644
--- a/arch/arm64/boot/dts/synaptics/sl2611.dtsi
+++ b/arch/arm64/boot/dts/synaptics/sl2611.dtsi
@@ -281,12 +281,53 @@ aioclk: aviogbl: syscon@f7490000 {
 			clocks = <&osc>;
 		};
 
+		ethernet0: ethernet@f7a04000 {
+			compatible = "syna,sl2610-dwmac", "snps,dwmac-5.20";
+			reg = <0xf7a04000 0x2000>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk CLK_GETHRGMII>,
+				 <&clk CLK_GETHRGMIISYS>, <&clk CLK_GE0_PTP_REF>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref";
+			snps,axi-config = <&stmmac_axi_config_0>;
+			snps,mixed-burst;
+			snps,mtl-rx-config = <&mtl_rx_setup_0>;
+			snps,mtl-tx-config = <&mtl_tx_setup_0>;
+			snps,pbl = <32>;
+			syna,syscon = <&chip 0xa18>;
+			status = "disabled";
+
+			mtl_rx_setup_0: rx-queues-config {
+				snps,rx-queues-to-use = <1>;
+				queue0 {};
+			};
+
+			mtl_tx_setup_0: tx-queues-config {
+				snps,tx-queues-to-use = <2>;
+				queue0 {};
+				queue1 {};
+			};
+
+			stmmac_axi_config_0: stmmac-axi-config {
+				snps,blen = <256 128 64 32 0 0 0>;
+				snps,rd_osr_lmt = <0x7>;
+				snps,wr_osr_lmt = <0x7>;
+			};
+		};
+
 		clk: pinctrl: rst: chip: syscon@f7e10000 {
 			compatible = "syna,sl2610-soc-syscon", "syscon";
 			reg = <0xf7e10000 0x10000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			clocks = <&osc>;
+
+			mux1: mux-controller {
+				compatible = "mmio-mux";
+				#mux-control-cells = <1>;
+				mux-reg-masks = <0xa04 0x10>;
+				status = "disabled";
+			};
 		};
 
 		cpuclk: cpu_wrap: syscon@f7e30000 {
diff --git a/arch/arm64/boot/dts/synaptics/sl2619.dtsi b/arch/arm64/boot/dts/synaptics/sl2619.dtsi
index 96bd58bbed3e..57933a9aba28 100644
--- a/arch/arm64/boot/dts/synaptics/sl2619.dtsi
+++ b/arch/arm64/boot/dts/synaptics/sl2619.dtsi
@@ -41,4 +41,40 @@ pmu {
 		interrupt-affinity = <&cpu0>,
 				     <&cpu1>;
 	};
+
+	soc {
+		ethernet1: ethernet@f7a06000 {
+			compatible = "syna,sl2610-dwmac", "snps,dwmac-5.20";
+			reg = <0xf7a06000 0x2000>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk CLK_GETHRGMII1>,
+				 <&clk CLK_GETHRGMII1SYS>, <&clk CLK_GE1_PTP_REF>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref";
+			snps,axi-config = <&stmmac_axi_config_1>;
+			snps,mixed-burst;
+			snps,mtl-rx-config = <&mtl_rx_setup_1>;
+			snps,mtl-tx-config = <&mtl_tx_setup_1>;
+			snps,pbl = <32>;
+			syna,syscon = <&chip 0xa3c>;
+			status = "disabled";
+
+			mtl_rx_setup_1: rx-queues-config {
+				snps,rx-queues-to-use = <1>;
+				queue0 {};
+			};
+
+			mtl_tx_setup_1: tx-queues-config {
+				snps,tx-queues-to-use = <2>;
+				queue0 {};
+				queue1 {};
+			};
+
+			stmmac_axi_config_1: stmmac-axi-config {
+				snps,blen = <256 128 64 32 0 0 0>;
+				snps,rd_osr_lmt = <0x7>;
+				snps,wr_osr_lmt = <0x7>;
+			};
+		};
+	};
 };
-- 
2.55.0

