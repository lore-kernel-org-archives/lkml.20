Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295054;
	b=vfi/wB83df+b2T2A4WeP3c+IasR0vFHkMKujUQYzLl+ZDkcKy2zZ9QuVrnmUzgjB3hi/
	 cjf42vcooFo0oFdNIrdLeB6K+w9ddYsUhT2nbl+v+6TiL7FoSTv5oclTrxrAyNgnrVGLt
	 rODwvTDb5dO7aNdaudrNyNkawPegoptgq+imsImARehoMvQpWrO8CczpLSBAcMwVhbTZI
	 x26+VRgMZzuMJAR4byZ+GVRYxnejv/oYHlZ1mA3OyaYBRPd2SjPPmKOEDdFmNpKTFWYpI
	 XXkiLWCVkfFTqpv23HIxkWJWyoEOIo6rh3hmMZlz5j3dI8CWYei7mGAxMFea2UJtohg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295054;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hkJlPuRY8tL1OTSJOZa4wT/JWT1hzd0z5NzQZiXqqY0=;
	b=FhWNwJuLnaq0hYVBeobIiagefPlOB5o8mMIcI8+AUuz+JtJvToWH9FGS8wiTQEhxiwYu
	 pQBTV3yvHEhbbMgy2uvaI2Js3YE2l4pQDuIC2L+bl6X0FTRdB+byr676GD30z2LKXJ/OB
	 T5nOSchnlI+JzcfKwqIljSjptfIL8MIXQErX9y1iDbfmZxXtNS1ZlhNzIbClmJlNb5TN6
	 bPb27smdiu2z9k8N42wFHHLKH0WOVg7IfEattGzDIDGaTJVGcP/EUYMm1l/UecZEeClhl
	 XfVSIu2F9RPuEd7MaoC4scqBEAqoKL0Qehld7QGVLz2IGz+kXJWE3Sta5ulN7r3PM2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EaH2H4uN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C839060A260D;
	Tue, 10 Nov 2026 07:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EaH2H4uN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295053;
	b=q9OdAmWlAETny5GU2DYTuT1ghuK/MHmGtK+8zcewetc3TUJcryJ8oMfG8uFCzLVTDaV3
	 iCFskQZxnRGst2ilJQFts0+YNEkXbTFs/D1J8iPKtPN3S+2IcXXxqgPQBUSN6Ok5pkV4b
	 2JdqyD50QqosVlavq+O/TONhLePZ8BrH20aQ6QVY0tmGyZdCWRdxBlWgA0GoTEje5EFAv
	 IGxhNw+6PkZGiRat+Q2zE0YPhsx1Jm4pOgjJL0JXcCJ57xmWaIDoMjeqXFQxoTEBNnuOT
	 Msc6FkZOrKlTvDBS6pZUGgshwj+pmSoXWWHe/9NZ5h4M0+Cm3Fu5kz64M5RM6YU4ODQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295053;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hkJlPuRY8tL1OTSJOZa4wT/JWT1hzd0z5NzQZiXqqY0=;
	b=UUQDa5inAaiKfrATbjZETD1t4jF6FM9sXGmmcwusmeRE4wAR79lrb5HBamq2YT5bKYcG
	 ZOVsXF1g4ls9afhB6o3idboMmuQsV/P5gdYTzWM848RGTxvqwNllgTeNpTbMWAUvCi5+J
	 z+9UG4OErEnl73//2aM086CCoXMjytR4wHeYObSBs8SUortxdPonkMiaakII0vzSak4H7
	 grFQQPEhHpN+rI6EFkcSjH9Pt5xVx/dQpSFzqrijrQvU/XSiJcSPh2Xu9HZhcfMdsF3Mv
	 Ow01XxbYCNvOnZUgKtYUNL3BjxXt+3dZq56mKcR0bxkrt+f2746X5TpDGMc/k0+cQCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E9EDD1F0089F;
	Tue, 10 Nov 2026 07:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295053;
	bh=hkJlPuRY8tL1OTSJOZa4wT/JWT1hzd0z5NzQZiXqqY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EaH2H4uNbXJ/MS3qMZodv0xz8DLpjc3kjaMJntOJMLyYr04km+rwrstrOhKLrEJC7
	 8blkPLVTVwNdg9laq6/lesikIpGHA2W+9T38qC4EaqhJvXbjQ3UiABv/3S2gEvHRjs
	 JhHAUjgh0L/4PLitST0rCxpw1B+DTUUoagKMnMiyfupxGlnpd3TxdwYtsClFKHVtXi
	 QGzzyKpExib3cpdAHoLo6DAvaOafP/ZLJ9ehhmTCfYOOR6XQ8L90wpMjCOR0Vlzgz0
	 fybP4uR+8XvbsU3na6F4ladMWeVDeiR7HxhoYYlD+aRWVaKEyr5B1bC8dGvL+la5X4
	 9Ko5G83lqDWkg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BF26248986;
	Tue, 10 Nov 2026 07:17:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:17:35 +0000
Subject: [PATCH 5/5] arm64: dts: rockchip: Add the reset lines of the
 RK3588 VEPU121 cores
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
Message-Id: <20261110-hantro-robust-v1-5-6b6269c05bfa@gmail.com>
References: <20261110-hantro-robust-v1-0-6b6269c05bfa@gmail.com>
In-Reply-To: <20261110-hantro-robust-v1-0-6b6269c05bfa@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295050; l=2157;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=oSfnGMWy5zf5A4EBvJXXAsGPhbLth5ASXA2aC2mihFA=;
 b=WRrPPMCfNRPj4F9cCnVxEwsaS7zHXGHQgm/SiJD6oKZrWvBoL6PKc6M9sxAP7ZT9gSKt2Z2by
 o69VnP0/EEzDl1Ic9vhqLlHaQLutQ9SI3LAk/QRudkt75zT0NNpzy2R
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Describe the AXI and AHB reset lines of the four VEPU121 JPEG encoder
cores, so that the driver can reset a core that is stuck after a fault
of its IOMMU.

The IOMMU of each core sits in the same register block and is clocked
by the same clocks, so these resets likely cover its bus interface as
well. This relies on the driver not leaving a VPU behind an IOMMU in
reset after remove ("media: verisilicon: Don't hold a VPU behind an
IOMMU in reset after remove").

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index aa69fd3793fd..227465d446a2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1325,6 +1325,8 @@ vepu121_0: video-codec@fdba0000 {
 		clock-names = "aclk", "hclk";
 		iommus = <&vepu121_0_mmu>;
 		power-domains = <&power RK3588_PD_VDPU>;
+		resets = <&cru SRST_A_JPEG_ENCODER0>, <&cru SRST_H_JPEG_ENCODER0>;
+		reset-names = "axi", "ahb";
 	};
 
 	vepu121_0_mmu: iommu@fdba0800 {
@@ -1345,6 +1347,8 @@ vepu121_1: video-codec@fdba4000 {
 		clock-names = "aclk", "hclk";
 		iommus = <&vepu121_1_mmu>;
 		power-domains = <&power RK3588_PD_VDPU>;
+		resets = <&cru SRST_A_JPEG_ENCODER1>, <&cru SRST_H_JPEG_ENCODER1>;
+		reset-names = "axi", "ahb";
 	};
 
 	vepu121_1_mmu: iommu@fdba4800 {
@@ -1365,6 +1369,8 @@ vepu121_2: video-codec@fdba8000 {
 		clock-names = "aclk", "hclk";
 		iommus = <&vepu121_2_mmu>;
 		power-domains = <&power RK3588_PD_VDPU>;
+		resets = <&cru SRST_A_JPEG_ENCODER2>, <&cru SRST_H_JPEG_ENCODER2>;
+		reset-names = "axi", "ahb";
 	};
 
 	vepu121_2_mmu: iommu@fdba8800 {
@@ -1385,6 +1391,8 @@ vepu121_3: video-codec@fdbac000 {
 		clock-names = "aclk", "hclk";
 		iommus = <&vepu121_3_mmu>;
 		power-domains = <&power RK3588_PD_VDPU>;
+		resets = <&cru SRST_A_JPEG_ENCODER3>, <&cru SRST_H_JPEG_ENCODER3>;
+		reset-names = "axi", "ahb";
 	};
 
 	vepu121_3_mmu: iommu@fdbac800 {

-- 
2.55.0


