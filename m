Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD7649F134;
	Thu, 10 Sep 2026 13:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047334; cv=none; b=mXGNmssHNf+9iETSzPN3+3QamK2Kl3LKXXSg2kL8n7IgjldCw0z8XGQ5WZQWsmrF0KW7bm8GYYecLBGA6iNAJhovy/Pa61ZVzri9mC1W3VTl10tEtotvxWzb5uhMCfh4p1pWb56k384UqG0HMhBwJqVYgGqfcg7v5ma4ggy62iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047334; c=relaxed/simple;
	bh=FhtiaZ2Qzu9sS1DBggkgNh9n1DpPL5VKV7ZWJoFJtDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RTsl+9oiwgJebGt67dgz3Mu2/vDyt2crQFUPKxBYChl3pp3jySgruiOOcng1pn5lZLnOhjoPdxpV74IyezC+aAPYtbY0OPNWR1l8AfG1JxmooEyCovQZjFCl0lcrfJ8usSzsE8TVmrmwXhZg+slVH7mfZJ2Ky5LKgkbQFg06CMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=duW9rHep; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="duW9rHep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789047331;
	bh=FhtiaZ2Qzu9sS1DBggkgNh9n1DpPL5VKV7ZWJoFJtDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=duW9rHep6ao2ePurjh/DT6Xk2AluhQbDbizVdDqBhNGMhbpOh73CEtzYcM4xij5XQ
	 Z6fVzV7l8R0Y6yUOQ2OQGKRKlMySbeSF+48bAwUFRARgad12I9eIc+LrqqXb6J5I+9
	 AAjtgcwxzq/KQ53xvFCznEqvN8bte5GE/9qlwha9OPUbPob8YAt6yphO6LRdU9flck
	 T895qYGVOF1WegMjoSOuv94fk6p+3nrszsY3ouuO2BRpE3PPOmv5k5gFpOAHDhrPCJ
	 vzLvEBVPH4+2biz0D1XluyTUML/hR078aTMku8mFlvYppzfVmJC4zFmt3PL90rf+ye
	 duzr0IRAGZzog==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 32A8817E0EB0;
	Thu, 10 Sep 2026 15:35:29 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 10 Sep 2026 09:34:44 -0400
Subject: [PATCH v2 2/8] ARM: dts: rockchip: Rename rk3288-miqi HDMI audio
 card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fix-rockchip-hdmi-audio-names-v2-2-1396a6168e20@collabora.com>
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

