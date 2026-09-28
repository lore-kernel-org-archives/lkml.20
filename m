Received: from wxsgout04.xfusion.com (wxsgout04.xfusion.com [36.139.87.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CF84D0A0C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=36.139.87.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602906; cv=none; b=aV8CmXP8FCl7YKUBz4V465FcwYiT+VJRGAMigrpcKHDq1b8CxSaxd2WMrBYaFDDVJc5s2ST5Q2sqQSMAOLHMPZ7mC4Oc3phwX2KUIgbsIDdC5lXF6LnpssAuuwImP5KrOmgqa3YTbXoePRlux7OAwfrCqmcKdrKcQTu80yBEWPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602906; c=relaxed/simple;
	bh=2oYcUPnHKzKXYEhqe9ddj5KKPxza2T5ln5RSGsfjDr8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WmoLoEITBEc7iJ4K8RqUwnjlo6qI6cZW41v+gJ8vO6uRnKvMTil5KD2s7Ifm7QcETGrYeN1CWFLdoRL2kZTe2XrZkORVdy3Mh6oSuzB1Zfehvg2At8bjAigBqWA/uVB8UQb2mTAQv7u2LH7O3R8n0dWrFmsdnS/KwO8UWhGxjB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xfusion.com; spf=pass smtp.mailfrom=xfusion.com; arc=none smtp.client-ip=36.139.87.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xfusion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xfusion.com
Received: from wuxpheds03048.xfusion.com (unknown [10.32.143.30])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4htj5H2gNnzBRpps;
	Mon, 28 Sep 2026 21:36:35 +0800 (CST)
Received: from DESKTOP-Q8I2N5U.xfusion.com (10.82.130.100) by
 wuxpheds03048.xfusion.com (10.32.143.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.46;
 Mon, 28 Sep 2026 21:36:57 +0800
From: shechenglong <shechenglong@xfusion.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Thomas Zimmermann
	<tzimmermann@suse.de>
CC: Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
	<olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	<dri-devel@lists.freedesktop.org>, <virtualization@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stone.xulei@xfusion.com>,
	<chenjialong@xfusion.com>, shechenglong <shechenglong@xfusion.com>
Subject: [PATCH RESEND] drm/virtio: expose GEM memory statistics through fdinfo
Date: Mon, 28 Sep 2026 21:36:35 +0800
Message-ID: <20260928133635.1835-1-shechenglong@xfusion.com>
X-Mailer: git-send-email 2.37.1.windows.1
In-Reply-To: <20260922094455.1799-1-shechenglong@xfusion.com>
References: <20260922094455.1799-1-shechenglong@xfusion.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: wuxpheds03046.xfusion.com (10.32.128.186) To
 wuxpheds03048.xfusion.com (10.32.143.30)

virtio-gpu does not expose per-client GEM memory usage through DRM=0D
fdinfo, leaving monitoring tools unable to account for buffers owned by a=0D
client.=0D
=0D
Wire up the DRM fdinfo helpers and use drm_show_memory_stats() to report=0D
the standard drm-total-memory, drm-shared-memory and drm-active-memory=0D
fields for GEM objects referenced by each DRM file.=0D
=0D
Tested on a QEMU/KVM guest with virtio-gpu. After running:=0D
=0D
  modetest -M virtio_gpu -s 40:1024x768=0D
=0D
the DRM file descriptor of the modetest process shows the following in=0D
/proc/<pid>/fdinfo/<fd>:=0D
=0D
  drm-driver:         virtio_gpu=0D
  drm-client-id:      8=0D
  drm-pdev:           0000:00:02.0=0D
  drm-total-memory:   3 MiB=0D
  drm-shared-memory:  3 MiB=0D
=0D
Signed-off-by: shechenglong <shechenglong@xfusion.com>=0D
Signed-off-by: chenjialong <chenjialong@xfusion.com>=0D
---=0D
 drivers/gpu/drm/virtio/virtgpu_drv.c | 13 ++++++++++++-=0D
 1 file changed, 12 insertions(+), 1 deletion(-)=0D
=0D
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/=
virtgpu_drv.c=0D
index 2aaa7cb0808..d43d7ddac60 100644=0D
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c=0D
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c=0D
@@ -323,7 +323,17 @@ MODULE_AUTHOR("Dave Airlie <airlied@redhat.com>");=0D
 MODULE_AUTHOR("Gerd Hoffmann <kraxel@redhat.com>");=0D
 MODULE_AUTHOR("Alon Levy");=0D
=0D
-DEFINE_DRM_GEM_FOPS(virtio_gpu_driver_fops);=0D
+static void virtio_gpu_show_fdinfo(struct drm_printer *p,=0D
+                                  struct drm_file *file)=0D
+{=0D
+       drm_show_memory_stats(p, file);=0D
+}=0D
+=0D
+static const struct file_operations virtio_gpu_driver_fops =3D {=0D
+       .owner =3D THIS_MODULE,=0D
+       DRM_GEM_FOPS,=0D
+       .show_fdinfo =3D drm_show_fdinfo,=0D
+};=0D
=0D
 static const struct drm_driver driver =3D {=0D
        /*=0D
@@ -347,6 +357,7 @@ static const struct drm_driver driver =3D {=0D
=0D
        .gem_create_object =3D virtio_gpu_create_object,=0D
        .fops =3D &virtio_gpu_driver_fops,=0D
+       .show_fdinfo =3D virtio_gpu_show_fdinfo,=0D
=0D
        .ioctls =3D virtio_gpu_ioctls,=0D
        .num_ioctls =3D DRM_VIRTIO_NUM_IOCTLS,=0D
--=0D
2.43.0=0D
