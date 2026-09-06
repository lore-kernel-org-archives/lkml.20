Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B87F145B3F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788697974; cv=none; b=rvm4oZ33cPr627zi+BPSK0I1RuDov1zJUKlL2UE8xRaPlpIRNmYGCg1WbeEmkUpZL4sZ6zss4bOxbdeCNdraM4JEKiAhKj+j8C5RO3mbeeJYdrjEb8hhJ5xpRyWUjQU3l+6vruXlu0eIC8GUDfDlSuaeY4EnxPTeWcvh1JGXJ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788697974; c=relaxed/simple;
	bh=QZpRjrHV+J4MMT8is78qjt/sCIzgcyFx0mMCFc30Gro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E0ZHrTrqFLUO0e3M7eUAxWF8OQjVAUnVYfd6qQ1laaXe/n7m5zgiAxmdHRJq2I2Tql8o9nzzS0TDT1T+Imqa7yttOpWbJ2RMmvhWnjPWZZSff+rbs5FTGLtk8AXmk6SrZQGQXKBNg5HKv6OA+i+KIgfg2fqGgbakUX1MhqWxANU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3pa+Xd5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3pa+Xd5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d0726ccc2so6118815e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 05:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788697971; x=1789302771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jIibNgs8Krb7tg9X0n9WFATE13lNyIMC7DEY7kH1e2s=;
        b=E3pa+Xd5L2QTd+u5ohrvljLYXn7SyYO8d4hL3eHRHII3LWI5ZbFtRX0cPIaWkAlsH4
         0BLpGteEQI6/ZX/48k/UbTPhQwV1eQAuNzDEqZcYJssT3WpnxLVytL1ARdOu9N9LsJmc
         +771jqF6MEZHv/ePrFWATHLVNxcbuRTFF7Suv53x6oql6p3i2qOT2iY1j5eBucysouUS
         vwfBZ7SZNPBhepcVQ/GluJrLLfzz428MZ+yLu3D0hM+kNzmZJuMV9k6Abgm0wmv9V8Qj
         kj1Ab0ShcweKtxfWg2B6Brngf97CrWgooeJwKPkBFDVCpV1pb+AvPbMckDgVbmjtSa5p
         SZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788697971; x=1789302771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIibNgs8Krb7tg9X0n9WFATE13lNyIMC7DEY7kH1e2s=;
        b=srsg1PZq4EKbu5oyKmw8HNkz+jC0UO1rQFZpf3lwedXhUYzwE/JReosiSaj/VIuMOZ
         iM3aFB7rFPAN2sxXmWVp0DqdvaWoap8U2n0KqxSP/iAwQq6TKeHQ4WA15fkLdKKSEzyb
         kMn6lGvpArKhpKfGlslGg65S5p1C9Vkpd0Qxc+4O0+Xvmc1r46ppjnUhdPxWf7TT0zkf
         Ozcq0g2Xkdh7jSqgGpy/xQIvb9OuCbkbauxL9ffcQzsSgRQes/nnSr4GDmmVb5FIUOMS
         IysBd80lWxIW90X0gvQ2GwzwlQeIwRBYul44MP0AZ7DUUmFnIXuR/PWVwSK6Zq9BzaZ4
         YuqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGwNKpTSHzAIogm+5BlFT+J9cElw/wgEKYPoNEb69Mq+zoD0mBqzf2AkEJcyyhCHjtcvxjB3VE16ctUIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lKegqcUgLOw1bEPBwVh/zLrqBaGKBGcDHFBcxw5CiulxLFk9lY
	amMW4xadlL1v9aZ1T/UC4aaLbSuTdq5kZQ7fp8k+LcQezJWZ42v3t3gL
X-Gm-Gg: AYBFou03iqd8VIGPs6HFjNFJTLnAYCPRP6roK0fKNnlSgt2sHh41e49CyZnA4Cuiuj8
	kULa0AHEnXzJqX6vFp3xWGfXAAbqtRhc+rQupdlmA6ct3EHvTOJdMr32JGgOEH2EHT0OGOcJRtp
	+WvK4SRnsggKgK/lX5/ytvz/XAPXrCbKXIpwP/ghKOmgUfGnsSANqd0BfWL7j5XlRmciZ4dhnw2
	VNMW3dMyv8bN4Zj2d8Gwe5ukLxRQmoGFp1y2wb7fVyvrR6dW2Gl9E0nuomRhlFWiIf3qZKi9Atl
	dlN3hmjUD4+A+FsyjewLw1vbOyypx2K2yNJO+d+I8+jjVqcDNhG0dnHLHuR02m4kwrEjB9IqG3G
	uKRgToJFlVm6+3MJK4TslWVvDVo74IRAkcUys3NBm4r/ij5uLLr7HO+JwkfPgf3x5AyMM3utfor
	iLriEZ0LxCO0Ou99dh0hsnhKeHKZc5nUZAFv0pM8rIq1XI/YLKN4x1tGjfMgjTwryFWmzm
X-Received: by 2002:a05:600c:860b:b0:49c:ee20:e787 with SMTP id 5b1f17b1804b1-49cf7fe62e9mr350730675e9.1.1788697971132;
        Sun, 06 Sep 2026 05:32:51 -0700 (PDT)
Received: from SurHub.localdomain ([102.218.51.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023edsm307138535e9.7.2026.09.06.05.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 05:32:50 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: nipun.gupta@amd.com,
	nikhil.agarwal@amd.com,
	alex.williamson@redhat.com,
	Abdifatah Suruur <suruurism@gmail.com>
Subject: [PATCH] vfio/cdx: reject non-shared MMIO mmaps
Date: Sun,  6 Sep 2026 15:32:45 +0300
Message-ID: <20260906123245.10884-1-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vfio_cdx_mmap() accepts MAP_PRIVATE mappings.  A non-shared mapping
with VM_MAYWRITE is a COW mapping, and remap_pfn_range()'s COW special
case in get_remap_pgoff() then overwrites vma->vm_pgoff with the
physical frame number:

	if (is_cow) {
		if (addr != vm_start || end != vm_end)
			return -EINVAL;
		*vm_pgoff_p = pfn;
	}

The VMA is inserted into the device file's mapping->i_mmap interval
tree keyed by vm_pgoff, which VFIO expects to be the logical file
offset: the core links every device mmap to the device inode's
i_mapping precisely so that unmap_mapping_range() can revoke all
mappings associated with a device (see vfio_device_cdev_open()).

A raw PFN in vm_pgoff lands the interval tree entry in the wrong
coordinate space, so unmap_mapping_range() cannot find the VMA and a
stale MMIO mapping survives any revocation attempt.  Without this
check, a MAP_PRIVATE mapping reintroduces that corruption even with
the logical-vm_pgoff fix in place.

Require VM_SHARED as vfio-pci, vfio/fsl-mc and vfio/platform already
do.

Fixes: 234489ac56130 ("vfio/cdx: add support for CDX bus")
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
---
 drivers/vfio/cdx/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/vfio/cdx/main.c b/drivers/vfio/cdx/main.c
index b31ed4be7bdc1..6d208db0896d6 100644
--- a/drivers/vfio/cdx/main.c
+++ b/drivers/vfio/cdx/main.c
@@ -271,6 +271,9 @@ static int vfio_cdx_mmap(struct vfio_device *core_vdev,
 
 	index = vma->vm_pgoff >> (VFIO_CDX_OFFSET_SHIFT - PAGE_SHIFT);
 
+	if (!(vma->vm_flags & VM_SHARED))
+		return -EINVAL;
+
 	if (index >= cdx_dev->res_count)
 		return -EINVAL;
 
-- 
2.53.0

