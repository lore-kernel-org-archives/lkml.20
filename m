Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCCF311C1B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789351814; cv=none; b=KUnJ39OieoopwO0gU5PYqNZj5sPNIQrliYx+1eZWiFukClan0G3JLD4MN6POiQDiUnJYMeOzqTZbfQ0X/sGlvyJoxILf5LGiM83TexTNwiMCX/aHBq2Q34nOntURmCY4CsCPD047EOT1Dm78/w9DAda3U6lgOGejIbAbSDFbuCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789351814; c=relaxed/simple;
	bh=ZZoHyJJSUtcmG47bFptDvaygfZrn5NqsAxuHZkhft04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ll6dBaSEk6LR7AtCpV77dsNHCCKZkOmxEVUgCFtlcB4Q8krO/NFBlRGlcaOkurV62GHpIKJGw/bkn7AjUE1o2fLGYVLzeVfANnxKH36MMDzbLCsA4g+tDN1BOsu5xlCaNmCVa29onJuIkr5wFGXAShfkYS5SY9jEhT6/tm+1zpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtSepaxe; arc=none smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtSepaxe"
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-448a12ddfb4so1329902fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789351812; x=1789956612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2bdJBddmQdN/xHd2xrtzk7IHIBI7EewXCRJ+IEzWoR4=;
        b=AtSepaxeRaJwCRPspNXGOvHoBgogjkh+w4MCBLcACnQdjzg3dfCjm0j6RPGLqrwanM
         rrQEifkXhL4iPMYZtg8YBvEu3k+Z0vC88yl4Ms+G1+zusloJwUx5ta1a8j6wMhu462/0
         fP6ajmneSJ9ZTg+rukSXrz1C6nxbMy4i8wvTyPr3Jbyi6arlBfnxtWO5/ChuKZwAlT6C
         UTv0z0Vv47ajVoPeXT5v1aJQ126A6AY7rnNOucHGeuLMc0jJDxG2UB6Dpcj9jI28F5sE
         MttWQ2TidkQJeQ5gXNhrFyzIElw08HGcxDnbGzECBVruRZ5sIX13mhti9y3IIceNigC7
         q7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789351812; x=1789956612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bdJBddmQdN/xHd2xrtzk7IHIBI7EewXCRJ+IEzWoR4=;
        b=FOdRJdZW3AbEwOJnSHvQJ9+zHLiMCJakwLgBCvOMDSRZgpjX1nO5YoZo1TpkCUf844
         lV3A54X31qEXy15/QJn5Hczldeo76fK7EbkM8tEdR3Lm+XwRrNfWC3LIYq5lI4bZOC9h
         T6HbgcnZXepwYjb75C+qiGCfWfunX/G+kBBsMIESLMrP8YJqzg5Ebtr2MB8BF1VCvWKp
         qrA7JGNDdgRlWomPuMJimAWEMG0k+bsz3iuQ3RbX0GL3zdkpjgw931qDlHUarWc6BDWG
         tXuhfabbkSDnryP6BAh7X1bthteWWpAiLpgdFUFCQeGVvCe4dzkNv778rncjkS3lGK0m
         z9zQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbOGeXIrXF9r9L32jvVtQQlFP7Ak3Jh3bH6Z7lYLR8jXxeWQj1D80ecG+GqEYBZqY/kXI1fWvkJdEkuMc=@vger.kernel.org
X-Gm-Message-State: AFuF++mE3zHrNZpNHeP01zDwkaYlH5mtEjOL3RRu8iK84woRy3oq84+8
	R3QU0sL8iUP/mtBZhIANlRbrXVEMpc0vbIK4Icl3boE69MiRTruHcod5
X-Gm-Gg: AYBFou1QZP1pb0MTqDXK3ZqLibiq14cWHlOQ+rIwNeNnO7rjyxH/thl3qwbYK6fVkTI
	WStSCxPCSrgBtWcpextjxEYOVaI0Q29g1w+vTQf8qWNASlmMCkbWu373u7pWIX5ev241tSu/y8Z
	6XfNyATWcVgBeTmI6f5dOlFhL9SaX+M/EoQ2uU1XmDD7TEno+yHZSCdPV0Wq1voRkbVwxraWoj0
	HyPPr17K5FLB3lsnoMgTaV5H1uLV4iKiTmyp+psBvkPsSvGTWA+tNR82nUwC9ZKgaBMTnLg3nmx
	ea6OQNhdvz1mq5FcJwuA7QPtWt2qwDzo7u6vNahvAKzjRc6Rh1R5pq54Rr0EracE67tYHyRmkfn
	5oQjOsWS43lpWyeKQr92O+pn13ZdR0U3279N72pFm6bmzXH50BvbmsZCIKaObHfXFdOU3gFtGZ2
	q1mVR+XjxRMmZl/Ue4EC+YEAuhm+rPEfe6AsJgKJXn4f17dAiblGgjUZMJmVsybm7E0Vw=
X-Received: by 2002:a05:6830:82d2:b0:806:fca6:f3d with SMTP id 46e09a7af769-80899c5ce25mr398715a34.15.1789351812288;
        Sun, 13 Sep 2026 19:10:12 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f5ffd82bsm9788713a34.11.2026.09.13.19.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:10:10 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 13 Sep 2026 21:09:53 -0500
Subject: [PATCH v3 2/4] drm/imagination: unplug the device before tearing
 it down in pvr_remove()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-v3-2-674b907d0652@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789351801; l=2461;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ZZoHyJJSUtcmG47bFptDvaygfZrn5NqsAxuHZkhft04=;
 b=ZTV8BCDF9afG8SPH8QIz/AAfq1jv9qP3OiHDYb8FI//s7x0Reg8Ej14pcfX2MNfYVOuUMH8ic
 KIpi1YWdHnOCoempRnPbcHdJciKlLmnJraoXqE3+v/SfuEL6GuFVBgB
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

pvr_remove() destroys the job and free list xarrays, powers the GPU
down and runs pvr_device_fini() before calling drm_dev_unplug(), so an
ioctl that entered its drm_dev_enter() section before the unbind can
still be walking structures that have already been freed.

Call drm_dev_unplug() first. It makes every later drm_dev_enter() fail
and waits for the sections already in flight. The runtime suspend that
follows works on an unplugged device now that the callbacks no longer
gate on drm_dev_enter().

Skip the unplug if pvr_device_lost() has already done it: drm_dev_unplug()
is not idempotent, and the second call oopses in
drm_client_sysrq_unregister() on a node the first one removed. Unbinding
a GPU that a failed reset marked lost hits that deterministically.

Holding an ioctl in its section for 4s on mt8173 while unbinding shows
the change: before, pvr_device_fini() completed 3.1s before the ioctl
left its section; after, drm_dev_unplug() blocks for those 3.1s and the
teardown follows.

Fixes: 1f88f017e649 ("drm/imagination: Get GPU resources")
Fixes: 727538a4bbff ("drm/imagination: Implement power management")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_drv.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 5c965ef0274f..fc92a82a7208 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1469,15 +1469,23 @@ static void pvr_remove(struct platform_device *plat_dev)
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 
+	/*
+	 * Unplug before freeing anything, so no ioctl is still inside
+	 * drm_dev_enter(). pvr_device_lost() may already have done it, and
+	 * drm_dev_unplug() is not idempotent.
+	 */
+	if (!pvr_dev->lost)
+		drm_dev_unplug(drm_dev);
+
 	WARN_ON(!xa_empty(&pvr_dev->job_ids));
 	WARN_ON(!xa_empty(&pvr_dev->free_list_ids));
 
+	pm_runtime_suspend(drm_dev->dev);
+
 	xa_destroy(&pvr_dev->job_ids);
 	xa_destroy(&pvr_dev->free_list_ids);
 
-	pm_runtime_suspend(drm_dev->dev);
 	pvr_device_fini(pvr_dev);
-	drm_dev_unplug(drm_dev);
 	pvr_watchdog_fini(pvr_dev);
 	pvr_queue_device_fini(pvr_dev);
 	pvr_context_device_fini(pvr_dev);

-- 
2.55.0

