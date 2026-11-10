Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339045;
	b=YAXjE3//2Orh7y05wBxYzboo9/7nbTKO/jpb3HXjSF3HpcbThpQb3QG7mYvv0KBTQkXJ
	 eqKX8WXcv8GRV5QlIWYD9zJwGREY71XodXj6//EZYmMPToDu6to/c3MNYgkuL9ENq0yim
	 a0NHrzm4p5HiaRM/IVORhMEhADiq4OjtOUHz7QaYJhdVHTeTBjANzLg3HAhCtpxYTF7T7
	 Y/fJRPA8NMmQ24sq6NfjnFa83eFf5bauYLM/NnMVudPYavlnWpmluicb7ODQNiD2JZKGN
	 Zy5CCczSh5UA7ZqL9078PDZ8y5kIlYYIvdca2xn0KZyiOV2Cs7dGFaTAJ97k1bAwXwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YVXKXdmO5pc+cT527r2SrlA5H/eJKB4pSKsUd9huCKU=;
	b=vTMThGu9IMhYWLRUTj10Gmb413csJkpMYuqxiHwmt19uWxPZ3pgFu5QWwcAfclZ868Hw
	 7CLMzVpjdvSYTpL076TEsC5/mbPDr9MdLMpcGFgz6oMRjo/phv+UgqFqS1Hd5ao4q/s4P
	 Wt5QI3jY3aPexB56zrvHeAAeXN1Jx5jvmasA02Fv5rFWH3zFJb6vWQ+r5RT3ShgtS0WQk
	 KS1Ubpob5saOeMZXb5rpLAifhWmPiPDGRh7ePRIKVB7G6LwHs9ynVHmsLo9jYz+jOdvMC
	 c0Kzv9juJqhhabgj30eUmX1Uamkon2yI0jKPKdTw2pGs2RcaCXy4PXrdncMz8PebQwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrSiAL2u;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57466606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57466606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrSiAL2u
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so2933145eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339044; x=1794943844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVXKXdmO5pc+cT527r2SrlA5H/eJKB4pSKsUd9huCKU=;
        b=MrSiAL2uGYTU/l6E8S8dUeQUegimhb0iSDMpBQDMoG9c03g9hzCRGrI4ZptLAOl00c
         fEudwN+wjxmA+uz0Jhh9mghykH767D2J1Fr9NyGJvD11eTG8820YMwedJymNN2zd/d9w
         j8i/CrNZSKqGdRmCtR6biu6izrGt6aeT+ntyUCu4a+WKK5N+DNMIz7o9LxV7FqEtWgsr
         to6NBnd/4XjofV6CG4a1JFoteIa+xDH7GGrRzYur9dMi9VD0TiTEHgaBgszXUnFg5I1V
         UV9Q1K06CPyD/y7eE5orW5Ny7kDjdYSLBmntJH6I5CJMLuIhqKJUyR4aOJqmTVgK+lY1
         4vzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339044; x=1794943844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVXKXdmO5pc+cT527r2SrlA5H/eJKB4pSKsUd9huCKU=;
        b=R8oHiGz9O2QkVRXfjzUEFzx7AJzl0kB4sej1i4YXLNA1L0pGs8KtlvjzjZ81PGZpmK
         jLmuYmynHHNLQuixJL71crF3lKL/MLV9/pWe9dtWq7QA5McruHWbhXeM5LrX/u9KAB8r
         7P/354SpkpiH1rzPvQS4uM4Hs5i2VeELRKLfGM+kaTwR/BoJol5pwZVrWHsBOcuzDOjO
         iwNYF9vb4tVIK7lw2B4Q6vgL0Tbhi9R+PheeJL8fAnd5Hc2x4ClIZO7Cg8IwEhoLnVJ7
         FPbR+NI7vyIWKadWGthff0p6RB5nz2MrWhKrqiYxxgXLOOj6mQy0FmIYpTner/urI8Jt
         Vlwg==
X-Forwarded-Encrypted: i=1; AL+hErHYP9aJR+MiCVb1HrDcYqIZ2QUltzsgAJxEiBrf+cW4UFDj2NNaXuZMa5SmW5jwoWg+1EkdAj2H37xZj3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MjMwg8yP0+jWf2otroqD0yQZ5nt1972ouTuokxLRSU0t2+zVx
	YskNaDbJsI/r7q3x8rYgRPEMb1coUvq020wkQsOC/VCueUsbZcwc0JfT
X-Gm-Gg: AYBFou0upR3NHkuGFsh7Txad2/3cyul6EijLubZDpDbtlSJe2miSLUpYubrA6utBEV9
	kCrKoaoMUrkLMmaRfyGM3Hqt3a1rIg8LOgD9aXhLvS5BFC1qbKc/JfcxhKkSBMgKEpOh3QTxfH7
	l1EEON4YJWzddmw3wsRmjUMW2eeK1MjivQpnfGERy4n62YziK+K75rl6DRp/37P3uIFvxD2gOq3
	R8hHHG5v/aKS/lPg1BN8diBeUAJld7TGTIxy2ltuF+XGbaSE8I2+msv4YgugINiQJOUzcO5QG4R
	79u2BYJfWzq44yijEXU/pYjquxIXEZvfo0uyXsY8xDZW34raMNYMti3xrRNR9D/5EFL5bbtVKPC
	qSddV4boAnFcjDeJNSxKTNWOswZgeyAUxG5cXR2+RxuBkDkP3AU2joWyi0z6BIoObjnGxV95igf
	fR7McuoU5ezoZh/Hm9krcXM8tVVeYLTBCruSaVkhF92eq+r0tHhEA9JFAPbt5CGH39x2hkqiasx
	FN2vTGNZVG5hkGOy4dM780GLo1BvjP+oAUQeJa8qwK98nNMRKBlUGMxlW0ztKKSHblbsslwKDt+
	zHxTdTnJjULU4V1cem+m+C86GAfQZVlDPTYaIpA33x2GyMZl/w==
X-Received: by 2002:a05:7301:d80b:b0:375:370e:f1ff with SMTP id 5a478bee46e88-37687214128mr374176eec.35.1794339043899;
        Tue, 10 Nov 2026 11:30:43 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm7730435eec.0.2026.11.10.11.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:30:43 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 1/2] arm64: dts: rockchip: add USB-C PD support to LubanCat 4
Date: Wed, 11 Nov 2026 03:30:27 +0800
Message-ID: <20261110193028.512456-2-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110193028.512456-1-cyan2254650260@gmail.com>
References: <20261110193028.512456-1-cyan2254650260@gmail.com>
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

The EmbedFire LubanCat 4 has a Type-C port on the front panel backed by
a Fairchild FUSB302 Type-C controller connected to I2C1 (at 0x22).
VBUS 5V power is supplied through a fixed regulator enabled by
GPIO1_C1 (active high), current-limited to 2A by an LPW5209 switch.

Add the FUSB302 node, the fixed VBUS regulator, and the USB-C connector
with dual-role power (source 5V/2A, sink 5V/1A) and dual-role data.
Wire the HighSpeed data endpoint to usb_host0_xhci and the SuperSpeed
data endpoint to usbdp_phy0.  Set usb_host0_xhci to OTG mode with
usb-role-switch enabled, and add orientation-switch on usbdp_phy0.

DisplayPort alternate mode support is added in a subsequent patch.

Tested on LubanCat 4 hardware:
- fusb302 and tcpm probe cleanly;
- USB host mode verified with USB 2.0 and USB 3.0 peripherals;
- USB 2.0 devices enumerate and transfer data in both orientations;
- USB 3.0 devices enumerate at SuperSpeed (5Gbps) in normal orientation;
  reverse-orientation SuperSpeed is subject to the known upstream
  phy-rockchip-usbdp driver reinit limitation;
- USB device mode verified via ConfigFS CDC ACM serial gadget connected
  to a host PC with successful high-speed enumeration and bidirectional
  data communication;
- VBUS switch (LPW5209) enables in source mode and remains disabled in
  sink mode with reverse current blocked.

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 115 +++++++++++++++++-
 1 file changed, 114 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index 0d28c6165..a94aaddb2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -8,9 +8,11 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
 #include "rk3588s.dtsi"
 
 / {
@@ -116,6 +118,18 @@ vcc5v0_usb30_host: regulator-vcc5v0-usb30-host {
 		vin-supply = <&vcc5v0_sys>;
 	};
 
+	vbus5v0_typec: regulator-vbus5v0-typec {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus5v0_typec";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&typec_vbus_en>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
 	fan: pwm-fan {
 		compatible = "pwm-fan";
 		cooling-levels = <0 100 150 200 255>;
@@ -286,6 +300,51 @@ regulator-state-mem {
 			regulator-off-in-suspend;
 		};
 	};
+
+	usbc0: usb-typec@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PC6 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&fusb302_int>;
+		vbus-supply = <&vbus5v0_typec>;
+		status = "okay";
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+			try-power-role = "source";
+			op-sink-microwatt = <1000000>;
+			sink-pdos =
+				<PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usbc0_hs: endpoint {
+						remote-endpoint = <&usb_host0_xhci_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy0_ss_out>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &mdio1 {
@@ -346,6 +405,16 @@ usb30_host_pwr_en: usb30-host-pwr-en {
 			rockchip,pins = <1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	usb-typec {
+		fusb302_int: fusb302-int {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		typec_vbus_en: typec-vbus-en {
+			rockchip,pins = <1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &pwm0 {
@@ -748,8 +817,30 @@ &usb_host0_ohci {
 };
 
 &usb_host0_xhci {
-	dr_mode = "host";
+	dr_mode = "otg";
+	usb-role-switch;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_host0_xhci_hs: endpoint {
+				remote-endpoint = <&usbc0_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_host0_xhci_ss: endpoint {
+				remote-endpoint = <&usbdp_phy0_ss_in>;
+			};
+		};
+	};
 };
 
 &usb_host1_ehci {
@@ -765,7 +856,29 @@ &usb_host2_xhci {
 };
 
 &usbdp_phy0 {
+	orientation-switch;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usbdp_phy0_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usbdp_phy0_ss_in: endpoint {
+				remote-endpoint = <&usb_host0_xhci_ss>;
+			};
+		};
+	};
 };
 
 &vop {
-- 
2.56.0

