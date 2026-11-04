Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784831;
	b=hE6NFH1rrIeFdnetLX/gVtdNTFjsRkdCuU7Kg/gahygKlsHQLTBtWXzX+1w+jIrAU6vs
	 lBi4wAm/bWXSB5+SGQzDO6+bVPvw8q5bIUfX796bJhCKuYYx0xMow+JwadWqitGdPMHoT
	 ZaxokxTaSv14gXgEa7xy3KhrHuJPboxO1qB8Dwpf7nD5QV/USdPSoOxiuq0a3WnaeEczn
	 jn9osuGy0233/lBnbns+x+gM7Yl6zeC/hUIzRECFUfw5BRtaenr0Fy0xlOrPQ7bxRT85J
	 nhTp7vZJnjnBrDFjcTjyhlb4iRGso+ndRJiV0uqczBEr6rxt4Xx1Q8O0mh9ZJX47WkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784831;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AlwZjxEzmz37aOKXpOAOHcAPcX+b2o3Ne6WYstiS9/Q=;
	b=JRRSX8UzAnbpvgYPUonwY+UJe04h8W+egrW2D6lZpdrrpCu38nU3GhMwNOvMMd6BE/zQ
	 YSwvtMt6jPAcow2Njbd5+8GmHuX+beneGLE/9SGHLr5/0ZgrNdclM1mVy3YcNIGlInvAM
	 UcFv0yqYZk3i98DrcwblrCOLbpiXHro3BH+UZqyVLVT+jTrV5JD4fIReEVkA/bAMQ0j9A
	 HCx7X9eXffd+Lk6bu9kihBeN+ZNqmmITewzk4kBRZ1doDUR3NcGiG0ONNaA03LqEqbzn0
	 qWLWRJBR+vZkxo/hWkJgyM8ZPZWBUS4QLvDlLV2rahAepBMSQoMMxAJS8+z5JBArfmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ZP3FzS42;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693AE606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 693AE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ZP3FzS42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ZP3FzS42an+AZX9Yct2Owns00gWBQnra90b75JSakDgZ+KQ8uuyuCrUXiTs2bEEhAjmVhQyFm4qsz
	 SHziRlr/dVNKZu/aSIErQitFSJ99VGp54fxTuDZHd5f47LkJn7NMvoyFUBZhLZ8pSvt5rVO3FGjj5G
	 c75FJXC8dOgn618A=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46aeafbf8aff-3c55d;
	Wed, 04 Nov 2026 17:33:48 +0800 (CST)
X-RM-TRANSID:2ee46aeafbf8aff-3c55d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76aeafbf81cb-1d568;
	Wed, 04 Nov 2026 17:33:48 +0800 (CST)
X-RM-TRANSID:2ee76aeafbf81cb-1d568
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH 1/3] drm/panel: renesas-r61307: disable vcc on iovcc enable failure
Date: Wed,  4 Nov 2026 17:33:42 +0800
Message-ID: <20261104093345.1674-2-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261104093345.1674-1-tangbin@cmss.chinamobile.com>
References: <20261104093345.1674-1-tangbin@cmss.chinamobile.com>
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

renesas_r61307_prepare() enables vcc_supply then iovcc_supply; on iovcc
failure it returns directly, leaking vcc_supply (the matching unprepare
disables both). Route through a disable_vcc label.

Fixes: cb6c01ead1eb ("drm: panel: Add support for Renesas R61307 based MIPI DSI panel")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/gpu/drm/panel/panel-renesas-r61307.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-renesas-r61307.c b/drivers/gpu/drm/panel/panel-renesas-r61307.c
index 53556452e..0aed970d8 100644
--- a/drivers/gpu/drm/panel/panel-renesas-r61307.c
+++ b/drivers/gpu/drm/panel/panel-renesas-r61307.c
@@ -100,7 +100,7 @@ static int renesas_r61307_prepare(struct drm_panel *panel)
 	ret = regulator_enable(priv->iovcc_supply);
 	if (ret) {
 		dev_err(dev, "failed to enable iovcc power supply\n");
-		return ret;
+		goto disable_vcc;
 	}
 
 	usleep_range(2000, 3000);
@@ -108,6 +108,10 @@ static int renesas_r61307_prepare(struct drm_panel *panel)
 	renesas_r61307_reset(priv);
 
 	return 0;
+
+disable_vcc:
+	regulator_disable(priv->vcc_supply);
+	return ret;
 }
 
 static int renesas_r61307_enable(struct drm_panel *panel)
-- 
2.52.0.windows.1



