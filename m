Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509700;
	b=fErjmwTxv8jLOMQIxLdpoN1PJo7wxFZulRzDEjdkY3oFOEloAEkI/YrrRIWUFhtR4j1V
	 pCMXSDN6lYAL0+aCWyeCcNPy6HRgeOZilb+ekoGtjm7Pv+B98mSUomyJ5nR6e1MYg/p9u
	 dMX1OOH+SX6dkzNttg4szNYdW4vp5dP4Z9g0TTR4KeLPCD1esWnYZTQfoeAKoOiKeoykm
	 YEn/P5r2eqtvfP+NsNWLPk3fG/nzFB6fY21hyblaqtiL0yf2du9kdifAlT3ZZViCuGwGL
	 B1vGxHnhDZshZNlEC95tW6omfYmH2tBj2vPrGzEAHJ3gs+MIhYtIHOAkxCNWAbkzSsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509700;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=AluUuisZ3syjW16EuDxwZmf9uFaKZO91pqfZXb9+SsY=;
	b=x7flA3Wnmxka0tNThmboUDGwljbdfpxhKexc0cVvNsjfYz+9a4mGm/RRBePaI1BNAgxt
	 MIb0SEvzpvEPlO/d63sNAgPwMeLadFx01+56wcYlmFMDhX3pl9KT/51AMLGVW1egnLDzH
	 DsIaVybISsUdr8NMLVew2A6M4b4CbWkG8wyKJxG/fSZOmERl3GnhgdM3F4iZN3bCzT8sz
	 9QAS+Lwd73spc0089xVh6yarGj+d/sJQe2/rxhHx3Ydohej9GhRoCKQ0eP4DpZsvoCA7Z
	 /LIOHsYRZDoUShbndXgzX5/eqjvsTTuXA1WfLOf6HK4oxdEyIxyO7OgZCdVQG8pdDfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CC8606A339;
	Thu, 12 Nov 2026 18:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45CC8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:f2fc:83ce:6656:246:c906] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRZwk-002XXn-1d;
	Thu, 12 Nov 2026 19:54:54 +0100
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
Subject: [PATCH v2 2/3] arm64: dts: airoha: add AN7589 SoC dtsi
Date: Thu, 12 Nov 2026 19:54:45 +0100
Message-Id: <20261112185446.1314808-3-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112185446.1314808-1-john@phrozen.org>
References: <20261112185446.1314808-1-john@phrozen.org>
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
Changes in v2:
- Set the size of the GICV region to 0x2000. The virtual CPU interface
  has two 4 KiB pages, with GICV_DIR in the second page.
- Order the nodes and properties as dts-coding-style.rst describes.

 arch/arm64/boot/dts/airoha/an7589.dtsi | 134 +++++++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/airoha/an7589.dtsi

diff --git a/arch/arm64/boot/dts/airoha/an7589.dtsi b/arch/arm64/boot/dts/airoha/an7589.dtsi
new file mode 100644
index 000000000000..70ced7c5a4fd
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
+	clk1843200: clock-1843200 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1843200>;
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
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		atf@80000000 {
+			reg = <0x0 0x80000000 0x0 0x200000>;
+			no-map;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		gic: interrupt-controller@c000000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x0c000000 0x0 0x40000>,
+			      <0x0 0x0c080000 0x0 0x200000>,
+			      <0x0 0x0c400000 0x0 0x2000>,
+			      <0x0 0x0c410000 0x0 0x1000>,
+			      <0x0 0x0c420000 0x0 0x2000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
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
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
-- 
2.34.1

