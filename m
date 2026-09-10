Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DB34B5123;
	Thu, 10 Sep 2026 13:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047348; cv=none; b=cyJAWk5Txedkbm57EagZT9YlNejNUdnDWti3FkjBa3WgAzCrB8foeI6P5ma4o8yzBaDfwcXBjnsQe5LEWPDRiiorVB8xx4jzAOkfi5dMTXJfeWoV9KDo2O5eBLtuzoCEP3BRsl/hp7nbjJxlCk2QChO/3SXJG5dFfZhlkE9VyUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047348; c=relaxed/simple;
	bh=WW3bgWtvchm/ZVcwcd6Is+/46qWg55ayuKIPjH66+G4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c5AgCKdSOajPpARccn3bvlTK7ykVjDHs5zB01EAmn/KqwZlqQuhVcKro6KzBwLYdlV0QwI5hzqm7a4n0A6bWeVAmFoQPRQcgTcmqzYll2+vc2WLwVXDcb6vfaaOyqmwkfN5H2U3F+ZFvcS3X/14voV3PP8nV/AwyB9pc3wqmjOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WaLMUQSl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WaLMUQSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789047345;
	bh=WW3bgWtvchm/ZVcwcd6Is+/46qWg55ayuKIPjH66+G4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WaLMUQSlhh3h07Nbscy1WypZiWeRgCtdUty5bDukiVtUWe+slwf2F+5mwo72TIszm
	 6T6Q9GhSwTMpD21k4q6ue77OEJJfShmRKASXhWyGIHHquFBLPY/iDfVRqQk4OXHc5J
	 pVYgJ8iLZbH4QE9D5TOqI0qtxsKUJBgF+TWOG4xR76WFh4n0Gbl25hw+KKg6WErh1G
	 6DVeIKVnsb5hhNcsdjPAKN9gpUAfjTCorZdxvufBadjCL9MIeJ2fTcG8PrJG5byocv
	 XAHTnomjWRar1KzjhajgPr2iG/PREbZllrHeEFekek6serh1cSVAc+rcCnZ++JXJFG
	 R9osiRz2gQf2w==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2FC8917E03E1;
	Thu, 10 Sep 2026 15:35:43 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 10 Sep 2026 09:34:50 -0400
Subject: [PATCH v2 8/8] arm64: dts: rockchip: Rename rk3588 HDMI audio
 cards
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fix-rockchip-hdmi-audio-names-v2-8-1396a6168e20@collabora.com>
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

Rename the two cards from "hdmi0"/"hdmi1" to "RK3588 HDMI0"/"RK3588
HDMI1" so they identify the SoC in user-visible ALSA fields and match
the naming scheme used across the rest of the Rockchip family.

Fixes: b8c6c136971c0 ("arm64: dts: rockchip: Add HDMI audio outputs for rk3588")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi  | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e0786..7892e18a7835 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -376,7 +376,7 @@ hdmi0_sound: hdmi0-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <128>;
-		simple-audio-card,name = "hdmi0";
+		simple-audio-card,name = "RK3588 HDMI0";
 		status = "disabled";
 
 		simple-audio-card,codec {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index b251bb129cdb..2bcf30d8a338 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -11,7 +11,7 @@ hdmi1_sound: hdmi1-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <128>;
-		simple-audio-card,name = "hdmi1";
+		simple-audio-card,name = "RK3588 HDMI1";
 		status = "disabled";
 
 		simple-audio-card,codec {

-- 
2.55.0

