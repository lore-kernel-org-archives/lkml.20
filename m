Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EC24FD7BE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675344; cv=none; b=MFUNCfszcgZJadPfJ8AlilLV/PC+qVCfMUmKtPwNbrUvHUm+WvAPfOCQWdOTmmPxORwFYP2Kz5J4IbpZqry7ZOwhimyBe4jdZfGFCJwIQY09pYOmQuiXOvYG835ikXfjVHWlW6iSqiVuPrf8Q8p3X6uRCVbBss2bMusuk/gXf2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675344; c=relaxed/simple;
	bh=KYw6laLYfLK835VlX2EP/m7oFfMcnni8ceHKQo+76fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhXlbqmEW3CZAfTPecnIKuOmF2pITuJzr+DhcHSc4zT5fNydrOWTkLEG+7JyzvSvoz8f1Vw0pH4DvgTEo611KUXw0ZvuyMfWlcblFQtFnHCqyPaGfsyE8y+BDRqAbR1I74SjizpKir8JTUEZGnmM/o90u08hsPUcBkOh0P26CZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNN8oq7P; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNN8oq7P"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso14279185e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790675338; x=1791280138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuVBrqbNGUgL/1PEKz8umL2PwU8bfUdabSd70PxO4y8=;
        b=LNN8oq7Pr9tacX4N/3+JmbUr82Vza+COP6Spg2LpGQNskQiFvpOkOCRIE8eDeqe0dx
         JOiAZ8BiiYwfHX0sNXzu2j3oeCi8tyUNjriSJewxVymUOMhYFFjzkX3RYqyYRzP9LivN
         Xl9a8BY5OFCH2QZKpPjdnJ91OD6EU68W+zO/UZOUJI1JyWbL318buUXhgYhAMptntNph
         3kovva97fCNUK6fG2qckIxX/y14BbI/JVdXKrSYsie2qV22D173se0TB2vam2rH5RN2a
         n1Jfc/Ntd6B1UDTg0xouYF03Hx42ne7Xylkq5YwvPW8eR7CryeE+J29cdbp7unqNVyVX
         rWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675338; x=1791280138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QuVBrqbNGUgL/1PEKz8umL2PwU8bfUdabSd70PxO4y8=;
        b=P3Z1zbSsUfrtscB2HWrWOUwiOMxT5XoGroqIN46y5V/yedLVvBt8tSsR6DrOupm5Va
         ZZjrF+9CQ8z5L3WI8ho++K8uN+mAPXSEikdecxhG87Bqeix3SOZe9wUR8NemtUu7V40i
         68CC+k5kB8UCSE9MKzBGXbPDh6k3GFHlx0K3iUnYO+KgAaOyPA5l7D6ffTZdgguwhK3d
         SSs/T8GsEG58IVNhUROB1ZXkVvUUdyU1Rmutk3D8JRIxrgMd/BCZqXilLO9GwbKFWP0n
         qh02m5Bq0kKVKMW8xI1xFj/GfFAzDknlURHJpqPG/bwGew6v0A4zO3xnfn61cEt3BM4V
         6uKQ==
X-Forwarded-Encrypted: i=1; AKwUvBx90PDduxFM/JI/+doIpuPR1Z6ASQgjy3+YntFgPHL6pXdm5yOhRBpCTwS0k/XWZ0SeMTymYqtVMz3979c=@vger.kernel.org
X-Gm-Message-State: AFuF++n/NoehdXy7vcgsNX2lTPSRFEROqw4LlOqzH8jDVO80UYsXRz9r
	0MOOy+Hg+RK4uoCDhmNJjJP7Qtygaau1M79eAf8HN9hu7jdHpcXlqrkC
X-Gm-Gg: AYBFou24czPD69tUuffJ4NpPZL386NVp1IdkT35i/dAn9nS/OFta2omOFZRkia++bXm
	C3H2AErfi08qlEvQ3bVUH+VmxJmlReV0Kah15VvUV/ahNRD9x6sauw5hnUltp8tzbrAfccnUkmS
	sZBoNa8g1U9OTnRLp7Pd2LpfaZReLlaFQfjNOZ3RqbpoihD3fGf+IJi3UI9xoU5qlPI4tXOdDDj
	ktYROBBwe216tfIJL7ANVqVsx6jDksezjQHIP7pUN7D7QwUyXtABgKzIvd5lByrsfS8Mk+aSUUn
	5X9ZX6EKeV6y6ulA8IZiBXj5qzxMsGAcFRm5DtKLMrSpJVC/azpsXgJI9zuUZBJIjrmDl1V0SQf
	FxyM6EMd+QNIUz9bFBwJbRLwGkXW9zif7YO2qHZ+sS2mobJFFhSflh5JjG+DHemIFDyjKORiWLC
	hWwzWCHrnvkDyWTt5zDV8K6GPK2xNEtheriRvO0uyE7k16dazE+n3rxfUOMze8L+zM/3NYiQCjg
	F4OzmS9A3e271Q=
X-Received: by 2002:a05:600c:638f:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-49fe66d8112mr265725355e9.22.1790675337786;
        Tue, 29 Sep 2026 02:48:57 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.113.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b72fsm89821455e9.9.2026.09.29.02.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:48:57 -0700 (PDT)
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
Subject: [PATCH v2 2/7] vfio/fsl-mc: prevent read-only region mappings from becoming writable
Date: Tue, 29 Sep 2026 12:48:43 +0300
Message-ID: <20260929094848.7439-3-suruurism@gmail.com>
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
Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 drivers/vfio/fsl-mc/vfio_fsl_mc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index b4c3958201b25..5a6cd78dcc06a 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -403,9 +403,13 @@ static int vfio_fsl_mc_mmap(struct vfio_device *core_vdev,
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
 
 	vma->vm_private_data = mc_dev;
 
-- 
2.53.0

