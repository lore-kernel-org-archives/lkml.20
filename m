Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3AD427F8B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427755; cv=none; b=eDmlUk7JDuuw1dbSBzpZUuiNYiC/v4L1wb9RhgiY372kNgI1xCeI0E54UYnC+imyw7Nb4D70QsMSjzmK8mAkxQ+TdvWu7kGCF8f3IwwyWJYjMAGyK6B/rKArRNzVs+vZr2KxSe+uQUh50iaTfuDA4/xZ0+KL+jHW5kcdRb/mmDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427755; c=relaxed/simple;
	bh=1rdZid1OqnapaKpKLZfZL9nN/IIgE3XM/IxZCu4Yxls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e5nduscKL5CuDHfJoF0fOqlJgF0DTJiWoGG7gCS+xWAopKHnSrjjIAf5ai40oeuOaDTuwuV5sKrW34kc+dxPt8R8H7SQY+CyaX7EVvql4CX0rjyckctcu66IVCrY7SCXsjaOIJbO1g8+mM1GUyKcAhlSHYhroncdWUXkGrARW2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i132Wc60; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i132Wc60"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4858303de5dso334856f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788427752; x=1789032552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2r6oyYeWRA4NkJB59FMsCMrpSy0tWrSaFIZX5RFlVq4=;
        b=i132Wc60B/bOGIxUCn1v5aDeyd1THYMsjMQ+KLLWRESdKuGgwllc8zgzSYL6PWo/js
         3gY43z9EBtFKdfgc0Df56dlYKjCgu6O1EV86wvsmkzOGv8Eq3HwU3IF5FZHvU0alOFnq
         1/lmV4ugH3bJLvGYZyJBZNBmQPrB/43yF0aoDEVzGYxSdpOGwgokkZUSurfoY1U1ROlc
         3dl1UqxWrrwjxKRxwtnaNjtfSMxEuzTXmMBMBQ8enzsr62pdjRikthfuG7v62F8QIAyo
         7bCKr6ekZwr9TtFqnCc9YykY7D0wfNfFR1Fp5cIFUml2P1rE3dCk9i3QCCqBhsDd+yga
         c6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427752; x=1789032552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2r6oyYeWRA4NkJB59FMsCMrpSy0tWrSaFIZX5RFlVq4=;
        b=R3ms6bxp6ZhkPlOLpE7pWCEK3/ECD/UWCBaHO+QdhHecCmuuu4xGw7606wR8aZ+svi
         wJ5BO1+bTx507YZOlh5CV3cXPZpldPFi4Y8bYbiFdC38c1WzBWxcjo79iEMjJCacp0bd
         sUKpSHmEz1QIxWu+DevbOU05JjrjCV8RwzF6MB8wbZ+sUbeNqCvRLwWpPRkOTp9txNoV
         dSIxDf9tTmHQTgyQnT0NeWf0rPbUjbuZQEiFrpHkvCICNdGg6sJdZbXUTiyK6ZAK7iYu
         ZWB/h+SEChefexO3hqpR500v526fiypOtxOfLOZhm8W65dutnukYfjuNWuzOkjVJ7qP8
         RUkw==
X-Forwarded-Encrypted: i=1; AKwUvBxjpf4as3V1sZyqTWwcdfSFhSzl8L6B+D7KTVfzP9swRT4t3j4H54sIRE5Y/TqjS6xyYMB9peE6PFPbvts=@vger.kernel.org
X-Gm-Message-State: AFuF++lM6AT4ZQq8sn+d8gGlTnh/LmjUnMIZmA0CQ26MNrc39nVqwS/j
	fbpn86rwJZLX91iy77C5dh9CEyQXI/1UhfY7+D9ZCCLNd0E3a3wN5kqr
X-Gm-Gg: AYBFou0aqiOLQtBaEpAcagaHIOvVkhdlig7pU+9BR9Nrj8+BSrJplinw3RtmYsl59H0
	01tTXdYLdIFa3cmDcPYQylKRH8phJ4PbbpM4AJ1/QGEf4vosaTQC/rN+qhxHBw4mMIguapYiAU3
	QM6j45S7FLzzXIHvxE2yZVYVTLbUnpFojXVr83kw+2BPuAzMaOpEvb5hSxj4g62I0zidn5GqbEv
	8NSlrxtPVT/V0CEI00o/NR+KIMs3ew5Q6sADC9eO8vAoZl8Y9ipn0Di9/KOptv+M9oGpY7yUg70
	k0PF5y2goCcnBejzTS6r1nbGnyjsTR7TaGPuEn/uvVKHIviB09uT6S6F/R6/pGIwC7S7Ly+Vshl
	Ma4LNK1ZQ79lBYHOGlvqYq505ZtitJ+bzOxpYGWLVzWm4MZcMyoL2Elkj04hP6x5hiJKCYZDNLK
	3feSKxfYsOt7e0E+Q413D0p4Xb6kNzLSG+h/hPX/+pkRPMYmag0oaqZRyo080pSnBK/64=
X-Received: by 2002:adf:e196:0:b0:482:e451:6810 with SMTP id ffacd0b85a97d-48488dee050mr23124500f8f.1.1788427751448;
        Thu, 03 Sep 2026 02:29:11 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.114.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7f8f9sm12579032f8f.9.2026.09.03.02.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:29:11 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Eric Auger <eric.auger@redhat.com>,
	Mostafa Saleh <smostafa@google.com>,
	Pranjal Shrivastava <praan@google.com>,
	Alex Williamson <alex@shazbot.org>
Subject: [PATCH v3] vfio/platform: prevent read-only region mappings from becoming writable
Date: Thu,  3 Sep 2026 12:29:07 +0300
Message-ID: <20260903092907.419-1-suruurism@gmail.com>
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
---
v2: commit log now states plainly that the read-only path is
unreachable in practice, per Alex's review; dropped Cc: stable as
there is no reachable issue to backport.
v3: use 'commit <sha> ("<title>")' style for the vmclock reference
and point Fixes at the MMAP support commit, per Mostafa's review.

--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -594,7 +594,11 @@
 	if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE)
 			&& (vma->vm_flags & VM_WRITE))
 		return -EINVAL;

+	/* Prevent read-only region mappings from being upgraded with mprotect() */
+	if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE))
+		vm_flags_clear(vma, VM_MAYWRITE);
+
 	vma->vm_private_data = vdev;

 	if (vdev->regions[index].type & VFIO_PLATFORM_REGION_TYPE_MMIO)
 		return vfio_platform_mmap_mmio(vdev->regions[index], vma);
