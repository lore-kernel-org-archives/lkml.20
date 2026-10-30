Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348919;
	b=cs0mLLKAFwDbp/sHpsM6PBmKYEye5qcdPu5b/W0ljm9zIQiw5a2s9zmGye6ZG5qMh+T/
	 SpTUW0aHFXCy9xo06eUabsXiMdcdwFoqTGxzFnD/AHZL/y4vp1HF7oVDYMKOHEZqis80c
	 41XwZ2mec1zKRN2XnumErL4nkM8bnuClX0jSvhO49hm2Tu16mk9jzabV6HG9po4O9v8zR
	 NNaVLPxZOHzlX36EFikoX8om/+SwvP0OR8sA/+BNgucoP4YuxXk9qgoMBJ3lTWWVHRiRU
	 W7hS09Gq+Aj70Oah36PjYFmtUkBr7FTcJksd2dPgBNEiak8LUoc/U0Q3hlqDRWH8NwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348919;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rXWAnJklskrL51buwljdoNJx6PYiigvCkhTJL5aPkJo=;
	b=jrdfNPRuzeVNWKGM9zhvU9ALO5yx9m8BJaMIF72HpgjRwgpyO7v+DZDr8DE2xwoN3ZZE
	 DH6UrSjyZ8pMIfKTmYcq/hXieSBLNNGjs7+UAkGOpsrD8ylf9Xn/bmj8gQGdOe2NaJCVC
	 rIe1fexdPBzFlQaZ+HCtmHAlingHRgi4acGAhEo9s+OIX+rwdSroamB1OPpzqkwmKJe3+
	 97InfpzwnXD0S1vMToEb8E+YHabUztiZEFUZyKpeOymUNxJtvoXZok7o3OEbRTEQMDqXb
	 cWqAG4+/ABZHJs44A5P8iF0OqJ2PzaAWlGC5takibLLPAxjiTgPzq+hE5YlppLPma9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ohBY4CfC;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAD4606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DAD4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ohBY4CfC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ohBY4CfCdfNMfNxcKYYNAhE9WjRmH3Bef0DiveadKDnmWi98cA9TBe7jAqwidcmZDuKgqSD/jS3Jm
	 1axd+tfu8i/PSA5syweKrxUgTtQUlb0k2W100V6CkGCC0/i8hrhotmqReDWUoe4gszgeAuWc4xJG7F
	 WgULhl1gFEQRAGsE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76ae4552aeab-73f7c;
	Fri, 30 Oct 2026 16:28:26 +0800 (CST)
X-RM-TRANSID:2ee76ae4552aeab-73f7c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6ae45529408-0243f;
	Fri, 30 Oct 2026 16:28:26 +0800 (CST)
X-RM-TRANSID:2eea6ae45529408-0243f
From: laixiangwu <laixiangwu@cmss.chinamobile.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	laixiangwu <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] drm/bridge: analogix_dp: Fix runtime PM refcount leak in set_bridge()
Date: Fri, 30 Oct 2026 16:28:20 +0800
Message-ID: <20261030082820.1457-1-laixiangwu@cmss.chinamobile.com>
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

analogix_dp_set_bridge() calls pm_runtime_get_sync() to power up the
DP core, but if the subsequent analogix_dp_init_analog_func() fails it
returns the error directly, without the matching pm_runtime_put_sync().
The two other error paths in the function already jump to the
out_dp_init label, which drops the reference.

Every failed bridge enable therefore increments the runtime PM usage
counter, and repeated failures (e.g. during hotplug storms) prevent
the device from ever runtime suspending again.

Jump to out_dp_init like the other error paths so the runtime PM
reference is released.

Fixes: 3efe2ace7f5b ("drm/bridge: analogix_dp: move basic controller init into runtime PM")
Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6df696374..c9c1375a9 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -998,7 +998,7 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 
 	ret = analogix_dp_init_analog_func(dp);
 	if (ret)
-		return ret;
+		goto out_dp_init;
 
 	/*
 	 * According to DP spec v1.3 chap 3.5.1.2 Link Training,


