Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207384;
	b=F4I9QX9ANHtdYbz5G+vfDfL+pUG8nStN52rz2rjTNFcB+pcrIB9gX57otCWTlrL7cxAT
	 H3xSfSSOXI+7P/mQJz3W+iT6XTwfGOL170F1vxPaDIpunILWJuc4HI0HJ/a66WSQtwges
	 +rcuszeVZa2YCuF4q2BGqZ9MRaBL2nM7L6islzQRloUOgRtHTJUm9nzb1qvJkolQchES6
	 MIF0cAkwdyjW5I406CzyiCOBV6SMGvxnDOMfF4UOBFij0DCvkjc67ela/Nj6JsCdwSNYR
	 CavMYCRFD01byxpM1YkHnJKix+mLjqXpwEW9oo5F5e7AjUugxXXj7jIsE+Tjzji9PXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c0Q1lb4Qqoljlh+F9k2cVtvGnbnmDGMBxQf3ZK0rUb8=;
	b=W3AUPP4RiNtI01d0DGzMpLCIFyvgA3dKKcdVqPA7ufybehhoK0NhrGf9f9POC/gjq7/g
	 IpcsNpPjozYtsBZIJTy31qJ1DXm3zuzjDGDp2LrjoRQUcxiWYQ8xkE0oLSenen9R6Fq3o
	 xLT5/Jpu6dXfJXGy7uEhfaVuwizORs8O/OqJf/q2udYsO1IEeQc0xpL/9X5rlr0E+fJE3
	 8dsNX/j7+Zcyr6088GcRheNKDQLVCjWCpYqYxL6Lok756MEnAvrAv2ZWHT7RaCfYUa9bl
	 IjsRyRQWLNNCkTl9x84nEAo1HSYAyZS8Ys5EUkpeB1bMEIIW5OUV7kXqn69tH0Rbyiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3Wfvxih;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F94606A333
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F94606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3Wfvxih
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so1057447c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207384; x=1794812184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0Q1lb4Qqoljlh+F9k2cVtvGnbnmDGMBxQf3ZK0rUb8=;
        b=H3WfvxihSfHjs4+wXPL5HFIwKIclmBvZBhBa4OTz7TrHpnJBQpOaLTenymIzbM7ogI
         XAGsw7u3qQa/9BUXHFRvENqbYJQhRgdzbUcLvlA96I50NtrigKjic07BFksFfb/veh1G
         yw3tvxBVP1pO2YIGk/XaGjPPeIRCYsYOEKM3Iji2bk2s/5fg4+Kj+qkSEgg/vz7HyHBi
         GVAqlS2/7XzmFPSiC6i72dmsOO+oQ9NbpK7OfwkZ+YhaqQwzr8DnHS1Q9nuWsbQKG95J
         c4/P/pCbmWL1JYuuKLD7NHtbenng/RnhJQcWJSmfbyZVqeNPcj5dy5XvgMGp8kjmm0ZM
         sxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207384; x=1794812184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c0Q1lb4Qqoljlh+F9k2cVtvGnbnmDGMBxQf3ZK0rUb8=;
        b=UceO3n5Vaz17CXnsFkIStJz3wNLY4Owbz4I+x5rbpWZug2ledHOLWlMWHx/fXhf1rL
         Lvm5ZRx8jNJhaEENg27eF56qnttoBIBZoKavUPqZ6E4dEoacd+oRF+iEcyBLn2bgFWAH
         bB6Q/0XJp1EfQ3+m3yPbP/IfFbTRG3TiIhTyerEiMq/HxJ3Gd9uXCZbK+NM5OviOYjrC
         rjl2iCzHLBEn0lNkXnegS5X7Pll5whmbdrlSPRoS/YfoAfdQC1gUCpLz3f6T6BM43X4l
         v+3yL2aow4gD1erMnXDjeo48+6V+6YytXpY79p/N0RO56ijBvnVjTtjntL0NJXZrs+LI
         ZUHA==
X-Forwarded-Encrypted: i=1; AL+hErEuV08VLjLpSWWhn0b/4mNjQ/MgmHL4DbPxpzUxY4uV6Qjlb5kyEjULFSczDa0JkwEmXyzt81tMWzgwGuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BA4Clmc/mcHIxB5s76gh5y2TbkisCCPFBsEE8HaQJ2RMCUmp9
	5FN5QXilcpS7ONkrBDpkB3/JQ0pBc5ZIaZbcP3YCfiMf4l8Xp3kFytS9
X-Gm-Gg: AYBFou2N0301r33X/+N2Mf8zb+YonG3Unzi5iX5yOMWfJZaBp7trzv/hUf14jryRnov
	IacR/a3A3f48ow0qwecKY6PX7VcRfAoDE5j7H9Vsc3IvkW08UXweoT2RBSQRkr30BJBPhyk6Qe9
	MkyEznHPPZcgbiSiMvMSAXG0ead+KEoegonXoQLn+Cm/egfl4xCSHyTAqGSl6tFf9kJNdQER6T6
	9cLu6Gg6CKCo9KiZk2ozcnMZNDVXARvXy1oWZa04W0kVoyg1ptp7fviMqMlWBmmRIBOBgyQ2Wu7
	9h8p70+OknSfjyRDbxi+hHYQM+4olysLuSqcgQghWjsaseTESLTI29NWy3DWujCccLptDsW09P/
	RJw8jkZzbzDthHNivQcfo9UsbIrPSx+1yvsXpcrRjJdTQb2s6N6rcivblkbcR0+54TjxTbD/pl7
	seTcC7MhCa62RZyTFc7FCVLaf3bln0v+Gql2Sc3zO7EesgYbDDGsJ7Py3oEYy3ges3IgDVMZxMx
	qqogfWP8GooopKgAgXRIvXYDqtJeY/qGOQ7sZ7DoN3J6KBYE0jsXNTTDY0kFyznoHzjknHCffRB
	pTpy4hKeywQSgkrMarPxKyNrgPJQPo/140YRQGf+7Id1IMYhl+Yu3So4xYxb1snRL0310rbZQmS
	k1C8kFR/SWkvKbvelmw==
X-Received: by 2002:a05:701b:2214:b0:1a6:4679:6cf4 with SMTP id a92af1059eb24-1b39feb9511mr5037784c88.36.1794207383471;
        Sun, 08 Nov 2026 22:56:23 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm10120176c88.13.2026.11.08.22.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:56:23 -0800 (PST)
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
Subject: [PATCH v8 2/4] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Mon,  9 Nov 2026 14:56:04 +0800
Message-ID: <20261109065606.62641-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109065606.62641-1-a0987203069@gmail.com>
References: <20261109065606.62641-1-a0987203069@gmail.com>
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

