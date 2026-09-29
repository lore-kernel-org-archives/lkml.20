Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAB0386578
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647749; cv=none; b=aVy+Akw0O/bVVlFs3dTTHfSDkRbQw3PjXOod61Y9bVuqDKJlM9Ck0hESQY1Co/LBRdAZHoM9polfLqMBrwHpXhAkdYS0V44ZH94pEFhgeXW9TG/Aa75BfuKdIz+/FXhb3e53IXr/lJbBPoXZxJvJ1v8BfQLhl1VU2PKKfy1YdlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647749; c=relaxed/simple;
	bh=MT9Dv0b181Q1tL+GTtuQti4QTaKL8lX5+fGJu2SL7GI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uq/GyvErziZ8BXCuVx01q+6SXVHQ/PlExYAIGf9JkqRUjDItStaUGN8MZSfkjsCBJ8HfNp6XmuGKou6RIqzg5GMjU34hfp8MAvhArIukCoCBlPJos1iILrNIzIp/w8TrJt3fV8i2Vnq+goYmP9UXbOPxq6rV6LNHQscBZMleisQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1un2h3v; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1un2h3v"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso1818872b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790647748; x=1791252548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eiu/HyfS6gfk4IAm6JgNDtsAZdG+SE6Eq+y4phDFY2k=;
        b=N1un2h3vMXCPllLu8SmNI6CS4ctpelScP0sDTcM+7Mr25kk0AjJOa6NJ3VRSBILIpJ
         Fp1fQBvFo3VAbpDZjRI8IByyt1aoNcXkIFOTxheEYIC7w+1WtKpApGyo2ZJmpQCurjCg
         fbjmWJHPcpYd8/Y6xbzduJvw1hikdD2T0QaGws3PxBhHVp3ZXOx7emptPHFSJJ+/osXF
         MzBee9DmFzZlcGDsYO+UbY7AYo4eZ777gU0WRZrJW1QXU176D5rULS40Ks87rddin3I/
         7t6H0GYLH8HGUg3/R4iPHmg8R7jueg9iJyDTXEAXRSpWJtHKZnYkBoWUqZBC2Vmv3hgS
         Zrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647748; x=1791252548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Eiu/HyfS6gfk4IAm6JgNDtsAZdG+SE6Eq+y4phDFY2k=;
        b=C+OLtoIwOu8BWoBtDzpPrZblOEPq01xi1upmacs0rY2kWz9/FSmwC9oXBFZRNADuBi
         +6Bt7QO9oMLF4GSd/lK8FGT/8HOoUsWMdMPVf8Ptv2rM3kcJQgRxlrvkAU4/W5yQqx7K
         SPOJKN1ub1m4jfUr+FoGVwXnCUML2vCVufZjvcDHBZRaJqQ8N9Sls+flPP3n1aMmfSa3
         Iz/ByZgrxf0sUbctwIUjTlErH8/Fz1HRIwwV5C29cUlJ7m/3ggl5ycvlUAvdf++XXrX5
         a+y6G9r/iFhCsjhN65sIKev/pCYXNLEd36vMZl2JSB9BWdhKMgWDkSwKwItqLweighPj
         k7Xw==
X-Forwarded-Encrypted: i=1; AKwUvBwSrHspNudj72u+Jdu9XfjVkBW/r2V2XXGI3I3o0d3C4JMv51xO6d99sWQf+Dsxf3cdoaEwxAXVzKg15GU=@vger.kernel.org
X-Gm-Message-State: AFuF++kexSZmj2nLYOZuuMvQ7FQ6F8kzHEZNOk7Br3KMvYlkuz6BVNfE
	FLcRL5AaLdvNY0+V2oKqhih+7hyeX7t27Jfu7fYherXOSh1Xo2t8HYqT
X-Gm-Gg: AYBFou2KI0S0qep4xO2p4wPVVqBX1K0ks4tMWZrej/pY6Z4sUXhgoAhplWwLzwDhztI
	D+h3NIU8Y7Y8Dke2w9bToqJH7BJxbBEkAKDdxYjsz4vLwJmdQwE8Q1Imu0w6eAW7BE11ZUyWo45
	Ogl9oAhDl9h2/11JS8tS5mFHvSsugsIy8KJRw0hCHMhCV06+07GdJgG5y5QR432hqdC7BjCCR5a
	1LjNYcb6yWeKRD8DaHCljTyckEesiPqzQbYaFz8L6q+tSygC4wvVB+p9AFXT403m03R7tj+T4tF
	Ael3kdNXvtLMBD+v4K95mwUf3Slg4zdm1yCVCehUQATlIxdhLNzto25vfSfnB/Bf6F4emkF5crK
	U5F2ef/51CVAZzg5FQcA031SEy/2Z0fKyoMx22aB7F57Wy9P4L5HzDWrkCSYbPyBSwawHwHS6g9
	nMbl9WwPHhz8q5mb9JW+3PIEsL1703ZyyyCF79gXz8kddl7r3AZM3LubapeFkW1jG8xVQtuv5qr
	9oSylK8naLxdzmgpXW3TtrxqVNFAE/5XObdCd6Uei2+Vhmwkmgt0MiS47Xu9Zk=
X-Received: by 2002:a05:6300:6698:b0:3dd:d91d:e2c2 with SMTP id adf61e73a8af0-3de0e7f4a2fmr13272194637.48.1790647747603;
        Mon, 28 Sep 2026 19:09:07 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78796cf39sm5448596a12.32.2026.09.28.19.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:09:07 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v6 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Tue, 29 Sep 2026 10:08:53 +0800
Message-ID: <20260929020854.1282339-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929020854.1282339-1-a0987203069@gmail.com>
References: <20260929020854.1282339-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the USB subsystem nodes for the MA35D1 SoC and boards:

  - usb_phy: standalone PHY node with #phy-cells = <1>, covering both
    the OTG port (PHY0, index 0) and the host-only port (PHY1, index 1).
    Uses nuvoton,sys phandle and HUSBH0_GATE clock per the binding.

  - usb (DWC2 gadget, USB0): phys = <&usb_phy 0>, dr_mode = peripheral.
  - ehci0/ohci0 (USB0 host): phys = <&usb_phy 0>, companion pairing.
  - ehci1/ohci1 (USB1 host): phys = <&usb_phy 1>.

Board files (ma35d1-som-256m.dts, ma35d1-iot-512m.dts) add pinctrl for
VBUSVLD, PWREN and OVC signals and enable all USB nodes.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
 3 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 78534d613486..b2f25de2ae44 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -97,6 +97,16 @@ pinctrl_uart14: uart14-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb-grp {
+		pinctrl_hsusb: hsusb-pins {
+			nuvoton,pins = <5 15 1>, /* VBUSVLD */
+				       <11 12 9>, /* PWREN */
+				       <11 13 9>; /* OVC */
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -151,3 +161,29 @@ eth_phy1: ethernet-phy@1 {
 		reg = <1>;
 	};
 };
+
+&usb_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hsusb>;
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..58349470bc64 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -100,6 +100,16 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb-grp {
+		pinctrl_hsusb: hsusb-pins {
+			nuvoton,pins = <5 15 1>, /* VBUSVLD */
+				       <11 12 9>, /* PWREN */
+				       <11 13 9>; /* OVC */
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -153,3 +163,29 @@ eth_phy1: ethernet-phy@1 {
 		reg = <1>;
 	};
 };
+
+&usb_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hsusb>;
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..72a1659207fa 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -76,6 +76,14 @@ IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
 		interrupt-parent = <&gic>;
 	};
 
+	usb_phy: usb-phy {
+		compatible = "nuvoton,ma35d1-usb2-phy";
+		clocks = <&clk HUSBH0_GATE>;
+		nuvoton,sys = <&sys>;
+		#phy-cells = <1>;
+		status = "disabled";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -431,5 +439,62 @@ mdio1: mdio {
 				#size-cells = <0>;
 			};
 		};
+
+		usb: usb@40200000 {
+			compatible = "snps,dwc2";
+			reg = <0x0 0x40200000 0x0 0x1000>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk USBD_GATE>;
+			clock-names = "otg";
+			phys = <&usb_phy 0>;
+			phy-names = "usb2-phy";
+			dr_mode = "peripheral";
+			g-np-tx-fifo-size = <16>;
+			g-rx-fifo-size = <0x100>;
+			g-tx-fifo-size = <256 256 64 64 64 32 32 32>;
+			status = "disabled";
+		};
+
+		ehci0: usb@40140000 {
+			compatible = "generic-ehci";
+			reg = <0x0 0x40140000 0x0 0x1000>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH0_GATE>;
+			phys = <&usb_phy 0>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			status = "disabled";
+		};
+
+		ehci1: usb@401c0000 {
+			compatible = "generic-ehci";
+			reg = <0x0 0x401c0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH1_GATE>;
+			phys = <&usb_phy 1>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			status = "disabled";
+		};
+
+		ohci0: usb@40150000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0x40150000 0x0 0x1000>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH0_GATE>;
+			phys = <&usb_phy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci1: usb@401d0000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0x401d0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH1_GATE>;
+			phys = <&usb_phy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0

