Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904F54DBD62
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549299; cv=pass; b=E60kuWJRODEELMnJKLPIpo7AUhM19kPWrFIJ+fuvK7jRv7HJ2Jg39ixJSX5osIkJpS9cD9N1ZWsMHyR1Oq7NVJHZrvfdvxtl6ZAdioTTyffJ6Vwk674ixr+mcy187TDi8/KlWksxm44IjnYfHtXm8XtGEw3fnqRB36k2uE98hQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549299; c=relaxed/simple;
	bh=MgQU7lMS2WAb5Ch6cX5C4BiP331aC+PQI0ybLAQDAMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bZJbZ1YVny45jv/5xniGG0XoWBqbhNRpRNafmjCljIWIWdMNdvuqZQqQsZGKK1OfkSpN8EghCCvuPsTm7n1YnqiSO1pf0Yk1nSUfuLxjjAeYW33sT+LQ+FdDuVl4IXJM6GV80uSMgi9784ZVRs1+uVKohkkQppIffoD3vjq4y/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=WCaPm5+2; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="WCaPm5+2"
ARC-Seal: i=1; a=rsa-sha256; t=1791549273; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TfYbibH1l5GDT8o2xXuISwqUNVNrhsKbX77utQt1X6b/GMKpwFrlJy1Stgz4W/u5zLKgqWx1+YR6eLRt2RMqfl8z612la8FZhe/8MCSIfpaleHejt6CnHmkMqKpv+AHnrgh/nXn6AI2VZZcZPKa3E0n8tckcMPPidN0pIk9oF/g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791549273; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nb+gozpCwo3skDCgcKzF9ZLhmlF1UHjTTny0uZRVa60=; 
	b=aspgS6mvikSmJHdxYiCZhpd6KxvPOht2BdfQRQ8+hJA+usmMbMbFxAr5hhc+9ehTtx5g+Yfxswn8HRaXqqfsoQ1ovu2zjkRzZECeUI/KdEd6Rxue6dtAkmbO323idg1BwVCPB47g4PQw8Z/9aOt79uGQRJuf/57LVaQUksDg7r0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791549273;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=nb+gozpCwo3skDCgcKzF9ZLhmlF1UHjTTny0uZRVa60=;
	b=WCaPm5+2mTugR+X33eLkw2f7tnMcwbWYHcu0tbFvP4XvY18TbFNCENN80tXvCM7+
	7ZkctQTAOBlCL+XNvEU2JfPJWXzPBgFPBEjmHk71W9tlo3lDZ5jNCAbnqwuJ/3YqrY+
	Vq26rvRPKJfEb0t4sFzLpzsfGLMFGxR1WtdWBhAQ=
Received: by smtp.zohomail.com with SMTPS id 1791549272459214.2536372666118;
	Fri, 9 Oct 2026 05:34:32 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Fri, 09 Oct 2026 13:33:53 +0100
Subject: [PATCH v14 06/15] drm/panfrost: Fix PM refcnt and autosuspend
 issues at device probe/remove
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261009-claude-fixes-v14-6-cb743b3b973b@collabora.com>
References: <20261009-claude-fixes-v14-0-cb743b3b973b@collabora.com>
In-Reply-To: <20261009-claude-fixes-v14-0-cb743b3b973b@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=MgQU7lMS2WAb5Ch6cX5C4BiP331aC+PQI0ybLAQDAMI=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqyN8uKGaAjEQ9BvvTC+bvKOCx9B3seZrLGwlMx
 o44QdtWbW6JAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCasjfLgAKCRAOJn5M7lND
 PXBLC/9aj95LFW/EMtqiDM8pyKeB/bjihOkdx+zqpl+i0j1bn9nhy85mh0Tz1XD3PX5Ie/tPK+C
 oshlqfVohQ964JnZaGph0O6eZY+/eOJ67KMi2HM9wUNjOVW6bJE6sohou/bPvkvg9kjwWew2InS
 acjjjU3rcYGMqFvzDO7/feBOFoWlqlIOBowc073L8Lmdw+673vfKgAYLvTHWexoer0I/SY7nPYt
 V2MDuS9its+bgzKSp67wQLDytQc7c2cRbXr0cVGz852PPmpeA0TlXCKi/rG/gyNthGcZToXAxyb
 oL6mPg6+m8nfwBEdsmsZ+CVdKyw++6j1M8QlRXMzPeeXWOmXZLCyNxr5nfL28CmyZRgupNEEhWU
 NUHhhSzk6XG9cdUKSKl1tv4We3CqGxq/RpMSRlnqfGMGTFYyQDb2WLUJ569c57WPuOGfk3W/ipp
 JpsnPxcu/8uD3Glh0fQGGO2UKEnxpwqjs1H9qKcqCvxsb39YIr7bdvoCbnHqojKDR22t8=
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

Fixes: 635430797d3f ("drm/panfrost: Rework runtime PM initialization")
Fixes: 876b15d2c88d ("drm/panfrost: Fix module unload")
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 55fc22e8d4d4..907d4a14a0b5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -852,6 +852,11 @@ static int panfrost_probe(struct platform_device *pdev)
 		goto err_out0;
 	}
 
+	/* The reason we must manually set the PM status and usage counter is
+	 * we have just powered the device up but did not go through the PM
+	 * runtime resume callback, so we need to update these ourselves.
+	 */
+	pm_runtime_get_noresume(pfdev->base.dev);
 	pm_runtime_set_active(pfdev->base.dev);
 	pm_runtime_mark_last_busy(pfdev->base.dev);
 	pm_runtime_enable(pfdev->base.dev);
@@ -866,13 +871,16 @@ static int panfrost_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto err_out1;
 
+	pm_runtime_put_autosuspend(pfdev->base.dev);
 
 	return 0;
 
 err_out1:
+	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
 	pm_runtime_disable(pfdev->base.dev);
 	panfrost_device_fini(pfdev);
 	pm_runtime_set_suspended(pfdev->base.dev);
+	pm_runtime_put_noidle(pfdev->base.dev);
 err_out0:
 	return err;
 }
@@ -884,9 +892,12 @@ static void panfrost_remove(struct platform_device *pdev)
 	drm_dev_unregister(&pfdev->base);
 
 	pm_runtime_get_sync(pfdev->base.dev);
+	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
 	pm_runtime_disable(pfdev->base.dev);
 	panfrost_device_fini(pfdev);
 	pm_runtime_set_suspended(pfdev->base.dev);
+	pm_runtime_put_noidle(pfdev->base.dev);
+
 }
 
 static ssize_t profiling_show(struct device *dev,

-- 
2.55.0

