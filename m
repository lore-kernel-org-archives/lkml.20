Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB1F49DB8C;
	Mon, 31 Aug 2026 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186074; cv=none; b=u5Kf4bHsqZXg6BR6SLowjyz7xO9Ut8A9qMg64ncouio3jHx3t+xFimWpinMFZEblERc72Cb/D89bgmIMCsr0Uyw7vkBOaEjLBCgiDTpiTQDFohzfNzbRGl4uYWxORvxm6Ee6dct2/CBtV7JRJT4KzZhuWHK2j76pRixpQA98nNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186074; c=relaxed/simple;
	bh=jQGe1PtAhQMRwl2j6h3kMRJF5gC2+JoaZmJbWhESsdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MMbydIsGbiqNComqDNJZoHnJAofR+NDm2R9W365fQAibchaVgjG5NdT0kfkvcDxd6TwRWVoz95ooVQsDtgM5Qk5NcTpB1kDoS63sKOplV/NQzEsp6kq/C088YosjGYfcLUSp4L1hd4Wl1FKTRMfc977ZXZSbrgJHnKnkuV+yJc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R+D8SDzn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R+D8SDzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788186071;
	bh=jQGe1PtAhQMRwl2j6h3kMRJF5gC2+JoaZmJbWhESsdo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R+D8SDznhGpfutLGK1KgkbWaS9Vd703keD2UzF504Lkj0AZcNh5shHfUtJONoE46D
	 4zsZOUG4uj+OPjMhB0lUFBqufWbsFUBAq5D1+s9YpLBaz51ta64/QFERI4CtU1/Pd7
	 1sWrZJX8OkA76q9SLyjVsXmIrACPVPYx64ivSsLcPfaxmu/nRnS1YSWJHKvOaeaIaW
	 /12t2LBPcXH0BDYa6Dnq90Ur76K+AFjtEgBzM8aik6dIfw7+0cyyU6l+FMQj28p+iT
	 VPF7CFO4SyueN23s48MHzE5f36lvH5iIE+YNod9eeYoV8Ra6zVEz1OtQwg/9Y/RkIA
	 yLAS1+McJjfcQ==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8442A17E0069;
	Mon, 31 Aug 2026 16:21:09 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 31 Aug 2026 10:20:52 -0400
Subject: [PATCH 5/7] arm64: dts: rockchip: Rename rk356x HDMI audio card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-fix-rockchip-hdmi-audio-names-v1-5-5b155ae05293@collabora.com>
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

Rename the card from "HDMI" to "RK356x HDMI" so it identifies the SoC
in user-visible ALSA fields and no longer collides with the identical
"HDMI" string used by other Rockchip SoCs.

Fixes: 697ee8546e241 ("arm64: dts: rockchip: Add HDMI audio nodes to rk356x")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd39..98785c812fc4 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -150,7 +150,7 @@ scmi_clk: protocol@14 {
 
 	hdmi_sound: hdmi-sound {
 		compatible = "simple-audio-card";
-		simple-audio-card,name = "HDMI";
+		simple-audio-card,name = "RK356x HDMI";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <256>;
 		status = "disabled";

-- 
2.55.0

