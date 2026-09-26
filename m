Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFBA49D58A
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790454048; cv=none; b=p5RZVoHtNA4HM30t9ZygjJtWL4EMKDgBhHwVjXYMTmxrlVzehIOsnB2rRRtYd3pCD6pBSqReAHNnkTKxj1sBt5WTX+iw1ZUVzVrowCXfsrOylPftcRcr3Ce4gs2iE0p0tIwptYWas9h7yQKL58XC2DS8hedsvEmxHoG7DF78BbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790454048; c=relaxed/simple;
	bh=TeA4rzx3tIqodbILhjQ27AMr7aKkw2UurfV3eDfJVl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=el183AjGdbnYASBr5XwhApOQasltdqwOyBMm+xgOJrQAVOYskonz/U1DFvzp+rYY/20u+nrpqc6VnAIKAqOg8noKM03MAuejrR2YbUgQqT+PURSvuWt258XCvY5RbQ/rnbIQXWrp0FLdhy/43FDWe695ok6T9gtYF5QG5xJ7vMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4C9Ye8v; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4C9Ye8v"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-532db7db0c6so18043461cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790454046; x=1791058846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yMSXbv0RzpnT7LQIOAfBfWiKfyiEPbJB+JqeZgxSJQ=;
        b=B4C9Ye8vDV0EFsr3oKHAyHI/kH/795eJXULV6vT3OFXuif5LrmDFJ2MYGsg7JXT4uT
         ufJt4GlDu/P+DI6O4ptzoISLqHmP4k13q8/+xaH2/oq06MPe+304AwYH+9JSpIHukkrj
         msYhQ6rZYWa8HlPg8jofzEwYIisYXyzCD2dHDLQZe0M9XIuso7NblssbQdhBIXM3Gumb
         zxSj4v98NHWT3y4NhbeheZ3ZQkPxXLVeGoro3sIOMV3IjoK9NUsjOd0lS6Yv7yEFMpXa
         XVrq1faiFZeIj0VRrlETekFJrbaoCjUf0ueeUmifrAZ8aECYbb87fbG9m3nA9rsgHvDj
         I89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790454046; x=1791058846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yMSXbv0RzpnT7LQIOAfBfWiKfyiEPbJB+JqeZgxSJQ=;
        b=KLTujmUgYocNZZ8woWIbABeUg8Xp9vs9mxE3ZX0/RSgNiB9tKJT1JN+SF9H1QlMBy3
         6jWohTAW+UdFH0/VaFw13RQ6cUYA+ivEUQPGhGcYz4p1/P85mTiNNX0Z5VlbFIPYE+Ws
         Ko7gpRVIoKRb5F3nL/4BIhppUGi57GfShFI01wWJrTVtW9YJGTsiR2odfRVzFcCYvWRg
         8uv6z/IEnmOtL51pkB5tSYQluZLNvH2Tyl8vgNeScR3VNRK+VxY7STxDz42CDMcTgXg3
         TyuHw8gP7Lr/qHdjOUUtjH6J58Z3jLR2Dg9hVeqBKxpCNaAHBBZEgF7IdxWUXeYzfms+
         yAeg==
X-Forwarded-Encrypted: i=1; AKwUvBz+AGjpcKzK7GkSifok9RZuqLfCTM5BrjQ/4khL4g5uvS1/CbnuZWvKRvhw03y7pDBAwKSDneSNJkfT4pQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mg4kLw1dMNOzgIUb/tupPuR27c+4GeFVxfYw+haf25+bxT7NLK
	oQw2WYU4zcQ+NbI1OEoplk9w/QyiluhGN9W4ZhL5gut7g/n3n0F/wjmH
X-Gm-Gg: AYBFou0VC8hhLgvKGoQHgcZx5EykXT2M2HpSrlj0ys63YHkSsvXKAODlwTFfllGAZcX
	uURKBOBG//WjbryDfW+uKBDuDYytU++YPOYKfQDzb/nKNS2xUG6cTEUrFoMn8qzyjHKWn0fmGYa
	pPoYEAA39366rsBg/W91LXhuPiaIoczSAvVDTetUcgErd7tjCfRhq3rJlGY64RbkUEVfmEiE++T
	2OWE2HKInqy1L2lbsrPHDygSeYyllsrlEGMoyEbfY0BVfX7s1ZNT/6RjqXgIq2DqdAar2wUv00J
	rai4042J5IEXAHcpx6tmvckm6T+wyRAb3DvuYGHeCXKw9IyswkFdyWSrBYM8E5+knmfgJUyALKi
	axkf5XMO5kyhMVILJKK506nJI9XRdJw68yxA8DYShGtS8O32wSqqrC7HM9qt3r/qFnItsvpsQYa
	yI4JsNFDfery2zlofXw3iVynU8vp92c7oSuW+zZ32J9OGvvoV7Baw7YQeI3nBgzV5ZHVArNEGWg
	Nu4IMHJKCkH+uQBlRv9LA==
X-Received: by 2002:a05:622a:15c4:b0:530:178a:9dd8 with SMTP id d75a77b69052e-5330b556ae7mr122052901cf.8.1790454046528;
        Sat, 26 Sep 2026 13:20:46 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332238c585sm25325811cf.20.2026.09.26.13.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 13:20:46 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Dongwon Kim <dongwon.kim@intel.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] drm/virtio: Reset device before deleting virtqueues on freeze
Date: Sat, 26 Sep 2026 16:20:27 -0400
Message-ID: <20260926202040.1313385-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtgpu_freeze() waits for the control and cursor queues to drain and
then deletes the virtqueues, but nothing tells the device to stop first.
del_vqs() frees the vring backing, but does not provide a generic device
quiesce operation. In particular, modern virtio-pci keeps enabled queues
active until the device is reset, so the device is left DRIVER_OK with
its queues pointing at memory that has been freed and may be reused while
the guest is suspended. virtio_device_restore() only resets the device
later, on resume.

Reset the device before deleting the virtqueues, the way
virtio_gpu_deinit() already does on removal.

Fixes: cad6a879a7fb ("drm/virtio: Freeze and restore hooks to support suspend and resume")
Cc: stable@vger.kernel.org
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 2aaa7cb08085..52c174f9bff7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -225,6 +225,7 @@ static int virtgpu_freeze(struct virtio_device *vdev)
 		goto err_resume;
 	}
 
+	virtio_reset_device(vdev);
 	vdev->config->del_vqs(vdev);
 
 	return 0;
-- 
2.43.0

