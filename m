Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794475353;
	b=xiiiqqCmW/rEvNERFRn+JS2QailwP4+GX0Xdr2l46/3NgZjCjzY1+3h2wVMJmcPEdXtl
	 0GtXRD2tcawHNYAC1zNX0Vv1d8fWLnwHcpLARtYLDGcXiWfGMfv88rhwMxIs48ITsUfn0
	 vva6bBoQz+wFJcw9//nRuug5/BUQBSQK3ANpYbjp4a5vLZ487R9qFtcegFY/OrgOSCBIW
	 AEW9h2+lL+8A6BuKe6zdz85YUuI56wYmEwscRfQ6olPpnD4XwWaRPcbcl/r5JV9VXF/hR
	 k8NGEeoPzwU6L8JjtbLm7/iInBKp5r3qT/2m4ko3JStl9pCToLvJ77K7pNg7CSMr7hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475353;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1qmmBTGs9JqDhg2KV5f+IlYN+JpILY0qcFVik6CVIpo=;
	b=ahj/m0Hq08etGKbfyGR4ma6s/62m503/ScHbMbkG7efHpRXOt9JWyIdmp22ERjbuUXrN
	 PF/5ywwd/LQDW7xdRZrmrjogrqmGIOidIDmbIErrkpIyZ8cmKwmALGdj+V4mj8m5W9vwN
	 ljL/82PgEba369NIUcihboymntROIq+cHre8g4kQqPzDWNA86U/lesObGFqq6vZy8Bqk8
	 OsFFj7JAUKUeM5dqcuLCtdeLbq2XZdR2D9XVnmyfymwR12vQBDd0rvJI3t7W5ZnQ65Jq6
	 sUOIhXQ0MmdI3llX/9ok0AzRLgv6LaE8SaYOin0YdcsF7jRsoJSB2L05S4Hg7IkMRVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BpEISMkX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBF4606A327;
	Thu, 12 Nov 2026 09:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BpEISMkX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794475353;
	b=qJ43XcreuWV9TZm9iALDHkFiT2l6BGN43GSw7RBLyphU+EZzHR0T2eIBYeW73ziwoWSw
	 epGD7hvC8nOlSOvayqADmcz0AsIVJXo5BMkU+Idy9QVvBkMSS92J3Aq+a4noBKloS5cDM
	 eI/YPX89+RbOzXsGYYbyqKo2/hcb/pMt3GyMFOkaKWjg3seJhPGyQnYI8uOTW3A2rBm7r
	 B3hw5GBzn5QbEzKS9do/1VpzgRU8HjiiOU+0dIxm18g+wInN+4DaSy9H/R6v91gLWhLRV
	 2fGQab3ItGYNtYTZ2vR/E8yEyIPwUBz+MeSjTCAni+gplffbB/hV9lVh1VRG4bF9EqQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794475353;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1qmmBTGs9JqDhg2KV5f+IlYN+JpILY0qcFVik6CVIpo=;
	b=WRXwOCo7fvTYKXWxNpUdBhhda3p41m32zt0spd/AONGORuj2kS9dN9PQ3chz9hZyUx63
	 fB2+ssdwFyztg1f2wiB0GN3bWDooUL0pbhFmla3rUB+99ZKw+SyhPqKX0i9ADy1LQ0kNQ
	 vwCWuMZmfiNLwqzM+VRcSXYlhdp2gydQLdHDMmptncfSmFXSy4eYDW5l9jz6mp7ejE7DS
	 exx8VhnT+/9nN1ITeSLy4cHpTyxxu5tzsanWtfZjCa3JbEfw0qi+i1nh4vk02JF7ngMgK
	 Us7QhuefJIYr/Yy4BPfGAcj3IiuXJd6bS3wQuaoZsYs64AvOcL/Wn082GPiiX6zex6w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08E851F00A05;
	Thu, 12 Nov 2026 09:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475353;
	bh=1qmmBTGs9JqDhg2KV5f+IlYN+JpILY0qcFVik6CVIpo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BpEISMkXprugSRPnnTxs4oGtHH1j1+k0hQ5tlGyWRvPj2SSwfWwm9seGJxw5EDrm5
	 /ifk1yzelKb5BGWuuyHjD+F/tTLKj4T1uuo+M7BVo2/17xNU7SgXMkw9H1qJ25UOCt
	 JAMPVL31jPf5dzjnQd5MTgc7qgyGDEKLCE2NG8qMCMfjw8+feeYL0j5LEjufXZB2xB
	 DpJoU3+OkSBfvo3zg0xHpIPyK3p+eyfnSTWg2kAvghHyTKAXHD2o1pK2lNo9AsH4KM
	 Qwc8LyyyReyCGbYM9Re6gsNMAd5nwDMnsX1bRAxY+oDLYQr1bHd9dmD5Ibm02BRzYx
	 U1jJYpVgto4Dg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 74EC649427;
	Thu, 12 Nov 2026 09:22:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 09:22:31 +0000
Subject: [PATCH v3 1/7] arm64: dts: allwinner: h616: Cover the codec RAMP
 register
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
Message-Id: <20261112-h616-zero2-dt-v3-1-1cd2664230c8@gmail.com>
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794475350; l=1252;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=BSR+K6Y2s3B1U4tlKARegXXjsMuZ0Bl9ncjh06Y7t+g=;
 b=KNTXMXut4viy9TY452JyRdQBHoNlpYPraV+pYZXj6iHthXrUN9sFQdPj54XGtu6KBbbHe/bci
 8VjlTat1qFqDwyJc0ZYw7eGKuJrtlDLtT/ly2az+tVK6uZm0NiKF7+6
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The codec node maps 0x31c bytes, but the H616 codec has its DAC
RAMP control register at offset 0x31c (H616 user manual v1.0,
section 8.4.6.56), and the sun4i-codec driver uses it: the H616
regmap has max_register = SUN50I_H616_DAC_AC_RAMP_REG (0x31c). The
access only works because ioremap() rounds the mapping up to a page.

Grow the region to 0x320 bytes so that it covers the register.

Fixes: 3eef85034c96 ("arm64: dts: allwinner: h616: Add audio codec node")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index e4e0b999473e..68bd6137c316 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -806,7 +806,7 @@ spdif: spdif@5093000 {
 		codec: codec@5096000 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-h616-codec";
-			reg = <0x05096000 0x31c>;
+			reg = <0x05096000 0x320>;
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_AUDIO_CODEC>,
 				 <&ccu CLK_AUDIO_CODEC_1X>;

-- 
2.55.0


