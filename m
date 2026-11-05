Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884572;
	b=30ZD8XwrfNRdz5CTa1rQp5ezKFIcTXH6mzkT6wP3hjrQiHI+XVf61I984/7tJnmg+kJd
	 mX3YLo8TohLUAJF5PBZSvyiSQ2kNDGOY+xNvRDF1lmnWv1BWxnJ46+m1uOqAEKuqfUujd
	 WSWuIg2nHzXTjBnxqTypNzVISTN7SJxom25/pTgB4S29WAighp7q4IhmvHPwa0tFEU5c7
	 t2msMDg5s51664JLxcmGpMALSMXkgO9ouL2DHYELpsySFJsFyi6f2bw2X93IuFxxDcOzo
	 fStEtmd2tPDnc9GxBnyF/goJJXeTUQYc08gP7+ABu8HdiAaMSjOhhr9vqA9aWlzzVFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=w+HDLvKsrc2Sqexk3V8n4iZX3w0H0J6c4qfjNhM5pQw=;
	b=38w9U2LHLRE5MKUBueWYG4SmyXqeRC/WctM8qHjrPwf8EwIY4OLeoqmJxGHmZXfSFtLR
	 dpngaq9Hh3gr0KrTY80/E9kR4KUJFV+YN5TIfCmu392uX71rkB4QGA2yWLo+V1cJDvHFE
	 iXO11NFBYcCt2SvBoS/3f0XdXotYN8yKpb77d+qXzuuRtRZD3phCmvFi5XFM9xYOEIcfc
	 eaDMYrZTpf28v5ET8UIHjpojCIrrS79seAfA+1wXIwa8fnGZqTZgxdvPbrAjRFJnKgOZO
	 VTjQwOelXXUfjOi5ehUvKZpkhy64fi7AFcC5AaCRXN539GQ9ygXKvSzbO+wwt67F+nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E0OcBEzu;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4FB606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C4FB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E0OcBEzu
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e985106c0cso15625475ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793884571; x=1794489371; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w+HDLvKsrc2Sqexk3V8n4iZX3w0H0J6c4qfjNhM5pQw=;
        b=E0OcBEzugaK5LDF0yeOTE3p0UTcK6hKrFkBNXrKGDugtKjYfmYBEQVFptf/vSTV03t
         BlVHEaN+osRU/CpW8ZJvUw0yJds/2VoN+VKTZUUJuC5O8UqZF6v/G6frS1zwsSUUXSb7
         trBKH12K3LGdQXlAquiflrhVnnACZ2VA9JKPG0Oz69vW6wkX28CDaPya7HmBywK7zLRP
         4ZT6cogecHE+7+FCM1ltm9YjZsd+67x7xlgtawk2mb0/3KOmyhh7/4Ot3cQJahErlX3Y
         wf5iOxjZAGcrr5G8ZVBekAfMWZcULid0gz2OH0IcdJWOb//idcWZSnK1KMcJ1J+hpvlm
         DX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884571; x=1794489371;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=w+HDLvKsrc2Sqexk3V8n4iZX3w0H0J6c4qfjNhM5pQw=;
        b=YkkAWA0+xZKbxOqQyJZpZkdbct3GIjX8HTrgkWW+5Is90mC1Gtx2O3ZB5uyYpx5+9y
         JnVPrh8bsR7Pyn2WriEMICTqmOxhuSBi8IO7y2sHuZ6gNMkLgKxCmrQAWQp+jJLaQAGQ
         uev9Y471EEnxbdoKwIbQBpiTNwRv8bvzvGdSeFMfSbQDal+DdRONv5ly08h3tU0hpnBj
         nDxb7OvRbdQA4EuXstJhH3YGuXoAQqyNpI+dJfHQ9bcvzk2tALdgGAU7DDrrrUMU2SZI
         sHxY4VRGBjlrCd017XEl0Ln8IgtMy2K/RWjzlXJ486xZ+ROSdAv8siHRU45x5AimHQoE
         CKrA==
X-Forwarded-Encrypted: i=1; AKwUvBwo4B3S+X7/wZgkJFAt7+58prGgFTvVnbFcsl7VEw72YkLUUxBcixUczdNwPB3+PDpd+CjhJg4C+dVdaG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vN237t86nquR2vRuBqVyiXWe+DQRAJXsWksljMF5BvFfXMxdV
	YHKfzD+RXnq1ypdsl3aSAHijustJhYIvYw6IvZUwYX2tK9Pbe0Mjs2QoDWWj+o82
X-Gm-Gg: AYBFou19cEVzhLjUv8awB3XGe2ZvSp+s8CQAiBsOEkjkrtD4WQXRzHXjO3NmZ2L61DY
	jJE4+m3MZ7+F0xacgNxpxgeS1li7RUGS7gfKQOQDis/ngxrGY8Lltop4REUX1FBMwXhsmB80HQ4
	IYplPNMB9kuEB7PRjblLqTH6tWWH+kKBQbbKjEXT3KSnzEUMo4JB4p/cB1MZ+fXwaW3h2FdlKSN
	3FhXTs0+smFOuhJVzxaR6E0+dh6SiUvWgtVBBTMQMv9BSK25lP0GtDC9NZ9BkURCeMX50NJ8rwz
	po/JLT3xyG25aEzn+dI3+uK8IzcyVB9lWlmQHQ3lRNSrYZ22c7KbBUxWlFeW2XaQFGXvWMLxCIL
	bhiALJM9BeQ9J0bsuXOZ7oeufBVdGglq5aqO8Gdej+87fRn6DCy39qTkvoNVMBLpV/utG9WFVcn
	xXFqCjZER3pxgh80JPCjm50aq0um7/a21ro5+GtPnAvRQEuYQZCO6aEYh7XBZfws4qngZmjuqxF
	1zX5LaV73NvHKLDxj1AoCQFgE4fRu949QB1wKg5NFyfVaq6wxhFfyjUJJLTvxD0a25zRRaCHRte
	RPM/ubQnavNVcxCGCly47JFK5rS0WMw0Lw==
X-Received: by 2002:a17:903:244c:b0:2e2:cc25:b232 with SMTP id d9443c01a7336-2eb364f3256mr182447845ad.42.1793884571426;
        Thu, 05 Nov 2026 05:16:11 -0800 (PST)
Received: from pop-os.lan ([2409:4090:1015:ce03:77a8:d3bd:bd43:9560])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe3238sm17266485ad.17.2026.11.05.05.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:16:11 -0800 (PST)
From: saad <primecoder8@gmail.com>
Date: Thu, 05 Nov 2026 18:45:56 +0530
Subject: [PATCH] drm/amdgpu: use drm_gem_ttm_dumb_map_offset() for
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
Message-Id: <20261105-amdgpu-dumb-map-offset-v1-1-7299d94ede11@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIuB7GoC/x3MQQ5AMBBA0avIrE2iqIiriEXpTM2iNC0iEXfXW
 L7F/w8kikIJhuKBSJck2bcMVRawrGZzhGKzoa7qTqlKo/HWhRPt6Wf0JuDOnOjAjk2rqLcNzxp
 yHCKx3P94nN73A5BMTrBoAAAA
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, saad <primecoder8@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793884564; l=3075;
 i=primecoder8@gmail.com; s=20261105; h=from:subject:message-id;
 bh=wZvOA5y+L/diQOxcxDKyx4BTPQFg9Be4nZzKofFPvDA=;
 b=g1Fzekx0b+PXo/Alppv0Oy9v2TdYSCpS1xXhAxXlSwX7LSwpu8FA8n1iLO8UQl6/oLhv6LP6K
 vEsWoY89eFrC2KHGl+gRB8I7XUrosjdVCx9t3J56cjmbR0E4+R6NctO
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

amdgpu_mode_dumb_mmap() is kept, because it still backs the
driver-specific DRM_IOCTL_AMDGPU_GEM_MMAP via amdgpu_gem_mmap_ioctl(),
which is used by libdrm_amdgpu and Mesa. That path is unchanged.

Build-tested with CONFIG_DRM_AMDGPU=m (W=1 for amdgpu_drv.o and
amdgpu_gem.o), no new warnings. Not runtime tested.

The code change was written by hand and reviewed with the help of
Claude (AI coding assistant); the commit message was written by Claude.

Signed-off-by: saad <primecoder8@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

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

---
base-commit: 279235273fc6c0a33df863b4a1cc52ec1e73aba5
change-id: 20261105-amdgpu-dumb-map-offset-6fa41e8d3fb5

Best regards,
-- 
saad <primecoder8@gmail.com>

