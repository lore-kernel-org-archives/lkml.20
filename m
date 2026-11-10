Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295175;
	b=kLofFTE5h1ucNhz9fIM6RdS4r1wfHuogZaEYNiJfwhRdmLAjoqV3EYdgTHP3+YuIiwNx
	 feWHoL4HmP+BBJWGbQ26R1Yqt6mYEpOyhggt3uzs0uDrxqI0c0VwXGldMrkuEfM6KUU1u
	 jc3VevYFmcqePFBGOaYlJiXbPgZU+AELkZSXgSPcCnvbTqmIbX1NY+r8YHaxWC/llTvAg
	 yQJubRoUExj+yf9ulPmDCSwuDiVUMcyBo+JpZJspiTYQeUiSifqyBh0/PqaI/gPUGnJ/g
	 Aypmaeb+7EZnuEWBIOtkHUQgCYam2rGfCH5KIMlcDKVlTKxBWZ4CpEl4BFY1v2hzoSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295175;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YwK7+1UqWk4ojkj/WS9d6dJgOXvbwrx78qaJQutBsIc=;
	b=q+jRBTzDOfcRQmc1pn5V/VRNNCFpKDGDbiuwP19CRVYYpWjwVgUW50K5gDP8dM1RkI9K
	 jfsggBR5NTY5HBvbou+tPACXEzAQjSQs7cfQwE+27WYJiNB/6JoTPqiNBz9D2LT6tNVtC
	 K0NwxRizgkUdYYl4lIjjp+ihMPsI6JTnDfVgkElPyWeVl65+0v1F+j0X/eE63S2JBEGyF
	 H3wBY1trSbESqQ4SHqQYUwdpgTRZgLnsMy4w48p8b5zTlDN9AtZzt0TybudKCZBtnzj2W
	 S2u9qzvzq7AIaAg+7lT0GLcze5N5OmPjCydeb28wpzc7eGkwrHy0D8m8ypFJNtx01oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XilKn/TZ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C257B606D639;
	Tue, 10 Nov 2026 07:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XilKn/TZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295174;
	b=rn0V2hvDmSsKQOQtvLEM2ULoenMydYReGqQW4olXKWO+7w93zMSapuvGhvXRGdrj2DTa
	 3XFwLwUZeSChTkoOl5zEe+FqJpVf2cB1OpdllgUUrq7juWJ8JxMiqw10fLIm+Ei2Gqjl4
	 EFmJVPnCD3NlukzGstdmrKzm75R3ishE5YHfwg3ud9m0pVcyPbUbgLX7bXvYCKYMnZuJO
	 IIJuEi9vuu4gdvSlKpaDmvj6lys9384ZgY7/fhshEUlSTJSDD53ZoFPk13eAH6/WSJ+K4
	 ungD6CX207ZEsSFESpm1OvVwrYGlU/EQ4GO52PVLNTLgUGYb1Ok3zoUz9+MJYWNAv8g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295174;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YwK7+1UqWk4ojkj/WS9d6dJgOXvbwrx78qaJQutBsIc=;
	b=wHaCKCLIdYQqlSdcAR7M/V5j5YhV8HMaxrCe9Fax53Z/zrw/AAb+98wL0ahJXc6/raZJ
	 WBA2TAgSc4+dV2UD/Yxu56m00atgFWSWbRMvkAu2RxB+xK5Z/SeXP3rwofa/qIlRHGF4e
	 zPXlPD1WnrCKxfLxylsguUdsFRUG3GdabThiMBtKrta766k3VdHoBUtusw/EWa4/zQj8w
	 B5HqVyXZbd4y5qioey6538D2ywZhMJoXD4jJS++P25xiopvtxF3EgbeoNcO4eNK3o6oS7
	 t0b4a3i7D2VGv4bES3GhvnRCAL4/BrY3fnN/dHNFd582Kx5uCDh8Nebo4yHqErlW4Hg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3AB71F008BD;
	Tue, 10 Nov 2026 07:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295174;
	bh=YwK7+1UqWk4ojkj/WS9d6dJgOXvbwrx78qaJQutBsIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XilKn/TZnYBx1GZ4KVzD5spU3MiHGBES8YEwY7u8bRc0Ftik+UCgyPXxbhA3latE3
	 rpLUoPrKK4aJk0N9SJTdOTA0kHCHrFnkB0a7rotNZ0zcOImDCfZ0eTAf7y0ElKxhld
	 r6tLtGs/BvEcXLjUYhiltzmUqulxp9MGJ4ADaVuhQEe+ButFe6ECIzxu69tsnFYN7r
	 BGo+JNYELrChyt2TbAQO7vW5UAhEr0njAeWXLLtMQ8ngdcNZWC+7ZOs+jNTz4Mwjt7
	 EKlv0Z7uusuJNdgF6v/zSgW3Jy2VI9Zmcoq7u6R39YikqjYkwUaZY1Z3C2r1o/T4jt
	 0WszHmVfGOANg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 42E1D489DB;
	Tue, 10 Nov 2026 07:19:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:19:35 +0000
Subject: [PATCH 3/3] arm64: dts: rockchip: Add USB-C DP AltMode for Orange
 Pi 5/5B
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
Message-Id: <20261110-opi5-dts-v1-3-582b63d074be@gmail.com>
References: <20261110-opi5-dts-v1-0-582b63d074be@gmail.com>
In-Reply-To: <20261110-opi5-dts-v1-0-582b63d074be@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295172; l=4241;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=+xmGbI4GlMgBmPGKtTKnBGXbYPlqe8bWAMPWV4cMo58=;
 b=3Jl0l/Hm3AzwagElH5K8zDZOTARddC/2ctTH7U2tgMLE8KpqBFi3pZrMhgnM4NH3zZJ1sbwJK
 z1g2+Rlm4cRA9des28Fu+HPG5hZFhvXc7gPwvnHrfUv50GMto/aWfzI
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


