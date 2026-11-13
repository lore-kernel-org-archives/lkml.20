Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794544965;
	b=PHs3/19SbdXF3E9r/zd0LHOE5VgYa0RZG0dGJ3q96g2F20n2JYhCDP8v1m7urmHZEYLK
	 Uj6To6/hQw9WgG6dxn0GfupN0jz/xKrtbV/YltZtyUkYFMVO3vOX9Ic6JunYJwhssDSII
	 kEjjzC88UwfIBk/F53P3PyhpAHpBirFkgILna27OdZzbyZsgCpL552Ck3OnxxOkFXTicu
	 zd4t3YRs9EFfp8PFZgTI7wC4iCZaxPyfynxRulZkFH+N5citDIlDJUsVXpKwh1oRRsPUw
	 BK3QuejpCOGIqfkVtzr1wx4AW+c8y610YK6OzllrUNej7LLQRhwNNQ+Ib/dEeo0Is5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tk5rSAMyMBpK/2/Y0715hQ2D01LoATP9Sswc4ObGJoY=;
	b=3ZaSGzM7XPoTSXi/NT0dLnQT/++C5vw61ZFebqu3c7bBvH1bMWFRBa4MKyvDMzzFKIlv
	 5NWFymLTpjfb8gR5O7Wc4XydLQUGxVWfNZHwHSGFBRZx5oJbtmCV/2fRX7EPOdM/jsr4u
	 bgo4nH1RtROcM2tNT/wqmYFOKQfa+g5WCGCeYBPrZnEa7XjZ8DibXLbdwutqvb5SbJ6ll
	 CYxahpB/50jF3FHLoRwUjF3SqfnRtnQT+JVD3DAOo6S10SJgTTp+KUT3KVlFew+fUYhxR
	 By4ffXbz7PQbHFkSifdt+MyFH0KM7MYKLMnheR+HnINolpFuKP30l4tcXJCsVhATdvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0Ab1LxI;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D89606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0Ab1LxI
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5430f70c827so9610351cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794544964; x=1795149764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tk5rSAMyMBpK/2/Y0715hQ2D01LoATP9Sswc4ObGJoY=;
        b=i0Ab1LxIQLINlj2OVwOpIzAvnRREb7xfUvY6FjDS/bCgQpIOV25MIBlrTeMhXWcvRC
         ypDqTs4TsGDnwflb9wGLeSUvMgtAPown3raxmOEa0UzMMrKuprtnmHhjY9+pqYQzvzJa
         r0xz8Qvim5WdImbt1y1km10rZ2KlmHLMidpU2G/kS+Xm0vhRvhvuR+I6h+hRbkY+XBz9
         xlDNWuFHN6QBrpQaMIMtjc7nTkCbXygpoQ4TxCxErCwAc8lNpXpVStjLJ6z7yXC8yX59
         56zR+o4gWKvK2bwwf99g0ephxWAwVDVFOQ5yoW5/M+t5xKh01myvdifo0mlpBaAQK3Ks
         5WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794544964; x=1795149764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tk5rSAMyMBpK/2/Y0715hQ2D01LoATP9Sswc4ObGJoY=;
        b=xXJrVxN8MOYhl+mo/UlgPQqwBAlBFtWj/PHzYUhNN4Na5OO2h0XBIeH7pZOnXAKDQx
         SX8YY/u3UnMaGdb9RkVvnwystfSppouZANJufGMmqwFsGldG2JB0XDvdVq2Z4uDp7qhe
         fVlj04m9Bbwl+KlEYCyKTmJgqxPxlYa1zfoWmq8dY9yzmxbTzRoNpJXQSSq2hG5ou/FD
         zybwbMVVaT/TPeWDeroCU0DCK5/TnSdXiTjVac0AhcDz/+CnzAAemtwuuDJln6Hhi8In
         4oksli7cUiIT6xbr1O7kiWHjmIj+UGgw9/ddTWHoJbdD7sY6sfdJ+LWd6L3tsI3gxmJD
         h8xg==
X-Forwarded-Encrypted: i=1; AL+hErFlNbM89bF8jASyP8nHo3UO7xo5x23wQHLhxPNRxvhnWH+hc/raNuDpi372fUm2NfsQu9bdYhyvMGSWjvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GjEqHFZkKzP2OdcRha7KEhd6PG9r4bOSVQx16KD2IX1APc355
	h3WqQ7nW3jXUoltUyEMacAaDPyUEeYhpDyiXU1MsvDYOk30+ZNBVoeRT
X-Gm-Gg: AYBFou08yVqL1YySxyjVme937ETfjWfnYMT5iEIWPV+24XyagGco2jfbhAyJ4wkWooy
	cgokXuPEAeRvSs3LL3zzJlhXLKzlPz2ObdOyscCAKAROx9dIudK0LX28FFImjr5Nzgq20LQIdVs
	fjTZv2qvncnRKCvnwOxFXyGFYgyyiHLQX9CuVm50FGK780GMW52iqWxnj2Z5f+9ZE3RnrO+wR1U
	xof3jCS8YyxKm3Z8JMgjg8bl0bGpgErgieGYqzVHhEFpurix/7Xizc7/6v4Z5M6G8W+bbkmvGL+
	RAM2mk9jwleNE/KG1O9K0oSfDRoa3h+QdkNQ39UTjANNp99o+9LYOAkVrGNGMvlQfj0/TD/4nk2
	JfxMfFMHbT7XMd+UDMM6GSOXn2YJCmY1e6ljwz8uzb/DIsVsDcYBm5mdnge3LM8sV+Ca+C4KRrm
	vuVNdu+qMb1aYEGjygOgeHwenoU5aAa9wkHLKYCGWPEYnIuRwQS3Vf2yheNCIWkg74P6CVEVLpF
	czwoh441PMcRc4GEjYVg1sAziJ20jF5EDYmQo78SkoLXc7W5bXNny2zBxNS9skJHEtrbMs83GKo
	sEGc5H+H3z0tHZBSUYHOVWo30TfY8jchPKw3p+WZlBOTfFtyXxvUgtzWT2swKhVNHH6GjqF0vsk
	=
X-Received: by 2002:a05:622a:590b:b0:532:c181:8fe9 with SMTP id d75a77b69052e-55ac448c6e7mr23800341cf.9.1794544964243;
        Thu, 12 Nov 2026 20:42:44 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad14f1ebbsm10605221cf.23.2026.11.12.20.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:42:43 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] drm/xe: Release the SVM prefetch ranges of unparsed ops
Date: Thu, 12 Nov 2026 23:42:39 -0500
Message-ID: <20261113044239.2185984-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vm_bind_ioctl_ops_create() stores SVM ranges, each with a reference, in
op->prefetch_range.range for every PREFETCH op on a CPU address mirror
VMA. xe_vma_ops_fini() releases them only for the ops on vops->list.
When vm_bind_ioctl_ops_parse() fails, the ops after the failing one are
never added to that list, and xe_vm_bind_ioctl() frees them with
drm_gpuva_ops_free(), leaking their XArray nodes and range references.
A PREFETCH that covers a userptr VMA and a CPU address mirror VMA after
it does this when pinning the userptr pages fails.

Release the prefetch ranges of all ops before freeing them. Ranges
already released through vops->list leave an empty XArray, which
xe_vma_svm_prefetch_ranges_fini() skips.

Fixes: 09ba0a8f06cd ("drm/xe/svm: Implement prefetch support for SVM ranges")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus DRM_XE, DRM_XE_GPUSVM
and W=1.

 drivers/gpu/drm/xe/xe_vm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d25de5652767..ee35ead79371 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4208,8 +4208,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
 	xe_vma_ops_fini(&vops);
 	for (i = args->num_binds - 1; i >= 0; --i)
-		if (ops[i])
+		if (ops[i]) {
+			xe_svm_prefetch_gpuva_ops_fini(ops[i]);
 			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
+		}
 free_syncs:
 	if (err == -ENODATA)
 		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

