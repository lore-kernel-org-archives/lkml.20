Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF40647D462;
	Tue, 15 Sep 2026 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480204; cv=none; b=qelUQWeH7cRmNz38P5ulRDwU+xnM4hJoIWmtTnuZCzkMWtQeuUpuFC99ihdd4QEUmT9OP8i1SADkA5Y79pVX0962rs73CvLicho/w+eau8h/DJdRzqjy77bQ0/Uj1S4CDONrPU8oeAaMGdlEj0NCjgI2r2Fx0z3w8cKc745pFzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480204; c=relaxed/simple;
	bh=NKKg6AEEXoM6tQyFXezz7j5lNyGVhRK42SMauPjhDyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6UVD06eUEoItzYhkVNis3ACvBb8Yy9BKyO3QnU2ke5IBjBbDDaTx4LCBHXa1ikFaSkWNBrYfjN2JvjxXMuaGnlX/9UEpc/5NnoVRJsNzgSuHhX5B93yrBecqe/zfHWjh/2WRlwj5eUDL38BdKfGshOAIXReBPlleD5Cv7Bau44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a2p7s/iS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="a2p7s/iS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480198;
	bh=NKKg6AEEXoM6tQyFXezz7j5lNyGVhRK42SMauPjhDyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a2p7s/iS9AU11sMMJ4nivDlPw8LPHOBDW+zs2BbohKEuiIuUEZaReKCEJgS21Usvm
	 t+gxMki2EpRFVW/xsW6st7jqJXlGZiW6eDPrCpLw0WgugcGqUpqjcWu3+kbetLP1gD
	 hhDDp/caFySjcPuBC6W7BAQHlAYUyjmqOfsRgyiU1H+Fu7wONoLyS7QFyn78q+Fuie
	 rdJwa7CvidaUCaATMzGp8NpbkKCcVBF5VCywejkxxXpZD45DPM1ofa6fQKW0vV8Zni
	 rAJ6IxSOrB/Oe3M8EqLmwFXmejQrUFZdK98WVaK3MCdieixf4khPHPfK5Zilc7Bjho
	 3LWYNvxAcP4Hg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DCE217E091A;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2B7A948002C; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:49 +0200
Subject: [PATCH v15 02/16] phy: rockchip: usbdp: Update mode_change after
 error handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-2-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=NKKg6AEEXoM6tQyFXezz7j5lNyGVhRK42SMauPjhDyY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQWVvWBfi+HlbBO4onPCersITl/nVV5df
 EvkbFkM7wDTnokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qajMgP/13aHIc8MUKY/ambWT080dg1IDxSZSXaw9v86VelIfPm0rQ+/LwOlbxfhH2KMm2qJlv
 NzR6LJxNVGVjhAYbDXAJfq5EnsZh+FG5ebevI0Y7JsXvz04KK2Jza1wBMbXUaWnAanYvcLySrhH
 QjvkkAUIpZ58k0QwJHpYPjG5FEoftxC0FSHg2/g9GJ5m8tXa7VCVnR79rfNMxli2XTwjVXOMYob
 +xBipON5+1IMrhSD7074zS0VphRMLTl5wYr8r7E5qTW8gHQg1fzIMQhXZlU1htJVBEfOsDbnVha
 3b4CpNbE3OfQclKH0108Td7HWVv4jWYNTFl2gAe2mqGj+2w6YSkWCezjpr2O8ebn/51xsrIvyn6
 PY6LMxEP9bXGSYV8fLZOAt77k/Yh4qNCGcRCBxYcCnpuQCxyQ/e1ayggi7SRaQAhQaGhRRAm4U8
 R8uISMGd/I5A4eq4ZQ1yCgfkQChl6PiDq4kQ973R7WcYvR/SIVYy3u1P83ftbx4arLuAiILQyI0
 Ksleutp+NydSqED4BrIgQWwB6LcAuOVR7ip5vf7PcL25/RyjLrhq38UpYdAi1PBoi1BYZ62x86i
 cydkRap606vVZZapQokzXKxIt+pMAkF3OlBD28Dl4NQf6IMjXgw5aWXfsUlaTClVlHxBuqDNhFu
 z0/ugt9fZogXcI/yQ2cM3Kw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If rk_udphy_init() or rk_udphy_setup() fails, the reinit will not be
tried again. Fix this by only updating the variable after all potential
errors have been handled.

Note, that no errors have been seen on real hardware and failures would
most likely be fatal and require at least a full reboot as the function
already asserts the PHY reset lines. So this is more of a theoretical
issue.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.kernel.org/
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 07a839e41db7..13649b52e99b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -999,15 +999,14 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
-		udphy->mode_change = false;
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-	} else if (udphy->mode_change) {
 		udphy->mode_change = false;
+	} else if (udphy->mode_change) {
 		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
@@ -1016,6 +1015,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
+		udphy->mode_change = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

