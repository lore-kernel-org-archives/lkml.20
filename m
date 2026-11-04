Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784833;
	b=Gzv4KR6RFpMZ6MwBSwFQLM7aQZEPMV6bAKODBh+qtEBooze1awYRoNga6wV1CGzXfLtX
	 PtXW4xz19mxCo0/yaGrsc8gzp926bsBcFdcViL6WQZAFnw3gWK3ZfjDBcZVszpA00GVwT
	 /VMSPs0wvZaAwUgPkalSMgWxuAAJOaT5AUYZc2NN+Wzm+a2kUQ68UAIt+Xn9Co29p9vtl
	 JU8lwRQLcZMJfBQr/dudO3UXZzy9vtRfQv6JOTTSmBo5MCAxifLM8LjckmSkSHE/jpqrt
	 fxI8MN88cTD6bWR/M4yzOaA+20tj4M9iXR4l+4bisM4UapXSBVm6747bLz1mSvMBKFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784833;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rtj4alEQPdRHgY54syZ6e8dMVYmQ8YVSXwmnQltrvWQ=;
	b=UOAooDDJUJ3rpKaZXQKsxD/i+PZIUsuv8t5q9bF8MTP4cfuXD866nDmhcgahXO/mTkwV
	 gQ2Jge9R/CvhqLg2QWX6EBxCG9kQ/E+/z3bLvs99RhXTkJeRrH/YCyI3dZ1ZYwRDhUyjk
	 4ljVAeyLqPN7MTnBtNoDXkKd8KWqycbmGLSevkaUNzdshZYwP4KAhjI51v42EaGj3QQR0
	 fIyXoXT07O3AkVsVl7kAIs5UMdsSxMATDKgoRNtBoEaXNzQMqeT1kTfWvXAewLHteX5/G
	 hBojKlakmmfMhwbKV6Ie+6HVh1mmJ6A2jri1f58xZQwhm+VWX4gCxuMemEmhF92zuSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PORqWNSz;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEFC606A33A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDEFC606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PORqWNSz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=PORqWNSz4Ay5034thcuwuJlqTACy4Fw0zvwgHPMyQfoNM73whaMEwRnZhElZgjv7Msj8lO19IiX9s
	 EYxq9Vh+Xc2gTk7SCgQMRGYX+fC87pzHf3v3rR6N6bv0usEAeeHhJEZc9PhKY/l3+MwpQM9CQPPlci
	 DqufPjjzgUX+BOaM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86aeafbfcb46-3c84e;
	Wed, 04 Nov 2026 17:33:50 +0800 (CST)
X-RM-TRANSID:2ee86aeafbfcb46-3c84e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76aeafbf81cb-1d56b;
	Wed, 04 Nov 2026 17:33:49 +0800 (CST)
X-RM-TRANSID:2ee76aeafbf81cb-1d56b
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
Subject: [PATCH 2/3] drm/panel: otm8009a: disable supply on init_sequence failure
Date: Wed,  4 Nov 2026 17:33:43 +0800
Message-ID: <20261104093345.1674-3-tangbin@cmss.chinamobile.com>
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

otm8009a_prepare() enables ctx->supply then runs otm8009a_init_sequence();
on init failure it returns directly, leaking the supply (unprepare disables
it). Route through a disable_supply label.

Fixes: f0a5bb9803a9 ("drm/panel: Add support for OTM8009A panel driver")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index 130520558..49cac3012 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -281,11 +281,15 @@ static int otm8009a_prepare(struct drm_panel *panel)
 
 	ret = otm8009a_init_sequence(ctx);
 	if (ret)
-		return ret;
+		goto disable_supply;
 
 	ctx->prepared = true;
 
 	return 0;
+
+disable_supply:
+	regulator_disable(ctx->supply);
+	return ret;
 }
 
 static int otm8009a_enable(struct drm_panel *panel)
-- 
2.52.0.windows.1



