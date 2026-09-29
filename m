Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6824FD792
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675340; cv=none; b=nCBtWARcYaDb47jnOQrpGMSN3Tq9DMc66v280CUieMtGPFDKU/9mXElGue21Dytv6V3fwHlJ1bRJDipbcXLK0wLS0wIvwGfPfEgqOSlkv0Rxd3KmCSUlKrbWdW1vt3mCcQQdOW1HMkmKkfJ0nnxAh9eUyoqGJAkI7vIHJ32vcKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675340; c=relaxed/simple;
	bh=X8Ej/nwADOS4/wXxreU4JSkGFswdLn25fMnx5HgdFrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+eUDtOmY8DL3OZsprhOrTi7QQc6gOgskwO0re2n7OUdlh3xPG9S3gWdHN194G5NP0kxDl54a/tNVMmDFqTYjyuQ3p19uE9Ke53VkOe+nvtl0FgyceIPzp+1altvz0ICg4SIawfLXDvLzpDmugM0GPuCWJLX43ISIlltPzkJbAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CuUTthbw; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuUTthbw"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso37607935e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790675336; x=1791280136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jq1HJbIWGljfuuKbvju1aw9Hna2ksAIXSYuWHEHYH0c=;
        b=CuUTthbwAn7dD2bO0MxGP0+R6rd7vapsdkvrIGbF43Qew/8RJSVBO263oF+tggCJdl
         o6S9iWkVpxJE83YTiUMr0e7aim3aBN4q1kva5CZ5qj5N7VJ1OEdj1VdEg3hnx3tb3R1K
         twsvh0Ah/fD9I9pPKvZ3CrWQoJDe7050E/cCUmzANb5omvvQnHgWt2xE/Cun6P52nGIX
         tLZqZdAHBwgx+1d65Xe2Rq+djyuz94J6Go9nXu7T/TcFmRDabiiz43NlwcDVGnZmBujI
         hWxYjH+Om6v4GpundcxwRRdpZcDwok/mm6wtMCOxXeZd5LMteZQMslpD5hooN5tDrL4s
         Lvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675336; x=1791280136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jq1HJbIWGljfuuKbvju1aw9Hna2ksAIXSYuWHEHYH0c=;
        b=iajMYNz1NlOX9I/h7ByErheR/YDOn6vXYYYnMS+aBUO9a7Uuj0RQdIPP157xqU2nW7
         dMS2PaTnKWTWv+8qcW9C1gEBBlmH9pRBpkdvSxvLH29nPHQIRdtz8YZFQKm/DM3R25Rq
         0FV0qC0D+bxG+UUUFeYSxrIjraBYDODTP3kO2grZffzzrzWYvYPVY8Pt/XK/cnkeV5AO
         CTHpT6//8yoXf8z5jC1jM27oZWbZaOXIO4w4PaqG9vKuOivk1WIrC5bYadejYny9tXWU
         9RP6Ujx/sPcziMAxjUQN9XClvKLiCHvE0Tb8nDwI5Xc9zK0jxdDESnP3ShCso4U2qboD
         ozzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwc99qZQ5h5UvqCZW3W/Q7h/TVntABAhufbnxZ8uqjcSHoVwdF8RUTcT1bKdy9jagVMNXcWodo16pWZn4A=@vger.kernel.org
X-Gm-Message-State: AFuF++m6f+hV1FZmq656SA8CEndYmgwZr4sUNEL3Kf9X8bp0Ta6tn+wP
	ZVuQXx1uyUq+VBrBegSzGuDyLGdi4GngllrIl+dZp2zAcb6hdk/T15xDYd2N1w==
X-Gm-Gg: AYBFou3Mlau+jBN4nwxVDjUbryOx7TPraU+ZCmxYbsjYZmzTZ7JfOaqqBe+Vt5cED71
	yWTqROmCB7IMuAKg93HCTwp7BWzrpAvpvBECai4hkOskDkLIfxZ9YBlUfvXc0uMwSyEJxres369
	2Jdms5Mojf/oNEmHXMvuyDX96gSQtILyUpTh1I0vcvLx3Ea6CLaCnJWb0VcW34MaVQ5ODU3lBHg
	QYpyid5z3hMvX3Kj2pQXHhyiw1rIU/bnHd3DQJzDHHAe42vVxhZ5JplQwr9zO5sy69j6rd1WV7x
	tX3I8LtoL5zDonvpAFRfbUA0JjmVuwMF0ZkYb034kmMEcJUc9+v7qmNcBz4+39o+F4917wErTh0
	BW7McRbwOZNI+vtD6q6gv2+s1dXL6FahJ0nu0P11vPJh6CJN1h+p/XreBHLWsWmmSFBMaaFznOe
	2/deMGJs69BMXNt9QQkOlRLHtDsXbIOwt/4eZXn4Sr3PW8q2KVIRcuo6Q/VD6okG12yojOMP/B9
	cfS
X-Received: by 2002:a05:600c:3556:b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-49fe6708a46mr269728175e9.31.1790675335846;
        Tue, 29 Sep 2026 02:48:55 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.113.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b72fsm89821455e9.9.2026.09.29.02.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:48:54 -0700 (PDT)
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
Subject: [PATCH v2 1/7] vfio/platform: prevent read-only region mappings from becoming writable
Date: Tue, 29 Sep 2026 12:48:42 +0300
Message-ID: <20260929094848.7439-2-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929094848.7439-1-suruurism@gmail.com>
References: <20260929094848.7439-1-suruurism@gmail.com>
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
 
-- 
2.53.0

