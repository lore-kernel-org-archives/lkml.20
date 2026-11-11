Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390529;
	b=B/P/Tl96yz9+KE52CWjecM2vRCz2Q/CWzgFRnmTR14hAUqW9tVauzfFJpOFaSuytGBXE
	 EJV1pV0HSxb1IVNjBx+ZrXo169jrfCmjJt6IG+gaSawH5fQ6acazfjE1+V2mx3cWEzqN7
	 GOI8+bUyxMJxLmcPHuJEzEYCp50y9dc/D6qT7ieTBOEPqQFBB7h8VTw+mLBRJvSqC6QXc
	 b+K+k9h/s6iON8EgCE3RHpAd2F8mXEPTFsOgl87hmPNWCrJUI00eSzBePXOQBNuqSOSWV
	 wGpi+A3DeKy5gpdZ6qL+tQ0wTWZHSwW/dvQbPZEb5xaQUAL4+2Rgph/7uuZdHdHzuCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390529;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EFr8QXqohI+L1KI/KcXXm4sKk4+earfHZx5Zb0ejnso=;
	b=b94Rt4c0CHRFAU/3TTNV8KS/bhe1pqqlC8neJTdlUQO5TA7I5IPcTLX0cyeKy7/11T4w
	 xyBkMXRqAJa4hpwrJcCzx7A7GG62oYWTFRAs1mLD47nUwMp2c4mlpJu6HOqTGECXc+KTm
	 0cusSaPBKccMXixbYqd5cj6ZeIplZdIC6K6iD+58depgfRfcfXUSpT+JyO2shIBw1QVgU
	 kbUXndvir7ezog5ujPgaApACLkQwiryyvO3UR6M7xkrK6g9KXMgxTqmzVUXJooUebATo+
	 ikRRiErrE+O7ktPtUFCN0OwXEtwCLWHGDK8IPrILOZ2NbTleWq/4k7KdVrb2H5W49Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="UUew/Oz/";
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE3F606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE3F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=UUew/Oz/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=UUew/Oz/rUrlYEg/mMgL3LFx5lIL74NPwy/xBW4ODKKW6MzaLDaSmx3Xkom7PaFwi0C+DBDjE7XTt
	 iOMWaobxzAhJzOyvnKoJ0R/LYggZyCyZd9DHfla86ElY9NcnsvoONKfSl0dKoGQUzhQEnp7VDdeQRX
	 cFp+KDhysD2x9GHo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af439ffafa-77ce4;
	Wed, 11 Nov 2026 17:48:47 +0800 (CST)
X-RM-TRANSID:2ee86af439ffafa-77ce4
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36af439fdf36-d712c;
	Wed, 11 Nov 2026 17:48:46 +0800 (CST)
X-RM-TRANSID:2ee36af439fdf36-d712c
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
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v3] drm/bridge: analogix_dp: Drop dead error check for analogix_dp_init_analog_func()
Date: Wed, 11 Nov 2026 17:48:44 +0800
Message-ID: <20261111094845.1673-1-laixiangwu@cmss.chinamobile.com>
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

analogix_dp_init_analog_func() cannot fail: since commit 917c8d192ba6ad
("drm/bridge: analogix_dp: don't wait for PLL lock too early") removed
the PLL lock polling loop, the function only performs register writes
and always returns 0.  The error check on its return value in
analogix_dp_set_bridge() is therefore dead code.

Drop the dead check and make the function void.

Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
Changes in v3:

- Use the real name "Xiangwu Lai" for the author and in the
  Signed-off-by trailer instead of the account handle, as noted by
  the Sashiko AI review (Developer's Certificate of Origin).

Changes in v2:

- Rework the patch completely.  The v1 fixed the runtime PM reference
  leak on the analogix_dp_init_analog_func() failure path, but as
  noted in the Sashiko AI review that path is unreachable: since
  917c8d192ba6ad ("drm/bridge: analogix_dp: don't wait for PLL lock
  too early") removed the PLL lock polling loop, the function only
  performs register writes and always returns 0.  Instead of keeping
  a fix for an unreachable path, drop the dead error check and make
  the function void.

Link: https://lore.kernel.org/all/20261111080149.1567-1-laixiangwu@cmss.chinamobile.com
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



