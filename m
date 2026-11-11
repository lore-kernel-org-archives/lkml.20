Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794381591;
	b=uTPZ/SA1keyBT8YE0kcpnm0X8UiJgVMtOM1Dp3t+tyNg6vEdBF7kJns68ybz5H4knh+X
	 TcnRCzFKjLZqKMn+KsFtLz/D2H1LFybv2MWX+8yWmSAwdnT/a8oOaMOTuFX9qMm4J9X0J
	 4e7pss/+4cDiSYDaSyUNcsu6GTEJmy2rC2JV5pShSZdzQ1oPISrAMxwL7NmBuBE1N4ik5
	 R1i0j8tXPJ5W3MJ83BWxt2RZ+ETcXE7frDj4pqQ8zQX0ZqQrtWxuulxqx2879iq4oqL6u
	 EaAZ1+jN5qA70LZzmyL7dDk5cwz8vAmfXp5jl5aX5y47stf/V2wbFG1qjxSLivvM+MQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381591;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YwK7+1UqWk4ojkj/WS9d6dJgOXvbwrx78qaJQutBsIc=;
	b=fa+dPwIkKNPFv0z58Z2L09j9cJPgAzQ92UwixE1/U3ayzRSFfHroTtG+cU6tB8mYpXhH
	 6UEunnJRqiwifx+XqygsY5R8XrMVpc0WrQ1xsH4aXu3EjMFTgCZSn8OEmwTmsNGN7Uy1j
	 R4PS4kP6l9cuZRS686NQB76CQLWYK4mB1vF/n97x0NY02sicozJC0/Yt2iD5UJ0sI6duY
	 9HE9frF056oY1Gov28BNH2YPVHBlw7sLoRk686mI1bdGEgmckQXdSrBuBrJfbf7wWv9oK
	 /pjfCq9e+A3+YPsX7+OWNbyDihcpCKYpTJMh9W4QlJvsp7CsOXO8qElnGYC4AZz2GEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5aj7FjN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB07606A334;
	Wed, 11 Nov 2026 07:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5aj7FjN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794381591;
	b=mZ6MrDTWd337PwTpxS10xVkVMMr2ivFdcbpnZCka9T1ROpFelngCsvmdMgZHgX2DSzPG
	 wW6wOvt/W66a27NudQTmLlBgHBpJF77ES9WSSYy69gA7CmQaWc6dF1VQpXNeRG8qkWXf3
	 n9SKsAhQzU0IExZIebAMdhHVSEYEpWOGnA6kkk0jqTmm5JeUT+A6OkOwfuaU9Wcf6z9sb
	 ZWPNRO/iFbF9tMOsQvWtQVc5j0NUNSi5P+jf7ElUIMMZ7n+d/E64is2E4GH/X8WnokAJu
	 Ir2n0lISTnYTIIVTXBTmDSnKtjg6flH/6vmC80guuTao0vpfvlHJ3XDdlVO5lvL20lg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794381591;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YwK7+1UqWk4ojkj/WS9d6dJgOXvbwrx78qaJQutBsIc=;
	b=sI7mvGG7dAsLZn9nvRwGYbjfBYDvvxxHUxNiFIew9vA1qVGXfaZN9CPGzMBug0YGB9/l
	 LaGc9dYV3yji0glU6QXtwkQrAEQ4IxoD7ICRHSczxcQXOaMkYqZqTPM9p99Xljrzsg/ZI
	 5H+AN+/qWlKv8VBFMqhqp+7TLwVj64pGt+YeZf4ZDQD9edWTusOMTBbcm+f3hXFBTt95i
	 2Vw86i6qZmJzvt7dSFId0XPkXh5JSNg8X/R7Pu2jtdBERDuO3ras/U5sEFOjkfTk+UhoV
	 PBvM8FiAMiyYXb4CDEZGsECPxLeC8IRjQ8zFVOuj0p/ROSpZDlP4z2+ouusweZ/FhDg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57E781F00A0C;
	Wed, 11 Nov 2026 07:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794381591;
	bh=YwK7+1UqWk4ojkj/WS9d6dJgOXvbwrx78qaJQutBsIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=k5aj7FjNHeJ4SA7Jiew/Ew2ULqBEIdOuc2rZOahGSqFAQhlXDOXB1n7DSS7fn3ttL
	 ZJGPx+fYF/s05itnKv8AeVjfBMcpsTtqbKWafiMR2UW0AwipBe+6ac/p/RJqW4ASSv
	 PFFjY4B0FGXIe9Vlva6Y7UZzOiXqGvWmzAdSKzEaY+fW8nyS/OCc0C58qwdBYy8UlP
	 XzexNTAPgxrV2pP5t39Aah6RVRBTxbGISEAPUr0LkeC4Wn0pCN5gxbtFFv+3NjoJ79
	 7E/m0vq6xXsV44fDqVjkXMo5+50nvKPusAfRgUEnTdneIax4mVzT2F6wtQZr1QCKLZ
	 ahhPiByOf6PTQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D7F8D48E53;
	Wed, 11 Nov 2026 07:19:49 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 07:19:51 +0000
Subject: [PATCH v2 3/3] arm64: dts: rockchip: Add USB-C DP AltMode for
 Orange Pi 5/5B
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
Message-Id: <20261111-opi5-dts-v2-3-821f666418a6@gmail.com>
References: <20261111-opi5-dts-v2-0-821f666418a6@gmail.com>
In-Reply-To: <20261111-opi5-dts-v2-0-821f666418a6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794381589; l=4241;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=+xmGbI4GlMgBmPGKtTKnBGXbYPlqe8bWAMPWV4cMo58=;
 b=pJSxnqXPHWE/DGEVq8RVNNqkQWtiza4re7OlmVFh8PI+rUYmBpLFpcD89rKOTN+cg37d8xfY8
 SbWHpGcldphCkjzI44nn39WNTgdmCP8F8ghkKREnWXLAnG6S3bso41W
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The USB-C port of the Orange Pi 5 and 5B is connected to the RK3588S
USBDP PHY0, which can mux two (pin assignment D) or all four (pin
assignment C/E) of its SuperSpeed lanes to the DisplayPort controller
DP0. The SBU lines are wired to the PHY's DP AUX channel through the
sbu1/sbu2 DC control GPIOs that are already described.

Enable DP0, route it from VOP2 video port 2 and describe the full
USB-C graph using the USBDP PHY ports scheme:

  port@0: SuperSpeed lanes to the USB-C connector
  port@1: from the DWC3 controller (SuperSpeed)
  port@2: from the DP controller
  port@3: DP AUX to the connector's SBU port

and advertise DisplayPort AltMode (DFP_D, HBR3, receptacle, pin
assignments C/D/E) on the connector, so TCPM enters DP AltMode with
DP capable sinks/adapters.

VP2 is used as on the ROCK 5B family, leaving VP0 for HDMI0 and VP1
free.

Modelled on Sebastian Reichel's ROCK 5B family DP Alt Mode support in
the Collabora rockchip-3588 tree.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 89 +++++++++++++++++++---
 1 file changed, 78 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
index 7c1fd5905553..52f5005c738d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
@@ -94,6 +94,22 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 	};
 };
 
+&dp0 {
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy0_dp_in>;
+	};
+};
+
 &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
@@ -143,6 +159,13 @@ usb_con: connector {
 				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 			try-power-role = "source";
 
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0x00001c46>;
+				};
+			};
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -150,21 +173,21 @@ ports {
 				port@0 {
 					reg = <0>;
 					usbc0_hs: endpoint {
-						remote-endpoint = <&usb_host0_xhci_drd_sw>;
+						remote-endpoint = <&usb_host0_xhci_hs>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
 					usbc0_ss: endpoint {
-						remote-endpoint = <&usbdp_phy0_typec_ss>;
+						remote-endpoint = <&usbdp_phy0_ss_out>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 					usbc0_sbu: endpoint {
-						remote-endpoint = <&usbdp_phy0_typec_sbu>;
+						remote-endpoint = <&usbdp_phy0_dp_out>;
 					};
 				};
 			};
@@ -250,9 +273,24 @@ &usb_host0_xhci {
 	dr_mode = "otg";
 	usb-role-switch;
 
-	port {
-		usb_host0_xhci_drd_sw: endpoint {
-			remote-endpoint = <&usbc0_hs>;
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
 		};
 	};
 };
@@ -267,18 +305,47 @@ &usbdp_phy0 {
 	sbu1-dc-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
 	sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		usbdp_phy0_typec_ss: endpoint@0 {
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc0_ss>;
+
+			usbdp_phy0_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
 		};
 
-		usbdp_phy0_typec_sbu: endpoint@1 {
+		port@1 {
 			reg = <1>;
-			remote-endpoint = <&usbc0_sbu>;
+
+			usbdp_phy0_ss_in: endpoint {
+				remote-endpoint = <&usb_host0_xhci_ss>;
+			};
 		};
+
+		port@2 {
+			reg = <2>;
+
+			usbdp_phy0_dp_in: endpoint {
+				remote-endpoint = <&dp0_out_con>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			usbdp_phy0_dp_out: endpoint {
+				remote-endpoint = <&usbc0_sbu>;
+			};
+		};
+	};
+};
+
+&vp2 {
+	vp2_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp2>;
 	};
 };

-- 
2.55.0


