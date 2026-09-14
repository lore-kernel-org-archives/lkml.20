Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707653515E7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355967; cv=none; b=T393s7w6x4zeJ97fQmDwmm9o0/UahMrpAH94WU4X+EOHmI+c7oRhFo2ahifG/8p6JiyV2yJ7lTcrSDmRHfoZDhgEcna4YP3MDXPwvEGewZ3Tu4ZuEJhqK/rd/QG+Hkw7aMRrLCne7dwCQPJHJlqfjciCcfDE7T9VRIEupBUAkdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355967; c=relaxed/simple;
	bh=axsBfJKc8oG5HoXuwFL3eDZHYWq1TE3XvrLzqiJRRJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBPWyOSK14NP+N6Ha0yHn/MD4VnYoHR0uYnjEjRyZZcBdwyaP9JtIuKM1nxYVge4iK1pYGGXk7Zkj5ptLVJL5TgpOsAr5/b7qPYzG46Jh8KeXeebbdkrixTW/NZzESdSRzqv4Gi1J5Ols13ry9ZWtspj6QC26kTFfSK+BByJ/Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUlUw/zT; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUlUw/zT"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caced6038eso26206025ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355953; x=1789960753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lFtXijizYAouWVN9+dy0kDOQ2hTGkK/90hktZxmu1c=;
        b=dUlUw/zTShJ4Yog0a9olOUfWcAEDQ6LsE7nktclyzH7LJBjioIFumqPUk4V0ED7jaY
         fsolDRmcLVpITl6EhnLXF6GIBAaTsR9Orf/uikgu8dZchlQei8vSIZXmqngxHGi4n0E7
         yh/vwVaCUWzgJCBy5wwyxOJ6ar9s1e8BIaK4176qpQcsO8EyjbWkAQjOVNUty17T4J6K
         K3anA8ugksma00exYWluX2tkb89pCBJi4Xwy8cU0K6IIUREcCvzdWvzfa9AGAkdKOMMI
         pekZ3vNbPX2Drm0iWSfdevcgRXkHO1YWdNp39knI+kKqXjN2ByNc9Db1E6hcuhubgmKe
         cVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355953; x=1789960753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lFtXijizYAouWVN9+dy0kDOQ2hTGkK/90hktZxmu1c=;
        b=RTwhU0BcxVJRGdCw5jg+UAJ2v3/msUaMBtqG00VChtT/g/qzyL+y+NeHq+RySxRFjo
         0GN8UY/sJBwj5P8TObkqJ3DlRpYSI1GCqi+xIpgaz+j1gcvjp9AQMOyhxxPvVWw1NY1J
         tQeU7gpG2WabdV2b4rVtuYTOofRRUIwpUN7heqrxmkh33afZTCxXQcjJiyNpHTdaz8EZ
         ZxQHGXWe4ZO2pFJTwFHGQkTIPby/+WkmiIXf2EXjvKYiUuE0omHHtHw9PoUITOBAZ8gT
         iffvFfs6ywSXvAHPmhSo8QiP1BYlfpuzAa7ES+Rr51j/zcd19SOVAwVartizI3LFnioy
         K1Fg==
X-Forwarded-Encrypted: i=1; AKwUvBwmUqS2Ljw6LlnD4hjyUrpILFbQ7bDrOLyMNywZEAV7PSGNNjC4gz3va/D/Lv1PIRSBUMviSba91oGVKUY=@vger.kernel.org
X-Gm-Message-State: AFuF++mFae+zDPOwPC4O5kTokAe/ZoDcmuqPlhsmQ94EyvFj63Y19EyV
	NkS2M+qrFq+/WTWlH1bvJ8s0hlLwbqJc9YF6+/L/hJ7odqNbUoeqiZa1
X-Gm-Gg: AYBFou1oXdioEMe5oSFlZtcuCMdXj3yvmvCXkmQsCFx5fLgcuGNHX65QT6YBa7G9LMx
	k58TtHMMWF5KojNkDTj9YpIClumeO/LUiFFTTXj/S2i/Iqf4+5OQwKMXBYgHy/wLXSikSjWcADF
	25TlCG/ae8Xefg5d/jbr79kRl51xTOhH9n6nzwHrLwX1Fuw7J+yAhIVwhh6TwFwZ0j29xqs8tFC
	39JRE0agjsIiirp+BAnuZi3QPOkuIW2ISBIbIgL40GDlf0HkmhqnUUkz0QlNMzXRQ2TFYV/Jl5B
	EoCnrkJrkeie9tlAzL16GPaHMx8IoJr5CdfDTzp1MjxfJAGqgleIDAB3F5NQMWUJAPFqIzeiyYE
	aR6G1v5/Vkkp3nx8u0V00/5ONY/z6VjqYJ/2cJpfFhZ49no6DbjgN1eXRX9WGmxeKpSnER8t5H9
	mn/NZdwV1m4CqjQZW9PYJGfWfvrCx31KnvH3V8TvQLUi1RzVW8VH+PgsfO+tilRaMfPRKyeIVYR
	QFB3r2rCS3zKhhhSp5c2cWdNJU3oJ24w5T4/UYrgF1riNVjk1yAwTS1y0JokNw=
X-Received: by 2002:a17:903:38d0:b0:2cf:6e5d:23e9 with SMTP id d9443c01a7336-2dd5f16b17bmr58734135ad.14.1789355953180;
        Sun, 13 Sep 2026 20:19:13 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm41355145ad.48.2026.09.13.20.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:19:12 -0700 (PDT)
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
Subject: [PATCH v5 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Mon, 14 Sep 2026 11:18:58 +0800
Message-ID: <20260914031859.385224-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031859.385224-1-a0987203069@gmail.com>
References: <20260914031859.385224-1-a0987203069@gmail.com>
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
index 78534d613486..0a068abda6e0 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -97,6 +97,16 @@ pinctrl_uart14: uart14-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb {
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
index a029b660e8dc..7f1e6d2a1fc2 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -100,6 +100,16 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb {
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

