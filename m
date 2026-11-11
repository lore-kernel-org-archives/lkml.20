Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384113;
	b=vDZRrbrTIyQOL8ZS3Vu6FDG//SecFzld/Aw0cbyC5xuT72/j1w2Bx7EIN9AcX8u1KTYb
	 fzAAc3PlcZiylNqCAzo7YGg8aRwSpPmfCWmG6wHkS3rDcPi/yfBNuYOhD8u0g+7BTGbxv
	 WM7NGRjIgKHxOuf20yXRjamRZUHMru5/+ccqBM8uD9FSOos1h82qAQMjoOPyes46jSL3k
	 d5rdYMrNjdzK3d5QRew5pDmiNxOqKfIVAd2R6kpWgSr2d+1vG2/tcMgMSuAU81vhCi7R9
	 Kq6BI9fvqiEfve2f0zkD3WJosm7shMuthblqKiZdm1kROWDOhs+epCDwGnLR+J41VgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384113;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7kKjBKtDz6+1wbuMki0lj5bwNAc2Wp2z0eRFwJfc1qg=;
	b=W9AAvCt1JRyhjMEjGOrE7Pq4DV92IccgZlsrASPAsEH7XNmJv/qrVJjZUQ5EMTjV4FyG
	 5ljf8W5qZEKLDrr0Cw9Gq9qhmYQOO9B58xahDZBhClXXwC9cEM3La4dfI9qZ4XvZlB97G
	 EUIg85pbr3TyKOMP71/k4rz9eXtHmAjRCeMFGritGO1InYHrjdSiKv3W2Z0D3+X/0wHY7
	 nxzEE3dWXy6SgJG26r9nMWSqSlmFaGjx+03hF8aJEQG93KGfqkXWNd06KpKwVv7Y8wfQo
	 6o6rSRZlWLxGYByDHdZpggUUWik4zRLln25SI6UxKyOMqecWuSPTM7Y+ch+xLL2Zaiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PV6yoypa;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B293D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B293D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PV6yoypa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=PV6yoypawkCDH93cY3I0NNn/rXqONSOme8xD5TQBazJcENRjzvdgelcPiuTCk7lNs1jKe6u1w7MIZ
	 gLUhV30eWVfdzvlOdjIlVwuq0oJv7ShCeOZ3iNm/gQT9QctNjscH9Hu3AaBVm6P0uyMVF9u5ItJMl/
	 5LqDrjN5X98tCDes=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af420ef177-7601c;
	Wed, 11 Nov 2026 16:01:51 +0800 (CST)
X-RM-TRANSID:2ee46af420ef177-7601c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96af420ed56e-d47e8;
	Wed, 11 Nov 2026 16:01:51 +0800 (CST)
X-RM-TRANSID:2ee96af420ed56e-d47e8
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	laixiangwu <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v2] drm/bridge: analogix_dp: Drop dead error check for analogix_dp_init_analog_func()
Date: Wed, 11 Nov 2026 16:01:49 +0800
Message-ID: <20261111080149.1567-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

From: laixiangwu <laixiangwu@cmss.chinamobile.com>

analogix_dp_init_analog_func() cannot fail: since commit 917c8d192ba6ad
("drm/bridge: analogix_dp: don't wait for PLL lock too early") removed
the PLL lock polling loop, the function only performs register writes
and always returns 0.  The error check on its return value in
analogix_dp_set_bridge() is therefore dead code.

Drop the dead check and make the function void.

Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
---
Changes in v2:

- Rework the patch completely.  The v1 fixed the runtime PM reference
  leak on the analogix_dp_init_analog_func() failure path, but as
  noted in the Sashiko AI review that path is unreachable: since
  917c8d192ba6ad ("drm/bridge: analogix_dp: don't wait for PLL lock
  too early") removed the PLL lock polling loop, the function only
  performs register writes and always returns 0.  Instead of keeping
  a fix for an unreachable path, drop the dead error check and make
  the function void.

Link: https://lore.kernel.org/all/20261030082820.1457-1-laixiangwu@cmss.chinamobile.com
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 +---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6df696374..5b1b05d24 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -996,9 +996,7 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 
 	pm_runtime_get_sync(dp->dev);
 
-	ret = analogix_dp_init_analog_func(dp);
-	if (ret)
-		return ret;
+	analogix_dp_init_analog_func(dp);
 
 	/*
 	 * According to DP spec v1.3 chap 3.5.1.2 Link Training,
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 456059760..440007e22 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -192,7 +192,7 @@ void analogix_dp_set_pll_power_down(struct analogix_dp_device *dp, bool enable);
 void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 				       enum analog_power_block block,
 				       bool enable);
-int analogix_dp_init_analog_func(struct analogix_dp_device *dp);
+void analogix_dp_init_analog_func(struct analogix_dp_device *dp);
 void analogix_dp_init_hpd(struct analogix_dp_device *dp);
 void analogix_dp_force_hpd(struct analogix_dp_device *dp);
 enum dp_irq_type analogix_dp_get_irq_type(struct analogix_dp_device *dp);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index c1344a3f0..3d196cf96 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -351,7 +351,7 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 	}
 }
 
-int analogix_dp_init_analog_func(struct analogix_dp_device *dp)
+void analogix_dp_init_analog_func(struct analogix_dp_device *dp)
 {
 	u32 reg;
 
@@ -372,7 +372,6 @@ int analogix_dp_init_analog_func(struct analogix_dp_device *dp)
 	reg &= ~(SERDES_FIFO_FUNC_EN_N | LS_CLK_DOMAIN_FUNC_EN_N
 		| AUX_FUNC_EN_N);
 	writel(reg, dp->reg_base + ANALOGIX_DP_FUNC_EN_2);
-	return 0;
 }
 
 void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp)
-- 
2.50.1.windows.1



