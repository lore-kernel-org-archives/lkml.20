Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C053DCDBF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484787; cv=none; b=liGChxZsbJKK9oGfLMo7KiYfR4i10020QSR+1j26+xLhdhqQEyxY6FPCJeXMGOeW37zodLhfy/Xh7sPm8eb0882Oe3CyLBqOC31Y3LGm0pXioR71HzeAW6nYoZN0JN3FPRHzNLBz+NPXC+qCVQgT0hzeHjNkMoKXo/lbV/9wUhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484787; c=relaxed/simple;
	bh=aDQ/1e1Xg3m88hGXk0Rm2Is+cqI/LbDQTr1ZWB0+sQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bWi6oRSA3itI0G4bZ/VQk17qEJI45XLOWTHc3KcSgkfXiGjeJEkURq20Nw9sRNeq7pJ+Lj0gbVPVfBu7zMLm6bBaX8IW7Wi6bPXiKAMDIuyLC5eRQWte4zAsAVBkQBdvmTdkyyS084ztK6bCJcd3f9vFR96Z0JX/PWO2CsJMSW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=htWbhbm+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="htWbhbm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789484779;
	bh=aDQ/1e1Xg3m88hGXk0Rm2Is+cqI/LbDQTr1ZWB0+sQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=htWbhbm+cbRnv7zFxt4fnhu70m1RSCuAWH3x+cpebu0cndrMsuP53pUn4hzfw9tKW
	 mSy05XlKKqaSfQUr4pzuWk61e0zsWB6gSA6nJu4lksfIZys4elhMegvxlCmn9iVAok
	 hiGMVsF0XKMSqIbDoeFtWQzGg6ZmIFzIttVCM7RthLf1fb6NGA/YAZZ9V/ha6vkG/U
	 Ybs1XTyP+pqufI4viBiCn/QgdxLWd9UACnKQcFVPn27rl3gsJ8BuxCSiRYeXmI38Sj
	 EGk+fLVAZ4lpZevo0VZzHs5S6otB2VB4PDp2vg5nfmfVhAu5jlYPEEGv8cXLZZbiv5
	 0xxsCF0ttF49w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EF8D17E0E3F;
	Tue, 15 Sep 2026 17:06:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7056448004C; Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:06:14 +0200
Subject: [PATCH v15 11/11] phy: rockchip: usbdp: Only enable USB3 when not
 in high-speed mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-part2-v15-11-8d507cb1174f@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aDQ/1e1Xg3m88hGXk0Rm2Is+cqI/LbDQTr1ZWB0+sQ4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpXupz9GLsg8nfTYzZWLzNzFFiWqReisegu
 H4r80Yc2ZkwK4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqV7qAAoJENju1/PI
 O/qaNqAP/2JM/g1kB25CekaV+kJr3qs6/mjsPNSnOel1XeO7Hb8fWdxbq78OYersVcABCOlm6f+
 vTDO5TUXIHg/c67D+qzcn95aiLAjPlI0Wy+nyqZnIMhh1aRRkCTWdzbORBIYgYC+qmjj6V8U1Zn
 WlYVLtn2Butnu6QDRT3PoYc9hwNq2YlDmWT53Hum4jjPfYNe5BMr58jDZ8uH/Kb08xUbb53Aahv
 gV4HjauwKOoheo3HxpnLRut5TkmmHgtlos11zLWulNhlKimw05MaUJH2e27unHtI/0wyzyLRSqy
 DxEMThsmz40NuxrNE6iX8pReW1/LzD/dUYh71kXKlGeCSUQ61+OMP0/21Y8RaGu+CpRhpZ/QsFq
 5Q5WqPRsV3Qrjn5K9TGDga97Ygpe4PA7gAB4PPzj6dkedM5+XJTlVLTKcdJfCliG0DWbqmTfTXQ
 dqYBPcyIMeEameuNBzb+GtOmj6nKNkT10rY3QCTxi/TjnbqXBZwmo3ScENmNDWB/w+hswEl4x4b
 I3Qy3ngJcyaK5I8m9IVTF2u2sAbF2/htWJe0M+NIZ49vq+f6CyUODWG5d02yqoKB48siCRBR3yz
 SUgjISO5y9qVX25bwzak32y3AzYfNv4oIQ0vpkN+nzbrkUsQoupw4awvTQvCqCx7QrKgbrdT8Br
 /G19HsRgYK+W+t4B8GKgqBQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Ensure that USB3 mode is not accidently enabled during PHY re-init
for systems that are configured as high-speed only via DT.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260626212424.C215E1F000E9%40smtp.kernel.org
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 9eb8e40f6afb..e748acdd2d31 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1008,7 +1008,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (ret)
 			return ret;
 
-		if (udphy->mode & UDPHY_MODE_USB)
+		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {

-- 
2.53.0

