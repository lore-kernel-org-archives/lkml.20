Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0A83AE1A5
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791485008; cv=none; b=J/OT/L5AgV5J1nrkdpvEpWTOp/5nyXjO4N9oWgm51YgfSj9blSZ8q+7fEhvKcL018eH2+F0KM42MsKVGUu9MhC2yKntSu88CYCF2h93UvIAO5aUMWFxXqSVzm6Uu4/gctCKx+W+ABJdRsbfkQso0NbsEoYAHck+ZN+fig0Rg1zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791485008; c=relaxed/simple;
	bh=5WeBncPUltbbk0lwv31MzzjfZDiY2zkDxagGShEDsYc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A+AmVt5IpY20Jqg8zCBezL3kRZGBDTZsAdmX3q6+FPqQWDiWBR5Q+SXuFkNdB/qkmMBY4WDzktA3lxcfA2O/5AKQ/N9EMxTZpOuzfD56E2MBcHDWIt1x0ek27y75ovptgztMc28LUfJ7oX0ZxD5bexJ6dxWeymgx6mRbkD+RhpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHTTtJ5MdqnboQCg--.13485S2;
	Fri, 09 Oct 2026 02:43:21 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=83=C2=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Evan Quan <evan.quan@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: return error from gpu_recover_get() on runtime pm failure
Date: Fri,  9 Oct 2026 02:43:24 +0800
Message-Id: <20261008184324.2783919-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABHTTtJ5MdqnboQCg--.13485S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4UXFW7Zw1xur1rXFWxCrg_yoW8GrykpF
	4fXrnxtryDZF12ya47Aa4xXa4Y9w17XFW8KryUC347uw15AFZ5JFy5JFWjqFWjkrZ2kF47
	trWkG3y7XFnF93DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUklb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JV
	WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU59o2UUUUU
	U==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgEOA2rHo1OWWwACsY

gpu_recover_get() calls pm_runtime_get_sync() and, when it fails, puts the
runtime pm reference but returns 0 instead of the negative error code.  It
also never writes *val in that path, and since the debugfs file is backed
by DEFINE_DEBUGFS_ATTRIBUTE/simple_attr_read(), a 0 return makes libfs
format an uninitialized on-stack u64 and expose the kernel stack contents
to userspace, while the error itself is silently discarded.

Return r so the failure is propagated and the caller skips formatting the
uninitialized value.

Fixes: a9ffe2a98338 ("drm/amdgpu/debugfs: properly handle runtime pm")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 3043ad041bb4..4c373167d86d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -988,7 +988,7 @@ static int gpu_recover_get(void *data, u64 *val)
 	r = pm_runtime_get_sync(dev->dev);
 	if (r < 0) {
 		pm_runtime_put_autosuspend(dev->dev);
-		return 0;
+		return r;
 	}
 
 	if (amdgpu_reset_domain_schedule(adev->reset_domain, &adev->reset_work))
-- 
2.25.1

