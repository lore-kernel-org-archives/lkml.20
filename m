Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4353515DC
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655645; cv=none; b=ZnvYRxVZr0x9MZb/z1Dlz4DOScsodMHkfbmo31wLgt+0xGIsI+MvDmBQzMnXEZpHpU3ViPfuxaAtujHdovvkX97eI9NwNhLS5IpOWVhL0xSr6gKNx39672rll00uETInlQjEOBELUaRE0RjWEfKf3toSNOTiCqrnGLtL1qqDZcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655645; c=relaxed/simple;
	bh=OT+LcZq2po57Ea10ACMyNoXnTz+fxCL0TXrerpq9LqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQQAml0PcWfcECKz/MrqZDKejY3ie6ndzRX+G3QUx1kKBE6ie4XgW7OsbVUhpYwa/e4i4jPCOix5MsYFImMOVLSrlviNjYpo+9QZKzQazP6w6lZgSxdvIVGlkkplqb0tPRF3VKBVhCDAK28QUvKUyajW9aT121wYbEchnWjuEgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoKFs75C; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoKFs75C"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso4797855e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655642; x=1792260442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5j1pSqblDdPaBPvCTrZnRaS3nxEgPKJ9d7lIX0F3CQ=;
        b=HoKFs75CN/raWrbhTBegomfkfXMQkNZjcQF7N0H9hwx7pgHYrNZpkcMMA3ZeqgDAwK
         dIzZuPwzqmf+sIsxd8JGQdLQNglDmDZABQM1MOpXjkGw0cnWFDszZlRGunulhSYRHNAx
         Wfpvs3+WxUd3q93nK09Qd0cSrMSWFFwPDfgB0/IcOgB3Ce3wtnEVpcjBHsGcwnTntprD
         4b5wN21ATbdS486azBwSVfUFVNf/TFAKJF507tbhT9qk3abjo3uYiHCnb8KleK0hksl3
         hr2hpsTgwfywtbbR7USr3+ndm5qdoXKJgb02+06Tc6Wp+Gvy0hjtyr3nzcrM7ik4XFYO
         xt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655642; x=1792260442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5j1pSqblDdPaBPvCTrZnRaS3nxEgPKJ9d7lIX0F3CQ=;
        b=gr7LYDnldtRgjNwmpnjsN3RoUiFVet0yX7RD7C5wI9pttjcYSmzEFMQTW1xLvLvhxa
         XzDBPYJsWUrOdVv/pFlcSqhUT+zmy1U3R6dotuqgiTe4Wqi0bsOkI6xI0oXrL7tDbl7D
         aQa2IpdT162Nao8S7o5tkNWR+Bv3iU7XE6jZl4DQ0E+xKx9teIEzkNxmRLQQyoxoCJdg
         6fs6Lmzff7Zkg/mMX/K6zXakOw09A7aBJllHOHmjpFgiVobaxMrmRMtvSUXndVLjKGl5
         k8tSNZra43QVAdKsyyhuAxKj/QZV8FwXVb00z4lK7pjD3fZixGH0NHMTXfuJkEGLOQAp
         s0xA==
X-Forwarded-Encrypted: i=1; AKwUvBwBZWiJYGO2oZUwUD/3M9nsj0GsBQ4tlIwUiE1ezmy3XFe0XhNwytA0R8bkpmXfgFOrdHsR1o+V1IbOEVc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeKBI2Osj9SmOH0R8MRQOYmogGChkuVOUzfGqYtqI8Hb9N+22j
	rGW0LkObOlUP8d0WPYbIZqe1Ezp8Ln14sBPLZ+xhTcJ5EmPlqZFc467i4BOTs6Cl
X-Gm-Gg: AYBFou1yGqj64iByTml6Ge1xU0mm0Yq0+dsah/pVjrMc/mwmS2pnCKrt2+YsXKbt5jb
	P7EwW7q2uo1yLd934q8uOrtkr5ognR42p3iyZNjGepolphDV9gZu6w9CMrYR9JNnfGcPRKsTR3Z
	0ZLloCwNAHPmnTZiGhVAWcTm1aXVQOF+t+HuYm2T1u7CzOkTWH770YiHfo3FV9dWmp5br7zqSWa
	WN8kIwXkC2YIOUeH55ynlSiphX9JCIQlJFnWMh6+rx4eD3U/448S7NTYngJhB35rluVRS6mIFVP
	kU/N0VCQD4+jOOhpWXTragw0GOFc5e0rpffV8bl8wp1cVmfPdWaBFVh1JXgvKhYMcB84nzmvqzI
	u0PdLvflQDHgNp0vDLb2UPjBprTlHnXE01gGehcmRcqXlHyTnGbjoQotQAAykVONWFkFvyS8o3o
	0jSM6kKJgfne/V9oS4Wfi9x7ltrs26FbRbKCD1EChNa9rJ6MiVlSexsRVmrz97xxLLCVphb/8aa
	MfZjzuhRQuiyN3pIWfkwDPIanY1gSyroDQC10nJcbQ=
X-Received: by 2002:a05:600c:64c8:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a18e4c41b0mr91571535e9.21.1791655641777;
        Sat, 10 Oct 2026 11:07:21 -0700 (PDT)
Received: from desk (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e530esm9617208f8f.13.2026.10.10.11.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:07:21 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Julian Orth <ju.orth@gmail.com>
Subject: [PATCH 1/2] drm/syncobj: fix fence and syncobj leak in drm_syncobj_import_sync_file_fence
Date: Sat, 10 Oct 2026 20:07:10 +0200
Message-ID: <20261010180711.1548333-2-ju.orth@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010180711.1548333-1-ju.orth@gmail.com>
References: <20261010180711.1548333-1-ju.orth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If dma_fence_chain_alloc() fails, the function returns -ENOMEM without
dropping the references to the imported fence and the syncobj.

Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index c23a5de27..5ca5163d0 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -730,6 +730,7 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 {
 	struct dma_fence *fence = sync_file_get_fence(fd);
 	struct drm_syncobj *syncobj;
+	int ret = 0;
 
 	if (!fence)
 		return -EINVAL;
@@ -743,17 +744,20 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 	if (point) {
 		struct dma_fence_chain *chain = dma_fence_chain_alloc();
 
-		if (!chain)
-			return -ENOMEM;
+		if (!chain) {
+			ret = -ENOMEM;
+			goto out;
+		}
 
 		drm_syncobj_add_point(syncobj, chain, fence, point);
 	} else {
 		drm_syncobj_replace_fence(syncobj, fence);
 	}
 
+out:
 	dma_fence_put(fence);
 	drm_syncobj_put(syncobj);
-	return 0;
+	return ret;
 }
 
 static int drm_syncobj_export_sync_file(struct drm_file *file_private,
-- 
2.56.0

