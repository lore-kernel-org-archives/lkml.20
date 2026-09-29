Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715704FDA63
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675348; cv=none; b=bYaZpObxcUo4h5438w3anaIyJi4XXiOFQmyZMyPPEImiMyD0SymiFes0veBRby/tBL1kVhiDQa/Ue2MF2yEiTAmufhc/D3c0xORvJ8xQWWIIkuepRlN0nFLGLhnF+4MZx5V4Gays/rnCfbyYc5SozkhoB/B4EwxIcgrK41FmNF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675348; c=relaxed/simple;
	bh=iqpbgIcuh9iCNLrVRX9mzEdLHHas24ifzA5YROCsukA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZXUm5/g2+PIFrquZWwi0EkSGzScNqExmNK4xD7s4Nch1EoCu9UHTICo8Fp/CxpeWcn4U3IsnkJgGJ7fb0ebSLZ+Qo5DcfL5AIK2Qj5AHPeZ+Fs6ykb8G2qMb6vhiTDllZgJ0gZZV92sOzYNlPr40Yex0WPetO3NR1eXG/zDNzR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qia0z73Q; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qia0z73Q"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so24596845e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790675342; x=1791280142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hyio1wh95j9ctU9oUBQpxlfVjmmC3Y8u2BtQy9SpKZE=;
        b=qia0z73QzLpAIv+K8rlTXHfSiRLSleR3pKNKYHmD2UKy0pxHqu25+neIpqSku+SBfz
         EL8TauKzaCPvmdBXimGPqQ1bP8Pgx7gtA0vn6MHdfnU0UvH7UIDTiDq8JooA76lNKl4K
         Wg5j+95r+s2F+COdVEJ4np6uAWmAZDq1DvIxyQ4uWfdEKcwcalAkI9/p2lfWConzs+ee
         vPILN7XZ/Kjnt8sgoNP4ugnBP9pbcP6X2DZ8tNKaBLyzqrxYtsXyjq5UQrGfDml6h9R5
         K0ZgGGOmPCOE1BuKUYyPSLlKDfvpl+dwrHRFi26DiavSNjyPnSOEq91N8FqIAnYGLruU
         SiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675342; x=1791280142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hyio1wh95j9ctU9oUBQpxlfVjmmC3Y8u2BtQy9SpKZE=;
        b=2qjc0vhzTY7jRn+hirTbEiSM4XzbdpQ+8dPlGsc8W9yrincNFg5Kx8K6O3uj77TnPh
         gsQvA1wHcfPZAcCzhpKexLR0uEKzY1tuDpOQf79IZXY97dhYa6csGb/gcMJ45Uivuxm1
         g9B6FW+jlH49PSHsJv3T+hhuuIM5WhFPZVWNb3/no9rRVpSIlkBPAl88ocFl0yotpobj
         drRKqY/z6C1oVDpHcf8T07C+y+1Gliesnmbhfa3IgP9dUq2aRiaYKOWcImElYOrJT/a9
         IbgdE2PVpsFbUiAwLkNNJi5mjvCZ6UnK5KaCrPe22MbjY6VM7v0yjVVwVamF+MUj7jl7
         Q2OA==
X-Forwarded-Encrypted: i=1; AKwUvBzSCGEmVrof8tq6LqNXCyw7ueUwxIO2+wq/dPAbvUA+7tx0sPW4Peftt0FpMfGMFkJ19WfVNnBHgkU5zW8=@vger.kernel.org
X-Gm-Message-State: AFuF++nur9P7aQt9X/KhG8sppLBNX25bLunEILMQxHx6hLNVAU1B+Ogc
	S3RJwpKis9hKdnix7oBAzoT8iBgPpvVD0KjyFdxyrH6/Mms+oqaeniaQ
X-Gm-Gg: AYBFou3yA2m+VrLYX9VDEDPIRC0YSe+Hczt6vmGp5sX8l5oVivwKcWS61V1FGCQ/CdO
	Wn3Y92PESE0QFyXK0g6NL4xtT/CAr1EMhzxpHVXjqlA5ZilRjtaUWSR/4rYAQlCvFcPkY8en9aC
	n72dc+jQLnBlqrE385PCGYKQn/+PQARlk3KWScGNAi81Gc6g1A4Fzo7BpHtwurUgLuED59nO6yv
	UwyV9QtH/nA75p3HOyAoMXIeDtPsgZwpIpztcdrteN5M8ykDjRFvkFwbI9BhRGZhKl98Wr16RLz
	qUm8e6oZzlhRJaFOxHrx3fDhG2gM0peum1Mi+Dww1+Dyshq7+YVoAnDznOdVx0NGC69CC8WVCkQ
	s2WD5QhFiJoQuin90+qUZzHZGhemSW8FNgwj3i69W3/BgqJcvjcovgA3rl5jGm4he8nRveuz1wV
	BI91yEq4YEd81RKs0BGOVDcYh5DTDBcbxdgmouo6nBE4ReMyh0MDE37bKbaTKPyewexxRytNKSV
	Jeb
X-Received: by 2002:a05:600c:4504:b0:49f:ff09:3b57 with SMTP id 5b1f17b1804b1-49fff251664mr125841895e9.10.1790675341793;
        Tue, 29 Sep 2026 02:49:01 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.113.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b72fsm89821455e9.9.2026.09.29.02.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:49:01 -0700 (PDT)
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
Subject: [PATCH v2 4/7] vfio/platform: keep logical vm_pgoff in MMIO region mmap
Date: Tue, 29 Sep 2026 12:48:45 +0300
Message-ID: <20260929094848.7439-5-suruurism@gmail.com>
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

vfio_platform_mmap_mmio() overwrites vma->vm_pgoff with the physical
frame number of the MMIO region and passes it to remap_pfn_range().
The VMA is inserted into the device file's mapping->i_mmap interval
tree keyed by vm_pgoff, which VFIO expects to be the logical file
offset: the core links every device mmap to the device inode's
i_mapping precisely so that unmap_mapping_range() can revoke all
mappings associated with a device (see vfio_device_cdev_open()).

With a raw PFN in vm_pgoff the interval tree entry lands in the wrong
coordinate space and unmap_mapping_range() cannot find the VMA,
leaving stale MMIO mappings behind any revocation attempt.  Keep
vm_pgoff in the logical VFIO offset space, as vfio-pci does, and pass
the physical PFN to remap_pfn_range() explicitly.

This is defensive hygiene: none of vfio-platform, vfio/fsl-mc and
vfio/cdx call unmap_mapping_range() today, so no reachable
stale-mapping issue exists.  Keeping vm_pgoff logical preserves the
VFIO core contract for any future revocation path.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
---
 drivers/vfio/platform/vfio_platform_common.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index ab531318f170a..e8cfa76ad7f87 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -559,9 +559,8 @@ static int vfio_platform_mmap_mmio(struct vfio_platform_region region,
 		return -EINVAL;
 
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-	vma->vm_pgoff = (region.addr >> PAGE_SHIFT) + pgoff;
-
-	return remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
+	return remap_pfn_range(vma, vma->vm_start,
+			       (region.addr >> PAGE_SHIFT) + pgoff,
 			       req_len, vma->vm_page_prot);
 }
 
-- 
2.53.0

