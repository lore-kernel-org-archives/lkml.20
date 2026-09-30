Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0BF3C378A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762691; cv=none; b=fatNcSbF+GjqOGhWVpBMEMfIOoN6mBAneqNIE+4YqUD5062Y2goKuaPGYIb+Uv5UZ2MbPPtV9G7I4FQh2amJsyZZ/H6+CVLSo5afWX6EmVuOkmv9beRfzLgUdNqlInQWvarn/nuVpS9FaFBFcjcec/dr6mlGgMNxMRxP3hW1Xhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762691; c=relaxed/simple;
	bh=k3tLVlyBPN989HKxzitfDPx7krJUQFuVM+/AxCBR7uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FXOTD+BgL+kDB1v2rNIrLF+24N3r8ClaO1ubxdr83/DbLE/j5NiyujU7ksG7l57Q8V6nszTN5wuLWojJGcS1Tu53fSSPix0CgDFzRdEMSHlkjC+1JM9iZr/5x4wvh52RAVKFGF12CaNtf79Le6FlCPNsmtJANvxD1VttxnP1i/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MEFJ3oBB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MEFJ3oBB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790762687;
	bh=k3tLVlyBPN989HKxzitfDPx7krJUQFuVM+/AxCBR7uU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MEFJ3oBB3zBcgwAr3HOJLgSu+UtWr367o+6czv5ihoTHUyD1gOYjHUENdgnzxNryt
	 dI2jPXxUOT7lNkHC+2ddoZTG1De3JZ6q4LDIHQ7nOyWWvTJqnlhX7lV8cFT67TPR/9
	 EFVdJtYzGnsbaatdOQeMcYpuIsEnORbK0mKelSeD4gMMvbOJ/rD6ycFPdg659exkww
	 nQPffktMTM9cmBEDGIWoiQn8OurrkAKP2VYf9FgVHEI+B9Se22Y9BR5NczC4I1fSMQ
	 RgGt+cfxva17UNgaQkTUAyOKstdxS//vIErxf6kKctA8OWlk7GQaaP6PNtKiKpy25j
	 K1GupMfMt3d/Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5DB9B17E022A;
	Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0EA49480029; Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 30 Sep 2026 12:04:30 +0200
Subject: [PATCH v16 1/7] phy: rockchip: usbdp: Add phy reset notification
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-1-bc144f80afc4@collabora.com>
References: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com>
In-Reply-To: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=k3tLVlyBPN989HKxzitfDPx7krJUQFuVM+/AxCBR7uU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq83r55erlFPsUkLRVXPNEuVUAxhbpvXlH4x
 rTw4NqWm/BMLIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvN6+AAoJENju1/PI
 O/qayZUP/2/x9jk1Jsd6kVgXg/ZfcwXWPuEiVWgaiAZcE1e77fBDpvr4DDd09YYAkRACwLu+1vO
 6D1Pchv+ZUuI9rNuAVPRNBpOPv5n2U8GiarlL9+z7VJ/7Bpr91zFMt+RnS70pctatW7lNERTw+6
 W8VmJ1p2xYn6zyyOwPYO0v7Y87DX1vqcda6URgl8vypQ+Gfi1/QIG6aepd088oH4V8TFe2dHaiu
 CFBMV0IUY0UJ5JW0bIk7mmw4/+egmJ941iANbvb+Nghm9fv/VgfAZVMmVkHsSWV0C7nz+D7aBFI
 OWmWci/PkwsjMcasxW+ma08ShwPyKg37MT27F4+FJAfvZawVFuYe+V4iyT00u3Kwaeph5qLCwEQ
 RkC476DeIsj2AHmirPKxtx9ge+CimGs42KOmbBqQpDy91BflITERk1y/rFDbzgg9TE7v3CsLgR5
 Eq7KzxMneDY1JHyzQYRIvaAq2piI5ZISG5l4CT3ggHgVjIUiY4YoBC8kZ7J5+Z7XGrq95X6Cr5d
 Q4VZ3/QdNYMmuu14QhadJyUvTCLCqvHxVeXlW3PcP2g/NfkLzvhl1CuzvfDREa9APWo9oL8hMM5
 sgMqxYXs7OOKPeUMBnzMCUg1IyZZXdPZ3XiUrbjy0W/jD8D5/+i/JpvLbaFh+btWkVMnrJNv1Et
 uGD1RI0N1WMOtAqGR2OA1OA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

To resolve issues with running into permanent "cmn ana lcpll lock
timeout" errors after a few device replugs, add support for reset
notifications, which will be handled by the DWC3 driver to gracefully
handle the PHY being disabled. This avoids corrupting the controller's
internal state and the PIPE interface between the USB3 controller and
the PHY, thus fixing the issue.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e748acdd2d31..5e457f28269d 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1004,24 +1004,36 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
 		ret = rk_udphy_setup(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	} else if (udphy->phy_needs_reinit) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
 		rk_udphy_u3_port_disable(udphy, true);
 		udelay(10);
 
 		ret = rk_udphy_init(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

