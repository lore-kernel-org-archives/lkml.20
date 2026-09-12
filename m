Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551BE361976
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789194627; cv=none; b=ZzhX7s1MeqB/JGfLxb5PhkXnJO05EZI10TNbswBNte1Kq54RmljgewFdXiY1KU5dQAD0uzZcyJ2KWvK1vD/y8HSYMYjrZEUEisVGWk7GbO4qJigPQdE8rXFVdJZygJTqHRJNel92bFkmeWI1/GLtE42quagqetQrCvKDgudAtxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789194627; c=relaxed/simple;
	bh=2b3NiVq4avcIMh0d4fwdRkcWobqPZIeKbq3gCHaDsBg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b4OvXWKSCtm08Hu3/1Ndb6i1O/ib6R2E6jMC8ihuD/kl0GNJwSJ8vHfZ80+eFZMvY/VZenis831L2OP1g+Iiu8PumfvL18hoPaJlkjiHlGKZOyaz4UQPdnoMYjtWNNY80WBGVKJwdHkzAxrS0/Edhn+g+fsVVyPkODev/W6KiZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSRUriWC; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSRUriWC"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso3967465e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789194624; x=1789799424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFix9ue4kazbG44bcHfnwQtuSA55kubKr06mMHl278s=;
        b=pSRUriWCb9DTPWOvv9XBLy97o+IDU4SqK8JmCza6qqdWU0mb06O8NN7QnVrYz1znP+
         cpuPyVSPy4CuZgbnRf8ZhRS1Wql/SqR7u4szePXhgB0ZRyC0xn8CNSO83ldLMKwLKEpy
         j17wGQuzhriDRB1j7pTaFnq99/FHeiRtVUWooVD4YzG8Xit2Nqsy+hQ1wGQ1ncvYiYPx
         2HeDeLe4RYrnFtBkpke3VG0KGeoEpc0sHhtfRIhRRIz7LIQFKgTIu8nm4TSFsmKwLXEC
         FT93SiJVc3aNTHj1EcU3ZHDxysGWw46WulhfCMyPJU5dWZ0h9SaURCvd+o6XiV6R5ju1
         ZdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789194624; x=1789799424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFix9ue4kazbG44bcHfnwQtuSA55kubKr06mMHl278s=;
        b=ZgFAzC2EJP32QqPFpMSzNyw7bBBJypBwLcHHoLY4sYY1zIEZPQ6rUMBQtzvhijuFbJ
         7Bm72ZDlRR1dinJDdu2RDeCvja9Asm+TsIT56i97qX635iGpF5B7lRrJHRilPxxMyMka
         RkYLvXOXJ9vIdCfHPlhUUQkL+4VVflyWTVNRTqibI+/50aKb2ztHSWSVKLD61xU36lxy
         gd0qfZgejGlAf6zg6LvFfqGwjUBOH9AX6beydd87f5Id8jOUDG8ytaTPKSRvW20e5UpY
         BRNgeXJEWR1vmjws0GS4bwu8UFg36YDyALondN3M31EFxBrxIwRW3ihB00gfng+oHKKl
         lbbA==
X-Forwarded-Encrypted: i=1; AKwUvBxNosM/1FwVogPU1rhs10PcXJSrK2PslZwZGYJPBkmQtalEWODWkAMhnOGrlVFeI65UZibKNRm7xfA7mqI=@vger.kernel.org
X-Gm-Message-State: AFuF++lxN9g746pvQCtr+oWaNzZLZu/F2+hfn1VBLI8yo2LelY6c3yWN
	qeR3qftfkJu5lmNSOiy+PZC5oNSERa3sZBDTpgkjSi0C50IjT9uaYkB0
X-Gm-Gg: AYBFou3jHWv4yVJjVZjFcKCMMOKzdIpyNica0xsMGdjI95ojzZ8W112w3smEtW9Aahh
	6ud5B3SOtuoY6PIDjItgzNi940akexKD+YRrHl8CiKZHDQELzppQ7t84IQgNGeJJ76np1ll7IAf
	A1Qkp67WuwvkpnRRgGEmPBBeLNsXm74oL9WbYx0RBfRqJ93yFuxoN1u/JcrkOL+OFdriXOvI2Ku
	cF876WSeRps8XzR3R3zSL4j3RqsK90tssshBTjhHxLKX/QloKtz1cQRjCihvlyJE00cTvjb42pK
	afTZH9v054usns2IJX4Zn22X2ZhY7Egf+os8c8fvFNoAi+7iQFw+oIOTcoBY7Zh7t74K6kDEUVs
	Eh0qH2XDXEAQxaLDfZjl286koM3Ne7oDO1Bo1RIXDWvaP0krNyhCrXr15eyP/rsxrjCAzAqJ0Hw
	DxW/26Mc7xXOi7SMqtT/0hgy4J8tYhaqgGMQa4ZxvvVzDQKBPV5c5/W8nVotkiApbQXV3/dVndX
	GGrWtFcfPmD5RBjcw6y2g6ubYWvvflfv1cnM+TCs613wKKdJiZ4uYT8GuNwqmSQgWU3UU90vcdA
	V8cMLA0G4+nnLTVXzdGY7g7fwFq5gn1bsO1LE4n6MsgnDDiAgN7HjerPdl+PvUeuAcPXMz6apX9
	3hQ==
X-Received: by 2002:a05:600c:19c8:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49e619f3ae1mr160612545e9.10.1789194624288;
        Fri, 11 Sep 2026 23:30:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e63c9a7c9sm187527915e9.13.2026.09.11.23.30.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 23:30:23 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Faith Ekstrand <faith.ekstrand@collabora.com>,
	Sarah Walker <sarah.walker@imgtec.com>,
	Frank Binns <frank.binns@imgtec.com>,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imagination: Fix PowerVR UAPI constant references in kernel-doc
Date: Sat, 12 Sep 2026 08:30:21 +0200
Message-Id: <20260912063021.43076-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PowerVR UAPI comments contain misspellings of the enhancement query
selector, two buffer object flags, and the job submission ioctl. The
correct names were already present in the UAPI definitions when these
comments were introduced.

Use DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET, DRM_PVR_BO_PM_FW_PROTECT,
DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS, and DRM_IOCTL_PVR_SUBMIT_JOBS in
the corresponding comments.

Fixes: 1088d89e5515 ("drm/imagination/uapi: Add PowerVR driver UAPI")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/uapi/drm/pvr_drm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/pvr_drm.h b/include/uapi/drm/pvr_drm.h
index ccf6c2112468f3f53b093bc298dac2bbbfd35e6e..d97a69b83cc59338b7aae306e4dfa1320f071a2d 100644
--- a/include/uapi/drm/pvr_drm.h
+++ b/include/uapi/drm/pvr_drm.h
@@ -231,7 +231,7 @@ struct drm_pvr_dev_query_quirks {
  * the user mode driver.
  *
  * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type must be set
- * to %DRM_PVR_DEV_ENHANCEMENTS_GET.
+ * to %DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET.
  */
 struct drm_pvr_dev_query_enhancements {
 	/**
@@ -848,8 +848,8 @@ struct drm_pvr_ioctl_create_free_list_args {
 	 * @max_num_pages * ``sizeof(__u32)``.
 	 *
 	 * The buffer object must have been created with
-	 * %DRM_PVR_BO_DEVICE_PM_FW_PROTECT set and
-	 * %DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS not set.
+	 * %DRM_PVR_BO_PM_FW_PROTECT set and
+	 * %DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS not set.
 	 */
 	__u64 free_list_gpu_addr;
 
@@ -1277,7 +1277,7 @@ struct drm_pvr_job {
 };
 
 /**
- * struct drm_pvr_ioctl_submit_jobs_args - Arguments for %DRM_IOCTL_PVR_SUBMIT_JOB
+ * struct drm_pvr_ioctl_submit_jobs_args - Arguments for %DRM_IOCTL_PVR_SUBMIT_JOBS
  *
  * If the syscall returns an error it is important to check the value of
  * @jobs.count. This indicates the index into @jobs.array where the
-- 
2.39.5 (Apple Git-154)

