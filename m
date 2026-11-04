Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784839;
	b=biHWV3C8wALwiLX0RHi1edzKUgERB9ZFRwxbtEoWjULZvKITKLWtQ2x9TDfkJ2+WmFMK
	 wUYW7Tk+cSgxHcy5/T1nn3NeL3s18zgPg/l+VyMENv43jZLfNszOP43ubdcHyVnH5EDPW
	 OcrpKO7VjxDAqh9/6L/0NxFz8+Fi2eD69tJBvcyFYZ+BkVCy2gTSNLtc4upUg9iXydwQU
	 WKT6WObPmkp2lxLxi06m/p8EaJH6S/H6oDmSTH19cKyonDEnsZXeasN07ctaqka+kJk/q
	 qS0yBbM/2ydlQvMxjJZjjKMI53o0SlXFPmnJ9zjZ6yir0G35WUH4uipuSJCXTHGF3Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784839;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G7Fx59BLxPMOZ31VZbcM4yq1aHhiTqma+q4FIb09Z2A=;
	b=UfF/DSosGbgKyTC1uq02yeSzQCdkst9tE/UXArYCWD1utaMTQnI+3gk/XIdebrca8EzI
	 2/Tmis67eEmGAbu3dy/zUEhz9/oROBYkJ2XSHvOc4QwvOakbJdjqnDZ5VAYEhF4U/1OWL
	 P4XnPe1EOVAFp8nZUpNg1FIpzSg37NCmlY4dPIG8sZuAJNlupUpyCRYdKLw/6SSeigdM9
	 wEnmEUOtEgdvXQFnoZh1Y9Q4aeK2MdPqN1cnp99O32zj8LZRyezyLC3qZKR7VKa1jvMvp
	 hgbSUeHbtntMugZDnsgVnR3oFxSuuFqpHv/kex9F48uhTIviz/2nNaeBoe+SEYf0kdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=OlEOxDqt;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC39606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC39606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=OlEOxDqt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=OlEOxDqtboHCjt/7u8sRo5FA6hmsAkm2KF0c4wuQ1HUYxqVIri9gooH3ok9ua271h8eHT35BvNE6m
	 JftT199fQaaKec8tnFoIaCPqhqixWQfIjq5iRTzgsMGo1qUKrXoHxg8PUuCK790+yfsljThThTnABI
	 QtiMxurzdJGqR5zY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56aeafbfe204-9a478;
	Wed, 04 Nov 2026 17:33:50 +0800 (CST)
X-RM-TRANSID:2ee56aeafbfe204-9a478
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76aeafbf81cb-1d570;
	Wed, 04 Nov 2026 17:33:50 +0800 (CST)
X-RM-TRANSID:2ee76aeafbf81cb-1d570
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
Subject: [PATCH 3/3] drm/bridge: anx6345: disable dvdd12 on dvdd25 enable failure
Date: Wed,  4 Nov 2026 17:33:44 +0800
Message-ID: <20261104093345.1674-4-tangbin@cmss.chinamobile.com>
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

anx6345_power_on() enables dvdd12 then dvdd25; on dvdd25 failure it returns
directly (void function), leaking dvdd12 (poweroff disables both). Disable
dvdd12 before returning.

Fixes: 6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 407834a03..f84427eae 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -294,6 +294,7 @@ static void anx6345_poweron(struct anx6345 *anx6345)
 	if (err) {
 		DRM_ERROR("Failed to enable dvdd25 regulator: %d\n",
 			  err);
+		regulator_disable(anx6345->dvdd12);
 		return;
 	}
 
-- 
2.52.0.windows.1



