Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2C83F1062
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762694; cv=none; b=OFY8ELartjLECmlPoHCkvJFe+NBszCqk7M6/FB5o/BOHZYcxIJA5Zq8Zf1fRawp2F+AHGnKGAjXpO7pqXMrAJQclUUpSSm+i1HIiiSW+i7uZ5HOtTAtdcxkdxlz20dver5mfKHh9qVtXPWi+spAhtS8+QupmHT9DzbCzbnU6R3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762694; c=relaxed/simple;
	bh=JR96t6CYY1um+Gn96q3cxPsFIlSgGYTgVsAuN1IMRgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k+0IQtS8Ubbo+npk59qvwWcWLVsGcvIQ+OSiURA56/QqcC2POuI/X4pcLfj+hFP2Q500GlDo0Y9wIJSTPKCLwE+vlOnJ7xoyEzn15IaMVLtbZccExtVXxP3/k2rUVBcrCXIB+UMspIveXG/LanGCu5NCfKqYiyCNHy4wX84h7Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I+TOlio3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I+TOlio3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790762687;
	bh=JR96t6CYY1um+Gn96q3cxPsFIlSgGYTgVsAuN1IMRgU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I+TOlio3aHNvqDU/dmr5ekB6fE18o4mRNy70jl28KmzUv7/YnqiIJJJwOATFKewQA
	 2mSesSbnwtEI/Z8x0+FaJe8utHcSubLQZhsansAifXDwJQoGAR5WoBf4afplsNq40O
	 VY3fxpvLbbT/Mg5mDaa7RXxKeJXVfkHzQov5LP13AQIpHp0O4SLAToP07TFlYR00it
	 TmO0ktw7eDjAHclmHBsjkLYMQ/s9Mk0JotyRE+yF5+kXgWr7YeK8fTG0wzvm5zd7ze
	 WFT1frGYUCmjs3WNCkuFu3RqnTJHtoxqZd+TsVIeI1p5yVvIdYcAJzI87wp3dyPupj
	 Zw5aDE3rIgMog==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFBCE17E0EB0;
	Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 169B4480038; Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 30 Sep 2026 12:04:35 +0200
Subject: [PATCH v16 6/7] phy: rockchip: usbdp: Re-init PHY on mux change
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-6-bc144f80afc4@collabora.com>
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
 Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=JR96t6CYY1um+Gn96q3cxPsFIlSgGYTgVsAuN1IMRgU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq83r6U2u1k6rI6tFuRuK852TKGlGp1/mAot
 SvkObmWORSr/4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvN6+AAoJENju1/PI
 O/qawawP/0NiU4ygJwN2xMlvoIR7CfwN9nzxYr0K4XXgKnzEpQcQhNPjf54/VoIN8GkLdsTdWjJ
 HnsjaJoVKQ1ohuaN7ZyITmiM9z4cUikYa60LqX78sjpriwrpDaDnkbft6939S1wpgsoOU8BiJl4
 CG8zFjN2kYpid+qyi8T+vcbjcLaptPQ4zoSjQxDBQ51dpfqCC54jRVnc2lwrbMq+tjPwZlpGnWY
 Ni6+9P9rL2cYatvK7K+sc2XVezLQBSoldKL6b2QuNALEN81ahNi2KBbpCwDJ6luRyF+X05Lwmfi
 dDOnwi8MUgLrRwwgjR/DlwVg0o7G9P0UeTtQlbnnFWoRh0599CY/OVjMTLvFWGP6AehqDuOPSoz
 V6EGlq1D4pe+Ber2lZCssr6KDNUKiLwF5XfynKk6Xig/9kbHG3tgIg2hYugq7l5sc5EYCey92BC
 jVd0O06WkXEo0uMlhS2UN8rfaJFB5l+hxU2FR+8e3lT2Z+2C5Q3teryceNom9nAiqIEEG3nWJO0
 XP7y3FI0MU3z+/F7NfWEWvQRyXzrBfMaEt7bMGrovNj7T86rziRILwoihzSK/Kie37tE38xbSSv
 Gu4N+i82ekHiYiWWmL34o9uYP5wZUBihgVSlqjkiz2vg3f/nC6Oib1xM5gObeaFZGDpcJkqW4Vj
 pylL1im12IkwTMU2PWQAwyw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized in the
following two scenarios, which are currently broken:

 - cable orientation changes without DP being involved
 - switching from DP-only into a mode with USB support

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 867f356f394d..ca01c1112c0f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1391,7 +1391,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static void rk_udphy_typec_mux_unregister(void *data)

-- 
2.53.0

