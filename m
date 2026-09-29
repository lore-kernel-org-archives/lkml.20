Received: from wxsgout04.xfusion.com (wxsgout04.xfusion.com [36.139.87.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2234F4D19
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=36.139.87.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675020; cv=none; b=D2srTVkNP4JuONRY7VHFMGHyIc8OPTgjguX8V59ct1g6Wolpx/uwpXCMsVHydsJlrpESROEn6OMimzv0Xx4PKDZI+3F6repjDLTpxhHsDh7EqSyT9rsVrWnxycBbN+h5BWEDoUuB0Fdxw/wsJWkPpba9m/XtqnTrv2vktpxdZ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675020; c=relaxed/simple;
	bh=pEyrc9WtdXZQz4nezh1D0cAfCkeyEW+dwWoun2bEQNk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jLRyfKbBSvjiHIqQnjJX+zNHp5q4uysmT3PHuTHJm1E2G8B5pv+RL6nP/9nE4/WLP3vscSldWbzd0e3ooRKLADIrZI1CSoSQboig9dtTDHIIGa0zy+F4U7mLfpZKRb9d3/fo5V24PAvTDTF+DRlzzTQNCpxEaRqWKJfyBgUVxeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xfusion.com; spf=pass smtp.mailfrom=xfusion.com; arc=none smtp.client-ip=36.139.87.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xfusion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xfusion.com
Received: from wuxpheds03048.xfusion.com (unknown [10.32.143.30])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4hvCsT117DzBLdJh;
	Tue, 29 Sep 2026 17:43:09 +0800 (CST)
Received: from DESKTOP-Q8I2N5U.xfusion.com (10.82.130.100) by
 wuxpheds03048.xfusion.com (10.32.143.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.46;
 Tue, 29 Sep 2026 17:43:32 +0800
From: shechenglong <shechenglong@xfusion.com>
To: <tzimmermann@suse.de>, <mripard@kernel.org>, <airlied@gmail.com>,
	<maarten.lankhorst@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<sam@ravnborg.org>, <shechenglong@xfusion.com>, <simona@ffwll.ch>,
	<stone.xulei@xfusion.com>, <chenjialong@xfusion.com>
Subject: [PATCH v2] drm: Fix NULL pointer dereference in drm_minor_alloc() on error path
Date: Tue, 29 Sep 2026 17:43:22 +0800
Message-ID: <20260929094322.1874-1-shechenglong@xfusion.com>
X-Mailer: git-send-email 2.37.1.windows.1
In-Reply-To: <85292368-03d6-49ce-b6df-3bf659347c0f@suse.de>
References: <85292368-03d6-49ce-b6df-3bf659347c0f@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: wuxpheds03048.xfusion.com (10.32.143.30) To
 wuxpheds03048.xfusion.com (10.32.143.30)

When drm_sysfs_minor_alloc() fails (e.g., due to -ENOMEM), the
following Oops occurs because an ERR_PTR is passed to put_device():

  BUG: kernel NULL pointer dereference, address: 0000000000000030
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  RIP: 0010:kobject_put+0xd/0x60
  Call Trace:
   drm_minor_alloc_release+0x1c/0x50 [drm]
   drm_managed_release+0x96/0x160 [drm]
   drm_dev_init+0x269/0x330 [drm]
   drm_dev_alloc+0x3f/0x80 [drm]
   virtio_gpu_probe+0x40/0x180 [virtio_gpu]
   virtio_dev_probe+0x1fd/0x360
   ...
   do_syscall_64+0xaf/0x500
   entry_SYSCALL_64_after_hwframe+0x76/0x7e

The call path that leads to this crash is:

  virtio_gpu_probe()
    drm_dev_alloc()
      drm_dev_init()
        drm_minor_alloc()              // allocates minor
          drm_sysfs_minor_alloc()      // returns ERR_PTR(-ENOMEM)
          minor->kdev = ERR_PTR(-ENOMEM)  // stored directly
          return -ENOMEM
        // drm_dev_init() fails, triggers cleanup:
        drm_managed_release()
          drm_minor_alloc_release(dev, minor)
            put_device(minor->kdev)     // ERR_PTR(-ENOMEM) dereferenced
              kobject_put()             // crashes at address 0x30

drm_minor_alloc() assigns the return value of drm_sysfs_minor_alloc()
directly to minor->kdev, even when it is an error pointer.  The
subsequent cleanup unconditionally calls put_device(minor->kdev),
which dereferences the error pointer and causes a NULL-pointer
dereference (offset 0x30 into a non-page-mapped area).

Fix this by using a temporary variable to hold the result of
drm_sysfs_minor_alloc().  If the allocation fails, we return the error
immediately, leaving minor->kdev as NULL (the whole minor structure is
zero-allocated).  put_device(NULL) is explicitly allowed and safe.

Fixes: f96306f9892b ("drm: manage drm_minor cleanup with drmm_")

Signed-off-by: chenjialong <chenjialong@xfusion.com>
Signed-off-by: shechenglong <shechenglong@xfusion.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_drv.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index c808958a2..9c51312cd 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -143,6 +143,7 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
+	struct device *kdev;
 	int r;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
@@ -164,9 +165,11 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 	if (r)
 		return r;
 
-	minor->kdev = drm_sysfs_minor_alloc(minor);
-	if (IS_ERR(minor->kdev))
-		return PTR_ERR(minor->kdev);
+	kdev = drm_sysfs_minor_alloc(minor);
+	if (IS_ERR(kdev))
+		return PTR_ERR(kdev);
+
+	minor->kdev = kdev;
 
 	*drm_minor_get_slot(dev, type) = minor;
 	return 0;
-- 
2.43.0

