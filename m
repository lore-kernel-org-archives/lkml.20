Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF67F2DA759
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789089178; cv=none; b=B8ZTWmZUeJCORncLS9tobXmURU+SBO+4KeirFZuffNr7B4LLfrJBxO8gTXiKwILvcq5Ub7yrgUvYlZ48bOEMm+ssxzQfy+pA8s4Sn2w9IfAiMI4JzvVP/ATymZHwFCUE+vAxJDthOp/WhMpo5+TJ0yVLk044piJbcuKNOv5+Vds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789089178; c=relaxed/simple;
	bh=aSoY/N0oGpMD3DwFVn0NoXhZY918z65CXFED2AS+aH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=liOfJyUD+JY84/yYsvMZBVPc0kqZBF3yw9tCVlD400ofjVT3aEjWjCnml49+xr1BQM6sH+sCxyMXSSBUAUZtG+haf/gwRMNJwmzKKgCSnglGc0F/Vxkqr2UmuSmXFvHqq2tTSh1MNiTvOvQ+Sxj/m6XVYQtl1xw4QXnBcm2zOss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pmfZcXJd; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pmfZcXJd"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ef1d0so4796951cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789089176; x=1789693976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uynqckbdmTZIURakBh8b2Eoz8Wxwr8hx5bA5rcYTljQ=;
        b=pmfZcXJdhj91h+nhKvWUF2PvvqfJE1fMNlA/dq8qjlUrp5kbGF6sWAYjyPioBuOsJD
         dePCW6oyYprlLZWnJAFna5WGIHT0WYPAyFGMAo3xN3i7UeM7vulgSyRrrv8n1Otj8VlA
         jmDmnmZaCIN4FwWJNuyxS7wdImSfTSPGzU0TqPom9qBEn5Sx1zKhDYZLTIL2Gv7433HB
         pUjqhyi12i2p3AIqNHg2bIvfoTuCQT5nbDPmwO7TzYyBVDY9TI/b1pakFwHepSqboocH
         Z5yO/WVXpLoKFZvDzUCQlyso0O+GopeyOHvoEn56M/mzJU4fWVltIm/XjkIl4V2EokG/
         MeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789089176; x=1789693976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uynqckbdmTZIURakBh8b2Eoz8Wxwr8hx5bA5rcYTljQ=;
        b=h//n6F1CpTCumP86ipxMcz4IifDPIG1mCpIVWKgXmXoJgltun+ClD6/eiNYhSGbrOU
         +OJOwPQGBrhZI4nyud1L7OG4wM5Dyp0Oa8Q6wwhlw0oZpmwUZ5lzgRu0N+oguFE6RudZ
         +s+l6274I8BkNCVx6XXlx0qaVweGfELZo9hqvu+Qa+F3w+FYl926CSv4UXP2biim1CBt
         JCVbCN5XwNPku+Bt5mYwPPtfmVUPttKkZ111K2/K4kLqAk3hYmafQ/LAaN8kipzI/qeH
         7Xj2kBV/SwoD4LKcNQ0Y6XtJ7yMCOxtY17vZa9PBOr8ryeesskAA+Ib3+ZI1Lta2MQG4
         PrPw==
X-Forwarded-Encrypted: i=1; AKwUvBwZAo0W4XFkaCcxGuJ1Lv+AcBiZEGjz8H+VJtT9H8xM35SED2V10l0KvNCeBSBnaJ89JGdCz5h04rJLclk=@vger.kernel.org
X-Gm-Message-State: AFuF++n3QDwlD3SppyxUODnmKgHhatzx5bp4l0QT/QoKsEt8Wek1CP4R
	wD7PKEfhvsSEGqS/zU9l/eZnZ32Ww6X8d3BMQj+JrDoJqEK/984SzJAo
X-Gm-Gg: AYBFou0Di4HDcq4Yr0sUi69o9IBcNiPzOab6vy5V82iwdoA3Zy6pCkjTbOLjXnsT68X
	XnWG18ae6i7mhpp16wdJzh4WPd4/LvcgmdKDJbhWtvqi3h8dIMTMQmc6yLB0CfeGKzueN06c7Qn
	iEy5zVap2BlDgXLgljBRslu21G9jI/1dB8bCcK4qpKazzb7GHqweuFRM0XIwefuaZ/igSkKplaP
	YqVDMpH58MtZfL6kyg1V40NLWpkoJT/DBxMrltMqx+5xJic/9RhsyG2AWz7AxhZIq4cyIkHLqqp
	lR6vZVdv2kLtx//iNwq4IyZyF4TP5+eKnIpXB79Ixxq1Qmx5xQOljCqtq+zPkGblHftReRzhELQ
	ggcI4Q+1uwmlBVi2e0YD5fGIcxYb6iBS4ZiZFB2W8SdZNAFfKU7E1ThrZ3SlsBr/u1Ivja6ksej
	oCXSmJS2xZDqUJSgtEl84pn0GuPqli0/J9uUx7Enb+E9EWxkLc51olvaFgIEjkFIfcJePaLzLEe
	a+SSCE=
X-Received: by 2002:ac8:7d55:0:b0:530:5434:e4d7 with SMTP id d75a77b69052e-530c86fd1abmr32349001cf.32.1789089175533;
        Thu, 10 Sep 2026 18:12:55 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ce4ec298sm4289851cf.16.2026.09.10.18.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 18:12:55 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: jpb@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	virtualization@lists.linux.dev,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] iommu/virtio: Reset device before deleting virtqueues on probe failure
Date: Thu, 10 Sep 2026 21:12:49 -0400
Message-ID: <20260911011249.1498825-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

viommu_probe() marks the device DRIVER_OK before populating the event
virtqueue and registering the IOMMU device in sysfs. If either operation
fails, the error path deletes the virtqueues while the device is still
live. The device may therefore continue accessing queue memory after it
has been freed.

Reset the device on error paths after DRIVER_OK before deleting the
virtqueues, matching viommu_remove().

Fixes: edcd69ab9a32 ("iommu: Add virtio-iommu driver")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 drivers/iommu/virtio-iommu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 587fc13197f12..fa72ae23b8afa 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -1227,12 +1227,12 @@ static int viommu_probe(struct virtio_device *vdev)
 	/* Populate the event queue with buffers */
 	ret = viommu_fill_evtq(viommu);
 	if (ret)
-		goto err_free_vqs;
+		goto err_reset_vdev;
 
 	ret = iommu_device_sysfs_add(&viommu->iommu, dev, NULL, "%s",
 				     virtio_bus_name(vdev));
 	if (ret)
-		goto err_free_vqs;
+		goto err_reset_vdev;
 
 	vdev->priv = viommu;
 
@@ -1244,6 +1244,8 @@ static int viommu_probe(struct virtio_device *vdev)
 
 	return 0;
 
+err_reset_vdev:
+	virtio_reset_device(vdev);
 err_free_vqs:
 	vdev->config->del_vqs(vdev);
 
-- 
2.43.0

