Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6453B4078CB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427759; cv=none; b=giAL8LzrtNyPl+4ga6UWkIdTSm+bndrdTHEBAi7mrzWd7d+B1eB2YTAusDjMQ9SRoQSD9vTagbR9n1xkJSno9V8IBr/TKOQYWdTgr/Ztmh/X+9Zar1YNuXgl4OqvDu4I71mzCRtr9kWgzDEbDTaoEpOVtAhoNY/zdsRRmgDz7nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427759; c=relaxed/simple;
	bh=eZIruiu6THRv9MJciGolWELIK1WoaJG6izbe1gji4QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6kzRdfbGdGyxA5rPyQXv9EY9TpMqPdOOzkDK9wFvcbVyV8K+Aq78vJ/UXM9ZqD9LJANjbTbcqmaVqVy+XB6F1nD6Kwz1Fu9IdqEza1yylMB4VTukf64TwhYFXCB9b5uSqip9gKQ080xhYn8tLZW4EKmHJp3Ho8IGk4naDwQ60Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bq40oymi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bq40oymi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso15653385e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788427755; x=1789032555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0wHxMHZKSGsfKZNy4gytEu0vYIPsIVcY74N/oalHblk=;
        b=Bq40oymiNKJ9zi5eheppeEaY/A3w7l6v/4TaoXgQq4T3HbxdjcCUhE/qrg5gyix+dM
         hXzA0dY31uyLEuLjPX/p6CKzJmFZ77OQ7ycXoyNFwIEOD6u+o7RoDCROk5PbSyOwgmHU
         xNm4KdHUnX7nT5Iqd4p2+XvE/QQ6zWh4/nc63aE9L/cgMpV6yktPqZeBpN/6biY3rAH0
         AYMih/3oXQ3EiKLomIj35+bO5dPBiwl2gTJfFzCADV1+pKM8qTBNRzB/dTEMBLhTbbAK
         qVjhdX/Re5lw86IGYhDo6Nian0g/6ZJa0lEt3aqDIiZH18NymdZNpkrroUoaffJbp46Q
         kPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427755; x=1789032555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0wHxMHZKSGsfKZNy4gytEu0vYIPsIVcY74N/oalHblk=;
        b=Z1si8wFYM0BRHh0WPdYWfPNdFYEMIFe0WJEVpApgAavb7lbsJnTUp8yhco8M1QDZCD
         0hDUBEoYdRFrFQG/OU6ftsNltLxVN9YxthF+0053kEHxoyuZbsV+F+5A/EZlSQe+qhmG
         3snHuRZD5F7HIB9vXuivJ6yfQOfLRGxUmUame5InZ0+rcrStLvLRqrB3hUsAf4BmbOmP
         JEBItLFHtWMGaiSgB5FrIGjw5CdaLJyJ9wRVWcu0th41V0Lhtn3katBIMqZB+AL2SFE0
         PNTvvrmMCd0wmwebbTIvC5F1IFF3vvVETPISvagv/YyR2cRrN/HKxoRqX4qkDOZdQvL1
         5RKQ==
X-Forwarded-Encrypted: i=1; AKwUvBymnN1WT3opaze51ve+T4PoEOvtYNDgPeJ8ixxF+O5smrgIetvvxangM2W2BSoQT74jhqNrrG9JHtClF6g=@vger.kernel.org
X-Gm-Message-State: AFuF++lxJgu9tAhzGSTluyqs2bOoNJtGZ4atCMtlXYoRygMgIDqlMCs5
	tdHvglbz2gEZAi26PpFPm8NVL/ofKUIohrsaaFK5z8aOBHk/dxBfdHkugG2jPA==
X-Gm-Gg: AYBFou2X25jNbenLhSaOXgxlv0frm3M/PAvMEYrWHiZaphSahYiCd2bXp2eZP4N83v7
	3kpWRKItJWJBNOf8+yUZ7nvnq/hAl+4EFL8Cuuxc34ze35MezOJeeFcCqbiy5vzKElee1dgpoZZ
	MgP+s/jzsLqr7dPGJrHds1IlCudOAhgMQg+rGvTuTPEAtKNYqw+7GnZI4qFSiPHbCLlOBEGqO6n
	w6Ml+7GQL5RYMb2fyTfTvpi1OZhVzUDyBdWl9ZqfA9+ktQYPuich5JtW3LTSb1IMQiyQ4kDbGEf
	s0/aM8whQjqBrA+VkfCinQfuIwUvB6YRVLfHRQdAfM+vjC4IZ/PibwxBlbCONFt3VZkHcr8ib4s
	ZztJOQoHMxYWI4R3OEt1M5c7+NKL7u0vy0yz6gdWNu8t8yGiDeEriKYNY6iRYjyhdE10rnBHqfx
	9POg0+2tZs2nbnCLCShUDX73qFH63BfUUQdfV8EjscfXlWsf284Ma15RlFB6Tg1ot4loY=
X-Received: by 2002:a05:600c:4f0b:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49ce581316dmr158158385e9.6.1788427755504;
        Thu, 03 Sep 2026 02:29:15 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.114.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d4938sm56821575e9.2.2026.09.03.02.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:29:15 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Alex Williamson <alex@shazbot.org>
Subject: [PATCH v3] vfio/fsl-mc: prevent read-only region mappings from becoming writable
Date: Thu,  3 Sep 2026 12:29:12 +0300
Message-ID: <20260903092912.444-1-suruurism@gmail.com>
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
drm/panthor (CVE-2024-53071) and commit a5edadbae57e ("ptp: vmclock:
prevent read-only mappings from becoming writable").

Note this is defensive hardening: the fsl-mc bus publishes all device
regions with the WRITE flag set, so no device can currently reach the
read-only path.  The guard costs nothing and keeps the mmap() interface
honest if a read-only region ever appears.

Fixes: 67247289688d4 ("vfio/fsl-mc: Allow userspace to MMAP fsl-mc device MMIO regions")
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
---
v2: commit log now states plainly that the read-only path is
unreachable in practice, per Alex's review; dropped Cc: stable as
there is no reachable issue to backport.
v3: use 'commit <sha> ("<title>")' style for the vmclock reference
and point Fixes at the MMAP support commit, matching the same review
points on the vfio/platform patch.

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
