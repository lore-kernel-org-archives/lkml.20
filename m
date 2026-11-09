Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794227543;
	b=f6A8eWmGUGXJsgLXsbiz4chhp7qL/tEkrTZRgTWwy1gPBUQaT+8xV7OR3XVv5OXBJVP9
	 /2UJjUx62IMF+FMfxqaRgHHcVvCmfkc6C7694PNXu37GsT3CgUPpzJIkB12u59QxjP4A4
	 5QUUr4MNJU8VW7V7WnIX+38nIxgvqhUlTr8/ownoVO94BNV6P8FcHY/JLLKy6Eejdi4S/
	 GrSErsQBpkctvqeCns112e92rU6cgV3WoCE0swa7GLc67NAqbY2SnSLTiNqXEcNm5SSeF
	 vQpJR26m4Lh+SNt+veeZ1S3v2Z1fgWfpHF+u0U5mhkPl/a/B6lovjz7JKq/QgPK4ecw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227543;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dxn+6uDuz6ndoJKiaFtcZm94n3JA2PZg9wgDsgFvyfw=;
	b=aW3TpUa1KsMkqdCT0KnVx8c29Ng4pLCN2UbDQPnPPQMQ3f8u90Uk9GTGCTuecy9YMpal
	 Rz81Prm53hhiaa4WaKvSEDtLmIzSWGmuNgHCDRnWG2tFKAYq17IieYuFra8fScsPhtCdU
	 JrnxvsNCYrULK4SgHIRhOc+53bRjWLx++Ou+JDxXWaBBDOeRztv2D3tRvltQyuBH7m1vZ
	 dltvmtwKbeLWyy7FJ4qtnv9WkMulFYAxY5sismo2wEokvQ325BxXi0NZ+fPTcYA5WRrMt
	 tVuYkBpfAWvUcLM5xDkJ5el73KaMmMt3pHSfTL6dG5Fjbir8g2RQjpWVG6NRsevxRZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TSuCuoSA;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25FE606D80E;
	Mon,  9 Nov 2026 12:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TSuCuoSA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794227542;
	b=HaduDaU1VmQ5rUWATXf2EjfXvF4b1oSR0EF/gYxiH/8jYe65vumNGALmr7bB+59bcUlC
	 mGC0XWN6rtFFhkeYJRv1ayFz8wpMYuSlAFNlhFfv6BgzN5l9sxxo0v26tZ03JSPBnh/Vm
	 ck3A+3dtZ+fVVEuulfhRzlCcx7b25aAfuvndgPf372yE7r57bSQDWscntG+0ZPc5dwXoC
	 fEUjcGagSHUruf2ytaGfWSVcFXFX0BieyA/pMhiG+uCsRsTsxXFQOB3V/vRjb080+ozsW
	 l7izvKAusAT/0udXwtxnoI62jcQr/DD+VsvSFRcwBWhURk+lFNjNu84iaWwCpL4UpbQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794227542;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dxn+6uDuz6ndoJKiaFtcZm94n3JA2PZg9wgDsgFvyfw=;
	b=UTBaCL0gXZn4Y2fw3xWFKrRoZdeGWeAmpLcIXSZ2Uee6QaTL0bjeCvTlLU2m1xGzIoTc
	 xA0iuy+Oe+9ZTbbYj8ko9zFGH5ruVaPFP4XAVVk1QpW/8/shTsczlAbTRc1gfHENka+0L
	 brtapqM5wYosigBzx9wj2s4VUQRUJURj/BARgYBympNGTj8APuI7d5IedYqxXE/yRnyCs
	 wWZFrwLHkEWATaDB3LCvOOCMSDCBQp8YxEZGAvPbo+tqTRg0njChfPC8UoN+joOCH2Llj
	 V/PjIXB01Xw6g4rQgtAYOQSkbUPiQsMNUvNL+XHDbkKIRK0sES7gMFSoNkIx+e99jkQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E4321F008A7;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227542;
	bh=dxn+6uDuz6ndoJKiaFtcZm94n3JA2PZg9wgDsgFvyfw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TSuCuoSA9DKf50OAYMmD/RggCkukek6tVSJfZlNKA2zAtffz6NlGvSOcPThg9xgOx
	 nXYFbm8bj9xcnvfS3tqK/ynrEiJxt+GS98Iiu4OXPBCZ5Xt84V4ztW1/zQSeMOHC+1
	 KhpO7BHgSebUcRGCK6Aw5s1zy+KtwHvbau/c+Lp8UFoceIx3tX7PIa8OsD1QCcQllP
	 ZvPl8oHY6dwLwVwFjTlWkG+lf/wOOniFD4gF6RTno7b1uHkFaoaySgoxVNT3FQFhnr
	 rlNCwMKsG72InIkCMO/e6ZZ2PxHJOIrhk+0uILZdCg3cIreCkghBQG2R0kZOZadI7C
	 +3Y+9Q+7w7yzQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 304F04848E;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Mon, 09 Nov 2026 13:32:17 +0100
Subject: [PATCH v6 2/6] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on ROCK 5 family
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
Message-Id: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-2-91f1efefba0b@pardini.net>
References: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
In-Reply-To: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2524;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=5FUQR0rfH+5npztwgihS2KzQbqIydyXcLzR1mZxE4zY=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq8b1Rqz7/SAbQQrbe2CSUO+hzIC8QLvggk98+u
 ViJ9qqcmPCJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCavG9UQAKCRA7Xj/jnsft
 6akgCACPf5E8p9CxpNI6k7h61C2X8pqJyIjbMbEgil14qH4Y6PD4y+iOQ10b0ZXhptGKo1hMiH5
 B4zpkjSDnl7FXeg5KC47PJkceMtW1py9xJVtvGLFLn8TIt9XuRLpn+sFZlPRln4GcRfMYJFHaTN
 rI9Uc3K/mPRqtXYNyGGp73dWRLscyYr3+vcB70l1MT0UVRNwEHwGahCVwkVAjxMGw2eXN4aN99o
 dRRr6D00wYnQj0anuovVoRLfsywaLaeghrDeRwbMTpw6RbTydFL01bAQlcx28s+cXaNOuORvZNE
 e15Orv1Kiyc3VDuNagGttKp2MjNfO7hbfRtoM31rHN4ZCfcr
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Reply-To: ricardo@pardini.net
Content-Transfer-Encoding: 7bit

From: Ricardo Pardini <ricardo@pardini.net>

The Radxa ROCK 5B, 5B+ and 5T carry an on-board Realtek RTL8125 NIC
behind pcie2x1l2; the ROCK 5T has a second one behind pcie2x1l1.

Describe the PCI function nodes and attach ethernet0 (and, on the
ROCK 5T, ethernet1) aliases, so that U-Boot's fdt_fixup_ethernet() can
fill in their MAC addresses from its ethaddr/eth1addr environment.

The shared NIC goes in rk3588-rock-5b-5bp-5t.dtsi, the ROCK 5T's second
NIC in rk3588-rock-5t.dts.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 .../arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 15 +++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts        | 18 ++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index b8d90936fc20..e8a3eb33e402 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -10,6 +10,7 @@
 
 / {
 	aliases {
+		ethernet0 = &rtl_eth0;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 		mmc2 = &sdio;
@@ -488,6 +489,20 @@ &pcie2x1l2 {
 	reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie2x1l2>;
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
 
 &pcie30phy {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
index 425036146b6d..b1a3e4b2165f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
@@ -8,6 +8,10 @@ / {
 	model = "Radxa ROCK 5T";
 	compatible = "radxa,rock-5t", "rockchip,rk3588";
 
+	aliases {
+		ethernet1 = &rtl_eth1;
+	};
+
 	analog-sound {
 		compatible = "audio-graph-card";
 		label = "rk3588-es8316";
@@ -76,6 +80,20 @@ &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie2x1l1>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x300000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x31 0x3f>;
+
+		rtl_eth1: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x310000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie30phy {

-- 
2.47.3


