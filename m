Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425062;
	b=S5/OFE2+/hZbLztwVSpHlxmzpXtfXJDrPBrNLR5j/mQ74m6U92aEynfM1RvZl25Az2ER
	 4HCgLLpPl4DWsV3ZZmYsWQ793yKu8DXM+RHnqmQxMcAtE4WbSGNZUzroIXXyDrlcKki5o
	 nlCwVgfygVk4a+R6Y2VngMwGFFwZ0yyIIotqrnN23gupawW81nwsnSBYWwcmSe4RQ0Q60
	 fxyPyGcIjZnkjsY/ZHfJsR9+1tJk2X0tQ7p0jKHL++PXFyHSHEJRBaIhunEmiGLBW5jiS
	 PuXErZThVUlXoJPJyt2wNyC8hM9u/fHcrnM2nuNlg8LzfZ3Pz7SPPtSVSqBWp6mdyPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9sL5fqWbHi6g8R+z+W0YnlVdwW61K08vu/pGLyPlBpM=;
	b=cm7WWPJ0C4eJSF3PdBOOxsfoUAC8dHjj69OaV8eRgt77bg7kRQGgklL3otP72p14KzHL
	 q35posEpt617JNJ1NmRksXlsoqFsMXjrkxhIXVDjmA7rbR3puoE29LbpfdS5TxbEDlwlR
	 +FkMBKr28J8g4br2pE+HWZYopXq8TOkgjVPUY/Bj5C+gtuN1oBNMCuZFsECo/45mVKjFI
	 nDk6iuubLJ0Y/mRHSUHj+TmEXL3xjQR2UykhNY/2DEt0qZFvRCRMSIArK8qVb+8HUMTCq
	 lBq/2ivi2YJUVfuTT1U2z/w/01OG484xM3X8fgWHOeBRJOOXQNjDTon+ywvI3svOnqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pZTOcxAM;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30BB60A263B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F30BB60A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pZTOcxAM
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4574f1cac98so5016402fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794425061; x=1795029861; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sL5fqWbHi6g8R+z+W0YnlVdwW61K08vu/pGLyPlBpM=;
        b=pZTOcxAMe2HFmz+bPshkgOR+7KO8iHxJ+wj3Rb1mEHykp8ygXHT1yX/VZuKQEzNyFZ
         OxzCcEtd8wsygn6pbQtVKusfgOYUdMPixogPaHOp93IVkrj6RYyVIgGsUsjc8Tyu89vS
         9WTbfZpYCQHLnbKoC9o8fA8m6ivSKeiw48VhetF/qY+RnFeAXz91CqaQCXAG9qE+NcSL
         LU+e+nnwoZhhBCX21HvZEklDzQxLNbCBbCR7AOJ72AE794mG2MjWDQtVBGcLvM6Tch/b
         9Fk71tqKxbDj8x8gleLdF0UWF/JCtrJgc12gX45P8vYPoLBi4ijOxEBv8bvv1SThw3Lp
         iJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425061; x=1795029861;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sL5fqWbHi6g8R+z+W0YnlVdwW61K08vu/pGLyPlBpM=;
        b=1J4JFmu+NE4twHG8rls5vXWf+pdBv7Su4qgn8e3/GsOx3ojAWSN650G19VAIdVdcqh
         w2veUP4GZxa27JJdh/2Kc80ntFr8OZWjOv4jhdzANJIA5aEOHObvHpt/+3XGS0RZY/Xa
         jjSE/pPO71evp1LN3dEG3FFH36PdplkxOh42A62+Plog0wSuNlE6cKPAeKuuKkixmLYf
         PSzLCXVOFbU3mZx8xB47PzVHN4fO7AZ5nTQ1yEhewAXUkAGw5hI2T6rW9rk/AnclJZy3
         FeAJWIgRNo2hpknLLPfBIQ1BWqQhQ2SbdKI9osQoHZbder/oqfP0QfHL6T4RcOt5lvX1
         zmEA==
X-Forwarded-Encrypted: i=1; AL+hErHney6EGJlkXHcehRbvy12uo3R5MrPsQ/MxqRKRBm06aQ+eZuIJjj4A/VlUG5BVRjzofkNapPrv0v1ltOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qi3jUEKhUbRQFgMD5FJDc3mn6Mml8AfEpiiGw6DpgU0UHr14Z
	kaMxFiDJYMs0w0nTfXndDLO2QitB4tDoyT7HrESOX66kzB+wUc+WrmOkb2kPyqwe+yJyjunEwcI
	BUnKY2sf6LQWyUw==
X-Received: from oabus13.prod.google.com ([2002:a05:6870:df8d:b0:4ad:8f23:4d1b])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:1644:b0:49e:f7c:fa52 with SMTP id 586e51a60fabf-4ae46ba7423mr2997611fac.36.1794425060739;
 Wed, 11 Nov 2026 11:24:20 -0800 (PST)
Date: Wed, 11 Nov 2026 19:24:08 +0000
In-Reply-To: <20261111192411.4133780-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111192411.4133780-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111192411.4133780-5-dmatlack@google.com>
Subject: [RFC PATCH 4/7] vfio: selftests: Add vfio_pci_dmabuf_create() helper
From: David Matlack <dmatlack@google.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org
Cc: Alex Mastro <amastro@fb.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Matlack <dmatlack@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Matt Evans <mattev@meta.com>, 
	Matt Evans <matt@ozlabs.org>, Mina Almasry <almasrymina@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Add vfio_pci_dmabuf_create() and __vfio_pci_dmabuf_create() to export a
VFIO PCI region range as a dma-buf fd via VFIO_DEVICE_FEATURE_DMA_BUF,
and preserve -errno on failure in vfio_device_feature_ioctl().

Native iommufd maps device MMIO BARs for peer-to-peer DMA via dma-buf
file descriptors rather than VM_PFNMAP virtual addresses.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../lib/include/libvfio/vfio_pci_device.h     |  5 +++
 .../selftests/vfio/lib/vfio_pci_device.c      | 33 +++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index 19d458adba1a..fd130f680a2d 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -172,6 +172,11 @@ static inline bool vfio_pci_device_match(struct vfio_pci_device *device,
 bool vfio_pci_find_mem_bar(struct vfio_pci_device *device, u64 min_size,
 			   struct vfio_pci_mem_bar *mem_bar);
 
+int __vfio_pci_dmabuf_create(struct vfio_pci_device *device, u32 region_index,
+			     u64 offset, u64 length, u32 open_flags);
+int vfio_pci_dmabuf_create(struct vfio_pci_device *device, u32 region_index,
+			   u64 offset, u64 length, u32 open_flags);
+
 const char *vfio_pci_get_cdev_path(const char *bdf);
 
 void vfio_pci_group_setup(struct vfio_pci_device *device, const char *bdf);
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index 9840463594ab..eca6eb13d7f0 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -153,11 +153,44 @@ static int vfio_device_feature_ioctl(int fd, u32 flags, void *data,
 	feature->flags = flags;
 
 	ret = ioctl(fd, VFIO_DEVICE_FEATURE, feature);
+	if (ret < 0)
+		ret = -errno;
 	free(feature);
 
 	return ret;
 }
 
+int __vfio_pci_dmabuf_create(struct vfio_pci_device *device, u32 region_index,
+			     u64 offset, u64 length, u32 open_flags)
+{
+	u8 buf[sizeof(struct vfio_device_feature_dma_buf) +
+	       sizeof(struct vfio_region_dma_range)] = {};
+	struct vfio_device_feature_dma_buf *dma_buf = (void *)buf;
+
+	dma_buf->region_index = region_index;
+	dma_buf->open_flags = open_flags;
+	dma_buf->nr_ranges = 1;
+	dma_buf->dma_ranges[0].offset = offset;
+	dma_buf->dma_ranges[0].length = length;
+
+	return vfio_device_feature_ioctl(device->fd,
+					 VFIO_DEVICE_FEATURE_GET |
+					 VFIO_DEVICE_FEATURE_DMA_BUF,
+					 buf, sizeof(buf));
+}
+
+int vfio_pci_dmabuf_create(struct vfio_pci_device *device, u32 region_index,
+			   u64 offset, u64 length, u32 open_flags)
+{
+	int fd;
+
+	fd = __vfio_pci_dmabuf_create(device, region_index, offset, length,
+				      open_flags);
+	VFIO_ASSERT_GE(fd, 0, "VFIO_DEVICE_FEATURE_DMA_BUF failed: %d\n", fd);
+
+	return fd;
+}
+
 static void vfio_device_feature_set(int fd, u16 feature, void *data, size_t data_size)
 {
 	u32 flags = VFIO_DEVICE_FEATURE_SET | feature;
-- 
2.56.0.567.gdb80ae8cd5-goog

