Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732E34968EC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993425; cv=none; b=dprdOM+jQQqzXcDEpPwY/gXmZIKL/W817JQc1DDQnvJuKIlae62lj1fL3XxcojW3fY2hrHlrdeGn1NffPCE+gSVf48hEVYnuY7zO7MN7Ip2kHzxkK+J4bqQ/TPZjhQYWzjBSVNZy3OS8AJywPCg8M+8GI9O4Kgt7m2jzE4BKGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993425; c=relaxed/simple;
	bh=F9zJRMikI9WeEBIIzxSya6IfDY6kvRKp1F8o4LGQzf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LAq30kd9Rvqwq8gptdc4K9g19Da/ZSFah8umqOljx5HVNZDfCl9wGvhsIGU81LKiuLs1hVgaa0gOwsZPf5DsiCaz87Hr2Is2RzzDkO8QUSDX+e5+o/HO2fnc01BERBDfzfVf0n45AfmNd0NR8+xJkQ36e6kPykGBQ8za5Aj+AGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCX7K/sI; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCX7K/sI"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso4776281a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789993421; x=1790598221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PtmaD+dFfANavdWfY8E3JvcpIeWj4J1LbV7u+lXUeA=;
        b=UCX7K/sIVjf2qokVrACZS3RRa5rPfwk5NegBTGzsGcPSmOdbmardwYogktPkmPob1q
         12BFPP7CxXcas2tQCPq1UsfkjleM9e9ecbEojvScL5zov3KFEoR1AWVFozb9WKO3iASg
         VjBWNY0pAUERaHr9ZraU+fbeJSTAGajKFcfoRKdl//e4GqxJmI/epZpJrVS1MIE3ekQ5
         jZ4Df6VLPrQjk3CdT+gmXOdZOn6UnemwGRT/jUB9+rJrRYSh3U+vOlSM5GDl09F0YRpl
         NT01Y0EoRAzw3p+fmBby5uWp5dtAY5K1NSZgibJzNJql5JTYOKpVOUdyAdeUkxmS+Bow
         EVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993421; x=1790598221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PtmaD+dFfANavdWfY8E3JvcpIeWj4J1LbV7u+lXUeA=;
        b=U4yFsUE25HgcqiDO89SRWf8FDhF3c3CHZWUBEzU2SBdVI1HeBIZctK2pQG26C9bI9d
         UI4WSyR9vcrBKN0E0SfpttALr07p+iuFXrOfNchtnkP+k7BIySdoUK61anIYzUNvRua+
         sJvapukRqABA+nLU1X1K63vwzlpptfhAXLd1NzphliozNBjMhibcuxeHPxT0z6ivMQ3r
         ORqbOuMwr09EquZR07fBTReokhyuYw0chcLrrpDMUQz9USpX8mcH0pPw7av/RoGYU5l1
         YvUIPCZkRfLhyOYVrPLNQU6vAX1twYghn+GjPDe8Ci4D2ceB/VRZLcQ+lqaL0uePTqXy
         R57A==
X-Forwarded-Encrypted: i=1; AKwUvBwGGi+aQ8L3edFtsGlaVwvtQ3BujBOn9UbfIwqQUc1WtP+/YgP6dpEg4Q5GFc2SQFm0V+VNdKl9u9GjIQw=@vger.kernel.org
X-Gm-Message-State: AFuF++kFKWbc3+V1QAwDBzAvcsByk3q8JmzNzy3oDTaQdJz23P0DxPyg
	BiaaqzxFPBJUDuaPHDT1+2ZpsuWRHW5H91b8QSH3jOQVgeZpdixwiI1U
X-Gm-Gg: AYBFou12nw9hDtmskIOCPxbWDxToSC25WtBhsrnpp9PRkUN+INnIIw3Eej+9RPYP+IY
	xRiZYmsXIyZhRtNTpjq9IEHB/G1DyMKDP28kqYW3Yo3sWYrXKO2vEMBgVZKSOYdqPcGvaDhXEt4
	WOAKRVe27a/2d4ONGuFFEpSLopkB7WX346YD8zpKXDPoqMTM+JFo2ufV08UAQYig9Nrvke03XG4
	rPxcyQC6XpRK4c6u0WNFp2blAlVaMjFUqrXoOwbgfcxKx91u4oXh1Mdr8nlWW3H1HSb+GkHKhvj
	fhv9ebtoHDtUpL6h/46gRt7zmVvxI2zFVIEXVQivhxciMIcOPwjPShR4xwjdqexjSNrFXubfO+x
	jTh6hXHkjN0mHwXEBymkMkxP6xSexu58BRA39nVC2DCDFuGPsX7kt+eEwJPpmsQoJX1lGK8uq/6
	e/qTMUmm9Abd1SpqBpqKtVpuF3kE1tCdtBd4d8XqKGDiaDDl6y4AeWhNxqGgn3OiRUh51PLp67K
	S7f+fmSY2Swv0vU
X-Received: by 2002:a05:6402:3205:b0:6a9:ba2d:4752 with SMTP id 4fb4d7f45d1cf-6aa53cb300amr8619349a12.25.1789993421279;
        Mon, 21 Sep 2026 05:23:41 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.112.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67b5eddcsm4228761a12.0.2026.09.21.05.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:23:40 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alex@shazbot.org,
	eric.auger@redhat.com,
	smostafa@google.com,
	praan@google.com,
	ioana.ciornei@nxp.com,
	nipun.gupta@amd.com,
	nikhil.agarwal@amd.com
Subject: [PATCH 1/7] vfio/platform: prevent read-only region mappings from becoming writable
Date: Mon, 21 Sep 2026 15:23:28 +0300
Message-ID: <20260921122334.2099-2-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921122334.2099-1-suruurism@gmail.com>
References: <20260921122334.2099-1-suruurism@gmail.com>
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

