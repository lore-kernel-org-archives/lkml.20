Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24F73C0A0A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439606; cv=none; b=fTYwis0F0CHtrC1IfkaC2eYVQ/AE+nW/R++Dq34kW1bjBgi8mUJypAUpC1Z8uHAfuVaqm3tpcPBkAV3Ll594G7ZLuc9DSun2JcSlf9ryq5+2A/KqpmVPmxZgKUDGtBUyrXWwOrwEa8kbotxNwC07sDtTzLfyCDBOyBubZ4DFk0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439606; c=relaxed/simple;
	bh=UBS5ASw3CDaZVm7biJMQdfLYTrTkdGTgJ2Xx7ZHTcJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMq8oAdoUx5+NHB8/yDfKthEH8bQuXwfpbketnvWosOI5IXslW9HbwlJyX8Fz6eUALl+Qju7lmJkj7qPFdShOronvVfOs/IS+V95Y3HzsJ4jdYM5ZFH2kANp6ovyMlFdmieWS9NVRjrpuS4d60tGVVybpGprsUW047dQg94rhI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdfqMP1o; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdfqMP1o"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso1104693a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439605; x=1792044405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0Q1lb4Qqoljlh+F9k2cVtvGnbnmDGMBxQf3ZK0rUb8=;
        b=LdfqMP1okCMPv2l2F9joT9QoQ3osuDy55t88AMyFXAMy7NPlegRwXUHO+b6SuPGqwU
         bJV71gV/js165UBcLv6EQHOdFvd67lj5BKuLwy9l541D7KbjhfcJlpwrpUatbagk+3e7
         OyzGeQHm+HgbW6OUdVAvm6oU9KoMQpNhJAMwObija4ysj/yoYS6Ft1g+y3ZYwInot6HL
         L0pU8GmeSswYlasbrISEAA5wILqUfk0uFKDSOh87EiMQhljjZu7TTTMyFUNVta1IbcIc
         5xC90vsg8d77pMYL1XixojYMvgTEVX25xzxCqMSsHovf9ziN6GbDSRpBGqIOd3QrIZGR
         PX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439605; x=1792044405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c0Q1lb4Qqoljlh+F9k2cVtvGnbnmDGMBxQf3ZK0rUb8=;
        b=jXx89d0cETYKn35FolgFWhmyyl+J+6L7rAI/vwqvYdeTmrF6DSOPoUiB8yiknOcK7l
         aiOd8LaXhziph0Eevi5bD90akRnG+ev7EP502rkZ+ZKlPgIYGBSuWHQnziKy506c6H6I
         dGVIh90v+mVnUthjzXMjlYNvrv9ZKXbLrANaBsaoRQ8MIILOC4YVohUH7kTDJSBDy+Tq
         83Ke4lbiQGPf/om4uausLrI/0FJdgEUetpuzlkVDReyPR+6Et9XEg3uiws1wFvJ5eHTm
         R7CaP5upg0v4TTTazOpEdms6DuwX0iaYsRpyS3NcL/UX5AIT8+KkJgPIuP9UfeNwejiH
         uEBA==
X-Forwarded-Encrypted: i=1; AKwUvBz0TKdOC4OXESwz8dvppmRUMjlfo4olpGYSntLmpPO9rWT/TaTtaD2DXOssZIzZi/UL886EpYWoHN1zCr8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEedQCVP3IaeduM9LqXA6Sii+pMbFclNsNUW+ILDhMS7MYXJfl
	ikhnSXGhQrekE9O9RARXsPCSiNdxO/tb4/M9oAan4vKpsizc5+7vFn5/
X-Gm-Gg: AYBFou0dGiHrrE1H6J48aJoXPC0ithGxw6IzyrlyYQoG5nwuzx7qu79wd9OJW6ZL3Q/
	dUBSVAxwWFgZK+W9yKop95yCip4JkZUIqfsv+iNVIYiMmb+TvQM9OMVtdf2aG//eh0WLNlj2cjC
	JIa1EwLAfFdsz5ZBWXQyrzpkzhgE2OslG0obvUc7rYmSWvJkSyHMjN0Q15clCiY38lGTEpD1CqZ
	EON0e/MSqGRkRTu1kE7rv30Nf3c4e18120Y1tVsa9SRP/OhPy94Hv0tKtgro8CpFwykFeaf7Soe
	kTKlCl5f9Xq6HVtDcTeyYJyWlgk1BK8wlAba4NVUQ1Lu9IjusuuImWe6K1uTSt0D23VXaA6+rBm
	DAwg6+9aiO/XYmcTeZVT5uOoQh3XPu58L7fbO5uYK2SuW4x3r8t9f/mUJORQn40YgHshAwuV1hY
	z7TAzJbcSK+RIN/D53ppudR8CsNKWGCgYYDBLGRlAt9GZ1rPAWPMDAI7Lbdk5qlxKvvd6i0IHRg
	tYG45VrE+TnC+T96z+Nr9MNLDnVm2oqm11M00bgUHsEMTSwIYWt7frb09q8ReE=
X-Received: by 2002:a17:90b:4a89:b0:3a4:f6b0:7de with SMTP id 98e67ed59e1d1-3a8a08515acmr4079800a91.22.1791439604675;
        Wed, 07 Oct 2026 23:06:44 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm2632203a91.15.2026.10.07.23.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:06:44 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
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
Subject: [PATCH v7 2/4] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Thu,  8 Oct 2026 14:06:27 +0800
Message-ID: <20261008060629.2736806-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008060629.2736806-1-a0987203069@gmail.com>
References: <20261008060629.2736806-1-a0987203069@gmail.com>
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
Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>
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

