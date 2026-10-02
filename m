Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E097144C670
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932234; cv=none; b=LhzSqqNO0qUwDTIULPA42N8RR/XOE9G7pzsiQkPoLQlpKfVOF9WhSYrmKWUyQbdnWLRYiFoXQ9sXmXU9evtKgalgX5OtIEZBpFxXvdJyMn2VDeQw9CicCjhADny/rhFwqGC8iB0nPEM2d+g3/tiucZWzJHvgWWYnmiYCPC1MfsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932234; c=relaxed/simple;
	bh=3kwwI3InAXTE2gZIfmO01n48Por+gfdwJPqdjBKbDzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NxyocY2Dqk/bINu58yJKXX9ADgojzQPMtOicwFG8kXlwhiWCwpecW57PCR6jKFtRLPl97NcEzs14aV/tUTyorSdwRTdBJjTaQ0hI1N9p60vhEnII7Ga3Rg5Hny4cZHp1dM6myC7eMBHuockEuJ+tlGOFSnlT7ehH0gjVriP8Lic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuTmowJI; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuTmowJI"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2e4ba830297so213165ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932231; x=1791537031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ChtYARSDq8iagNWO9IImP3K9FjWMJua7ZspoYb+TKU4=;
        b=AuTmowJIirqO+DmCyZVLUzAEe6usT/Lj9ukMG3IYK0k9rCY7BKCDw4eDbzOk4GKBwu
         E6BFeQCbCcpCOGNvJBSEbznCJfTg3LbJFU9Dhp0wI26cWzep5yfwjyTM8IjC0BO0kk8c
         n3iTR4VCrfhoNiH1J4nIuxWilxFgDT1KcjEHPP9eQtqJSQ7TzNnJTIhAMLrd75i3x3qX
         x7WlBqbtRE/wWwlTBMmOijC6sjU8yFSr9gC1DyETkBtPWsqPDwXic8ba++EvlEVySSRg
         faoJPP2Rx/yfKKuoRM3VeL842WHx/KVIdpsuZaRiErE+gRtV60Rl3f5Pux9168nvT8pJ
         SpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932231; x=1791537031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ChtYARSDq8iagNWO9IImP3K9FjWMJua7ZspoYb+TKU4=;
        b=RZcRBq03Z4A7KqwE+ANZ/BlpG4Korj2ihHYaJLN4irLJ7dj3R4vYLvl4uDx4blAE6U
         rpyyX8e/EsjtYxPy+i5vnEA8arVWPng5WOyz5k26Rk2DmkcVytRZyouG0VooszUXKmNJ
         gNOfGxpmKtCHYet4cZYII+1od6AJ6+miNNPKPmOo7antjCTirRlAic+fj3TV85LrHpVR
         yWt//+wI8LkMVyVe0TFc06nqOQgxSJTsMg6gImhmVPwVTZIbDzdQmJpGqUlH8xk8mt+Y
         Ct44Z8kB2sasz0wvXx8Ajm7bzFi6v3CNOReO5HBAJNJnps5NNggSSynECsC1FGPnJ8pw
         +2Ag==
X-Forwarded-Encrypted: i=1; AKwUvBwEPGfZPbp0kl6MGWM1bffj0Fcn5gX2icWIQEdPUFyt8aqUwnGTQzZiQdXtUs4fx/LuWVpgfBXkwevLG20=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBFi2+/YkbxPQsJqXRXpURgWe3QVvFf12FK4MMIiY0uIQuTXCl
	dRk9NxynN4Fm1weZO2rec2F6FPdxOqbEHtc/aqf9/u3K+KJVErfXMgDH1Y/4LUPu
X-Gm-Gg: AYBFou1hGMx58TNHaZ8dA3u/NvZFKMNYmXRebC86PRDhcphi1sONIoR/BGj0ZHpj+VF
	gv79AR6fP3s7RIUSDSzwPGcCoWSvq+XgNhnK/x6llWrZEi5OAga+Y+TfZm/qHho+rpqFZaY7DDM
	XBNMPVSjbomXegA+Xdhc1Nz0SQojfYaZAR2g45ph1S+qrZ13UfoUDgQKNf1V45EIXEhXjIW4MAR
	vP1DrLM0/WtfrtENwmUbFFs9ccPzcaCsY/Whj65/g8gpeP7yk6Uo+IXSfcm6clK7y67JbXpQuqZ
	HGmTrXgzjdXtALdXPuZDdUDFagOsOjn9f8ar2YhXXTqKUD4MuIl84dA5GOYf21ROkhJfN45JfCE
	ny71HmvCDQ8wOy3hMRxBrkR+9TjLiWEF+BTeAondvXYpsNtVvYirodXWCNmzw1S9AnZYsMgxSS7
	v1UHNDzSLLXvenWbt/72jEk33hC0X9jBDULOEpIInN+sFY0iOIugusVg1l5zN668CFjYeidZiHh
	cWUar3opWeP1HvSsukPhw==
X-Received: by 2002:a17:903:1cd:b0:2e2:e6f1:5e10 with SMTP id d9443c01a7336-2e49a10450emr17761045ad.4.1790932231246;
        Fri, 02 Oct 2026 02:10:31 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:30 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Subject: [PATCH v10 06/10] mm/vmalloc: extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Fri,  2 Oct 2026 17:09:43 +0800
Message-Id: <20261002090947.869220-7-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002090947.869220-1-jiangwen6@xiaomi.com>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract the common PTE mapping logic from vmap_pte_range() into a
shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
PTE mappings in a single function, preparing for the next patch which
will extend vmap_pages_pte_range() to also use this helper.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index fb757d95bde25..72ec1b48a76de 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -92,6 +92,29 @@ struct vfree_deferred {
 static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
 
 /*** Page table manipulation functions ***/
+
+/*
+ * Try contiguous mappings at the PTE level for arches which support them, and if
+ * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
+ *
+ * Return: mapping size.
+ */
+static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
+		unsigned long addr, unsigned long end, u64 pfn,
+		pgprot_t prot, unsigned int max_page_shift)
+{
+	unsigned long size;
+
+	size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
+	if (size != PAGE_SIZE) {
+		pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
+		return size;
+	}
+
+	set_pte_at(&init_mm, addr, ptep, pfn_pte(pfn, prot));
+	return PAGE_SIZE;
+}
+
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift, pgtbl_mod_mask *mask)
@@ -100,6 +123,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	u64 pfn;
 	struct page *page;
 	unsigned long size;
+	unsigned int nr_pages;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -120,15 +144,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}
 
-		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
-		if (size != PAGE_SIZE) {
-			pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
-			pfn += PFN_DOWN(size);
-			continue;
-		}
-		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
-		pfn++;
-	} while (pte += PFN_DOWN(size), addr += size, addr != end);
+		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
+		nr_pages = PFN_DOWN(size);
+	} while (pte += nr_pages, pfn += nr_pages, addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
-- 
2.34.1

