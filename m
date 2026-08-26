Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F87146EF77
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779185; cv=pass; b=cWnOlVbIuCFZs99zvcv0exqS4E45FWupmOTZMTPKq8FWAO1b/V94kufxToB25VgeA5leilCTP/phHcEqtButcpQWT7DcAH6bTDHbYHVNZD+hRiU6jWovome742YgtSzv7yl0j9isgsFtT8XrZJqA8YM59ZgPTVEJP6emcgz9KgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779185; c=relaxed/simple;
	bh=9g0PevlJlDQIIXDsSMP/w/bs87E0XqVP5o0qf2GqefE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qKmuf56jGS/CQoWgYZtA7s5767A9xKVtDOPqVTAU8+aOhLBcuPitrN6tJ79GxYLUzpm/g0y77sXK0862RGohF26IBPDVZo9OLwXB1pQCa0adsK8XRt8T+6Q8dp2voEN/4aw7Qtg/bMgQkoqpGvotDBbn6f9iqDRaxK/N/O5voUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=eAc1WXUf; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="eAc1WXUf"
ARC-Seal: i=1; a=rsa-sha256; t=1787779146; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ls88iONWCvv/l59Gc6ha0P/5jycPJvIdq1N3L25wAOf6nxlclTwlRZEIaYDiwVB8HILZV7MP+7UPx6gZ/lQVhQhggG8Zqlteuf8TMzQFOwjm06EcQO+Iawyd+wDdIqkuuyTdjsfZ7opvD/59qR0lgw+9iCv8/Yp5KidOmyzXz9E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787779146; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AAZ7JQpLd2lDnE7EcsIep4b2GV06D9n3UKj+mh8FGus=; 
	b=Qg0RU9bEFAe5nPY5JtkCtdEwWY9UrZlalNhsxZ+ba8geE8thN0ohAlwex+f0D3VhCvM0mYrAWAn4WdtXE1JYKgvBAdqUmwFmXmWVAIlX6RCu5STpH6xT5RFKYchg+jhjZ9KVB3zw7RDm5iGdoHkmOgve1qhCErrZXFed5jeEUeM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787779146;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=AAZ7JQpLd2lDnE7EcsIep4b2GV06D9n3UKj+mh8FGus=;
	b=eAc1WXUfYibh/MZLt2j+GW2QVz15Dz1gp9HoMXbZtOfHQa6rj0G4w9WDwk+DcXY3
	IRmRSxcXx4h2K+p/dmGACBJiLmK+EdDgo8l7xqJ/FVez180aXs8SppKaWJZSFh/7Yl8
	0X8zmArZSSIJ+oQXffGPMnlnwuEJdUQAQsKduN1s=
Received: by mx.zohomail.com with SMTPS id 1787779143780460.0763454317258;
	Wed, 26 Aug 2026 14:19:03 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Wed, 26 Aug 2026 22:18:10 +0100
Subject: [PATCH v6 08/16] drm/panfrost: Fix PM refcnt and autosuspend
 issues at device probe/remove
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-claude-fixes-v6-8-78119af409e7@collabora.com>
References: <20260826-claude-fixes-v6-0-78119af409e7@collabora.com>
In-Reply-To: <20260826-claude-fixes-v6-0-78119af409e7@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=9g0PevlJlDQIIXDsSMP/w/bs87E0XqVP5o0qf2GqefE=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqj1gMqZCJDxPNuPbNsas3fygpeMATh4qj0yV3j
 A7cFgh+JfeJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCao9YDAAKCRAOJn5M7lND
 PVgbC/9AhrH7HVilXJZVgp0TDOMhyRRaF/3nJRh8WQzkEe9Q8fIXDEsMODn+UyogKs+fcyPdZEA
 Jwp1YA51RpKNGN9AmvvernGbYzO97sxipFT3MjVWVVYIoAjstxAdiMktNOGKMkecU8bg8B2NQDK
 j2pzLizCyYxYgk5VbZX2w2zvBvbkdsFy5RGZjGV/os15gvff8E6+hJacl8A1C89XrLtNZfwbbmw
 Fxo3UmlFA2ULvDaYXsZvqvIhaycxBipz7yPWz7wsoUwTVFFSzvhPXwcJIM6bItm719lsgUCdZas
 FPpB+ojVr+faFCxQMGoFlym8ummqgnywT1LOYhpzZrYA1XVaMU1ZIDsIkB7UZwmFpyTD3KK21wf
 Vci+4OgsdlQAQ50PkIAj3Sbz0ZR6Tu9K8dv0bB5pv4BozXE2x49FKhmg7gn08ecMsf2andJTqn8
 jAPfJR58M8EDNTFTOQytp0IOG2OrTmp1MiqnXdp9hitfNG5qu+Kmx5+sOwnUuqzpt9tSo=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

During device probe(), failure to do a PM get() will leave the usage_count
set to 0, which is the value assigned at device creation time. That means
when the autosuspend delay expires, runtime suspend callback won't be
invoked, so the device will remain powered on forever.

On top of that, failure to call PM put() during device unplug means
Panfrost device's PM usage_count increases monotonically for every new
module reload.

The combined outcome of both of the above was that devfreq OPP transition
notifications would be printed all the time, even when no jobs are being
submitted. This quickly fills the kernel ring buffer with junk.

To fix the above:
- Manually adjust the PM refcnt at device probe and removal time.
- Ensure pm_runtime_dont_use_autosuspend is called in the wind-down path.
- Call pm_runtime_put_autosuspend() when device is ready to accept jobs

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: 635430797d3f ("drm/panfrost: Rework runtime PM initialization")
Fixes: 876b15d2c88d ("drm/panfrost: Fix module unload")
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 0cc277efb585..f6066aef4766 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -323,6 +323,7 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	pm_runtime_set_active(pfdev->base.dev);
 	pm_runtime_mark_last_busy(pfdev->base.dev);
 	pm_runtime_enable(pfdev->base.dev);
+	pm_runtime_get_noresume(pfdev->base.dev);
 	pm_runtime_set_autosuspend_delay(pfdev->base.dev, 50); /* ~3 frames */
 	pm_runtime_use_autosuspend(pfdev->base.dev);
 
@@ -334,9 +335,13 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	if (err < 0)
 		goto out_devreg;
 
+	pm_runtime_put_autosuspend(pfdev->base.dev);
+
 	return 0;
 
 out_devreg:
+	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
+	pm_runtime_put_noidle(pfdev->base.dev);
 	pm_runtime_disable(pfdev->base.dev);
 	panfrost_device_disable_hw(pfdev);
 	panfrost_gem_fini(pfdev);
@@ -363,6 +368,8 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 void panfrost_device_fini(struct panfrost_device *pfdev)
 {
 	pm_runtime_get_sync(pfdev->base.dev);
+	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
+	pm_runtime_put_noidle(pfdev->base.dev);
 	pm_runtime_disable(pfdev->base.dev);
 
 	panfrost_device_disable_hw(pfdev);

-- 
2.55.0

