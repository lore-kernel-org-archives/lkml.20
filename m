Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E72191F94
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788697968; cv=none; b=QWTfpmYqo1beX6ARHT8uwtbU2SAvT8cw9TMTQ67n+xsgRFSZpJLoDjIdrFj2zpq1nt5YnXygz5MdCr0Y2O9dd5KF+RelwGObtYpe98irJBQf3OLNd6C9pD28lNjhwopjkf44gHVuRXQ8Fr6ogSYBWrUCABlM0mqke/KFOKWmPYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788697968; c=relaxed/simple;
	bh=sguKYoMM16u01ZuI3nbB6NDrvXLR50b8W9WG1GStR5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sIqN/4kSMsTNd+YpYLdtq9JIpKm31Mmg8s7+RF2eZoOinNC2JA8OrxkyWtrgxe7Pm+hzyj2hN7bIuRuuek4NVuXc35S6EEuw7J50DlxwXKh1CBLUxPs9I02ipXN1DthfPocVwrA/D1ZhmFRhPkGq3rCQMAgPzNjCHN7j4Vv77XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hi+6mdFG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hi+6mdFG"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d0726ccc2so6118575e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788697965; x=1789302765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zpji3VV9wlpDiX/8ryiSpf8k4yghCZmWbJA5NViszTA=;
        b=Hi+6mdFGl+VILKpKwQ6OjDdkNs3CbjJgLJaB//xaOTCp8nnPP87Jxn3jxNoJ38SExG
         IcU3xl3eZ1NJ0o1J1V9UPmQ2lYaSfrfkGlV0O2eHxASoT3B3IB43Skcg4CUZPFO1sCLt
         pibMZeNSPZeiWcpAIKxoP1hInZjy71AOtnLlRF2gyJqvK41UmJzRacJWDWJtieX3jCEM
         uB8sjXCX9y/RUSP4qQoqtjRNyy/UkKXZhC9omA55kiASkIQN2yEr0QL4lLBcLO9i4VF7
         mLdfRRNsg0YSBmRiq0jPE07PSQvjb9ZR3Fdr7Z2Gceb4sE107k7wswpdKk0a7YDiA5Mc
         8f5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788697965; x=1789302765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zpji3VV9wlpDiX/8ryiSpf8k4yghCZmWbJA5NViszTA=;
        b=lghdNYdf0ov/BTFJaPnekINIGP682G+4i5Yh0/cAnPkv3bCOHNfrJYh1YF9aws6Gte
         tX9n4ys6Z9bd0XdY/pdj9x1qJqDWWzkYYGso+oxlMJRlTxRfLNjC+aUvOLiSQmYssyb5
         cxdj1j8zTaJC9RE9IiBXzqMWS2US62wRNfVMFQURV0QfeAIkK3/zv9vQTuAqoo+XYOCU
         xxYzqO9n457RZcMTlNevc4YxzeI4DkzNMjIEOq2huzbXpBb1twP3QGJ1gCtJ1vxeUfBC
         7L3dJqJwXkcSD/4T3kdTTJR3G4/l6Rzz8gOUeKZSjJxSWcLlCnuFqfkDIsQ8m+8gRarN
         UXAw==
X-Forwarded-Encrypted: i=1; AKwUvBzpBgb5WYztBawMwORaJh4nCPHRqDxOy/cz+FwHmECx6Qek9hEy1GdlJnvE2B/M5jxm/BwlVJR3MvNd3n8=@vger.kernel.org
X-Gm-Message-State: AFuF++ki7+HJz/8cGNlNhqZcyoxQJxgWa0DNydnc9c7ONTWkgaHxsWIz
	X1/JgNGaIGRAavq3P4LMfY6ZWr+9wJxv4Xau1kpbe/mzk1mRbQB7yD8G
X-Gm-Gg: AYBFou0ebpC1CtCSqC2v/mI09ZLJP3wnKkvaOHfksUrvFwQxwo3FxP+dh3bUexr7IvV
	R+bJgnuST/rJXyPu9VyOpEenGbgm8xrnDK28wQk0PUqIsrcceaLAiv+iE7eZ3BjWU2jH3jW3/iN
	KDgl3vPpr3IU+Stohq5wIcv2TQBZP7fe/6uL3yttpiC4BRfwOCL8PdGuOeCDvbI8mO0Jxy5PIK0
	xK7J+DdxRkjqZWJG3lzrwtO62k+Lgl5JO/7nDu9acw16jOd3IQS09Dc3dxbO4eVWBguSJVWcEzz
	MnBRX36aPMNU/AyyAxF7urrdHEc2+YVv5UJ5NAcG9enNDfFiDKLhRWq0V/01AMS9dMX9YicU/qA
	kgxHKXB4FDGTmTNgiP6n/ptovFV4C2XaKyPSqGnhYM3gcchlJJ2Gtc+t1vVbixeQrJ+a5avyqj2
	v6DTqxFAX88gD2VXIlHuoO4l9iUCB4+GCsyfarChyjv5J1ryHXalqqlM3BaE7whN/r3zuo
X-Received: by 2002:a05:600c:860b:b0:49c:ee20:e787 with SMTP id 5b1f17b1804b1-49cf7fe62e9mr350719575e9.1.1788697965389;
        Sun, 06 Sep 2026 05:32:45 -0700 (PDT)
Received: from SurHub.localdomain ([102.218.51.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6158e9sm313653625e9.12.2026.09.06.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 05:32:45 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: eric.auger@redhat.com,
	smostafa@google.com,
	praan@google.com,
	alex.williamson@redhat.com,
	Abdifatah Suruur <suruurism@gmail.com>
Subject: [PATCH v4] vfio/platform: prevent read-only region mappings from becoming writable
Date: Sun,  6 Sep 2026 15:32:39 +0300
Message-ID: <20260906123239.10858-1-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vfio_platform_mmap() rejects writable mappings of regions without the
WRITE flag, but leaves VM_MAYWRITE set.  Userspace can map such a region
read-only and then upgrade the mapping to writable with mprotect().

Clear VM_MAYWRITE for regions without the WRITE flag, as i915 does for
its read-only objects and as fixed in drm/vc4 (CVE-2026-68445),
drm/panthor (CVE-2024-53071) and commit a5edadbae57e ("ptp: vmclock:
prevent read-only mappings from becoming writable").

Note this is defensive hardening: no in-tree platform driver currently
publishes a region without the WRITE flag.  The guard costs nothing and
keeps the mmap() interface honest if a read-only region ever appears.

Fixes: fad4d5b1f042 ("vfio/platform: support MMAP of MMIO regions")
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
---
v4:
- consolidate the duplicated !WRITE condition into one block, per
  Pranjal's review; no semantic change
v3:
- use 'commit <sha> ("<title>")' style for the vmclock reference and
  point Fixes at the MMAP support commit, per Mostafa's review
v2:
- commit log now states plainly that the read-only path is unreachable
  in practice, per Alex's review; dropped Cc: stable as there is no
  reachable issue to backport
---
 drivers/vfio/platform/vfio_platform_common.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index c72db5a99ebda..ab531318f170a 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -591,9 +591,13 @@ int vfio_platform_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma
 			&& (vma->vm_flags & VM_READ))
 		return -EINVAL;
 
-	if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE)
-			&& (vma->vm_flags & VM_WRITE))
-		return -EINVAL;
+	/* Prevent read-only region mappings from being upgraded with mprotect() */
+	if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE)) {
+		if (vma->vm_flags & VM_WRITE)
+			return -EINVAL;
+
+		vm_flags_clear(vma, VM_MAYWRITE);
+	}
 
 	vma->vm_private_data = vdev;
 
-- 
2.53.0

