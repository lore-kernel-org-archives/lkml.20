Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A103DD85C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651652; cv=none; b=a2/i5Ue80iF3b3aralsQexdhhDhwJ+qLpmHHR1urSWaWmTAO66hhI7rqA46BItl5R/3kADW4BxNUihHa1+byZQLSroR6pHHvkXKmbUarPoeMxqo8n+jS03sxpl3sUp7aQx7TUH0d5GqhX2ATPPAhYPMXTwOW/x4L15irkl22Ev4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651652; c=relaxed/simple;
	bh=E0QVRun1Rtl9by+zxe8bI3xBduqYg8w0MLEhejpTV+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pQ5A9ELM0vuGt/AJPs6Q368NohZcA+YGU0mCU3CJDRjl4z/JRW7EYEJMcJuvwthfgi756q1RvYDzYiD6mPTXRwYYSRtmj/Jqnf+c4fHJydSjIlUsdyP0BvKhbv5sgljG4AYKDbiJQSJB3KmMZbqPNTLHWjfGzY53m+QMI+AeXto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQzADro3; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQzADro3"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso1830220a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790651648; x=1791256448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8KiajsX9AXzugaV+rM1roV/GBOKr61T0qmPfAwnIkdk=;
        b=WQzADro3Krynyh/AD2dkfeOJRh67/+ZdtkQvOV5nMrZQBGiF5aaGluYk0LO8edJ2qy
         HMjEtGSn4SnXDVmXzO6OgndsL7OJUZiSFAzcry0H0+g9AlrWgkmfSgARhF1o0MKdkI9D
         WhR3htwSfJJf+bsKVKKGrH7z+PPviBHdIZHvImBO2OkbVmAHp+gQk8jxFc3Xr5oiw/O0
         34DDtXFTH+StQuOymBsUH0eLOlu/y2Yg3lKnoQ/qsbfz7Cb3n4JVvQywfC6Q2+6h1Xbl
         Fnlyun2l60H+oYUD3o666RnOi3wMjROoziRcRD4AUKzQ5EhBC7mSI/sDCzAaOPYC6hg2
         iN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651648; x=1791256448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KiajsX9AXzugaV+rM1roV/GBOKr61T0qmPfAwnIkdk=;
        b=t6v3zzAlaYwsuVDMpkEzFYp9WvCWQsUj2bwv8Aq86jqa6fcJiTtwYB2MPmRloys2Ep
         /352DrdjYrI2OkMhADcNfQTE49CkEFZiQcp0vVn1jAEBx7PAK2wuZrMLCCxr0rEN2T5j
         l+s6fdlVKiNYc+SFTIeJwtSc0XPUKg3VcyZQ6GHjvbH6eTN8GKLgtQ11DdQaKuCQFUOZ
         3KQhg4+tv4Zw4KpPRvF/+U2SHwN1ADyZnB8LN6j0e/vutmOxz8HWNBfyDJDmcs2+SjYR
         BKdkD8EXxeGiytxuNbxIMGY5QkhJCimmudZe1wym+KuMhWPqPpccrXJkseUzJW/k12y5
         Iq/w==
X-Forwarded-Encrypted: i=1; AKwUvBxACAtIw56P32R8IEZ+bssL1uK/Dd5VuynMShJKwkHc+MvmEp8W0ZRNRxvhcxureAcadRhaG9/45LPXgmU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVeYRWCcgbQ2RBoW9ppvDtw+5oFV55Vl1Ep4AGukHJnP4Rspxe
	G/TUPGDjxai3eGAHxcG8/dh2M0nEiORnmC+jukOi0gaGMgKqdVWn+x8=
X-Gm-Gg: AYBFou26Lgl/wQDcQVIT1L87qV/W1fsGTE+4E8kOn8/eLwCU8J4phGM2f8go6HVTCKW
	s+7vdcTEaR9flKhfkpNsArvhJfNokyphWyBlfBRklnzGJVMM8Bfo0VE3aalchn3qCS+HVIQm3yM
	Y2KlhCyBNXAL/wnETwROaPhfbxTLsd+DtnhAar28IUy66/Mps6Ck391kcXREMkEICux90CLjuxo
	tGlXAq1DX+WhB1d68mH51Y2vh2FHElDee9mULPs635aVTlTBXS0x83RGyfE6mow1zL69VUo1nmi
	1sj3hI3zM2Ynk71rDrsJpWtejh7tZRuDt68onTyRWUvxwovNGpn+7A5Hfk91DJ/HFLZEBy3aPZn
	17TnwjbQiws37nMzXBy9oIjJdzEwwzZ0uqKh5zNpZfkh/M0JRyBkDHRhza29DgZ9HnngkAenUOy
	3WAvRO9AhY8Zw4P5QjdlEWu8YWwIOBsfVv+pj0rUOX2GXOrkTYKncmsY91aDNas6TrBGBE0PQj/
	EvTiZVQkcTEAU3+i6vHFdVj/w==
X-Received: by 2002:a17:90a:e70f:b0:3a4:9a7a:360 with SMTP id 98e67ed59e1d1-3a49a7a0402mr1413209a91.29.1790651647749;
        Mon, 28 Sep 2026 20:14:07 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:712c:b4ae:1eb:26ce:7dc5:ed80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497e90180sm2756476a91.2.2026.09.28.20.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:14:07 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [PATCH] iommufd: Keep reserved IOVA ranges when a replace within one IOAS fails
Date: Tue, 29 Sep 2026 12:14:02 +0900
Message-ID: <20260929031402.1998253-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iommufd_device_do_replace() installs the group's reserved IOVA ranges in
the new hwpt's IOAS only when it differs from the old hwpt's IOAS. If the
replace fails in iommufd_device_do_replace() or
iommufd_group_do_replace_reserved_iova(), the error paths remove the
ranges from the new hwpt's IOAS whether or not the IOAS is shared
between the old and new hwpt, which removes the ranges that the old hwpt
still needs.

For example, on x86 with intel-iommu, after a replace within a shared
IOAS fails with -ENODEV, IOMMU_IOAS_IOVA_RANGES goes from

  0x0-0xfedfffff
  0xfef00000-0xffffffffffff

to

  0x0-0xffffffffffff

and IOMMU_IOAS_MAP at 0xfee00000 succeeds.

Remove the ranges on failure only when the replace installed them, and
look up the old hwpt_paging before the replace so that the error path
can compare the IOAS.

Fixes: e88d4ec154a8 ("iommufd: Add iommufd_device_replace()")
Assisted-by: LLM
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Tested on 72d3fcf802c4 in QEMU (q35, intel-iommu) with vfio-pci devices.
The replace was made to fail by moving a device without PRI to a hwpt
allocated with IOMMU_HWPT_FAULT_ID_VALID, which intel-iommu rejects.
Checked whether the MSI window (0xfee00000-0xfeefffff) is still reserved
in the original IOAS after each case:

  case                                  unpatched   patched
  replace fails, shared IOAS            no          yes
  replace fails twice, then succeeds    no          yes
  replace fails, different IOAS         yes         yes
  replace succeeds, shared IOAS         yes         yes
  replace succeeds, different IOAS      no (moved)  no (moved)

tools/testing/selftests/iommu: identical per-test results on both kernels.

 drivers/iommu/iommufd/device.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index a664c70a6fe73..1b0bdf57ac8ab 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -849,7 +849,8 @@ iommufd_group_do_replace_reserved_iova(struct iommufd_group *igroup,
 	return 0;
 
 err_unresv:
-	iommufd_group_remove_reserved_iova(igroup, hwpt_paging);
+	if (!old_hwpt_paging || hwpt_paging->ioas != old_hwpt_paging->ioas)
+		iommufd_group_remove_reserved_iova(igroup, hwpt_paging);
 	return rc;
 }
 
@@ -889,6 +890,7 @@ iommufd_device_do_replace(struct iommufd_device *idev, ioasid_t pasid,
 		return NULL;
 	}
 
+	old_hwpt_paging = find_hwpt_paging(old_hwpt);
 	if (attach_resv) {
 		rc = iommufd_group_do_replace_reserved_iova(igroup, hwpt_paging);
 		if (rc)
@@ -899,7 +901,6 @@ iommufd_device_do_replace(struct iommufd_device *idev, ioasid_t pasid,
 	if (rc)
 		goto err_unresv;
 
-	old_hwpt_paging = find_hwpt_paging(old_hwpt);
 	if (old_hwpt_paging && pasid == IOMMU_NO_PASID &&
 	    (!hwpt_paging || hwpt_paging->ioas != old_hwpt_paging->ioas))
 		iommufd_group_remove_reserved_iova(igroup, old_hwpt_paging);
@@ -920,7 +921,8 @@ iommufd_device_do_replace(struct iommufd_device *idev, ioasid_t pasid,
 	/* Caller must destroy old_hwpt */
 	return old_hwpt;
 err_unresv:
-	if (attach_resv)
+	if (attach_resv &&
+	    (!old_hwpt_paging || hwpt_paging->ioas != old_hwpt_paging->ioas))
 		iommufd_group_remove_reserved_iova(igroup, hwpt_paging);
 err_unlock:
 	mutex_unlock(&igroup->lock);
-- 
2.53.0

