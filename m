Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837901;
	b=ZHuAP1LEZ8b+Y/QT2OBvH8pvp0TVws4Rzm/uOABh24V3dHQ9+tdR2SvwIZDAmlxRa4TF
	 /zklOC0JgLNxisXUvXx7cRWdwgqFlj3bt3rsF0199Gt9sHQFv6qWlEZxeqPdvDkbbd8PG
	 kzW8+l3C6rsEMTCvoaIL43kVSh0fNbyBs9OFcOe3juxIkjj+y2kTnj6g1gyBK0UnuzJm2
	 eVBVVd0VdK0lPQhMfshkrzDE+u+yOPZkJq/Ya6kGjyZTkxcRJWuTzF9NCDMY4zZogTVIH
	 znV5swTKsUAEyzjXvIsUsu+fPeJV/UlrYx3y5TC6lMOb4JVu/569EPbStWzk16gzC7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2RfzmInKLxcVdPe2pyLqd5yFU8xZtV1axjF/Ql8v5bI=;
	b=pZqhfeaMMBVPqC+rcZ6a5IT6T/L6rTTQjfjFF975/L+WzI52nMpAtr4se8u8w56bOe4q
	 c8QEuctHBjTsKZx3cxpUCBdA23W++5ywvU8FXZDVGccfrOZ9V35IYbKhTQYjAzJT6MlED
	 mygfjrTMaoHlibmKQovkOhNqO4UswEMnmRuHEjelTNdwAZvH7Zj/Uxj78W2Lb6GFtEycX
	 4DXh3AXOFdIrIDlyJlZTeYwfXe5dZ8WSVN8tB1WLOiwLDcwP+GjRriASjw9l8cwFs+PbF
	 P/w0LMgQUtlWvVSatXWum7DDV5tXmc3CefDrSByUu+END3Tf7VvdgHAUckfdhlM7JtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tGzh5wCJ;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE11E606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE11E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tGzh5wCJ
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5364d86f7f0so14070221cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837900; x=1794442700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2RfzmInKLxcVdPe2pyLqd5yFU8xZtV1axjF/Ql8v5bI=;
        b=tGzh5wCJB8cmFeghCXefLX6eTl2V6HvaWGLLd0Vu1IRLcNHelhXLs6r2nHdPO1zJvX
         CnL07oca1J/Rrj4nD1xyJSWYb1TL4mQ9rdHHR9MgYRRA691VxOWz98fDaHmXMHUs6G3K
         28G9yC3hNQruZryIqF/3vG0ie2cCPREJbDrT8dvZbf4WRtzdSlcEOdygi5AuO9XRTtGK
         1iqLowzTzQOVnj5DKXFQAyMRJEh/9PhDyNSUZsdfl+4iIIj17hdYiTc2501IQ7fzOudE
         iBz/6nOU9byrFAlLJJFiEkBGIsCuk/Ro3jYQDkpAAEJMsF1ER+QcBbwq+VxG3xJUQ7J+
         qoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837900; x=1794442700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2RfzmInKLxcVdPe2pyLqd5yFU8xZtV1axjF/Ql8v5bI=;
        b=Rvwjph/VKpSL6J9FTjzhgV/ms0KuW/MnIEgQeM7TW4Sad0p1tENP8dtO4YHQ+RWCo7
         aprE6h/tURRqwYAC0f8A4Cup/A3UuObgoEgxsUixhtqcWSb8JZ8sEgPbiDJYRsRPVD8Z
         BcqwS6dHvXab+0WZwMCLQPKoXPQk/+kIlohppe9+VxdYfOsaLOyaAqacwOHyXiJqeOTj
         BXEvaCa8LECtTP6JxzjxaiM0/41IQrNnG+Qqw/0+x4C3JbpNdCm5IN84OWi2TnJwjoGz
         u6Ta+34dF38zuKhg5ZzaKpXJISeeGC8QZ6NRLxj9JVT4lRQoMKYoDwFyRxo+KtihC8dy
         RzNA==
X-Forwarded-Encrypted: i=1; AKwUvBw8RA+oBtpwc2LWvqPcqI3Fm3dmaaZu2yO5SmqRPzjcRevzxb3h3RLtCtJrqSYbsJHwe9LW/E9K1qLaDgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Bx+MF596Tzg6wVmfafbTXxLMthyGjXoOwi9jJqeIeEkVOBSKf
	rEzemB/uZJjhMJieQmlJm7E/+XML7NF4I6s4lddPVA9NpXkFDGBI4Nv1
X-Gm-Gg: AYBFou2J8gKtRtyFitjUZyopUIyk4+i8RmhnPLUEzE7Puw64kXpeANAijdlLe0adID7
	3XMX6c0VJ1zgMvP+PZ1FxApGuYDOACqG/GAa7N1y967J+2g76hL+cd98+V+pmusOlkl7twkBI6W
	s1+v+5mM7BECAnDj1ZtgXQNvI45ISntQbG2xdtgkHaR2w3VYE4y2KfwTUjUl5gZQZU1zkXse58l
	CR5LAsRfFkhnjwnTB8SvQtQetBfjCw632cD0JvcRK8Wp0KCnrv9N37YDu//HDzLeVZGGdKBLBcH
	19dwxaxI8gof08+ERDnEEzX8yUGaGxYOLWlFKul8/T/qpzHtZVIo+DycGO9I4sGNhb5Rz2rfN1y
	lMC8O8HHadwxaosfRmZI9r6kIlVh53XvuvdlFAvnqboAaSS917Q1ZQ7kLWr+YHHwWSBg67S4PAV
	scB7I5mJBL6G8EezyTt22Q9MSf47WMWyPHFhuBcrouXQC07azqc76a/q+m2ol0ex1g3zzcM09N1
	5iv1gTMEgKDuHKZ31g0i6srWkNmcs7OemFlRv3wANjgnfzRDJ6W9piqb6rgnmHziXLsjK+UY3G2
	gzZdHv2YF6taa/Xsrw==
X-Received: by 2002:a05:622a:393:b0:535:bb7a:884b with SMTP id d75a77b69052e-542b62a4c8bmr301056311cf.27.1793837899712;
        Wed, 04 Nov 2026 16:18:19 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e76be8dsm32655966d6.41.2026.11.04.16.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:18:19 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Simon Ser <contact@emersion.fr>,
	Alex Hung <alex.hung@amd.com>,
	Daniel Stone <daniels@collabora.com>,
	Sebastian Wick <sebastian.wick@redhat.com>,
	Melissa Wen <mwen@igalia.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] drm/colorop: Release the object ID in drm_colorop_cleanup()
Date: Wed,  4 Nov 2026 19:18:15 -0500
Message-ID: <20261105001815.4000596-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drm_plane_colorop_*_init() functions add the colorop to the mode
object IDR, but drm_colorop_cleanup() does not remove it, unlike
drm_plane_cleanup(). When a driver frees a colorop after a failed
pipeline setup, its ID still points to the freed object.

vkms ignores the setup error and registers the device anyway, so the
stale ID can be looked up from userspace. With one allocation in
drm_plane_colorop_curve_1d_init() failed through failslab, querying
the IDs with DRM_IOCTL_MODE_OBJ_GETPROPERTIES gives:

  BUG: KASAN: slab-use-after-free in __drm_mode_object_find+0x2e8/0x320
  Read of size 4 at addr ffff88800b681020 by task getprops/79
  Call Trace:
   __drm_mode_object_find
   drm_mode_obj_get_properties_ioctl
   drm_ioctl_kernel

Call drm_mode_object_unregister() in drm_colorop_cleanup().

Fixes: 9cf87f864d83 ("drm/colorop: Add destroy functions for color pipeline")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
 drivers/gpu/drm/drm_colorop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 95da03d6c65c..edfb4d72d166 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -183,6 +183,8 @@ void drm_colorop_cleanup(struct drm_colorop *colorop)
 
 	if (colorop->state)
 		drm_colorop_atomic_destroy_state(colorop, colorop->state);
+
+	drm_mode_object_unregister(dev, &colorop->base);
 }
 EXPORT_SYMBOL(drm_colorop_cleanup);
 

base-commit: 3944ca3e6b7d25e545e8ef6498f69941e8e0c8ae
-- 
2.43.0

