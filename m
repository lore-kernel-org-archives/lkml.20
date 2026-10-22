Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792667211;
	b=zNE64LJ7d3wJlHM4R2lm3YXEEJRncn2LM/m2D34ufUzaJNWyry+lBu6pHD4GmfKgl5H4
	 1igoFPEsA4wqLJ10tC0yAQscm70aj7y44O8BkzkPAA4LbqkG4XklKhwC7GUuNz9wuJtcJ
	 p1t0qeEznN0ukBTnTsRoOlo/XTMKPhFIDxph8XCEtr8jaEbH1OEDuXevszw01FPKOGG9l
	 1uDgHVg2bHIn6T3wxzRaDH7lff3BbOwCK37zi0roL0PXWKJ7N5lAEUHQZ4jcqrs0IhniQ
	 fpFEIABN1iNubKTHc0gTb1SJObuCZjCWE79V1peN/FG0mWhMdziX5fVT4Alo3HR/Wsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667211;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RtZuQpjBISQ5PzofF8ezvlSlMkGFsIg2Ig7KZUE+5nI=;
	b=F2syvpC3t9qvm9qnKok1CTA7De7jdhLZk+ckw8SmWPREKkskV4dFA/lokM4wjtOkWE7p
	 xiDcuDF0k11aZ/xi/3blDSNOYvbL2/YsnEX9iPaZiKKcCRLATMue73fIxxvW7jawP3Srg
	 QrRtYMX4NJnvZB8ACL8b8P0q1BG6qJEKQ7jtZivP06YuxKkPC5Y4zatYX8/drC5kW4zNs
	 6p1+LK7tFbDw9FbH353YNf3KCcj3s0f84smx8VXxkNFGKyHzcMsQTHT+hCDu6vqKZ/2cG
	 5o+Jjt7fRrEnT87DmZDnwBQlsfBGFOHZF9xb8K+816fZiSiW0XyNepQiImwqNbvebBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=L33LsE9w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5141F606A320;
	Thu, 22 Oct 2026 11:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5141F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=L33LsE9w
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B8F7B202293;
	Thu, 22 Oct 2026 13:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792667208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RtZuQpjBISQ5PzofF8ezvlSlMkGFsIg2Ig7KZUE+5nI=;
	b=L33LsE9wjoPakrH1UIHZBRLHqjpBoeDc7KTLDRfHe237oAgyDNvwzZypRjtjI8jrPJFgpI
	hDz1qJLxWqR6kLs/aUDdUniLLI3kQoIws8ROPcx8jkplPf8kxLGz6mKdSq8fL6rOti3odx
	EL92Vf/EPyqTkelGUoM3kMybH9ZkNGBQRCcHGmsH8pTBz3ga0R7ePlDZCbIFfgTA+2fI0h
	s0bJOP9DiysdIIOJt3djZ+xwCO569JJeQKR8zZNsJDlc76tvBE7sY9G9NpRmNeyA+Uh632
	nJajLfog2nV4V4H5X5sUz8yoI1+foiGcGDU10uo2I4uIEvH2H1GyyqW9KsUH+w==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792667208; a=rsa-sha256;
	cv=none;
	b=DEW3zJXZD7nW8FKa70RPFx4psbK82i+08Hf+myqQd/cYIiSba386lpcd8Ht7NR5FigAiZs
	3pw4LO7OzVWbfow0hP7Snt/I8iMCioK0dKu5i9lnMo2y6raKMTHOumrsM1OEuwCtSJWVDq
	rmt+QOzCtO83h068nB0AKzCyclMrQ4uHxgT9NvLtXWtGlT1/DbWhG4o3pFYvD4B8Zg/BLw
	dOZgVTXH7dY+bB9EV1PUkcXAAjLaFiSYgu9M6ZoywV09Gvju3HJTAxbrWZj5oAFgFiCNLQ
	qYS7IDd7DtfpRhfjgIJ7s2UiCPVhZ8g/rsx+pTKd/aISfAYd7VcE0RGk0F253g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792667208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RtZuQpjBISQ5PzofF8ezvlSlMkGFsIg2Ig7KZUE+5nI=;
	b=FeXSLmXTLiLPQ9oc1WWyHNeSk07DKdTVG//ojK4M8e5yj7vijkEb12SYXZLFxzl36QX0gm
	iZU8J4K9DHiHRasLo3DCfYoW+nxAXb5BEsKkWzfk4fr+kZqLM4wbdn6ZbZQUvtMBxxxElv
	iWEOBYjCprG8x87ZCbZv/Jhl6z4s7AvtPY11EawHC4pxEFkxwdf3T+ogl5m+6eA5GxyT5S
	ZgT+0GWZ+MpIPPVfqbHf0jbajbunyo+GyDILuO6sCt88r31UpzCcziefmE9Crk4UyQa8yp
	XJ2MX5IcJgo84Z02Ej9yDi2MxifKtd+0zGtFssPZ6eOzbdfgrmO2C3iRV1PONA==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 22 Oct 2026 13:06:41 +0200
Subject: [PATCH v7 3/4] arm64: dts: rockchip: rk3588: Add JPEG decoder node
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-rockchip-jpegdec-v7-3-3fd7dd55f408@pengutronix.de>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
In-Reply-To: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792667206; l=2087;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=/5otNey9wykcyEsqmcE7HpFPjCyCSXpdbrUJbjJZsqU=;
 b=gmMYpmtDADwkorUQ8gMk1icwGAXAEsNRE2BvoDw+evtmg1Qd/yoNqNimQ/cYoajrnmoBUkWU5
 OQFRKR0+/aZDtrUK4Xyzu/klqyeytyp/nVjsD57sjQwdeYVIcLkB/nZ
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

Add device tree nodes for the Rockchip JPEG hardware decoder and its
IOMMU on the RK3588.

The decoder is at 0xfdb90000 with its MMU at 0xfdb90480.  It takes the
AXI and AHB clocks and resets, and sits in the VDPU power domain.  The
AXI clock is pinned to 600 MHz, which is the rate the downstream BSP
runs it at; it is a dedicated clock, not shared with another block.

Both blocks are entirely on-SoC and have no board dependency, so they are
enabled unconditionally like the other codec blocks in this file.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e07869..cc53878502898 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1317,6 +1317,30 @@ rga: rga@fdb80000 {
 		power-domains = <&power RK3588_PD_VDPU>;
 	};
 
+	jpegd: video-codec@fdb90000 {
+		compatible = "rockchip,rk3588-jpegd";
+		reg = <0x0 0xfdb90000 0x0 0x400>;
+		interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
+		clock-names = "axi", "ahb";
+		assigned-clocks = <&cru ACLK_JPEG_DECODER>;
+		assigned-clock-rates = <600000000>;
+		resets = <&cru SRST_A_JPEG_DECODER>, <&cru SRST_H_JPEG_DECODER>;
+		reset-names = "axi", "ahb";
+		iommus = <&jpegd_mmu>;
+		power-domains = <&power RK3588_PD_VDPU>;
+	};
+
+	jpegd_mmu: iommu@fdb90480 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdb90480 0x0 0x40>;
+		interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
 	vepu121_0: video-codec@fdba0000 {
 		compatible = "rockchip,rk3588-vepu121";
 		reg = <0x0 0xfdba0000 0x0 0x800>;

-- 
2.47.3

