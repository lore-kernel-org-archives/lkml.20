Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEF533FE33
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790215471; cv=none; b=sLciHk6zWk/y2cgaiJDUcEL6S1kYu1aozvf2aVyDa0B7jy1sUcsjMGltt7LTqmCDtKv+3n2CHApleEmQk4S9l7Bjn20aYG5TbqzIycsDtAi4PCjhA1xlfYF4wWWxG32afQFFolCIWNIRZZOtbXfPH55UJNOl/4CgApvLwBp0TrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790215471; c=relaxed/simple;
	bh=3jv+OGdcF/n4qHmwlEq3KZQYwc1fd09Z6ADzFn5Bb9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YK2Wd+G6TcwflNZG1bi3wyG2J7BsaI3NRDfpOjMw1kE0bj44qJrtYHOE2dva59D6pukrxrsX1108aGci+1vbBRGueTHdlwUTtUwTrwZOm2Z1Nl4dJI4a/fIe0dT1p09dbePOqBSoJGXTom3PwxuZdPQhSa8WedbfbVRIXlESlIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACzDJ6q6; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACzDJ6q6"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d249c6so1049826b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790215469; x=1790820269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RmWPw9HQP1XagMM9TGKgOpF0w9bX79g0MmpHkabvFyc=;
        b=ACzDJ6q6dPfEnn6hdo9M/IQtz8mWbu7k5WRLxit0rvG86J+8qulTpM6pm9UJ4EOwXy
         rsOR2kKCKCSQOuqD5Bd54qzvwLN0/FpfdszEWTdBUmquhoEwBTsKg6sUDxw0urjzz6mS
         XnXoaxBLIITG+INHlv9mnRO7OXSSrs9uLqbvs8yy5rxUdVPf93b6Sgnb35ZYFlKUJUBn
         2Zp4nAqEVcC897o9uzaobxWGvQxuX8QsBolwp2WUqAQY8tGB4GlOWhXO5qZ3Wie/VwCS
         c9Dz+JFsZWE6E+LyoQLBHkFDm7uYn220nII7+r2KDLtssYct5B+om+f6maxjtd0rkhxp
         2Z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790215469; x=1790820269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmWPw9HQP1XagMM9TGKgOpF0w9bX79g0MmpHkabvFyc=;
        b=mz74GsLzvFpmhISkoP8De/uD0/tQsPOsLO1bAi0EZ5t7bkeUA3yRtRIZHxdVnf00KQ
         di7EIOC1mYa+yHXk4EFr7AiEPUUUas67G5sMgqyl4MhRKjxsNlhbo3C/umirtArCS4Io
         47T9MUgTF/CmxJ2NV2OH+LI1Fy9XLaUVPl4P5qmjDGOkLe9ld5N4EUq+KfTOx+bYdEAR
         LgsBV237CrAt1TZCM7vytHyNV3HpNiHwS9SJd3i/zl9dtZ1h9j19buXFEvqzUgFmOUJO
         PvXLJXDBopKxXiA5cSrFvuaFx7w4NL6CVVExoc5ZaztrYygMJt1HK8ob065HTLtXirtq
         nySg==
X-Forwarded-Encrypted: i=1; AKwUvBw7PNFpI5h35fdDm1fKEO02lKVRwFip0l64bpUYfzoxQKv+ptS096BWdPLpc+dMCsRLScxgO9+eOYbybik=@vger.kernel.org
X-Gm-Message-State: AFuF++nPrPjx79/WZbPOlacY/yALyt77dPZ8q2Hmq5YYVmkBAHwgzY3E
	yNDHiQV1u3NLhtny/ZNENk1HRyBv4ZU/9R9LeQW+rKitRq69El16exjG
X-Gm-Gg: AYBFou0VADC5N6fWB8ny5dkpFL/SfhoHDWdwo4E5phzAcosc9zABWgxKnTms6mFjhhZ
	UsPqbJDMD17uwkbRUhXZLmMDUTfqG4Vw4c20qPmkv1k9AgHg6pGRJa1hz5nCfkNe/dTLNHyK/2f
	tdqSdGyTG59HO+/sAgEqoZo8bPHmYSv0r0OfrQ7F3mvqY5jKQb2Hfr37yPv2UQZaRsETgzPqgyG
	6YvCAKROYOnY1h0Pu2gEcXJJkec1Mp25dmv/wn7Du9cHZiR6T9MYXdRKMweJssDu7sAAlV+zywS
	khCHnu3HNoblgjiEYaXnwxOaFtu00tATs2UQzrRnWgeLqVMgQwNs9oq//X9NTY+tNCy0G5rgQkz
	K+vLgGon01mTmIuSnDX6Utxq+lGyoIOEy/W+9XDXjS5/DPOmASpnYsZsKHvQFIS1rQ1+b7ZV9Po
	djSTfIxFydoUk+aYLD2v9rNZKDDnpC8iYARlv4VngWlJDuDUQR645eqnN+sW1TOBtDg4SYlzmq3
	rGKFk51m5aV6abSuWVM9LY3N0uBbaar
X-Received: by 2002:a05:6a00:6088:b0:874:706d:856d with SMTP id d2e1a72fcca58-87e9b3ba37amr753328b3a.30.1790215468861;
        Wed, 23 Sep 2026 19:04:28 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1331sm2041625b3a.24.2026.09.23.19.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:04:28 -0700 (PDT)
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
Subject: [PATCH RSEND] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Thu, 24 Sep 2026 10:04:16 +0800
Message-ID: <20260924020417.868588-1-jerrysteve1101@gmail.com>
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

