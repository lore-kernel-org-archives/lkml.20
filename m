Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDFA547057
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 00:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791505289; cv=none; b=PI7BJKp1GFhkTkQxTWV30CP4AGWTiYAzWNPYbQ5o6y0CIHtcmSJ+WP2zOGbJXmplWeqTCRyWDaG+hdA3h+bqUWjVzGuwy2Tvem3KknKMqFZEHZNGncxeViKP1JkJVWtDpO7gV3RceN+EWg4WwZeNgvX6fDxisye7MtJgYcP+qWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791505289; c=relaxed/simple;
	bh=I804m7pGplelst6v9HgcfUOuOhXmNC0zaelJCV9onzA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g5i193gBc+RlDkww+TQgn8lIuk1V0s3p2Wrq1CCEk9aQ6Ux06x080J/1MHkhG41S72kpv+ESk7hn3WY6Wc9Lc8INBcPWt86ZE4KvvfPIv4QGmNyyd+Y7RWUTdk8MOPPYwqK8wzhybibQUACL52LzXjIcyrxuDq6EyK2mT5sk7xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWSkvUgQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWSkvUgQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso29693585e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791505286; x=1792110086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WQqOqFaR8S6Kxc8KfBqHhYsGrjh61dZF/m/XQ0uNMYQ=;
        b=eWSkvUgQinvIJr23zsLAjjc2VZAjMK9dpclARF9Cq0a9LGwIB0JBFBcfuLAXRMfZ+J
         cqWhaFzasU/czcFWv1HFH6HisMof5ZQ8zuqq+kNUT+cwWppUGAKU33idoLuESkypRabL
         t5LiGioLICAH9GtXmdkWvnJOrLS4qM8ky15ZetE3I/S75y1W48B+cq9g6+sFUA+qOB3T
         WGuYz6DinWRgAfT2Kjc9SXyfcOOR8yGDTOzJZN+3DZEh6429UjDyAo8E2sTYX0fl6JtX
         hSvAWEr7wK1G8iYtARDJQIkZUtp3zSkqrBjFjpi3TrlFVB+9OTwfWlsPMqvHgzh3w6Kn
         eQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791505286; x=1792110086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQqOqFaR8S6Kxc8KfBqHhYsGrjh61dZF/m/XQ0uNMYQ=;
        b=T9TG+VQ1YbpoAjNxjYNrSwWhJWy407h31jCKUbk7+KRfZIzHdK6kUl2AJ3k2OCTOun
         bAVN30IrgcqtGQX6cvfNBnnQ73MDfNbgAXP5z7IyHtHwyKc6O5ycw5woWq/p+1RrNxFN
         9doWift9/GR8vqTDDprsora1sRHr0KjfIhWmmrmTGU+EhanHtEFzz4A7EVsNJaew+yvH
         ThwtfzhMgSBkN7iFLCTLdXdCkxA/C2MImhhcf72y2+Lq8D3JDIz4lNbeGnCBUUKULET3
         VSKvSGuC9R5SM2FrwfcrpjWUI9fiJ5yENqddAXfvCeuVT5HkMx9Ux9EP6jOwIl9W/Rym
         GeWg==
X-Forwarded-Encrypted: i=1; AKwUvBwE/OtcAs7vxXOWJv3twOjy/fz1W8ZpKZbAvnnkP5LDM4x5nGUnrJTceR4V2SfUJT7WUTKR3FZTTphPLCg=@vger.kernel.org
X-Gm-Message-State: AFuF++n+CY4ZBZ5CH10w2XR/mZcajqjd1MYEtkNJGZ0GE1g+MtLg/EJ8
	2/xt8CMsqKaSIlHtu/sAxPTX8sx7aS1a+sv4E0MLyHNiE3thw9JKDLjH
X-Gm-Gg: AYBFou1FYad9sVAT/3lqah0PNT9wRaOhIm6x23B4kCeBD8O9cv6KCjQH74DZayg6JGP
	18ONNlUQNWqfMAnhxzsp/gvyGI+kxqk2sRGSEPusCs6Wt7Q8hl78TGaoFuzlQwyUbioHRegpeaG
	6PmUbHoEbsMcqOIBN7FbW6yPjCfditet8oNjndcvmJRsJ2ruOlMKSFxxIG0kFjum1KMsoF1gRcK
	9QhlGr+AyPxM29XUZWhrhOhJ7Fhh3I5d3Kc+VY9/n+hrrVcsbHcW+Ec1SGinCShLVee4MFNwc8G
	xqSSUzyH2nFyNm6C1pxZExax+g4wQ2t3hflyjBVrokW8cyE/xAA2uQoBl7eVk/BLl8jGg2PzvrQ
	11lGkBt6TT/Gg+8QbjBa6MrGKfvEpOjmwZbKONEA2DwYhgEorHjsPuxzBulVPoc/Vk+BRPGgSjY
	hIwV55eli2lZgheef5HSbzzE1NYckwICt8V6EtTjVK2O/FI8L/86k9U/ZQ8wI3TVKEkE7hBajOG
	QflvUKs7ajpZQE0JpZdUB+bpK3Mash4gle2fOPu4gh1cSUjnFMTx14rkYn8Eg7GVr7vZWx9dMVs
	FQRM3XFTPRRuq2jR6WX/2kGpuIEKN9i4Uvm/uK/pkOT8VoiMx4rylDCdvk9Cwi0uHuRa6HXLS8/
	N/zDSf30=
X-Received: by 2002:a05:600c:524a:b0:4a1:8824:c9ba with SMTP id 5b1f17b1804b1-4a18e49234fmr2630825e9.18.1791505286061;
        Thu, 08 Oct 2026 17:21:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4987casm3364605e9.1.2026.10.08.17.21.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 17:21:25 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: iommu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] iommu, drm/rockchip: Map private-domain imports from DMA addresses
Date: Fri,  9 Oct 2026 02:21:12 +0200
Message-Id: <20261009002114.67851-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Diederik reported failed video-buffer imports on RK3588 with
DMABUF_DEBUG. The proposed warn-only mode [1] confirmed CPU-side
attachment access in rockchip_gem_iommu_map() during Sway video resizing.

This RFC keeps Rockchip's private scanout domain. Patch 1 copies live
iommu-dma mappings into another domain. Patch 2 uses it for PRIME
imports. Unsupported inputs keep the old page-based path, which remains
unfixed under strict DMABUF_DEBUG.

Rob's MSM approach assumes direct DMA [2]. Rockchip's attachment instead
provides IOVAs from the VOP's default domain, which cannot be mapped
unchanged into the private domain. Each import retains both mappings
and adds one reverse lookup per 4 KiB.

Christian rejected reverse translation in the earlier MSM proposal [3].
Robin NAKed exporting iommu_get_dma_domain() [4]. Keeping the helper in
dma-iommu.c does not resolve the physical-address objection.

Sharing the first VOP's default DMA domain, as Exynos does, would avoid
the translation but also change native-buffer mapping.

Is retaining the private domain and reverse-translating the DMA mappings
an acceptable direction? If so, I'll address the remaining limitations
before posting a non-RFC version.

Base: mainline 602042bf29f6. The warn-only RFC is not a prerequisite.
No stable backport requested. Strict-by-default DMABUF_DEBUG took effect
in v7.3-rc4.

Testing (builds and QEMU only):

- W=1 object and stub builds passed on arm64, ARM32 with/without LPAE,
  x86-64 GCC/Clang, i386, s390, RISC-V and UML, including dynamic SWIOTLB.
- Rockchip strict/warn A/B reproduced the control failure and warning.
  Treatments checked every page and byte in 83 imports each. Primary
  buffers had 1/127/507 DMA segments under the default 64 KiB limit.
- SMMUv3 strict/lazy tests, missing-source, bounds and rollback tests
  passed. Real bounced attachments exercised alignment and pool
  rejection with no target mapping or DMA.
- Invalid forced-SWIOTLB Rockchip provider runs are excluded. Expected
  segment-limit and unsupported-fallback diagnostics remain.

The rig uses a custom Rockchip IOMMU model and the real GEM callback in a
test module, not VOP2, Sway or a real exporter. RK3588 hardware, two-VOP
and 32-bit ARM runtime testing are outstanding.

Hardware testing is welcome, particularly with Diederik's Sway resize
workload. Compare control and both patches on the same base/config,
first with strict DMABUF_DEBUG, then with the warn-only RFC on both.
Please report full dmesg, config, exporter and visible display problems.
Keep a known-good boot kernel. DMABUF_DEBUG=n testing is welcome too.

Developed and tested with LLM assistance.

[1] https://lore.kernel.org/r/20261005064133.7305-1-kmehltretter@gmail.com/
[2] https://lore.kernel.org/r/20261006131000.81501-1-robin.clark@oss.qualcomm.com/
[3] https://lore.kernel.org/r/bd4e5ece-1358-4e0b-bb04-ba9de62d26f6@amd.com/
[4] https://lore.kernel.org/r/47bf9a4c-2a47-4e93-bcdf-8d953c9a5ab8@arm.com/

Reports:
https://lore.kernel.org/r/DLR74W1U9YPC.375IK0HOYHDIG@cknow-tech.com/
https://lore.kernel.org/r/DLYLA3WQNN3X.3FB9MO8ZWBQ5@cknow-tech.com/

Karl Mehltretter (2):
  iommu: Add iommu_map_sgtable_dma()
  drm/rockchip: Map imported buffers from DMA addresses

 drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  19 ++-
 drivers/iommu/dma-iommu.c                   | 131 ++++++++++++++++++++
 include/linux/iommu.h                       |  12 ++
 3 files changed, 157 insertions(+), 5 deletions(-)


base-commit: 602042bf29f6efde39cfb5fdd9289bf4854bc0c5
-- 
2.53.0

