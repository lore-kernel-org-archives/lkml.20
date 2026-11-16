Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832237;
	b=ZH1NkMhQ8lCVcpTnczRA/3l0T02KuDZ2N0LQEpCDcQ/t92aKIVORdY2FK54pVlLShV9Q
	 ldmO5BoS01N7swW0mxpuGvw82FDBU5vemidPRpggfXaJb03sOnp0d8cTKeckTYw6LRAra
	 YiII5gfhLlZYfqpNy1128L3MSylaxX6qVUb1tBJnnwjcf4b3jT5TRo7aaM506p5r7/sMM
	 t0luPmuZ46mCisfjM7e8whHuJU+XAvr2pfHXvV4z8oncN4P9SCm3ZKNW5fj8YUpWy6A6b
	 8q1iLjB68RNpxKlLST4KbK7C/kx6g27U0qSOjp/kdwXwAvNb7jzN3SdOrYBXYNo5LhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z/bRCXejfhUAGNyTypvLnWT3Js4ffEtsgZQ/cFVYR6A=;
	b=K8VUDJW8z0+KhG+8pj2H+vIf172p4praxg9gjBT7BUTAJqP/3SPRyBPtpQatjLd8Gfqt
	 l4XJ3e+PN4EObXIP+oq9IPZbj9OmIg7rTKnhdO1Jm/14Wum5yYvzKl+OuWa2o+kYLlKhi
	 NqpAlyFHOd1XWH4KAfY2yZTPGGDY/4zIwmCVm0sznYk61FlRASMRvvSihjSOXb8+mQkz4
	 1kqgWh0sqS0dwBlVOISkfSAY/RK3Jvk8ffgetjTtJoYzxNoiBrQsyGwO+Bd33/ROgoKOT
	 q5wYn4c7gISgqcGJCLaX3OPkC5PKq3NeachW3uZIXNiNVPLoUFz2khJbxmyfI3plZng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXRuU56b;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3173606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3173606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXRuU56b
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9eb579c0eso17863605ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832236; x=1795437036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/bRCXejfhUAGNyTypvLnWT3Js4ffEtsgZQ/cFVYR6A=;
        b=JXRuU56bJkJmEsn6/hkmKqNJb3k9D/chg7Yifho+iBFJUIHnaEuBU/AiUisJBBDhwZ
         0GUcuAsq6FqdF9mYUe88PXqUYa/NkBc5bekgZjKkKDdpo/rqnXAR97FL4iiu/p5WvBoR
         pq7q+4TIFDWeh7m3/3CGZYaYFedDfR7CV+3Phwv0svJ977p+fhvZO2+2hbL/Qqh+55JJ
         hnRxsUyZSB6B/XPcibBYgr2R1Hs4lOjNJBThUw+yEB+jBJSG/FkTu1eKoHhHuQYFFvvG
         tizDgviOoXVG/Py8ZKAKtGIIln2Opr3kFUx+w5I613bLZLacJoDr7YNXmO9cIBYCYgVx
         OFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832236; x=1795437036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/bRCXejfhUAGNyTypvLnWT3Js4ffEtsgZQ/cFVYR6A=;
        b=c3G/OXDlFzt2VZLEktLbSVKp2ERP3H7MIt5ZHmzvSh5EuBqRCbP1xUTg4Jo8k+YxsK
         slr3+NWoGcOzDHoS8A7OHKSgp48yZPHGZRQ4MhjuPq2YUwtD1WRnWBmGWacyolVnpWn2
         EUxoDlFm/s8u8yq1oMBLsYctSMVjS5/sxDR/OEuOA5BLjhu16h2x986Yw6MTmt6QE5UW
         GdD/9Yaqvlzeflpmd2zEnkhViE3JEZ6gvyOqS+jpQXKyRZhxbFlnPhuMwzKZ82L0c3Pb
         sKCHM8fadcrtZV2SeT/A1dvUx9xAeBaiPZhHBmDGIiIQeadRC4fl7I1SlNH/iFJHalG9
         lIkA==
X-Forwarded-Encrypted: i=1; AL+hErEvq7CpyGMMG1Yr3yayLFtHFy/bugfTPQp8O5bT9SkEm1kpwiY3GlZfu07tzGZjvKJNJ52cp7X82GtRgmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cXp0tR0UDCXFg4LilcKrQS77MfjBVWungLOIzgrbBVpn9EZHK
	YaS1yWVDbK20sVapU9tMvOD4Ql8CMENlD7u1rzZNMX20rN7XsOhnzRRw
X-Gm-Gg: AZFdTZfljIlpyyrmb2wPCZ+6HEphq7uXUJZoCyBqPw+IoW8FDPeYpRTQIHglWTY1YL3
	Jqg6Z/SzD7Ug1pnm9XEopHYrrdxJnhNBpDNZpusHqAyuhPS0Sx2I4ABQLq4zYsAlfld66JL0gAp
	IxF0KHIcqU/exPdhko/OO9lraCQO7dF+zxx5ERdaJDQDmiXUZ+H1Krm/mcXspn0Qhsbh67iRWkR
	9DNdrYhimzth26lp6fYmoqh4ZTH6mYPcxf+tAwDRDQJiauvhpx/o45uy85cr+W4ZpJzH+FQ500D
	a3V8fobw5s1zHAeGh51Fbqiir41LXRghWnwwt+AfyOvJdKCD34qvXLkZUfh0fKKjHVhPTzCeo1R
	K3o4xZvM9B0okyzSUj/gc8OH2yjNBVCsqT1is9ZhVN/+ctCVWAj3jJYsKbwnnWhU7lrYkKpN2Cf
	KutQSw4oWbjKcm2V7dugbm7xPS9tzlauLALnS+RCQYLJJsPrE1Pt2fFNeAQ2MdTaUAp/waIFxuj
	WTClcCcVOd+/5uegZ9ztCRUcCR1Zr5OtyNLR6OyVrG72fYeRbZjuAN3o84w1zTPGJ+Fs8DMg1F+
	74a4POpCRxDmjsHF6plqvLS9+hyd8xi1nedTZ/c=
X-Received: by 2002:a17:903:1844:b0:2e2:e24e:a88a with SMTP id d9443c01a7336-2ee0da7f49emr93338495ad.22.1794832235891;
        Mon, 16 Nov 2026 04:30:35 -0800 (PST)
Received: from arch.localdomain ([152.175.35.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4acd77sm37607385ad.3.2026.11.16.04.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:30:35 -0800 (PST)
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
Subject: [PATCH v5] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Mon, 16 Nov 2026 20:30:24 +0800
Message-ID: <20261116123025.638531-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DP PHY is optional: the Rockchip RK3399 eDP controller has an
integrated PHY that is part of the Analogix DP block and is programmed
through the controller's own MMIO registers, so its DT node has no
"phys"/"phy-names" property. The other supported Rockchip variants
describe a separate PHY and are unaffected.

devm_phy_get() therefore returns -ENODEV on RK3399 and the driver logs a
misleading "no DP phy configured" error before falling back to a NULL phy.
Use devm_phy_optional_get() instead, which returns NULL when the PHY is
absent and propagates any other error, and drop the open-coded -ENODEV/
-ENOSYS handling and the spurious error message.

The behaviour is unchanged for both CONFIG_GENERIC_PHY settings, because
the real implementation never returns -ENOSYS:

- CONFIG_GENERIC_PHY=n: devm_phy_optional_get() is a stub returning NULL
  (devm_phy_get() returns -ENOSYS, which the old code mapped to NULL).
- CONFIG_GENERIC_PHY=y, no PHY described in DT: devm_phy_optional_get()
  converts -ENODEV to NULL, exactly like the old code, which mapped
  -ENODEV to NULL in its open-coded check.
- CONFIG_GENERIC_PHY=y, any other error: still propagated, as before.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
---
Changes in v5:
  - Fix the comment and the commit message to mention RK3399 only.
  - Link to v4: https://lore.kernel.org/dri-devel/20261115053625.404795-1-jerrysteve1101@gmail.com/

Changes in v4:
  - Rework the commit message to explain why the behaviour is unchanged
    for both CONFIG_GENERIC_PHY settings, with one bullet per case, as
    requested by Luca Ceresoli.
  - Link to v3: https://lore.kernel.org/dri-devel/20261110023721.2014061-1-jerrysteve1101@gmail.com/

Changes in v3:
  - Add missing changelog entries and reference links
  - Link to v2: https://lore.kernel.org/dri-devel/20261013134659.335829-1-jerrysteve1101@gmail.com/

Changes in v2:
  - Added comments to explain the changes made.
  - Link to v1: https://lore.kernel.org/dri-devel/20260924020417.868588-1-jerrysteve1101@gmail.com/

 .../drm/bridge/analogix/analogix_dp_core.c    | 22 ++++++-------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6df6963740d2..6d50ffdae17f 100644
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
+	 * RK3399 uses the Analogix DP controller built-in PHY,
+	 * no extra PHY configuration is required.
+	 */
+	dp->phy = devm_phy_optional_get(dp->dev, "dp");
+	if (IS_ERR(dp->phy))
+		return ERR_CAST(dp->phy);
 
 	dp->clock = devm_clk_get(&pdev->dev, "dp");
 	if (IS_ERR(dp->clock)) {
-- 
2.56.0

