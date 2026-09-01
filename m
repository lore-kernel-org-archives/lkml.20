Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9748D476069
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251577; cv=none; b=ikAV9W0oyyjDTl0LySuBYgT8v4EwtDCR15Q875OxhVnYAzxZT7iP1Lp3ggeJrs8PCBiVnte5FShx3vy3hBQjoanZfHYeD2rtHxRNa5Lq/OgoJgGHfHJG4uNGsw6y9Giv09Kgvk4feBR4yag60st/dm6YkzCFwlJbEyzQ79toc0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251577; c=relaxed/simple;
	bh=Ip8Iv+iFembpEn0IWSfxReidPWbJeB+QUFJM2cBws0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pWJnYBPz/LsVQOiFznHxrUd09IuCT0aLZq1ekjYFPNd77gRvQStibw0fmGX+pDVW1tmSsdwkCtct0s+xIo8B3kuSQ6PU7OGijXx8+3SC0Rn4DvlTfWM5/D6mgsgog5vhT+EMXX8h2O6wKAPBnVt6309tgQJTu7PoupmRWrK+/Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=RiK3yyU2; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="RiK3yyU2"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788251565; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=cJHq3RlU5vgxqPqGzn6DfL8ILOfkKoYtYaXl4nN92co=;
	b=RiK3yyU23K0HhjoUGu6kR8Z42WHjugQ68gRj7zBcbUfpRjCIgIbEucD2L7tCSnqwFuC1dUamQ11N4225SIp1R979Pw+FIrUfLpqTp9NETc0tljKEpPTvqmy6tHeu86YzO0AH/zdp5SRIMXfL0tyOkzMXWzzHtyW26eOfIuItyhI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R671e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=qinyuntan@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XA5o3s4_1788251563;
Received: from banye.tbsite.net(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0XA5o3s4_1788251563 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Sep 2026 16:32:44 +0800
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de,
	airlied@redhat.com,
	jfalempe@redhat.com,
	kraxel@redhat.com,
	dmitry.osipenko@collabora.com,
	hansg@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	leandro.ribeiro@collabora.com,
	daniels@collabora.com,
	pekka.paalanen@collabora.com,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Qinyun Tan <qinyuntan@linux.alibaba.com>
Subject: [PATCH v2 0/4] drm: create blend mode property on alpha-capable planes of simple drivers
Date: Tue,  1 Sep 2026 16:32:30 +0800
Message-ID: <20260901083234.1828755-1-qinyuntan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 860e748bddcc ("drm: ensure blend mode supported if pixel
format with alpha exposed"), drm_mode_config_validate() warns when a
plane exposes an alpha pixel format but does not create the "pixel
blend mode" property. Several simple/virtual drivers trip this on
driver load. I hit the ast one on an ASPEED AST2600 BMC:

  [PLANE:37:plane-1] pixel format with alpha exposed but blend mode not setup
  WARNING: drivers/gpu/drm/drm_mode_config.c:872 at drm_mode_config_validate+0x48f/0x510 [drm]
  ...
  Call Trace:
   drm_dev_register+0x1ce/0x290 [drm]
   ast_pci_probe+0x19d/0x3f0 [ast]
   local_pci_probe+0x41/0x90

These four drivers share the same gap; this series covers ast, qxl,
virtio-gpu and vboxvideo. Each patch creates the "pixel blend mode"
property advertising the single blend mode the device actually
implements, based on the following:

  - ast: the hardware cursor blends with straight alpha per the
    ASPEED documentation (thanks Thomas), i.e. COVERAGE.
  - qxl: the SPICE protocol explicitly defines the ALPHA cursor type
    as a "pre-multiplied ARGB8888 pixmap" [1], i.e. PREMULTI.
  - virtio-gpu: the virtio spec does not define cursor alpha
    semantics; the host forwards the pixels verbatim and the remote
    cursor protocols among its frontends (SPICE alpha cursors, the
    VNC "Cursor With Alpha" encoding) define pre-multiplied alpha,
    i.e. PREMULTI.
  - vboxvideo: the host frontend loads the pointer shape verbatim
    into an unpremultiplied ARGB image (QImage::Format_ARGB32) before
    handing it to the host cursor APIs, i.e. COVERAGE.

This follows the same approach as the already-merged i915 and nouveau
fixes:

  67e955e073c6 ("drm/i915/display: expose blend mode on alpha-capable planes")
  df0311845915 ("drm/nouveau/kms/nv50-: Unconditionally create blend_mode prop for wndws")

The ast patch is verified on AST2600 hardware: the warning is gone
and the cursor plane exposes the "pixel blend mode" property. The
qxl, virtio and vboxvideo patches follow the identical pattern and
are compile-tested.

[1] https://www.spice-space.org/spice-protocol.html
    ("Cursor channel definition" section)

v2:
  - ast: advertise DRM_MODE_BLEND_COVERAGE instead of PREMULTI, per
    Thomas Zimmermann's review and the ASPEED documentation.
  - vboxvideo: advertise DRM_MODE_BLEND_COVERAGE instead of PREMULTI
    after checking how the VirtualBox host composites the pointer
    shape.
  - qxl, virtio: code unchanged; commit messages now cite the
    protocol-level justification for PREMULTI.

Qinyun Tan (4):
  drm/ast: create blend mode property on cursor plane
  drm/qxl: create blend mode property on primary and cursor planes
  drm/virtio: create blend mode property on cursor plane
  drm/vboxvideo: create blend mode property on planes

 drivers/gpu/drm/ast/ast_cursor.c       | 3 +++
 drivers/gpu/drm/qxl/qxl_display.c      | 4 ++++
 drivers/gpu/drm/vboxvideo/vbox_mode.c  | 4 ++++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 4 ++++
 4 files changed, 15 insertions(+)

-- 
2.43.7

