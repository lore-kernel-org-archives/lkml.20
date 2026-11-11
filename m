Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426037;
	b=Q6AP4bvii2IXtiW+mbhSyNStFOg14YL9bndwmrlntMDPbKHWUkz7l7muQWMWQpr2qkbw
	 YB2Y2b+2nkPFLv1dr0OcdNQFnTX25oNEdF6D8leVSsVT+eOzlEg0hph0PJWRRKITSs7uB
	 6SJCVv86EQQwHccLkSrDQbkw1DVIzrRkdU9unGyBrtfrAa0UZs7wL1Awp0pT870ljlLGK
	 AZusKSONSiqWjiVdwyYzbt0XMFtNX5vUg0S/8CHGA2ExXe4TZudaQtGrY+8ckoxbtzpM2
	 +CC3f65aHBjBpeIrpjcotk16zvIwJSQCjUZQ7Jrzz0lKMHM/ZCWGhprL6FVoOw5L0SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426037;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=hDdzGyyUm8Hc15zcIjN0Non0VUWJmRzS3/4uJqPKrXo=;
	b=csGNXHgraOTiP+4e4ghp5YlvvUVGBaIdNzzUHN9NJeF/8FE7edFUsVyoMm2ASTAl+p+h
	 j+p8T8XL/w3RtCEarCT8AbJuD/I1bHSoKEpb6aQ2B94CDQC2986fyFa6W49JVh4JBFA3n
	 htQ5H7Wv56dpQjuuSRQgNM7d441o2wwWqJndv/VaOHDy02nizrZXWAOiqsZU8n55sJO8u
	 brm7wELKsDIIqm/FRxLNx+jScs4vIHpoS8av/eiR7MAlEkFTHrNpTIaEvYSj3w4D490sS
	 icRVYDD9ZwJwIWV5X7NMRGwvngzuG9FGC6gQPH+2HMN1PRQI6G3Nj8nvarfB13KQfYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLDqJjZj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5705260A6F47;
	Wed, 11 Nov 2026 19:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLDqJjZj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBDB1F00A07;
	Wed, 11 Nov 2026 19:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426037;
	bh=hDdzGyyUm8Hc15zcIjN0Non0VUWJmRzS3/4uJqPKrXo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iLDqJjZjyhX5HyCtluNW82kEvHx0OhEkl9ImfgZJk3PsMkBXxmJiZW1wErryldws2
	 4DG/91DMYsVCLuVMJK9xhtXrlQUI2a4ErOB7nd3KBJmGOcOd0BMZp3PetRlYwlhjNZ
	 0LzDBiUUHTL4nKFS/s9Gkm2i5wPhIXOnDHWTjTqsUEQhwdmHhHV84fql+aJQa10rx6
	 B29ShsLEukuXxcvJPKNN11MOfs+dnJitQp+5ZGGAyb1jtoIbvO5sZ8gA2JP63RaVdQ
	 2/pftyhYVmipWR08GuhUsqMeJEGDVfRf2rqKrvyDPj1CYfGmCosOz/rq7w2eK1+pQ0
	 24b40AYtQTZNw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:18 -0600
Subject: [PATCH 08/12] arm64: dts: hisilicon: Move non-MMIO nodes out of
 simple-bus nodes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-hisi-v1-8-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Move non-MMIO provider nodes out of the soc simple-bus nodes.
This includes HiKey GPIO range helpers, Hi3660 and Hi3670
reset controllers, Hi3660 and Hi6220 thermal zones, Hi6220
stub clock and USB PHY providers, and static CoreSight funnel
and replicator graph helpers.

These nodes do not have register ranges of their own, so they
don't belong under an MMIO "simple-bus".

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 138 ++++++++++-----------
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          | 117 ++++++++---------
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi          |  26 ++--
 .../arm64/boot/dts/hisilicon/hi6220-coresight.dtsi |  69 +++++------
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          | 110 ++++++++--------
 .../arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi |  10 +-
 .../arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi |   8 +-
 7 files changed, 236 insertions(+), 242 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
index 4c6a075908d1..7862a03c3094 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
@@ -9,6 +9,73 @@
  *
  */
 / {
+	/* An invisible combo funnel between clusters and top funnel */
+	funnel {
+		compatible = "arm,coresight-static-funnel";
+		clocks = <&crg_ctrl HI3660_PCLK>;
+		clock-names = "apb_pclk";
+
+		out-ports {
+			port {
+				combo_funnel_out: endpoint {
+					remote-endpoint = <&top_funnel_in>;
+				};
+			};
+		};
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				combo_funnel_in0: endpoint {
+					remote-endpoint = <&cluster0_etf_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				combo_funnel_in1: endpoint {
+					remote-endpoint = <&cluster1_etf_out>;
+				};
+			};
+		};
+	};
+
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+		clocks = <&crg_ctrl HI3660_PCLK>;
+		clock-names = "apb_pclk";
+
+		in-ports {
+			port {
+				replicator_in: endpoint {
+					remote-endpoint = <&top_etf_out>;
+				};
+			};
+		};
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				replicator0_out0: endpoint {
+					remote-endpoint = <&etr_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				replicator0_out1: endpoint {
+					remote-endpoint = <&tpiu_in>;
+				};
+			};
+		};
+	};
+
 	soc {
 		/* A53 cluster internals */
 		etm@ecc40000 {
@@ -303,43 +370,6 @@ cluster1_etf_out: endpoint {
 			};
 		};
 
-		/* An invisible combo funnel between clusters and top funnel */
-		funnel {
-			compatible = "arm,coresight-static-funnel";
-			clocks = <&crg_ctrl HI3660_PCLK>;
-			clock-names = "apb_pclk";
-
-			out-ports {
-				port {
-					combo_funnel_out: endpoint {
-						remote-endpoint =
-							<&top_funnel_in>;
-					};
-				};
-			};
-
-			in-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					combo_funnel_in0: endpoint {
-						remote-endpoint =
-							<&cluster0_etf_out>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					combo_funnel_in1: endpoint {
-						remote-endpoint =
-							<&cluster1_etf_out>;
-					};
-				};
-			};
-		};
-
 		/* Top internals */
 		funnel@ec031000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
@@ -395,40 +425,6 @@ top_etf_out: endpoint {
 			};
 		};
 
-		replicator {
-			compatible = "arm,coresight-static-replicator";
-			clocks = <&crg_ctrl HI3660_PCLK>;
-			clock-names = "apb_pclk";
-
-			in-ports {
-				port {
-					replicator_in: endpoint {
-						remote-endpoint =
-							<&top_etf_out>;
-					};
-				};
-			};
-
-			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					replicator0_out0: endpoint {
-						remote-endpoint = <&etr_in>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					replicator0_out1: endpoint {
-						remote-endpoint = <&tpiu_in>;
-					};
-				};
-			};
-		};
-
 		etr@ec033000 {
 			compatible = "arm,coresight-tmc", "arm,primecell";
 			reg = <0 0xec033000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index 374aa173bec6..9f0b5d5b97cb 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -334,6 +334,65 @@ IRQ_TYPE_LEVEL_LOW)>,
 					  IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	crg_rst: crg_rst_controller {
+		compatible = "hisilicon,hi3660-reset";
+		#reset-cells = <2>;
+		hisi,rst-syscon = <&crg_ctrl>;
+	};
+
+	iomcu_rst: reset {
+		compatible = "hisilicon,hi3660-reset";
+		hisi,rst-syscon = <&iomcu>;
+		#reset-cells = <2>;
+	};
+
+	thermal-zones {
+		cls0: cls0-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			sustainable-power = <4500>;
+
+			/* sensor ID */
+			thermal-sensors = <&tsensor 1>;
+
+			trips {
+				threshold: trip-point0 {
+					temperature = <65000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				target: trip-point1 {
+					temperature = <75000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					contribution = <1024>;
+					cooling-device =
+						<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&target>;
+					contribution = <512>;
+					cooling-device =
+						<&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -346,13 +405,6 @@ crg_ctrl: crg_ctrl@fff35000 {
 			#clock-cells = <1>;
 		};
 
-		crg_rst: crg_rst_controller {
-			compatible = "hisilicon,hi3660-reset";
-			#reset-cells = <2>;
-			hisi,rst-syscon = <&crg_ctrl>;
-		};
-
-
 		pctrl: pctrl@e8a09000 {
 			compatible = "hisilicon,hi3660-pctrl", "syscon";
 			reg = <0x0 0xe8a09000 0x0 0x2000>;
@@ -378,12 +430,6 @@ iomcu: iomcu@ffd7e000 {
 
 		};
 
-		iomcu_rst: reset {
-			compatible = "hisilicon,hi3660-reset";
-			hisi,rst-syscon = <&iomcu>;
-			#reset-cells = <2>;
-		};
-
 		mailbox: mailbox@e896b000 {
 			compatible = "hisilicon,hi3660-mbox";
 			reg = <0x0 0xe896b000 0x0 0x1000>;
@@ -1115,51 +1161,6 @@ tsensor: tsensor@fff30000 {
 			#thermal-sensor-cells = <1>;
 		};
 
-		thermal-zones {
-
-			cls0: cls0-thermal {
-				polling-delay = <1000>;
-				polling-delay-passive = <100>;
-				sustainable-power = <4500>;
-
-				/* sensor ID */
-				thermal-sensors = <&tsensor 1>;
-
-				trips {
-					threshold: trip-point0 {
-						temperature = <65000>;
-						hysteresis = <1000>;
-						type = "passive";
-					};
-
-					target: trip-point1 {
-						temperature = <75000>;
-						hysteresis = <1000>;
-						type = "passive";
-					};
-				};
-
-				cooling-maps {
-					map0 {
-						trip = <&target>;
-						contribution = <1024>;
-						cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-					};
-					map1 {
-						trip = <&target>;
-						contribution = <512>;
-						cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-					};
-				};
-			};
-		};
-
 		usb3_otg_bc: usb3_otg_bc@ff200000 {
 			compatible = "hisilicon,hi3660-usb3-otg-bc", "syscon", "simple-mfd";
 			reg = <0x0 0xff200000 0x0 0x1000>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
index 0db1849a2878..835b6a620548 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
@@ -139,6 +139,19 @@ IRQ_TYPE_LEVEL_LOW)>,
 		clock-frequency = <1920000>;
 	};
 
+	crg_rst: crg_rst_controller {
+		compatible = "hisilicon,hi3670-reset",
+			     "hisilicon,hi3660-reset";
+		#reset-cells = <2>;
+		hisi,rst-syscon = <&crg_ctrl>;
+	};
+
+	iomcu_rst: reset {
+		compatible = "hisilicon,hi3660-reset";
+		hisi,rst-syscon = <&iomcu>;
+		#reset-cells = <2>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -151,13 +164,6 @@ crg_ctrl: crg_ctrl@fff35000 {
 			#clock-cells = <1>;
 		};
 
-		crg_rst: crg_rst_controller {
-			compatible = "hisilicon,hi3670-reset",
-				     "hisilicon,hi3660-reset";
-			#reset-cells = <2>;
-			hisi,rst-syscon = <&crg_ctrl>;
-		};
-
 		pctrl: pctrl@e8a09000 {
 			compatible = "hisilicon,hi3670-pctrl", "syscon";
 			reg = <0x0 0xe8a09000 0x0 0x1000>;
@@ -194,12 +200,6 @@ media2_crg: media2_crgctrl@e8900000 {
 			#clock-cells = <1>;
 		};
 
-		iomcu_rst: reset {
-			compatible = "hisilicon,hi3660-reset";
-			hisi,rst-syscon = <&iomcu>;
-			#reset-cells = <2>;
-		};
-
 		uart0: serial@fdf02000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x0 0xfdf02000 0x0 0x1000>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
index 3f387f4cf5e0..7d540cb040d3 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
@@ -9,6 +9,39 @@
  */
 
 / {
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+		clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+		clock-names = "apb_pclk";
+
+		in-ports {
+			port {
+				replicator_in: endpoint {
+					remote-endpoint = <&etf_out>;
+				};
+			};
+		};
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				replicator_out0: endpoint {
+					remote-endpoint = <&etr_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				replicator_out1: endpoint {
+					remote-endpoint = <&tpiu_in>;
+				};
+			};
+		};
+	};
+
 	soc {
 		funnel@f6401000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
@@ -60,42 +93,6 @@ etf_out: endpoint {
 			};
 		};
 
-		replicator {
-			compatible = "arm,coresight-static-replicator";
-			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
-			clock-names = "apb_pclk";
-
-			in-ports {
-				port {
-					replicator_in: endpoint {
-						remote-endpoint =
-							<&etf_out>;
-					};
-				};
-			};
-
-			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					replicator_out0: endpoint {
-						remote-endpoint =
-							<&etr_in>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					replicator_out1: endpoint {
-						remote-endpoint =
-							<&tpiu_in>;
-					};
-				};
-			};
-		};
-
 		etr@f6404000 {
 			compatible = "arm,coresight-tmc", "arm,primecell";
 			reg = <0 0xf6404000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 21eb268b5731..8bb74b4274a9 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -249,6 +249,61 @@ timer {
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	stub_clock: stub_clock {
+		compatible = "hisilicon,hi6220-stub-clk";
+		hisilicon,hi6220-clk-sram = <&sram>;
+		#clock-cells = <1>;
+		mbox-names = "mbox-tx";
+		mboxes = <&mailbox 1 0 11>;
+	};
+
+	usb_phy: usbphy {
+		compatible = "hisilicon,hi6220-usb-phy";
+		#phy-cells = <0>;
+		phy-supply = <&reg_5v_hub>;
+		hisilicon,peripheral-syscon = <&sys_ctrl>;
+	};
+
+	thermal-zones {
+		cls0: cls0-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			sustainable-power = <3326>;
+
+			/* sensor ID */
+			thermal-sensors = <&tsensor 2>;
+
+			trips {
+				threshold: trip-point0 {
+					temperature = <65000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				target: trip-point1 {
+					temperature = <75000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device =
+						<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -298,14 +353,6 @@ medianoc_ade: medianoc_ade@f4520000 {
 			reg = <0x0 0xf4520000 0x0 0x4000>;
 		};
 
-		stub_clock: stub_clock {
-			compatible = "hisilicon,hi6220-stub-clk";
-			hisilicon,hi6220-clk-sram = <&sram>;
-			#clock-cells = <1>;
-			mbox-names = "mbox-tx";
-			mboxes = <&mailbox 1 0 11>;
-		};
-
 		uart0: serial@f8015000 {	/* console */
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x0 0xf8015000 0x0 0x1000>;
@@ -769,13 +816,6 @@ i2c2: i2c@f7102000 {
 			status = "disabled";
 		};
 
-		usb_phy: usbphy {
-			compatible = "hisilicon,hi6220-usb-phy";
-			#phy-cells = <0>;
-			phy-supply = <&reg_5v_hub>;
-			hisilicon,peripheral-syscon = <&sys_ctrl>;
-		};
-
 		usb: usb@f72c0000 {
 			compatible = "hisilicon,hi6220-usb";
 			reg = <0x0 0xf72c0000 0x0 0x40000>;
@@ -872,46 +912,6 @@ i2s0: i2s@f7118000 {
 			#sound-dai-cells = <1>;
 		};
 
-		thermal-zones {
-
-			cls0: cls0-thermal {
-				polling-delay = <1000>;
-				polling-delay-passive = <100>;
-				sustainable-power = <3326>;
-
-				/* sensor ID */
-				thermal-sensors = <&tsensor 2>;
-
-				trips {
-					threshold: trip-point0 {
-						temperature = <65000>;
-						hysteresis = <0>;
-						type = "passive";
-					};
-
-					target: trip-point1 {
-						temperature = <75000>;
-						hysteresis = <0>;
-						type = "passive";
-					};
-				};
-
-				cooling-maps {
-					map0 {
-						trip = <&target>;
-						cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-					};
-				};
-			};
-		};
-
 		ade: ade@f4100000 {
 			compatible = "hisilicon,hi6220-ade";
 			reg = <0x0 0xf4100000 0x0 0x7800>;
diff --git a/arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi b/arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi
index b801a48041f9..dd1426c4eada 100644
--- a/arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi
@@ -7,12 +7,12 @@
 #include <dt-bindings/pinctrl/hisi.h>
 
 / {
-	soc {
-		/* [IOMG_000, IOMG_123] */
-		range: gpio-range {
-			#pinctrl-single,gpio-range-cells = <3>;
-		};
+	/* [IOMG_000, IOMG_123] */
+	range: gpio-range {
+		#pinctrl-single,gpio-range-cells = <3>;
+	};
 
+	soc {
 		pmx0: pinmux@e896c000 {
 			compatible = "pinctrl-single";
 			reg = <0x0 0xe896c000 0x0 0x1f0>;
diff --git a/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi b/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi
index 8f7bf80e6ece..cd924a091214 100644
--- a/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi
@@ -6,11 +6,11 @@
 #include <dt-bindings/pinctrl/hisi.h>
 
 / {
-	soc {
-		range: gpio-range {
-			#pinctrl-single,gpio-range-cells = <3>;
-		};
+	range: gpio-range {
+		#pinctrl-single,gpio-range-cells = <3>;
+	};
 
+	soc {
 		pmx0: pinmux@e896c000 {
 			compatible = "pinctrl-single";
 			reg = <0x0 0xe896c000 0x0 0x72c>;

-- 
2.53.0

