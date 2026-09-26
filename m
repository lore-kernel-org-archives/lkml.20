Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953CC424D59
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419881; cv=none; b=oSTALvgYhMXOM5ZKfZNUTQ6r82rSlUobhhVp7yfH0Sdpwy+z0w1WTAvfWjrn1Ii2YSekL7RskS3EQ/7QNSr+KXYyBLZpRLwQXotRVI7YDy84Fc6aQfFCKQpTNPRi1j3OU7CXr0tQJAK3omDNYPT9Jk0yO0AcRjjm8jTuOoFz4Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419881; c=relaxed/simple;
	bh=p8ORfN9N1BvBiIfNdyK1EL1yqSsunDsvGuDRaYt15QM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vd3QjLS28b9EV/wLNjdpI92dJOW5GSabHxjKhadIO6j1jCUG085mEBakS/NMpaPy3jNIGnEA6pwwT2R+fyInM5Ij694gMiNfuKP9VDzTHMT7v5DjfB9uN/pWajJ8wikvWTWc4HZgrsWaACFxOW4EMIGAiqQyskYj5y1WT9YC1U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=UadDcNhw; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="UadDcNhw"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5332b955bb7so2437971cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790419877; x=1791024677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4S3VSL5jcx+g44Lzd252R2CJu0ug8jx5f4c9i60iZqU=;
        b=UadDcNhw4AEKmwPtOl4c51xSQxyxPq/R8LD0MxSOARyndxXBH51HZwQDebgnC3dETU
         MRJhvSVIGbb4NR1pWC8vh3t3r8ALiYNQxFPJHmRZPnCRc/KEq8zxQruciPNZZvk+oAmC
         0w7F/BWUeW33freIV4dnYO4YsKWWwW1PQDhh4oD2hByv1nMBP+54VBDy5f7BmSK+9lEj
         S70wYsJsjFbg7r2Ddo8Pyd+b3IKnLF6YvHe3mkG93cw42Q/4WLA6tczXmcTjN5WJjz/X
         S210deEDInSbTktzzLNblbR7TupHueCXBDa+UaC1Hp/pw/R7A85aEmCOXgZ4RwpqM5JP
         eh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790419877; x=1791024677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4S3VSL5jcx+g44Lzd252R2CJu0ug8jx5f4c9i60iZqU=;
        b=u4a3SdhXc7VgFiNgRgh2MEyr1uWO3HY4TpqrAoArfRhwq+WSU/X92RDI8OWrBSjusz
         RR4xhWPqbsT9St/zc8Eed2zSa7xHoCoPAyWqbHhwLiC5xYmkQ5z/gv6q3UqDYoIJkE58
         OSaqWsdV6eLvBVK+SwsdKBCo6Axx0813S+jYqyI5r1MG+8Mi7gldKJIuwjBapcujMlo9
         mN1AC/caPz4qn3yn2ICc0aTw64ABiiqArw7nnNr/4fjXSIn7tkRHJQfmcSjhNer4Bdm8
         uvra4PFJRkowM8ELd/lrUyWOtQmVigkkuScov6Au5DP/jUKKiI8I+hSJqJB+VtYqOVut
         rmqw==
X-Gm-Message-State: AFuF++m4ueTnQuB0Py8rbdGht7qZZXw3Bot5lMFx6rqblqUpEtKBeqgO
	r0aOYmj1jv1CrvnUnvPsxtKPjTgagTN4u54zqvoRwFRi0okDGdcuiZOk7AV1BDRh5SI=
X-Gm-Gg: AYBFou3tVCqZ0fiqzipszRQFvWYmQ4H7QSrlSLcyTvD00I/2GaavQqGRavB4G4PDbfw
	S9S2GkzQpzc4fj/mS1Bl5AKMCUiLL3d1HV/Rs5uJ90C77OcUjqfshyIrExMbKIDhjN1+eF1w10/
	zcmCX4XMpksaU6FH6xH8/ygAmmGnlDfBR73nu7QA38XK1Ma0orL/UJdZ83eQ7+zIlvW9zBairVe
	9YvS7ZM+1V8AGZ1sKljbKapmS7xnVMVK4cYHqNZu3hDntx7f+L+Ixl9dgibWe2gVoMpzJ0nGxZQ
	05e3OaHBSXmhPOEQlqJ5d+SAQczvt57HPAExzgypGVACUK4G/6dBF1pWA4etlX3XA5VhVgY50tK
	/XVkrSAfcO1/A8D4MjgZMPXuOQHgwqghLLZ7KfaNH4Tcxt9hJFngzt2oWgQiRHIyFENGo+DEwAz
	yrzdhEoI+rjZ+rvoGtvTnpBskvheNKO4axyRulwlIWpunoiel3+T7vKSWK6b4By7hyUgfz/8yV2
	vU4qWxv+CpLwmt6Vk3ht7wnztFWlfyTtlqqiKgIRTYmLIKV63nC5oNJSNkU
X-Received: by 2002:a05:622a:2295:b0:531:1e10:acfe with SMTP id d75a77b69052e-5330b5b9d4fmr87128541cf.10.1790419877016;
        Sat, 26 Sep 2026 03:51:17 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53322422063sm15060361cf.28.2026.09.26.03.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:51:16 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	peterx@redhat.com,
	jgg@ziepe.ca,
	sashiko-bot <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] mm/madvise: use vm_normal_folio_pmd() in cold/pageout PMD range
Date: Sat, 26 Sep 2026 06:51:10 -0400
Message-ID: <20260926105110.2156652-3-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926105110.2156652-1-gourry@gourry.net>
References: <20260926105110.2156652-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mmap a VM_MIXEDMAP region whose ->huge_fault installs a PMD through
vmf_insert_pfn_pmd() - mshv_vtl_low does this, and needs CAP_SYS_ADMIN
to open - then:

  madvise(p, PMD_SIZE, MADV_PAGEOUT);

With a stand-in module for the driver:

  BUG: unable to handle page fault for address: fffff587c0000008
  RIP: 0010:madvise_cold_or_pageout_pte_range+0x410/0x9b0
   walk_pgd_range+0x52b/0xaf0
   __walk_page_range+0x6a/0x1d0
   walk_page_range_vma_unsafe+0x8e/0x120
   madvise_pageout+0xb2/0x180
   madvise_vma_behavior+0x46b/0xa90
   do_madvise+0x108/0x190
   __x64_sys_madvise+0x26/0x30

Nothing validates the pfn on the way in:

  can_madv_lru_vma()     rejects VM_PFNMAP, but not VM_MIXEDMAP
  can_fault()            *pfn = vmf->pgoff & ~(mask >> PAGE_SHIFT);
  vmf_insert_pfn_pmd()   no pfn_valid() check
  pmd_folio()            pfn_to_page() -> unpopulated vmemmap

Even with a valid pfn the path is wrong.  The mapping carries no rmap, so
folio_maybe_mapped_shared() sees mapcount 0, and the walker goes on to
folio_deactivate(), or folio_isolate_lru() plus reclaim_pages(), against a
folio this mapping does not own.

Use vm_normal_folio_pmd() and skip on NULL, as the PTE half of this same
walker already does with vm_normal_folio().  This also filters the huge
zero PMD, so its separate check is no longer needed.

Fixes: 3c8e44c9b369 ("mm: mark special bits for huge pfn mappings when inject")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260817220810.1175596-1-gourry%40gourry.net
Cc: stable@vger.kernel.org # v6.19+
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 mm/madvise.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 61e15d9502ca..85ab9bc76e06 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -395,16 +395,15 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 			return 0;
 
 		orig_pmd = *pmd;
-		if (is_huge_zero_pmd(orig_pmd))
-			goto huge_unlock;
-
 		if (unlikely(!pmd_present(orig_pmd))) {
 			VM_WARN_ON_ONCE(!pmd_is_migration_entry(orig_pmd) &&
 					!pmd_is_device_private_entry(orig_pmd));
 			goto huge_unlock;
 		}
 
-		folio = pmd_folio(orig_pmd);
+		folio = vm_normal_folio_pmd(vma, addr, orig_pmd);
+		if (!folio)
+			goto huge_unlock;
 
 		if (folio_is_zone_device(folio))
 			goto huge_unlock;
-- 
2.55.0

