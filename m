Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794227542;
	b=oAU1xhM2qTbqcfsmtl7/HjedYRrDx+580QOc/D5+/6HNz3syyj0hmFQbjba/GNA1UGjC
	 3i8m5w4eubHJoTDfOu/FK2vJgKfRsjI8aFnRQ2wJYlEkyhDOKAZNOhRmUWblhkQF7jn+Z
	 dWhqmlcfzRBgvE/8TaxxDWwmkwpX2oWUXbp1O+gnk0sQr8LBbpfAcvlfsvh+opXLuPmxv
	 V3qU6kdVN8pjXHnUV/AaiI5Nghhl86bubZE8iD5J8g9RQCHb/h8WvqyRjm5DA8DsgvqdI
	 4O80FdeoL9LUBxIPoGLxl2zC5dqg+uANvNajnAhCxArOV+Sd1f8GuQLIe5nDAOJcM/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227542;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=olYTIdkLJxAg9ZNyzTo6fHUfJ4/iA0PRcdopyr4LHJM=;
	b=DjiIhAmSV0ufnY+0zy+zD5p6ZKiEGXnydTd1CNLQiY3Db+1JvxMOVpeALIYgoTFvUDfw
	 cJwLPQQvlR74pjprBVsDFiY16YZr9TqbcZuM5Xrr6wwniy4v4S97KRnBXo4QpzsGihJbr
	 dgn//CE+x1FPT8QZjgA2tv6+5Rm3XRDwozXsguCNMa9ZTLZ9ePvBnjdgxuLB+rQq68HG9
	 M85yI2I5IFXeh0c2nWEXnM+tB4mptHE084lvaAcrPW9HvTzejPbv+WL7duwntA8ggPw3C
	 fOdRlklso+qagef3VMBNAYjXOtihXSb81cxL0RN4hLN7oviL22IUcrZK+zu43zJbIKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLFtpCd6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407E3606A33F;
	Mon,  9 Nov 2026 12:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLFtpCd6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794227541;
	b=rh6/20QVS+OtOlEE5IYCYIbXk4trkzT9BOFpX6Q8kqX0IL0vm+05z4VDBMS1KjHniZV6
	 OdH4JivOBNYY48j93+gP73yOIkEvlg+6Hc2OqSa9j+KA3tfetKS5E0dSEIUlDf4DnHlqN
	 5NIcR23wSApksPl66f5jT4c35k/1J3rp2fg/tCELHJqv28KtQA1r/rkAgnylnRU2+w43+
	 QqvQFxVS/zyb8YxTGdnAEu398b/jB4VvCLP42LloiO3F7PjZ5gqwcJcSQzMue57tEC4s7
	 oaDnc87Y7wffxpaS2O8+Swc80giFRjjmZpliaBrIdljsVqH6nP80i6fdoZAWZb0I3vw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794227541;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=olYTIdkLJxAg9ZNyzTo6fHUfJ4/iA0PRcdopyr4LHJM=;
	b=3GAkKR7OuZoptemKw9A2Ac/X58msgoJiBKNSPvx1AKTFZcn4m3S8GGNCc/OwPHB7CXk9
	 cKhH+W751eB83M0oxfWN/09LfxgyRGPq9WzcIGvMoi/GwdsI1MC/GbxybJ2Ge9fHaJcvM
	 w3T2pzZrScpkKyowisBc0UQmHTiJcX491MduOVjN0VCHnyQtiFQajTtJHl/xSMPQzd96H
	 roZSJPKF/w2W6a3VklYgx8vLVeoCxxI+iUbZ9JE3rI+iFTbC8YJM3R83fdhfdu/jVNlTI
	 sSOxbwKfBHW0/g9jgwfGDDAGzQuwxy2xLp+ozMwNl1Vi9QGw3bZP7fEyUhI2e9Na5vw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AEF511F008BC;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227541;
	bh=olYTIdkLJxAg9ZNyzTo6fHUfJ4/iA0PRcdopyr4LHJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kLFtpCd6OD5VbEPMcaEkRjdDCoBau3EgaJRb32OV//jhSg6mAduL9dQYw2k4y/j9c
	 pJ8lAiTZkduq4D/tce4Fae69QeBkdhYKMb608qxmmtHb9NqEaTSUiJSPTDT222jhtT
	 n7Ip3XtFUzWMWB1BZou7zGrDW0TG3YFYiWK2Rbqcww+fKsqMGnDDnqmUnH2Zvgl58q
	 F8DxfbUgXlbhnIP39RtqPBBkYIdUNcgJ5GzsoB/CB5KWpyW/EZHIgkOWD9wAuofkgb
	 Euwe3TkksEJg2yDonLYLdaRJDuJOx00s7vaWpjXkC/4mfkc3fIk3QhAbxAHDcfciRd
	 BQ3saLE133XrQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 405A048492;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Mon, 09 Nov 2026 13:32:18 +0100
Subject: [PATCH v6 3/6] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on CM3588
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
Message-Id: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-3-91f1efefba0b@pardini.net>
References: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
In-Reply-To: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=w++noZywksCGrRRO7c3hF1elr/qmFxdKHWCq2dOL318=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq8b1RbN0sIvNk4HfWMyphDIMDobu3+n+g4Ae1W
 yqozNRP7s+JATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCavG9UQAKCRA7Xj/jnsft
 6a8mCACVkbcWbUkpvUzkSoHR/3R3Jk5N0j8ID7eq+SIPZMvaQwgjDZJabc2IFw9CiFrSq3KXbax
 laJ3bG81DGrbfRRzpLNFZzxaOnlyzny8NQrxBdp6VILR0b2/QcX4fj27NCm885q9i3tEQypE1bO
 XWwT9RJrsxhcI6hX++Ev5vU1f+2d7hp7SYSMIRSEIkn54pKTq5tdeLtlh4psuzE2aMXClaDNAKX
 59AfyZ/4eb2ovQK6xxmepIxDm5nkGGhqLaW0rpg2ic8rDMuMtaKROHSLvqBjCwqMPD/n2drOdM7
 ThzbAedS36WOjcw882EUoBgbIrrOPhUcoVRUFbTNoO4eGCu0
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Reply-To: ricardo@pardini.net
Content-Transfer-Encoding: 7bit

From: Ricardo Pardini <ricardo@pardini.net>

The FriendlyElec CM3588 SoM carries one on-board Realtek RTL8125 NIC
behind pcie2x1l2.

Describe the PCI function node and attach an ethernet0 alias, so that
U-Boot's fdt_fixup_ethernet() can fill in its MAC address from its
ethaddr environment.

The node goes in the SoM dtsi, as the RTL8125 sits on the SoM, not on
the CM3588-NAS carrier.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 .../boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
index 49cf4b85c4e9..d6cff0f5dc86 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
@@ -18,6 +18,7 @@ / {
 	compatible = "friendlyarm,cm3588", "rockchip,rk3588";
 
 	aliases {
+		ethernet0 = &rtl_eth0;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 	};
@@ -257,6 +258,20 @@ &pcie2x1l2 {
 	reset-gpios = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x400000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x41 0x4f>;
+
+		rtl_eth0: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x410000 0 0 0 0>;
+		};
+	};
 };
 
 &pd_gpu {

-- 
2.47.3


