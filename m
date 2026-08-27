Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A40B3644BC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862804; cv=none; b=BQC3bd0kq2Xr3/KhKSkliwkO2cbUSYhNq66h822mKU3GT7rzSIRumKg3oQE62yrEd066Ybw5EsNgkjpRaSgvYh51UDOu4BgcITW16BUCyaOzFgerJuPJwempkMlBpWCt+FIme6rMAbtN0WZajCQKkdM3EJvf+b7nkgxqvcp3hAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862804; c=relaxed/simple;
	bh=dSIHslj+vZ9Da1R3G/PUkbvpiK5yzk6bs/ZH+hKU6ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rwNd9DGEXzvFj40DbACmVzkPGGe0bixSA5uMiCisQMJIUpgHwtOXbIJs2p9F/5Cu7Jrx7QoOlG+ktpQXkEB+r0TdA0qJlCcQEZMgxbOi8aa/dDWbRZhs/xcDttmKdiBIJh97GDBO4jJQQtLiTQttwsD802nFp+aqNzkZW3V5vgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEPy6ki8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEPy6ki8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8D01F00A3A;
	Thu, 27 Aug 2026 20:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787862798;
	bh=IdrnkpO3EzdVTmDSOgcFTiAoRe1SyW/dmxYVVke1fVs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JEPy6ki84+j3c0MBpLgac1q0eGsGl8Eec2pcb+Z7oPjDjMnKDJfo+7Ejzbqu66P7T
	 +dm6uqiPMBqrdCYQjl9eCKBsvGKuWVMVFCK1lfoCeehoYOK5/S29vHibBqFPMSwhBf
	 f6s3+ANgfIUEWrXyKNIn4LBjRY6cyDqdiOeIZSLjkIvK3pEQ1tsrU6kwwKQK0+vKwF
	 jHDAZYmu9JFwO0nZO3+dn8o6bjDxehyRAjUyne3DscN6CNL0bfBccocwqxQyMuvaEV
	 vYrTLNDDNiizp6DdXr8urcBhKMYQp+7mRWOfUVxy4nw3rH9JhGUux4KWyRRU1ZrIvV
	 UUgYBwTa9AB6A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 27 Aug 2026 15:33:00 -0500
Subject: [PATCH 01/11] accel: ethosu: Fix ethosu_job_open() return value
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-ethosu-fixes-v1-1-346f9ea8791c@kernel.org>
References: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
In-Reply-To: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

A WARN_ON() returns a 0 or 1, not the original negative errno. Just drop
the WARN_ON() as the FD open will pass the return code to userspace and
there's only one possible source of the error (drm_sched_entity_init()).

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/accel/ethosu/ethosu_job.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_job.c b/drivers/accel/ethosu/ethosu_job.c
index 6a038c0384cc..99c8812691e5 100644
--- a/drivers/accel/ethosu/ethosu_job.c
+++ b/drivers/accel/ethosu/ethosu_job.c
@@ -368,12 +368,10 @@ int ethosu_job_open(struct ethosu_file_priv *ethosu_priv)
 {
 	struct ethosu_device *dev = ethosu_priv->edev;
 	struct drm_gpu_scheduler *sched = &dev->sched;
-	int ret;
 
-	ret = drm_sched_entity_init(&ethosu_priv->sched_entity,
-				    DRM_SCHED_PRIORITY_NORMAL,
-				    &sched, 1, NULL);
-	return WARN_ON(ret);
+	return drm_sched_entity_init(&ethosu_priv->sched_entity,
+				     DRM_SCHED_PRIORITY_NORMAL,
+				     &sched, 1, NULL);
 }
 
 void ethosu_job_close(struct ethosu_file_priv *ethosu_priv)

-- 
2.53.0

