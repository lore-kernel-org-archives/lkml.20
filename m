Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339051;
	b=U12RuIWlDesbDhUAHYfL2VV4/ukgGNs10h7U631/y8LhFUoIKHnRDOZayxR3Aq/K0KeR
	 QAmoVdkyUxj4DCr7NO1G+0nmz7ICTf+nA/oxmt2S16pIqoZZUZn1gbuVOSbXWSN+yg7b1
	 saBBjbF/9ed/kFc0JzhA6ayoME1e6fDx6PnwpADsjXCz2a07MZG5EPcq9cOQHq3UvR+ge
	 L7spMw59M4p+ErF6zdtEaUZm4dNbmdMwzTvuAKfg/xuLg6C0UYtyRTuJmzhXexXU2YR0h
	 QRGiRjg3BsQWIgPPorv3Xs5ip448kntbhFxqIzRLtC/vwez5GlqoLceO8qrZt45QtMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nvA1lxZEpIqjWhYL3aA6OSO2sYeOAGbwAuUAZj8n0+c=;
	b=Azs+PBcZaohLPytcdCr+2/Qyb9T0vJ1MpM5Dm3HTIf+u/VtFOeSM53vdKKK7PJm0Mksv
	 zH+N84Tuop31sB4w/4jkuchkKOXVz+SJPbj6T3KIYhYfI9jck8xVrmvtbC1Ipp7ohPqPq
	 9w9Nx9lF9Sh5TPJre/O12H8DMEbvlF0ujAlg3vwCtRNcrWK54A1ha2VTux/c1fK5TUzaL
	 0KhndsXQ9ATiYxc7lxLGqp9mNtSXwK+XhZbFELVQIzsP11oW4e+F3mQWe+h6NrIivGIM8
	 WcFGI2M3K33kUGv6C1aI+rsyxkTE4kCl+MR7RIBJ3lt0V1TThpBlas1wgMfl0e4dRPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h6bqoH7V;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36389606A335
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36389606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h6bqoH7V
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36caa19b0ffso1636296eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339049; x=1794943849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvA1lxZEpIqjWhYL3aA6OSO2sYeOAGbwAuUAZj8n0+c=;
        b=h6bqoH7VMNzR1Uc8o0iEVl0dIWWYMzwCTv6JFmJwsHvXwfnuMX5+S6eMyAsWfiLx+l
         maYL1X56Wenjg94aCeWnt+n3mUhiGzVA6W8phl+vz6gAgnJdhIg1fMSR0g7Gycs9kZys
         YaB5rn2nBFLXFSAqlVsBpZtSZ8bWKK2n67cBTXOmoWOfULksbn2//xs5yDHaK5aAZzJI
         il8OBSG0LJ4l7HKAGKsKpMvhugu16sV1otQvL7/0rFlvQ8W8JxhwRP+7isSixfkh80yr
         QBZ3DnUerdp1P7LLemzkt9rRw25skVMLMy377c0vHVjyQctiuK5N4P0+EdYXcaR2z4y1
         H0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339049; x=1794943849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvA1lxZEpIqjWhYL3aA6OSO2sYeOAGbwAuUAZj8n0+c=;
        b=2TlqccK4rrhdrdw8rZmElD1ip+ADpJP6HvXgzk20TNX7w56w9YyfU9pYE+XNAhz/EL
         3jwYKH9fIvAxceRSdyRC8zpTFrsAoIYXi2XUuhAg5qtmrH24CuBRCbXEYxfMG3Sqgtk/
         Pg7bfMoWR86p+vbTHrKqCVAk5IKEtLxFXyV8DCikkpXgioIM7U6hDhzMSFYTDESQ995E
         XTJcE/5eHTCZgIsekvHjM55tPCqNXOENExa6n/uyiwXIVzzw2NaY3Xlgg91jCq7KSLmo
         /v3nzvU3DqSJ6ePCCLycpucLelerlhckheTViKiB079hVmBxhZFFUOulG3KGe+Lkvwup
         FTcQ==
X-Forwarded-Encrypted: i=1; AL+hErEcIYGBO15ovD8633KYtMeS/gImVglHWZMdweMAOHniniKu2of6ZlkeWjv+e9G1iV4XK4ANg+jrWzI/984=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TIaCprr0QADSm8NH5FXN9M5SkdtaQURnpsuUbE+aP05pEEPZU
	sDTV6Mhz3B3thviiiQzwQypg4SR+f8P96kD5NwNkacZSrD8HIFuhskC5
X-Gm-Gg: AYBFou1pKCeXDFSPnkvq/ytfwr2FTo+I5mK3DHMQgEb6K4RunPn/PlVD9oEAh4wtMU9
	saxYPPhvWPyRqDtQJzuBOV57CdLukxmzkPbh/VoGFEKyGhedFsFF6C12aC1UpGSomlDhHXdW8zB
	N292O1fFmXdj1yV6eELOppdX4zgm7/2Dwps9Vyz5YSPNvZ0BaBZNiMMLEa46QYpbn28oe9zklMz
	fNg4R0WzrpzD4slHLSVX1Fq3SbPVxvrYHFGCYCjbvQ1gbGZ8hsmpPt4zI4PWEojo5HqNT+OJLKE
	w0uZcb7UZFp2Mn2A1E9mXO3awN+1y80zcCu1h7X0sDgA82oX4cBT0z+rllsktciu3GwB684ElmT
	nEjh3qXDc7jbPFsB1NzCjqqY4+5zJaZ8VOwPpIG2y8L9vf8qTFBj25rc/f2JQN42BXn4ke8Prbw
	0KZseSSvUNZMpqQI3zCodAxbCU3tayq2AD31/o08sG6H5FhjNQ8oDX4wBOtfwqF2hs9NQ2BjPNs
	8XHB3dAqcnc1WCVJa6MPsMe8BIrzd2toGqFfUV6CtDf3rgoVCD3PUaRzOj452WBHv3u2z0EdXPY
	j1BrtFO5JYqscOJ0COMl4bzI1bfoll7enFnBuHAGy/KeiWA9iQ==
X-Received: by 2002:a05:693c:8814:20b0:36f:4615:9747 with SMTP id 5a478bee46e88-37680a5d9e4mr395559eec.0.1794339049150;
        Tue, 10 Nov 2026 11:30:49 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm7730435eec.0.2026.11.10.11.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:30:48 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: rockchip: add USB-C DP altmode support to LubanCat 4
Date: Wed, 11 Nov 2026 03:30:28 +0800
Message-ID: <20261110193028.512456-3-cyan2254650260@gmail.com>
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

The Type-C port on the EmbedFire LubanCat 4 supports DisplayPort
alternate mode through the RK3588 usbdp combo PHY (usbdp_phy0).
The sideband use (SBU1/SBU2) AUX signals are routed through two DC
switches controlled by GPIO4_B3 and GPIO4_B4.

Add the DisplayPort alternate mode entry (SVID 0xff01) to the USB-C
connector and connect connector port@2 (SBU) to usbdp_phy0 port@3.
Configure usbdp_phy0 with mode-switch and sbu{1,2}-dc-gpios.  Enable
dp0 and connect dp0_out to usbdp_phy0 port@2, with dp0_in fed from
VOP2 VP1.

Tested driver stack registration on LubanCat 4 hardware:
- dw_dp bounds successfully to display-subsystem;
- DRM DP connector card2-DP-1 is registered and reports disconnected;
- typec_displayport registers the DisplayPort altmode driver;
- usbdp_phy0 registers the phy-switch and phy-mux.
Physical DisplayPort link training and monitor video output are pending
verification with a physical USB-C to DP sink/cable.

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index a94aaddb2..6c5a942df 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -323,6 +323,13 @@ usb_con: connector {
 			source-pdos =
 				<PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
 
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0xffffffff>;
+				};
+			};
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -342,6 +349,14 @@ usbc0_ss: endpoint {
 						remote-endpoint = <&usbdp_phy0_ss_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy0_dp_out>;
+					};
+				};
 			};
 		};
 	};
@@ -857,6 +872,9 @@ &usb_host2_xhci {
 
 &usbdp_phy0 {
 	orientation-switch;
+	mode-switch;
+	sbu1-dc-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
 	ports {
@@ -878,6 +896,22 @@ usbdp_phy0_ss_in: endpoint {
 				remote-endpoint = <&usb_host0_xhci_ss>;
 			};
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
 	};
 };
 
@@ -895,3 +929,26 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&dp0 {
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy0_dp_in>;
+	};
+};
+
+&vp1 {
+	vp1_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp1>;
+	};
+};
-- 
2.56.0

