Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205E14FDA60
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675351; cv=none; b=h0LVLD20VCnUUPgLga22pD2kn7ylaZ0xgUkjQq47hLKN48QVWr37eztCvKIEn1HYhBqbysa3DmzFrLjJCmjymIQ1ukFZgWG/EaGUFdEqrcyQl4f84nSr6np5zb9J10psAStL4pJ3VS03/cxtF9+wX4i9d0YrtrrB6529Cd3WYYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675351; c=relaxed/simple;
	bh=6fBGWSDApFxqLj4jBbipWgdJRy03eJeI8vzge5SGiF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvIrp2wHt14i9mbT1E43OKUFXltjoDoqBU38qXIxmYht/b54qcZWwkGGYyB/6h+vNZzL0vrQkNpWO917B76i+53651BZviAtR1YZqLOV11lpSDqqaGHTqTvo/2U1iLEPcyhwTBomgCCdyLLooPO4a/SG7N/7dXE7cZCoFkje1jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmK0PfLp; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmK0PfLp"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so2463755f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790675346; x=1791280146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTnkPHgQSlDy8ZNeeMa28BcMTlxq/pJPabuX6okJ9u0=;
        b=dmK0PfLpXD3iBR1N9bMZQDYf4RttVQEXHnkqBd/AbL2bxjZRoKYj30ppktMXVORGn5
         t+4/0Yktv6qQ3+NWvI5214OntGbLiyyISai4uPSAy1uiZUe1FdgilIbu8Io5e1IX8xxs
         KQyk1VC97M0Zjn86DIVqQYkVLVbLOEQ72RUjM2suwCXDuZQ3o3MRldO0iMmT7zN9Ngx/
         iHxtU7PXxeKjW2Xdz20/1/1t6RcBmcMop2cOn7YosnI+KhilaSvISeqAFYQL1/J2q2y1
         NJ5nsfKE3Bm7McpK3J91ZwhafSDnZmXTkAUe65/L2fOEUer1r163n7hMlcLy2vCyC68S
         E7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675346; x=1791280146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTnkPHgQSlDy8ZNeeMa28BcMTlxq/pJPabuX6okJ9u0=;
        b=kyApN2Dy3dLrseQ5Qcwv50xsDsznj9KivnHaUvf8ISmy0dYAZh/VbxTfRg+GLpFqJS
         0sU9cLlIJoAd843XYLrM7Aw6my7y7rh1rl3qsv7w6or3G2Dq1WOA4lhZffHR1VDQwwy9
         nOCvdzy5tOx1hisZR+GL/E2Yzc5EtDzOgJ4bH2wgiO5nZxnzv9NIqbShdAmbDZdiBoUB
         WlFz/0hpT/2q+vRMTS0eeLUDiayWVZ2nqDD7kADnewYTVX6n0R9YGLxzRmUvwEGS8AuA
         tZzZge0174Y9uVA3lpXqAeq0xHQe5DzUN/XV01qCfrcRwH+bVLYN4suiMkxoYqhf9wyA
         T5Vw==
X-Forwarded-Encrypted: i=1; AKwUvByX6/1cxfEOSkHkYZJZnAiKHjwCVKQaKtVUxSLpINi3KZrSUZExw1uBPoGCjDP5eo5cpbEmMkxSYdMGUUg=@vger.kernel.org
X-Gm-Message-State: AFuF++lNNrO0ZFQSLmJJrr7rsEOxJlC4F5L1YZiTSq9tuOsUjD5eWIrp
	hNZGu8dnPwx2VeoPp2VrPM14xZWx8roMtxg8oiuVLG0cOAUIHHH9Ca4/
X-Gm-Gg: AYBFou1fXgNEdW9TWnXhMVrY5YHmDFy67aZmhwle0ZZHbIYKmELf9k7ZRKlc9eZN8eq
	hJUtEs8jPZ0ZsgjpX9rH21vCcxaZeK0mWclfTb0YeSJuZkRt6447SeWE/wBcu0+TvpnxbkTZ2l6
	Xij6jI96GxxGlqc+CgeIbvIA7eRB9/+02zn9oeVUzBWp2cyeuyc0TWxsXbbLp43HpC12PpvVgvB
	fnzMAu79fMlWCbS3Lv6CuIR5vDSkCRxm3noU/ui/XEuylFrB6zii7SxeVbMJI8v+MRnseiSBesa
	qquTCcQs8lzq96jVn4kJrnXDiL9DPCNbXW53UwHkRs/KnAjGLmlRyxSrY98w4fMAQ40detgKk8l
	WVMAMTfBTBnmO//mgU68TRcKbfBXvvojZY/N9KTfgvWMLyFbuMdLmuU3zKZB8lVxhWTiDItdXaf
	qshOXRl32BRqsdkhIMifAZXAtzrn5j1jD5EAWUgqIkVsbnjHMnIOt2Xq+MvtDdqBnCii4hyD2gT
	ZJq
X-Received: by 2002:a05:600c:348e:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-49ff06b2ef6mr213390545e9.5.1790675345917;
        Tue, 29 Sep 2026 02:49:05 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.113.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b72fsm89821455e9.9.2026.09.29.02.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:49:05 -0700 (PDT)
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
Subject: [PATCH v2 6/7] vfio/cdx: keep logical vm_pgoff in MMIO region mmap
Date: Tue, 29 Sep 2026 12:48:47 +0300
Message-ID: <20260929094848.7439-7-suruurism@gmail.com>
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

vfio_cdx_mmap_mmio() overwrites vma->vm_pgoff with the physical frame
number of the MMIO region and passes it to io_remap_pfn_range().  The
VMA is inserted into the device file's mapping->i_mmap interval tree
keyed by vm_pgoff, which VFIO expects to be the logical file offset:
the core links every device mmap to the device inode's i_mapping
precisely so that unmap_mapping_range() can revoke all mappings
associated with a device (see vfio_device_cdev_open()).

With a raw PFN in vm_pgoff the interval tree entry lands in the wrong
coordinate space and unmap_mapping_range() cannot find the VMA,
leaving stale MMIO mappings behind any revocation attempt.  Keep
vm_pgoff in the logical VFIO offset space, as vfio-pci does, and pass
the physical PFN to io_remap_pfn_range() explicitly.

This is defensive hygiene: none of vfio-platform, vfio/fsl-mc and
vfio/cdx call unmap_mapping_range() today, so no reachable
stale-mapping issue exists.  Keeping vm_pgoff logical preserves the
VFIO core contract for any future revocation path.

Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
---
 drivers/vfio/cdx/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/cdx/main.c b/drivers/vfio/cdx/main.c
index 28386fdb01f2e..ea55b7767672c 100644
--- a/drivers/vfio/cdx/main.c
+++ b/drivers/vfio/cdx/main.c
@@ -254,10 +254,10 @@ static int vfio_cdx_mmap_mmio(struct vfio_cdx_region region,
 	if (base + size > region.size)
 		return -EINVAL;
 
-	vma->vm_pgoff = (region.addr >> PAGE_SHIFT) + pgoff;
 	vma->vm_page_prot = pgprot_device(vma->vm_page_prot);
 
-	return io_remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
+	return io_remap_pfn_range(vma, vma->vm_start,
+				  (region.addr >> PAGE_SHIFT) + pgoff,
 				  size, vma->vm_page_prot);
 }
 
-- 
2.53.0

