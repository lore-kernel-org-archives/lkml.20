Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792667211;
	b=EjYw9ja0cL17r4nG0/mRVTzxDNlmH1WNKBfMtBfoNl6bYhmPLr1ZXhoszuRGrVtNjpTr
	 LIP8CcjM575Jh1PS6/REL7c12L6XQBmylekGyUhrLx5hvEIn9bzZ7AZ1Ywph3ozVruqgw
	 IwY52qu/unpzQon4TS+ZQMse95leY0F9MugH3r+4uWDDt6DEA+eUcBg2MKE57W/kyl4VX
	 MD7MDHIBJCVb8A5xkHXiltNZyknfjbqjAk0OQWMIQq94FEdET7RL7gcMeoZzjbSkghCV8
	 ReA7Nu18vvm0tUbTfJX/sCYw8QvQDMXq09qYXvAB9oa7WkNqiY61+gnOAAP3CwFyPsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667211;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=FeWTS8Q48bWPnQCGmjUGgs00u6eCx3a6nfu0+I6v/Og=;
	b=e4hx2AVYjKQCBVtpXgFiPRRPrTJqMcHjp4FrGbWcAMOJlwPmdvw9N0HC6CZJvBLP5weW
	 uik7buUHI1z9SUJH9Z89zLFb0fJbJpcayqV66gvc8X1tPoti7GVvMYa0RA/yoYYYmLfSM
	 rabq20ZrY0Qh1+It713GcOtNB4LtN4EdylXyURmIZib/FdbYr9eO2WUEpCVRkDg5Tdwzb
	 bP0ij03k6m/OAOAhfQ8EBvK3HvwFrfhrIiQFIQaSqNppzd99u+SJBOEBX8Dth0feGPwEo
	 Jqvcje4SlGMVYPTOjld1tjuNTp6pennhFeqAUq24K2xQzsMF7/NKTNeY2AH7r2lZw3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=E2N7awLF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59719606A321;
	Thu, 22 Oct 2026 11:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59719606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=E2N7awLF
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D1EAC2022E2;
	Thu, 22 Oct 2026 13:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792667208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FeWTS8Q48bWPnQCGmjUGgs00u6eCx3a6nfu0+I6v/Og=;
	b=E2N7awLFcKu4B8otw+enfizF5Ug5lcIvsBcc+E2wXr4vl90Y5ZygYg4caYkZiI+7GR7J4U
	B5sAriPUG8qajzVhG0ElbTcAf2sGnmjzCH9MmND4SIPmNErxL2tqg6l5MEYswsnhCAlQCz
	0uAr1mlRxcPSA01U7V3dNATqZITJCLPdtnMlVnCSJJUpb8X3IIdb9MqLYQbHJF6VrGYp/Z
	aM6wbLYSxDn9SMoldIPN8et2Uzu9b7giki98NULcHoc138rnIO/y+DcvzBE3pXPzVUH/X0
	cFIRxkGdOESmSaBfCzIWbfkjeakwqVkwxHIi3sRT5U/9dDuq0J9fii9qh0xDWA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792667208; a=rsa-sha256;
	cv=none;
	b=ffTXFWXvfWyMT2QdASyOkvTJA1s+SkCaw8N5S4e3R+nkXZYw4pvopvd48wCRg+Zt4OgO75
	eVXW81jsCZQFElGmDFsoLIkRPu5y5b1SREwuBkNlWvW7DPf7qwKa6qfD1iqXCFfMCfU1IJ
	XTOUCvMMO/Vu+9BxBAEmGNkpJYoEiUMfYM7i4MfrgNcNvOplradT+PNtVpYSmpBuS7nPi3
	QIrMGQ7ODdCGqxcSwC0w383AHw6Vl09vdY0I09bau+qtycwcCH6LvRfmUMHupXX3Cvo2ZI
	abcupkMTRSMg7hWq8g4HnY1k+JmgeRKO4X2kD7SP2k0l8i+/sWBORNgg2Hs0QQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792667208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FeWTS8Q48bWPnQCGmjUGgs00u6eCx3a6nfu0+I6v/Og=;
	b=JhmMd2OdSRLsmBdTaZJaOxn5+J8i7lRsLiQ/YGQr8EpU+uTBTDTZeesV+YpTXpcAd68qiS
	QUS0mgwMMH2cXVGkrTWpOsI/6dokxyQ7z0DLmYkmCjJqqMDRh7KIgM24fb8508G36hqwII
	0pBAIXQqflMghVumK2qziDPApZkudGahssYfQ5Jin+A4S7Dh42IvbsUipvf3mJve1mFOkq
	tyycRH325bgIHDNeIUlaAXnqn0hR0BsPn7E87kb3yeS9FzWizjrTvB8d7R8Z9beA1aD4AU
	OH5thIxmqP2P0Ug6p/S6eq0ZSduf4f4mAGihxBfmwAVZqrhTCuvtUx3fO4JA3w==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 22 Oct 2026 13:06:42 +0200
Subject: [PATCH v7 4/4] arm64: dts: rockchip: rk356x: Add JPEG decoder node
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
Message-Id: <20261022-rockchip-jpegdec-v7-4-3fd7dd55f408@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792667206; l=2421;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=XKKZeAn83nsSxMgXM9Bvv6Y9OauycMDu579tqOq4OqA=;
 b=qzCukFzVLEWQqLtyrYPgpvpHc8rV3w7plRIzGdpGDIKsfzLPME3FqFKimPrTKWIlUiC2IiQgW
 zzqFY3VUp1qBCn+RP3pVd8224ZV8oOrGDQR4vz/HynbJQjp06QCEbwI
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

Add device tree nodes for the Rockchip JPEG hardware decoder and its
IOMMU on the RK356x.

The decoder is the same block as on the RK3588, here at 0xfded0000 with
its MMU at 0xfded0480 and the same 0x400 register window.  Only the
integration differs: ACLK_JDEC and HCLK_JDEC instead of the JPEG decoder
clocks, SRST_A_JDEC and SRST_H_JDEC for the AXI and AHB resets, and the
RGA power domain rather than VDPU.

No rate is assigned to the AXI clock here.  Unlike on the RK3588 it is a
gate off aclk_rga_pre, shared with the RGA, the IEP and the EBC, so a
rate set for the decoder would move those too.  Its mux tops out at
300 MHz, which is also the default rate of the downstream driver.  The
downstream device tree assigns no rate to it either, and the vepu node
on the same clock tree already leaves it alone.

The domain needs nothing else, it already lists qos_jpeg_dec.

Both blocks are entirely on-SoC and have no board dependency, so they are
enabled unconditionally like the other codec blocks in this file.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd392..e6c7ae908a99f 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -619,6 +619,28 @@ rga: rga@fdeb0000 {
 		power-domains = <&power RK3568_PD_RGA>;
 	};
 
+	jpegd: video-codec@fded0000 {
+		compatible = "rockchip,rk3568-jpegd";
+		reg = <0x0 0xfded0000 0x0 0x400>;
+		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_JDEC>, <&cru HCLK_JDEC>;
+		clock-names = "axi", "ahb";
+		resets = <&cru SRST_A_JDEC>, <&cru SRST_H_JDEC>;
+		reset-names = "axi", "ahb";
+		iommus = <&jpegd_mmu>;
+		power-domains = <&power RK3568_PD_RGA>;
+	};
+
+	jpegd_mmu: iommu@fded0480 {
+		compatible = "rockchip,rk3568-iommu";
+		reg = <0x0 0xfded0480 0x0 0x40>;
+		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_JDEC>, <&cru HCLK_JDEC>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3568_PD_RGA>;
+		#iommu-cells = <0>;
+	};
+
 	vepu: video-codec@fdee0000 {
 		compatible = "rockchip,rk3568-vepu";
 		reg = <0x0 0xfdee0000 0x0 0x800>;

-- 
2.47.3

