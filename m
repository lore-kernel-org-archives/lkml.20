Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4138D492E22
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816543; cv=pass; b=P8S2LmnNLaiKvbT7niJfMV9d/gubuGz1ci0G1jN610kGJtGG80DR7AcQcZ00+J8OB8oikhDfYIMXPhfdkevs7THjxyVwB2G0ivVLMcPGtlGplsTBQPFlAm54zBVuClX4jigg+G5jJ5onhDl8HNKxoCM+Q3yPvAHIPHLGnWH3ZnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816543; c=relaxed/simple;
	bh=XDO29kzmD6YpdMpCoNyZ7m2Kkf6MbMzqgCbhrHf5hV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lGBWvq9E6YFEDQvbvIQcqj8IkQy5JT2ZH1XWC8LXO1V8f4d7L6cjIlgNj/fTW2p1UnA/GlUUUuivqgvJlvx5A+Yr/EZk9QKgoNqn02OJYOFaFo8gsRAFhURYfbzzzXbXiDw1JqLgBtnNmrYhF1qnbjTxiIw8dkkQuq65H64kh5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=KhJ2YFeO; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="KhJ2YFeO"
ARC-Seal: i=1; a=rsa-sha256; t=1791816514; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n9tT/xP3GBwzoYVtmCjbUpzx2e1j9H3LaV9OoSI4ornrWUFJ43WJWlymrlydTSJzq2iaPFIsix32gSsnfWBQRhlB/nL5vGCs5zwfFjOEUYkyL7RLqKPEfuGqO9JXjhXVyPkWu9tQzyGgAtvS651/ZtvrgEQK+JjT5njQ9IGFglw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791816514; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5ORlithGDwGRtubPbfFKn86cSFTb0jIyXILzWjfTPiQ=; 
	b=ic4uhCU71sHL7vf9d2q4Y0s3v1V7r4ony3WgldM/UP2vr4nM41zzto+igD4yZHFkY7ijohnb3NmRPh3EKTcXqijZXffRA31JMnxIr3MNzmmpTVZSeIBCFwtBqIcnr7tyOIbY4rG2z6+cTSA6Dn4mt1qxFhhyzbAbj2mGTiLNkig=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791816514;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5ORlithGDwGRtubPbfFKn86cSFTb0jIyXILzWjfTPiQ=;
	b=KhJ2YFeOP+7s+DKbVw1xEP2pSz25EHV2+CHc2UUKD+YNHPHvyn+gIXm1JvPTvGkH
	LfnH3eT2p6LgVLcmhwwQKCu5mzqTBwDIUPsk0l2kcwToCCiqT1NwyEDNgYgjLQ/x27Z
	YDiO6sPynAttGT8zyxbSs92u3FTNCRl3NULUrI+4=
Received: by smtp.zohomail.com with SMTPS id 179181651395817.38406222340552;
	Mon, 12 Oct 2026 07:48:33 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Mon, 12 Oct 2026 15:47:58 +0100
Subject: [PATCH v15 06/15] drm/panfrost: Fix PM refcnt and autosuspend
 issues at device probe/remove
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261012-claude-fixes-v15-6-bc0a6c498553@collabora.com>
References: <20261012-claude-fixes-v15-0-bc0a6c498553@collabora.com>
In-Reply-To: <20261012-claude-fixes-v15-0-bc0a6c498553@collabora.com>
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
 bh=XDO29kzmD6YpdMpCoNyZ7m2Kkf6MbMzqgCbhrHf5hV4=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqzPMaxQS8DgAIJusTHYduLXOjDeKKpe1IXfrx+
 vVUpg97NCmJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaszzGgAKCRAOJn5M7lND
 PagzC/9vvvnEA3xyT3XC7hMkCLj9fP18wbfAZbTav1yMea4FlRjpHBghj1N0D5bUxXE/OTiE1a2
 YbdC9lcCAYr0O8/U2BNjlP6cAI6dqDo71/ag+6Musi5jXNzGgLfRRcVfwUcz17AlzKo35B3F31s
 KIQNsK/tQjSAAC4xhGkwyApVbNtnaAJAOzTHbApxWrZFWYLWwM+BtPymwvdVZuRCpjHj3F9sLTA
 swoW4YkiUi9hW3CWz3/beuzHu/WbPpdUK9op0NUgOZEts2L/21QmE2BhKNATd8GcoGOfEQ4Tfsy
 FBp//p+pF9o5T8k9Nabs97Nbem/9iIcSceLZ8d+yaRY+lP91MFVKvYZyi3KBkZFEoAqAeID57kT
 SqJClSySpY7SvHhGrtk/jY1I3Ch1wghUvv7KrtDPtN98Z50KEkP+45wAszT5VEchlWJeqAwS6if
 LiyadPwhVJ0dEixureibZ5chz3WSUF9gi4VzQ2H/tc3kbAl6pdfsltO77E/squwzceRxo=
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
index dd80ad1a6700..2519d76666a9 100644
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

