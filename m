Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB132652B2
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789851977; cv=none; b=iR1ZfNgS3/gkDRsTtIno8oh9mByNVoRNCvWXaFqEKoL4GrozSgLNDWQWX9ioXb7nSWIdXOJ2g79gBVAKM36+P0C+CEP6NznGn0eMwtD7OMg5cNfqewpdbewg+bhjdS7ORfU/hCsIYRwe1HjTZQy+pDTOnYPef98eemcESYLsh5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789851977; c=relaxed/simple;
	bh=UVtKRswMWDcm6S+pSYU3SMvTFc+jQWmzdViwStdDLOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q7zxMZxVjeNtOxFmv62hmFdV3bGEG7YwEBqmL4K+kzq96WRw/WqxrIZTWvkH5Njqk9E5AqkyURUIeLronfPKe1DhmiTLMWbYyuhypb0vOAb93/ADSDoVtbyFIBjk9KHeAzg3nWDUpheQXUKFdkMzgWs/AOkNqdN8kETNtJYqlMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONqTbaJf; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONqTbaJf"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eefae4so5426925ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789851975; x=1790456775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=82hNcCASzwnnQ3mn30WFW2aXkTjNeDCsU0d5QUjn04Q=;
        b=ONqTbaJfCpAhb457yjYMUpb1zAxyW69EaVRyV0R0KIJEJwCWP/J62ml8+189ygf+em
         chzoDr7GFxs4V8/xwId6MJvYtWsPuXACVZTgrgZ6JJCschg7N//pT5AbA9EBfOOwvSzc
         U1JCbm1HH1XA47ccOC0MP1xgZqC+FnaZpsyl/nfwQ0F8F8PpyTLBH6NWMpIJ9EkcN77q
         0wxHAOnN0xY9ZtL+JpytEsSFymw+cvb695Oo9or9WGq2ek5mY21YDZss8EeHJPGi4N0i
         vAL6vflw9uOvaDFXFQiwmsZfODsrBWfVkc+BdkPV3mHK4gBHsDRbCUTwx1DYumBpjm9/
         ztxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789851975; x=1790456775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=82hNcCASzwnnQ3mn30WFW2aXkTjNeDCsU0d5QUjn04Q=;
        b=aC7X1lb4hrK75kcmAL/U88RItGP3puLO6FMHUGJI5ibMZsbaSW6fZPApiPAiXZ0FMZ
         8qb2+0BCNMukkNb3Jzi77JepKa30Z5buiyKg6MZKLZZ4m/KqaIsthnbfYwp2z4+306I3
         oFQHuH+mHgQTzaSDLNINqcgvr7eWmzMPgzMUC6wo/o6DeUrI6DBQ/wbBW+h8+5oGIEB2
         1XCeMVEEFUDwES8SGBLw9iQk4+f83+kR+4/wR13f71gTdpFY56KLc0h+nGiod1CTq9ZS
         urCo+3CBSqJY6vdp6RRQ+W1jEus7fEP8EpElwj9JfYIIiI60TvDMcZZacLtH9vQG7LO3
         nJ+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwowH9pU+EIMext2n3/xmROFWMSrI0ir4EaZsu9daoo4fPbhojJTf6+FQXPdRFGER/ud6X70KXLDmiUIoY=@vger.kernel.org
X-Gm-Message-State: AFuF++k0VyQx/UWBHkPHsyMmxNKH3c4ybjAEwNjr9OuQ/mNPsQ6VcDPi
	oV+r+wLL6y1pdJED7yM9ghCb7v37eprf9TrYNrNPxcXAvdLEhGvUW7avg2S3Mbdd
X-Gm-Gg: AYBFou17LERBJ8yJkb4OzYPVqa/vLfHT9ilwNYIOgzyl43Gj6vtynwrGNJ/mGDgucls
	WFmOsxnizZ1hyYiINl6bSOwRG7RHyCopL29mTEQVoPvKohHu+bTCU8DJhiEJf2H1eltyhHpKfAC
	iLCC9RZxCm1dCsRgQag1Mm/3UobkswgLOjyhCmv36WwGQV5+u0ITVTK8K2v+bABaLGZcATM+TTz
	zsS0bdW5o+Qnf+rHjfQdvypYMC8f+NBGufP680wmsTNJglQzNu50RX5Zc5ECo9xnG3t54x0kgY0
	AgLAu/CRPfAcNdR7tm7bXNeltyXOxjq0SpRb+mudFEupdCHrpVvw/Fk1t3BrwofyNx+aujoopfc
	gZugV5cQWadXG//3GaMtxYH6PZsipdD72tTy//pCfo9FPcimrpWGJAtDz7YY6vqTPM74LWYsfg8
	r6OZlhQoqDuITfMcpDreoOOaBHZQXdgyjCYilhirUttYhvvKcbjdTjl84nWDwh8CSh2xSlsHU1f
	f6vmn7pvL8hQT3wWLoLSYPyOOZ+k1Tan8jjIhk7erqQmV1zcM4k8iKBZv8cOoaTo9P4bz/ipX/9
	LuSKhX7eT9w/DhvmDDgX
X-Received: by 2002:a17:902:9a06:b0:2dd:c100:2520 with SMTP id d9443c01a7336-2ddc10025ebmr25871935ad.41.1789851974831;
        Sat, 19 Sep 2026 14:06:14 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc1788bcasm12804445ad.21.2026.09.19.14.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:06:14 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org
Cc: vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	bgeffon@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/mremap: account unmoved locked pages in dontunmap_complete()
Date: Sat, 19 Sep 2026 21:06:12 +0000
Message-ID: <20260919210612.3028241-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When MREMAP_DONTUNMAP is performed on a VM_LOCKED VMA,
dontunmap_complete() clears VMA_LOCKED_MASK on the entire source VMA
(vrm->vma) before vrm_stat_account() runs. This assumes that the entire
source VMA was moved into a distinct destination VMA (new_vma != vma) of
equal size, transferring the VM_LOCKED accounting 1:1 from vma to
new_vma.

However, two cases violate this assumption:

1. Partial MREMAP_DONTUNMAP on a multi-page VM_LOCKED VMA (vrm->old_len
   < vma->vm_end - vma->vm_start): vma_clear_flags_mask(vma,
   VMA_LOCKED_MASK) clears VM_LOCKED on the entire source VMA of size
   vma_pages(vma), while new_vma only inherits VM_LOCKED for
   vrm->old_len >> PAGE_SHIFT pages. The remaining unmoved pages in vma
   lose VM_LOCKED without decrementing mm->locked_vm.
2. Self-merge in copy_vma() (new_vma == vma, when new_addr is
   immediately adjacent to vma): copy_vma() expands vma by vrm->new_len,
   and dontunmap_complete() then clears VMA_LOCKED_MASK on the combined
   VMA. All originally locked pages lose VM_LOCKED without decrementing
   mm->locked_vm.

In both cases, subsequent munmap() of the VMAs sees VM_LOCKED cleared
and does not decrement mm->locked_vm, permanently leaking mm->locked_vm
until process exit and allowing unprivileged processes to exhaust
RLIMIT_MEMLOCK.

Fix this in dontunmap_complete() by subtracting the number of pages that
lose VM_LOCKED from current->mm->locked_vm before clearing
VMA_LOCKED_MASK.

Fixes: e346b3813067 ("mm/mremap: add MREMAP_DONTUNMAP to mremap()")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 mm/mremap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mm/mremap.c b/mm/mremap.c
index 7c368440fafe..ff794e24f78f 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -1335,6 +1335,16 @@ static void dontunmap_complete(struct vma_remap_struct *vrm,
 	unsigned long old_start = vma->vm_start;
 	unsigned long old_end = vma->vm_end;
 
+	if (vma_test(vma, VMA_LOCKED_BIT)) {
+		unsigned long unl_pages = vma_pages(vma);
+
+		if (new_vma != vma)
+			unl_pages -= vrm->old_len >> PAGE_SHIFT;
+		else
+			unl_pages -= vrm->new_len >> PAGE_SHIFT;
+		current->mm->locked_vm -= unl_pages;
+	}
+
 	/* We always clear VMA_LOCKED[ONFAULT]_BIT on the old VMA. */
 	vma_clear_flags_mask(vma, VMA_LOCKED_MASK);
 
-- 
2.55.0.1082.g2b9226bbc0-goog

