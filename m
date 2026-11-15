Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794718084;
	b=c79ZoL58FAxNootw5OlHxaQIFYQrXlPNYDulDphE+u+NvWqMCnQKdTOM7Gir4p7AdB9l
	 WRwHq0ANpHp9WvW6TXMaLaJVBcj3ckqoFQFHaUeK49QX1kkJjlN0BIhz2C7ECelRe1EcO
	 sTyZ4EuuuOsD6yNMdHpLxWuKTqPcLYwPQg5WeiVD7A3IaG+GquDQFRykQwC+lU7QeBxh/
	 bjRBE0cMgyRaYSuk6CwGx4NTeBGcP7sY/iP9W6QoGhm9emdkRAruiniZi4Qydz9LOpCb7
	 LNHy8NzCHaJAWwPVtl9NxfXlAHDWXjFJ96XQQW3uvcnw39btg7lKvKfkUumdyPyQjdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794718084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LLWhkWwyzjalnr3Z5HU+EI8soyzPleNcaIf48jvo+8k=;
	b=OE+jSdnRcwBmGcn5fleAhdZ6/w7dOJt2dZIbyYxpIlSmlHKJUXipifMM5ovJOROjW0KB
	 atlArbZ2ddinaq0gKyX+H1xJ7BUoqpTSCG5+t/+jtHf6YAmweNKJu+ryJFUWuJWhNm1aL
	 GFsNzGSc1cLnuexpFc42rN6nVjDDGLnCLC+ZDta69WLgVG2CXZ1Jq/FSU871sfm4XCZuk
	 ZLkAXHQq3wq9szchbvJsg6GChHd0UZXqOuxSU5n0cORy83By/PYZUFcsuixLb/xihz5sG
	 njtR1+EVlFeK2BtjnSzBTkGQ1WxIauIRKg5KfFmZPoEGMLEesq9c375Jgky7QQfjT/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gr7hYVng;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A8E606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73A8E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gr7hYVng
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37d424f1ae8so713582eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794718083; x=1795322883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LLWhkWwyzjalnr3Z5HU+EI8soyzPleNcaIf48jvo+8k=;
        b=gr7hYVngQK6NJq9yA2v+gGbTEwh31r7Z03cC50+nLDAcSL4j8BpNmyQ9UriPZmMqU7
         lCkT0ia7P58p++lgzfCH8Gnc7L+rNjAYDRLQ/QAld9jDMcEWZxsU9KuiR2XWtEJlW27a
         W7RPJG8H5fCAxEYRM3NO1LbNtMfl6R0ElnZYRoHuTd3xCgoVocVaPByKn0ZORWLE+QpG
         wFCrAbq3eqeN3Opc5kopqBiaMgadWJeq/BiuqNxSzTdTHktZELDzynM7G/7rgM9GIjQf
         rzwg2sKN/VH6mvR/+uDj+Jpu1/SD3ThVFUGtQyg+5m2cR33Y5g5HKiJONUyXmMLOLour
         pE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794718083; x=1795322883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLWhkWwyzjalnr3Z5HU+EI8soyzPleNcaIf48jvo+8k=;
        b=rYtQQaNFT6Jx2QyuY5XrHWFCKDaSmun/GFOxhh0ZLx5sMqxDZwP6kTse0/WRe5Rn+7
         nu1jvq5UVvUddzc5dA84RCNv9kgOHYCquaJItXUVx/Knn88laluLCATXlPvtI1HmbDjR
         2XB6yCELnNq//XoNlXdR5IQgr1cU6naIdBaTmBrXXBrEyfu5M7BMrPGmxu/JAO7ZNNPk
         Ccy6wTZxMJQlb1Nr7CqKct8W3dOqUTZqGf4DocSUSsyZhInmye7zcdk0zWb7IecHR3g0
         WgjZEX5b9B/7RfxB6/QGFwgXSpt+TN1XEiSeJdbO10atdfIpmFW6I51md8rs8E5cKicU
         BEcQ==
X-Forwarded-Encrypted: i=1; AL+hErFhapAychgC1wBXEO8kmk6OMSrnuQKHAPah3OYsdokht7WEJw4Kk1+QzYLhvLRB5QT2JiaIgz2Akekm2tY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DKqH14Wvd+nF8nhkG93+31Kc19f7IdyKxfe2qTSpxiOliW72I
	YJrsrCrPjhZa9Qvq4nkPyaepPslLzt6uMLLgkHZEepUjauc1cgFeGYci
X-Gm-Gg: AYBFou1iIM80ZfngIvzDba+D7+p0IkOPVEhqBAtA1SHfqyfu69k5skVbYuqlLaekOSA
	TJapIBLeES0sOR/UV0FEMuEfDuTcrB+0Y1RpIw3y6OkdfhA+UNhi0D17szgQj3wtlsMNF2G954e
	UtgEfhMthXGLrJIs8g0+0I2s2dQ86JqtDC0ZEv92GBH5JFMW0fFWR9TsfkUp2Yfz5Wd1P0jNsfl
	Cfl3xC8DNdShFcXzs5wzPEO5km6yweEv3AjvPqsUqeNBGG5CqLqhZbYZmYeR+M3I70ALrpYtsvK
	9fGbjKNXdkTFwc4R6q32MPuitNsWQzdetiq87WhyTVuDX3NWAuZgM6Z76X1o7XSFhGvRYcXSCzr
	F5Ncc+oA7QNE61LfJ0uYahrNMwZSw9A+7Yk9tcXak8I/hOVJsYlv3fBWpN/4kBo9iirFJKTFjZK
	BM0HUdYKBJD3BHBR7Z6X/lCodbBMwxt9SFWz5DVxgzJ7Q++mkDX8sIoNpq/Ylx3aehuvX04jlhd
	XJBAzkUwVCLbZgdyQjj4aAYr4TUOsNVXwD4A2BFItsgRz0eDhcHX9fdik1iOi87KfGy2FhQwGEa
	d2GlhU8RDmDVwqiqyJZWD/juyPv074MY2VCzzRQ=
X-Received: by 2002:a05:7301:d189:b0:376:2ddd:2ab1 with SMTP id 5a478bee46e88-37963660405mr7150743eec.4.1794718083366;
        Sat, 14 Nov 2026 20:48:03 -0800 (PST)
Received: from arch.localdomain ([152.175.35.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm22624099eec.14.2026.11.14.20.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 20:48:02 -0800 (PST)
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
Subject: [PATCH v4] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Sun, 15 Nov 2026 12:47:53 +0800
Message-ID: <20261115044755.395888-1-jerrysteve1101@gmail.com>
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

The DP PHY is optional: the Rockchip RK3288/RK3399 eDP controllers use the
built-in PHY of the Analogix DP controller, which is programmed through
the GRF registers, so their DT nodes have no "phys"/"phy-names"
properties. devm_phy_get() therefore returns -ENODEV and the driver logs
a misleading "no DP phy configured" error before falling back to a NULL
phy.

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

