Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78027496D5A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993427; cv=none; b=MC9LVCNQfWCn6ocS7L18K0omZFkpYlanl4GheFm/Fgxc62Vb+wjPnRt7rR8HbP843/rYMNjZPR4XrLxePkoLf802KYpFu7m/3WtVAVVCRswVxrM73XBe5QDajvlaXrncCY7XyApr1iXjNR8iucEkwX1s4iJayi1cOjF5vpR3keg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993427; c=relaxed/simple;
	bh=AIdwN2utZ+S9OIGhkxgi5YqFtL0V+PJG7pH77YVnr4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pOmvoTf77X5IGPU6+UoQAJs6yuy/QyNIO3y5J5AISnJR3grhgiZnc7Z3DKcIzLE10kaLlbOxEPu5Nn0GyJEfZhLGMOFQzXnB3iyk/XViaP7brUHEcV68Adz9l6FTyMx/vwpikVoJmrT0eAsJSoxt/zLBrd0GQrOnYDGUCXZ3z24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVvYqyXV; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVvYqyXV"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a985e8fcddso3543666a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789993423; x=1790598223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsqvDPr7iq6cd8ngK8PdM5xwS0CUZIiH+1Dv2KM9pss=;
        b=GVvYqyXVdKnyNG3psox8nXHi1oxOaoKiGyELuPLRUZ5k+fP0hfEgQ0JaC3vv15vXw5
         OAeML8YahcZ15ioj4UqJCbVbBf09fGeGhE+ovyN+Y1dFFlxFrXUecG0u6MHU5/dQ8lJB
         FA2SwSivNt0oyR4JIcGp5RpJzGme8BAVq3J0OTGkeDWL2o/BisUJmHsuxqK8aP6OESxQ
         3xDOOQ+UXp+zB+8nLHk7gVA5Ig8rOLAiyV1BDtT3eh6/cNvqeBx42DI98NuK4C4K20Tn
         N0PLxH2y+Gul8iiIhhDQwltgu67WMyEvNAXJcRwXjJfobeJHtH+8u5rqEKrFzuAmm3eL
         qs0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993423; x=1790598223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KsqvDPr7iq6cd8ngK8PdM5xwS0CUZIiH+1Dv2KM9pss=;
        b=Q14WfGF0H0p6gTVFpDeCpe8CU68KPiDEkvEKniW9sRMaImAhYGDISKlMqqYFzUnRNW
         K4mnRd15Y+RGAySiL09kl9iZglq3xqB8YU3qmaqEGyHhA8SiUp1K01gTpDK49N2+E0d1
         MoJFBGbFYXtKD6YF1xfpBAL8WuSi7voYrfa2QFYMSkc4DbyjBdb2jzl+EzHqPr9DCiUb
         lUhA64aGyuOOBu4hBRa7aObzWw/SFCmADcJSzbeKaBUYG+GzzCP6pgm+JZLImZB85TvS
         HjCHfExUMgrq+37MaaV9dqUGd06c6gRUVuqa5bjVvveY68Q5OP8SXYNgCMkOysgYKIkm
         BEew==
X-Forwarded-Encrypted: i=1; AKwUvBy5wdijOqtLVA68mIzx9/sGgP4umxF8aDB4xsUlk6TfzDSDHiiFjR0TEw3L8TUZ4he9X5mQ7agdvYZLyk4=@vger.kernel.org
X-Gm-Message-State: AFuF++ny1C3CPsZcw5Lsi6q+wq/8CN8aY0AxSl26mlJ7jGBNaNyeYm+J
	YcDhOyKMFybUF2T5PHtKKsa+GAD104dArZBGj/oVUYaBFgaFPIw9/Bgn
X-Gm-Gg: AYBFou1nnJxMFVf1w6APUPMY+U7ATHA7YT9qsQJ0ZaAoVuNVsxccTkRatsan04X32pf
	M96Y/QWvFuniNCWaBAicvv6AvpaNo/PgcG4KUyVSQR9UboTSQ4WgbwypiCp8r/fOSxW1lS7qCjD
	d8u+9QS2brft68DtGQkzqQ2e2HYzah+U9yZbUlOemQPLEQ3ggLJsnWNRNeDdE6XeTEXjWIvfYVt
	Qn7ThTSNEcovTAh5zkE9IeRNYRZtCEpkOLHtTr1ydc3tRc6S6A0908YkpBr3/CN1WH+NvMz9B00
	LEds65sEDkR9Q+3pAz8Xgcxs8UyiIAiIYbl2aUHC3lRohaTAfGvhMbx59kcO3NehEjzeot5sCKF
	JLMEmg74P1hEdGhkY1axx2ID4GXyhHhsoFlUHczR7vVKiNzMBU5gYKN5dQMdQV3DAfFN+kLZtc3
	sKmW7EvfuPNlYCnxxQxXCw25q7jIJnvdo57MdyZYJvq0VBWaRNEELQdwOvN/Khp27IFRlupwG3E
	DHA1w==
X-Received: by 2002:a05:6402:434c:b0:6a6:32f5:556f with SMTP id 4fb4d7f45d1cf-6aa562e21d2mr8202167a12.17.1789993423220;
        Mon, 21 Sep 2026 05:23:43 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.112.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67b5eddcsm4228761a12.0.2026.09.21.05.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:23:42 -0700 (PDT)
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
Subject: [PATCH 2/7] vfio/fsl-mc: prevent read-only region mappings from becoming writable
Date: Mon, 21 Sep 2026 15:23:29 +0300
Message-ID: <20260921122334.2099-3-suruurism@gmail.com>
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
