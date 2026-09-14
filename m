Received: from mail-oo2-f4.google.com (mail-oo2-f4.google.com [74.125.231.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E5A311968
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789351812; cv=none; b=SiCQgCLY0zTbeiw8ZcM8+EU8LpjR6uwpKt5/5a6YmtNiUbxkknU0uY3h7GDyi2STWAZ3hpUtCED8+PM33yLqmiHgjT0/NEhoJzq6f1CldpE89pGQuTvAYn/UaNNk/n/aXFwGu4NbjXDuF+Q/SZqQb81ENRpmvJg2xm5HqGOluL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789351812; c=relaxed/simple;
	bh=B0FAHrSWVXGHaqZILibkK+o++O0wPS8q+cwkcADrHJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E0t6/qNjnmy0dKfZ7uk0YHP+Rd91WpVuXJTVt4+bR+wPIAYr5PFfxkRQMS9v521B79Ss4vxw58tAPNHK9xc06pID/1WCgLPrds1iJu9h7TX1d8klxZUVVgg1sUUASubvjV0wgJ9s1NNCW52KyqqBfHn8daHOsJ12OUc/We82jYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMhYpaHD; arc=none smtp.client-ip=74.125.231.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMhYpaHD"
Received: by mail-oo2-f4.google.com with SMTP id 46e09a7af769-7f4e9ec63a7so729486a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789351809; x=1789956609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXWWEPWR1eTf24c4piCmTsBKFKIOYSQEhaTgS6fa4xg=;
        b=jMhYpaHD25glrbNFCZY7N3myS5Va4Yy1yKfh8kwtcxHm8npygF+60cH/NArCGfy+bX
         7E/uk5TmNSjnrhrtvry/lRMIYLiLQpsgnOPGMrOqixKzBHy/mTY3a/w9/wVWZoCErj33
         /Tum4wE7vsktKOXNciKT4BzGScbFKDUssqr6jPtP+GmXUbVtxYHHxgzFzF0oIFOqiFRa
         6FegTJ5MhNLSZ6YlJzxfUpHxTDWRjFdtUbWLmIugJHnN9JB+EXHJbNGcWcE8MuksL3bC
         3x4LLuv/Og9OrXhl5LCFktkue7ni0TuobRSyHNjFGVwJdKvnTJDbSgrxgkeh7nEp7D5y
         OOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789351809; x=1789956609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXWWEPWR1eTf24c4piCmTsBKFKIOYSQEhaTgS6fa4xg=;
        b=ZsCPv8e2MXTIEhNX2LdAt2fvFwA1+miHzinLEJxmWiQ6lKxuNlfq93c/xCavCkgTdU
         KsQmD720TXQRmaktV8iJYPLcqpno5OPH0ouQUHMOGI/ODsDNGOsmB4n+fJ5oYjIc9oyz
         qCSmU1TUgWzdOp2p31dzrzE9SfKqT5BG9nhBwP0zOPu7czeDqmk/yLgh7r6DgEatTgI8
         GhTBnzzljOFFRWL/CQp+gXain+EXguj/gwS8+PjPQP7LHwb8IryqJrtgwlbZ1D11LnZV
         q/t8XlbBjAU11mbaoEKCBZB4BiplMa1cve29dD6HwG4WbGUJqUSUKDSIZYbGT+udAeRT
         yo7w==
X-Forwarded-Encrypted: i=1; AKwUvBxA5EfiDLOUJHxHMbFDomDk+ZgjDhb2AS6S0aai/rGVZpELmugEbCdShHkPdBTESRyOa8wlygT47LxdfgM=@vger.kernel.org
X-Gm-Message-State: AFuF++mZapzJYYY1kdg9FQNugW2Kth8dQHdjWo5C9OaRvooLZ1gkPYsR
	D+21CcCZO/5UZUaBxMd47ypUVX0KGYPg19DcNfMTW7dviYhjzgZexkzu
X-Gm-Gg: AYBFou1IocPfI1uEEunWfHZTd6V10TxZM6dIQVHTWX09B6PFcUyUpD+gRsJTVVWYL9v
	X/u/+0utbCM/S74nA/QQ9JksriAM2lRCWhvZR8PvN4MUHd+Gh9tNenK9EF9kMNjVgHVvE+uYs/H
	IvltgQy6fCXqhLsnbjQedHnKyOQYmw5YMVmHBCV/qQ+ufwzOmuwMpRnx/6xccwyy60K3wjNcY7T
	Xd5FXCNFN6r2qxVQQTNHRXB+YqFCG4Cj2rHD7ej3jQwiJPg0xdMjaKS87ZEOiR3z3ZHuYTQtAVl
	XFgSoD1WwJlQk0hk1pshMAcqkp7XCnzqShRKiovuubhyzAFggVnxoxriHjQipSDZFoqmi7kPxwY
	P4SCFiaOwIuH1Ev5FxnGHTdd8Uya/neUBx7dHvAalQK6pYSw4ACv2pCvkU0CVYhktLMJXpVABDF
	DSN1n8H7F3yaONOcr/9U94hVTNZmmd1iHHzrkTKXWBingD3tGDf+Wi24dWySaG/ScseCQ=
X-Received: by 2002:a05:6830:6a95:b0:805:6a93:d9ba with SMTP id 46e09a7af769-80899266f27mr185481a34.15.1789351809265;
        Sun, 13 Sep 2026 19:10:09 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f5ffd82bsm9788713a34.11.2026.09.13.19.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:10:07 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 13 Sep 2026 21:09:52 -0500
Subject: [PATCH v3 1/4] drm/imagination: don't gate the runtime PM
 callbacks on drm_dev_enter()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-v3-1-674b907d0652@gmail.com>
References: <20260913-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-v3-0-674b907d0652@gmail.com>
In-Reply-To: <20260913-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-v3-0-674b907d0652@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789351801; l=4009;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=B0FAHrSWVXGHaqZILibkK+o++O0wPS8q+cwkcADrHJk=;
 b=m0nuDmmhwVrLfYPrLL6ql7pVKv9N25E76iOoE06iKNPUoksHHY7cDxzgdfxNiEHBncqvkJPZO
 omdWCiOyDUoAX3gisn8eY+hxz2rX+Vqz3A726TzxwQSuwuOn3F1GHuS
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

pvr_power_device_suspend() and pvr_power_device_resume() take
drm_dev_enter() for their whole body and return -EIO once the device is
unplugged. The section protects nothing: the callbacks run on the
platform device, which stays bound until pvr_remove() returns. It is
being used as a "device lost" test, and pvr_dev->lost already is one.

Used that way it causes two problems. The suspend callback waits for
the watchdog worker in pvr_power_fw_disable() while holding the section,
and a worker losing the device calls drm_dev_unplug(), which waits in
synchronize_srcu() for that section: neither finishes. Runtime PM never
lets the two overlap because the worker holds a usage-count reference,
but pm_runtime_force_suspend() ignores the count, so a system-sleep
implementation on top of these callbacks deadlocks. Reproduced on
mt8173 with the worker delayed between taking its reference and losing
the device: system suspend froze until the hardware watchdog fired. And
once the device is lost the callbacks fail forever, which leaves runtime
PM in runtime_error and would abort every system suspend.

Test pvr_dev->lost instead and hold no section; a lost device is a
no-op for both callbacks. Re-test the flag after the cancel in
pvr_power_fw_disable(), since the worker just waited for may be the one
that lost the device.

Fixes: 727538a4bbff ("drm/imagination: Implement power management")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_power.c | 44 +++++++++++++--------------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index eb4b6ecdf4f4..8d82b9a79daf 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -97,6 +97,10 @@ pvr_power_fw_disable(struct pvr_device *pvr_dev, bool hard_reset, bool rpm_suspe
 	if (!hard_reset) {
 		cancel_delayed_work_sync(&pvr_dev->watchdog.work);
 
+		/* The worker just cancelled may have lost the device. */
+		if (pvr_dev->lost)
+			return -EIO;
+
 		err = pvr_power_request_idle(pvr_dev);
 		if (err)
 			return err;
@@ -372,24 +376,19 @@ pvr_power_device_suspend(struct device *dev)
 	struct platform_device *plat_dev = to_platform_device(dev);
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
-	int err = 0;
-	int idx;
+	int err;
 
-	if (!drm_dev_enter(drm_dev, &idx))
-		return -EIO;
+	/* A lost device is left as the failed reset left it. */
+	if (pvr_dev->lost)
+		return 0;
 
 	if (READ_ONCE(pvr_dev->fw_dev.initialised)) {
 		err = pvr_power_fw_disable(pvr_dev, false, true);
 		if (err)
-			goto err_drm_dev_exit;
+			return pvr_dev->lost ? 0 : err;
 	}
 
-	err = pvr_dev->device_data->pwr_ops->power_off(pvr_dev);
-
-err_drm_dev_exit:
-	drm_dev_exit(idx);
-
-	return err;
+	return pvr_dev->device_data->pwr_ops->power_off(pvr_dev);
 }
 
 int
@@ -398,33 +397,24 @@ pvr_power_device_resume(struct device *dev)
 	struct platform_device *plat_dev = to_platform_device(dev);
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
-	int idx;
 	int err;
 
-	if (!drm_dev_enter(drm_dev, &idx))
-		return -EIO;
+	if (pvr_dev->lost)
+		return 0;
 
 	err = pvr_dev->device_data->pwr_ops->power_on(pvr_dev);
 	if (err)
-		goto err_drm_dev_exit;
+		return err;
 
 	if (READ_ONCE(pvr_dev->fw_dev.initialised)) {
 		err = pvr_power_fw_enable(pvr_dev, true);
-		if (err)
-			goto err_power_off;
+		if (err) {
+			pvr_dev->device_data->pwr_ops->power_off(pvr_dev);
+			return err;
+		}
 	}
 
-	drm_dev_exit(idx);
-
 	return 0;
-
-err_power_off:
-	pvr_dev->device_data->pwr_ops->power_off(pvr_dev);
-
-err_drm_dev_exit:
-	drm_dev_exit(idx);
-
-	return err;
 }
 
 int

-- 
2.55.0

