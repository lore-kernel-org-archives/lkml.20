Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD343F5BFC;
	Mon, 14 Sep 2026 08:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374257; cv=none; b=bBA16+wXslJu7ZU7oHAvdx61Rc1eIRENs39BcEYqxLjl5UF8QRnRhIIyLa8/zsklI22hXA7P6mPOGVcz1CnUsvjLm0jP968ZGockngplNpqNtj7/L02o6dXDdLLWRw6PY7I7uATtdPQyT0KkG2KOo6iumg9VHwokVeFn+GA6jJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374257; c=relaxed/simple;
	bh=MkeMHyHyjaln4EFjaZWMqZiH0kqhwaJ4f7l2qdwElYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k6+MZXO26YS8VgUe5Vt4U8y1RRG2kvdiIpw6bDJA9wa9xQTn3i9aeHmryv8I+cGqszGDOo2RU5RZ6675hnBCEWhFcszeJZBAxysWLtnmc3CrbQWTbCpiPacTRDXohc2KoxY6vWPfgXSYc91nw3OXzKZtfE1iX786KSWLqWMzZ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+sWkJ1w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+sWkJ1w"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3ABE8C2BD00;
	Mon, 14 Sep 2026 08:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789374257;
	bh=MkeMHyHyjaln4EFjaZWMqZiH0kqhwaJ4f7l2qdwElYc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=j+sWkJ1wiPe1zF+mOLbrcLoMhBQf+6J14N1xaAVql9Xzk5KCYOtnOK4ZZyJN02sAH
	 QlRvwMe0gAHDfuXxs+8j41Wvg91CMYIjHt/YRMwQI67zVRkem8VXEWENs7eXHB7J+h
	 j5f7zzlMwM6d6KFPM3/JXtxUhp9N1jiboiDbwek9x/n1kmpppRjv3JqSEAXxG246eu
	 AwQM9SCGygO2vyiEy1cvjz+LnY2sulBaQOZ81hae4nn0LcLowqgvh6kclzaBa01gor
	 dySmSYtfLXY2LNiVrGNZDwlogTQ86i1hKHs9eG3rl0MjAsFF0ziGPv7dwc3XDoZ6Tf
	 QBmtcpMAIqq9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EADC88E70;
	Mon, 14 Sep 2026 08:24:17 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Mon, 14 Sep 2026 16:24:10 +0800
Subject: [PATCH v5 4/4] arm64: dts: rockchip: Follow the DTS coding style
 in the NanoPi RK3528 devicetrees
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-r28s-upstream-v5-4-7409c498e8dc@proton.me>
References: <20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me>
In-Reply-To: <20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>, 
 jensen <jensenhuang@friendlyarm.com>, 
 Andrey Korshunov <razor1702@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2532;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=axQv03VI0SPoMzFgZAAgEWAflE5+RNrxFv6cJ6dO4AU=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqzl6/Urj34+npb2imvPHTZ29bdvG51nnLw/eZPidn3m/
 vaU6zW7O0pZGMS4GGTFFFlkN1VHCq2KnlnEInUcZg4rE8gQBi5OAZjIIXVGhu28cV94L8pHVjzg
 LjLRv/T3346TYqsSdLmrF+0paC1hXcDwP+FojeLuEDXjiHemTjNW7A1csFnEzP2vXa+LgpWJEcN
 3dgA=
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Reply-To: HystericalDragons@proton.me

From: 安容 <HystericalDragons@proton.me>

Documentation/devicetree/bindings/dts-coding-style.rst asks for "status"
to be preceded by a blank line when there is content before it in the
node. The shared NanoPi RK3528 devicetree and the NanoPi Zero2 board
devicetree do not do that.

Add the missing blank lines. No functional changes.

Suggested-by: Diederik de Haas <diederik@cknow-tech.com>
Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi      | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
index a8d99f983f..7d1ed8815d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
@@ -76,5 +76,6 @@ &usb_host0_ohci {
 
 &usb2phy_host {
 	phy-supply = <&usb2_host_5v>;
+
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi
index 06a6c0dc82..9637f91ef0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi
@@ -170,17 +170,20 @@ &gmac1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_miim>, <&rgmii_tx_bus2>, <&rgmii_rx_bus2>,
 		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>;
+
 	status = "okay";
 };
 
 &gpu {
 	mali-supply = <&vdd_logic>;
+
 	status = "okay";
 };
 
 &i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1m0_xfer>;
+
 	status = "okay";
 
 	hym8563: rtc@51 {
@@ -244,17 +247,20 @@ sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwm1m0_pins>;
+
 	status = "okay";
 };
 
 &pwm2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwm2m0_pins>;
+
 	status = "okay";
 };
 
 &saradc {
 	vref-supply = <&vcc_1v8>;
+
 	status = "okay";
 };
 
@@ -267,6 +273,7 @@ &sdhci {
 	non-removable;
 	vmmc-supply = <&vcc_3v3>;
 	vqmmc-supply = <&vcc_1v8>;
+
 	status = "okay";
 };
 
@@ -278,12 +285,14 @@ &sdmmc {
 	sd-uhs-sdr104;
 	vmmc-supply = <&vcc3v3_sd>;
 	vqmmc-supply = <&vccio_sd>;
+
 	status = "okay";
 };
 
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0m0_xfer>;
+
 	status = "okay";
 };
 
@@ -292,6 +301,7 @@ &usb_host0_xhci {
 	maximum-speed = "high-speed";
 	phys = <&usb2phy_otg>;
 	phy-names = "usb2-phy";
+
 	status = "okay";
 };
 

-- 
2.55.0


