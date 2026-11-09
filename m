Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794227542;
	b=BPs3usaZO17nGebsHVTyyS2YeFROL/sZI5JO6U81DuVtqVnj9Ao40j1DxEeUt2F9elKP
	 atJz1X1U3H/wsojcTzgfIxdmStLq66bH+zW6lcs2HbLIDVjyg/ayOseM404YVaJtGCF8n
	 3nGbHehDkcNfwCJd3CDEN48DDH15iY5WYzdcUfGRgXHy0aqe9IZ6hRS8ziGsNmlf0tQrB
	 d6jG5lxmpi6XfLGpNL5WSO0tQXI/oZrh7bK3EIxWOukuTonB1DIh1eVltL0u29b6iWBo8
	 Ltu2I6szwVNwUTV2yDSy1Llou1ZvmtJBJbk99ZdY48zxY+UrgEp9OA0r7zjVh1EnHvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227542;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SPHik1JiSrjEQWR2A1Dp/yVw2IW4Nu3YxvN6n6vFj/o=;
	b=R2VBwz66lLMEPbiqDwSovlYRlf534Qbz3mjnZLAWD55n5S3xuF/uPISm+/ZvpFzhDP8H
	 aGF/qmMy2pKZS/8It4wuCcdPh+Y0DsULlh06KVrNcLggnHelIec/qPl10d0+wQCbT3CaG
	 d9LBUaZwZYcdtFLwFWMqRamdbdP3WJnTT5cKNRS/NCMIRqjXAvSh4YnQVA5tsFKkLY1yE
	 qlpu/gxWFNoZCQhiXl6iuYW7nrR6KNZdjaZPr5L+yJvTSKYXcFoSmpCyNflIW3HcCu7yL
	 /lJ6vTPx9F77CKltNNMTizVMtxDL9HbKXKe5zAO2aGhV+9Vixp7vnah+LtQpiah1ryg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ks3HV+lP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B15606D805;
	Mon,  9 Nov 2026 12:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ks3HV+lP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794227542;
	b=B9WRVBTOZlxu1uGbYsrmIzGTF1KPMunaoWxwsEx8I6s0Y7Imjk7pM/qf/7b+5gau3f2/
	 OzJr4LnjTkPypVQ19Bb2ad7ylBas0o1ZmDFYAqiSn3AGNAB+Pjg0Gajj4rGssO3XMm3Qp
	 bmvnb6MPE7bAXEhIsPZmkpn33uuqGe1yvnJvBwrTAD13w++ey9gf/5HEKFNOmAZS2Czso
	 k+0JIkgnJoxpwkEKgW4cJ+STn9x23NjJEE0WJJi2M4OU3aheHzqwKJmonNNasKMOwXeSI
	 xNBXARDYPM4aPLFiKIvav3Pbv+HJCuYFNs0g2sAj3b+CxzJ+KavSxyJlc3JyZaS9p8Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794227542;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SPHik1JiSrjEQWR2A1Dp/yVw2IW4Nu3YxvN6n6vFj/o=;
	b=wgM7Xz0V+/o1Rfpbnzuad4cKzmoQ5RizKD4DlyK/e7jQL/E2csdv+qOgPorqGDEgBOD0
	 IatCT3TD7WM4GmkNzQhVyDVG+KUNODgHH0HI67y/DL+wvyhzaKnxdgr0iGKK5dFIt1a7N
	 acWc+K50NtAIKU6apt4UR2O2mZy0e94n80NVBaqZC8EL9JMLuH5bVopt/0rOql1SlkjfP
	 Wn6klvLX6za4w6+KIucNWdNlUxbl6YHTVIOBlbI21sfT3vJuUV94AXZ3Jl3gb6oOKN3b8
	 Sbfg4eqfQX+yZtcJoWJungFOHqEYNZGAkHeolFHY007wOssRApy+Stu+2L98IV1bIUw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A54601F008BE;
	Mon,  9 Nov 2026 12:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227542;
	bh=SPHik1JiSrjEQWR2A1Dp/yVw2IW4Nu3YxvN6n6vFj/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ks3HV+lPIEUvy44lHe6kp2tkbqv95oBP374kVy8T94WY6f9F74inIyDeipQijI8ny
	 yXmiDwnwq2dxHy/Hsx7OXpkLNY1DsjmB7KruuqYjwwbhds10K3tzz/jue/s0eLaUHv
	 McNoEnjTI38wklePeZip986NwJgrYF0OUCXz24P0OmjY2zncrhhT2z1BZXNe+w484g
	 BujQGDuSDP4g7sDW6KKdNZHsKOF+Gd18Oo3tjzyMKMNCqtuDD2gms52ZQKlrDxfTSm
	 ZyLc5eBhnW36qTbgmXg7sVD8FdLE7crI7fHvjtxZ19FI2w0tdtwwDL+JAWSJjY2HSC
	 0apP3Oo+lydMw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 70F214849E;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Mon, 09 Nov 2026 13:32:21 +0100
Subject: [PATCH v6 6/6] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on ROCK 5 ITX
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
Message-Id: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-6-91f1efefba0b@pardini.net>
References: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
In-Reply-To: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1839;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=wCLAexHdVkD0jpxkUE9ppJGf4g2Tzpw3hn/wf3LCfHA=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq8b1TWy6Z8ypuZjA136KddZ2dUSBysSOVhFyWT
 2MthJcSKISJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCavG9UwAKCRA7Xj/jnsft
 6ZseB/9DPncY7tXNZ1Pc+fRxccZBkMS/xty8tA8bsrQ1Gm3LUiwmVVWcUVmuPmMUYx1XCF5VjkR
 oITtKrxpJlugGtCGHkScPy/X0WzmabA9Csz58gqrPhmi4NoK6InzzV9BRs9V+6+oa8rOLF6Rjp5
 Z2tvUE+oNWxzHzJz09o8Gdh/gNi3dAzHY7dgU6l12jKciOQyV4yu/ovK7I3DbuGY/ysQwcL8kih
 oC+rmL7i4eidMAkaspJKUqlBwc+11muQyBj29KidP/NxIk2AcKisGEN15e/VzehklW5S1ToOPnm
 5cCMFjLK4OJwnyVzJJYxL2QHzlMDTQzi6QeuVISb2LSIf2QW
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Reply-To: ricardo@pardini.net
Content-Transfer-Encoding: 7bit

From: Ricardo Pardini <ricardo@pardini.net>

The Radxa ROCK 5 ITX carries two on-board Realtek RTL8125 NICs behind
pcie2x1l1 and pcie2x1l2.

Describe the PCI function nodes and attach ethernet0/ethernet1
aliases, so that U-Boot's fdt_fixup_ethernet() can fill in their MAC
addresses from its ethaddr/eth1addr environment.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 9d3d26d4600b..dd9767edd42c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -20,6 +20,8 @@ / {
 	compatible = "radxa,rock-5-itx", "rockchip,rk3588";
 
 	aliases {
+		ethernet0 = &rtl_eth0;
+		ethernet1 = &rtl_eth1;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 		mmc2 = &sdio;
@@ -631,6 +633,20 @@ &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_lan>;
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
+		rtl_eth0: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x310000 0 0 0 0>;
+		};
+	};
 };
 
 /* RTL8125B_2 */
@@ -640,6 +656,20 @@ &pcie2x1l2 {
 	reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_lan_phy2>;
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
+		rtl_eth1: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x410000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie30phy {

-- 
2.47.3


