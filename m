Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782242;
	b=2XUJtZmh0clGUgjr8C1vXKOoUPT+SISHtq5VOY1dDH5GIKx5BIjGZDlo9db21azkjyH4
	 S30PQerP6evnutXC5fxA3CbYcly3ldgtqNyMPgEy2sDZXpfrcdmmIGNOW0B7q8tYO+qX1
	 p+kiWfhpxpJfzqM+q7zsZF3X5+NJH6AP/61H7rOMbVSC4OBSQLOMf1Mi5HiWE3aE306yU
	 Je9Y1+qj7rRrQTFBu7+bbtugO4EO8+wYc+z2SDr0BE+DxbmgL/goCS+6BQ7y9AFEpD4SF
	 2fxNVjtHZM8uGviVA81oot1VefKzo80XHxmC7jsy6aub4K2tQ4CDOSfHHDiE1kFgc6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782242;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y573XYkCRFKrmNNQbGc1WMnyGDjydPRpWDfPcX/qTpU=;
	b=MaEr6v9BlUINu1RPQLrqiCYidi8YaDQX1sIL1Uqow5wkxs1wQgX0IFlA3drO1CI1AIR5
	 hj4o3+Ey6Xk6NX+sfJFCDayLC/amaoxLoH4+1RbgxfnAnc5Aok0OLm1qAVu/c6H6XZ6nM
	 0aLEuyo3O22jiPTq96RyzXFHa2qYiPvLHwWWM/AtGPTAVp+2Vg1WoART3rdUE11YYb6Hy
	 Y9IX21q+2uIKrzpatfTcYZmnHyNZtHppN5XuVSGSW8YaVwGDOlSGfxf1vx8+3rMCtRtW+
	 PGJlHBM7Not1iPUtHJVtLVBOdnhfkHf2aJ03TqHWYZCwzZNkIMEtelWSdODsOXp0yUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=xl30SfSI;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12304606D806
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12304606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=xl30SfSI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=xl30SfSIXYTLSHqureyeLrvsSIeGRXXsKFGsyKzVtlKRFJ+SxRgEfwZm5NedaqTlTJuXJbTvYnJ4M
	 K7vfPeS6dINBzZa8XQ0Ie7xEpTNkISNw80WU8x14CcvPSRRqWz9J0g7qmIUAhvR5shSDKpLaEYSUJ+
	 XIjRHbgxgLtaLDxE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86aeaf1df1ba-3bebc;
	Wed, 04 Nov 2026 16:50:40 +0800 (CST)
X-RM-TRANSID:2ee86aeaf1df1ba-3bebc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76aeaf1dc8a0-1bc0e;
	Wed, 04 Nov 2026 16:50:39 +0800 (CST)
X-RM-TRANSID:2ee76aeaf1dc8a0-1bc0e
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH 2/2] drm/panel: ilitek-ili9882t: disable pp3300 on prepare() error paths
Date: Wed,  4 Nov 2026 16:50:35 +0800
Message-ID: <20261104085036.1441-3-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261104085036.1441-1-tangbin@cmss.chinamobile.com>
References: <20261104085036.1441-1-tangbin@cmss.chinamobile.com>
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

ili9882t_prepare() enables pp3300 first, but every later failing step
disables only pp1800/avdd/avee, never pp3300 (the matching unprepare()
does). The pp3300 enable count leaks across repeated prepare failures. Add
a poweroff3v3 label and route the pp1800-enable failure to it.

Fixes: e2450d32e5fb ("drm/panel: ili9882t: Break out as separate driver")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index 6d07fe901..a80469bb1 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -618,7 +618,7 @@ static int ili9882t_prepare(struct drm_panel *panel)
 
 	ret = regulator_enable(ili->pp1800);
 	if (ret < 0)
-		return ret;
+		goto poweroff3v3;
 
 	usleep_range(3000, 5000);
 
@@ -660,6 +660,8 @@ static int ili9882t_prepare(struct drm_panel *panel)
 poweroff1v8:
 	usleep_range(5000, 7000);
 	regulator_disable(ili->pp1800);
+poweroff3v3:
+	regulator_disable(ili->pp3300);
 
 	return ret;
 }
-- 
2.52.0.windows.1



