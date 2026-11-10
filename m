Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305291;
	b=bXjSUNIidSIBuxlcF+qzlSqjZ2T6sB4Rg5QYxA6VzfP4O0ugDofOKsyD0YCbFEr1yOqB
	 0+khtbNxxOh/ya6N3LIBSF47qJhLvB/UiYaPcVouR9/70R0tJq5kjPx7iqOHWT8ESMxrK
	 g8L3DTfiFCm+3dMBxpaEQqiw8uN8zrz6+lx0I0v0RA6oZUxvLxLKfZLUIwYXbQf+4buCf
	 Y8E2FZfyqZsGo9GnQJZ21/qzNCNsWVnWjaMq3hVNLBPy/OTtTn8SGNbkTWvNCZP0zJY1m
	 cmcIMRWUO8fmHx9oSQa3kYhEM4bRE1NjQtmKGMj8+CacTdVTlbn4hNM6K9G76zukV9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305291;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=U6qxJU6eC3Q/bchS7RacWJNWxRDNMV4uNktgoQL7w8Q=;
	b=1Vk6p6H20eKWgL+Ep4/xsxzbX1QI70sd4Zlr9S54X6+zgTfeGTOfmsEVr80RPCfv3YUr
	 P9wjL4jrc5M9sTBselRco9lz37QyZt8MnnACSPQbDhMv5etpu+5UM2CTM7ptq6R8jMSBp
	 HAsV5nQLwB+3gU14ZNqjQIyF4VTyNYjR8jCGxUpkVgOzbF5rl8oDROmYzF0N/lYhZ0LtE
	 T6t8uP7JSCDZ2GgpkqVgiC4KwjQk6s7At4HZpMPR8x4oUDiPquZZ6rvgUGVUdeEDSol70
	 E+t2XH85tz2miQ1MSjiZ139gkhCAIhOEHp+qKtGVUlFeJM6L3xR5WAP6LPuLT3MKxPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hkElKgQC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBAE606B50E;
	Tue, 10 Nov 2026 10:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hkElKgQC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305291;
	b=3oU0SDBegbA21IVpz/wd/wLmf73gLyCSpODYunpZkYE4vo7c35Um5Fh5j1AbaoTnrfB6
	 zPzfAFybxcjEN0MAkoCffLTgKz6gj4DmNmxG2Uax7jfVkh+sqZdQuwPD/iRVSDTvLKh8v
	 yE64JDlDvmT5wOYAz476kAbxjkaHbFGTGvIp1S8P/pBSt4qqZ4COKYzzhewuqKe8Xl+Fz
	 9yjXNWD5FkzRyKHo2bJJSTinuSY/gKvU5ELt78rQUqk2c8KOCcTIMJSzH78NcKe0BeKlc
	 gmmvZzxORgprVOznIyDuO+lz39XvHr24L051djFbIJROsLbzdkmJDftVTtmCgoRNUcg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305291;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=U6qxJU6eC3Q/bchS7RacWJNWxRDNMV4uNktgoQL7w8Q=;
	b=wtTlIG20j+2SsiDpTOJjjKVjPuVK2jFIOi33QP47bvxZxNz/1BV5qHfEeHzUJXPYtci4
	 Yq8Ml/Dx3AgcUbMQD5G+oeubs7vdd6Mhbyq+P1wRuOSNotaq4uNR4kcyaglECBb5Xlthe
	 +1p0GPlYj6vW9acb58heox3WK1i2OswusVfvNL8GXrw3uAdbx5KaF69gTOZJE8qJbnhNL
	 fXTF1eBlUfeFmjJxpWLUjt1gussRL5Wm7gfXtPaIUG9DfZIYU+PkFbHSTnTExztjn6+Ah
	 aAuHNBYPc2Qsh09LR17OJzNMsSla7iGPD7gVK8YpNLxCzfbWUvmoCz61uTFljSoUShA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5CA871F008A2;
	Tue, 10 Nov 2026 10:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305291;
	bh=U6qxJU6eC3Q/bchS7RacWJNWxRDNMV4uNktgoQL7w8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hkElKgQCF9iJFu5nJZ2/fX0ANR7TzUr3kN9lcdSg699suV/Jx+BLLA9udQRtO9tY+
	 //y9BRG5HQW3iRiGdg6wLQ/D8HOr0H7QxEMYEIKivTfDsBq9nh3Rp3IQ60YnrKGzOZ
	 ZZegptyrjXGNj+LzsHPnXyO+8SSGJNtwG5cJyj9gjPFOOA2KO8VZ56zeKVGVXMBKcb
	 aQizxFyuKe7mxGDBh96lc6nF7wyIixlQgAybx2ZwYImByj1THyIZr90u0nG2SjZlzT
	 H/OV+dp7qdLoo0+AZtoxMXeaTTt+JKZmmyLHPHS1ngzUq2qTjwXpY5QylZQBYyip6c
	 hfgcE8ZQkm/zQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 20ECB48AEF;
	Tue, 10 Nov 2026 10:08:05 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:08:14 +0000
Subject: [PATCH RFC 12/12] arm64: dts: rockchip: Add the VEPU580 encoder
 cores to the RK3588
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
Message-Id: <20261110-rkvenc-v1-12-ea8b47122d8c@gmail.com>
References: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
In-Reply-To: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Jiaxing Hu <gahing@gahingwoo.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305283; l=3181;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=kagifa6Lmg0J/Xo2eD/GKAYer7IvTfvqdz6aGlCXzQU=;
 b=Z55zyJzLXjk5M0iOHQBuQmkiC3qqZVinOuzqIhqBgV9OAHTjmiFRh0C7Jcn5sf5tp6ip/f6hn
 dUnPCBOY7WSCOjYQ4VM4zLV2TEaEVljLIwKq9tLlNcHjTz+3XVBALkU
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Add the two VEPU580 (RKVENC) video encoder cores and their IOMMUs.

Interrupts, clocks, resets, power domains and the clock rates (500 MHz
AXI, 800 MHz core) are taken from the Rockchip BSP rk3588s.dtsi. Each
IOMMU has two register banks and two interrupts, and keeps the BSP's
rockchip,disable-mmu-reset.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 56 +++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index aa69fd3793fd..9c813e6475c5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1397,6 +1397,62 @@ vepu121_3_mmu: iommu@fdbac800 {
 		#iommu-cells = <0>;
 	};
 
+	vepu580_0: video-codec@fdbd0000 {
+		compatible = "rockchip,rk3588-vepu580";
+		reg = <0x0 0xfdbd0000 0x0 0x6000>;
+		interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVENC0>, <&cru HCLK_RKVENC0>,
+			 <&cru CLK_RKVENC0_CORE>;
+		clock-names = "aclk", "hclk", "core";
+		assigned-clocks = <&cru ACLK_RKVENC0>, <&cru CLK_RKVENC0_CORE>;
+		assigned-clock-rates = <500000000>, <800000000>;
+		resets = <&cru SRST_A_RKVENC0>, <&cru SRST_H_RKVENC0>,
+			 <&cru SRST_RKVENC0_CORE>;
+		reset-names = "aclk", "hclk", "core";
+		iommus = <&vepu580_0_mmu>;
+		power-domains = <&power RK3588_PD_VENC0>;
+	};
+
+	vepu580_0_mmu: iommu@fdbdf000 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdbdf000 0x0 0x40>, <0x0 0xfdbdf040 0x0 0x40>;
+		interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVENC0>, <&cru HCLK_RKVENC0>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VENC0>;
+		rockchip,disable-mmu-reset;
+		#iommu-cells = <0>;
+	};
+
+	vepu580_1: video-codec@fdbe0000 {
+		compatible = "rockchip,rk3588-vepu580";
+		reg = <0x0 0xfdbe0000 0x0 0x6000>;
+		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVENC1>, <&cru HCLK_RKVENC1>,
+			 <&cru CLK_RKVENC1_CORE>;
+		clock-names = "aclk", "hclk", "core";
+		assigned-clocks = <&cru ACLK_RKVENC1>, <&cru CLK_RKVENC1_CORE>;
+		assigned-clock-rates = <500000000>, <800000000>;
+		resets = <&cru SRST_A_RKVENC1>, <&cru SRST_H_RKVENC1>,
+			 <&cru SRST_RKVENC1_CORE>;
+		reset-names = "aclk", "hclk", "core";
+		iommus = <&vepu580_1_mmu>;
+		power-domains = <&power RK3588_PD_VENC1>;
+	};
+
+	vepu580_1_mmu: iommu@fdbef000 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdbef000 0x0 0x40>, <0x0 0xfdbef040 0x0 0x40>;
+		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVENC1>, <&cru HCLK_RKVENC1>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VENC1>;
+		rockchip,disable-mmu-reset;
+		#iommu-cells = <0>;
+	};
+
 	vdec0: video-codec@fdc38000 {
 		compatible = "rockchip,rk3588-vdec";
 		reg = <0x0 0xfdc38000 0x0 0x100>,

-- 
2.55.0


