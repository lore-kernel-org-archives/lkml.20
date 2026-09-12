Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A660D3A8384
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789201084; cv=none; b=kXNoCd+cbrXNrNsDvt7W1JPm8xb5eRQ08/nzhA5T9crV4+v3f6nMwumQYvS6ePn10OUf2Prz9keefa5Lc/aLl3RCApToqKVF6OMK0uq03q5YXbDTvGBoGUmph1LjICHuk1SJBUedv6Ly9LrR79ufDB5rSpexyxwdOhlRlRkxh+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789201084; c=relaxed/simple;
	bh=S3sgi+FGFVuKYdx50zo6hRfoeOv0mTZjAo7cFxCyyVY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uI2jsKhMSokhXHShR0EgJ7KcE4mfMSJlVsKz1Pd8rDaPDjuPbXFjU5cYDiIbnmi9Bfun2biypGpUndeHMrnbrDAzct0jF4llSb68kyyvDmtGgf49VMjPRmE5qUzxGei0ojjhZ7yrgmZYjlUNRuPjCl/OvQgKY+lMbYbebZ3ztqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pLDngrjS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pLDngrjS"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b965570d7so21109465e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789201081; x=1789805881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RocYUdBBcIeZ/ASBsFYpzq2iQKAbEehKSNM8n1TlCEA=;
        b=pLDngrjSA1Hy0sXHPGix5TLIlYWj+saL00AHZHC8oEsxlr58SXgRa7FwILLSbWDF9y
         6BEGSLAQSZvRPdRs6qrTHrs4rjk2S9gkny/Nic9HYzgKgziX+B6F76vWJixKAsw6ok7i
         X/kUatmD69SGJucRhoag9o1d1vEv1gA31kdsonZ86jQ0nN82x9UQHzYw2q8Z5uxBRWbA
         dJB++IAekFBAMTB/1OYIJ0J3iFI0++aa6JcsxBZFOF3UfR3KoFRthzcXiE2xFD/eJVb/
         iMQKD3FCYIGWiPYBgPYghppGDrjxl9wLBWbZoEdxw5qiUrD00z+WzfF/u0FGwGZE9BIT
         3iJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789201081; x=1789805881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RocYUdBBcIeZ/ASBsFYpzq2iQKAbEehKSNM8n1TlCEA=;
        b=H8+GehDgLHyzk//DfoDJrowUlJvhmZuBRZHv57r75advuY3xMg47nsl2uGdKEU74BZ
         CE6AHt07ElWvr7xl6OKvl7GZCaFEn7GY0X6e2ohoDt6AHST265y/DzXt/I6661k/8rxR
         +CWUf6JKHbKVxf493pSRpxOwyczPFFpxrOFT52Ltsca8CPu9+QXruDBaIsogtTLNPpYQ
         y+2yOGDeVD8d8Jyq3unk/LAHfHTvYA1V4qtfMUKYZqQPBYqnjAIzOn/yNBxeRFfhVexV
         AY3hnzt10UeztmEKWYSan1l9sl+Ayk2v2/hcLpSS8LTyIsCOXI/3HsQjty0hg0vHDjG3
         Gvqg==
X-Forwarded-Encrypted: i=1; AKwUvBxxg71yWALgQeqK6SQghhE7N0YoKp+M+ZdKf9SO4jQL/gA72n1Pw4k6LCYl2dSzbokErH0s9T+yw2nW8oc=@vger.kernel.org
X-Gm-Message-State: AFuF++mur9EP/MO0vU+ZAvhaMZ9VU6SBuUgszeBF7pkadmfDp2303b6B
	AYEIezXaN+aYjyhlH0QEarA6Hb5dkDfHigjWK0WLEu/P0p/abbUggxSS
X-Gm-Gg: AYBFou12aBWiQbcZiCwPuBD2oMmPmPFRqtmsXD6Jsuf4WtO1NIyIOtg+9dKu4tHWOOc
	55Z0xuOmTelnXeGr4yJ9XN6pbf8QPwjdhsGZO9f8f9FTxVSzI1nYWFjOctO1sLQGq5Gmd9447a5
	SjpOD51HjoKLf+N0vs6MgkwQyOAIRgFFFWSjSxvwAQvaM8g1zlqBJyTndnUC9cQ0oA753uU8Bed
	uukiGSquwO6gyz/aq8qDGcftSDlqjg8AlZ08sBa32UAQPR6sFZwz8fHlciO/wJbS2R/hgjfIcdb
	epGThLUpz2kXwb/OSkyeyhSA601+3o0JZCQb6Hq3rAgZkCzQW0y2t35h0+E6+uyK2t8p61neCPZ
	JxaPi0G7bLH1zs636cAg3z7PJGW7NL1LKXQ6cI8/+R0DRtVbspzUwrSIC0xzIz9j0I8zPv68ogH
	isYJI9WzhikEcPoNmLe56hM/X+AQtnY4c/8dVBbiIBlfOtxDaMLrDJ/7R7zX+7AE6DJTHeeVNY5
	vgxfOwkryDYmT+Fa8Fiej1YVa8a2apSGoXqJCc8lb5t+jzy0TFfLqwZRYrBFqAOnn0qFEXCBOj9
	8esGG7NREvfIUIDh2FVKCtLEo5Y+TdtrYd6nTbnMXoj2reHBu+Jfg7TCJO5cVoFx3LRR3tdIRkj
	afvuceDmzT6CC
X-Received: by 2002:a05:600d:8445:10b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49e6198a3b2mr62627265e9.12.1789201080628;
        Sat, 12 Sep 2026 01:18:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6420de77sm57620925e9.3.2026.09.12.01.17.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 01:18:00 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	=?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/pagemap_util: Fix drm_pagemap_shrinker_create_devm() kernel-doc
Date: Sat, 12 Sep 2026 10:17:55 +0200
Message-Id: <20260912081755.60885-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_pagemap_shrinker_create_devm() returns the new struct
drm_pagemap_shrinker, or an ERR_PTR() on failure, but its kernel-doc
says "%0 on success", which was never true. Describe the pointer.

Fixes: 77f14f2f2d73 ("drm/pagemap: Add a drm_pagemap cache and shrinker")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/drm_pagemap_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
index 6111d90a38e24586fbcb06f8182e9025339b26b0..c9077a84e3467a5c547d437baae9159bfcd9bea1 100644
--- a/drivers/gpu/drm/drm_pagemap_util.c
+++ b/drivers/gpu/drm/drm_pagemap_util.c
@@ -412,7 +412,7 @@ static void drm_pagemap_shrinker_fini(void *arg)
  * The shrinker is drm_device managed and unregisters itself when
  * the drm device is removed.
  *
- * Return: %0 on success, negative error code on failure.
+ * Return: the new shrinker on success, an ERR_PTR() on failure.
  */
 struct drm_pagemap_shrinker *drm_pagemap_shrinker_create_devm(struct drm_device *drm)
 {
-- 
2.39.5 (Apple Git-154)

