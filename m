Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A85F49CF52;
	Mon, 31 Aug 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186072; cv=none; b=LR4QRBUjenSXiGz8D52Px5sDhHiE7bDR0kS6j3IG8B5SUyWRHgzJsOYl0K/Z3pIEY9xEQIfVlumFIY+d1JevDPHaC3S5WA9dFxb30TIRV842cvPr1BsDwgKY4oY/+i6scGA7tnAgLDUxwBUCm/MT/xbxNkgrqe8Wje5yEvC2LS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186072; c=relaxed/simple;
	bh=BoOMfIFPIGwvljgrOki6vDKw076yvIl6ObzO4+ZHHUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AcL4AU9h7MurrV7ggm8/Wuqh9zdzpGX0RX/lFfFqedrayZr0zoyhvuwHlTZL2H4hmGkxI2+6e+MPQ4qCHlZy2Y3wiJcMle1bkC2BVorL8UeD6BXFvASkXZ9sINFXzU8sXIae4o76c56Zuetm0aqw4qhKzg2w7r6i8Ta2NxL4kac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Rxk9dH0k; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Rxk9dH0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788186069;
	bh=BoOMfIFPIGwvljgrOki6vDKw076yvIl6ObzO4+ZHHUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Rxk9dH0kjGkwIRNigXnY1FhwnO2wSMzwnu+c8949x882pZohScVohFGOmoxPa43vV
	 ncrWDtadRtrp8eptHHCY1QknEqHi8IdtZimaS/Twm5qsNtuXzAhEuttxkN3HBgzs3+
	 KWxRR6EO/GcWjBaQRYUwkwD19nce3NoF+ylHgt8G2vdKGk3zmabzHh9UDseHdIDO0i
	 olDHNwdU4h2wJCjY4AeHjGpeIDzBau1G2WVWWn7l23kLmhyt2UU14oUFEAf/b4xjvQ
	 0FZ0GUWukPH4vrFK0PFZJo/9zPfK8b75wABx16QHxFenzj14LoV8TLFtAuWVGLI97w
	 6AN1CdnS3/5pA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 577DF17E0785;
	Mon, 31 Aug 2026 16:21:07 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 31 Aug 2026 10:20:51 -0400
Subject: [PATCH 4/7] arm64: dts: rockchip: Rename rk3399 HDMI audio card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-fix-rockchip-hdmi-audio-names-v1-4-5b155ae05293@collabora.com>
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

Rename the card from "hdmi-sound" to "RK3399 HDMI" so it identifies
the SoC in user-visible ALSA fields and matches the naming scheme
used across the rest of the Rockchip family.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 49c68fe65de6..c46e58d4af0d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -2008,7 +2008,7 @@ hdmi_sound: hdmi-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,name = "hdmi-sound";
+		simple-audio-card,name = "RK3399 HDMI";
 		status = "disabled";
 
 		simple-audio-card,cpu {

-- 
2.55.0

