Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278255;
	b=lFtqT2Xav8EJAcmCV9O94MbBPcscyijowrNDs2gVGGcWH6BSd7y+deguNYdvwkVK/8zS
	 8OJeG9nJCIYz4MFDdzNuryPdcJndgGI5cw2P3i39QomDrL5FfHXTOkC2Y3AArYoF2jLAG
	 gdQd+2jbGY4vIRY3I9HHpi9jmB/448Wic0c8tArVgFN0DbqOnLces0YANyNhsn1cZ0U2s
	 CVu0Tw8Jmi3ygFaBm6X25adeixIqhysobnI09AJugY1TlRpN7M5RvUYSUFW/6QmLN0ieo
	 wlg5NhFlg825EGaujBia7daFSK/E8AJO95dVGosLseDUrQx2JNOrjrB+N2y1KaUzfRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m9wZvEuCDe3XvfF7/Jwj2zWHljA+DeJITddjwCddf8c=;
	b=E+WdMAhl5r8xhQgNDjC7qMaxk/Ec7oWY/PBksBdJNRMNGYxMdpwx25V/wXTkZOQZEtcW
	 djuPDCFGyacsp+jFjEGyxzseZYg+MTa2X0X5al/m6qPpav+Db8JTmUTOnng8jlgpEuFr1
	 GEqdBC6FV1lu7uZVI+5HHSErwbokROuOQKrks5tiY/IVE17Ecz+1+w9ix1oi9qq5GIqoU
	 jbLJznSJnntPIbluuxTUmpMb182uPTgBeoVQyxb0yekVNKvtMPh8WbptgX3CfyaaMT8YK
	 haKQ8XNEWzTuk0fzc0Hxle/wKNQAQWSOp1dp9DZzmQuImhj82fKB3S83rtT5JzTry0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQjtZ82R;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1460A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1460A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQjtZ82R
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36dbde64409so3034932eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278254; x=1794883054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m9wZvEuCDe3XvfF7/Jwj2zWHljA+DeJITddjwCddf8c=;
        b=hQjtZ82R8B+XPs5+yW7eDyvICs0rGvbNFoRfSZi/YCssS0NKLY6LRBThpq45XLwuNB
         6rjITniVYw1zI6UHHn+a1AhKSQ8ljGpj5GD6r+MLggmTJ9nfMK7pRf61yu+Cw6/R6/El
         yUzFP1/zbZ1WLgKAXQZGwV7jag0Yzpn34M16ia0t+d7bBihLG7YmrCL3C4JNGw2WIIKU
         ygH9CCr1A5QnB2v2fbdyklRe9euSVBMmBzk+RLjETT5QampsgBj6E+LLVAe23Qeqwu8t
         HcnqyW0oPM/gVg1W0WSLwFOBp2UjxQwDHZwjyYhxvgNe0uQuhjGM7owzppxvtA+MqB+D
         kPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278254; x=1794883054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m9wZvEuCDe3XvfF7/Jwj2zWHljA+DeJITddjwCddf8c=;
        b=nC4Zw0Hsk2yhrTFToSWdxcvJv1e1dZkoE0T8Syt36EkG5noVIjGVVmL5kALWZG6D2B
         5h7z37fmIGUG1H6qLYO5jMtPwYDbDYaZ24Y2EtqKLNL9vMpc+JQUD9yAuxT7Skv3L2W8
         QSoF+j9ZE/NA6ii6GojTeyF08/lSfJRqr+3ofqpOOu7xuJl4FGyxS7y2K8jZpbLACIGp
         XLdJZ/qIbkX8M+uFd5+oKeQgzXq1UB9T+su/26Mje8sHsF9EkFT3801vy0BwhGm4dQoz
         e99rJvV6wIw9q2xZ2UZ2V4tun0/4d9gJtOJYzVaDh/EM8ne3Wqc5XrGQdh3epE5aHV8H
         oQ2A==
X-Forwarded-Encrypted: i=1; AL+hErFiaEp/dcFSJmIcdyc9BHKCfgtuZO28Hu/shMw8p0Qs3y3laACvU4FnQ8t1TiNxDOP+UV6hkWKEw8QxJOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mwySwQLFbOyMcOfOEgZtjkx0taclgy5IQIQwVT7FQCd5RriaS
	o9X7ApyDD299sp5o9vrgc9G/vTXcYrT9+6eBcoN4uFsAkx1od8uGQjoc
X-Gm-Gg: AYBFou1/o4eN24IQH/PCn+8c7G33BHdLf2ZiYQQLkTq2VAv7+qCWVkejqOkSt2BG7Dg
	WznzL1jUxppBPwOHsJxIQyjolHvXyCjzPOqRDhw58XBsjDPIQq6AQjYb57NMbkNfVMATO3yQfGg
	DLyWn+aGBMBTbewydm8EgkYzkbwlQqsswvHwD3yWWoiQn0ZVDRtI2Tm4vpXxj5gXnaEOXLjtXx0
	j7FzJcwrpFHmSis7uS66fdl6850odzSPF7EVLlHECOMx95p81c9850RrMIDGO9u+NLX1WzeIvEv
	ubpjb8h5rHf8H7CM69MJvDRKm7UM16J4OVcRcZEvTArv8oEF/YOY+jst1n3mgNTZ+kpFWqFMdRM
	J12YXPHDp2Jb+eAffdJjunQGqOqJ7IyQgB0Aso682l1P3Vf431ihqJD+vdBxUbi84W6TvFEPrBJ
	ByRiub/EABF8oAwyFnKmHVhyejamyxPJmw3OsOAZrhq0kPEVGfakXeZ3lU0TaAjji56jn9Bo52T
	eh9fAI9D6lVcm8001x5xwcmjfiYH9WUiCje9GtOsoySrAK6LhtRK+W4AgTb2p3xvXPUcP6L8oua
	IBc06HakDaB6FtMdg3i/D5h0aVsuIB0ydi0/33Y=
X-Received: by 2002:a05:701b:4354:b0:1ac:2f6d:e1c6 with SMTP id a92af1059eb24-1b3b5fa8f34mr1600581c88.6.1794278253866;
        Mon, 09 Nov 2026 18:37:33 -0800 (PST)
Received: from arch.localdomain ([152.175.35.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b54431sm2883025c88.17.2026.11.09.18.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:37:33 -0800 (PST)
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
Subject: [PATCH v3] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Tue, 10 Nov 2026 10:37:19 +0800
Message-ID: <20261110023721.2014061-1-jerrysteve1101@gmail.com>
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

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
---
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

