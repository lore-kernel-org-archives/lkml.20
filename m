Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846F43B8405
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899233; cv=none; b=NJyHtk8ziQFDviJDZStS2eyg0Ewuz0syAdn1B3/jbCmfgbgig9ufsIupq5fpTcXsNKdDyqHLvl2HkietG73lWINk+cq79VeIaQg4XPs2SiFeEX4bmgSbwYJEtBq4TqM7pvOAvP/bWSy17rXDOwZE6vyJIM/IKkgQdUlkVfpLAyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899233; c=relaxed/simple;
	bh=BU6af2PkoKEbw2cLAHxWWzvc3gW4znIE8f1DvIKFsAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TOITVRITiGlGY/f55Qu1rrBPOANB6/t2vCgB1PyjcfB781s+RoOSsqM/DB3ri3TZJZcrd+cSS84hE+iMFRPr01auZjMfL13F/cBdgnjl++RzmRsfkptSE7J3TWGukikXpDjX6MWjrZkQekFkqE/O3Chhg7Y6R1uU1LezAc/Pc24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=seL1jRPW; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="seL1jRPW"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8935f42e8f0so1092939b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791899232; x=1792504032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OEd55JoJOoDV13ld4fQoCE8domEIQzBBmawfYivXwdA=;
        b=seL1jRPWBX+TJKkTFCQ6/rWBLn19hk06reJp/ZpT92rJZl+ncqtq0ebwBCYuNSfaTa
         L1R//2vzLCsZlIh/BGANnntelxM7wTCPXix+mhac8IvFl8vtvNWr+yIEdYaMTawKcaPJ
         GFlGbLTOvILNUZRLIHWUVWsYTH7fWFlUbGVV2lMgSgu+8XOfVf4daqstC8gBtA0p8Hfr
         uwpF2xOs/7tTcSddr793QKeOi5T5sDzVxMJE3A9zmpsV41B+zj9UehZLlxgcG1YYMmyB
         CVh73pRyiqaGQvfIrGxXq6gG6BrhPtjuuBudWFg2uL0neEbktQMrabD8hK6woukKh+1C
         WKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791899232; x=1792504032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEd55JoJOoDV13ld4fQoCE8domEIQzBBmawfYivXwdA=;
        b=tt1EbAjWu55BILwZtQ96F+Z0evpD0/KuPT53Kx0z0BgjlzWLEoT4HMX8g5VB2PPt02
         qhBB9HhqjjT+PoeCTzNqOqQQD22jjVo9r5Hl5UPCzIna7j7Vg2JJemNyXkF0JT3qMA89
         j+/WggF/c/x1ipY3LA0LsT7YTxdi9GitF/kS0CTBZphoH5M7ItOsWwL7R41xDj6jVdIr
         Ucu+Y5XIYb0SZQ5j3s3ZfgpgE79D02Edw7hLO7A+6B65K1zn0939SRy+SGZy5nFiSd83
         +nXT52U3DdOThMNxig0lbMW8MvGF8+9etFMKJFRlUZ+4GvDMfm/cRrJBeWiM8yRqhftF
         3VdA==
X-Forwarded-Encrypted: i=1; AKwUvByxLm7Qi/ATRscCr3o9tE9K41r42Ar+STTFfoxwC0XQs8/GNb5mC24s6Aw7l7Sd8ANzCTOH3hWnZIBVdNc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZjHXn9N/Uc8nwez4R1Coz1vjqwV6G4ZG59XrrRkxWty3eYHnV
	RbpF8fEG+FzGgFAQ2uSR2vsQFG15No1+e6a1jv8Bl3m+4qPZeAYNP/GBbVd+6qg3
X-Gm-Gg: AYBFou34iOiwo2EJhmKI5mxtpKvLZIbcltyJ/mznAtHQIA4Icfrj3dLuuc4KjmtxeFi
	Mql2UWzkup5FHiQ/H2acX/MDrMW8V1xjapXiGJxfAm5JW4itM/WiU3w3tB770ImKB576bJSiwKN
	aKiSZIs7vouw3p15MPTexo6MLmfQDOR49FkyUmVl5hsD/qDRJYIcVcNRflV+vZUEJ4+emWPesrN
	/YqQ8GvY0QC0bAM8jG0gZ/btxXfHRh1GfQ0WEpJlMgtfiCDqeT4JJbyGxJijVIwP07a8917rJuk
	UtwF7W/tiOBvkTtAx6XMb0gRu86HLhNPEmhKXol1rRIz6Nq29wzGjhqArUv10m/FMZh46ClcsLj
	7nv6FM5y5MkYBb37+IwFiCuMLeGkXj1khE/AyEwmS6fvBzuOooum3ykO12pz/m3x/qm7WkroukZ
	TWTdGpXxWas+SoXk/c8ZNZMT473CHt6EcNaI2J6qKyeJrIbZAHyxPntUIJv3F/f9Xw7STYOWNgH
	74WLwuD+A==
X-Received: by 2002:a05:6a00:b50:b0:882:626a:709f with SMTP id d2e1a72fcca58-897c3ff5155mr10872889b3a.3.1791899231770;
        Tue, 13 Oct 2026 06:47:11 -0700 (PDT)
Received: from arch.localdomain ([161.118.199.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3cc80b0sm5044853b3a.29.2026.10.13.06.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:47:11 -0700 (PDT)
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
	Damon Ding <damon.ding@rock-chips.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 RESEND] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Tue, 13 Oct 2026 21:46:57 +0800
Message-ID: <20261013134659.335829-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
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
Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 22 ++++++-------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6df6963740d2..637b1bff0f6c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1426,21 +1426,13 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
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
+	/*
+	 * RK3288/RK3399 use Analogix DP controller built-in PHY,
+	 * no extra PHY configuration is required.
+	 */
+	dp->phy = devm_phy_optional_get(dp->dev, "dp");
+	if (IS_ERR(dp->phy))
+		return ERR_CAST(dp->phy);
 
 	dp->clock = devm_clk_get(&pdev->dev, "dp");
 	if (IS_ERR(dp->clock)) {
-- 
2.56.0

