Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637950;
	b=i1srou268fFx7d39F/QDPLB/qkdVMjt4EIep8q1rqJ6ef7tNY09kruPgcMApNV1fvwF2
	 nk1BYzUSqKeSJWbFPVH+piqfOljKkVUbm/RiyPUcecuSvjHXc791AxGPNXan2I+oMa7Ds
	 0VY32gj5FCcRwgOlpm8qXclggoriYK1UqFooD3VZmY6ukBmDgSJXJmQD2S74mXh+nP/3v
	 JNAqERfzq7xV+pTY3wZjalzkq2x3YUi2vfosPcxQ/jpiASW2qIU4rJPiITLeyj/Xg5DDx
	 DmLb4KTRxcbihlQqazdlAB+FzhplG0HKSQngS09Vw/BR4duuTEvDpfel+ih1W96BH6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kapioonxhfRQWTN60e84l0FnMPJ/xo6q07mXjt2TXY8=;
	b=mjgIg0/Pr437spMpR5ANgKS67H5Ohks8iHHH4iZ9Iz+HboiqVQGU1awZaAOp7A7cfZoD
	 iH1pI5ke9GyjogrpkLs8NUdP2jfbjBJetJ5dI8IsvS1B1zso5dXTeafHwbNu2JhvjM6ef
	 xJ8V/HOU0hjinxROcZBkiDX+JbR/32hAqY6WfWJxyLnO1VQXBpv4SYZWXhE7RIUy8Hl0u
	 GM3thUXkRpj2iDGyR5s9XIlNZfan4Xl01Pfv68Ii26T14BdF1HZXCoMoetiTaAlteKsMe
	 A0vLaDm2ESHtAiezYanR1t8pccqjjpEtyhe3wI7fAwNtIJlw9+b9vcoV5B1+Gnuu1IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R1JDXXUW;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFC3606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECFC3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R1JDXXUW
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-368c26de2e0so74919eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637949; x=1793242749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kapioonxhfRQWTN60e84l0FnMPJ/xo6q07mXjt2TXY8=;
        b=R1JDXXUWGp8xblmicfnnKaFFhfcJbI3R4dCopQMMP0zEG9uSxIYgfKPrOAVT+kCYBb
         62oAoPtoErqAdRIVyCbgEcBWv8eoc+rT1MV4V5kHybnuFUd0aLKyLvnG7y9RUCKrQ+X+
         ZBmXTK34HvtsVa2Qtz1xjVAGwLWMt8pAabX9IdXroII7yRa1H8V9eTNrUnYoWa6u+wOs
         gnEhtNNwOJfoyEJQCZdZKe++ZB8QC36C+Ap5uzXVGbJlJFOYFYOKHHWirfUswe/Fcmhr
         vCc5ZDC14UiWDJIfBI4G1O5iq4YuTWHjvXAYcSrtjSHKFZYj7p4XUSoJ7M9Iq4KV0IYi
         ZDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637949; x=1793242749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kapioonxhfRQWTN60e84l0FnMPJ/xo6q07mXjt2TXY8=;
        b=Y4oklKzSiU+PIq4XH15JyXXeKss1Fk6cwrGjUCbJALxSLEPHfDuze0YBy6sjgNNu6t
         sZDpI9V5PKzbC+Dj43wjZAT+13P5CPFBredvXh86oq17Mrcq9abFKNgCX27MiOiVc2zs
         i1v67aAWsjGbIa96MKoMevEW3+7PAFa5We2sxFRzgr+g+H41eUivjec9TJ3QuPrSQtvj
         PX6HwztoSeQc1LZZmeJiwvVzd18xRwlMFVDoNbsL6aY94/wlaUQ4XbkkJ0QCWm0Mrewz
         jhBL6/vPG6dtdCD11aeWRbnN4JFLxPqIVgvI8HvEUEQVz/fZkeH+Ym6jHiy7+uB0Nb/u
         EtYA==
X-Forwarded-Encrypted: i=1; AKwUvBwR1IuORvbutfDZv1OJvMt5Qz/LPSw0SASTIypjjwNF4TN8E+UkFH3+ecqRgtcFYzD5ePx/P+z+LHbbeC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBKIifCmdzPFC6HnODrjo1OQCuCFynUrJPgoK6/WupjbHw2LVO
	Qu39iQv1v+4vXdLfOcvNr9dR0RiyG+mMoJQn0/+2v5bZywAc7wy7O99L
X-Gm-Gg: AYBFou3EVb6i0P0zfFGJbtrGbPXBbdWogCROb0ns1uNtT9kEh2BwMdMIprk7eFhXAwc
	fU+MGwxD+pBt2rZ0RoUhJslH9o4ZyHhYVBzMD1YcstOzweVmzB5VrwSY1Uo/b93wngDmEApuV1R
	9l4a8ik8NYbbu9VZCZF2fFkoucpyfuD5RKXqYgsa9QIr2T2OQUsXeZKn3vh9ioiRjvSijrW4GQ/
	eFvaDlwYkOhu3yCnMZvOkBcVCku+OegA9ltJ5/92DFMRMRLKukh1E53OsJTlQFqn/pdyac9CEy5
	IGIk5exOw8zCIlDD2ZOjgXuEEFJX+BdOMwOzCfioruMSQRm32QYG2jnLSdHaaXTyZojCXPX5XnH
	XROSTa2DAEyKdGoGb8q1AmR3Fg2IhHdjqrEFuz7barDrYYE3AGlY8HqOWveoKNcMHa8OqJ6Tgs4
	JTqNjyPhe1TYh2QyZoGlU8TKZFeJ1Pqj+SsAtN1m3n0WzYGPt15+raj8TabXeBkhu3VDnL0g4Pm
	4C8MRPmjyG+RyOeG7u3CEpEdAG4sYkaLRTsJT4lqZGzMvO0satmo2g=
X-Received: by 2002:a05:7023:a8b:b0:185:fd0c:4585 with SMTP id a92af1059eb24-190a67f9f08mr5252274c88.33.1792637948939;
        Wed, 21 Oct 2026 19:59:08 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm13029572eec.12.2026.10.21.19.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:59:08 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v11 3/3] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Thu, 22 Oct 2026 10:58:44 +0800
Message-ID: <20261022025844.150320-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022025844.150320-1-coiaprant@gmail.com>
References: <20261022025844.150320-1-coiaprant@gmail.com>
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

The Ariaboard Photonicat has a Motorcomm YT8521SC Gigabit Ethernet PHY
connected to GMAC0 via XPCS SGMII.  Enable the necessary nodes to make
this port functional.

Enable the xpcs node, referencing combphy2 as the SerDes PHY.

The rockchip,sgmii-mac-sel property on combphy2 is not set here.  The
property is tri-state: when absent, the driver leaves the routing
unchanged.  If the bootloader has already routed combphy2 SGMII to
GMAC0, the link works without the explicit property.  A follow-up will
add rockchip,sgmii-mac-sel = <0> once the PHY binding lands in
linux-next, removing the dependency on the bootloader default.

RK3568 has three Combo PHYs that can carry SGMII; which one is wired
to the XPCS is a board-level choice, and Photonicat uses combphy2.

Add the mdio0 node with the YT8521SC PHY at address 3, including its
reset GPIO and LED configuration.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 48 ++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 12ae9159bea87..d9015dbfb9f5c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -261,9 +261,18 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
-/* Motorcomm YT8521SC LAN port (require SGMII) */
+/* Motorcomm YT8521SC LAN port */
 &gmac0 {
-	status = "disabled";
+	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>;
+	assigned-clock-parents = <&clk_gmac0_xpcs_mii>;
+	managed = "in-band-status";
+	pcs-handle = <&xpcs>;
+	phy-handle = <&sgmii_phy>;
+	phy-mode = "sgmii";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim>;
+	status = "okay";
 };
 
 /* Motorcomm YT8521SC WAN port */
@@ -342,6 +351,36 @@ &i2s0_8ch {
 	status = "okay";
 };
 
+&mdio0 {
+	sgmii_phy: ethernet-phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x3>;
+		max-speed = <1000>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_LOW>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+		};
+	};
+};
+
 &mdio1 {
 	rgmii_phy: ethernet-phy@3 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -606,3 +645,8 @@ &xin32k {
 	pinctrl-names = "default";
 	pinctrl-0 = <&clk32k_out1>;
 };
+
+&xpcs {
+	phys = <&combphy2 PHY_TYPE_SGMII>;
+	status = "okay";
+};
-- 
2.47.3

