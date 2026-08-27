Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9140C440A34;
	Thu, 27 Aug 2026 10:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787827760; cv=none; b=reAjX2bW7a7UYQC5lhKdVEXLKwb+GmsPYdQfSbthkclFUDyvk/Or6lp23W+q8sdhba/7qgsw6ZgPn59yYzBru5TuvuAKcmhaF8+nP6H+SK3s3qIjBWzpjr98owH60V0cDXKd24/Pewv4c6UJznrWVoPiQImFDlutAtsweQ5DCzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787827760; c=relaxed/simple;
	bh=JiRsPkmNViWw9p/R+dJ/RwJ6LGuCBEdgd54R1D2GkUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkbZB10pYYSY1YGf38juUztkHxj6u57jU2QbRWT3fw/3jfkxt7A4dsW9Mm2wlr+5pWQbjAy08rKUA2r36xJYacvD0cBFvNkuM98qomMjK6unkerqb2E+H0wb+p0OihFXlilF6CWy2k1tGr4ga05GJjtNPL4H+a2t1gU+zNhd0rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ptw9qBi6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ptw9qBi6"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:306c:5b5b:3c7f:eabd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B556145C;
	Thu, 27 Aug 2026 12:47:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787827669;
	bh=JiRsPkmNViWw9p/R+dJ/RwJ6LGuCBEdgd54R1D2GkUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ptw9qBi6p9WQ4SQNghx3oWEqrFKNJRUfF3XLo1owmTaFzwAt/IBvMUJ98zl8gt+Q3
	 40hIy1ssWTfn5Lz2SCwss4jNPy1wTND1CkW1Lw8YPGbcK5zgVv3EFWvogVw0h7fPDb
	 yH0TKulRyKjckqLgD51awh0VGA4lJyWnNnQcUR1w=
From: Paul Elder <paul.elder@ideasonboard.com>
Date: Thu, 27 Aug 2026 19:48:34 +0900
Subject: [PATCH v3 5/5] arm64: dts: rockchip: add ISP nodes to rk3588
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-rkisp2-v3-5-e91ff0a604d6@ideasonboard.com>
References: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
In-Reply-To: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, michael.riesch@collabora.com, 
 stefan.klug@ideasonboard.com, mehdi.djait@linux.intel.com, 
 xuhf@rock-chips.com, zyc@rock-chips.com, dalong.deng@rock-chips.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>
X-Mailer: b4 0.14.2

From: Xu Hongfei <xuhf@rock-chips.com>

Add device tree nodes for the ISP and their iommus on the RK3588.

Signed-off-by: Xu Hongfei <xuhf@rock-chips.com>
Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
Changes in v3:
- reorder patches

No change in v2
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 57 +++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index fc1fdbfd316223f8fbddfcf6cb3f1863cd8957d4..22b78465a82356361cd00ba363ee0163c7500667 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -3590,6 +3590,63 @@ gpio4: gpio@fec50000 {
 			#interrupt-cells = <2>;
 		};
 	};
+
+	isp0: isp@fdcb0000 {
+		compatible = "rockchip,rk3588-isp";
+		reg = <0x0 0xfdcb0000 0x0 0x7f00>;
+		interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "isp_irq", "mi_irq";
+		clocks = <&cru ACLK_ISP0>, <&cru HCLK_ISP0>,
+			 <&cru CLK_ISP0_CORE>, <&cru CLK_ISP0_CORE_MARVIN>,
+			 <&cru CLK_ISP0_CORE_VICAP>;
+		clock-names = "aclk", "hclk", "clk_core",
+			      "clk_core_marvin", "clk_core_vicap";
+		power-domains = <&power RK3588_PD_VI>;
+		iommus = <&isp0_mmu>;
+		status = "disabled";
+	};
+
+	isp0_mmu: iommu@fdcb7f00 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdcb7f00 0x0 0x100>;
+		interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_ISP0>, <&cru HCLK_ISP0>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VI>;
+		#iommu-cells = <0>;
+		rockchip,disable-mmu-reset;
+		status = "disabled";
+	};
+
+	isp1: isp@fdcc0000 {
+		compatible = "rockchip,rk3588-isp";
+		reg = <0x0 0xfdcc0000 0x0 0x7f00>;
+		interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "isp_irq", "mi_irq";
+		clocks = <&cru ACLK_ISP1>, <&cru HCLK_ISP1>,
+			 <&cru CLK_ISP1_CORE>, <&cru CLK_ISP1_CORE_MARVIN>,
+			 <&cru CLK_ISP1_CORE_VICAP>;
+		clock-names = "aclk", "hclk", "clk_core",
+			      "clk_core_marvin", "clk_core_vicap";
+		power-domains = <&power RK3588_PD_ISP1>;
+		iommus = <&isp1_mmu>;
+		status = "disabled";
+	};
+
+	isp1_mmu: iommu@fdcc7f00 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdcc7f00 0x0 0x100>;
+		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_ISP1>, <&cru HCLK_ISP1>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_ISP1>;
+		#iommu-cells = <0>;
+		rockchip,disable-mmu-reset;
+		status = "disabled";
+	};
 };
 
 #include "rk3588-base-pinctrl.dtsi"

-- 
2.47.2

