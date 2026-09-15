Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193934A0EE6;
	Tue, 15 Sep 2026 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480209; cv=none; b=ZQG02nRqWWYMH9S9Hbkpj8fmZRfowh9RNFXT9Z6eX6RYozUFQUp4JMSzrAhbA4d+4Az8bg/ALdbJrsxzWPDn9pX+YHtiRdZ+CV4IoG7Vl0Efy6d9+nSrpHmENQB5gSL1FtukF7sai8b/FMqso13RAqiZwrzJP7DDTtZLzWoT98k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480209; c=relaxed/simple;
	bh=sj9LBh28iAOPdKC2Yk3iBAPDw/iU870tFO75CLAFURw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DniIbmucF8r1rUt8yyhxXlHa4LVTg2em2X6i8v2uqGi9jx5hndGf0qrZKdmtY2KacAwl/l/zSesUzw9sL71jLEh9wOhGc9Wj5U/ikc2Lwry1GOmYblYqdy8wuzOVZijfLRtQY+ANPEfw9tIiMjzMIv/jSlvjAHLGWSfgVjvld3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JEgRlZ/B; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JEgRlZ/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480199;
	bh=sj9LBh28iAOPdKC2Yk3iBAPDw/iU870tFO75CLAFURw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JEgRlZ/B+KK74YnwUdsf2qtsN1MLgxw8O5T00EcuaYfG6QXvizjVhfnLbIfKdZaV4
	 DdxJ6csbVDEfHSNzEqkWFPBWEp002KzGsSnVtveBuRdNzBiMaLrxoAZiNKzI85jOJz
	 I0UqxOvKM5bUrniHYwmH/4gWH+KthBsZaIstLg/BvEUfD1RR15wsexEOZKsP34LKjb
	 /IhWgw2a/OmgFZ5jMleqcWuq9MkHnFGuLJUp0MWAEwoNL/oPvatMWuj9e0EHh1ljcW
	 vaGONoQQwdBQoqIE+gJeMA/dgUr8NGj5jiAnBRcOJ1pgORLiYM0/h9XcqCeYhzN8HJ
	 B10YNM9I3hbUw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D7D5817E0D7F;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 35C5B48003D; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:55 +0200
Subject: [PATCH v15 08/16] phy: rockchip: usbdp: Amend SSC modulation
 deviation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-8-80e2c11d1ce8@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1Q1JW1JnKNYhx66aUCknN/wu+6hBR/DH+Mx6zdtRaUU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQXPaIxRkb5kjjtuP4ok1jEwKIvhPwJ8P
 CE32ThhaTymWokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qa8h4QAI4It8W+Uui97+UEHo2/alY3B6AGcn6av2UWNmhv6smvxwMeSeO+S5GtA6wcj9jZKGo
 Fd8rCGSbSYiBjd0qB39cYLEevl/btaie1YLV1O+1xTIxDDaj6Myexmok83OzvpbuqPB6GP5P2B8
 aKLDcgomiJKQbqNPbmT51IJtjEH7QA+3isugidM3moZhQGTZ29e68zBKwMCuHonFoLDvG/j5Mzf
 r2CKwMvzL5Frc0unzbVbfI2+eIew1wkT3Nzel0DHyCeoaM28pXse7Lr6CWEGjQlP25h+nKBNdoq
 gqQTC1c42QGXyfHb4FBqZUdKau8bM0hYHaLPMXR4XNptwusvEQdqubBMHVv7lxKTRRaO7F0nqRn
 wdL/I2h5rp5T8Zo4JlQiN35ZpoxYjLSqqd//nGwXws+Yetc/VXDp5R7fmaiv6WcC1CreEc+4XdQ
 hwpb5Pq+L6QGko7dGBYK7xELkIs3WhucTAP4Rjww6c6fcJq6EJseoDHDJpMg54ui/VzmH4C9JEh
 lWRkY20KY7sq0Jq89Sp4N3jy8MVoQvVI93NCAom5VyS0o8kxq7dnGk6Cc+kU0ZN7n9RbX0wxn/g
 qXL3+tqLW6Lt9MsJWcWqjmCwamXb2kHYv9lSWrDEVxdtRN8/6ynw99o2sdB9/ucAo47FX+q+sS/
 3NtYy4xihVPbcEToKvUYsyw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Frank Wang <frank.wang@rock-chips.com>

Move SSC modulation deviation into private config of clock

 - 24M: 0x00d4[5:0] = 0x30
 - 26M: 0x00d4[5:0] = 0x33

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
[Taken over from rockchip's kernel tree; register 0x00d4 is not
described in the TRM]
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 925f2d162212..586363f5ca20 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -349,7 +349,8 @@ static const struct reg_sequence rk_udphy_24m_refclk_cfg[] = {
 	{0x0a64, 0xa8}, {0x1a3c, 0xd0},
 	{0x1a44, 0xd0}, {0x1a48, 0x01},
 	{0x1a4c, 0x0d}, {0x1a54, 0xe0},
-	{0x1a5c, 0xe0}, {0x1a64, 0xa8}
+	{0x1a5c, 0xe0}, {0x1a64, 0xa8},
+	{0x00d4, 0x30}
 };
 
 static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
@@ -376,7 +377,7 @@ static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
 	{0x0c30, 0x0e}, {0x0c48, 0x06},
 	{0x1c30, 0x0e}, {0x1c48, 0x06},
 	{0x028c, 0x18}, {0x0af0, 0x00},
-	{0x1af0, 0x00}
+	{0x1af0, 0x00}, {0x00d4, 0x33}
 };
 
 static const struct reg_sequence rk_udphy_init_sequence[] = {
@@ -411,8 +412,7 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x00d4, 0x30},
-	{0x0024, 0x6e},
+	{0x20d4, 0x08}, {0x0024, 0x6e}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.53.0

