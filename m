Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C514B4058
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400023; cv=none; b=R9Yh8t+Xahy4JJGcz4pG0pIFrYQ5j6i/SxWemAej6Ozb0gcnVGNpDsBuRkApQmkP+2wtkwh/Tv818rGCzf8YsYwuXJQD34Z82EEQT18uXbmfZ6ajTO02+P8nrrdX2ERUywm6ojgZtnm3uaFEbSdtn2UznzcKtOd76excBFqRDm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400023; c=relaxed/simple;
	bh=d4NProiha+qIX5CJo3L5Opz/K07iZioExqEgA/F04AU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dBTo1L0W5Uu9/k3G12sjqZRmFvsXQVQSDegirA12wEbbMr4T+gkXkSKEpYTuyRUUhxxnjBz0V/DEgWYzwk/1+K7kBslmY0Zu8qh0CngOn8LCzhMyCzbRnEk5P07+oiAeW7IXj1Ha4ILxdJbHYegAlKngEhLP1wgmGillUeU6V8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pzOB3E03; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pzOB3E03"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so22187055e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791400020; x=1792004820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNDMmUWUsrhS7fqAay6BVjhWp+dL3PANyoZAcSZozLo=;
        b=pzOB3E03FuOuwl1Ub3xrqUm4HaNlbVwfljOFEwNuCOlpeP2+VpcWtno06UG4u5OpqH
         ACI8cuRnGvSvaSn8cXNvHbVQXeuPqAhZ5GmTBIJUU/YMYvwd0zeMDwHpbQatHGaJi3q4
         lMtYGHpY5OZ8PswaZcyJzL9eDZYdzqCACICR5VOVs5ogka/DzisAVbfp2wqHAgGqNOv1
         xtgEBDxZtoleQBZYDRkvSs29p9R2ahCfl6aX9uiM2oUiyaOMlOnoDZnz9UTclx0jBK+Q
         ZpG9ojT+ju1BVQptEF9qS+SMP2GAjBkczmD8d9QkLZtWw74MWKT7MUEPiGkEeleeYYcc
         uVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791400020; x=1792004820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNDMmUWUsrhS7fqAay6BVjhWp+dL3PANyoZAcSZozLo=;
        b=1QzCZnwMW8KKA6SpAPOkXnbWrWzUnzuH5MtQpPKA4VHLYR+yvZ4uQZqYbbzjc2yLnK
         yPZctVOVi/gcjIH2edCO6Kle3I3K4k0BXxE2lGfmuV7Ix2/+aoj+uRJ9x/FZxeldznry
         vt2+0IpzsEIn5ejEu0fTSbFd0Yq3Vi+alI0JEZ/d/fgV4cb/gjpFmD3Peh2OQeXaoHd7
         W9F+Xx8ftbMKrq405fERr7prA+1q5UNXbhhzIM3ALw/xHB4YWDD2RIHJW7uJ+jveZZ/r
         WqV9K9OpXUjp5GKWm70aMLRNeOJKMeGUEyo9XMddug3nPUIBUIJoJycRJaBp5wSe64Zl
         qTXg==
X-Forwarded-Encrypted: i=1; AKwUvBwec87Wn7oO9ZL6SpZuKFcOaNDX+7U8nzvRznyImZkibpxvkOj9RXLAdU5Zr24taO4rzZCpclwxIRFGfvE=@vger.kernel.org
X-Gm-Message-State: AFuF++nVndO0LyiNwFybcM9hI3bYpt0ir9NXUWgPgb+nOmyavjo1esr5
	xYcYGL6pEXHqxLtOx5yGSG/bUbuaYe4THJvUTZnEJcE5LhsL5//mLAWD
X-Gm-Gg: AYBFou1q8pVhQWXSkw6KIn/YFdtAn1bS6B2mGdN3p8+ApLK/ORN3XkJgO9elFS/azJ9
	ew/hOefpJgaSGuC8nVHhXBGank0A0gJyhss7UqX6dIS74Z3Kq/l+W5NzP+SG7o5iQN8glkdFWyf
	OruxFO3/YMhzzVoRwTtO1E4d/kRvmelEG5WQdgrcm9YkLYHnD1xGRfu8KRgS3/Jl5p2smxBSmeP
	d4yQ62XyCbxLPRTyhNY0TPDz1wap/4YmbCqJBNvVc+m0X6JmqFeR56cPDmuND5jooNAm6SbHEVW
	VHQ3MMPSCWLSe0E27IaBoC4SJ7PB+v83+J/T2tH3T5hXyuSMb3E0GUFYwnpoIEC/S/1c8yEGc60
	plZIHFrjBvkT3bwX2Kk7J0YvXi5YqwfxfN4mI/aYj6OcCL3pXGqXUwdIR5ql3RD8Bp3LtreE40x
	OxBPfYz+bcEHxJpyaGAuuIQdjCe6E/TilrAwXZX3h5ErWlin4a/neE9JMX6YwLknO7HuEWAMDqD
	S+iIMwtqRwfS4KldrYtcqR/TB45MgOaxMeWmOR7U7P/D3rYPsBPAe+hwdeN6T5f9TgmG4p5oF4u
	BlhejgF7PuJ0qzcvY9c=
X-Received: by 2002:a05:600c:8882:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a1813f2d5fmr38969725e9.11.1791400020224;
        Wed, 07 Oct 2026 12:07:00 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:1b59:c95c:e030:dbb2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843d8997sm12449275e9.10.2026.10.07.12.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 12:06:59 -0700 (PDT)
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
Subject: [PATCH v2] phy: renesas: rcar-gen3-usb2: Keep OTG VBUS disabled until role is known
Date: Wed,  7 Oct 2026 20:06:54 +0100
Message-ID: <20261007190654.452376-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On OTG channels of SoCs without ADP control, the VBUS regulator is
acquired with devm_regulator_get_exclusive() and its output is switched
by rcar_gen3_enable_vbus_ctrl() using regulator_hardware_enable() once
the port role is known.

The helper acquiring the regulator has the following problems:

- The internal regulator is unconditionally enabled at probe, so VBUS
  is driven before the port role is known. If the port is connected to
  an external host this can back-power it.

- regulator_get_exclusive() hands the consumer an enable reference if
  the regulator is already enabled, for example by the bootloader. The
  unconditional regulator_enable() then takes a second reference while
  only one is released on unbind, leaving the regulator enabled and
  triggering the WARN_ON() in _regulator_put().

Fix this by making sure the driver always holds exactly one reference
to the regulator: reuse the reference handed over by the exclusive get
if the regulator is already enabled, and call regulator_enable()
otherwise. Register the disable action in both cases, then turn off the
physical VBUS output with regulator_hardware_enable() until the port
role is established. Enabling a disabled regulator to take the
reference may briefly drive VBUS during probe; this cannot be avoided
with the regulator API.

Rename the regulator helper to reflect that it acquires the regulator
without directly enabling its physical VBUS output.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- regulator_enable() is only called if the regulator is not already enabled,
  ensuring exactly one reference is held.
- Dropped enable parameter from the function
- Renamed function rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable()
  to rcar_gen3_phy_usb2_vbus_regulator_get_exclusive()
- Updated commit message
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 35 +++++++++++++++++-------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index b5ba751805aa..3481505dea2e 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -1114,8 +1114,7 @@ static void rcar_gen3_phy_usb2_vbus_disable_action(void *data)
 	regulator_disable(vbus);
 }
 
-static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_gen3_chan *channel,
-								  bool enable)
+static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive(struct rcar_gen3_chan *channel)
 {
 	struct device *dev = channel->dev;
 	int ret;
@@ -1133,17 +1132,35 @@ static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_ge
 		return 0;
 	}
 
-	if (enable) {
+	ret = regulator_is_enabled(channel->vbus);
+	if (ret < 0)
+		return ret;
+
+	if (!ret) {
 		ret = regulator_enable(channel->vbus);
 		if (ret)
 			return ret;
 	}
 
-	if (regulator_is_enabled(channel->vbus))
-		return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
-						channel->vbus);
+	/*
+	 * An exclusive get of an enabled regulator already holds a reference, so
+	 * add a cleanup action to disable it when the device is released.
+	 */
+	ret = devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
+				       channel->vbus);
+	if (ret)
+		return ret;
 
-	return 0;
+	/*
+	 * The regulator is enabled only so that the regulator core holds a
+	 * reference to it. Do not drive VBUS until the port's role is known;
+	 * rcar_gen3_enable_vbus_ctrl() switches it from then on.
+	 *
+	 * The VBUS regulator used on these SoCs implement the .enable/.disable
+	 * ops, so regulator_hardware_enable() cannot fail with -EOPNOTSUPP here
+	 * and no special handling for it is needed.
+	 */
+	return regulator_hardware_enable(channel->vbus, false);
 }
 
 static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *channel)
@@ -1151,7 +1168,6 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
 	struct device *dev = channel->dev;
 	struct regulator_config rcfg = { .dev = dev, };
 	struct regulator_dev *rdev;
-	bool enable = false;
 
 	rcfg.of_node = of_get_available_child_by_name(dev->of_node,
 						      "vbus-regulator");
@@ -1165,10 +1181,9 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
 					     "Failed to create vbus-regulator\n");
 
 		channel->otg_internal_reg = true;
-		enable = true;
 	}
 
-	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
+	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive(channel);
 }
 
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
-- 
2.55.0

