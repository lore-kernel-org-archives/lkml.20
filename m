Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793918070;
	b=jAYcUOVQ3SXBJtfX1076hJiHw9jKKtIh37uku4HxA6NbP8K32CGzuLTv/OKudMc5GNji
	 x9P2cBW+Le3fhdTuMRCYm0HBuaZsoHbWAeziLkm8kmInsY8iTICDEXpP7OYz4ts/Wis2U
	 NkUGNgNIaroNBtXnM3FR6l9bajTfztTCjSl30krCQ+vITwbgJQMyA9af8hP/NeN7O8hyN
	 jz+m/p5LPmirLxspqn6RfoZ+JiPC68x48NODuNsGGJwEgzoZtxmhiHMPWV/mYFuMcmWVE
	 aK8LDXeJkCc/EU1zLdywKFmA9UCcLvI6thJhiGmkxbzf7mT5vlXeTfl42yArPvt31dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918070;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=EWHc/oydTj8yhbFMBudRXnGsr/DhiNLCAm/fJ9rlB9A=;
	b=OyDlLTgypflI2vF32xWmmATm9MtVWco6gsnuRDwEUk5FT8KGbGTtzNK/IAy4Cpc2NJrx
	 EFDEWl+JvabrHXSw+4jjUyFTKyoKqrDGE6r2t4b+qob+74HMsu9oSyD/aO0GRdIYAVn8b
	 uzN8klA/Io8soHd6Uaa6gg/bYCDccjP2B3Gx5HFt+prh3KgojqQLRh7JPiogJtBtPQ/Sp
	 MNQ5F6gI+qjF3XvIpubsWs/OgEYLKSTNNPcoE7mdTmZXSUbq7mxO8Z9slNOeOaAfOchfP
	 w0C3w87tggnLjWkPX85/Bzq1DRApWk3NxVlLKtjFyojh+vCmaHssiIS5oJzpDUszeXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dbxSNSaX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F837606A31B;
	Thu,  5 Nov 2026 22:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dbxSNSaX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F441F0089F;
	Thu,  5 Nov 2026 22:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918070;
	bh=EWHc/oydTj8yhbFMBudRXnGsr/DhiNLCAm/fJ9rlB9A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dbxSNSaXSSw/Bg5dvuFyWiM828nt7uyplozqV5CAEdIKmhSNRYDnUX1egarR6saq+
	 nnmdkt1YsONwWnZKC96h6LhcxD1Y6rJw/gfuTfv7ZGcb94Fpa9CuDMg2Zwur0xfaT0
	 vtqjU0NYHdm91cR3sMTByPuS/3NVIUuRPw1EXmF8zvbvI6VZk5eXvvtdn4cSOqCtcn
	 Qnmz7mYHbx8U5i1f6textWR9iSl3fB5axzZN3+ZQUXREpLy3ra0LuLfW66hLpbMZHm
	 HhyqOCJmcXjewHg2p0M1TK+IEC2hleRzrx6LqCHH+TZneLeZruOSd4sc/vhF8R0Liq
	 F6eIdpmIdsNoA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 05 Nov 2026 16:34:15 -0600
Subject: [PATCH 2/7] ARM: dts: arm/vexpress: Move "arm,vexpress,config-bus"
 node into sysreg node
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
Message-Id: <20261105-dt-vexpress-dts-fixes-v1-2-66615c3c8ec3@kernel.org>
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

The "arm,vexpress,config-bus" is accessed via the "arm,vexpress-sysreg"
registers, so it is appropriate for it to be located there rather than
in a "simple-bus" node. Under the "simple-bus" is not appropriate given
there is no MMIO space.

Unlike the prior attempt in commit d9258898ad49 ("arm64: dts: arm:
vexpress: Move fixed devices out of bus node") which got partially
reverted, the "arm,vexpress,site" property will be correctly found in a
parent node now.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi | 146 ++++++++++++++--------------
 arch/arm/boot/dts/arm/vexpress-v2m.dtsi     | 146 ++++++++++++++--------------
 2 files changed, 146 insertions(+), 146 deletions(-)

diff --git a/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
index 248b8e492d43..e12d44269a2f 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
+++ b/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
@@ -233,6 +233,79 @@ v2m_flash_gpios: gpio@4c {
 						gpio-controller;
 						#gpio-cells = <2>;
 					};
+
+					mcc {
+						compatible = "arm,vexpress,config-bus";
+						arm,vexpress,config-bridge = <&v2m_sysreg>;
+
+						clock-controller-0 {
+							/* MCC static memory clock */
+							compatible = "arm,vexpress-osc";
+							arm,vexpress-sysreg,func = <1 0>;
+							freq-range = <25000000 60000000>;
+							#clock-cells = <0>;
+							clock-output-names = "v2m:oscclk0";
+						};
+
+						v2m_oscclk1: clock-controller-1 {
+							/* CLCD clock */
+							compatible = "arm,vexpress-osc";
+							arm,vexpress-sysreg,func = <1 1>;
+							freq-range = <23750000 65000000>;
+							#clock-cells = <0>;
+							clock-output-names = "v2m:oscclk1";
+						};
+
+						v2m_oscclk2: clock-controller-2 {
+							/* IO FPGA peripheral clock */
+							compatible = "arm,vexpress-osc";
+							arm,vexpress-sysreg,func = <1 2>;
+							freq-range = <24000000 24000000>;
+							#clock-cells = <0>;
+							clock-output-names = "v2m:oscclk2";
+						};
+
+						regulator-vio {
+							/* Logic level voltage */
+							compatible = "arm,vexpress-volt";
+							arm,vexpress-sysreg,func = <2 0>;
+							regulator-name = "VIO";
+							regulator-always-on;
+							label = "VIO";
+						};
+
+						temp-mcc {
+							/* MCC internal operating temperature */
+							compatible = "arm,vexpress-temp";
+							arm,vexpress-sysreg,func = <4 0>;
+							label = "MCC";
+						};
+
+						reset {
+							compatible = "arm,vexpress-reset";
+							arm,vexpress-sysreg,func = <5 0>;
+						};
+
+						muxfpga {
+							compatible = "arm,vexpress-muxfpga";
+							arm,vexpress-sysreg,func = <7 0>;
+						};
+
+						shutdown {
+							compatible = "arm,vexpress-shutdown";
+							arm,vexpress-sysreg,func = <8 0>;
+						};
+
+						reboot {
+							compatible = "arm,vexpress-reboot";
+							arm,vexpress-sysreg,func = <9 0>;
+						};
+
+						dvimode {
+							compatible = "arm,vexpress-dvimode";
+							arm,vexpress-sysreg,func = <11 0>;
+						};
+					};
 				};
 
 				v2m_sysctl: sysctl@20000 {
@@ -415,79 +488,6 @@ clcd_pads: endpoint {
 						};
 					};
 				};
-
-				mcc {
-					compatible = "arm,vexpress,config-bus";
-					arm,vexpress,config-bridge = <&v2m_sysreg>;
-
-					clock-controller-0 {
-						/* MCC static memory clock */
-						compatible = "arm,vexpress-osc";
-						arm,vexpress-sysreg,func = <1 0>;
-						freq-range = <25000000 60000000>;
-						#clock-cells = <0>;
-						clock-output-names = "v2m:oscclk0";
-					};
-
-					v2m_oscclk1: clock-controller-1 {
-						/* CLCD clock */
-						compatible = "arm,vexpress-osc";
-						arm,vexpress-sysreg,func = <1 1>;
-						freq-range = <23750000 65000000>;
-						#clock-cells = <0>;
-						clock-output-names = "v2m:oscclk1";
-					};
-
-					v2m_oscclk2: clock-controller-2 {
-						/* IO FPGA peripheral clock */
-						compatible = "arm,vexpress-osc";
-						arm,vexpress-sysreg,func = <1 2>;
-						freq-range = <24000000 24000000>;
-						#clock-cells = <0>;
-						clock-output-names = "v2m:oscclk2";
-					};
-
-					regulator-vio {
-						/* Logic level voltage */
-						compatible = "arm,vexpress-volt";
-						arm,vexpress-sysreg,func = <2 0>;
-						regulator-name = "VIO";
-						regulator-always-on;
-						label = "VIO";
-					};
-
-					temp-mcc {
-						/* MCC internal operating temperature */
-						compatible = "arm,vexpress-temp";
-						arm,vexpress-sysreg,func = <4 0>;
-						label = "MCC";
-					};
-
-					reset {
-						compatible = "arm,vexpress-reset";
-						arm,vexpress-sysreg,func = <5 0>;
-					};
-
-					muxfpga {
-						compatible = "arm,vexpress-muxfpga";
-						arm,vexpress-sysreg,func = <7 0>;
-					};
-
-					shutdown {
-						compatible = "arm,vexpress-shutdown";
-						arm,vexpress-sysreg,func = <8 0>;
-					};
-
-					reboot {
-						compatible = "arm,vexpress-reboot";
-						arm,vexpress-sysreg,func = <9 0>;
-					};
-
-					dvimode {
-						compatible = "arm,vexpress-dvimode";
-						arm,vexpress-sysreg,func = <11 0>;
-					};
-				};
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/arm/vexpress-v2m.dtsi b/arch/arm/boot/dts/arm/vexpress-v2m.dtsi
index be03f2a8a57a..2a8d1d6dfc7e 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2m.dtsi
+++ b/arch/arm/boot/dts/arm/vexpress-v2m.dtsi
@@ -153,6 +153,79 @@ v2m_flash_gpios: gpio@4c {
 						gpio-controller;
 						#gpio-cells = <2>;
 					};
+
+					mcc {
+						compatible = "arm,vexpress,config-bus";
+						arm,vexpress,config-bridge = <&v2m_sysreg>;
+
+						clock-controller-0 {
+							/* MCC static memory clock */
+							compatible = "arm,vexpress-osc";
+							arm,vexpress-sysreg,func = <1 0>;
+							freq-range = <25000000 60000000>;
+							#clock-cells = <0>;
+							clock-output-names = "v2m:oscclk0";
+						};
+
+						v2m_oscclk1: clock-controller-1 {
+							/* CLCD clock */
+							compatible = "arm,vexpress-osc";
+							arm,vexpress-sysreg,func = <1 1>;
+							freq-range = <23750000 65000000>;
+							#clock-cells = <0>;
+							clock-output-names = "v2m:oscclk1";
+						};
+
+						v2m_oscclk2: clock-controller-2 {
+							/* IO FPGA peripheral clock */
+							compatible = "arm,vexpress-osc";
+							arm,vexpress-sysreg,func = <1 2>;
+							freq-range = <24000000 24000000>;
+							#clock-cells = <0>;
+							clock-output-names = "v2m:oscclk2";
+						};
+
+						regulator-vio {
+							/* Logic level voltage */
+							compatible = "arm,vexpress-volt";
+							arm,vexpress-sysreg,func = <2 0>;
+							regulator-name = "VIO";
+							regulator-always-on;
+							label = "VIO";
+						};
+
+						temp-mcc {
+							/* MCC internal operating temperature */
+							compatible = "arm,vexpress-temp";
+							arm,vexpress-sysreg,func = <4 0>;
+							label = "MCC";
+						};
+
+						reset {
+							compatible = "arm,vexpress-reset";
+							arm,vexpress-sysreg,func = <5 0>;
+						};
+
+						muxfpga {
+							compatible = "arm,vexpress-muxfpga";
+							arm,vexpress-sysreg,func = <7 0>;
+						};
+
+						shutdown {
+							compatible = "arm,vexpress-shutdown";
+							arm,vexpress-sysreg,func = <8 0>;
+						};
+
+						reboot {
+							compatible = "arm,vexpress-reboot";
+							arm,vexpress-sysreg,func = <9 0>;
+						};
+
+						dvimode {
+							compatible = "arm,vexpress-dvimode";
+							arm,vexpress-sysreg,func = <11 0>;
+						};
+					};
 				};
 
 				v2m_sysctl: sysctl@1000 {
@@ -431,79 +504,6 @@ led-user8 {
 					linux,default-trigger = "cpu5";
 				};
 			};
-
-			mcc {
-				compatible = "arm,vexpress,config-bus";
-				arm,vexpress,config-bridge = <&v2m_sysreg>;
-
-				clock-controller-0 {
-					/* MCC static memory clock */
-					compatible = "arm,vexpress-osc";
-					arm,vexpress-sysreg,func = <1 0>;
-					freq-range = <25000000 60000000>;
-					#clock-cells = <0>;
-					clock-output-names = "v2m:oscclk0";
-				};
-
-				v2m_oscclk1: clock-controller-1 {
-					/* CLCD clock */
-					compatible = "arm,vexpress-osc";
-					arm,vexpress-sysreg,func = <1 1>;
-					freq-range = <23750000 65000000>;
-					#clock-cells = <0>;
-					clock-output-names = "v2m:oscclk1";
-				};
-
-				v2m_oscclk2: clock-controller-2 {
-					/* IO FPGA peripheral clock */
-					compatible = "arm,vexpress-osc";
-					arm,vexpress-sysreg,func = <1 2>;
-					freq-range = <24000000 24000000>;
-					#clock-cells = <0>;
-					clock-output-names = "v2m:oscclk2";
-				};
-
-				regulator-vio {
-					/* Logic level voltage */
-					compatible = "arm,vexpress-volt";
-					arm,vexpress-sysreg,func = <2 0>;
-					regulator-name = "VIO";
-					regulator-always-on;
-					label = "VIO";
-				};
-
-				temp-mcc {
-					/* MCC internal operating temperature */
-					compatible = "arm,vexpress-temp";
-					arm,vexpress-sysreg,func = <4 0>;
-					label = "MCC";
-				};
-
-				reset {
-					compatible = "arm,vexpress-reset";
-					arm,vexpress-sysreg,func = <5 0>;
-				};
-
-				muxfpga {
-					compatible = "arm,vexpress-muxfpga";
-					arm,vexpress-sysreg,func = <7 0>;
-				};
-
-				shutdown {
-					compatible = "arm,vexpress-shutdown";
-					arm,vexpress-sysreg,func = <8 0>;
-				};
-
-				reboot {
-					compatible = "arm,vexpress-reboot";
-					arm,vexpress-sysreg,func = <9 0>;
-				};
-
-				dvimode {
-					compatible = "arm,vexpress-dvimode";
-					arm,vexpress-sysreg,func = <11 0>;
-				};
-			};
 		};
 	};
 };

-- 
2.53.0

