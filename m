Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949453;
	b=3BBzVIcRJ69PhpGEsUXe3mp3Kska5KtFEdSnZOYJesv5ancSTMozQKGbzMMlrXqKvaWF
	 61rv8aGj0tmB8m1aBQi1BJzHexrgcuv71wRztmcLEbKEx9Si7hfLMFXHzLRD4y+QNGhsP
	 n845rx80operb5hVFJwaOZaLb5txRrb+RV3XF8LFAid76gSTcQ08hoG/oqm7Ngl2hyI/a
	 Plf6NWV5yQpMwfiazJYhaKJIlc4XMyenPuL29+si1mQYMIz9bf3yOFX5r/nYZZNfduVbN
	 K03f1jUM4Ginwtcq30lb+Apv3pre5/3V8J+o9Zl+qiycI1nXy1yNqaJtlVHJb80YYWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=23tdgrbhdEj0Ew1yGHRUaEBBGufmw96pkWF7xHJ9Y+w=;
	b=YGrJpgleWX6xpQkrI8uoT4lZN750JjwMfeg8fj7Og+zVXp2UlZAmorUihDTrK2kdLprS
	 0I5CbinyDa1d2ezWts+//6EDftk8AcVxokBNruG6t6uzdaR0rJVeZGzRXh5aDFEK27MIS
	 jbajVQ37oQwMvA+SkjHF1+r5lkmV6TJQKRTCSPZae6Vue/iK5FMvZj3WtYoKhsPFYwWdJ
	 /YxKkw+EF0aDYgBAr+XmHamyfp9k9tgl8/lCXz42zl7gnp0TrN6aTGpOgly9mJfsaSCVe
	 TVPpjW02RQQHWeUPe9EqSw2k0HXVoiGZ8elGlm1bvNy7YzXbYRnv9l/VzokXTzQAMbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WBA4nl0S;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13C3606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C13C3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WBA4nl0S
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso576953eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793949452; x=1794554252; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=23tdgrbhdEj0Ew1yGHRUaEBBGufmw96pkWF7xHJ9Y+w=;
        b=WBA4nl0SpBZrO9LVnI+8VA/K0Nk/0m9fe0FUq8gVajlPkqWG9GGk8K9up5qzr+ed3/
         tOvrYQ7ZsJ5bAivT2h/sgP0dqwDTaoo1NFDbQUkrj+ypw4aRl4NZeDAvWPOKxCmowO36
         Dqhj7gHVi0sGPJ7x/Lk6Y4qBy+Bm8xwEnQQhI6+CFqRvVhtAa+mtxyXJbEb2V/7L5eqX
         4dOw4T+TtYrsBNQvq87HkhqpCnay21Pp9WOZpXx+q/t+42AK5vy/EjDXNXNsEHnhBe6E
         tIInd9RrIf5DIRgs28whQ9r+InWfczaZC6hGDuDiyaDKQj2lFcN7Klk99esikLfdKojF
         1bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793949452; x=1794554252;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=23tdgrbhdEj0Ew1yGHRUaEBBGufmw96pkWF7xHJ9Y+w=;
        b=YmH112hg8mGn9DjTH0LAgpoN4d5dsWBx6Q2fD5Gdgb4AuDDY68kMT15p7JEDzcLGeP
         BIvXzPqJfFeNe4EpMkuQJNTF7/ZpEp0R9llGNQomxaaaThRpUQYQrawjGsIS/jdr7X7E
         5KHwm+YyGmGZ+Gk8uLohRwv8w66wVnMCRZoPcYSDrzTekeNPEEIgR2R9jEXxw13ig7OL
         /c4ne+cvEWMnXQ2Oo0ShDJkM3YC7Fw5GxIarA9EWbST5eayljttxCt71wMz5XY5egHz0
         /LheRgbOOtd5HdBUiPnRaiIc2OA25tXVMA4RhYFWiEd/b4Bc3SlV6QvqLf4MFo70bskY
         3OTQ==
X-Forwarded-Encrypted: i=1; AL+hErF73QZITyuw/DpEoMao6vlsKDhFLroz8SRf7IvWLHSLG4NKw52Ljo9gieJWhWkadHVRLa/O4MpXt3SSiqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D2eIQTFwbY5GrLv92I1k5N6CCyQf9HpwtxKKvu7RVWcxIxltl
	Pcvk64QqRzxD5XlOcQmY28napMpDftqaAnBIX+G85lz7x4CEkYqTb9Cz
X-Gm-Gg: AYBFou0o1wJdwMxw0rpGc7WBmbBdIsPGUZxby1pRfVfocWwp3Mts6Wyt0A3J9bTddbJ
	WVDxI68p3D8EwlH0GMQ5vbJnqYHiQHTQ8n4CAttZQlREHEB+Ki8Y1jd0B3PTbNrcUXMDqnV6H4L
	bSETpeONctJUYPEkVwXdL6sWaC8miw2MWA3k51G8zVOK6pXdavtT5REil/Q9boD3uyGLy7tcJnr
	sC7gnsViAmzD+5o6x+gw+ZV383rDpVJsaIJE3ON39zerMLx2D7x8kO9PXL9yguI91M2wmrnHHxi
	Fc58i5OnGzmZ2rLh3m7J2C9dgaDogyHbzF88sD8YmyR4MO9fGJgw2LloB/SF/PRPQvBSmxcGV3A
	FDAJD4RmPCl7+zvAZyEKufUF6GWG0zfn9sLCMYgvjNNrlfm1cWTyjN3vItmtCJgziyCduRqzpvJ
	rdm4JNJD2gTb88SA5Tfb94CmOfVH/nBZ2wdyr3WZaWUn1fcYMFfvdeR2uVtElQOT4gkJzXEdfHG
	i2djOEOmW1P1Y3N0Us9FwHYUh6PLZcK437kuRQbl3nWLRjt3+c0x9U4vWhs5ltE92r17I7dNrSG
	m1tgLR4L5aBi0XqwvqcfyCXEMba/kDmrmEzmwddCkNh6LNF0pCtr2m8=
X-Received: by 2002:a05:7301:18ac:b0:36c:a084:30a4 with SMTP id 5a478bee46e88-36f75b1f65dmr2455761eec.21.1793949451683;
        Thu, 05 Nov 2026 23:17:31 -0800 (PST)
Received: from pop-os.lan ([2409:4090:1015:ce03:1984:1655:89e8:63d2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b7404sm3569864eec.24.2026.11.05.23.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:17:30 -0800 (PST)
From: saad <primecoder8@gmail.com>
Date: Fri, 06 Nov 2026 12:47:25 +0530
Subject: [PATCH v2] drm/amdgpu: use drm_gem_ttm_dumb_map_offset() for
 dumb_map_offset
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-amdgpu-dumb-map-offset-v2-1-0abfb77a84b8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAR/7WoC/4WNQQ6CMBBFr0Jm7RimAoor72FYFDqFSSwlLRAN4
 e5WLuDyveS/v0HkIBzhnm0QeJUofkygThl0gx57RjGJQeWqIspL1M7004JmcS06PaG3NvKMldU
 F8c1cbFtCGk+BrbyP8LNJPEicffgcPyv97N/kSkh4VXVt6oINEz16p+V17ryDZt/3L5G7E9K8A
 AAA
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, saad <primecoder8@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793949447; l=5657;
 i=primecoder8@gmail.com; s=20261105; h=from:subject:message-id;
 bh=dr8+/Sh4e/4pnQunAQ4Dj++/sRRoqxW/WWM80cur6MU=;
 b=TedmxAlnlxjfdYO/u+QTmaiR83q5DTtntTAUn114+cmoB2aARCreQ6QbwbreQHpu+/BHKg47M
 gVbE/KB/AEOBDy2m2D6u0TJARJv09JvdJ7Jl2quDy2hWdUk3t/HfuuQ
X-Developer-Key: i=primecoder8@gmail.com; a=ed25519;
 pk=vJlTVYISGHXXppWzVCeFm0dcME82FTjmVlWBQkyLiKg=

As part of the DRM TODO item "Remove custom dumb_map_offset
implementations", switch amdgpu's &drm_driver.dumb_map_offset callback
from the driver-specific amdgpu_mode_dumb_mmap() to the generic TTM
helper drm_gem_ttm_dumb_map_offset(), for both amdgpu_kms_driver and
amdgpu_partition_driver.

amdgpu_mode_dumb_mmap() additionally rejected userptr BOs and BOs
created with AMDGPU_GEM_CREATE_NO_CPU_ACCESS with -EPERM. Dropping
those checks from the dumb path does not allow such BOs to be mapped:
returning an offset does not create a mapping, and the actual mmap()
goes through drm_gem_mmap() -> amdgpu_gem_object_mmap(), which performs
the same two checks and still returns -EPERM. The only user-visible
difference is that DRM_IOCTL_MODE_MAP_DUMB on such a handle now succeeds
and the subsequent mmap() fails, instead of the ioctl failing. Dumb
buffers created by amdgpu_mode_dumb_create() are never userptr BOs and
always have AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED set, so they are not
affected.

With that, amdgpu_gem_mmap_ioctl() is the only remaining user of
amdgpu_mode_dumb_mmap(), so fold it into the ioctl and drop its
prototype from amdgpu_gem.h. DRM_IOCTL_AMDGPU_GEM_MMAP, used by
libdrm_amdgpu and Mesa, keeps the userptr and NO_CPU_ACCESS checks
and behaves as before.

Build-tested with CONFIG_DRM_AMDGPU=m (W=1 for amdgpu_drv.o and
amdgpu_gem.o), no new warnings. Not runtime tested.

The code change was written by hand and reviewed with the help of
Claude (AI coding assistant); the commit message was written by Claude.

Signed-off-by: saad <primecoder8@gmail.com>
---
Changes in v2:
- Fold amdgpu_mode_dumb_mmap() into amdgpu_gem_mmap_ioctl() and drop its
  prototype, as it has no other users (Sashiko)
- Link to v1: https://lore.kernel.org/r/20261105-amdgpu-dumb-map-offset-v1-1-7299d94ede11@gmail.com
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  5 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 23 +++++++++--------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h |  3 ---
 3 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 731fe8f9e..134d2fe4b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -27,6 +27,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_pciids.h>
 #include <drm/drm_probe_helper.h>
@@ -3151,7 +3152,7 @@ static const struct drm_driver amdgpu_kms_driver = {
 	.ioctls = amdgpu_ioctls_kms,
 	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
 	.dumb_create = amdgpu_mode_dumb_create,
-	.dumb_map_offset = amdgpu_mode_dumb_mmap,
+	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
 	DRM_FBDEV_TTM_DRIVER_OPS,
 	.fops = &amdgpu_driver_kms_fops,
 	.release = &amdgpu_driver_release_kms,
@@ -3177,7 +3178,7 @@ const struct drm_driver amdgpu_partition_driver = {
 	.ioctls = amdgpu_ioctls_kms,
 	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
 	.dumb_create = amdgpu_mode_dumb_create,
-	.dumb_map_offset = amdgpu_mode_dumb_mmap,
+	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
 	DRM_FBDEV_TTM_DRIVER_OPS,
 	.fops = &amdgpu_driver_kms_fops,
 	.release = &amdgpu_driver_release_kms,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 4ed1706d8..2a72bdf2d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -644,13 +644,16 @@ int amdgpu_gem_userptr_ioctl(struct drm_device *dev, void *data,
 	return r;
 }
 
-int amdgpu_mode_dumb_mmap(struct drm_file *filp,
-			  struct drm_device *dev,
-			  uint32_t handle, uint64_t *offset_p)
+int amdgpu_gem_mmap_ioctl(struct drm_device *dev, void *data,
+			  struct drm_file *filp)
 {
+	union drm_amdgpu_gem_mmap *args = data;
+	uint32_t handle = args->in.handle;
 	struct drm_gem_object *gobj;
 	struct amdgpu_bo *robj;
 
+	memset(args, 0, sizeof(*args));
+
 	gobj = drm_gem_object_lookup(filp, handle);
 	if (!gobj)
 		return -ENOENT;
@@ -661,19 +664,11 @@ int amdgpu_mode_dumb_mmap(struct drm_file *filp,
 		drm_gem_object_put(gobj);
 		return -EPERM;
 	}
-	*offset_p = amdgpu_bo_mmap_offset(robj);
-	drm_gem_object_put(gobj);
-	return 0;
-}
 
-int amdgpu_gem_mmap_ioctl(struct drm_device *dev, void *data,
-			  struct drm_file *filp)
-{
-	union drm_amdgpu_gem_mmap *args = data;
-	uint32_t handle = args->in.handle;
+	args->out.addr_ptr = amdgpu_bo_mmap_offset(robj);
+	drm_gem_object_put(gobj);
 
-	memset(args, 0, sizeof(*args));
-	return amdgpu_mode_dumb_mmap(filp, dev, handle, &args->out.addr_ptr);
+	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
index b558336bc..718ffe229 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
@@ -49,9 +49,6 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 int amdgpu_mode_dumb_create(struct drm_file *file_priv,
 			    struct drm_device *dev,
 			    struct drm_mode_create_dumb *args);
-int amdgpu_mode_dumb_mmap(struct drm_file *filp,
-			  struct drm_device *dev,
-			  uint32_t handle, uint64_t *offset_p);
 
 int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *filp);

---
base-commit: 279235273fc6c0a33df863b4a1cc52ec1e73aba5
change-id: 20261105-amdgpu-dumb-map-offset-6fa41e8d3fb5

Best regards,
-- 
saad <primecoder8@gmail.com>

