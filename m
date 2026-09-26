Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144083BE17E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419881; cv=none; b=SwGnXroA80M+9QZ0G3WisJ5zpbV7B92sYFv1LW5StirH+30xavlD2WJR+Z2407fYMFLNpkGPaxJOSiQ1+Y89kEOPdNRUSng9c2OZrW0HuLGRLN7TjhXJaYJcHPGY8atxL5uZMJ2ADtsQ1RkTUdnRmJWSlDL207s+U57jQalB9XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419881; c=relaxed/simple;
	bh=4LUXkhF82+wYvXhjC2uAbOQL+aa144oON5hXHL+RpQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJrc8ZCeu3Q8+emch97DgF6HyvyafTmQbuRdhbDB/fDJTZAauyJ1OOD3Irn8t6e8xeun+R9q4sNu+ybSkNt4X21wLnhKkNXYHGzqueufmcHvNBRBzsfGe3zDBmby0QJkkoKKCZgtHtXwgJZXMMex3HRUVmXYl4pcIFBIwgxVs3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=U27xRN6b; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="U27xRN6b"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-52fb76ec395so15833531cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790419875; x=1791024675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reM3bvpTAJ659qLf9u3c5WYxIz1dkkiHph331s5crXk=;
        b=U27xRN6bh8lw0Y2A5Yg++RUZ7tHT1+eNJqvxQjUbVYnZG29u28JRbvqZLws3qCLNHd
         r5H+lM6cQHkbs5y4cpBh1UFyHTZtfaMGm6kuh5P3Cc+dDZdvUSrL91r07OOSdPdcdhlt
         64nJKco91/jHecv+9gvDB7iNbxZY81+YWNf8VmCEDlD3yT75++Hjrb57kfQbYIy/pNEq
         b0HBVezTTeeypdXgiU5+gZ7TUocRgI82UslWDn9xbnAPEnaS/YsNlHeowtlcCMxKHQ8F
         3xbUZDKFOtNqOy2++9omUvgPSvYSwpTDJXa5qhTxcShwm/ZCn7/pzU7EuHT5xJF2A5Ts
         /UPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790419875; x=1791024675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=reM3bvpTAJ659qLf9u3c5WYxIz1dkkiHph331s5crXk=;
        b=rm4w48lnzugPS8AiNkphf9PlQshls7xnJm4AX1kHkqWgBy2WC69TCrq9h1YZCfX4dX
         r2a9ZktLDMhQnSuL16hdiQlf8w90Z21gC+FA+xGf6nZcqPfZq+VgE2FZDNaEqYjL5CLd
         zZUDjT2y0p3w8K6VkyisgxbP/AYEk9oB7bWD35GTG6cdwxzKFcF2eNG/0TqJO9Ppf+pX
         j3OxCO+f0gpAE5scS+nMX5Bm139pRd/ewtKCIgyd2TrqMCMMGmX3051ZaQ4RbTNiTuwu
         Oxap3vJln5Fk18wBzhGNECaC3kzM8ua80f7YQoBPYrlcbdkgXt0rdqwuBcz0uN3YX2gg
         4y5Q==
X-Gm-Message-State: AFuF++n7OiQ56Yy9rL5Q6hvMdf4HLYm0mQJpRhLheinCZtrY6SXQ5jWG
	ba61GKdB6qykC3ZGcyrYm4S0gNNtOF22flQ0ho6BvXsSlbKokUqXwv/wMKmIpTMknsg=
X-Gm-Gg: AYBFou1q8wZLSeiE2Ygb9jdRWbBNzUAuM/VxM/9KGQ2UaLo1uFMFmDd24igA0DLgxU6
	py8AnNommT85IO9t425Ya7aGRi+aOQ2xFyJfHW0mZ8p+NTeW0Efkbrup0hZm2dFBiBIuB96gefh
	SYqkx11KZwhfQ3e9DOGIKdnRKE21fpgAvle29rSb9fVFEvm6+EGbkVpyYc4qDmV78Fg1a3eqWRX
	/7eCiiOIoxY1vlxNMTBrsUi2juUX843timwjZZkw84R2J7KHxKK59qApgg4jNbeBb4rjgWRvssM
	15dYaaRg0LzuOyZiiiXaWP7UMqNQ52KakloVbmqH+XGIxw+8cH84lQu+n9T28YLp1VorXeIsHsC
	ujL7fUKaYk+BAmTsnzUxlJtpUyuoNlRRZqQCvyu/19jLAblg0qyJyR/Xxew3y+K5TU4L4vy2KGx
	B+GDOsrE2S5+b8bwpJW04L2VI/sN0UaHM2W2tZnxc4A9/pyyNO16EdD9GlfB8o52Bn0P8rJhU0N
	pepbpWImLHaQDmExHhr2YSEmjbUj25IxJcRi2Z2PDWFwJVdiWwzkGq/kfm1
X-Received: by 2002:a05:622a:4c89:b0:51a:896c:9aae with SMTP id d75a77b69052e-5330b58ea31mr96997851cf.13.1790419875616;
        Sat, 26 Sep 2026 03:51:15 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53322422063sm15060361cf.28.2026.09.26.03.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:51:14 -0700 (PDT)
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
Subject: [PATCH v3 1/2] mm/mempolicy: use vm_normal_folio_pmd() in queue_folios_pmd()
Date: Sat, 26 Sep 2026 06:51:09 -0400
Message-ID: <20260926105110.2156652-2-gourry@gourry.net>
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

mmap a VM_PFNMAP region whose ->huge_fault installs a PMD through
vmf_insert_pfn_pmd() - a vfio-pci MMIO BAR does this - then

	mbind(p, len, MPOL_BIND, &mask, maxnode, MPOL_MF_STRICT);

With a stand-in module for the driver:

  BUG: unable to handle page fault for address: fffff96dc0000008
  RIP: 0010:queue_folios_pte_range+0xaf/0x440
   walk_pgd_range+0x52b/0xaf0
   __walk_page_range+0x6a/0x1d0
   walk_page_range_mm_unsafe+0x193/0x230
   queue_pages_range+0x64/0xa0
   do_mbind+0x25e/0x640

queue_folios_pmd(), inlined above, calls pmd_folio() on that PMD.  The pfn
is raw MMIO with no memmap entry, so the folio lands in unpopulated
vmemmap.  Neither guard stops the walk:

  walk_page_test()         skips VM_PFNMAP, but queue_pages_walk_ops
                           supplies ->test_walk, so it never runs
  queue_pages_test_walk()  honours vma_migratable(), but only while
                           MPOL_MF_STRICT is clear

A VM_MIXEDMAP vma needs neither flag, being vma_migratable(), so plain
mbind(MPOL_MF_MOVE) reaches this too - and there the bad folio carries on
into migrate_folio_add() and folio_isolate_lru().  mshv_vtl_low is such a
mapping.

Use vm_normal_folio_pmd() and skip on NULL, as the PTE loop in
queue_folios_pte_range() already does with vm_normal_folio().  This also
filters the huge zero PMD, so its separate check is no longer needed.

mbind(MPOL_MF_STRICT) over a PMD mapped VM_PFNMAP region now returns 0
rather than -EIO.  The PTE loop already returned 0 there.

Fixes: 3c8e44c9b369 ("mm: mark special bits for huge pfn mappings when inject")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260817220810.1175596-1-gourry%40gourry.net
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 mm/mempolicy.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 2063ab7577d7..40744658483b 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -667,7 +667,8 @@ static inline bool queue_folio_required(struct folio *folio,
 	return node_isset(nid, *qp->nmask) == !(flags & MPOL_MF_INVERT);
 }
 
-static void queue_folios_pmd(pmd_t *pmd, struct mm_walk *walk)
+static void queue_folios_pmd(pmd_t *pmd, unsigned long addr,
+		struct mm_walk *walk)
 {
 	struct folio *folio;
 	struct queue_pages *qp = walk->private;
@@ -678,13 +679,9 @@ static void queue_folios_pmd(pmd_t *pmd, struct mm_walk *walk)
 			qp->nr_failed++;
 		return;
 	}
-	folio = pmd_folio(pmdval);
-	if (folio_is_zone_device(folio))
+	folio = vm_normal_folio_pmd(walk->vma, addr, pmdval);
+	if (!folio || folio_is_zone_device(folio))
 		return;
-	if (is_huge_zero_folio(folio)) {
-		walk->action = ACTION_CONTINUE;
-		return;
-	}
 	if (!queue_folio_required(folio, qp))
 		return;
 	if (!(qp->flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL)) ||
@@ -717,7 +714,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
 
 	ptl = pmd_trans_huge_lock(pmd, vma);
 	if (ptl) {
-		queue_folios_pmd(pmd, walk);
+		queue_folios_pmd(pmd, addr, walk);
 		spin_unlock(ptl);
 		goto out;
 	}
-- 
2.55.0

