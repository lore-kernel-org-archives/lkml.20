Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730B249EC76;
	Thu, 10 Sep 2026 13:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047337; cv=none; b=VEi6OSQlYk6mt/QcF9VblUag9LHJ7jOBkfP2ztwivudPrOVXmcmqbVm3KSR/LyGSVoYqUgPFET7E6KROHovWUmfWiY+25PVG0WSXK6kAxGOzc73xoqcYl3GG+7kyL5obMMYu5+nAGEft1Emq7mf5uPE3WWTHELGMy4Apeht5PHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047337; c=relaxed/simple;
	bh=K3GaWrXHjf2WYX8MKuiARabxEZrrwlOOoHt64IJplh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P9bSuz7hYoapyJxHQszqV4ffXnnF/ZW47pBYI0wCpyXgBC6Dr42PrXSTRKGjwT/WfdLZSf2UcKAeH2eq6JZTd88jXR+5Bucgm3ME8Ki2Kf5ye1NPBmUCa6l/MNe5QN19qq3vGU1vO8ZMyAxhgeS2+YUU43ihbFLCblLHRo0twr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bF2WXemd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bF2WXemd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789047333;
	bh=K3GaWrXHjf2WYX8MKuiARabxEZrrwlOOoHt64IJplh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bF2WXemdZp8jQR07k+8iTE1cRzxyGbzgkZ0JeK6pyL1T4ntVQNPb5ADKg7ll5EOiX
	 F2DOeqJpflMo9BNf0/K9yviqyilyGRkHttIj9CxRQ1vIDyLcxwTpjt0BqIJ+pphYna
	 DRvBFLkVem59zKL7+FyIFVzuEDGmRZHfAPwjLvfGjqpxHQT2DumrE+PkgyMLm14kar
	 gINy4jWWQDt2YAznIL9fWDkk2cWxsHGORvWGZgIpZa3S0BkQdl8/DNDsUtFmvrot/L
	 /kFBEj8R8LMUKOxXxhfi99L70sl8xYQhVOZ7YeWvSPlAILkzc3tDmn4wKo9qx9nlOd
	 kn6eBhQF/RmmA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8ACB317E120F;
	Thu, 10 Sep 2026 15:35:31 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 10 Sep 2026 09:34:45 -0400
Subject: [PATCH v2 3/8] ARM: dts: rockchip: Rename rk3288-tinker HDMI audio
 card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fix-rockchip-hdmi-audio-names-v2-3-1396a6168e20@collabora.com>
References: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
In-Reply-To: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Johan Jonker <jbx6244@gmail.com>, Alex Bee <knaerzche@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 David Summers <beagleboard@davidjohnsummers.uk>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

Rename the audio card to "RK3288 HDMI" so it can be identified
user-visible ALSA fields and match the naming scheme used across
the rest of the Rockchip family.

It gets the same name as the rk3288-miqi, making the sound node
identical in both device trees, but won't be moved to rk3288.dtsi as
tinker and miqi are the only rk3288 boards with HDMI sound.

Fixes: e58c5e739d6f ("ARM: dts: rockchip: move shared tinker-board nodes to a common dtsi")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi b/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi
index 7e16022c7d9e..1caf49579ae3 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi
@@ -73,7 +73,7 @@ sdio_pwrseq: sdio-pwrseq {
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
-		simple-audio-card,name = "rockchip,tinker-codec";
+		simple-audio-card,name = "RK3288 HDMI";
 		simple-audio-card,mclk-fs = <512>;
 
 		simple-audio-card,codec {

-- 
2.55.0

