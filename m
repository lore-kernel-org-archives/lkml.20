Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEA43AE1BC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545068; cv=none; b=SaL6jKijkNd2D0pNhIoXc3Kzy1f2PkFK3hBGMTSIIH0h2Nkx5JtCnBgCdqEo49/GtUGtKq2MqDqfQQFjWH81Kq3vd4wgHJ0salwGrnA9fmcrJORbaWLirwLA2V9cBTPskHMW9W4eOFQjLVb3zawGPhrWZ4uiO1sHDcukLnepUAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545068; c=relaxed/simple;
	bh=4eH5Fym6C4VSyFe++/pCvPvmqmWpuC4bBghErnGUi14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ufkFdMmpg/i0vWfr5rF9gfdQ8/lugsgFNEMgPF4Wy2YH07+Gd/4l4v92APbdUI4jCf+EzWNk4RWz1r5vUKqnEMSN8Htx461+NUYI9aZ8gIF/UsL1DpOf28pfFmfbXuIEaRcawob+hHBdLR8msjpBxntW0nAnCNFBf6EyBvWG04M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W51bNS5p; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W51bNS5p"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f70553dso106771966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789545056; x=1790149856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j8D6JnnoF4uT9GFk7g9DjQ1aSimSgKnpfAaaRW4jURk=;
        b=W51bNS5puyz4Nlom+EKiUpR6uVQBcUvj9f3i59bY1ZdC6cBG4POEWSHIVqBT5VQMaE
         Ctd2WrQMF5M0oq7J5TPQqc5wTp2oXaCd+Utnc1z2HlXpBD6qJJd45W6/BEetOuMXmYKm
         AFw+On0iT6S9A3n4MjzV5RORUgh43sksymK3dDKuIkWErDkZs1AfIIJM/M2U//1hZ327
         3XE1z9qgPEtYNSZkcGuKeTqaWV4DzbpT8YAKtUL15rUnMxL9YlA/paHRYynUCTUAJ7Zz
         bQmiimI1OjhkpvSAN2fVIb58NlTzQF5Ac66HtZPL5KZ+KY3cGS5nhR5rgegrnDLkVN8/
         P3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545056; x=1790149856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8D6JnnoF4uT9GFk7g9DjQ1aSimSgKnpfAaaRW4jURk=;
        b=2BGkat9/c7X02MfkW4DL0YG/qFS3EX9kTcY9P0Mc+6JwZA8nvuBYX1A4LXUJcN+x5c
         fRJovIEuNW4F29ljV1fbHalYkjyLukqRcy+4QwR9mxi5Jjw4w6bNlOuXeej86991dLsu
         lkoibUIr0PkZd/QRBBkXebaKTfxBqcquNmR5rqhWcvOQCSfBzTaIqDnD6CDMTuYXMkto
         zEGxm0V4oRgZx3pcOIE6SnjaGwAk3Rlz2F3hqicDtw6m/XGcJn0Fbjk8sabM53l6BAiw
         FA8JU60o5+cgaQueKTM2ZyxGlwthXStEE+lHsI2MPyFMAgXllGctvvnMFU2Z4+cD4O8q
         FRZQ==
X-Forwarded-Encrypted: i=1; AKwUvByvT6NyHsFLgzitr1W+50y6ehS8G9wHQUks45by4He17JggJm0YlDMtakPg6of0GvXwi8/D56mO2QLDsNA=@vger.kernel.org
X-Gm-Message-State: AFuF++nygHrGWJAmmPaLTkv0gZwfKFK+BL1J0bHzrik5eMC6RP5zYAx6
	o8jDuZfyysKclIDd/d3MHtzeqyPtoosCuGqRZpjPPb6RHICC0PJbRLOi
X-Gm-Gg: AYBFou2b1zzTPqAUq6PPrJHCDupRBJ7kBWFmX+n1oQ+we32lHc2gO4wlz++9KPOUg1o
	hbm/xgnRh8YRYScb9Be+Rxu2/FvLGlj1feCGnz1tOA07DVAge9JHCS+ufCJKQ5zAU9h4T46v2Ih
	4vL5Sa3V/KG15S8yc+aG4y1kehh6qwLQF/okgqHCpuYYfFMCT2YPKtDGayQ6QY0n2UFM2QvTOQ7
	RgoQbiaBRYBGvgvbE3eLKk1kCFmRYcuDdcV+ljyk8b/2rL58vs9iU6clAwdxiDYkI4sQR27rc5V
	ZJBOB5SbBwm4gtUgwtN+uC/YK66DRehEcKQrOcthoBHhnlisBoSwwedzvIBmf5nzjkvvY8v/fwI
	X5WEcFkfhOzYb7dCTKZE4bNBD8lvTGhj7FMg2bhN4AAkhuiJD+daIaQvAvwcUBs9pD7tySqYd34
	eJSRKnvaBSUiT4Ure+Tu8YDGcO6ozGC+Y2Tncqm7wMymsHA2/P91UkPk1AUmPw8lXUaHUpBMeK0
	q1wEARqvpKAoKYlUhk5Qxnwd0PGj58Omznbt2SlTDm26CPTmfhu4kSubYgRqdiPcN0mGA/hsonV
	U+/6il1d+2wLnGgvGCyMa3htMu6F+O6eCbiiJdzanwdWPyA63SOsT7Cm8TSMBY9jcBHm2rDWxr+
	+PfOsx0unruTX0ezkuQVFejgVGOjheKUPD2BOMOoAJHYAktobLk8UE6eBZPEf+6YPydphXMzvuz
	GSPxmcGz4izgf3xT4/fFgRrmJb12jUPOQ5yndNCzOOZOLsUc7UZwCYjFgNv5EMELLWAxtkVy/it
	6clfO6v2jalhFnQ
X-Received: by 2002:a17:907:940a:b0:c29:4415:2ebb with SMTP id a640c23a62f3a-c29e51e2170mr112244966b.8.1789545055876;
        Wed, 16 Sep 2026 00:50:55 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.oa7bb030819b2a894-tp.internal (219.145.32.34.bc.googleusercontent.com. [34.32.145.219])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de652313sm76139466b.55.2026.09.16.00.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:50:55 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Boris Breyillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dave Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/panfrost: add missing pm_runtime_dont_use_autosuspend() calls
Date: Wed, 16 Sep 2026 07:50:51 +0000
Message-ID: <20260916075051.1353-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

panfrost_remove() and panfrost_probe() disable PM runtime on teardown or
failure but don't call the pm_runtime_dont_use_autosuspend() function,
causing potential resource leaks.

Add the missing function calls.

Found using Coccinelle.

Fixes: 5c0c825ae4c6 ("drm/panfrost: Replace DRM driver allocation method with newer one")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 36cc2e67a308..74e8e5783f9b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -1012,6 +1012,7 @@ static int panfrost_probe(struct platform_device *pdev)
 err_out2:
 	drm_dev_unregister(&pfdev->base);
 err_out1:
+	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
 	pm_runtime_disable(pfdev->base.dev);
 	panfrost_device_fini(pfdev);
 	pm_runtime_set_suspended(pfdev->base.dev);
@@ -1027,6 +1028,7 @@ static void panfrost_remove(struct platform_device *pdev)
 	panfrost_gem_shrinker_cleanup(&pfdev->base);
 
 	pm_runtime_get_sync(pfdev->base.dev);
+	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
 	pm_runtime_disable(pfdev->base.dev);
 	panfrost_device_fini(pfdev);
 	pm_runtime_set_suspended(pfdev->base.dev);
-- 
2.47.3

