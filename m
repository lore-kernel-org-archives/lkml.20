Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008658;
	b=E52xGgTsJ2DoC63gXzsedhDOBmksaIscUfDvlvveF3mivByCd5K7p2tKLA/4SpLyWuNs
	 95UlbdfBJQdqlvCAdwktVzXjxwOXzZZAwKt/QzyW+2yIjgkgzsK6kIbwZK3HQPxQH2teR
	 sGSkHDEzGBEp/GUGUnBdWnd/8icQCCFxWDU0+J/8cn13OJfUShoBIqI52mKs9YAS0J0jZ
	 1g4SjFTVr5cPrrSr3kEZwwaZXO1PdhCs2QhXCdPFpodGbtAxrSKkLkSd7nH4EJwv84YPq
	 iK2TyYzRnQRfcgrfzBd2a4j1njNOt0wNRDIXILLpYPKrurM1FeFPh77ZZxpaFuvB7OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A4/6vwXIUif3dD3pS/Qgzp/66VECYeTyTVvRPkRIT1Q=;
	b=VIptQvjgJd+GChAWvng6blvg9M+J7ZMl0mMQWP6xZXgqX8Ve33Idfnr6SDqyru1qEIZ1
	 +1ds/0A+C8XJ3fyQbW1fW3iZfmZcA+mLCUC295fcgLtV15fElzZnRZ122RK8jgTiIUQef
	 IzWa77B+yOoSQmR5GPeYnHPUa3L+JKg+01B16LyQQjkj7FiHjtGjERD/tyAzUBxAhQgG5
	 l814tzwAYUbVUj+G9Lqlpmxu79djfNhKxtLdqChq3O+e76X2bbZAe0YJkLMKIwsnQCD7I
	 P8tPGNEqYb5yic8AA2YYpOL0PCfaiZUFlQ1+ig6saLwAKGGD5BmjwN/UkTOPfq0UAcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UPSAT5tJ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B55606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B55606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UPSAT5tJ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso28501535e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008656; x=1793613456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A4/6vwXIUif3dD3pS/Qgzp/66VECYeTyTVvRPkRIT1Q=;
        b=UPSAT5tJN9JWTbypqlOu2Nylb8499WIqmIfvjNNl2rjtJpLBY0Ppz2DHidZt10qotU
         bzfC487uifNEQE9ncmH7miViw0pJIQAjpUkcneNOp3xyosjEqkongUKGUdqnYb/6tr9R
         h9/6DvW2+J/PZkqhOscwl6M58ZK5t3n+XiN39xPWwHBzvF64Gon8pq2f5E9EAnfpXRP1
         HLxIHB9FpajeAFY6sd0QeHmqolB2iHkhETFBb7UVNe6xzBUS90zW0gaKL7jy+IxBGpY7
         u8ZfOvCAU3KyaUz/OAxrwKpOS7AqRvoc3wylYJe8dEjOnziDT0agP6byXhqF1veQ9w1d
         AE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008656; x=1793613456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A4/6vwXIUif3dD3pS/Qgzp/66VECYeTyTVvRPkRIT1Q=;
        b=Z3UeJl9nCYBjADmu4Ubrthyc2ZzLHn82o54gliV1A78l/Bbv1pDUdn4zSyee8hgKc6
         QQFGNJR99scEYO1MlUsQTG4wf4XRbwJ8TPuAsFWmTGnwv2adK1TtUb91cmE0gkRJBnxb
         tq3f1rx2mJjN6/InPg/IqTT/D4ykcJJNlF9XZfG5UxhcC2mGWpJ/rSksEqSQWZ7kcrq3
         Ba3EW1qYznClUaeQmVMM6tFmVWqazm1Zb3FlgrUk9eN5fMaTLid9gTHzaIBa/k6UwOXM
         ZbJBltu7mJ4eFa/aGQ3i4ddOh+3VfGGQFOPEzNiY4YI7+yLIQFPBe6264S2B6b/ZRmwu
         glHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6AZFh/98PVxvZ/RgAAW8ZxvRUqmBaN12+oK+dXLh0AFJzP75G6hjHjGA5FAbXAhbFm702w1bM5YHfL2c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHdjR7m8c6ORCDfLMx7jpV/pRFOMqxlWFGe3lqjg4bxpAb5KjR
	z/6JTzNbgtGVp9QyHbg4C/bzUVtiMg4NK5q/bqVWDU7xPwwQ/ESpbvRz
X-Gm-Gg: AYBFou19KUr2a4RoTcD5M/Z9cgkDXfJ+4m/CsD3mGXFoL1fXHCq99Y3/jJIXdWFx3xC
	Xv+6ePw71bmDSY/NjfzKSFORhu6U/YKQ183pEL/dx05jmUqyfQYQ6jFPbuoCCb37MXe4fuQiS4D
	4zA3J5AvBfLDc3yKajUipr1P3sKYWa6AucedDoTtoBKheULR+cE0zyBFryS7Y/tfgt2JkSlW1P6
	1iEyvRJFH1/u9g3iK4TFNOuA4ydYTR0qtO8810NV1wN92suyZF9W4ZJXaliVb5By9GEBjq+j26L
	NvwX5MwtT592oE5RYHRTSP7QJhYNUZp8WgCEXP5xJAL5IhVNp2ovmSqXpmWTlb57ekKZiO+xu+Z
	CfDIE/vqlykMihFmOUIeB6gZbOJHOwlnc+p2LlI5AQS8nCSpZ8Rt1KF2FKhD9BSBGi0i101kzzP
	D5HLE2NwiVDgRsHX2SMoTmvZDnE6ZoYlb7kTPJmGnxfXR0QVnBSbEAeEwMgfpG0Fc9LMX+nW2JK
	7wGZjX8KI+assEAsMYTrFLzEzh+Fi7JIHW6l8tMQKSW/N3LUxVtWzwqepi8FXd8yPBzM7I6u0iu
	NmuQv1ORJr1mTC9zxp2wjPqBgpRI26YLNFwFxiCd6zJ3512XMPOOCsGSz54Y
X-Received: by 2002:a05:600c:1987:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a35ac3a7b1mr104695045e9.2.1793008656237;
        Mon, 26 Oct 2026 02:57:36 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:35 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] arm64: dts: airoha: en7581: reorder nodes following incremental regs
Date: Mon, 26 Oct 2026 10:57:07 +0100
Message-ID: <20261026095727.31708-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Reorder nods position following incremental register. This is to tidy
things up and no additional code is added.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 246 ++++++++++++-------------
 1 file changed, 123 insertions(+), 123 deletions(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ff6908a76e8e..83b30a340950 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -173,18 +173,6 @@ spi_nand: nand@0 {
 			};
 		};
 
-		scuclk: clock-controller@1fb00000 {
-			compatible = "airoha,en7581-scu";
-			reg = <0x0 0x1fb00000 0x0 0x970>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-		};
-
-		pbus_csr: syscon@1fbe3400 {
-			compatible = "airoha,en7581-pbus-csr", "syscon";
-			reg = <0x0 0x1fbe3400 0x0 0xff>;
-		};
-
 		pciephy: phy@1fa5a000 {
 			compatible = "airoha,en7581-pcie-phy";
 			reg = <0x0 0x1fa5a000 0x0 0xfff>,
@@ -199,6 +187,129 @@ pciephy: phy@1fa5a000 {
 			#phy-cells = <0>;
 		};
 
+		rng@1faa1000 {
+			compatible = "airoha,en7581-trng";
+			reg = <0x0 0x1faa1000 0x0 0xc04>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		scuclk: clock-controller@1fb00000 {
+			compatible = "airoha,en7581-scu";
+			reg = <0x0 0x1fb00000 0x0 0x970>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		eth: ethernet@1fb50000 {
+			compatible = "airoha,en7581-eth";
+			reg = <0 0x1fb50000 0 0x2600>,
+			      <0 0x1fb54000 0 0x2000>,
+			      <0 0x1fb56000 0 0x2000>;
+			reg-names = "fe", "qdma0", "qdma1";
+
+			resets = <&scuclk EN7581_FE_RST>,
+				 <&scuclk EN7581_FE_PDMA_RST>,
+				 <&scuclk EN7581_FE_QDMA_RST>,
+				 <&scuclk EN7581_XSI_MAC_RST>,
+				 <&scuclk EN7581_DUAL_HSI0_MAC_RST>,
+				 <&scuclk EN7581_DUAL_HSI1_MAC_RST>,
+				 <&scuclk EN7581_HSI_MAC_RST>,
+				 <&scuclk EN7581_XFP_MAC_RST>;
+			reset-names = "fe", "pdma", "qdma",
+				      "xsi-mac", "hsi0-mac", "hsi1-mac",
+				      "hsi-mac", "xfp-mac";
+
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			gdm1: ethernet@1 {
+				compatible = "airoha,eth-mac";
+				reg = <1>;
+				phy-mode = "internal";
+				status = "disabled";
+
+				fixed-link {
+					speed = <10000>;
+					full-duplex;
+					pause;
+				};
+			};
+		};
+
+		pbus_csr: syscon@1fbe3400 {
+			compatible = "airoha,en7581-pbus-csr", "syscon";
+			reg = <0x0 0x1fbe3400 0x0 0xff>;
+		};
+
+		uart1: serial@1fbf0000 {
+			compatible = "ns16550";
+			reg = <0x0 0x1fbf0000 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <1843200>;
+		};
+
+		system-controller@1fbf0200 {
+			compatible = "airoha,en7581-gpio-sysctl", "syscon",
+				     "simple-mfd";
+			reg = <0x0 0x1fbf0200 0x0 0xc0>;
+
+			en7581_pinctrl: pinctrl {
+				compatible = "airoha,en7581-pinctrl";
+
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+		};
+
+		i2c0: i2c@1fbf8000 {
+			compatible = "mediatek,mt7621-i2c";
+			reg = <0x0 0x1fbf8000 0x0 0x100>;
+
+			resets = <&scuclk EN7581_I2C2_RST>;
+
+			clocks = <&clk20m>;
+			clock-frequency = <100000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2c1: i2c@1fbf8100 {
+			compatible = "mediatek,mt7621-i2c";
+			reg = <0x0 0x1fbf8100 0x0 0x100>;
+
+			resets = <&scuclk EN7581_I2C_MASTER_RST>;
+
+			clocks = <&clk20m>;
+			clock-frequency = <100000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		pcie0: pcie@1fc00000 {
 			compatible = "airoha,en7581-pcie";
 			device_type = "pci";
@@ -284,116 +395,5 @@ pcie_intc1: interrupt-controller {
 				#interrupt-cells = <1>;
 			};
 		};
-
-		uart1: serial@1fbf0000 {
-			compatible = "ns16550";
-			reg = <0x0 0x1fbf0000 0x0 0x30>;
-			reg-io-width = <4>;
-			reg-shift = <2>;
-			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
-			clock-frequency = <1843200>;
-		};
-
-		rng@1faa1000 {
-			compatible = "airoha,en7581-trng";
-			reg = <0x0 0x1faa1000 0x0 0xc04>;
-			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		system-controller@1fbf0200 {
-			compatible = "airoha,en7581-gpio-sysctl", "syscon",
-				     "simple-mfd";
-			reg = <0x0 0x1fbf0200 0x0 0xc0>;
-
-			en7581_pinctrl: pinctrl {
-				compatible = "airoha,en7581-pinctrl";
-
-				interrupt-parent = <&gic>;
-				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
-
-				gpio-controller;
-				#gpio-cells = <2>;
-
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-		};
-
-		i2c0: i2c@1fbf8000 {
-			compatible = "mediatek,mt7621-i2c";
-			reg = <0x0 0x1fbf8000 0x0 0x100>;
-
-			resets = <&scuclk EN7581_I2C2_RST>;
-
-			clocks = <&clk20m>;
-			clock-frequency = <100000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			status = "disabled";
-		};
-
-		i2c1: i2c@1fbf8100 {
-			compatible = "mediatek,mt7621-i2c";
-			reg = <0x0 0x1fbf8100 0x0 0x100>;
-
-			resets = <&scuclk EN7581_I2C_MASTER_RST>;
-
-			clocks = <&clk20m>;
-			clock-frequency = <100000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			status = "disabled";
-		};
-
-		eth: ethernet@1fb50000 {
-			compatible = "airoha,en7581-eth";
-			reg = <0 0x1fb50000 0 0x2600>,
-			      <0 0x1fb54000 0 0x2000>,
-			      <0 0x1fb56000 0 0x2000>;
-			reg-names = "fe", "qdma0", "qdma1";
-
-			resets = <&scuclk EN7581_FE_RST>,
-				 <&scuclk EN7581_FE_PDMA_RST>,
-				 <&scuclk EN7581_FE_QDMA_RST>,
-				 <&scuclk EN7581_XSI_MAC_RST>,
-				 <&scuclk EN7581_DUAL_HSI0_MAC_RST>,
-				 <&scuclk EN7581_DUAL_HSI1_MAC_RST>,
-				 <&scuclk EN7581_HSI_MAC_RST>,
-				 <&scuclk EN7581_XFP_MAC_RST>;
-			reset-names = "fe", "pdma", "qdma",
-				      "xsi-mac", "hsi0-mac", "hsi1-mac",
-				      "hsi-mac", "xfp-mac";
-
-			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
-
-			status = "disabled";
-
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			gdm1: ethernet@1 {
-				compatible = "airoha,eth-mac";
-				reg = <1>;
-				phy-mode = "internal";
-				status = "disabled";
-
-				fixed-link {
-					speed = <10000>;
-					full-duplex;
-					pause;
-				};
-			};
-		};
 	};
 };
-- 
2.55.0

