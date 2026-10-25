Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792968954;
	b=verLYoZyb1r/d/a+8NZKkYg34wzh8ETxlZlw2rZbi2orGMKA/w4bWO1iq7lZY0EVduxT
	 Ip54VFXSfWoIc+cjYNYp0hjYjDRx1uTEsyJd/j8neVNwPCbVQgnQdh2Zu8zdJCiYP6jzO
	 ovwC9W3FCSCrcci1gMeajij0i4SZt11Uznctq3KLD5tj1EYCDTYCnLAX4vWPBP+zSnPCv
	 S7LpVbc3AKQVEuKcKQ6rwWCAfgyIuwlv4/KP9A9+Y+PEC0rSXvtColxqODHzVJoV1Lgve
	 RNe/+2sO13FUj0Unzogk0so3s+51rDjf3OZLPJZYP9bHbiHm8lh+MiTTAGp+Lu7J/4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792968954;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fVA9Px7sGwhBCvFM7n5uL7LpsIT0mOi13oe2+5aD5jQ=;
	b=zOHo8zqOEb55qiX5yQUyGq+YHYXYtyiHihB00oe1kcCWTAXR215D8kamZ76L+MzAKi/X
	 KD0SirH3YXl6cmDBWOpcsrAUIdO+F4mJmDSr/T6027zThDIkkm08zDIi1BzldJ7AeYQFp
	 QRjnpkP2Dfv5kkl9N8zqreMWpVtHCUy1fhn5dv6+bjv/raaNJj7R3jNhqAto3JxrKLc+W
	 LbtS2WKJDA/jGUkgmj5M0jkCKy7LeB5vq0EsZnHfLgljt/G+VZKFl9Z/h1cJohdKEvP33
	 DVdQRF5hu4nEJrJQX7l8N0G4VH/xOFTtd2CuavgPo4XXPKKGtFwjbo3bFoR2UacJW+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A/Zn+ncC";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC37B606A31A;
	Sun, 25 Oct 2026 22:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A/Zn+ncC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792968953;
	b=We/IzOgTgGdY8Ivf/0fs+nRQUgZlhlcC5TfTWNcpKb03Qqo3vUULcrR/Nu9XKRO4/Bhu
	 i+Kn8EfilZkd5RPBSZiuPiJcoklJwnYCodHQwoxhirfY+orb6G7ETj9/HkNVsF3ZIYwEL
	 eXPDotGJQwO25lNe+Xoh464VVHhrmJpuxh5OUPm3NYS9nXhy/RxbIwyk+aXmIHXW/Kh7+
	 a1pJFuQfN+IMR+MQGQzjZ7b0fc2aRLJFJj18G9TcjshwzhdvB7EuD85zklxJvo6PDdhlg
	 jMOtSzpJMsFSyQBlcQQ5uAVqklgq+FfLf2eFpAuoSRUqrJ86pm4AfiHjdSJjSHIkl1A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792968953;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=fVA9Px7sGwhBCvFM7n5uL7LpsIT0mOi13oe2+5aD5jQ=;
	b=eJ4k3CNMngo00if3VNRPeTMtOxi7FFe6cENde8nDBHtLyalhKO7FM1jymj8ElsuaHyRr
	 Tn9ImNyaOec2U42xhIZ/EyYxgtPgjjtBh2PeeO+zd4u3mtqMpQVNxsFm0RUNmjwztG42a
	 2Pyj4c9HBaJy7JeOyzLSfGCk0P+ZMO0EaLY1enONvz3tMXp79tgb5ibm3O3CQO6cYIuqC
	 SxJoY6cEcUjZJ0HkARGydYE+lndbeXwfgiVZniMATgRRh0MNDCWJIf3/mCsdfW2xPTXBB
	 8Sjv6KmZU7Vl4Sd+ogrv8CwaSXUTy8YOwlX4pdYxbCynphoOpu1OztgFrsG6ACYbwZA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 14AAA1F01825;
	Sun, 25 Oct 2026 22:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792968953;
	bh=fVA9Px7sGwhBCvFM7n5uL7LpsIT0mOi13oe2+5aD5jQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=A/Zn+ncCxnwDUhrdQwt8/kdI25iLeG6fcuEAfZzSCntM3flOGw9yRSK1Dw77af2LZ
	 g0S1Q2kV7avA3+S8odi/jMlfVRSOY6FY2PvfUeDmpY2vSdZIQiY+vmI9v54nyvYptS
	 on2Zy1pXmXmeqWA/4KzGWytTRmzvZxsklSnXWG5T6oEdkjTcQEOXV3ZUjNzccCEQYB
	 iKjBdnzYhiMvCdPdTNSeBeSusxtR7uesukgyBtHhHsyVJ3c5uykfgCpGgXFytkT/Nx
	 lZxhfkwiYjRdLpExBKreVBME6yCUO9swsBUqkGIZjOki/qmnuQdeK+wnAxB6SoFzXf
	 EMwdHaKSIv+eQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 997CF44AE2;
	Sun, 25 Oct 2026 22:55:52 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sun, 25 Oct 2026 22:55:51 +0000
Subject: [PATCH] arm64: dts: rockchip: Describe the Ethernet PHY on ROCK Pi
 4
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
Message-Id: <20261025-rockpi4-gmac-phy-v1-1-69ce4d677189@iav.lv>
X-B4-Tracking: v=1; b=H4sIAPaI3moC/x3MSwqAMAwA0atI1gZs/XsVcSExrUHU0oIo0rtbX
 L7FzAuBvXCAIXvB8yVBziNB5RnQOh+WUZZk0IVuVKFr9CdtTiq0+0zo1gdVZ1RJPZWtIUiZ82z
 k/pfjFOMHydgcumIAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Pragnesh Patel <Pragnesh_Patel@mentor.com>, 
 Akash Gajjar <Akash_Gajjar@mentor.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=ysO0nvScc///4x6g3QSeXnmC72DmKboxgyT6JKfyNes=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFn3Or7P1jZ6PnH/hIjcQx9E9L/axL654Hc84v6UypqD7
 h8ei5+/21HKwiDGxSArpsgy4ZDGrYwlV//6e5g/gJnDygQyhIGLUwAm4t3GyPD1UHKXP8+0xPwD
 z0Pfan3c2f+D/c9+nn9h7D5J4idOb1Zl+O9rLfT124GNCRlpRw+fmrKwPNPjypr+te7r7p0VShX
 TZ+YBAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The ROCK Pi 4 GMAC node has no mdio subnode and no phy-handle, so stmmac
scans the whole MDIO bus. The RTL8211E answers at its strapped address 1
and at the Realtek broadcast address 0, so two phy_devices are created
for one chip, and the netdev attaches to the one at address 0.

On system suspend mdio_bus_phy_suspend() leaves the attached PHY to the
MAC (mac_managed_pm) but suspends the unattached one, which writes
BMCR_PDOWN into the same chip. With s2idle and a MAC Wake-on-LAN magic
packet, 17 of 40 cycles did not wake.

Describe the PHY at address 1 and point phy-handle at it, so only one
phy_device is created.

Tested on ROCK Pi 4A (RTL8211E), s2idle: one PHY on the bus; 40 of 40
cycles woke on a magic packet sent 15 s into sleep, and 35 of 35 more
woke from the expected source with magic packets sent after 5 s to
20 min, RTC alarms, and the two alternating. Later board revisions use
an RTL8211F; their schematics strap it to address 1 as well.

Fixes: 1b5715c602fd ("arm64: dts: rockchip: add ROCK Pi 4 DTS support")
Signed-off-by: Igor Velkov <iav@iav.lv>
---
The deprecated snps,reset-* properties stay in the MAC node; moving the
reset to the PHY node is a separate change.
---
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
index a8ab043e4062..52de4a79e2f4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
@@ -202,6 +202,7 @@ &gmac {
 	clock_in_out = "input";
 	phy-supply = <&vcc3v3_lan>;
 	phy-mode = "rgmii";
+	phy-handle = <&rgmii_phy>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_pins>;
 	snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
@@ -210,6 +211,16 @@ &gmac {
 	tx_delay = <0x28>;
 	rx_delay = <0x11>;
 	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rgmii_phy: ethernet-phy@1 {
+			reg = <1>;
+		};
+	};
 };
 
 &gpu {

---
base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
change-id: 20261025-rockpi4-gmac-phy-18f13c9c37fc

Best regards,
-- 
Igor Velkov <iav@iav.lv>


