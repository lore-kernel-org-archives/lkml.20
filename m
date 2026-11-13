Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794560576;
	b=d6BaQrBuxiEfdAUSPDcKDiBw353TXl6zDTJyvQMCajOiW2q5MncenMEPR3lm6YfYawLm
	 RAnVo41TrTCXobHJQ23V3cGZl0ExEnGHXRr21Cohq9gWla8cdO4kbmu8h+10aiUmDs5DP
	 QyxpG2xw9rvgboCMH8/phi1/m+VQRn0dvyICSYmgINXDlnaWo1go/1Ci66JqS7mkfI1cY
	 Ep/3vyPBquu64pKSzBoPN3tAk+5LyVWj+R3qC+qlzFv6dflHzYa0DOddgZiwN4zaTk1pP
	 CJ+k0obGsFSxfmyglGnYrx8XjgT0ZsiOoFdR8BMaEEjIs9Z72p/FFPp/6BBBulPfRnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560576;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NBhfnuYwoGU6TzPmx5fZy8zR3MnIkuc6xlosTA0UUeQ=;
	b=OZhwxSAy9KUM01K1z1U0EiC9mHJO+JnWvsIu6RoGy1EFMCRB5ovQlpIv38Ij6PUbLtlV
	 IZ4Btq+QjwDdxqwhBBKBVK0plge++0txRaL/Sr99RgMvChuELMAIRc8LfCtun3AKLJnCw
	 eC+0h/TnMs1J89hMvqplOeGtrcHBUEHc06g1SWWC5jhDT/xrpJplgQ0uSh4BJp+mIQy77
	 oz4jCCAPSfb2gkXE2ywZLjBw/zfYpTnNlPq+MCNxfy6UH1YjzMWDBRq7liu//ZYo+770C
	 qPyLx8yj6tdtjmI1QDoSZNGm7M8Yy8iglamZwBwgGkiuE5aaBam6yCa84OYvgi3UHYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EobNh7yf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2636606A8B2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EobNh7yf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794560575;
	b=xjHzMo5Sfy0iZE0RbHL+wNPqwLtiazHCkQID78c02KR4ZPYEx6rsz0EUPuG1XzeqPpDv
	 ILFOJ8S4u8R1DCz2IJBTbtEJ2OvYEWcIX/7R0/PTb7MkAMeisVj/V6rMfEqXFC41Ualcw
	 Hx6vItl9ikvcB9wiBd+BYL/Jf8qn+f7tEaPN5AZOW0ieFXsMGVnLKL0K6f1jsTSa4AmAk
	 MC21GfAQJNBCqTctS3T/6NZdxayYLX6EwUcI6qiks1F+MU48Vy2/3tgCEnotB/807im9G
	 YKsw1+XkIbcYqdErIzYo3r/1g7DIIFf4fkTEjWsmPFrAkRcTwgafpsllzdAJ4sgGK4Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794560575;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NBhfnuYwoGU6TzPmx5fZy8zR3MnIkuc6xlosTA0UUeQ=;
	b=TfLp+c9dVYURJbjpczcE2dtB76MO6gk/uNCxwIcaAu7/iQ/6bK6LEOE1TgZBA6uP1QYV
	 tOMbZo8/ekMAu9uoW4KJBvGskU7gzBV4kabq5keKVVMxWgW/Ki2W0FeUTSTGAGTHH7UZB
	 1xJKeDiEVTmDiQUJP9HIoKxaJP8Jj8416vicBznemAC0YnPp2DB7TKui1zohV88a+FPV5
	 /Mya5xDnUdRWRsj9/CZvCcJw5JcHM+0q+890KWNGwZIC4eDkyBocUHOghCimnASWe4g5A
	 XOrEX0KS9+dGDO8yy3KqmD+vCf1FI8WiAvsSPP4GRlGiewbJBb3D+ALTKARWS3P1FfA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66DB81F000C5;
	Fri, 13 Nov 2026 09:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794560575;
	bh=NBhfnuYwoGU6TzPmx5fZy8zR3MnIkuc6xlosTA0UUeQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EobNh7yfwVmZENOfbrQEQ8mpRkvQe2GYaXCvRWfVRmCn+zAR7Qzj4ljRAHJnEz2nJ
	 KLINv3KJ8qbdr6YqUrAdnGqFvs6peTG1+5y5TLu3H/rKwQc4Z9AIgiQ/jEotAtJxts
	 H9JK6DpeS/T/4fieNbw3Ur+TYwvhy4XF6yVzuXXuVBj21rTsagCi53KMYrHJ+j1VOr
	 9UiEq8wAM4Xsu8wS+0VUsYI7BambDsX4005Y4297QEO/xL1TiDSAsqpKa+4jUie6XQ
	 xYGpbJtmrz24wlUqoV78/fFw6XPq5yHpjZouXS2uBEfbsQs1Lb6j5RxzN8l5qkYpkz
	 AqNG2VaC6y8Cg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D5710476D9;
	Fri, 13 Nov 2026 09:02:53 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 09:02:53 +0000
Subject: [PATCH v3 01/14] drm/panfrost: Power the GPU up for a reset queued
 from the MMU code
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-panfrost-long-jobs-v3-1-80ae78d38f6e@gmail.com>
References: <20261113-panfrost-long-jobs-v3-0-80ae78d38f6e@gmail.com>
In-Reply-To: <20261113-panfrost-long-jobs-v3-0-80ae78d38f6e@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794560572; l=3976;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=BH2Iap6Du+xzEbuzT73XcwV5IKrRxeZY/aiArdm7A40=;
 b=XCIY3gcj+fK+XvOK25+9FKZ3Q4s+XSdMKjzm+h5v5SwKNn2XttAhQvEjlD+C0r6vZNUvXGzQG
 q2z5gJytxgtCeTy+1NGCzCLjuuBW6beJJmPtbKuMQ0xwVdF52DnXghm
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

panfrost_reset_work() calls panfrost_reset() without a runtime PM
reference. wait_ready() queues it when AS_ACTIVE is stuck, from MMU
operations whose callers drop their PM reference right after, and it
shares the ordered reset workqueue with the scheduler timeout handlers,
so it can run late. If the GPU was runtime suspended in between,
panfrost_reset() writes the registers of a powered-off GPU: a
synchronous external abort on arm64.

Take a runtime PM reference in the work. pm_runtime_force_suspend()
ignores the usage count, so also disable the work across system sleep
and queue it again on resume if a reset is still pending. If the GPU
cannot be resumed, no job is running on it and
panfrost_device_runtime_resume() resets it later, so just clear the
pending flag. Skipping the reset on a suspended GPU instead would leave
jobs that a concurrent resume queued behind the pending flag waiting.

Found by code review (Sashiko). Not reproduced.

Fixes: f9ab9c66f080 ("drm/panfrost: Reset the GPU when the AS_ACTIVE bit is stuck")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-206548@kernel.org/
Closes: https://lore.kernel.org/all/sashiko-outbox-210830@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 26 ++++++++++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_job.c    | 11 +++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 40eda3612..2c11a6721 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -567,7 +567,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int panfrost_device_resume(struct device *dev)
+static int panfrost_device_power_up(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 	int ret;
@@ -604,14 +604,36 @@ static int panfrost_device_resume(struct device *dev)
 	return ret;
 }
 
+static void panfrost_device_enable_reset(struct panfrost_device *pfdev)
+{
+	enable_work(&pfdev->reset.work);
+	if (atomic_read(&pfdev->reset.pending))
+		queue_work(pfdev->reset.wq, &pfdev->reset.work);
+}
+
+static int panfrost_device_resume(struct device *dev)
+{
+	int ret = panfrost_device_power_up(dev);
+
+	panfrost_device_enable_reset(dev_get_drvdata(dev));
+	return ret;
+}
+
 static int panfrost_device_suspend(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 	int ret;
 
+	/* pm_runtime_force_suspend() ignores the reset work's runtime PM
+	 * reference: keep the work off the GPU until resume.
+	 */
+	disable_work_sync(&pfdev->reset.work);
+
 	ret = pm_runtime_force_suspend(dev);
-	if (ret)
+	if (ret) {
+		panfrost_device_enable_reset(pfdev);
 		return ret;
+	}
 
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
 		panfrost_clks_disable(pfdev, false);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 3a46dd61c..7319511db 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -810,7 +810,18 @@ static void panfrost_reset_work(struct work_struct *work)
 	struct panfrost_device *pfdev;
 
 	pfdev = container_of(work, struct panfrost_device, reset.work);
+
+	/* The GPU may have been runtime suspended since the work was queued.
+	 * If it cannot be resumed, no job is on it, and
+	 * panfrost_device_runtime_resume() resets it later.
+	 */
+	if (pm_runtime_resume_and_get(pfdev->base.dev)) {
+		atomic_set(&pfdev->reset.pending, 0);
+		return;
+	}
+
 	panfrost_reset(pfdev, NULL);
+	pm_runtime_put_autosuspend(pfdev->base.dev);
 }
 
 static const struct drm_sched_backend_ops panfrost_sched_ops = {

-- 
2.55.0


