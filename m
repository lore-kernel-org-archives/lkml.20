Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CD338F929
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361993; cv=pass; b=PFrspWgiMef6DQrz6J1GvN2NCUvt2YzSP9O+QEf/8etwYUSpkQEhg6LlUmh3soJqmR1HCl0r2Hcmf0Vyy6WSgiSJlX6Q9hpfAsu1brnJegkOQ+u+x3rvGGyP9bJzVvAzP8h5Rk+5CVLFY2i9428skVVqmLKy+miuDh/V95LUyK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361993; c=relaxed/simple;
	bh=niN+/XIX7dDnDnAVSuMKRHA1sgOsYfO3hFh083wdlsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WBYyvgoDz6+I28rBc7rQWkXV9OypYJE0hEpjuKCEGMRUI820Uu1fKoZmuXzIEQjqUWUW9M7HaxzxA5Hcl01Nh2tAvHBOTzfnwPJXWvc8FT1x7RZU10qtW/AMZaXZHkHE4l6B6ccGmazQ6fqXkP7dnK+Ws4kiQS8dUDvPPXO83k8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Wo/4XC9K; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Wo/4XC9K"
ARC-Seal: i=1; a=rsa-sha256; t=1790361964; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Nq1d43yblW1oyvObTVO5ne6TU/1Be8t5U5NfQYojnitiSnwBeVSV4TlFkmSiNcdYMpF/zjvFkESljZad2A2Mi29eQr3WQHS9arTkNdhJiIazuJa0N1NndJ0LbPgExSQXQFfCfR/ZN4IdyEOTOlaIixMNeb1cYLWmDWXhlEKzQpY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790361964; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aFZgfmzHTzH2Ywb71oGheLaCKdbFGdE05Fp9AZPDukc=; 
	b=aCo1Nd+JEQ7ypwbTeHFbezY82idjFG1h1Ulwc2XFqMK54qK/b05SP+Bv6xDkjML6zktJORc6uJIbkPsONzw6jGvxNjXZ7klxyWgtwZl50VK0D5o+RvNCYmpE0YfkEUupS6HhRI3UITDiksClvZ3OKIjYtAvncTYoSJhoktGxLJQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790361964;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=aFZgfmzHTzH2Ywb71oGheLaCKdbFGdE05Fp9AZPDukc=;
	b=Wo/4XC9KYbdyU1PNZEcVL6wl2Q+k3l3X8iN4q7r38z+U/UQhNPF9EKdI4NP/sh/0
	nzX0S7/UMD3dTy152LNlj9eccN6xmUy4WMr1tZPTYpRgxAOXV3RPyteHOS8hz6Sm87i
	PG2VV28CuFBVSz/ae9HXnkaaSU7WQ0IYKrSqNCRw=
Received: by smtp.zohomail.com with SMTPS id 1790361963265184.31245811163728;
	Fri, 25 Sep 2026 11:46:03 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Fri, 25 Sep 2026 19:45:27 +0100
Subject: [PATCH v11 06/15] drm/panfrost: Fix PM refcnt and autosuspend
 issues at device probe/remove
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260925-claude-fixes-v11-6-0dbf5a58e7ce@collabora.com>
References: <20260925-claude-fixes-v11-0-0dbf5a58e7ce@collabora.com>
In-Reply-To: <20260925-claude-fixes-v11-0-0dbf5a58e7ce@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3191;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=niN+/XIX7dDnDnAVSuMKRHA1sgOsYfO3hFh083wdlsw=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqtsFDqrXUtA5zGh5gefUkYn7Z2NOmlW9wgHjmW
 xKBZJThfaOJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCarbBQwAKCRAOJn5M7lND
 PUDIC/0TitsJ5O3nmcQc469dmMzp1HqgWwYbwRySvBk0h9/aOtfLrg/jL5LKz+DBOK+Vs715Sis
 +WbZ9DjpCfWys+jWNs9qOsF2Mksq8WMW0w3EyU4cOgyzHx99z9Mp1ufRgyOlyUS/rKsanmtageY
 AbPNh4gIXVsqSYqJIImxm34nxU83WcrsPtIYL4hWY02Gwqq5BmzxhBHF4fd/UhBjzl+GE3bPLM9
 R0uNupeDlYCuZQBbxQUscAx0xs4MFDcIha3pYsL6gsuTOA9Yg0N1u/TZeh5Ji+PhT25L/gIta+9
 ZGlnMwrU33YvbU1o+vvJjANmz/uCBEi4c6yeEvaDuhkzy6z8uzkYcsQeistklzvqmz27z2ThKL1
 fTQjNtXOoasyKP/MAkyP6bc733j4I49t/SP6PxiKubtx7swJJrHs0PFe5OnBab0A4Svnh78DZP4
 Ys6qk5xsbVPHCeITKUWp5zd9Ep5kyEkKtLKM07D713VBvHOAfmnTiT5BPMqnky9K7KzoY=
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

