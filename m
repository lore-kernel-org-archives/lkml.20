Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52FE58123E;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964435; cv=none; b=EOAidjks1yZ+RPYw8qZxE0AtQTyC6BY89moD+Pb0GVCZtsOashMi3+FwIY2F/enOmE83WPYSfEfuP2wQN5i4a8n2ni2kvnK0BvioXgIqdcsLL/NTkMA7tXKi0xedeMwmDS3OExDlhK0aDAfwy+LLv7gi0bz9v8xHAzKFhRiRkGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964435; c=relaxed/simple;
	bh=rssftvIB7JoeWgPHfSiz0eTsk9hUcMMvgkEOARy/pIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YehKCmi95wykpbEL9Pb71ox0KHyvuzFSZsLTSW7+SH82YN1cqUSR3kjS1Yi9K9O5SvpcRED9welomQ6klSnT+8ma1v8X2nJ/XodY73l+xpPfsM616KNlo7zoCMclHHbVoQoTctGwr8ENiKWgyaoRUXmWfYt28MgYMUBki3gohGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAdba5f+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAdba5f+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7355DC2BCF6;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788964435;
	bh=rssftvIB7JoeWgPHfSiz0eTsk9hUcMMvgkEOARy/pIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kAdba5f+RakFKdpMriPx1K93vIY7A5TJlvMhh9DExtsyDexUCDVEZ418E4+NoahYY
	 B+E6TRxpMZE2szTyFudEjcHwoWMqIC66u9usikNxZXkdY2/XsNi8NMSHxRoAlpglF6
	 XIxrLtBeIkXvjoZ2UTBtKPxllGpu7rlVUfuXk+e/JbF1PL+E1IVU0940hfWm/eyNUg
	 +EVveEAWOp/hYZqxk86WoK0S2FPa7wGAWa/iH6bunGbxF5TunBTQabun3ZhrIAddlm
	 RU8ymDtID0PhONxXkPI0q19A+uDlt8JhqaBJXM3k2me9MN4WnOMiEuMlItMB+uoVpx
	 Hu8hzilLcI5AQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8DAC79FB7;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Wed, 09 Sep 2026 22:33:22 +0800
Subject: [PATCH v3 1/5] arm64: dts: rockchip: Reset the NanoPi Zero2 PHY
 from the MDIO bus
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-r28s-upstream-v3-1-ee3e1a34a353@proton.me>
References: <20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me>
In-Reply-To: <20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>, 
 Andrey Korshunov <razor1702@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2540;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=Uf1K3l1f7dmnIbSjn3YINB58f9z+/Y2KTLHOEJQ3J20=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqyFeYF5wTYZZufNc3dv9ruWplDnsHhyx9trYu0Lv3zrE
 u3q4vToKGVhEONikBVTZJHdVB0ptCp6ZhGL1HGYOaxMIEMYuDgFYCIvgxkZukw3NQa+aF/TeMRv
 6UcLK3PfqOgfIS5GTAs2Tt2+6M6XWwz/tH+27+k/yZp+dYfyf4YzmlpG4X+yPcw2WyzvS5Y0qw9
 kBwA=
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Reply-To: HystericalDragons@proton.me

From: 安容 <HystericalDragons@proton.me>

The RGMII PHY reset is described in the PHY node, where it is applied
too late to be of use. __of_mdiobus_register() registers the bus before
walking its children, and for a PHY node without an explicit
ethernet-phy-idAAAA.BBBB compatible, fwnode_mdiobus_register_phy() calls
get_phy_device() to read the PHY ID over the bus before
phy_device_register() gets as far as requesting reset-gpios. A PHY that
the bootloader left in reset is therefore never found:

  mdio_bus stmmac-0: MDIO device at address 1 is missing.

This happens with mainline U-Boot (generic-rk3528), which does not touch
the pin, and leaves the port dead.

Describe the reset on the MDIO bus instead. __mdiobus_register() asserts
and releases the bus level reset-gpios before any device on the bus is
registered, so the PHY responds whatever state the bootloader left it
in. There is only one PHY on mdio1, so a bus wide reset is equivalent.

The pin is muxed by the GPIO request itself, but keep gmac1_rstn_l
described: move it to the MAC, as the MDIO bus has no device of its own
to apply pinctrl to.

Fixes: b944112abef4 ("arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2")
Reported-by: Andrey Korshunov <razor1702@gmail.com>
Closes: https://lore.kernel.org/r/20260909134716.879-1-razor1702@gmail.com
Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
index 97d85124d2..f3e543d261 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
@@ -215,7 +215,7 @@ &gmac1 {
 	phy-supply = <&vcc_3v3>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_miim>, <&rgmii_tx_bus2>, <&rgmii_rx_bus2>,
-		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>;
+		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>, <&gmac1_rstn_l>;
 	status = "okay";
 };
 
@@ -242,14 +242,13 @@ hym8563: rtc@51 {
 };
 
 &mdio1 {
+	reset-delay-us = <20000>;
+	reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
+	reset-post-delay-us = <100000>;
+
 	rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0x1>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&gmac1_rstn_l>;
-		reset-assert-us = <20000>;
-		reset-deassert-us = <100000>;
-		reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
 	};
 };
 

-- 
2.55.0


