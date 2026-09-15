Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC414A64E3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484409; cv=none; b=pKcDaFMgjA9GUbUuxUftwgwjB6QErpoqrz8hitjQCFYW03xn8pT5PEqWsPE1RWZlpdb1CHGQRvYqub8vh/o2U97c61wx5Yla3ceQLusrDDhCyKhzn0hVGQZZr3N7IUyoK3Kcho95t1Xi4juWlmmzsUePW8HXhStAQ0pqlIkjo6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484409; c=relaxed/simple;
	bh=YiPvqK3RM2WAyR8J0q7X2AJfL+q310n8+pBK5NhbzC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pc5kII0ikei+Gw82fAv7gbrjD4UyX5dqXJjrzXbl6S9ePojzRWu+TZ9eqtOc2erqaNqx0gz5+JV8atR001wk71odsM/ywY9mzEdxSlA59I5cY+okaEFSsjZov0HuvkQnO9IAuInr2p2oABkHnDQytuomsoxkmRhTW78Owa+kq3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGIUhw2G; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGIUhw2G"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so2419556f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789484406; x=1790089206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJdJD3QqQwQMMkyFiv3mcDmZ+uwdZyV40+weLnHsOGM=;
        b=cGIUhw2GIqf5119kGI1heUq5SaSRB9NLtXwHU4ryDB9mgIk7bhWCMi8ZfjVrIzuCph
         OfMfDZengDc1KUeFT+O7/dn1mj+Tkxo0Fa9wfsR4OaHKIi/fS/ijsMCbHVEAelAhzD4h
         hSE57k0Uu59UyW3JOpLsVkDRnf8koYwGP5K1eJ1FzyrChjvJQEOfe5fCOrnb2Au175Db
         jksChlm+N+4imUd9pARD4yZZevIbfZfqEela5vvQ9l4t84MUGpCQ6Gea6TxrRTU/7i1j
         nLJXg6bF9GdPd+S3k1ZlH6dvvdjNDhqMF7wzmIDCeNXj2VTkBVQA5UAKUEoZNvBHT1p6
         FurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484406; x=1790089206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJdJD3QqQwQMMkyFiv3mcDmZ+uwdZyV40+weLnHsOGM=;
        b=gUJnra+sYtMtesUNhOT0tan0w7JyC/yunwSlIkg6YkTgC32UYd5X9W8B4QkfXuQGfv
         bPRmSEBXQKLm92p60wrVxq2a/lkSkaVxc1SjFU7peDx6Zxo8gFCO5OPStWhDTrEHNSqz
         OffFfU1/RgYVozg3CntfI50Ow3tJ7DNznLtNV3CJ57sUeG4h4NYY5ys7R22sGjDdyNnX
         0GXcgpz08yXNrZrQUszK8THq+CLFAXFoIA3IUhgdhWFTttxWlePDJnYSQM1Qg7Kuq1Vy
         UXlLUaoXzF3elQYVPXQDgTxb/sCLIRei5mHxR9Mz270qTvfAZePRT1VhjX4GLyyOltBl
         /HXg==
X-Forwarded-Encrypted: i=1; AKwUvByia6z9oAurFWvZdICDp5dZbOf/mNHeHRF0C5PrUpFPZcU6VrFydrwtIExOysjRI3FPhT0L7MhLi6r32WA=@vger.kernel.org
X-Gm-Message-State: AFuF++kV9NcLRDZBdC7xcjnRVCDDnQ43Me+BgTNpvMwMs2TyJ3t9ldLh
	VZbTd8UeJY3ToY+uDKPENBmUNGO4zMh43CcXdM+otiR/yQjH2Y2zRMip3LZiKQ==
X-Gm-Gg: AYBFou2wwg+8mLyP5csK2OjjumoxNNpHErxI3BAsZ+A/Q2584WUx/9Vhvp2IrKd4Gbp
	6iN07vtEhUUjOUwfLPHAbEgm+qb5s8pFzZRIMs2PVWpRERWujy1ELXJI1TkigoJymxMMu423W/I
	2CW32Cf/dZvguvMdv0GgeTl4TyaAiZTZ3Oa0Tc5yj7Say7OoJZUc7vB7zk+RErU5QXxFQQgF7f8
	c0jAimJd/rsVmKpJ6Qju5EzIyMOxqNcEuls8s9h/Y9QFhNtoOdo57st6ZrF2n+MUh2uU1fFB/Lc
	tWGm2r80zEeV/S00RSsWGxjCevTrvaXDEZ346HzrYleP1lSlidLs3gWauLgt8RcBN0RzPMSij+B
	sRp0YHs3LRyy+O3CsIPr3Lu3GQXRlSjwcid6ywcUPfkBcjoKOGX6TyNlPm53IT3D7BGc4OpJQ70
	zHRC+H2OzT+EC4ZX9VMgxvFuiPGv9BXWlJtDvy3sgU4h/tqClCHVZg2/VVKWEGjxkfPSg63U08j
	+hmlezo3XJti51RNyHKwnN+tPoNbulRUw==
X-Received: by 2002:a05:6000:41f1:b0:487:882:5de3 with SMTP id ffacd0b85a97d-487088261f9mr3482941f8f.25.1789484405865;
        Tue, 15 Sep 2026 08:00:05 -0700 (PDT)
Received: from osama.. ([156.223.70.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48707e00133sm5081128f8f.11.2026.09.15.08.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:00:05 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: luca.ceresoli@bootlin.com,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v5 4/4] drm/panel: simple: Use managed helpers in panel-simple
Date: Tue, 15 Sep 2026 16:59:31 +0200
Message-ID: <20260915145935.60397-5-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915145935.60397-1-osama.abdelkader@gmail.com>
References: <20260915145935.60397-1-osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the managed panel add helper in panel-simple and drop the manual
panel remove call from the remove path.

Keep the MIPI DSI attach and detach manual, since panel-simple's
remove callback also unprepares/disables the panel and releases the
DDC adapter; deferring the detach to devm would run it after that
cleanup instead of before, changing the teardown order.

Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index c95964ba25a9..02d21dde5766 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -737,7 +737,9 @@ static struct panel_simple *panel_simple_probe(struct device *dev)
 		goto disable_pm_runtime;
 	}
 
-	drm_panel_add(&panel->base);
+	err = devm_drm_panel_add(dev, &panel->base);
+	if (err)
+		goto disable_pm_runtime;
 
 	return panel;
 
@@ -785,7 +787,6 @@ static void panel_simple_remove(struct device *dev)
 {
 	struct panel_simple *panel = dev_get_drvdata(dev);
 
-	drm_panel_remove(&panel->base);
 	panel_simple_shutdown(dev);
 
 	pm_runtime_dont_use_autosuspend(dev);
@@ -6540,7 +6541,6 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	const struct panel_desc_dsi *desc;
 	struct panel_simple *panel;
-	int err;
 
 	panel = panel_simple_probe(&dsi->dev);
 	if (IS_ERR(panel))
@@ -6551,14 +6551,7 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->format = desc->format;
 	dsi->lanes = desc->lanes;
 
-	err = mipi_dsi_attach(dsi);
-	if (err) {
-		struct panel_simple *panel = mipi_dsi_get_drvdata(dsi);
-
-		drm_panel_remove(&panel->base);
-	}
-
-	return err;
+	return mipi_dsi_attach(dsi);
 }
 
 static void panel_simple_dsi_remove(struct mipi_dsi_device *dsi)
-- 
2.43.0

