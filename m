Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFAA1A704B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034036; cv=none; b=tNIG0DPeO/Bsxr7bOj5CX0AwlfA3jMjf7MlmDMZbuTDMGsPEtFB7YKazv4eu7yy6DJvPbVh/Ry44yFTAT15lbyasGrToEg/6Cvj8RIjrVB634CJp/ZsGt7Q+fD92CQwU8YZZrCFwVF3+UJ09ldTiHI4E5NoQfn7o/n47WDaOTMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034036; c=relaxed/simple;
	bh=U6fz9yy/5dZQcmsuAG/v7+Up68qWI8bHAFhOPGGGupY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tFxPzMbRtLNc0L+jez0RrIUQ//ruU4cN3Of68XS6rrVLuUoecDl8RJoWqIf5Z8dyEKwDUYbTALChG+ieUXKhDU+rhw6e9Jd8dLPl2QeuzO3+9QBq2CiSvCNME6vOghT2ircHk/7tlTeV+tLPbCZEoEn3q0OG4RyY6qR8n/kW5qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/EwqOs6; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/EwqOs6"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b63bd2030so58370956d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792034033; x=1792638833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=153R+e1jrYKRH+HNspTdkqqncAprD2wZmZQfnSo2QmQ=;
        b=b/EwqOs6Nazh4TalBTv4Id7YzY28K9mfNeUgma4IyZPx5iPzf57xssIxbk2AZZ+xO6
         Y6Sd3lQ4ocdLocPIpDIdhoqSwpeJExgyQ8ErINO92WFzAT4HdZxS6oryKVtBAu5MA01T
         g2o7tFiRgKYJQrbb5MTQd2rLvdbNr93WS4m9dpDBejBX9R47pr2VqT08xZrSs0pzbe2j
         RVkI4uUAFHr4JR6goPRQUguzE2c9PKAbsUJXDu0oDnEdVGKt+t4E10aZNvRR7n5y3cdk
         FwBZ+0WkcwYoU+QihyZmYiPEW9/16fjCFsWxKVg/haaaGVW7kmP+xtB/c94K+xsUHlkY
         FbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792034033; x=1792638833;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=153R+e1jrYKRH+HNspTdkqqncAprD2wZmZQfnSo2QmQ=;
        b=07hGLfme+uX2ZqRWlNSkvR/Impr3g7KUfUJ0LS5VcQeFksV+P67B0j3CIO9rzyCGss
         XTTMHfQRDfIcctHx5UaSCwBj5+rgkmfKL5eAbSgUPnSoEV5zNBNZOWBF3in0k69giz1J
         Xk7QwSOoa6W663HeOkRVmZWVscViFycmtgEKSg6bCG/iPofOOdE2QWsFd87btlFsj/rx
         Q+n8t4topIwyh1UiUMYTucBmZXo3I3172oFTXV01+Jt5c+ZxdPW40MXhrHVYSq6+Qd+N
         NjeI4BhFsqTINmvErKIiDRtV2A/sV9wOTAOnlPprFdBm+NfUk5cT3TURfnp7/2F7k8Ja
         g5iA==
X-Forwarded-Encrypted: i=1; AKwUvBxaaCVNp+AsWgKbVcrYYPDOrDGkYoNEW62XVh5SDWHSJjsHTHfeXCQ6GqslLL6p5cZUBYNUStNLW68g/S4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKq12wcQyaiEZyNV6yNwwgre/6Q8kpxyIM6Zgryg0UM3b4lpO3Y
	CAms0yEMOam66GDDcmF9Ma7HkBqE4wv5ShW8v765gY2Q5s3Ll5y6EmQ=
X-Gm-Gg: AYBFou05GJvhvirQ4QMxJM7nXYtCbq1KwCfcd/2j1GlsfxzMPOXbDoEcr63vlMW9s5A
	B7cEn6zVUZSgkHFKgN6ikcHwuPFjjbu8ulMiQ4t+jrILE7FthqTPhDm3ncZNQd/NtfLrATUew5h
	ZZdLPG5YZQhEKuX4Ecoc1tDWY31rA82g7+d3kgHcUSWFIMGWxck+lWq8mimRUS6Aaoa/6QYRfkb
	0Buvs+L2iK7F/VuJxcll0b/PQcfhXmJKfiZjbEeWLGnX6ehnvTCEVbWHoIssNDRyVlXOGDpUzAK
	5cUOxJPQJooLveRiUlu6zL6trfE+oHnKiKuM+cn4pKP9dI0Znzr7QmbCQe8j+9QFYfvVLXCDGqz
	dLiLU/r3Q4icLQIsplNrk6nlwEzmtxSylD1FEz+kpdQnM3xWPyh4socXo1JT4CqJuTgBeidquhw
	WlSxVM+jGm3g3kRJ3bPa7XNzfzQbq/BzdTfApThtdQ6MUjXulK700ZX9mxTHzuZiUhokvgt7BlQ
	8B6yTPiz9q4uBrEMln57FtmpEbmYjH9B+rB0b9ksgAVDf5RYtobUJosmQ5K5UVpevDChfi0nj0C
	fwHn+LFSjp1fMrBuHUEnvQsLrpip
X-Received: by 2002:a05:6214:1d28:b0:91b:87cc:6d52 with SMTP id 6a1803df08f44-91b87cc7740mr169108536d6.0.1792034033319;
        Wed, 14 Oct 2026 20:13:53 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b387e0sm69717646d6.12.2026.10.14.20.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:13:52 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] drm/logicvc: keep the IRQ within the display resource lifetime
Date: Wed, 14 Oct 2026 23:13:48 -0400
Message-ID: <179203400409.2736079.4502160101423826217.G31.logicvc-irq@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The interrupt handler accesses the CRTC and the register map. Its
device-managed release currently happens after remove has unprepared
the clocks, and the CRTC is allocated after the interrupt is requested.
Consequently a running handler can outlive the resources it uses, both
on removal and when probe unwinds.

Request the interrupt after initializing the display objects, and
release it explicitly before tearing down the mode state and clocks.
Keep it available through drm_atomic_helper_shutdown(), which may need
vblank completion. Also release it on drm_dev_register() failure before
unwinding the display resources.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controller")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (arm64). No runtime testing.

 drivers/gpu/drm/logicvc/logicvc_drm.c | 21 +++++++++++++--------
 drivers/gpu/drm/logicvc/logicvc_drm.h |  1 +
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index bbebf4f..cf60bbb 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -366,6 +366,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	drm_dev = &logicvc->drm_dev;
 
 	logicvc->regmap = regmap;
+	logicvc->irq = irq;
 	INIT_LIST_HEAD(&logicvc->layers_list);
 
 	caps = logicvc_drm_caps_match(logicvc);
@@ -385,13 +386,6 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		goto error_reserved_mem;
 	}
 
-	ret = devm_request_irq(dev, irq, logicvc_drm_irq_handler, 0,
-			       dev_name(dev), logicvc);
-	if (ret) {
-		drm_err(drm_dev, "Failed to request IRQ\n");
-		goto error_clocks;
-	}
-
 	ret = logicvc_drm_config_parse(logicvc);
 	if (ret && ret != -ENODEV) {
 		drm_err(drm_dev, "Failed to parse config\n");
@@ -434,16 +428,26 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		goto error_clocks;
 	}
 
+	ret = devm_request_irq(dev, irq, logicvc_drm_irq_handler, 0,
+			       dev_name(dev), logicvc);
+	if (ret) {
+		drm_err(drm_dev, "Failed to request IRQ\n");
+		goto error_mode;
+	}
+
 	ret = drm_dev_register(drm_dev, 0);
 	if (ret) {
 		drm_err(drm_dev, "Failed to register DRM device\n");
-		goto error_mode;
+		goto error_irq;
 	}
 
 	drm_client_setup(drm_dev, NULL);
 
 	return 0;
 
+error_irq:
+	devm_free_irq(dev, irq, logicvc);
+
 error_mode:
 	logicvc_mode_fini(logicvc);
 
@@ -466,6 +470,7 @@ static void logicvc_drm_remove(struct platform_device *pdev)
 	drm_dev_unregister(drm_dev);
 	drm_atomic_helper_shutdown(drm_dev);
 
+	devm_free_irq(dev, logicvc->irq, logicvc);
 	logicvc_mode_fini(logicvc);
 
 	logicvc_clocks_unprepare(logicvc);
diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.h b/drivers/gpu/drm/logicvc/logicvc_drm.h
index e0f4787..f69538e 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.h
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.h
@@ -53,6 +53,7 @@ struct logicvc_drm {
 	struct drm_device drm_dev;
 	phys_addr_t reserved_mem_base;
 	struct regmap *regmap;
+	int irq;
 
 	struct clk *vclk;
 	struct clk *vclk2;
