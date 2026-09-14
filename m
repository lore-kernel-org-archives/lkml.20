Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E15740B6F9;
	Mon, 14 Sep 2026 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375250; cv=none; b=cYyRh6yrJSHoQCoJQ/FzXXxm30Ou/DfWmZABLvDY78FrqgC2HwKWmPpCo/cw66PfzQAhd4tGbD8twmusbYIcB8ck6TfH1C1OMg0n81JAAHgZQGhQ817jBwiBXW5oX72CmGXwnSfh1hREnrSGBp8cbYTgyBZ9mTBtVnJnzgcjsOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375250; c=relaxed/simple;
	bh=18r0XAqCJ76s2RuqFl+4tNlTHR+ejQrbrrCAq03SSGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JEIj4nlGi40uEdeSpVjil8NOLuNhp7r08X234oVvbrG8J7emaXCBakgkWazvwdlS1adxSmL5ZJZKduIwFSmk0ySxmB+b8dEeMsracTxMpvVM7YSbizmkRuS7cRARkyG5aKPyKkTHlFMZ912obnornTW0FYBgh2G6Q2WNx9TV9DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=VqBH3Qgx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nQ06R7zN; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="VqBH3Qgx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nQ06R7zN"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 024A814000C1;
	Mon, 14 Sep 2026 04:40:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 14 Sep 2026 04:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789375240;
	 x=1789461640; bh=L7XzflKdxKasy8LcjU5EE9H6OtqvXg66LF/gVw5nJ3E=; b=
	VqBH3QgxgAsFepybzLzvEb8qoE5AS1yX5HDataVKqsJSSzlPUnGCdQ1wuxPHD2Vg
	9jbtI2xha0sGnJQGmLO4uyWmt3qEAxHP7cJiB49lT7lWoBWo5fBrCbyxZGYoIM6C
	bof6g2nqVq/QG1RwxRW7D2Y4OxIjhDFY/+fCL0yfe8Dnwi+KaYM/71ATC6MIFZz2
	ugIDxf8n7NJkGMXvpkMnK0DGf6KM5yrK+pDdiICEVDu7NOTs7Ax+hF4PZeSgZWAq
	62El/C91qfvZMDjYW/3r1CRv9kzXEkfaD/1/WK8uoPfgLU4gnSfhWV3Ow63JZlTn
	GWiSASuiP2l7Irym1n1Raw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789375240; x=
	1789461640; bh=L7XzflKdxKasy8LcjU5EE9H6OtqvXg66LF/gVw5nJ3E=; b=n
	Q06R7zNB9Wj8kWb7kLmZ9d0uqxrVZv5RROsnKu0x2YNkU1X4I2MJCJQg1ugF3cQU
	8l7/O/JlxZWIdbmK22ZD3W8Twte7nxDr055yn3+C0URWw7zt30CuNnp8IVI7GLnN
	Rf2IQl6CWY8+JCKVyNRJ8d0wdneBSR/Zr/30F0mc6gOlacTbsJXC6j8c5MsV2U26
	KhNwml8fDYDWz284NQpIhm6MK051Zs1/cRnFTJBR7zGNbNlwz7cIYz3EdkvQTZCl
	wgU2h3ho8n8HQHT1U/gKpzSPheHavSL6t68MciDC57CKtD2sfL0+m3vobppp0nLF
	hQawKIx4wy50QVK/xt4sQ==
X-ME-Sender: <xms:CLOnaltfpAy7B86PXtqJ4qYEuSbQxUsIz84lwqOmWMfkx7XlZLApkQ>
    <xme:CLOnamps_qPqKPabNTJdLTFhb56JVs8Kipmo28HaYAWGWwHcQB5cKjZccTyedshT9
    InjuhKmFiTt-98QVSwzn3lOSrsqtEB3BplEqesPsD-ig1Cej5l-PadL>
X-ME-Received: <xmr:CLOnakUn7s-yOx2D3c34SeX883IrNLqQU-OmEwsSdZvKY1CX6Smzho18oTk4H_DBJ6kWerqzh73sABQ23gxoxBt2-tFGiyf0rKm8bQ>
X-ME-Proxy-Cause: dmFkZTE4K6JMrxd6sPzZVNrePGCzWSArxKGqIFy2UwUC7nS/ZY+sStdcZ7vmPmE2pNoHZC
    9MiqcQ5OXckdWGFiy01IJr2JkZ+n3p+fcnek7D1Qwk8LgHRtAPwJ3G0I5cz7ZhSuemTIJc
    i9Rs6SyTtRrS0p1PgXmcVZpifTNEIm8RuZjsFaFCWemyhP462rhvuOdftkbms6ekvvuLIV
    6HeACEZ35ia1OWZxWsqljJDvRhxvUU8yfY+GnRLK37wYdoIiqubcn305EIee0gH5ypsRyC
    0b6zJacisih6eDtoNCnZwnv1woWj2R2DHm/YruUPQexvu5t1hokHp9I+EwChY3zqidyUBq
    u0GD95jRcDW6FTgoDbIdMcKs3+RGgLBSzxy9oYYM9yuORvx0Vryp6LdrHdxt6XhDJWrK2v
    d9UJO0vX4c4FkEH9F9BxddkUnFxXRtNPfK758L/+qTNhSekQ01dKMGfhtC3Ug8/U/iAZP+
    SrAccdXTqNn5UEBLGDcBxqvl4b9APqrAw+5RQumh5Jpv9VnZfJn2eTtVEK49zsQnW2Flwu
    /ly4zJJpRGIjy2H+3E3JefOlLhkp/SAh3IPNTUU5hA0NvuRZxgjhdEFxTyOA1v8iQ4B7pK
    tYVpIyVoAST0iihUsuQPD7xC7qRxPYI6qLB+A5satWddhtTCZTqgVJo7qViA
X-ME-Proxy: <xmx:CLOnam08w-vCEu02hwmd4FKpRmhHGzyRjLuWWV5tcArbBzTzMIAW0Q>
    <xmx:CLOnahvsNPwsrmK4MtadD9aGTcJG_dCsgmzdB0QZAzHJ2cQzNGy_uQ>
    <xmx:CLOnamWccfgd0WqKpQ6dXDcoOGxRJZjpzCOwyeoyrUZQsxPDgNo7kQ>
    <xmx:CLOnahxwyW1Gu_AH_qGMWFQiVU7vteHHwyMlgrAijl49eup6S4F-sw>
    <xmx:CLOnaivytcuE2_Hphd5WqQlp_rEgQm0Tfgn9wkN7LTrPyQI2qYGXXuRC>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:40:40 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 14 Sep 2026 10:40:31 +0200
Subject: [PATCH v2 01/13] arm64: dts: apple: t603x: Fix all blank line
 dt-check-style issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-1-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10244; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=18r0XAqCJ76s2RuqFl+4tNlTHR+ejQrbrrCAq03SSGY=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm5mOrZe7UCiUdmBn9lUuTv+WnIbf7ncOGC6ZpD0j1
 9Z22zq/jlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABO5fZaRYZ7hp6lZZ1aysily
 6bD9VlvKu1l1CtOiY42h4j9WnF1T4MPIcOtooh1z+PT+uXt13+Qsda/YINUY9GGR5OkLKXOe5Ey
 N4QAA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Fixes dt-check-style 'blank-lines' and 'required-blank-lines' issues
reported in strict mode.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6030-pmgr.dtsi      |  1 -
 arch/arm64/boot/dts/apple/t6030.dtsi           | 18 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t6031-base.dtsi      | 13 +++++++++++++
 arch/arm64/boot/dts/apple/t6031-die0.dtsi      | 10 ++++++++++
 arch/arm64/boot/dts/apple/t6031-pmgr.dtsi      |  6 ++++++
 arch/arm64/boot/dts/apple/t6032-j575d.dts      |  3 ++-
 arch/arm64/boot/dts/apple/t6032.dtsi           | 13 +++++++++++++
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi |  4 +++-
 8 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6030-pmgr.dtsi b/arch/arm64/boot/dts/apple/t6030-pmgr.dtsi
index 932388ea13c9..b890d622566e 100644
--- a/arch/arm64/boot/dts/apple/t6030-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030-pmgr.dtsi
@@ -1434,4 +1434,3 @@ ps_atc3_usb: power-controller@f0 {
 		power-domains = <&ps_atc3_usb_aon>, <&ps_atc3_common>;
 	};
 };
-
diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index 5ff12edfc553..0bfa8db59db4 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
@@ -24,18 +24,23 @@ cluster0 {
 				core0 {
 					cpu = <&cpu_e00>;
 				};
+
 				core1 {
 					cpu = <&cpu_e01>;
 				};
+
 				core2 {
 					cpu = <&cpu_e02>;
 				};
+
 				core3 {
 					cpu = <&cpu_e03>;
 				};
+
 				core4 {
 					cpu = <&cpu_e04>;
 				};
+
 				core5 {
 					cpu = <&cpu_e05>;
 				};
@@ -45,18 +50,23 @@ cluster1 {
 				core0 {
 					cpu = <&cpu_p00>;
 				};
+
 				core1 {
 					cpu = <&cpu_p01>;
 				};
+
 				core2 {
 					cpu = <&cpu_p02>;
 				};
+
 				core3 {
 					cpu = <&cpu_p03>;
 				};
+
 				core4 {
 					cpu = <&cpu_p04>;
 				};
+
 				core5 {
 					cpu = <&cpu_p05>;
 				};
@@ -254,6 +264,7 @@ i2c1: i2c@289014000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c1>;
+
 			status = "disabled";
 		};
 
@@ -268,6 +279,7 @@ i2c2: i2c@289018000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c2>;
+
 			status = "disabled";
 		};
 
@@ -282,6 +294,7 @@ i2c3: i2c@28901c000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c3>;
+
 			status = "disabled";
 		};
 
@@ -296,6 +309,7 @@ i2c4: i2c@289020000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c4>;
+
 			status = "disabled";
 		};
 
@@ -310,6 +324,7 @@ i2c6: i2c@289028000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c6>;
+
 			status = "disabled";
 		};
 
@@ -324,6 +339,7 @@ i2c8: i2c@289030000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c8>;
+
 			status = "disabled";
 		};
 
@@ -333,6 +349,7 @@ fpwm0: pwm@289040000 {
 			power-domains = <&ps_fpwm0>;
 			clocks = <&clkref>;
 			#pwm-cells = <2>;
+
 			status = "disabled";
 		};
 
@@ -349,6 +366,7 @@ serial0: serial@289200000 {
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
 			power-domains = <&ps_uart0>;
+
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/apple/t6031-base.dtsi b/arch/arm64/boot/dts/apple/t6031-base.dtsi
index 74e1fa51242d..6df3be68d740 100644
--- a/arch/arm64/boot/dts/apple/t6031-base.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-base.dtsi
@@ -20,12 +20,15 @@ cluster0 {
 				core0 {
 					cpu = <&cpu_e00>;
 				};
+
 				core1 {
 					cpu = <&cpu_e01>;
 				};
+
 				core2 {
 					cpu = <&cpu_e02>;
 				};
+
 				core3 {
 					cpu = <&cpu_e03>;
 				};
@@ -35,18 +38,23 @@ cluster1 {
 				core0 {
 					cpu = <&cpu_p00>;
 				};
+
 				core1 {
 					cpu = <&cpu_p01>;
 				};
+
 				core2 {
 					cpu = <&cpu_p02>;
 				};
+
 				core3 {
 					cpu = <&cpu_p03>;
 				};
+
 				core4 {
 					cpu = <&cpu_p04>;
 				};
+
 				core5 {
 					cpu = <&cpu_p05>;
 				};
@@ -56,18 +64,23 @@ cluster2 {
 				core0 {
 					cpu = <&cpu_p10>;
 				};
+
 				core1 {
 					cpu = <&cpu_p11>;
 				};
+
 				core2 {
 					cpu = <&cpu_p12>;
 				};
+
 				core3 {
 					cpu = <&cpu_p13>;
 				};
+
 				core4 {
 					cpu = <&cpu_p14>;
 				};
+
 				core5 {
 					cpu = <&cpu_p15>;
 				};
diff --git a/arch/arm64/boot/dts/apple/t6031-die0.dtsi b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
index cffab6b51d12..932c97579f99 100644
--- a/arch/arm64/boot/dts/apple/t6031-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
@@ -71,6 +71,7 @@ i2c1: i2c@391014000 {
 		power-domains = <&ps_i2c1>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -85,6 +86,7 @@ i2c2: i2c@391018000 {
 		power-domains = <&ps_i2c2>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -99,6 +101,7 @@ i2c3: i2c@39101c000 {
 		power-domains = <&ps_i2c3>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -113,6 +116,7 @@ i2c4: i2c@391020000 {
 		power-domains = <&ps_i2c4>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -127,6 +131,7 @@ i2c5: i2c@391024000 {
 		power-domains = <&ps_i2c5>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -141,6 +146,7 @@ i2c6: i2c@391028000 {
 		power-domains = <&ps_i2c6>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -155,6 +161,7 @@ i2c7: i2c@39102c000 {
 		power-domains = <&ps_i2c7>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -169,6 +176,7 @@ i2c8: i2c@391030000 {
 		power-domains = <&ps_i2c8>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -178,6 +186,7 @@ fpwm0: pwm@391040000 {
 		power-domains = <&ps_fpwm0>;
 		clocks = <&clkref>;
 		#pwm-cells = <2>;
+
 		status = "disabled";
 	};
 
@@ -194,6 +203,7 @@ serial0: serial@391200000 {
 		clocks = <&clkref>, <&clkref>;
 		clock-names = "uart", "clk_uart_baud0";
 		power-domains = <&ps_uart0>;
+
 		status = "disabled";
 	};
 };
diff --git a/arch/arm64/boot/dts/apple/t6031-pmgr.dtsi b/arch/arm64/boot/dts/apple/t6031-pmgr.dtsi
index f80ee5f7ebcf..721ab2e9fd4b 100644
--- a/arch/arm64/boot/dts/apple/t6031-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-pmgr.dtsi
@@ -1383,6 +1383,7 @@ DIE_NODE(ps_afi_d2d_0): power-controller@2d0 {
 		#reset-cells = <0>;
 		label = DIE_LABEL(afi_d2d_0);
 		apple,always-on;
+
 		status = "disabled";
 	};
 
@@ -1393,6 +1394,7 @@ DIE_NODE(ps_afi_d2d_1): power-controller@2e0 {
 		#reset-cells = <0>;
 		label = DIE_LABEL(afi_d2d_1);
 		apple,always-on;
+
 		status = "disabled";
 	};
 
@@ -1403,6 +1405,7 @@ DIE_NODE(ps_afc_d2d_0): power-controller@2f0 {
 		#reset-cells = <0>;
 		label = DIE_LABEL(afc_d2d_0);
 		apple,always-on;
+
 		status = "disabled";
 	};
 
@@ -1413,6 +1416,7 @@ DIE_NODE(ps_afc_d2d_1): power-controller@300 {
 		#reset-cells = <0>;
 		label = DIE_LABEL(afc_d2d_1);
 		apple,always-on;
+
 		status = "disabled";
 	};
 
@@ -1423,6 +1427,7 @@ DIE_NODE(ps_afr_d2d_0): power-controller@310 {
 		#reset-cells = <0>;
 		label = DIE_LABEL(afr_d2d_0);
 		apple,always-on;
+
 		status = "disabled";
 	};
 
@@ -1433,6 +1438,7 @@ DIE_NODE(ps_afr_d2d_1): power-controller@320 {
 		#reset-cells = <0>;
 		label = DIE_LABEL(afr_d2d_1);
 		apple,always-on;
+
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/apple/t6032-j575d.dts b/arch/arm64/boot/dts/apple/t6032-j575d.dts
index 56edfb1139fb..71f4a00e1b1c 100644
--- a/arch/arm64/boot/dts/apple/t6032-j575d.dts
+++ b/arch/arm64/boot/dts/apple/t6032-j575d.dts
@@ -30,8 +30,9 @@ framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */
-			status = "disabled";
 			power-domains = <&ps_dispext0_cpu>;
+
+			status = "disabled";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/apple/t6032.dtsi b/arch/arm64/boot/dts/apple/t6032.dtsi
index 0a966370cc82..aa48f2483fbb 100644
--- a/arch/arm64/boot/dts/apple/t6032.dtsi
+++ b/arch/arm64/boot/dts/apple/t6032.dtsi
@@ -33,12 +33,15 @@ cluster3 {
 				core0 {
 					cpu = <&cpu_e10>;
 				};
+
 				core1 {
 					cpu = <&cpu_e11>;
 				};
+
 				core2 {
 					cpu = <&cpu_e12>;
 				};
+
 				core3 {
 					cpu = <&cpu_e13>;
 				};
@@ -48,18 +51,23 @@ cluster4 {
 				core0 {
 					cpu = <&cpu_p20>;
 				};
+
 				core1 {
 					cpu = <&cpu_p21>;
 				};
+
 				core2 {
 					cpu = <&cpu_p22>;
 				};
+
 				core3 {
 					cpu = <&cpu_p23>;
 				};
+
 				core4 {
 					cpu = <&cpu_p24>;
 				};
+
 				core5 {
 					cpu = <&cpu_p25>;
 				};
@@ -69,18 +77,23 @@ cluster5 {
 				core0 {
 					cpu = <&cpu_p30>;
 				};
+
 				core1 {
 					cpu = <&cpu_p31>;
 				};
+
 				core2 {
 					cpu = <&cpu_p32>;
 				};
+
 				core3 {
 					cpu = <&cpu_p33>;
 				};
+
 				core4 {
 					cpu = <&cpu_p34>;
 				};
+
 				core5 {
 					cpu = <&cpu_p35>;
 				};
diff --git a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
index 517b84c183ca..3ac8a2f0723b 100644
--- a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
+++ b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
@@ -35,8 +35,9 @@ framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */
-			status = "disabled";
 			power-domains = <&ps_disp_fe>;
+
+			status = "disabled";
 		};
 	};
 
@@ -47,6 +48,7 @@ memory@10000000000 {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm0 0 40000>;
 			function = LED_FUNCTION_KBD_BACKLIGHT;

-- 
2.55.0

