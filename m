Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987562;
	b=Ce2dEWkBeR7apCbaklQRejPVKqXO6BFWz2ron3+UYn+xLn6mqQDVD9K78u5kCGOI8RBl
	 sKEbbpJdZDYtGt4VNdteiEaSKuyGbTWoERGMtPNGD/ix7AEcKWiomjma1N6KJO0UQSUgw
	 PF04En6qz3AEthQniqfPRWCx/eqPH6H5z2jEvXANBLA/04VVFwe4BCkTNyd2yCvK7LZTT
	 +MA/GJ2WVBsL3qBMtN8lqAi6Rfj/SiJbWfNNJtxWsmBEDkrJ1ckBHxiEoBbVoO28pJIco
	 T9eRE3Y7BgQkqNoE6+9oJX4WcAouuZsatX60116Ebo1K2kdnByMVIWzfN2kbzFbhQiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sHP2oF/bjdk4Sr2x8S+jhHLHTWdyktVHIEfvBs5hv5Y=;
	b=jmzbvRnjFqx24z4QPcTW7b4h44I8vOQr7+lV++hdWu1PmhGD/Yh1sxLH3k+yUEUYmNFx
	 Nb7qUaxXiM32rWiGITDwBkc5fp7Ery69Y9ltKwgMq5nTpqv0HCRt4TNjltkZzSE0W/gSM
	 7ThsLTz6XKqstKpkrijFRjksmnIR6JEXC/WLeiZqUipWTqBHrHOSIuJ7wDLyFCqRC/a82
	 XolQw6KSDIhdeZmOa5buN1XGWCFB4zyxFvcHPh/xelBmcjhwTJwKX9PfP0/HuvVApq3jJ
	 p2lJyIZF03VzGVpcsE36guTCkeAX1Z1FbUr3/Nle6QT72HTKcA4xBa9/wRZTBYHquSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=dJnL6VCC;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B38606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B38606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=dJnL6VCC
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48fd2e38825so608615f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793987560; x=1794592360; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sHP2oF/bjdk4Sr2x8S+jhHLHTWdyktVHIEfvBs5hv5Y=;
        b=dJnL6VCCzjqn0HtRC+I0cQEvdVy8RK/ZpiYGX7AetqpS0imrsttLKo2pQBEoybw7e8
         ENPuVT194VNF4IeFX/wZif1U51zIXWpNbWI00p5B/+PRnVir1l4rwzP68+oOvP+/SgbS
         zVqufQTjDULfOG5tkwVwwFfWNRWAqcOjYMvpe8OlRKoeR2O1d7OEVzPc1Bu/oMKsvpTj
         m/3TQPrSIf3uvY0fyaO32bnslN4hSxIXT1uho1hgilMPZR9BPPWi60TT0YBi6XFGmsP/
         vnRD/QTwwe+n08dhenpHMbEuatW5H9thqPSYqxhgb7VdzJNU43hNzmxfH2kqdAE3b/iN
         XkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987560; x=1794592360;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sHP2oF/bjdk4Sr2x8S+jhHLHTWdyktVHIEfvBs5hv5Y=;
        b=Vx4qEK9E1dxknenQAeY5WxYJ4A8jgtLJVubVSb70aHRN/604ugXIAW4pm0RFid6n2T
         UI/bbmn56pYpImAuuwuhdj+rFcqRUjob8bGjKSIEM0c+tqeyGaOyopNxP7mgDI7xRAKR
         TcR3GFWpN1hF9ITfhRSBTvsFfhf5QqLyx7xTsUnv0jyre2Tq/+KUhLuP/u0Jt3+1Th3y
         yYiriyLaYrxqvAnYhp3Qpv5dFi5Vlgn0KvGN6Md04Oy4Qk/tgmwqrfKibRnsOVDzFD+k
         laVTrKrqXSAEx6OjoFBv66AtH35YSsa3ljlWZev8bRRXPo3anlZ+2YDv+dKLSsxv5UTO
         YYlA==
X-Forwarded-Encrypted: i=1; AL+hErEXi2uyiHRAqiS5Ii7l70cAQEQB0FuMRFNb6zfD66xHWX9tqbdCdWurx6fJMN/Zmzb/fe+EBI5UBNm+StI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bdEO+WYtQbqkiqVsO7IWO5pp2CiZLuL1lFAvbuX+g/LjUM2Ai
	V0u7EQcH4rT6U5YQ6Uz2jKbOr/tDKD7iy+oqtDOM7ahwXPmODNMXtRU3jAqdF/85V8SN3sH31hZ
	Ag4Fu/ETV9A==
X-Gm-Gg: AYBFou0EE0+mVl0WOI9vD5SQyXHESJOzZnqOSVDtU1hpRH2+gQe+mfhdoazrwy4YM7J
	/uv6pobqPN4kB443Q/hdzxsr30oNLHRZ+Q/V9Mk/xNLrmCJsjf3LWH6DyyBmr1Q/43EQhkHWqPL
	XJtY/0JS3Xk4rAPSQ50RR8nMmsS4s7ao7EAJ7ykqS/0WmnHmHyUJRb9RweH31ZkMvjKMiZu1BvH
	ixXRcrYEB36yLYDcWhzrstsoje7HYTuESMs5WwgearuP7iJSIB08jQfTszHshAze4QuWZdNwZJ/
	C9UfU+cqbhfPpMr7IIamDb9AiGmzbWY3ASGJ4JyEBJrUMto7sZ3KyGv+wScNPYgvXYm0V9rmqqp
	nFon8cnAEvMxha4lKUmK8HWtRRM+1+6b+tJKGAD/CHNysE4Rz91+ktjLxfix8vgTZiXt2oWLlVU
	tflYmO6bAiJmt4Wy5tgxFHkP2D+ZsuhX8dh9q1G96RI6qcFoS+iozRIblzBHZ6R09JupFZFE176
	Zglwh4K52F+hkRhjYLsg1vPHJ9FtQCTPSGsx96zcG35ajdQtr9qnOXbzRbCX9gOGeaoKpagLRkR
	CrEERuMCYyuO8XBlCmkBPBeDv5oXeh7HwOjfAuejuzORQqFhL78/t8zwLRpSEkeU/hs11HLzRTz
	/bvm+3PQ5VA==
X-Received: by 2002:a05:6000:4b17:b0:48e:4561:8a17 with SMTP id ffacd0b85a97d-49275fe4f50mr6153448f8f.16.1793987560021;
        Fri, 06 Nov 2026 09:52:40 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d6382dsm4427671f8f.19.2026.11.06.09.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:52:39 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 06 Nov 2026 21:52:35 +0400
Subject: [PATCH] arm64: dts: rockchip: Describe the Type-C port on RK3576
 EVB1
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
Message-Id: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm3S8jMQr2JcMGMHqgmaKRATw
 t0ZZfkt3tvAJKkYXIsNkqxq+p4y+FJAGPtpENRHNpRUOmZymF5V0zqU1TOOi/mKGYkkhhjrvqM
 OcvlJEvX7v97up23xTwnzbwX7fgDI0qS2dwAAAA==
X-Change-ID: 20261106-rk3576-evb1-husb311-00efcff4a808
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5103; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Bsdyugnk6OoKTZGf3182OVL5hFUwb7G3DqCpOh/DVH8=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9E356PT+1Oc+onVHtN5c/m+fkZfEfbN/o3K4unBac9
 spw9eeVHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1piHD/0jlzK8xASsOlqnsPih7Ujw6X1Byvvb29dkyOWdP9cVbqzMynN3n+Cw
 3NoajdvvXrhNybAnxvYlB1670fhav3FKXwf+WBQA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 CC
controller and a fixed-voltage VBUS supply.

Describe it in the device tree, including the wiring for both the USB and
the DP side.

This makes the data roles follow the Type-C port's negotiation, so the
port stops being host only. It also leaves the VBUS regulator to be
managed by TCPM instead of being hardwired via the tangentially related
phy-supply on a USB controller. DP lanes are also muxed dynamically by
the USBDP PHY based on the Type-C port's negotiation, so the hacky fixed
lane muxing also goes away.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 150 ++++++++++++++++++++++-
 1 file changed, 147 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index f83d129f96f1..a9b27cdb2dfa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
 #include "rk3576.dtsi"
 
 / {
@@ -334,6 +335,22 @@ &combphy1_psu {
 	status = "okay";
 };
 
+&dp {
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dp>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy_dp_in>;
+	};
+};
+
 &gmac0 {
 	clock_in_out = "output";
 	phy-mode = "rgmii-rxid";
@@ -772,6 +789,58 @@ regulator-state-mem {
 &i2c2 {
 	status = "okay";
 
+	usbc0: typec-portc@4e {
+		compatible = "hynetek,husb311", "richtek,rt1711h";
+		reg = <0x4e>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus5v0_typec>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "source";
+			source-pdos = <PDO_FIXED(5000, 2000,
+						 PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
+
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0x00001c46>;
+				};
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					usbc0_hs: endpoint {
+						remote-endpoint = <&usb_drd0_hs_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy_dp_out>;
+					};
+				};
+			};
+		};
+	};
+
 	hym8563: rtc@51 {
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;
@@ -944,6 +1013,14 @@ usb_otg0_pwren: usb-otg0-pwren {
 		usbc0_int: usbc0-int {
 			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
+
+		usbc0_sbu1: usbc0-sbu1 {
+			rockchip,pins = <2 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usbc0_sbu2: usbc0-sbu2 {
+			rockchip,pins = <2 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
 	};
 
 	wifi {
@@ -1008,7 +1085,6 @@ &u2phy0 {
 };
 
 &u2phy0_otg {
-	phy-supply = <&vbus5v0_typec>;
 	status = "okay";
 };
 
@@ -1051,13 +1127,74 @@ &ufshc {
 };
 
 &usbdp_phy {
-	rockchip,dp-lane-mux = <2 3>;
+	mode-switch;
+	orientation-switch;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usbc0_sbu1 &usbc0_sbu2>;
+	sbu1-dc-gpios = <&gpio2 RK_PA6 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio2 RK_PA7 GPIO_ACTIVE_HIGH>;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usbdp_phy_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usbdp_phy_ss_in: endpoint {
+				remote-endpoint = <&usb_drd0_ss_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			usbdp_phy_dp_in: endpoint {
+				remote-endpoint = <&dp0_out_con>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			usbdp_phy_dp_out: endpoint {
+				remote-endpoint = <&usbc0_sbu>;
+			};
+		};
+	};
 };
 
 &usb_drd0_dwc3 {
-	dr_mode = "host";
+	usb-role-switch;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			usb_drd0_hs_ep: endpoint {
+				remote-endpoint = <&usbc0_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			usb_drd0_ss_ep: endpoint {
+				remote-endpoint = <&usbdp_phy_ss_in>;
+			};
+		};
+	};
 };
 
 &usb_drd1_dwc3 {
@@ -1079,3 +1216,10 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_dp: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp1>;
+	};
+};

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-rk3576-evb1-husb311-00efcff4a808

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

