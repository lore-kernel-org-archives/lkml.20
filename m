Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793918073;
	b=JZWfMtDYokiDR6goOAwZLw2BRcOfyYlXzedvcLPikS55RisY7y+qc+/e9lA0fLTFR+fq
	 0mUhGMT39PeW1+2V3Zuc0MNnnojyMi5cv1jNF+0D2WN/ahbqAjIl0SOD7zFoOSmqv7icj
	 15mLkfKwI86BZVBy94pfGpiX0J95jsm08Wu7WWpqopCKwv8GGX0FWzwPQlOQ+yc4dNh8e
	 YEAqqJA3Kqd2Gtbn15QccbchyctPulzz7GQukK24+gEDkSeWcE4RETyJME+S0ZKLIqc55
	 F/3dpPZmHBXqO90fpvE817YWdZADRka1mBOvirRqfyu4CiszvhJkNFDO6a3zS91f3lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918073;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=jTawgzMp0MmWaSuOpbjmDGaKnknlXCCOhAXdqYeoyr4=;
	b=wD3h4ayNauEB6MUitwz/y7RCVW609Pq1QAMgcWNLi/R9nxE1HK66gAr8HHXZo+aukMFj
	 pKgAuNEx67VrXtUoBP2gkJqhhigi4z3oH/9LY+VHMc1iT0Y5Z3cbzx4sMZ8S/4z+nyAg3
	 FoBLabOrPjvJveldlhMEOwPn/BGFRZtwjWr7uePb8EBr9aoQ/SDnu3CiK3R03n/YuZZaP
	 qUR88fWSv92TnCr/5tgCqAhBBQTslHwD5CcVPZU6ewr0qyRIaTvRx2r065OpL/p3mdcAF
	 lU/+qF5NQPJZMiBqhJhA1oPmM9TWcPEbIB30J55d7UY+QLBt+MqPdVOy4931avu9o0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EjOqHEpX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326D9606A336;
	Thu,  5 Nov 2026 22:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EjOqHEpX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6826D1F0089F;
	Thu,  5 Nov 2026 22:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918072;
	bh=jTawgzMp0MmWaSuOpbjmDGaKnknlXCCOhAXdqYeoyr4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EjOqHEpXv3GWwLK6IpGaefBxfxOK/QtLU0mc2lZc/leSYc4y1HcDYtCZI8sNq5++w
	 aTHJfLq1ftvO3OkfNuS5rFxSA96WnYPxeVX15lwCd5wos404FQOM0fxs39IUvyvN6h
	 Fd0npK7MuvAc9QjVyKeol9iZXIEd0bobpLxuk4I/+n5V+pu0MpQK1ScCDHxKWVfMw7
	 WZ06mp6P48i1f2ycJ8/+5eA8xJWMl5xIHRZnbOkwps2mbmE77cq/gsd9HDzA0xNIZd
	 ecV9rmMaHHf2sbrcql8dJfJwnsoXSleSc8AmwL+RHK/ARVVqUKVZLMWSmGJzqPDjWF
	 rgYX78EXJaocQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 05 Nov 2026 16:34:17 -0600
Subject: [PATCH 4/7] ARM: dts: arm: Use standard node names
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
Message-Id: <20261105-dt-vexpress-dts-fixes-v1-4-66615c3c8ec3@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Update various node names in Arm Ltd. boards to use the standard names
and unit-address format as defined in DT schemas.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi   |  2 +-
 arch/arm/boot/dts/arm/arm-realview-eb.dtsi      |  8 ++++----
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts   |  8 ++++----
 arch/arm/boot/dts/arm/arm-realview-pb11mp.dts   |  6 +++---
 arch/arm/boot/dts/arm/arm-realview-pbx.dtsi     | 10 +++++-----
 arch/arm/boot/dts/arm/integrator.dtsi           |  2 +-
 arch/arm/boot/dts/arm/integratorap-im-pd1.dts   |  2 +-
 arch/arm/boot/dts/arm/integratorap.dts          |  2 +-
 arch/arm/boot/dts/arm/integratorcp.dts          |  4 ++--
 arch/arm/boot/dts/arm/mps2-an385.dts            |  2 +-
 arch/arm/boot/dts/arm/mps2-an399.dts            |  2 +-
 arch/arm/boot/dts/arm/mps2.dtsi                 |  4 ++--
 arch/arm/boot/dts/arm/versatile-ab.dts          | 10 +++++-----
 arch/arm/boot/dts/arm/versatile-pb.dts          |  4 ++--
 arch/arm/boot/dts/arm/vexpress-v2m.dtsi         | 14 +++++++-------
 arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts |  6 +++---
 arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts  |  6 +++---
 arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts     |  2 +-
 arch/arm/boot/dts/arm/vexpress-v2p-ca9.dts      |  2 +-
 19 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi b/arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi
index 40f7515aa068..55287a2a0654 100644
--- a/arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi
+++ b/arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi
@@ -59,7 +59,7 @@ intc_second: interrupt-controller@10040000 {
 			interrupts = <0 10 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		L2: cache-controller {
+		L2: cache-controller@1f002000 {
 			compatible = "arm,l220-cache";
 			reg = <0x1f002000 0x1000>;
 			interrupt-parent = <&intc>;
diff --git a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
index f90e28ee4cb9..9de672dbdf3a 100644
--- a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
@@ -74,7 +74,7 @@ pclk: clock-pclk {
 		clock-frequency = <0>;
 	};
 
-	flash0@40000000 {
+	flash@40000000 {
 		/* 2 * 32MiB NOR Flash memory */
 		compatible = "arm,versatile-flash", "cfi-flash";
 		reg = <0x40000000 0x04000000>;
@@ -84,7 +84,7 @@ partitions {
 		};
 	};
 
-	flash1@44000000 {
+	flash@44000000 {
 		/* 2 * 32MiB NOR Flash memory */
 		compatible = "arm,versatile-flash", "cfi-flash";
 		reg = <0x44000000 0x04000000>;
@@ -149,7 +149,7 @@ vga_con_in: endpoint {
 	};
 
 	/* These peripherals are inside the FPGA */
-	fpga {
+	fpga-bus {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "simple-bus";
@@ -290,7 +290,7 @@ aaci: aaci@10004000 {
 			clock-names = "apb_pclk";
 		};
 
-		mmc: mmcsd@10005000 {
+		mmc: mmc@10005000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			reg = <0x10005000 0x1000>;
 
diff --git a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
index 1cd095496832..c81b0ec5ffeb 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
@@ -93,7 +93,7 @@ partitions {
 		};
 	};
 
-	fpga_flash@38000000 {
+	flash@38000000 {
 		compatible = "arm,versatile-flash", "cfi-flash";
 		reg = <0x38000000 0x800000>;
 		bank-width = <4>;
@@ -108,7 +108,7 @@ partitions {
 	 * screw this up. Mark the device tree node disabled
 	 * by default.
 	 */
-	secflash@3c000000 {
+	flash@3c000000 {
 		compatible = "arm,versatile-flash", "cfi-flash";
 		reg = <0x3c000000 0x4000000>;
 		bank-width = <4>;
@@ -445,7 +445,7 @@ clcd_pads: endpoint {
 	};
 
 	/* These peripherals are inside the FPGA rather than the DevChip */
-	fpga {
+	fpga-bus {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "simple-bus";
@@ -472,7 +472,7 @@ fpga_aaci: aaci@10004000 {
 			clock-names = "apb_pclk";
 		};
 
-		fpga_mci: mmcsd@10005000 {
+		fpga_mci: mmc@10005000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			reg = <0x10005000 0x1000>;
 			interrupt-parent = <&intc_fpga1176>;
diff --git a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
index 635b09030f60..d5a6a1cacd1e 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
@@ -190,7 +190,7 @@ pclk: clock-pclk {
 		clock-frequency = <0>;
 	};
 
-	flash0@40000000 {
+	flash@40000000 {
 		/* 2 * 32MiB NOR Flash memory */
 		compatible = "arm,versatile-flash", "cfi-flash";
 		reg = <0x40000000 0x04000000>;
@@ -200,7 +200,7 @@ partitions {
 		};
 	};
 
-	flash1@44000000 {
+	flash@44000000 {
 		// 2 * 32MiB NOR Flash memory
 		compatible = "arm,versatile-flash", "cfi-flash";
 		reg = <0x44000000 0x04000000>;
@@ -437,7 +437,7 @@ aaci: aaci@10004000 {
 			clock-names = "apb_pclk";
 		};
 
-		mci: mmcsd@10005000 {
+		mci: mmc@10005000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			reg = <0x10005000 0x1000>;
 			interrupt-parent = <&intc_tc11mp>;
diff --git a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
index 366c8baefe8c..fb2bc78969fe 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
@@ -89,7 +89,7 @@ pclk: clock-pclk {
 		clock-frequency = <0>;
 	};
 
-	flash0@40000000 {
+	flash@40000000 {
 		/* 2 * 32MiB NOR Flash memory */
 		compatible = "arm,versatile-flash", "cfi-flash";
 		reg = <0x40000000 0x04000000>;
@@ -99,7 +99,7 @@ partitions {
 		};
 	};
 
-	flash1@44000000 {
+	flash@44000000 {
 		/* 2 * 32MiB NOR Flash memory */
 		compatible = "arm,versatile-flash", "cfi-flash";
 		reg = <0x44000000 0x04000000>;
@@ -475,7 +475,7 @@ sp810_syscon1: sysctl@1001a000 {
 
 
 	/* These peripherals are inside the FPGA */
-	fpga {
+	fpga-bus {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "simple-bus";
@@ -488,7 +488,7 @@ aaci: aaci@10004000 {
 			clock-names = "apb_pclk";
 		};
 
-		mmc: mmcsd@10005000 {
+		mmc: mmc@10005000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			reg = <0x10005000 0x1000>;
 
@@ -527,7 +527,7 @@ serial3: serial@1000c000 {
 	};
 
 	/* These peripherals are inside the NEC ISSP */
-	issp {
+	issp-bus {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "simple-bus";
diff --git a/arch/arm/boot/dts/arm/integrator.dtsi b/arch/arm/boot/dts/arm/integrator.dtsi
index 7f1c8ee9dd8a..6c48c974a89f 100644
--- a/arch/arm/boot/dts/arm/integrator.dtsi
+++ b/arch/arm/boot/dts/arm/integrator.dtsi
@@ -71,7 +71,7 @@ partitions {
 		};
 	};
 
-	fpga {
+	fpga-bus {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/arm/integratorap-im-pd1.dts b/arch/arm/boot/dts/arm/integratorap-im-pd1.dts
index db13e09f2fab..5ccc352650b4 100644
--- a/arch/arm/boot/dts/arm/integratorap-im-pd1.dts
+++ b/arch/arm/boot/dts/arm/integratorap-im-pd1.dts
@@ -250,7 +250,7 @@ display@1000000 {
 		memory-region = <&impd1_ram>;
 		dma-ranges;
 
-		port@0 {
+		port {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
diff --git a/arch/arm/boot/dts/arm/integratorap.dts b/arch/arm/boot/dts/arm/integratorap.dts
index 9b6a1dbaf265..639809e1466c 100644
--- a/arch/arm/boot/dts/arm/integratorap.dts
+++ b/arch/arm/boot/dts/arm/integratorap.dts
@@ -197,7 +197,7 @@ pci: pci@62000000 {
 		>;
 	};
 
-	fpga {
+	fpga-bus {
 		/*
 		 * The Integator/AP predates the idea to have magic numbers
 		 * identifying the PrimeCell in hardware, thus we have to
diff --git a/arch/arm/boot/dts/arm/integratorcp.dts b/arch/arm/boot/dts/arm/integratorcp.dts
index 8ad1a8957ace..7f02f77c739d 100644
--- a/arch/arm/boot/dts/arm/integratorcp.dts
+++ b/arch/arm/boot/dts/arm/integratorcp.dts
@@ -232,7 +232,7 @@ vga_con_in: endpoint {
 		};
 	};
 
-	fpga {
+	fpga-bus {
 		/*
 		 * These PrimeCells are at the same location and using
 		 * the same interrupts in all Integrators, but in the CP
@@ -311,7 +311,7 @@ clcd@c0000000 {
 			 * This arrangement can be clearly seen in
 			 * ARM DUI 0225D, page 3-41, figure 3-19.
 			 */
-			port@0 {
+			port {
 				clcd_pads_vga_dac: endpoint {
 					remote-endpoint = <&vga_bridge_in>;
 					arm,pl11x,tft-r0g0b0-pads = <0 8 16>;
diff --git a/arch/arm/boot/dts/arm/mps2-an385.dts b/arch/arm/boot/dts/arm/mps2-an385.dts
index aebbebfc25d1..412e1ae1d0fb 100644
--- a/arch/arm/boot/dts/arm/mps2-an385.dts
+++ b/arch/arm/boot/dts/arm/mps2-an385.dts
@@ -64,7 +64,7 @@ memory@21000000 {
 		reg = <0x21000000 0x1000000>;
 	};
 
-	smb {
+	smb-bus {
 		ethernet@0,0 {
 			compatible = "smsc,lan9220", "smsc,lan9115";
 			reg = <0 0x0 0x10000>;
diff --git a/arch/arm/boot/dts/arm/mps2-an399.dts b/arch/arm/boot/dts/arm/mps2-an399.dts
index 349abf70b2a5..522e998ac10f 100644
--- a/arch/arm/boot/dts/arm/mps2-an399.dts
+++ b/arch/arm/boot/dts/arm/mps2-an399.dts
@@ -64,7 +64,7 @@ memory@60000000 {
 		reg = <0x60000000 0x1000000>;
 	};
 
-	smb {
+	smb-bus {
 		ethernet@1,0 {
 			compatible = "smsc,lan9220", "smsc,lan9115";
 			reg = <1 0x0 0x10000>;
diff --git a/arch/arm/boot/dts/arm/mps2.dtsi b/arch/arm/boot/dts/arm/mps2.dtsi
index e240bc8aa605..bed54da4ab5c 100644
--- a/arch/arm/boot/dts/arm/mps2.dtsi
+++ b/arch/arm/boot/dts/arm/mps2.dtsi
@@ -174,7 +174,7 @@ wdt: watchdog@8000 {
 		};
 	};
 
-	fpga@40020000 {
+	fpga-bus@40020000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -210,7 +210,7 @@ led@0,1 {
 		};
 	};
 
-	smb {
+	smb-bus {
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/arm/versatile-ab.dts b/arch/arm/boot/dts/arm/versatile-ab.dts
index 635ab9268899..907c3dd2849d 100644
--- a/arch/arm/boot/dts/arm/versatile-ab.dts
+++ b/arch/arm/boot/dts/arm/versatile-ab.dts
@@ -188,7 +188,7 @@ rtc@68 {
 		};
 	};
 
-	net@10010000 {
+	ethernet@10010000 {
 		compatible = "smsc,lan91c111";
 		reg = <0x10010000 0x10000>;
 		interrupts = <25>;
@@ -199,7 +199,7 @@ lcd@10008000 {
 		reg = <0x10008000 0x1000>;
 	};
 
-	amba {
+	amba-bus {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -228,7 +228,7 @@ sic: interrupt-controller@10003000 {
 			valid-mask = <0x0760031b>;
 		};
 
-		dma@10130000 {
+		dma-controller@10130000 {
 			compatible = "arm,pl081", "arm,primecell";
 			reg = <0x10130000 0x1000>;
 			interrupts = <17>;
@@ -297,7 +297,7 @@ display@10120000 {
 			 * This arrangement can be clearly seen in
 			 * ARM DUI 0225D, page 3-41, figure 3-19.
 			 */
-			port@0 {
+			port {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -393,7 +393,7 @@ spi@101f4000 {
 			clock-names = "sspclk", "apb_pclk";
 		};
 
-		fpga {
+		fpga-bus@10000000 {
 			compatible = "arm,versatile-fpga", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm/boot/dts/arm/versatile-pb.dts b/arch/arm/boot/dts/arm/versatile-pb.dts
index fc21ce54b33a..523d1dd37c2a 100644
--- a/arch/arm/boot/dts/arm/versatile-pb.dts
+++ b/arch/arm/boot/dts/arm/versatile-pb.dts
@@ -5,7 +5,7 @@ / {
 	model = "ARM Versatile PB";
 	compatible = "arm,versatile-pb";
 
-	amba {
+	amba-bus {
 		/* The Versatile PB is using more SIC IRQ lines than the AB */
 		sic: interrupt-controller@10003000 {
 			clear-mask = <0xffffffff>;
@@ -77,7 +77,7 @@ pci@10001000 {
 					 0x0000 0 0 4 &sic 28>;
 		};
 
-		fpga {
+		fpga-bus@10000000 {
 			mmc@5000 {
 				/*
 				 * Overrides the interrupt assignment from
diff --git a/arch/arm/boot/dts/arm/vexpress-v2m.dtsi b/arch/arm/boot/dts/arm/vexpress-v2m.dtsi
index e368f04bf513..202ea7bd5dc5 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2m.dtsi
+++ b/arch/arm/boot/dts/arm/vexpress-v2m.dtsi
@@ -166,7 +166,7 @@ motherboard-bus@40000000 {
 				 <3 0 0x4c000000 0x04000000>,
 				 <7 0 0x10000000 0x00020000>;
 
-			flash@0,00000000 {
+			flash@0,0 {
 				compatible = "arm,vexpress-flash", "cfi-flash";
 				reg = <0 0x00000000 0x04000000>,
 				      <1 0x00000000 0x04000000>;
@@ -176,13 +176,13 @@ partitions {
 				};
 			};
 
-			psram@2,00000000 {
+			psram@2,0 {
 				compatible = "arm,vexpress-psram", "mtd-ram";
 				reg = <2 0x00000000 0x02000000>;
 				bank-width = <4>;
 			};
 
-			ethernet@3,02000000 {
+			ethernet@3,2000000 {
 				compatible = "smsc,lan9118", "smsc,lan9115";
 				reg = <3 0x02000000 0x10000>;
 				interrupts = <15>;
@@ -194,14 +194,14 @@ ethernet@3,02000000 {
 				vddvario-supply = <&v2m_fixed_3v3>;
 			};
 
-			usb@3,03000000 {
+			usb@3,3000000 {
 				compatible = "nxp,usb-isp1761";
 				reg = <3 0x03000000 0x20000>;
 				interrupts = <16>;
 				dr_mode = "peripheral";
 			};
 
-			iofpga@7,00000000 {
+			iofpga-bus@7,0 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <1>;
@@ -342,7 +342,7 @@ aaci@4000 {
 					clock-names = "apb_pclk";
 				};
 
-				mmci@5000 {
+				mmc@5000 {
 					compatible = "arm,pl180", "arm,primecell";
 					reg = <0x05000 0x1000>;
 					interrupts = <9>, <10>;
@@ -402,7 +402,7 @@ v2m_serial3: serial@c000 {
 					clock-names = "uartclk", "apb_pclk";
 				};
 
-				wdt@f000 {
+				watchdog@f000 {
 					compatible = "arm,sp805", "arm,primecell";
 					reg = <0x0f000 0x1000>;
 					interrupts = <0>;
diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts
index 5a91e936edef..72a65a83c7c3 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts
@@ -82,7 +82,7 @@ memory-controller@2b0a0000 {
 		clock-names = "apb_pclk";
 	};
 
-	wdt@2b060000 {
+	watchdog@2b060000 {
 		compatible = "arm,sp805", "arm,primecell";
 		status = "disabled";
 		reg = <0 0x2b060000 0 0x1000>;
@@ -112,7 +112,7 @@ memory-controller@7ffd0000 {
 		clock-names = "apb_pclk";
 	};
 
-	dma@7ffb0000 {
+	dma-controller@7ffb0000 {
 		compatible = "arm,pl330", "arm,primecell";
 		reg = <0 0x7ffb0000 0 0x1000>;
 		interrupts = <0 92 4>,
@@ -240,7 +240,7 @@ bus@8000000 {
 		ranges = <0x8000000 0 0x8000000 0x18000000>;
 	};
 
-	site2: hsb@40000000 {
+	site2: hsb-bus@40000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
index 64f87e6c12bf..7b74ba30b8a3 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
@@ -123,7 +123,7 @@ vram: vram@18000000 {
 		};
 	};
 
-	wdt@2a490000 {
+	watchdog@2a490000 {
 		compatible = "arm,sp805", "arm,primecell";
 		reg = <0 0x2a490000 0 0x1000>;
 		interrupts = <0 98 4>;
@@ -197,7 +197,7 @@ memory-controller@7ffd0000 {
 		clock-names = "apb_pclk";
 	};
 
-	dma@7ff00000 {
+	dma-controller@7ff00000 {
 		compatible = "arm,pl330", "arm,primecell";
 		reg = <0 0x7ff00000 0 0x1000>;
 		interrupts = <0 92 4>,
@@ -612,7 +612,7 @@ smb: bus@8000000 {
 		ranges = <0x8000000 0 0x8000000 0x18000000>;
 	};
 
-	site2: hsb@40000000 {
+	site2: hsb-bus@40000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
index 41a98ba33e80..c716e60a8be0 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
@@ -211,7 +211,7 @@ smb: bus@8000000 {
 		ranges = <0 0x8000000 0x18000000>;
 	};
 
-	site2: hsb@40000000 {
+	site2: hsb-bus@40000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca9.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca9.dts
index 43a5a4ab6ff0..7beb069abf49 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca9.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca9.dts
@@ -297,7 +297,7 @@ power-vd10-s3 {
 		};
 	};
 
-	site2: hsb@e0000000 {
+	site2: hsb-bus@e0000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;

-- 
2.53.0

