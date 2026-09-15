Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E9F3DD847
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484787; cv=none; b=Ucs0qtB+UXX2QQFFiOc0uSgxDXlUxtYKpKgO+03FIfVZN+IVfk2nAEsH4YrgM5+GyJDRt3PJwaaoP82ss8UvrOvs2z3CPOuH1HfaWDpB2g6Vl7TFytj8wjzUMZXTxz8pZ6xjplKi/w2fY3qfiQ935WpUYD50vkB55QtZP0LG9BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484787; c=relaxed/simple;
	bh=PX3bW1sBE7HEbhsLaU0fKDW6DOA5Axs3TotiYYFI6k4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TnECWKnITKK0at/X4+4zwxP3t3l+H+2tHXeEU4GOblEdjVYsJk4Gap/YL8dY02aK9HvhbUuibFM/lziFTk491akphVU9hGR6Dg+kavTIGYH4igqalyYNWskfyDP+vSAeZtnrL1Lyh/NOkXP5VWq+HD6HxpexcNckN0pinQe+ok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W/pmP1la; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="W/pmP1la"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789484779;
	bh=PX3bW1sBE7HEbhsLaU0fKDW6DOA5Axs3TotiYYFI6k4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W/pmP1laxa9RN9kKhCDAeJCDoOp2/SM4H/Otop1uexGqCzo4mnOtRlLZRrXK8krAM
	 wyjan8pFu3i3iSmK+ActDRmkmzA0CSuUhtq+NDzGckBJXdaxUyjYKCmyMP6EFgyTYz
	 jdRelqkwUTYB9rw7dVH7McG13XwtOCJxF//R8cigiSBwcTJPSrKnGnHspBGA+grWHR
	 g4Beky0ZO9OndAKY+TEEIIDlbEMa0VMr3GPtM7ebLV98+7DMJW6vxhM6WIJaXvBFUw
	 gHr1MhVHdOMYDmrWRLlNlazR06+GcZMBxOvIKvuXeknk7eGnUXVLWIyQ+uXVyhvKt7
	 crd3CNhVf8eKg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 01C8E17E0D7F;
	Tue, 15 Sep 2026 17:06:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6CF3C480047; Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:06:12 +0200
Subject: [PATCH v15 09/11] phy: rockchip: usbdp: Avoid xHCI SErrors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-part2-v15-9-8d507cb1174f@collabora.com>
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
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=PX3bW1sBE7HEbhsLaU0fKDW6DOA5Axs3TotiYYFI6k4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpXup5pTCfJZPMKPAyDkFAvXceTFPoun30E
 qk56mvc29fbJYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqV7qAAoJENju1/PI
 O/qaeDoP/0wEZruFvau6rYIJJsEyN++PLXP+AP/4yT+KMIa7zZ/bMdyIg2O/CSLq8zbXtZpHt3C
 TdklKDfR8VSXdZ6UwyvgeRog7Uf6wcSMrykpkbYjZ7q1nnwNT9cFC2YWOnbgqMU70cJUmxEk2Z3
 qf8RbO7Fp9bIPnaPThieKMuBqMuo/OSybIaak5OJMh/BldmWRH5VfY2SmBJ/eiby2e3C5tNteBp
 Cuf3tAkyU0zqJfeulI494J2IUWXpiLRH1LKV+1db+TvKi1gIbScEL4pE9Kpcuo9cIsKzQbmHIA0
 0GBJCQZkV5JtPvOKYJo1zG9WxadIGICo0PeTJqSmIKaC1VKnZQdSoF5WvVkpGFP8wZY2BWsXWjy
 dcNNPJHUr5hlRFrdSuhGaX8gduilHkYuFdym3orBPcnkVatEj1GmLVpmUJXG/lNnOkAq3f0y/JO
 mNKXTovT3081PGu0bUpK0IlhrcmicgkURilLS2LMYkoj3qRvfU2FO0NMzokZbDWYi8kWdvH04Zk
 nrG137r8QWIBGkq3hkaovE+fGbcXBAcrav+acRiw3x3t2Qv23QYsi3fRyI3pFjoC/BK02p5tv1j
 BOCGZDm30Pil/A2BRXTwlSkiXTFfecKm55fM8E70jIGhEpJ9WvUCXYc2XGvLlw4Sf/Q3FAS3JD+
 g3rFSlhx6uxoHSfzp4q0uqQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The USBDP PHY provides the PIPE clock to the USB3 controller, which
means the PHY must be fully running when anything tries to access
the xHCI registers.

When switching between USB3-only, USB3 + DP and DP-only mode, the
PHY must be re-initialized resulting in a short period of the PHY
being disabled. If the DWC3 driver decides to access the xHCI at
this point the system will fail with an SError.

This patch avoids the problems by disabling the USB3 port before
re-initializing it. This does a couple of things:

- forces phystatus to 0 from GRF (not from PHY)
- switches PIPE clock source from PHY to UTMI (safe fallback clock)
- num_u3_port=0

The last part will be ignored, as DWC3 already probed, but the
clock re-routing will avoid the SError. There is a small delay
afterwards to make sure the mux happened. The datasheet gives
no hints how long it takes, so delay time is a guess.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 23cfb9bbd334..4116b4b18882 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -999,12 +999,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {
-		if (udphy->mode == UDPHY_MODE_DP)
-			rk_udphy_u3_port_disable(udphy, true);
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
+
+		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
+			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	}
 

-- 
2.53.0

