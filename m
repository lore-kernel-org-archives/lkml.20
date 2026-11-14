Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794615232;
	b=EG2nbil6/GDMM5UaMqIdYC1ReP5OTDUOnsA/ZshC/1NYwNhl+7dUTQeXEHw2UTrgGJyy
	 ivq0TCDp0j861usuvc77NsjbBEyWfUxmq5lybW/ToBmXpgcV8d++jN29xvIZS4LuAn4VU
	 i/GP8NUT97A6/Oz0AGdno3riNsH7kZlrBz4vfPAN6MIo052qjgd9pboZAgzHo5zyr/Nvu
	 ZU0ILDGqZ94QxMcZFI80pjJuyVXHfcNA9I2uNV2SIqI5xlZVNV95ttVcrxzQGuPnSuuqa
	 TKcnpfGTIIIUJTe4CMooHa38Ik1ynmbYzFzf2P6r8yAlgCSb8JtfySG8i7ky+eoCFJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794615232;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YJIqsMHXUd36NytjdySw+FUQZNq6eqzvdp3DyLOfBec=;
	b=S5VeM9vfs+0t8wJrGhJrFgXQ/Kw0zjHmi8nT4rLos3rmozOC4bR8AFHJ7sknjuoztBpP
	 bc8LkhnH4rZOk2oFG5BZYhlXObmuU2SAR1nH73SIwJZ+MUggQHFaSG0DiXY72UDFGriK5
	 fecLL4i8BUtxcuQKxsFtpNcyKn4Dhq2FTUfo3hqfmhpXEeA0aVSEMeCrtCv14IvAYEvip
	 EyMbpowdYI9DNXGtAl8jORe8IJ3pvey/xFSTI4ERUR93X0BYNyMA3PljdIwqyRjsAsaUV
	 bzUJC0W5OT/0T8+WhPGMrwOUdC/X9EYQkajrX/qNnnuD/IzXxRP4VDorUAcjcCGlNsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UK4YRzX7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A014E606A33F;
	Sat, 14 Nov 2026 00:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UK4YRzX7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794615232;
	b=rDT4QYgG/0mXnV1sGaio42y3s78CYtv2s2wYve0rpbyodSl8w7jqrLnRr2hzKwayRjO3
	 oNug+WFq/gpznwM8Am+ldVsj60Ttk/LR/N3zApQl8VSWQjT25/bp+rLxt6AjqmEcYnoDr
	 LiiTFrv3BTExBCwZ/fi8rm8UHLHdgbtcqa+YA8G/jLJad9RXwz++T43rDVY6a5Y3iV1cP
	 JoCwP3s6XJOvioUoFnNsYXQeE8g+8qiEeOLRTL/tHcmiCQkzNla6NYgKu3M6ulrJqfqku
	 cyffeDuyqRqaaqn98oiScLk7DXErthJsDrj+FD7UGyj+a3zo/pqKyepnluXEBGQ7Tiw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794615232;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YJIqsMHXUd36NytjdySw+FUQZNq6eqzvdp3DyLOfBec=;
	b=YOxLIqc9YAl4WHvnu33Ih51WogbwyDiggSoJvnH6Kuw2tFUbGLd1niMiK00y2rEDkDrK
	 CrtrJS6cLeHCIEdcb9AIApMvw5KndYuF92LlJ1RVe2WVJjwpdBHkNA40LTSbkskVv9Ca0
	 JOeJNOcEwFiMg61heYbsDhSyCIQgnPowhvtYZ19lzUQQqHz47SZoT7BDmFyiN69mmtKyP
	 LbkIiZAv5VI4Nnt45WLv3MSVvOfqMi4RKK3oLiUl4fHofgEzuk2NbBR0S3yiDAE8wBoxI
	 WW+g4mREJwbjXn87jbEPgcZDytrwbGvcyOZFuxta+TU3pRKNqpT7dH47nPUt0MmzUxA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20CF11F000C7;
	Sat, 14 Nov 2026 00:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794615232;
	bh=YJIqsMHXUd36NytjdySw+FUQZNq6eqzvdp3DyLOfBec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UK4YRzX7Vyj7XxYAQmb/5XT8ft2ohXSHUZawNeIeuR0ILDdr9HtBxgWwUKBk2Jwpd
	 LAmF1VBLPxwWKfxxYA3LA5fwmJ4sSRlDrmf11oI9mrdl33kuoB4xqla8SIOCXAh0aH
	 ZkmRPFJJuYLLs6g3MIq3L5edUYRZuIQsN5kXKQMM/Am97wlYTXk/IYHl7BHCNxjwL8
	 8XlKBZfAZEBR9KyXIEjXHAdfAYjVq2aDOBZ16mN3Pd48ieKhES/rRQn5hh/5Q2D+9R
	 RDtoUsFlTCyT61vehsaSbiFAtelqbX2Eri8MowtOr2l/+rJUExbAOJddd++u6rsYWf
	 7JdkCltii3Ggw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9DB9949BBB;
	Sat, 14 Nov 2026 00:13:50 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 14 Nov 2026 00:13:52 +0000
Subject: [PATCH 3/3] arm64: dts: rockchip: Add IEP2 deinterlacer to RK3588
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
Message-Id: <20261114-iep2-v1-3-a8edde5a21e1@gmail.com>
References: <20261114-iep2-v1-0-a8edde5a21e1@gmail.com>
In-Reply-To: <20261114-iep2-v1-0-a8edde5a21e1@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Alex Bee <knaerzche@gmail.com>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794615229; l=1739;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=WgCd6FsHVVdbiiKnG9YJDyBq5Nk8EKW+LFZEF7P5gec=;
 b=ZDkYJl5rlhy4ikFsVvxMmPNwylnSlks+4jVcGClUXWdaR5HiEWXTskWM/CQq764zS2h/UVIv+
 UFc2pkGlrtTCeQeHdCvKdqHns76LCR1Oz5Rerec4vd/2zx0jWdwHCJT
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Add the IEP2 deinterlacer and its IOMMU to the RK3588 base dtsi. Both
share GIC SPI 117 and sit in the VDPU power domain.

Addresses, clocks, resets and the interrupt are taken from the Rockchip
BSP rk3588s.dtsi (develop-6.1).

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index aa69fd3793fd..5297519bd251 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1397,6 +1397,28 @@ vepu121_3_mmu: iommu@fdbac800 {
 		#iommu-cells = <0>;
 	};
 
+	iep: deinterlace@fdbb0000 {
+		compatible = "rockchip,rk3588-iep2", "rockchip,rk3568-iep2";
+		reg = <0x0 0xfdbb0000 0x0 0x500>;
+		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_IEP2P0>, <&cru HCLK_IEP2P0>, <&cru CLK_IEP2P0_CORE>;
+		clock-names = "aclk", "hclk", "sclk";
+		resets = <&cru SRST_A_IEP2P0>, <&cru SRST_H_IEP2P0>, <&cru SRST_IEP2P0_CORE>;
+		reset-names = "axi", "ahb", "core";
+		power-domains = <&power RK3588_PD_VDPU>;
+		iommus = <&iep_mmu>;
+	};
+
+	iep_mmu: iommu@fdbb0800 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdbb0800 0x0 0x100>;
+		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_IEP2P0>, <&cru HCLK_IEP2P0>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
 	vdec0: video-codec@fdc38000 {
 		compatible = "rockchip,rk3588-vdec";
 		reg = <0x0 0xfdc38000 0x0 0x100>,

-- 
2.55.0


