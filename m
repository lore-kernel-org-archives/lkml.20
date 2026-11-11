Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382312;
	b=ESj0Ujnw8ky6Rd4Iaye4ugjjX4EJib/oBiCVy0nKyvrCiNeYrYbqrrCU7SNiOSCa8J2H
	 cGarYIBGcN+CZP8ExfzOiGADI0ePDkDO8hnZCiIRq+9frlL1fgg2HfkEhnWFD35I/Ep8M
	 PKS85NcygXN8OaX/705gs0+t0keREOujlC9+fxCHGf/goVZ9IN8NC6FC5VmDcZD3Q4WnQ
	 t2CR+ZgSZGGQPU6KRnoqDa5IekQ9YP0GpieVhcglCnrKooiePfthQl7wCFjRm72SvZ0+J
	 JVYCPSZnU7hIaQcShfnFabhXfzsmNDVXhjIcwgGnp1WNH4eYOxD/PqwL8nfykQIGKig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U35AzZ/XWEKZdjjiv348TI/fLy1BVLDjtqngJWn8/1k=;
	b=CX2LU2YNYjQsSnJLWccJ6tJr8/rvu+JQSWO9ZB3du3rVTq//5aehBQharZFp9zx3WqLh
	 fd8rCv/cUzhTf38R+OBz26AwAXl4IDA8iXvxeHVAUvsaWdc0qxupOfDXiTW0IPjeNswNt
	 lE7jcvZ1RTrZp39yPsuYXkBinCV/dA/tI26gk+Wwtgsw8gQ82o9BZzazL7ybxqtpGCfvz
	 tY0HGy6Al2Pl12zFAcDYa3sE4g9QJuRnDPrVAvWpNuGzft1r2BMMXgnoP49Wc72FLSS1H
	 /J5GcHj2geSnUHClHWESIN7W8hfZRChLv9bH7WiAaE15bitr8p70hXzSX8TyzuUAXaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Am2A35i/";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D2060A3809
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7D2060A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Am2A35i/
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37198ed3727so3599606eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382311; x=1794987111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U35AzZ/XWEKZdjjiv348TI/fLy1BVLDjtqngJWn8/1k=;
        b=Am2A35i/ARLEwfSWRSIGzv4+F3ffSUmPGi7dIFs+Hg+K9x48LlkxX77mTAyeUWPHWv
         EC/uyhVv6knarVN5HVhtMyZ9H5dxglDgDxHuhOJHe81upa2g5XLA1nJa2v+dXVi8SUGp
         qmRSPA2zcX7C1e0WIar3vrrnl0LuPu/99Y66YNdma9p/Ui3qbyST/OmPjmuJ8V73k7no
         Xod8G/DHXmkIuVkdZABYsuUbOx++tU2McPs1mHkTvnDpKoEEGEeClZUR6DTKwvxIAOEn
         68czYWLOB+JQ2FedAKrk4DNdPbPqrUs46K7e4Om/3jYRt+mASH7yCp00bo4SDc4z14m/
         RFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382311; x=1794987111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U35AzZ/XWEKZdjjiv348TI/fLy1BVLDjtqngJWn8/1k=;
        b=MuPD9d7jnEV+oMufmXCOpdYqv0uWT6uyzeK3+/Ul4RT7YxhQ5lZexJ/jJG4tVhohLO
         vT//8UsDkCQrTMP0THP+LgmOK1Oxf/GH5h9t6slRa8X+gb//Vs6zXbkNnooN0X6Cn1ZO
         tKr1PKhOcn/C0VSI6uF/3i5molcM1KQSZkSjys3tLDr04R1S0qMBBmu8EF//2pIzb4yd
         XJAly2g78Thjl6gywokA1/VLIlfyqLVpqTdB81nxdDf7lg39aOVVY//iPMyzf4Kirq/e
         cbA6PG4WRN1C1ZRkrTwwhG9oFqbu30UQM260VjBYG9puJPsDLSsBPg/PDRkf5GAYRkxy
         Cs5g==
X-Forwarded-Encrypted: i=1; AL+hErHiwoP9LjdrhmiaTBskp9KY7YIxeNKSsBGoLgAccdcedq/UUEZBiMDRyRVJHG20XvmqNcTPRtUEgg97VmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TyliLkUtKP2zjWPz+v3PU1p3hE9259Q2kU1Xn1TevA3z+LWYZ
	ZXcva1EBiYRj2jmHUxerpk5VoAGmOVGnxEQPMgzPZTFgtDHagZPfflzz
X-Gm-Gg: AYBFou1sBAImhkQO7BJ9s1SbFhIpZ4ugzJaqyh/9piSZMkdt1aIw/7lzUxnpmlE5+Fp
	lX3c/TbMdDhwa4IFDtf24WiNAO7MOykvFsKl6UuTLpiLd2Lpf643xVmPRebbawF9/uF5EnddL2C
	l5lW4xTBOji+6/T89sfXhpQ2x/BNgs8yZKOOmhqxUKG9fAyjRPPkKNbyTjCvdhw4ScpXmVqrZ4x
	zAFfdMkmhcaJpDM9P/oj3abvahL8e8C14xn+sYqlfXKyeUXK2+caDRj0OzaOF6YI7qBpesat3U1
	o2/Qtq57Y4KZmE9Ei0oFzS0pjM4F5psCMGOu6dn6aE9ytxBLiX6m/G6EiUKXJkaswtKOdTpBBhh
	CLy+jcdGtgiRKsTvZwAW/BdA9r7MdFJU5EIwUOKUvmaCXlJW6Ptq/B2sMgOn8muS4hwPgs0f9/A
	TwXFIFEaTXM7vuvbVIYVrnTpjVzEbn/a+jvLfvxivYEvLNGH6yh2m+d11QlcBjPUcbPv+GHeNSI
	pmAmmMNqJRM6e8YqkYJdM1Odt0V+uuvhEu96K3qvp6M4mAx7IoeTvIHjPV5IKbaTME28tHR1/ho
	EwthU/3lf+VqF2vryVnejYXzR7AirP5sHJSvigPTk/VXbFoUfrmYRBgzAVXB1RD/9dE/baloMqZ
	NSLaqjNx9faFIXN4jxQ==
X-Received: by 2002:a05:7300:dd08:b0:376:c9de:ec3f with SMTP id 5a478bee46e88-376c9df08e9mr1172019eec.7.1794382310760;
        Tue, 10 Nov 2026 23:31:50 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm12640655eec.8.2026.11.10.23.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:50 -0800 (PST)
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
Subject: [PATCH v9 2/4] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Wed, 11 Nov 2026 15:31:35 +0800
Message-ID: <20261111073137.381966-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073137.381966-1-a0987203069@gmail.com>
References: <20261111073137.381966-1-a0987203069@gmail.com>
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
index 7228ad4735b5..ede0d42d2d78 100644
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
+			reg = <0x0 0x40200000 0x0 0x40000>;
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

