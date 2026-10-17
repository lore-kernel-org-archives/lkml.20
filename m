Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A86F3E4C73;
	Sat, 17 Oct 2026 19:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792267193; cv=none; b=GqLGqM9FlD8fSqycu5vrr5o3yBsfpukAMuTFhO2uzIzSxJqRoLsAz5vW8ph+rUfwjwXVxYDZNs/eU3QKhOR9TwM9aAsQC/N5h/NkLWrHUURYaz/o1x53qdXNl9yIbNoKwVtXGldBFO+vPHZHhYVaTEUq+muTMMPGyoMa74qVR9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792267193; c=relaxed/simple;
	bh=+6ab4j5pULnioyjf9KjqfoRx6zMzXZXFHhGISy191/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L54T7TaKugwWucFQA+yad9NKgPWlgPHpVEqMuVznrylmQ7JmBCw7hvQ0yMO83dQDuuAXoCmW94QLcJzYpW0g69+cQ8ogqH0dOdNzVaZJHrb/u7eURzQWQt0WAgIy3fNyhNE6sFaYk3tzJeEcAU6XE9Moj6Xe0kk1pCNxGCcnBhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5iauik+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5iauik+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96241F000C4;
	Sat, 17 Oct 2026 19:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792267190;
	bh=b6x/Kp8xOi2aUY+TLz4iRPjIWQvgBed14O02Xbi8Tng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D5iauik+evaorGOYj4sTRWa1Mn7lwhLPMj9SKBO9V3RY+iXiOWGym0uB+kC/S7s7T
	 r26g4Hu764goQ/4TWIVS7v7Bb1owWqP8DAMWyfIi1GH4+/TggUNF0pRyGUvoer1AGY
	 mFqo2DYe9VrYbyT+FNlHij94IpcMa0puJu5x4urgJeqnWZzCtV1rCfThhuXLaa2vmw
	 NqPKBcz9a3LO33t6167UOc+T/CJYWBo+Fdd3j+i5LWxM/GOAidzqVpK9g/rvNQormf
	 aGTC4M9IXbx2PAn531xXROlP14NyaJB9fHUtEvxDtvAsQUCxSgpPEBb/WPI9XMGxHZ
	 3bRLlr3rSHLOw==
Received: by venus (Postfix, from userid 1000)
	id E7A72182306; Sat, 17 Oct 2026 21:59:47 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Sat, 17 Oct 2026 21:59:31 +0200
Subject: [PATCH v2 2/4] arm64: dts: rockchip: Use DP AltMode defines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-dp-altmode-dt-defines-v2-2-7ab3d93553dd@collabora.com>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4775;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=dLj06PdzaXoQ/MRztpv2FwAR7EE6fTRcz9YTkVy5hGI=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBq09OySAHuIBLHkMu1s6kq+78sFM5J65mx8MQZB
 EZ4KpzUmayJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCatPTsgAKCRDY7tfzyDv6
 mqTcEACbBNsJys1DCkaI4czEAGO5tVlrGHdYky/SWK9bnJbDRfX3uS1NoEHAFU3eug2B50dfAY4
 m3GGe9hZXURuTkLXDotsV0SfUFqxhMJSnu/Qll6d6/oBR6Dv3DvzJEyMGKOFnUThyF3Li6NFemQ
 gyo9Ug2i8npsvF51xu8TFoAIbySH0GoemVMEdC6Nvmulnb8aI0tEsfl8IZ730gtcBYEmV58nrpQ
 oSXUW4z6GSyfbUNVQRcwtukPL6G9JfgqeN7DMvvaX3uMEGxhqlAr1pqEQCCQ13eKUP1ip/lrT7p
 WT3A3aCFVCpGo0d92WvsczaexxaveYWfYtQbiygn4iwK1Ag6simds/csZfel0nDjW4/j8dvXnl1
 QTDf9WboQzd4VhA7LD6kzZ0ZV0Zt3kT1qoCHyDwFrA3IlpUnK6ssmMIFOUeACw+Ljz1rOl+Eked
 VCdGI3mrJhkTSqzhk05qAEGsZbLUB/D9sIsw3ee9CPY7Z+xGteOa2ePWqXbID11YQM50MEXRL3B
 OWQ5YQY+aJvCsUPIrgrlDLp4jHT4sspxpz8LYZn4qP2oXcWLrS0WCnlGFYd2gAjHxSnv5qfFJR/
 7c268bhni2fvFZwdo2P18uWY4sC4lBaI+/A48qVzYDYhuZzabHBgzP41yTQExTzlnsEM2KafvOb
 mgDMrxeH3tQkjyA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Use the new USB-C DP AltMode defines for the SVID and the capabilities
VDO to make the DTs more readable. This also fixes up announcing
0xffffffff, which is simply wrong as that allows using the port in
upfacing mode (i.e. the board receiving DisplayPort data, bandwidth
above HBR3 or pin configurations not handled by USBDP.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 8 ++++++--
 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts        | 8 ++++++--
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts         | 8 ++++++--
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi      | 8 ++++++--
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts     | 8 ++++++--
 5 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index 358dea43f9b6..621f786147d5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -911,8 +911,12 @@ connector {
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
index ebb231271e45..d154e9037ed0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
@@ -204,8 +204,12 @@ PDO_FIXED(9000, 3000, PDO_FIXED_USB_COMM)
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 4ac4465e39a5..e457fb37f3b3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -711,8 +711,12 @@ connector {
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index 13aaf63ad093..163ad7eef4fd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -346,8 +346,12 @@ usb_con: connector {
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index ed36c27c2320..8f6f32ee2074 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -392,8 +392,12 @@ usb_con: connector {
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 

-- 
2.53.0

