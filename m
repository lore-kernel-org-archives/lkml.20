Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874E44AEBF9;
	Thu, 10 Sep 2026 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047345; cv=none; b=p7OvMtRiYxPFxZnxZu4aKYOsTmMtX2Q+w14u0qns5PIRn83bMWnII/myTQRa7g6Az0LPsHdViLIJEOcv8LkF+h23mXJtuVOjwsi/4oIb12MMYnHlbL1H+SDeKJ9ZLW1rUl+p9AbsFRdmlV1MaOi0QExc7BiQ6XiHQAnhHCJFSCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047345; c=relaxed/simple;
	bh=nnQom02Ih1qwesbG7H+t6ImlBeovlhLhrwVE7x/9+zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s8B+rDksrfQMRjCz4QVnIwZa4nKLHP8wSwSQZb25P9d2h30ivtf9ySLXYlpP0x3BacRnewlM8bs0ZhFhdVkMDc3qWPRvRMgoA3Vy2LytDv/7t4o6JTzAP/T0qYeSehOvEyUo8hNvWrtT+GNZ6hXfMLUld5yleHfRafRZM24boU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iSV8ptih; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iSV8ptih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789047342;
	bh=nnQom02Ih1qwesbG7H+t6ImlBeovlhLhrwVE7x/9+zc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iSV8ptihFp7WCxm7ch7BNjgbQ3h09TdIlCvHTN7EjvyL/qBbmS1B4V3xf2ZC+R/Oi
	 mVV9fVchze+fEFoCBkAPzGqwQ/6xVGGkLRB/j7WJQSU3DQbqb0fizFTc4ml3U2tI6W
	 btLggQMJ54F1EZEDWRYJvNb95V0iscnLkBnMMliTPSKaGBmQld4WT6fEZPI1VOI2/Y
	 1/SAsmwXZMBgwMMkFWltScA+Y7+bJ9sN57GAmUS1a23zDQBmpg3Cj2t3EVFW+rT/2v
	 /F5HYwB+BqW9kTbYoLbm4uS7OZ++KB+tZwp9NOCAeFpjshqmvW/FEDeP+59QV+cMN8
	 kdtxk43r0ZzXg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D6A4517E0D81;
	Thu, 10 Sep 2026 15:35:40 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 10 Sep 2026 09:34:49 -0400
Subject: [PATCH v2 7/8] arm64: dts: rockchip: Rename rk3576 HDMI audio card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fix-rockchip-hdmi-audio-names-v2-7-1396a6168e20@collabora.com>
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

Rename the card from "HDMI" to "RK3576 HDMI" so it identifies the SoC
in user-visible ALSA fields and no longer collides with the identical
"HDMI" string used by other Rockchip SoCs.

Fixes: 7f1561d82e3d3 ("arm64: dts: rockchip: Add RK3576 HDMI audio")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b0c0d3c8b1b1..ca9cbf035265 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -410,7 +410,7 @@ scmi_clk: protocol@14 {
 
 	hdmi_sound: hdmi-sound {
 		compatible = "simple-audio-card";
-		simple-audio-card,name = "HDMI";
+		simple-audio-card,name = "RK3576 HDMI";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <256>;
 		status = "disabled";

-- 
2.55.0

