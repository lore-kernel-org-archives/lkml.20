Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB3D36B90E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619874; cv=none; b=DwVERLhfii35jCyBzeaYgr/4uf23+CHYY1IeTzGWGNXpk6gFGxae8dMF/rbgrNq3eULcRKcwYJmQXhyR0vhp1/EospK0WpS4LS/AqZizy34OnzRWaqM+NxcvQr20pypOn5zjBxsinXV5gIgRdjsRJgaFF7qJsibW+/0ibKgcEps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619874; c=relaxed/simple;
	bh=2VHfLRIfl//L6nxU1RLK9B1KHUYa2JWZ2ZmYu7rexyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tklmZ69CKhqofTDJD0iXtKdJUDjWpDPve/DedznMd3XatwW8H5dBX/Igl38Ibe4waSu8feyxnvZ534rx4uoN74YfW9WuKYqjsMbXat+1FHTBkraLCaC1O/n37P958OTePpHrkeqooMPIq4iYlvp2kLGp3uZ7X90rFEENQsb4Ieg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jb3fzCN+; arc=none smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jb3fzCN+"
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4fbb45fdb46so247340b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791619870; x=1792224670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2ha4Gusp7rfS5qI3QalwE3wIPhVWRGc9MjXkvhjipc=;
        b=Jb3fzCN+1u67WcTkWNcAS5Xt7W/MizVEZBG/JWcrNs6QLexxMmLMkEvISO2YHHGAdv
         ws0Rp6GIOcMUf63lnQ0rW8IhrgXKupdwgYztAMS92h9jP6sr2+p+TTK9JJHhRzHW6Zrg
         Zi5BmFFkIZ/yJ40qfo2bkicmLhXb44k6s4rjQ6q5A3ig7aR+MrnkY5/WSnSOzAJ/kH+J
         r7DtEaa0ae9GLSQ473kwxmOR99wcKzubCsb2pnE0OSISa1XMK1+alcj6oLsn37R5SnM0
         6U6HphuawkaVbswyy5a8CdSXXKhuoz3/gLmwEDMglk8Qp3Fb5crrdJD+5vJl9Q4NDSv4
         ZZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791619870; x=1792224670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2ha4Gusp7rfS5qI3QalwE3wIPhVWRGc9MjXkvhjipc=;
        b=zn2fzsR5yGLyvoQjQd6ex4swr5fT5yChFkCSKnPcOP8fbHUcr5EI50Lhrt6aSSMKUP
         V5GtGpx9tYgHHgTB3l9L1tKCZwDtUvCY+IeKOGTTHOMsrni2wETft1MbqayLC6P64wCT
         l5Zgo1wmJ/bLNhXf36WHB4XwtPRjpP7kZyUOnkhGYpq0wVwC2UM+7iJjL9Nw9H9fy1DU
         MMPzTDqQN7fYma4B2k+7bjOw8XaUWL7gXCFM4V3VgixisBa8ZGpMJlJ1RX3w3tAP0Szo
         wn2yd/6enDxRZddyUE7sdfs2/B1qHgTgpb8AfJfWTM/BtQQcRh7ytULyJtSFQNUQyR7x
         bC/g==
X-Forwarded-Encrypted: i=1; AKwUvBwS6yx58pHiRdkH+mMig/+XoBMJt94yFkgn1Jie57sZ+bLzwt5Q20LCBWHdmuAt15mZ2xWj9tkv5MJJE0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/Jth0zKNyqHk3FpEdsmDqBIQ+D+lrOF/46KfZ9aF37qDqqgI9
	a4niXLEO81GRHgHIPAXR56pSll/hFqOwK6RuivhFmtLXq9jU/shb1yXC
X-Gm-Gg: AYBFou2cXnL5V23Y/eBu+/3YVZ6KGFzUMsPO8oC/f7YOIcq9yxuwInH9/xsXasbkYzF
	J6FngS+FFeq1hsM/sYo8q/TCmTTdEEoZqQ/w4mTmxAk8v/gMYV7ZRQcHLIow+RdrD+RA8VrYd5R
	eWp42i0n1HR0mizGkjze8LYdvRL2XZYhV+rS+co+j8pGSNwVtjSSI8lL5S+wSqNQEAVEfF5FaZo
	9tWNwusqduoN0dFrUKxgSBkr2q/WAtxACOwRgWHUNruwgwYlF8LCxDtiEsu7GPoCh8mJtRKDwNc
	tzUI59k3lrabjahVmCMKAeShPX8Y6F1TTIqUqYaGe7ewWra8AWF28Zn1F3UpvgS2bmmc1MF+gbV
	IrkM1U9sDTIkJ6sYIOf85YGsn9jXnmFJwhHtayX6zzuRXhYR9bBuOCFQZVCtpQuz8BLaP+AMv7C
	S01SziShfzp3id4/I/kLo7oxTEUFvlbtcDjfLTBvSKV3Q44irC/PwYGuuyCqIpMaqBOcDsKdBmr
	4ryt31y9HgUMoPxDD8PFK2gruaHgAqMuQWyb3bnpMci9nz1
X-Received: by 2002:a05:6808:f8c:b0:4c1:f40e:b697 with SMTP id 5614622812f47-50c56bf8ed8mr3581941b6e.38.1791619870362;
        Sat, 10 Oct 2026 01:11:10 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.38])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c16755587sm4665356b6e.5.2026.10.10.01.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 01:11:08 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: David Airlie <airlied@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Junrui Luo <moonafterrain@outlook.com>
Cc: dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/virtio: reject mappable HOST3D blobs without host-visible memory
Date: Sat, 10 Oct 2026 16:10:59 +0800
Message-ID: <20261010081059.3096312-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtio_gpu_resource_create_blob_ioctl() -> verify_blob() validates
blob flags, memory type, context and alignment, but never checks
VIRTGPU_BLOB_FLAG_USE_MAPPABLE against vgdev->has_host_visible.

For blob_mem == VIRTGPU_BLOB_MEM_HOST3D the blob is created via
virtio_gpu_vram_create(), and on a device without host-visible
memory (plain virtio-gpu-pci,blob=on with no hostmem) the failure
comes too late: the GEM object has been allocated, a host resource
id taken and the create_blob command issued when
virtio_gpu_vram_map() returns -EINVAL, and the cleanup calls
virtio_gpu_vram_free(), which is a no-op while bo->created is still
false (the host response has not been processed yet).  Every such
blob creation permanently leaks the vram object and its resource
id; /dev/dri/renderD* is reachable by unprivileged users.

Guest-backed blobs (VIRTGPU_BLOB_MEM_GUEST and
VIRTGPU_BLOB_MEM_HOST3D_GUEST) mmap through the shmem path and do
not need host-visible memory, so only the HOST3D case is rejected.

Commit 036d28db1818a ("drm/virtio: release the GEM object on
virtio_gpu_vram_create() errors") fixed the sibling error paths but
missed this one.  Reject the impossible combination at ioctl entry,
making the failure mode unreachable.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: 16845c5d5409 ("drm/virtio: implement blob resources: implement vram object")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 81e70a12b3569..e3edade4a62dd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -533,6 +533,11 @@ static int verify_blob(struct virtio_gpu_device *vgdev,
 			return -EINVAL;
 	}
 
+	if ((rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE) &&
+	    rc_blob->blob_mem == VIRTGPU_BLOB_MEM_HOST3D &&
+	    !vgdev->has_host_visible)
+		return -EINVAL;
+
 	params->blob_mem = rc_blob->blob_mem;
 	params->size = rc_blob->size;
 	params->blob = true;
-- 
2.43.7
