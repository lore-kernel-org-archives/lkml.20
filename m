Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FD649B211
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141548; cv=none; b=BPjXy29V+ztZ5oUaVSJ7SiNds9cW3KSfahpByB4Vz0gXLbmZL9fHidEDRRA39XpjDr7BDRCsi2DL6VXFBNjmbVGbGNswpUCI4yLxZC/XrrkbzzirtGmwORr+S9CpwWzJud2j/Oi+dO0TIy8EfiaZfTrnwBsKerD7sTRUQ5OjEpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141548; c=relaxed/simple;
	bh=3jv+OGdcF/n4qHmwlEq3KZQYwc1fd09Z6ADzFn5Bb9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DN2Ccin9PZzyqlAiL2nMEaLtBufjRWZ/vbkvM6LCawgvheBUudZjX/whOg6O5C2xAoS+yHaisMxpGhGEN4SkLSuWYCnKXLYrsnO/p5J1iDZ9qalHDjwELqF5OLmdahYD+O1FGvbbMfn1k6+/m7o/LIJKg/ATNKre1OAHrXluK+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQ2oO7fw; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ2oO7fw"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so13102235ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789141546; x=1789746346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RmWPw9HQP1XagMM9TGKgOpF0w9bX79g0MmpHkabvFyc=;
        b=TQ2oO7fwxqrp3+huj2g3OKLY+avsQMzKrSouUm3jd8tabazqbiZErtrc5+vz3sAxnj
         KZhqEa1PLtE6MhyyLYk4qOQGn3/GQOKZ5mU7NCuKOUwrMU3jm5fMvif/hhimArbSrxAa
         NDWYCCYb/YyAu4Gsuc8015e5kOrp5QdCqNvWIXYtSCLAjzegr1rVjqPR+C7CB/tLWWTB
         5ozgPGkiRiWLL+Ca0SnPuYd/OP7GL3kIhmPIvGoSrI7j+m9s/8A3iNWKCPat2y1VSWP3
         eJGZG66nYQm88vTRxwT1gKkmgSxROsN1BI6tXK+r0owQ/NUeQs+D0c7dEuj8tSkdf8J7
         iPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141546; x=1789746346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmWPw9HQP1XagMM9TGKgOpF0w9bX79g0MmpHkabvFyc=;
        b=I8vxjqKvYXNOFGm4xsfI5hNFx9tJb6uvPJDM5f7y4acfjNGpH5FKpi1SWGMWZTtuql
         BCyKwEoqlFAsR7XRmoy1Y4ZmKlztbMxkT0vqhbY4gfLdjJvRn8t99aS8KhjMbDvf8dsw
         eaJ6662xog0Eeul6w2JBS0BNfmr8+e+AyeveNDnenRyGlcxK7xbiuv7zrKDrDN6HvVxt
         JRnUYp30JxiWjBpk/mNPMnRvo19ncxqmFUOP39XdUreWaEZNtnqDIKiSrIW6t9wcU2n8
         +JoiWCaOdUsF1A2d3LR3nnzYzSlNkSIRyVq3n/nkcOrekgqxo05Vp1IMHGwbutPjbaGr
         c4Dg==
X-Forwarded-Encrypted: i=1; AKwUvBwLd1XUaIIS231s6EE7cA5rOrvbstoUWMyn6/X/eBZybbUrPs5PjYYtczrh9eOaL78OIDqen8ZaIW+KeQM=@vger.kernel.org
X-Gm-Message-State: AFuF++mRlkhilvQTwxpoxZHPE4SIr/gSpRZxvHCEC6R+9eksiL3gH56L
	00bTOf3HPM4ok8eRxbIsZlF5IHTZ5TA0bwgR0bbFMAEvnmZrRu8/oKsb
X-Gm-Gg: AYBFou2Aa7rb/drRq7luU24sgQgZxtTpYH+PDEyDlErnBIHIhppcVAGRvjIvgx69ht2
	Z/26z4h9Bxkg6NcdM/TuFt6CRoyRbXvAKbDqT1NRDBttsUCUIPCOi7GtC0X3IbwyarR7xp2fzuU
	lzrQ3ep5oWyyJv1yyqJ5BoXOXNnb8yozYg2IoQojIWsbC+5IFApsVJDEqsdvT3h+AAscPW/LAG6
	Dqeu2DuIQsxWp+YJD/9VOnw4GqB8UJ64D2gs4r+JBViCnvFnRdgDLyqGMYiLs+X3whBOEJ48faE
	gYVE0JOcqeuy11fuT5K/PmLsCevvGtDdiRfC5JzfgjR0Db5tGeqIDolLOIWO/t1AV+eZSwCF2Pd
	CsFBO+Ly3EAqpvcubVVRmWBObFSH/qiMkvRI8YQ897kzTJJGmePaFirKjJAMCY4zz/dmZy3exYi
	/U9LbgZ3Y0B13F6jO5CS+d49BPJWLj8WN6oo1c1S28hcCD6Ijk/5lLe3We23cdot2YJmCU8L6cT
	DZXNP12
X-Received: by 2002:a17:902:f60d:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2dd2a34fd91mr100447505ad.17.1789141545988;
        Fri, 11 Sep 2026 08:45:45 -0700 (PDT)
Received: from arch.localdomain ([158.101.31.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm13628145ad.48.2026.09.11.08.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:45:45 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Fri, 11 Sep 2026 23:45:33 +0800
Message-ID: <20260911154535.266121-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DP PHY is optional: the Rockchip RK3399 eDP controller (used as the
internal eDP port) has no separate PHY device and relies on its built-in
PHY, which is programmed directly through the GRF registers, so its DT
node carries no "phys"/"phy-names" property.

Requesting the PHY with devm_phy_get() therefore returns -ENODEV (or
-ENOSYS when CONFIG_GENERIC_PHY is disabled) and the driver logs a
misleading "no DP phy configured" error at probe time before falling back
to a NULL phy.

Use devm_phy_optional_get() instead, which returns NULL when the PHY is
absent and otherwise behaves identically, and drop the manual -ENODEV/
-ENOSYS handling. This also removes the spurious error message.

Assisted-by: Claude:deepseek-v4-flash
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 18e76d1e78e1..28eb668d3e3f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1427,21 +1427,9 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	if (ret)
 		return ERR_PTR(ret);
 
-	dp->phy = devm_phy_get(dp->dev, "dp");
-	if (IS_ERR(dp->phy)) {
-		dev_err(dp->dev, "no DP phy configured\n");
-		ret = PTR_ERR(dp->phy);
-		if (ret) {
-			/*
-			 * phy itself is not enabled, so we can move forward
-			 * assigning NULL to phy pointer.
-			 */
-			if (ret == -ENOSYS || ret == -ENODEV)
-				dp->phy = NULL;
-			else
-				return ERR_PTR(ret);
-		}
-	}
+	dp->phy = devm_phy_optional_get(dp->dev, "dp");
+	if (IS_ERR(dp->phy))
+		return ERR_CAST(dp->phy);
 
 	dp->clock = devm_clk_get(&pdev->dev, "dp");
 	if (IS_ERR(dp->clock)) {
-- 
2.55.0

