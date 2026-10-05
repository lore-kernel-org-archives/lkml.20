Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001D74C10C0
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215352; cv=none; b=hgzIGAgI6bwMyIiJPWWiz981vV3wo1+MGiZwHCBkiqvo3pJ9uHI7Wf38jooJLT4ppsC981isV4+8gqWcvCxLgrjHGyPV+O/i9TKvJFsF+yW/RSk6Li1DZpTMT4aXqO06MGOyMuliSF4Syek4EAxpkIkPij5ShSA5CUaaYN77FBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215352; c=relaxed/simple;
	bh=86vd1ZJmIRtc6IXUtGVaQflwbbFOYMvM7RqGwkiQTyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JMp3y+8+lmA4/ERn3OSxOHE+GAUr3TUkVCkD9GeDrdH6kaPiHfpgMZ8cPayjH7xgjojaC/pBo9Mv4xNVa5ZaNURPmHzUt4GEtTAHO5sdQPfonWSx/wKHYLCuwcFaoSqdPciNnY1WDCor9HWqvTINHB+xQyh0hOQXZn83DRsdXIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGIhMdOO; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGIhMdOO"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48c54d65743so1195943f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791215349; x=1791820149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDA7SE8Bs6IcBW2j1ppM+dM+f01g1/9YMIx6NP+5lIU=;
        b=kGIhMdOODplxYSfKL1lo23U1KWeyPNRYHtFK7Fsl8PtSzaVOgXJ+DUn2Ju7wcPx+gH
         FQ/0ER2YHiAHGW6i320V9MIdpqST5ZJZDfmIg6wbWQLB1HCyDPHk+5Yq3PL8KdQWWNx0
         ipythfc3VEv4zIhFeI24BsR2P+H156RZM6td8ISyMx5BfbEqq58vxWG+GfLYVynUwDsi
         sErL0z4mdj2ukZQb7YFG8ixxx1RasBi/whWEubuxs5D7BUSeJWvFKHnI39UXZa6r839o
         SLZZ+n8uXZv3ygNlCLMDMDMFttAqPHTy9pnaeOo/ro6pbZqjMuCcbYntw9unpvGh343S
         Jc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791215349; x=1791820149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDA7SE8Bs6IcBW2j1ppM+dM+f01g1/9YMIx6NP+5lIU=;
        b=nMnZg/65XPFu1AgdSCALzmOQmMTg9kQ9fPOI2jVSvssktLlbtu1CuXzuO50tXvoIE5
         6yWhBhMqPJO/R6dN2dhQLq/bDG1Us/bjWPNOfO7RKJiteHXMX9MNqza6T7Prvf9va3yU
         KsBgTkvfuPji5LSHvZFzYF5REl8reXMjMc51eK8zpj+D0ahCcIt+9aiENV7oQMx6hvfQ
         gqJDPt3MG6oJWFaWD6GeDnRaFe4aT9PSeKDAdaU5VhupjQZnYovkjdAub9M9YK6hg/8i
         Z8afZx4tKCAPQ87+l+yJJS4fhobsdNsNIonqpwO8qkMKDg5vQfcdLaBAMs7KIFDJlPFV
         qbMQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4Wul6zEgsmdILQ3mtENR0x9E63QLA95rs14ra6gyMyNUB06wjfDhxqAAtqR6QoBYuz3WXZtSt2nNris0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOfFXPc4cZIkgxhAzSGiAZhK0dVeBsQImhIba5evgQTGA8cE6k
	a95OkjuMj1rkRKDks8BIBTqNg0KyYjqnbOYa/wAJq1CmZXUe22rI5RKO
X-Gm-Gg: AYBFou0Rw00SzYO1/rzZvwjwhz2+/x2II0aurNz5XKeeY8rpTJGggsrmxznYPjEZluA
	qe6dAZlEdjWqvVy7RZsG/bquie3lMkqBzvc+/KKxTvP90Ne+uXKgHNuQr0uuQcDSbN0KpU3PBdq
	XFyxLuBO1zQXElyyia1J2ZYaI85SgQtAwNy6c6IYIjCQoRB7ieRTRJgjesh8eWRRjymF1G38ej7
	D/z3V2PaOyoAYloioD02DbLoETlScp23VA79sSIxNenRYemVpjZBbPCuADRY3APJLnvQukFFQ/M
	aiIitfX8kkup6vPf0rKkIPeamp5+z2MSTYpKmF7YGNghtZ9tcWk61eYotrWN24YTPNx4zO6Ezgz
	/vQrikl70VqAGP06IDjaisRPtsrshDi64iFbssNNySeZczLt7r4n/J7e1DXgB/f2KactfZBEDjU
	UR+9V0JCnmeHuqEwfQ47AtJvG5IMX/1R1iwhpPtJaG4y0Gu/evxAenwE34zryW9esmklvEMcbCg
	vGHpatqjBT6RKGYri9V3XVeU7SzXOcuQWRKdJ1rjFT/PX5rFIa+lmxvdR2iGJvB9WlpEpbUBUGM
	I1UqjQEo
X-Received: by 2002:a5d:5f42:0:b0:487:27f9:82f with SMTP id ffacd0b85a97d-48b1271aaa4mr19605297f8f.36.1791215348860;
        Mon, 05 Oct 2026 08:49:08 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:19ee:7722:1d2a:b728])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622704c1sm3714976f8f.10.2026.10.05.08.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:49:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] phy: renesas: rcar-gen3-usb2: Keep OTG VBUS disabled until role is known
Date: Mon,  5 Oct 2026 16:48:41 +0100
Message-ID: <20261005154841.168047-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prevent the OTG PHY from driving VBUS during probe, as the port role has
not yet been determined and doing so can back-power an external host.

Keep the regulator enabled while disabling its physical VBUS output until
the port role is established. If disabling the hardware output fails,
release the regulator reference to avoid leaving the regulator enabled
after probe fails.

Rename the regulator helper to reflect that it acquires the regulator
without enabling its physical VBUS output.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 26 +++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index b5ba751805aa..08db619a43a0 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -1114,8 +1114,8 @@ static void rcar_gen3_phy_usb2_vbus_disable_action(void *data)
 	regulator_disable(vbus);
 }
 
-static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_gen3_chan *channel,
-								  bool enable)
+static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive(struct rcar_gen3_chan *channel,
+							   bool acquire)
 {
 	struct device *dev = channel->dev;
 	int ret;
@@ -1133,15 +1133,27 @@ static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_ge
 		return 0;
 	}
 
-	if (enable) {
+	if (acquire) {
 		ret = regulator_enable(channel->vbus);
 		if (ret)
 			return ret;
 	}
 
-	if (regulator_is_enabled(channel->vbus))
+	if (regulator_is_enabled(channel->vbus)) {
+		/*
+		 * The internal regulator is enabled above only so that the regulator
+		 * core holds a reference to it. Do not drive VBUS until the port's
+		 * role is known; rcar_gen3_enable_vbus_ctrl() switches it from then on.
+		 */
+		ret = regulator_hardware_enable(channel->vbus, false);
+		if (ret) {
+			regulator_disable(channel->vbus);
+			return ret;
+		}
+
 		return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
 						channel->vbus);
+	}
 
 	return 0;
 }
@@ -1151,7 +1163,7 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
 	struct device *dev = channel->dev;
 	struct regulator_config rcfg = { .dev = dev, };
 	struct regulator_dev *rdev;
-	bool enable = false;
+	bool acquire = false;
 
 	rcfg.of_node = of_get_available_child_by_name(dev->of_node,
 						      "vbus-regulator");
@@ -1165,10 +1177,10 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
 					     "Failed to create vbus-regulator\n");
 
 		channel->otg_internal_reg = true;
-		enable = true;
+		acquire = true;
 	}
 
-	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
+	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive(channel, acquire);
 }
 
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
-- 
2.55.0

