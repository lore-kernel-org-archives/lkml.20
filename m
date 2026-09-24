Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C6E3A9615
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248735; cv=none; b=ietGrUBjwiQdv+ra5TTbfaTdYRSN5A2vY0VNRqKGuvnWPSkK3krtifqr8qECC3OncEpxo/QC7D8VQok4zYTR40wx1Ny0EGDs1vaizyNMrWBK68FLwUEx+TDoOoFUWVlkCsrWzfdqKz4radBXuPfP6Pb5cvGNjWt8zgwlUxmyw1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248735; c=relaxed/simple;
	bh=pber7y85abqTzO4+BpvD36DDrH4k9UMxdCudbXpPu9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aIKcu4sfpwWAzawNFYCbU2CZphRjTakgyLdMA8sPDxIH2z+0hNrhfvi6u+XTEBcEk4bathbMRe7TAFXZ0k6TvFDcjABVbij29kjd/hKAxxEuteYT5CUHY0HzjoNhoqDktiTf7k5+zVvxIcggKt/IQbn9E9SjLZQ5nD8w1mNOIas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3EWA0vk; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3EWA0vk"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso1140830a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790248733; x=1790853533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hiZAP5CE2Qg+2953jUYih6NAEp+heJ/HVnYd8DX8Ozo=;
        b=K3EWA0vkYMP7jvzr5aAzb097gxlUZkrl8kkLOQQ4JfAXTYPuE6pE5QRLOr5Rl6sPo+
         la/98LM4BjciGodW0bCFuknuWK1/izAfo44oRjbeVPuSbUGFgu1637f/k0S1cdkmnDF9
         NpknvsADZofx/9U8Z3I/Lt68Kep4J79a7JYqsBCeorBJJgWhHeWHC+K0jBonUIAUPnct
         O8o3TdbpCdPXZ9w9hAyol95nM6DI5B8qRK5iesV7TqGljTzZV6u1cDGgKdFCoNRw32ca
         UwHO0yr1qfRvUrkOW5reCs/TK2CHxpbxFYdBuaDsPh3Qe9uncyrP3UvxC5mJ3CptGDeU
         sRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248733; x=1790853533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hiZAP5CE2Qg+2953jUYih6NAEp+heJ/HVnYd8DX8Ozo=;
        b=DBesIe/25nLNTqHC+U45B9gHGlHr5RPvc/4sWGXg8ccx76YhhVKcfvoLAYpaTubaND
         pTukKye6/T/PDoFJBNvWo4b2bD8fZeq5DVWpZHTuJOBX0j1GNledF9Z3iJ7JGouxcKM3
         39Qo7ADJUq5iTYpjTjZUZJMUPGd9mK5xhzIDneQNP+4FMVLaTDExs6M8qFiQubVS8rwE
         WNwR/W0BUdu5TOV3QOTxPMZ95yTZbMrGibgsGK/OOqakuKPi+RSfOauPxGRptxuYxmVu
         jmRE0w0+QADCUOOjjcEoNPrKnvAWwj+35+m7Xw6fZYzyXuE7XFtDWmQijeMLc56LA6SN
         TCew==
X-Forwarded-Encrypted: i=1; AKwUvBzDf1tGbFwxQsZkZcPSg17a6UNtBwHvrgA2DO7lZTgg71GWNdl8xb6BAc2cgehO+CHIRflCK25LdgBsSYo=@vger.kernel.org
X-Gm-Message-State: AFuF++nlWMHnUe6nCltyeedGSF9Iux5MvWFti7OgSVAfQG0p1YoTPixD
	TE/Juv6NELvYiQP8V/OuiRxWzERjFWz31YQ2fk9GzEdizdBoTTNaInBmcuS5Aq/Nbz8=
X-Gm-Gg: AYBFou0Z14A0BNHvdEo3v/OhL3myttQr2wnGHrpXeHwiJrQmKzb8ImOZIbIHXzin/r8
	HPi9QebGr7vIQ5qe1mO2qtTBb8BQaXaDo45eHZRasezvCAnmnJl+FdUKAgjQnLLZuF/6ASdeLfU
	BmJNA4+/ACT+w8dEkuXUOUVmv6OPgZG2Q8RiPOZ8MatFq31w0jEDCr8z58V4ujRw25PUD5aP0Qh
	dqima3Y0pYHe2HLc+kGZXZ/pXAabjSJgRjNvK+n+qgx/A7NSNNWiaUXgsWns3ui/+a0HGpQZlki
	IOmgP2o+IFPB4XnRK5g2XAT5Qe6XZoYiS9/5IuGibuiifu7fNVqmK0UESPSKzn2rW1Z9DFdoyi5
	+QncO7o23IibEaLHeLye3Y2fRJjUzblCcNABEr19xuJvQCaXuY7TovrzmkC3DyVZEiAGos7YpBy
	XxPAZOjp4IiY3ghCZHy5UHG4XlF+h+9u0P5T1P2SKvVMSEBlrUKOO04akryDPDJgOHEVxQqNZ7c
	ivXYjxzYnCraaoggNAe/lT/TbL5M1iG
X-Received: by 2002:a17:90b:2dc5:b0:39d:efa9:cd25 with SMTP id 98e67ed59e1d1-3a09856fb98mr1677016a91.2.1790248733078;
        Thu, 24 Sep 2026 04:18:53 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972efa0bsm4314680a91.8.2026.09.24.04.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:18:52 -0700 (PDT)
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
Subject: [PATCH v2] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Thu, 24 Sep 2026 19:18:42 +0800
Message-ID: <20260924111843.937649-1-jerrysteve1101@gmail.com>
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
Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 22 ++++++-------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 18e76d1e78e1..a126c411b5cc 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1427,21 +1427,13 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
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
2.55.0

