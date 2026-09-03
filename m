Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8574633ADAF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419993; cv=none; b=txn+Yg+GMiwWRHKgSgwiUhZYDQ24XdOKfhFeDq+FSPWsPlMRtWtlEdVvn25UziUnTn9fXyKKkUpa6jdyr6DBOiLFkpsyoYfQc+fLVovMG4yow7ovmYJYlvBs56bb9h259kNTOKYMqFPCGSjOfAdJxny3d/KddLshP2QIxj2a9Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419993; c=relaxed/simple;
	bh=bID5YgkMDYkgq+pAjBhjxhgYCZAT4H5TMvdFWMAkwBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MxUNzwFrvJ4k2WbOTSzagulUW28MrMULKujscz/2Kl8cYYFA8xJJO0Z8P/xbACN+eCq2s9JHDWsI6051TpmFuzUeMt4s5zivZwtw4v1ZjIZyV78nhCTh0WsGVKH5ejBS3VBMkH97ZURtgq2u4xKWCJ3OIFrZYlqxmrkAzVT6q+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRas2Paq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRas2Paq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b9320423cso19856945e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788419990; x=1789024790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5t+7VLBXCfNlaP9aaNyIt7RbKcSoQg0nvLVhl0jatU=;
        b=QRas2PaqID+FMny+GfJ7m2ORG+5e+wOGyM4nsDH3YzXwpEQzNRSyLHiZe9aeGfCOu+
         CATgtqnW5pKmGcNHhasgX8Av4soKMJiPMC0ztxUB+meUQGofB0pOKUD9atvcOeQLgU2L
         3VZuvAl3Xz7urbjv+rL+jGcoBsyEjNQ/CmrjGbi0JJ67wf5/e5+pxnaKFJSeoxLGPLKs
         G01F1H0KFEjuIvDsQ7L2Jb5X7HIAq4/9LuxjeZPzGIFzGRSDyUgQ2GYWUyLUlQc1Cb0/
         rsq3HhM7+PcNVB/nRSAm2C/6H9nxC13JfCq2ZgOYXAKTUl6/CFGDd5oMoJ/vEHoyl3Lj
         lECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419990; x=1789024790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5t+7VLBXCfNlaP9aaNyIt7RbKcSoQg0nvLVhl0jatU=;
        b=eMEZOUcEH8heN5ZVxPIWxu9yUGY/SHWVUMvFgaXa/ZuZhYtd7uqK/EQERBI/UfJ8z0
         H9PJCGKIUhYlm1gvQFNF8yFvqoiJZ4FAY17kZ8eErqNyFp2XU7699Ro7MsGf84u9Kifl
         fg4EJQa5r/hv24rB+gPA2CS9v8mtWBQW6NwKFNSCI9Ydxk9ma/AFA60TKseJkwhUVxt0
         E8CCWFqJyPML7MEdrMDS1IS3g+t4ThFZ5ExV8bFL9z/WGgcHqseSh7aeFT+ATd4NODag
         E6+sDGwI8SmurPw9X2Dm6O5NO+jNNJO8vmyAuhK/ZeCqI+U9RMwyRirEY+4CM6PflUM4
         dmPA==
X-Forwarded-Encrypted: i=1; AKwUvBy465fh77pDoYfR3HNzslkufiS/Ua9WY/v6Cgfecv7usZ1d9u1YMl6r42VmKZ5WYuMsUBEtIt35dE1LoHM=@vger.kernel.org
X-Gm-Message-State: AFuF++ktprz+YNQRnlr+sEB67KuQZL3taJVBjYzp8jnsewXXXn3kaTXP
	7eApCxIwZnVuNROAHvkkmhLkNjs6gvipiRnisza38jYVEoXBTjw9J1xYDGjhOw==
X-Gm-Gg: AYBFou2HuRlJVpdeLEGHn6lCu2yOSgIwCmbxL5jg8pdEouYvBKeouBefc4k6XoGhgEF
	5UeSxtNAQU/YQaS8YjpjJP6QIJGZQsW90D3plGRjcRcl/P5LcBAYwNMsyBt2rfHEHE9emyoaP4A
	+YmIjkulbw0gsi3LD/+tYxnF//MBeqq9tipzFcwoVpK3ge+whj5CMRLSvdOJWHOE2T4fzsLT7Mw
	RRk+447DyKxDiptd2D117xzgODi+18B9tqq4h0hVUQQq9zV7LrmVcQd5M/iNeHDJ9FfAB4xYAJH
	B+UlnSS/ZdLHZ8qOybTQKH3C4UpFxGC2TM7csNTbao0s7GeeuIpptJ+bWQ5R0q2Kc9lYYtugMcS
	Qqym17BPChgUA9fcWgeoNQxXf9BZvveY54msK0ajbRUt5X3bu8qCqys0mhw5uc5MOmZ/6UTZwfX
	wc00cCiGjJGnmKuinQ4QxqtZ6ghNTgOsP179GniGHN1Md7aXYEIRLf+HBDGTWh28ebOws=
X-Received: by 2002:a05:600c:699b:b0:49b:9205:45b3 with SMTP id 5b1f17b1804b1-49ce584c6femr181458935e9.15.1788419989424;
        Thu, 03 Sep 2026 00:19:49 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.114.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80745sm11859711f8f.15.2026.09.03.00.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:19:48 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Alex Williamson <alex@shazbot.org>
Subject: [PATCH v2] vfio/fsl-mc: prevent read-only region mappings from becoming writable
Date: Thu,  3 Sep 2026 10:19:46 +0300
Message-ID: <20260903071946.13116-1-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vfio_fsl_mc_mmap() rejects writable mappings of regions without the
WRITE flag, but leaves VM_MAYWRITE set.  Userspace can map such a region
read-only and then upgrade the mapping to writable with mprotect().

Clear VM_MAYWRITE for regions without the WRITE flag, as i915 does for
its read-only objects and as fixed in drm/vc4 (CVE-2026-68445),
drm/panthor (CVE-2024-53071) and ptp: vmclock (commit
a5edadbae57e2298a56cf7a4e774a027905a331f).

Note this is defensive hardening: the fsl-mc bus publishes all device
regions with the WRITE flag set, so no device can currently reach the
read-only path.  The guard costs nothing and keeps the mmap() interface
honest if a read-only region ever appears.

Fixes: fb1ff4c194157 ("vfio/fsl-mc: Add VFIO framework skeleton for fsl-mc devices")
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
---
v2: commit log now states plainly that the read-only path is
unreachable in practice, per Alex's review; dropped Cc: stable as
there is no reachable issue to backport.

--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -406,7 +406,11 @@
 	if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE)
 			&& (vma->vm_flags & VM_WRITE))
 		return -EINVAL;

+	/* Prevent read-only region mappings from being upgraded with mprotect() */
+	if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE))
+		vm_flags_clear(vma, VM_MAYWRITE);
+
 	vma->vm_private_data = mc_dev;

 	return vfio_fsl_mc_mmap_mmio(vdev->regions[index], vma);
 }
