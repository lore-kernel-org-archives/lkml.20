Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCFC502776
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017256; cv=none; b=KIBm6Jhbp0yfloWDhzuIYnhMShGT9a9B3JCbbq7PbdQFcsImriT66BK4lTa4aBX6tzDhkXhr0GAGLi1o9QzRjhS2hNcXSyIQz5eFLsps7mWTccrgZA2s5z3/5Qvon4tmTNtc5v6+R1h3S6aoADIsecFV55kXDUIv9QyHtdcEm6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017256; c=relaxed/simple;
	bh=gGdU0/EXCG5TMy/5O7iLHRxSho+oegoNokvm40bJP6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GtYQDNFHRlTcWD1S7Nn1Qx008+a7KYsbc2XTtE3mPcTqOKx4GqSJdVPnGzjL5cquD+behqbmk8z+fAtzlNxlslnjcnzNAnJKm0GOBXF/dIz8Q3mu0X+K6B22Qx8jTD8eC9haccI9YRKeNxCn+wYfZDsQLmg6BFwumQCV+YGIh34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSB4/NEp; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSB4/NEp"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso34277525e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790017226; x=1790622026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fY3g4FN86lO7gTsP1NjKj+WPROihpzXWYs8IbUHywVs=;
        b=WSB4/NEpyEWizkQwPo1rYKiMEv6SRn65zI3f3a5uvHqKXe0lBrDZnETK6KlQjxFvXZ
         o0MUh0T2MeyZDs7+l1t/gxc+K9aQeNbMxtSat7YALj8BP9waZ7VlxrIMlDTUdCF8c+0r
         YBGMoRtLQQAyD0vJTYHe6qE5OeBdAN7vRHaf6l92kYxLaTyEAMVEqBU6W9RGBrhWjTEp
         /izcvPPe1Jt88cx27Z9GGsI+2ZFEhmgySeDPXT2lyWzX7zhvA4E8vksT2hlAK50zb/GY
         WtjQBAVvTeR6sFvjpE/8x//kZmoScMDV9EoBiHb9OUau+nGmGtp0kSmcnAaAkgxDOM8m
         G1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017226; x=1790622026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fY3g4FN86lO7gTsP1NjKj+WPROihpzXWYs8IbUHywVs=;
        b=rnEPaHZFkh65XUK+8JpwNwdMFVBjZrFk8Rb9h6zNDWDTEeFoupZpnTKB6olHgjlh1I
         va+BCNlWVxYbramf4dPBWURHuD77PvlJrZnGiUjA0Lz/XmM88L7zmBPrfvOha10/zs0i
         v+LE2iH9tonQAjqMC4jgVbkcWaZ8xHe7OetSucNfGYGcWpbaIdkms5wvatiPxMpw+691
         6Rf+hidPP2nEqMxKXca/sif9MuBWqPcSTpSTFBVAnJ0m9NzaRZsMSkN3k30VrQI8AYM0
         WzqYRyL3jPmCTW8fmiHtTysgAr7vlCyYqxsMyefTs3ZEMrael8HXsbZxu0bPVfc1t+7V
         QlXw==
X-Forwarded-Encrypted: i=1; AKwUvByGk8b3VuegxJAkNEY5XJRpbOSZ1HflvZJ5NJIf9RgSb82tU84c59Q4wy1VWfDN208UvwSLbHLyinD7cC0=@vger.kernel.org
X-Gm-Message-State: AFuF++lGpO5Ngodc7229gVwzUz8xkwvR/wpzm0E5fL33IJ3ftg7tFzXb
	qpcqmw6eBt7YI0rQ7X6P8p0kLrLNENmW7vHCnjrTX0tsowOrLvwBUEJS
X-Gm-Gg: AYBFou0zGQ5aRnWHjeCSdDD42/9UT+SbDDCeiYrQ9A7rh0k3vwi1jYfkf58UuU1NR8h
	sN4uhcqReq/QR+xvJzFQcagmEgzUnqKcUnERBy5O1NMK7/3krXB8C8/QEMYagACG+7dH3O1DAhW
	2WdNmSu235IhZ1GLWgCRCJfl5Us56AKjm3DyGhkQki5WN8w+RcessVW0ZRv0NIYWSV4NZmq738J
	jo2tF/9uhvOgdqAE8/hgyUYfGyV5pIdYWjIjs2E4dYUVzrtuIH1x9r61AvGPDD617VA2GlwbZPC
	P3j3fogyddJOnyoOLFVfOcRiD0kxtG3mkMuOHa9t81jlfU3bDAmyAOLISMFuvQwXoqcsT/Pinyt
	iC34mkrzt9rYZMA9tWNbpv7xHtrPlpFLU87pUjlqrP80UrpnJQEc0Dpcnr5f3LVVoo0xwQK/5fD
	VVEcwozoQlGSxrQm7gGa0s9GgD2zoW0NvGzRwSf44gCLbO2hhbUv3er34Zb9SK1YK0MHzTxzSIq
	Sg3TBzy+d4uenIcDV5DQITkRQPmavYeeuSwZ/zwfA==
X-Received: by 2002:a05:600c:1989:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49fc5673292mr181013065e9.7.1790017225923;
        Mon, 21 Sep 2026 12:00:25 -0700 (PDT)
Received: from karanja ([102.205.238.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8cb5e75sm11475555e9.14.2026.09.21.12.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:00:25 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: mwen@igalia.com,
	mcanal@igalia.com
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH] drm/v3d: Restrict v3d_perfmon_stop_locked() to v3d_perfmon.c
Date: Mon, 21 Sep 2026 22:00:14 +0300
Message-ID: <20260921190014.38231-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3d_perfmon_stop_locked() is only used within v3d_perfmon.c.
Make the function file-local and remove its declaration from v3d_drv.h.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h     | 2 --
 drivers/gpu/drm/v3d/v3d_perfmon.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 29fa14be130b..611618030519 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -703,8 +703,6 @@ void v3d_perfmon_put(struct v3d_perfmon *perfmon);
 void v3d_perfmon_start(struct v3d_dev *v3d, struct v3d_perfmon *perfmon);
 void v3d_perfmon_stop(struct v3d_dev *v3d, struct v3d_perfmon *perfmon,
 		      bool capture);
-void v3d_perfmon_stop_locked(struct v3d_dev *v3d, struct v3d_perfmon *perfmon,
-			     bool capture);
 void v3d_perfmon_suspend(struct v3d_dev *v3d);
 void v3d_perfmon_resume(struct v3d_dev *v3d);
 struct v3d_perfmon *v3d_perfmon_find(struct v3d_file_priv *v3d_priv, int id);
diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
index 07dab7fb3060..34f17e7b8f6b 100644
--- a/drivers/gpu/drm/v3d/v3d_perfmon.c
+++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
@@ -305,7 +305,7 @@ static void v3d_perfmon_capture_locked(struct v3d_dev *v3d,
 	v3d_pm_runtime_put(v3d);
 }
 
-void v3d_perfmon_stop_locked(struct v3d_dev *v3d, struct v3d_perfmon *perfmon,
+static void v3d_perfmon_stop_locked(struct v3d_dev *v3d, struct v3d_perfmon *perfmon,
 			     bool capture)
 {
 	lockdep_assert_held(&v3d->perfmon_state.lock);
-- 
2.53.0

