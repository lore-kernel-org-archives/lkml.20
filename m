Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D2F4FE2E4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675352; cv=none; b=FiC7KxhDWVYPZgB6KwDfgafCY6Nsri5zuaVChQ+3+dldFANAqfVe/+rg65KxHWq9PX/8KEpnRSCMeNggZcXQWv5RxmoMY3HyIrqUYkMIKlULM5oSq6O7r8HGwT4PMYeHay785y4O42n2WPt9682mrUMOtZWCBFNBcYHMddVr2R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675352; c=relaxed/simple;
	bh=/7P1ey1OUg/HDT8+oWOBv5Ij/ywfnvZrEXxYVOOHOxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYD5FDpK6mDHRJiDW4MHckSE+JMITHQX4dDAUBb0eJNMn/JjXt4xfzkMAcm6Art7sopG3IA/a73crldCqq+VZo555QW3blyD3dyPbyvg48vGsQ+TBWHvAHCsoa3R5lY5gAEZwGyzYZH1MOwjYNlSnSfNmopLbY7IgfFcXkTP9Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KC1AMvsv; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KC1AMvsv"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so2689905e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790675348; x=1791280148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TuDqyckk7bv4jr66rxPBT2/vI7BXxN7gjWxl7twUBYg=;
        b=KC1AMvsv3HfiCXhN4Q8ESurkZ5E8+rzjs1eCOROAZwDc1T5QpIwkSB+RMJa9/Drrpo
         G0xVRekprnsCpx3KcO3uy3vBEqS38NJlPZlKyidqh+NHD2Xw0WVBFrOQeoVTnesVvsZd
         9FPE+0h4/AIxdwEjgxYbGrHtK2l6KXESZtVCizKyS2pGfhP4zylClLLZu806lAGXFhRP
         ftxfS4MCWN6hzO6bdqsV3DpSF0mAr7CD3DbzJbLDdxaeF6sfcjL+uDYA5YXvMHqkSshq
         y/4gUMCbFV93FJi5zOmjcb2c7Npj1I54Hb/n3i1o2j+MBQ3ltkBMkq7lXG3SqFGczAfk
         BIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675348; x=1791280148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TuDqyckk7bv4jr66rxPBT2/vI7BXxN7gjWxl7twUBYg=;
        b=cE9WkB4AGZBSbp1YoavmXLhwKsYj5DqP8ibZ3ghR8QxwEmZdb8pdgtXglVO5r0s6PB
         H0X7bdsYzog7osAyoRSu63ZFmNBsSzvGQ7H2+Qe9CHZMC4WWtksdupi60NoyFqntFXqc
         dUtDk7D75RKTu3FvB80MGDpPi2U+wo+LIm3ctBnAKZ4jSYPByFbrrp3Rse/+KRaPaEmU
         ewj6SlbL0U4Q4d9PYtWk7SYquFDNuQ2zJxhA9NOpTRshVul4vTE9w/oUEII/wChMVPw6
         B4lt8YsQngOeHsgN+vmYJGoCdBTmauNSJrswuNRjI/huHy7LuXYQkE0ARZRX3SJMc6TG
         wF/A==
X-Forwarded-Encrypted: i=1; AKwUvByNbkbheE+PZ5VcU1RtQM4g3yt9moF+zp/aacXxKsGyR7mztpNVyKmR652TD5wGKPEtEadm7dpvfllEGxw=@vger.kernel.org
X-Gm-Message-State: AFuF++mju+gXFoE2RsNe5qzYdLrCMyUmqGcGK4dSYEVpGCBpLY5C0CFF
	x0PrHrAKIRWacWP+fwUrG1ASqB/XaUOAC319THFIOtMGfedoj6C62wuE
X-Gm-Gg: AYBFou2EwRXdXh8Ctx5v4boAX+o4J1R2WmuetJgVw3km1bRFZgodz2WkiTCeLJWNrKn
	/3/esErcLduBbqt6TwDSAqOMQELgQ5OMxIngUHgXg4bf2QWykQFLIqCjp8Ab59sL/Gnf98iW4Pc
	BKatQldyJr9n5f7k7ZOcW87TRii6tyHXZlQUkYpJdttciYFa8245InObDmgUJPng0E/24A+JSO6
	vE683VHWRE/AFDvU0tqFLIONduE93eInFFmiRHo20m3d9tfz0phZ1sA93f0rnsEb7hJGbsFAKiO
	nkMiMwbeVMwQjvn82IDqX4F9hcMuBVRPJfKP7E+9WhnxOpP3qQ/tMjtaVzES1p2Bl1QpMvBU6fU
	OXdoYQX+uYqdThI4dQCtQqPiwc2ZQe5at0G9Q0a6ZWQhYZ+g/LQtqeO3fU9hA0bSwVPhVvR6R3Z
	FoSvhKhBJ7w5SUjNSlEL5hNdUdAYEZTCGtQWm+SvQfYeEneSDV34spjz2omoK+JXKhu5exGf4wz
	F78
X-Received: by 2002:a05:600c:3488:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a00d766dcamr31638485e9.8.1790675347956;
        Tue, 29 Sep 2026 02:49:07 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.113.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b72fsm89821455e9.9.2026.09.29.02.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:49:07 -0700 (PDT)
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
Subject: [PATCH v2 7/7] vfio/cdx: reject non-shared MMIO mmaps
Date: Tue, 29 Sep 2026 12:48:48 +0300
Message-ID: <20260929094848.7439-8-suruurism@gmail.com>
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
do.  This is defensive hygiene: vfio-cdx does not call
unmap_mapping_range() today, so no reachable stale-mapping issue
exists.

Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
---
 drivers/vfio/cdx/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/vfio/cdx/main.c b/drivers/vfio/cdx/main.c
index ea55b7767672c..28dc8c8256006 100644
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

