Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889904078FE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169359; cv=pass; b=ApJ2mSqJ9ei14Z6CGMFDEgh8jgjMPBd0TTviySJyu3L2eZRgyYKbL2cjxZuwIhBJ0dZiCjE5JmASYU2/nicqvhPghQIAYwG0DV+s4JjWW+CbLVtvnbaMc00cLVBgLdhO5b8tKkBv13m5G/2ekG9K7cZloA/vHGNE2qk7MhTekkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169359; c=relaxed/simple;
	bh=MXDSZuGOlvNH11js9h2jqHaS2B66edvM5cQo30VukSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cgeLCgRylfdeuhJYmw05/BI+n+Fxb3wP4I44CC2NZYzhtRxk5BcE2s84X1Mx2wOZpdSnD5B9BCu/iaSVCyzo0W0iUZE61VXPd4gUqT8BkHFbE+5o8ICy4q3v1CLY/dMgtRrb2Y+Hxsm9lI/VAaPedx9PSjrMvlqW8LDHY+B2IYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=eAfLPvRO; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="eAfLPvRO"
ARC-Seal: i=1; a=rsa-sha256; t=1789169319; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gsEVOFbSm6XDK7bHY0FhBVs6uWvZ4/s3l2k6Zq2Dd4sdQjOkEEzNVkgEI6LcZx16othjeQ275//HpJf/OjH3p3Pgcj+zWhL7No4SY4XHSoDsLKIHxrXCo/T6NQ8GpLrO+Qa4w2weLAAcAlCHJwwLrHUnr5FBMOR6WgahUm+DvgI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789169319; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uE6tGIUw4nUFeMlGUIl2Vj3+Z0EEpcFNwJvK87yeLC8=; 
	b=FMsk6nEd2dtnSu59OjvzqK5Uz2vDFe9WRbPwu4dtf33scdt/xd+BLUqWCTSjW9gTnG9anCpQabKdZRKJuQeuustLOSQXPgBnZNz9mU3qVdvcxhY+pHdZPV1xpn/QT3lc8sSzFygPXhVWfHeCC0RCpnM5pShDZJ4mFc3l/DJ+6rc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789169319;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=uE6tGIUw4nUFeMlGUIl2Vj3+Z0EEpcFNwJvK87yeLC8=;
	b=eAfLPvROPVbT11raWyHLxBnETtBnIaNRpc3fGJKKEHXvSQzm3SOFUn8ilvLANL0F
	Ux3w9B5IQ1rql0KRn7DW/f8oztO1oe1XcuzbVEu65fBnTEUlrrD9a4oIDVA8duudmKQ
	655I4HPbDo9QRTmJT/2H1RMlWiOfhx+fMqAaBY2M=
Received: by mx.zohomail.com with SMTPS id 1789169319441502.8662276855623;
	Fri, 11 Sep 2026 16:28:39 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Sat, 12 Sep 2026 00:28:07 +0100
Subject: [PATCH v9 06/16] drm/panfrost: Fix PM refcnt and autosuspend
 issues at device probe/remove
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260912-claude-fixes-v9-6-e588feaa61ef@collabora.com>
References: <20260912-claude-fixes-v9-0-e588feaa61ef@collabora.com>
In-Reply-To: <20260912-claude-fixes-v9-0-e588feaa61ef@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3143;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=MXDSZuGOlvNH11js9h2jqHaS2B66edvM5cQo30VukSA=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqpI6DrsuXAm3fHOxc6CeIj2qTgSgV8HattgvZU
 5O8MUDC/vuJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaqSOgwAKCRAOJn5M7lND
 PWE/DACUd0IbtvNrI3CqT4P0XtoOvGzO5maApUbjs2mBVTIquJM1sqKB7U2iX1BWTrYQZAquDqj
 csrRjAXpE2rN6+uSOsnOdHYnVeGqm9vJykTsRAMykLCqPT7tGwCwd/UlhqMrn7ek5EHKEw3YmZ8
 sKgewaVIspwr47v+ogp/UYb4czN4KIvLmbmPi+zEC1e7I2JSGnTOa+tAK20FTyrY/wRGOkRPHPd
 9pnLYeacoScJwlpML+O89ixZBX7pDnv3QNhwaRlaxaR3HR66Mn/ZgluO86q4Jz57Kujan3bpd0m
 oBo7r9c06xfSlDXzuNIanetvODGnTDtXMJ9qiSzAqd4VhFTnHfE4cabYIsRgxIaZSXH8osqugj6
 82nS9q2vE2XjQQmdmYLfEDreywSIOJrXb7qtlV3Y9+eCDaEYRWz7z7uYsxWlIePhpbYd+rLNVHR
 Jk/Pn1zBi0ennYsE2P3JEu70ULsz2fd0VH2ob6CYQWA0QeeGPv3OTmqtdZbbPYfnzSI3c=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

During device probe(), failure to do a PM get() will leave the usage_count
set to 0, which is the value assigned at device creation time. That means
when the autosuspend delay expires, runtime suspend callback won't be
invoked, so the device will remain powered on forever.

On top of that, failure to call PM put() during device unplug means
Panfrost device's PM usage_count increases monotonically for every new
module reload.

The outcome of both of the above meant that:

- Devfreq OPP transition notifications would be printed all the time,
  even when no jobs are being submitted. This quickly fills the kernel
  ring buffer with junk.
- Because MMU interrupts are only enabled when the device is reset,
  the very first job targeting the tiler heap BO after device probe()
  would always time out, since the driver's PM runtime resume callback
  would not be invoked.

To fix the above:
- Manually adjust the PM refcnt at device probe and removal time.
- Ensure pm_runtime_dont_use_autosuspend is called in the wind-down path.
- Call pm_runtime_put_autosuspend() when device is ready to accept jobs
- Move pm_runtime_set_suspended() before panfrost_device_fini() so that
  resource unwinding happens in the opposite order as initialisation.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: 635430797d3f ("drm/panfrost: Rework runtime PM initialization")
Fixes: 876b15d2c88d ("drm/panfrost: Fix module unload")
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 55fc22e8d4d4..a3eff77add55 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -854,6 +854,7 @@ static int panfrost_probe(struct platform_device *pdev)
 
 	pm_runtime_set_active(pfdev->base.dev);
 	pm_runtime_mark_last_busy(pfdev->base.dev);
+	pm_runtime_get_noresume(pfdev->base.dev);
 	pm_runtime_enable(pfdev->base.dev);
 	pm_runtime_set_autosuspend_delay(pfdev->base.dev, 50); /* ~3 frames */
 	pm_runtime_use_autosuspend(pfdev->base.dev);
@@ -866,13 +867,16 @@ static int panfrost_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto err_out1;
 
+	pm_runtime_put_autosuspend(pfdev->base.dev);
 
 	return 0;
 
 err_out1:
+	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
 	pm_runtime_disable(pfdev->base.dev);
-	panfrost_device_fini(pfdev);
+	pm_runtime_put_noidle(pfdev->base.dev);
 	pm_runtime_set_suspended(pfdev->base.dev);
+	panfrost_device_fini(pfdev);
 err_out0:
 	return err;
 }
@@ -884,9 +888,11 @@ static void panfrost_remove(struct platform_device *pdev)
 	drm_dev_unregister(&pfdev->base);
 
 	pm_runtime_get_sync(pfdev->base.dev);
+	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
+	pm_runtime_put_noidle(pfdev->base.dev);
 	pm_runtime_disable(pfdev->base.dev);
-	panfrost_device_fini(pfdev);
 	pm_runtime_set_suspended(pfdev->base.dev);
+	panfrost_device_fini(pfdev);
 }
 
 static ssize_t profiling_show(struct device *dev,

-- 
2.55.0

