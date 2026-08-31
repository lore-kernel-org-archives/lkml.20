Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22D44499B6;
	Mon, 31 Aug 2026 14:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186068; cv=none; b=hhgBcepQ++d0zk7Rct8lKlizy/DrPjwQJKW7r3C3DsMjAZzYNXtJm4QrphBx01dXCUagZQq1Cy7M1sbTOrAUFrnA+bynftbiJv6/+rIgmCQPzlVnXcyCnGzRLRYsl2mwsOb/FHCjEW6uAb5c9+qqWJ2+nZwq5pWnQOet3LG5TsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186068; c=relaxed/simple;
	bh=FhtiaZ2Qzu9sS1DBggkgNh9n1DpPL5VKV7ZWJoFJtDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ME/kEZIGxaw7wVuDx9vhrHm5+SrHCM9wNZ4UzL0RUUoPZTWO3sOOpoY3PQqlMvzXzp/RQICRf4MSySU9NV4jujL6jZfT0CksmQYXHfbFWfR07SD7y2KbhNBo5wSFRd0XGxvSkLnz+t9UhznrxS7k8gb/BEmojvX+XFfTHHIRfmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H0wWhTgs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H0wWhTgs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788186064;
	bh=FhtiaZ2Qzu9sS1DBggkgNh9n1DpPL5VKV7ZWJoFJtDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H0wWhTgsLb88QkkUHetTPsq3zHZSSM7eJKZgqCdJHIvwhwnpb3gse72alyDDqNN0z
	 muuSdx+6PFaXxsEljeK0aMT9etOyaMOafCt1t5E4HgvjQOSGpOmpQCExjWy7FfJUXJ
	 l0HHoe2KYiG/OqbbC1lK4DKcJ7IXUVIeVsCWpyPsngHycbKG0FVJcGNYTCP5IfRz18
	 SaQl+NaEI7ovxWXrxSufT1tfZT2Sc5effjIRS45GXVSaxi5kq79SR4uwrQb58RYDmL
	 DsfqFIvMPeuGhCRi4Pu0an42jWayVG14rlu3Wd70+8EGsL6fQKjuzHyFt7CAmGT90/
	 37L6en3CDcARg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED1D617E07EF;
	Mon, 31 Aug 2026 16:21:02 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 31 Aug 2026 10:20:49 -0400
Subject: [PATCH 2/7] arm64: dts: rockchip: Rename rk3288 HDMI audio card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-fix-rockchip-hdmi-audio-names-v1-2-5b155ae05293@collabora.com>
References: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
In-Reply-To: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Johan Jonker <jbx6244@gmail.com>, Alex Bee <knaerzche@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

Rename the card from "HDMI" to "RK3288 HDMI" so it identifies the SoC
in user-visible ALSA fields and no longer collides with the identical
"HDMI" string used by other Rockchip SoCs.

Fixes: 2a91dcd5be9d ("ARM: dts: rockchip: add HDMI audio to rk3288-miqi")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm/boot/dts/rockchip/rk3288-miqi.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-miqi.dts b/arch/arm/boot/dts/rockchip/rk3288-miqi.dts
index a5f5c6d38f80..090255244c86 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-miqi.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-miqi.dts
@@ -82,7 +82,7 @@ vcc_sys: regulator-vsys {
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
-		simple-audio-card,name = "HDMI";
+		simple-audio-card,name = "RK3288 HDMI";
 		simple-audio-card,mclk-fs = <512>;
 
 		simple-audio-card,codec {

-- 
2.55.0

