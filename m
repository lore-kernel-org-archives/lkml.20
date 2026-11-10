Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331316;
	b=PQwdSN7od++5ThUs/CI7kpaqadDf8csf4SlpQlqBZArTZDFH4VxZHaJ2ItWzfmq223ut
	 Fx36StaDGOBF6IDCwRXIxId1Qi8qpIK4/J3iN2/Z6hLPu5BuqMCxt4P2xjvfkd7xPxk04
	 xEehg8bi2ZK9NvHI8rSst7iPjn1PlXCJFN8Sd5usFDjJIpbW3QeCGlwS1DtB9oEaJd+ut
	 zGGXMkVJbSxvkwggbDgJBJKfdFZVkYAsRW4IxpCMhP1zIU7MCoBN3dZSqiACCCbveTAXm
	 TFwDg2On3umfpbYMoDF2KGF+7gwdSKSlrL7X3Cl5mK4KaYj9J/29um8bD3saHyzBlow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331316;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=th1SQ93PTn4zjaYRKsFKLnVzC7ZFjCtO0N4lCexiRk0=;
	b=xRlLMDMiutaP5K2oE+HtmI3QbEbf/eGKEGNj99FAgmPD6h5fR/wR3ygQwuYiXwiLY0A/
	 emqdYuhOLExba0BZGhOiYv5WCmFcxMOTpU0CcrLRsvOLtztF/xRAExDNpL/6D/0d5MJVu
	 bBYZh2g8ng6hMs/3trIalHs6wLi3BVO76EyW2zeZc3wyTBHjPc24d34hOVNAM1+O5kGzz
	 8xwlRoDwTn4QeI33CxdBHBRPSRXIBu8RAD8iga1DHN8Go6P3GxrmoeZ8xwjDDViHPp//H
	 y74YyTVZECBxXjrwZc4AxDN5dgZchNrrksza7IsQfU7e3vuTuCwoIUBsZ3c3NtajFCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95A6606A327;
	Tue, 10 Nov 2026 17:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C95A6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:9bfc:b113:5373:d0ec:2ad1] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xQpXU-001C99-2m;
	Tue, 10 Nov 2026 18:21:44 +0100
From: John Crispin <john@phrozen.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH 2/3] arm64: dts: airoha: add AN7589 SoC dtsi
Date: Tue, 10 Nov 2026 18:21:42 +0100
Message-Id: <20261110172143.296304-3-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110172143.296304-1-john@phrozen.org>
References: <20261110172143.296304-1-john@phrozen.org>
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

Add the device tree for the Airoha AN7589 SoC. It describes the four
Cortex-A73 cores, which the firmware brings up over PSCI, the GICv3, the
architected timer and the console UART.

The UART runs from a fixed 1.8432 MHz clock, so the console works
before the SCU clock controller probes. The remaining blocks follow later.

Signed-off-by: John Crispin <john@phrozen.org>
---
 arch/arm64/boot/dts/airoha/an7589.dtsi | 134 +++++++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/airoha/an7589.dtsi

diff --git a/arch/arm64/boot/dts/airoha/an7589.dtsi b/arch/arm64/boot/dts/airoha/an7589.dtsi
new file mode 100644
index 000000000000..c0153a00c88a
--- /dev/null
+++ b/arch/arm64/boot/dts/airoha/an7589.dtsi
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		atf@80000000 {
+			no-map;
+			reg = <0x0 0x80000000 0x0 0x200000>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a73";
+			reg = <0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a73";
+			reg = <0x1>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a73";
+			reg = <0x2>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a73";
+			reg = <0x3>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-size = <0x80000>;
+			cache-line-size = <64>;
+			cache-level = <2>;
+			cache-unified;
+		};
+	};
+
+	clk1843200: clock-1843200 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1843200>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gic: interrupt-controller@c000000 {
+			compatible = "arm,gic-v3";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x0 0x0c000000 0x0 0x40000>,
+			      <0x0 0x0c080000 0x0 0x200000>,
+			      <0x0 0x0c400000 0x0 0x2000>,
+			      <0x0 0x0c410000 0x0 0x1000>,
+			      <0x0 0x0c420000 0x0 0x1000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+		};
+
+		uart1: serial@1fbf0000 {
+			compatible = "ns16550";
+			reg = <0x0 0x1fbf0000 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk1843200>;
+		};
+	};
+};
-- 
2.34.1

