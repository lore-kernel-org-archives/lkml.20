Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794654628;
	b=Vj++y0N78VE0BYOP/YFviA9dEv73OAmdCN1vRIAuKt0jsOEVlRgaVCzM9PDeh7PO4b+d
	 xbQ3pavw7mdkyofB1s9/0rwbpcDIy0eoeuMKMdVxarA/G6PlPAFnUwPLAhf1NsHB+MbOk
	 RzgkdEYOXtWdcmIdVPWX92mgnnwTPOlReoUmjisjT1y1DiFjKPHKF3LrkoPZfEwwAcEm8
	 b/XxfJP7TsVy/lGMab2NO9yt74dcvowJTLBnbIkBNVSDGl+REatAWqvFHBRso1ewO6Pi6
	 PbESCT5FvX1WBNV+32jjAfxnm3q18YZaLGmGw67uIpxYUTYWkVFxvlHobvUX97ODxrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654628;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=y7VwAXIR3LZ+LfLuKx6LSuovTYdHUSxNKCSscFFqjLw=;
	b=AQO0+FofDQN1t1LlOqnv88mraUv8JCNf6CIuyz8AGvu9uOCbutnGAoTUmmB12TUsndbZ
	 YKvfxXadUO/m9I77rnvSceNVVc5LLLA2bwabcgDX5XVEWcwAFAJ0irKxEqt/wY/5eHbXb
	 ZacgUOCXOCj6JSMewtJmwKS79hebSa5Fvhwh29usODbp+F8P/f2WB7+qBq8/B4GQftMru
	 cbuTEwYjOSV9MduYrrVwH7zdtjxeC/57EccV8FCA7Vj2Ztjp/aNHyrcdMz7p0ACCLaUsz
	 gV6YMqYz7Su/Yl8Kez8O+B+x7pYZzQhJ8lPEfsZXom6tib9rarpgJvysYFqZGu2rKtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C8E606A89F;
	Sat, 14 Nov 2026 11:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C8E606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSBeE-000000003za-3d22;
	Sat, 14 Nov 2026 11:10:18 +0000
Date: Sat, 14 Nov 2026 11:10:15 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, Marc Zyngier <maz@kernel.org>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: rockchip: rk356x: Order vdec regs by address
Message-ID: <9f72ce4790da9658a62171ca5ca91b44ce922b62.1794654074.git.daniel@makrotopia.org>
References: <cover.1794654074.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794654074.git.daniel@makrotopia.org>

The rockchip,vdec binding lists the register blocks as link, function,
cache since commit 35c8178ed2bd ("media: dt-bindings: rockchip,vdec:
Add alternative reg-names order for RK35{76,88}") and marks the
function, link, cache order deprecated. The RK356x node uses the
deprecated order, which also leaves its unit address 0xfdf80100 on the
second reg entry.

List the blocks as link, function, cache. The driver looks them up by
name.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v4: new patch

---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index fac41e34005f2..eefcaa2c26ffe 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -653,10 +653,10 @@ vepu_mmu: iommu@fdee0800 {
 
 	vdec: video-codec@fdf80100 {
 		compatible = "rockchip,rk3568-vdec";
-		reg = <0x0 0xfdf80200 0x0 0x500>,
-		      <0x0 0xfdf80100 0x0 0x100>,
+		reg = <0x0 0xfdf80100 0x0 0x100>,
+		      <0x0 0xfdf80200 0x0 0x500>,
 		      <0x0 0xfdf80700 0x0 0x100>;
-		reg-names = "function", "link", "cache";
+		reg-names = "link", "function", "cache";
 		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_RKVDEC>, <&cru HCLK_RKVDEC>,
 			 <&cru CLK_RKVDEC_CA>, <&cru CLK_RKVDEC_CORE>,
-- 
2.56.0
