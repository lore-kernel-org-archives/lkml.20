Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386E053A89A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177679; cv=none; b=JHU2cb92F0UujVI+i/JT40yK6nAWLQWW3w138Aw+DMQOW1QC7UaAskwwCLErqh0dC0j8d/US30cYzzqJPCmqJbcZjZXyHUPSSldTUTsKQKrJ1Da9YEzYlvLuRfG5lCR8swXEAWSoUqy7wvIAK69DkdgNAkuqDQygpI/ADfUUxFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177679; c=relaxed/simple;
	bh=3jv+OGdcF/n4qHmwlEq3KZQYwc1fd09Z6ADzFn5Bb9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lrxJHFhUEa6xoyyRblHfGz/H2acI2NfMAnxKv/e4165Or99OyUaDKYxvVXqZDLFNQt8mKiQVbt7GGhABQUS5WFNa6GXZmfCcuifI3MpGCl92k1GvMoZsIZQqrro/LcA4MqsWnJfnoT4CXempBsVbTPi2EHCBfG5sk4+++vUX+1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4Zz6v9b; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4Zz6v9b"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso575450b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177677; x=1790782477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RmWPw9HQP1XagMM9TGKgOpF0w9bX79g0MmpHkabvFyc=;
        b=I4Zz6v9b/TEzdVMfkaoQjcir0RzYsWPKoXWHcOr2YwRha24FBlMOAg2zJ/QSZ2gT1c
         OW0BiFPYlMJVD9VoHfbhDEwOxM5tzO2gGLlP9jnhQcIyVj+xKwzzY4WK6Zn4AknBacyJ
         /MTfcO9i9pDdWgHXsky9+9MBV7jVZ1g3S0oz5k/Z7si3Yplk0EtPzM2Xb38iVIE2CyHa
         Xg8+RbN9C70ZSzVXuSGTf2tA9cSxfRO9TCBKfS6CBEzfoylcjzbatL1ePj5nMB2jaYuQ
         f4YDyfNhGSe5SbkLySkZeEMmAhcuU8kak57ksgoJY+uRkeRg6P5sX4K/mqBLcEiHpsIQ
         F7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177677; x=1790782477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmWPw9HQP1XagMM9TGKgOpF0w9bX79g0MmpHkabvFyc=;
        b=Dy3e7NM3FZ8Rh/OycQDBi3YxTjkeIGvvdPUKfmSbETGOmwSK0x5B7Whv2Q8S+HuBXT
         0CD/PEKPgScp4/4W3NVGB7yit4H1vhLSmpRbyiE7BEa5z3UZBrwrgWmxEYuc2c1UTX4+
         QsK/veNksTKkYyb6CJmPCfAuY09mlTly/0pPZwyAjKWZcx5YBUn+2cVNHcQWjB5Dwy/m
         2DuZrakc5Jlg+e/pmP0ecpVTOR05qCrbc/ECI4eK9fMxkZt6xpBf3FRwGjl5BzSa0eXp
         fcdjur3YAZCb5H74jWORt8LnWZkdUJo7RoFopIppsitIbPOBKFE+k7plKA9gvqUD4apq
         t9Fg==
X-Forwarded-Encrypted: i=1; AKwUvBzA8fSBGJZ2wsPld5yUA1ZWALlB0O/ehTVYDUVTw+VoMiRKMrPw/H85B/NUVcvPx1HtB2qUMHtjdEZqIF0=@vger.kernel.org
X-Gm-Message-State: AFuF++nwuDEiQpWIcBYxGMdnBv/dHej+Qu+QV+fhcSUYHETc9hkQRwZX
	ufrOacUHjjYjwdAhuO4/dDYZ4IZ+0uPFlZXDP2rXJnD9Mn+E/o9mtfJw
X-Gm-Gg: AYBFou1mTBO0u+ns6kuNl/QsmGxV67tcPLTOxFcQfbWn6X7SFaFle6iVzTnmdCiSbtC
	u3xG6OBxELCAx5YWcYx3TqAWk4UnoeJvTFQytWwZ8LGdx15P1vuWGS859q7/x3qAfNm4tu9JLfl
	bdlY6AdgbNKLtMSlHTNGK/z4Oh8Nws+cQmMrcE7+DYYueIGcMSIk35mILjdR27OqvIa7U3Y04RJ
	Jkm6u83EbDTCKhUuk8hmZ0koLzC8zYQUUYCOs6fmNeHOvPxOo6n8/SVAJjAzojedib6AQeIr2Pm
	BgyyuFN5UtpYp+d2B/rzCHXvcFACPW6Ym4Dsheanf4J5xRdrJWbtplIor0iXzNpHPwO/V2Advft
	B3Oili7kSkoccmLuXgzZReDyZQmnQNOEi2MKryxAsL1Urt+GB86OdghnfPGmhnSuFe1GTEZlcUY
	s+m/wXj9FxlnbPRU5Da/D24nzSqlTEfprA6sy3hJM6dLX5NCxsoeiiSkEFzSujJkJSyzCJOQ7RZ
	2LOm6YIDFX6YEG9aNwwRacIkRCVNDQGbMpZkixXza0=
X-Received: by 2002:a05:6a20:c70e:b0:3dd:a197:7360 with SMTP id adf61e73a8af0-3ddf8296639mr2981172637.57.1790177676973;
        Wed, 23 Sep 2026 08:34:36 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3f5e79sm1318844a12.25.2026.09.23.08.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:34:36 -0700 (PDT)
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
Date: Wed, 23 Sep 2026 23:34:22 +0800
Message-ID: <20260923153423.804759-1-jerrysteve1101@gmail.com>
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

