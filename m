Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEFD45562C;
	Mon, 31 Aug 2026 14:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186070; cv=none; b=TSxD7b78tmdMcCiLHFa2MZJVyzCqVorT41Djx6Pepy3tLyu2tHk9xl0pZBspy0xa8JerE/XNpPLHnT9QNuvvsNidl7q4EqakcoOOBn7QZmyH3GpiC1xrtiEhSkihacnhDA2loPjFtqoFa4+NaA37Ol9mcUbbiSgHVeFmUwTXDS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186070; c=relaxed/simple;
	bh=DoGowj4v55nBBEq+iip4Zm4WBOyuRaxvLazd1hFH7tA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KL8bD2PNbmRP07Ar9gaGksa8BiUQMK2pjt0iEphDskLnzEsJuJgYcff7oae2RixxOnq3vwaNbpIZrfuuOk3G4yEy2DYu6UmiIZ0l2YTfP64eqDZzM3k5IWL9yJW4vRMct9rccD8BpSwM4Ppo+jb3LnljxsQk7Ot9bXMegfw2Y/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ioYwR7bF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ioYwR7bF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788186067;
	bh=DoGowj4v55nBBEq+iip4Zm4WBOyuRaxvLazd1hFH7tA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ioYwR7bFag6lceul3rzKe6/c5ri9r9A1KebKXQ5fVlSIp4ZAcWjaSdBJ1YJF6Zax0
	 xUJD9APCEG+JEvSB5UKcAsT60HqCWxIWMPgFNP2TVsVRrGOkDUarAVHEm3nL4jfWIN
	 KrBv8LVKmolKJZOdU/BNJ4PI74l12B1FBw8z8lmd6d7BsWJ1jPuImuVSxF+1SJHwbp
	 t4YwQJOHfpuSGsthwTQ4EVS83h73iPVOmwTPNPix6BYofolpFr08No9qc9+UFV/7AV
	 RZC8s7EZKJLPReyjl3vo/AuTUnttQGfl6lCFZ0lFiXBOFcEIeV9CAoSX5TJoHu+5ZB
	 zlQO/qRBasr8g==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2742C17E0F70;
	Mon, 31 Aug 2026 16:21:05 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 31 Aug 2026 10:20:50 -0400
Subject: [PATCH 3/7] arm64: dts: rockchip: Rename rk3328 HDMI audio card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-fix-rockchip-hdmi-audio-names-v1-3-5b155ae05293@collabora.com>
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

Rename the card from "HDMI" to "RK3328 HDMI" so it identifies the SoC
in user-visible ALSA fields and no longer collides with the identical
"HDMI" string used by other Rockchip SoCs.

Fixes: 29e8976e604f1 ("arm64: dts: rockchip: Add RK3328 audio pipelines")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 03b7c4313750..26c9f4558ed9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -207,7 +207,7 @@ hdmi_sound: hdmi-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <128>;
-		simple-audio-card,name = "HDMI";
+		simple-audio-card,name = "RK3328 HDMI";
 		status = "disabled";
 
 		simple-audio-card,cpu {

-- 
2.55.0

