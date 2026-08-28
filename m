Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5044E3BB66B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942234; cv=none; b=HH1jWwpywn5anpAuI/R5+m25yF/0drLFSlgLaYXpmxeOf9cV/4UpkXJ6XFZU3tp6eu4flvIDlDFPLL7gcs2i+sG0yho38/JCu2NoPQtzJ3oPUy9sB39nXZWKrcDcZBQ7eixrOkUwrz6Nwn5NT+VKFSsjIz6UmlLRgRlfadwVZdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942234; c=relaxed/simple;
	bh=Y/c5kVLFC0JKlo2iGPxBLFu39HOkVg1K1rkWGt9s8nw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fHov/g6jPcUVUlnfYV8VetYgGwqZpGlk3sPBc9HWu/+iPEU/s0VnBP8Luo1Bvo7o2R98aUJcsBmyT/oSrx0wWrtEEqMz03h9soVUy3ifPOrI1os9E7AYjwax/PVlLA9nk8ACyd2cdmDL5wSMxdSJduwByyq8v0J2jCgfh6FcyJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhfFRFOV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhfFRFOV"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-848643382fcso1516806b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787942232; x=1788547032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Jcn7GGjqrVUI/71BI99aJS+k5gR0ZeEnxqhpDzyiDE=;
        b=RhfFRFOVL97Uy2Qhc6vyB9PZ4+jAgG+tXH5p0c7x33/GnnJ7/B5VhQT8Iu0EDwHngj
         BWQb/WQ/s8ku2KUKgNBqKIbKh4UyAAf8+dP5Jz1nlNknQ97jBNO55LIUNMgagDyqxNWy
         uMqsBvlTdZLMr8N++mIlojHe0Fr/rBD3zydvp7ge7FT0rY7iMSK8ORdnOFpEU3iaBewE
         uaM5VtIOCyMWx7iHNJgeL0T2NvBK+ARzvqWX0OXWjBPEwBxjLH5GdvTQC6xIkYT1MfoM
         Bh83tmEUNOWj2Y+shlOQqRQ4cuasSa2SXuyKfAxAmOJEF21WmuGdC2lKRP7/rCY/HYdf
         nNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942232; x=1788547032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Jcn7GGjqrVUI/71BI99aJS+k5gR0ZeEnxqhpDzyiDE=;
        b=Zr7MPPfTIZS6M1yZpRcnzb6VIcTQNhN0VOwOQNo+Zb6UqTOPulIDQmIPjbSMujviLN
         vKE6uX7AzWsqIpSQLMLtyN+wwMTr0GGoYugO7ZhoEVGUmcA35CB2lIkLz3tCNfGDfFys
         VlanYDsYtFXLI9uiY3cvvLcqlfoihH7qfphkDB36SgPK7b2dGlePBIs1Df8wOzUhefBe
         5Bhxp45Tye/j1ZknRNxLuWpyeH8EOCfMewn+OnBgDxe3cyPCbVbyNct4in4qHstErrOW
         +hD7UnqfKu0X6fiGNrOdkLXt3o2LQdVYKwYMPk1zw6khYwbH7oHZRiqlBYAfOEbj5ZVh
         VEfg==
X-Forwarded-Encrypted: i=1; AHgh+RpT/H8RaTcU0xJzE7QigjfradMQBS9FAmDhR53EEtD/hNg1gmbDKsCbyNRgr6GqAJKqIQZn4SFMZ3uIBTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mp/HfUYwbBjiv38IyYcZsT0idLDRKabsNFOQCM3uOjd8VWUFKz
	k7CMtsdoffRUfoyXoN5nOfHnJLOCh5CdzvH0XBiTFjWu6OrBOzB/3O7+
X-Gm-Gg: AR+sD13oFYpic6/LVmQr5RU3XdbWlwUzrsXnETTp3cBT/PosHubF6jb+3kVVXuiLhDR
	ElTSoVUAdI/Bu7IzR9jhYPKfjrCVla+AtY92rNHC1+l94Cv2Myc7aRbfhWfH6he1x7z6qdMp5vV
	a80edsVlsFctbYhTvNuf0K1IQtiXTq4oEUj45T46xJAc/Z/2uxU6/ULu+UaRsuOWYyThxujzBqB
	MZbJodCeQbKyqlfQjsW0z1Fd2k9LcMnUJgf4RWhlDQLjhlyl5+3sM0uu2EwukbYlDSeGoKZi2LW
	Q/PIVuirgHw/a7+V1CQTRf4G8FbgepAvRbGsXeOKCtnsZzErxVAChbtaopgXBFDb7N+u4ewoEih
	cttLZP+51E9FUSgd0wAP1NkFpOCcfnpcUdHsAVy32X+H+0SvxcFAvW/vPb23k+KkWEWuUC91hH6
	fW8OqFLvo0K5tDJ4AtUasp1VuBQjFNs7y7G00NXeIiQ/FNpB7YfNwkdRGkAiATdDPBnS85ra+Ol
	GOjP1qwofYGozv2DQ==
X-Received: by 2002:a05:6a00:3311:b0:857:72ba:ff0f with SMTP id d2e1a72fcca58-85772bafff7mr2808955b3a.23.1787942232370;
        Fri, 28 Aug 2026 11:37:12 -0700 (PDT)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea6fa3sm844230b3a.37.2026.08.28.11.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:37:11 -0700 (PDT)
From: Yin Tirui <yintirui@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	linux-kernel@vger.kernel.org,
	Yin Tirui <yintirui@gmail.com>
Subject: [PATCH RFC 2/9] mm/huge_memory: add and use huge_zero_pmd_can_split()
Date: Sat, 29 Aug 2026 02:33:12 +0800
Message-Id: <5e7add9f8103d3ebcc6edec70a8449e5336cb18b.1787941780.git.yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1787941780.git.yintirui@gmail.com>
References: <cover.1787941780.git.yintirui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only a huge zero PMD in an anonymous VMA is split, into a page table of
shared zero page mappings. Any other huge zero PMD is simply unmapped.

vm_normal_folio_pmd() returns NULL for a huge zero PMD, and the split path
unmaps any entry which has no folio. So make the decision before the folio
is looked up, in huge_zero_pmd_can_split().

No functional change intended.

Signed-off-by: Yin Tirui <yintirui@gmail.com>
---
 mm/huge_memory.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 8feabdcf6307..90d84f761619 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3139,6 +3139,15 @@ static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
 	pmd_populate(mm, pmd, pgtable);
 }
 
+/*
+ * Only a huge zero PMD in an anonymous VMA is split, into a page table of
+ * shared zero page mappings. Any other huge zero PMD is simply unmapped.
+ */
+static bool huge_zero_pmd_can_split(struct vm_area_struct *vma, pmd_t pmdval)
+{
+	return is_huge_zero_pmd(pmdval) && vma_is_anonymous(vma);
+}
+
 static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		unsigned long haddr, bool freeze)
 {
@@ -3163,6 +3172,20 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 	count_vm_event(THP_SPLIT_PMD);
 
+	/*
+	 * FIXME: Do we want to invalidate secondary mmu by calling
+	 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
+	 * inside __split_huge_pmd() ?
+	 *
+	 * We are going from a zero huge page write protected to zero small
+	 * page also write protected so it does not seems useful to invalidate
+	 * secondary mmu at this time.
+	 */
+	if (huge_zero_pmd_can_split(vma, old_pmd)) {
+		__split_huge_zero_page_pmd(vma, haddr, pmd);
+		return;
+	}
+
 	if (!vma_is_anonymous(vma)) {
 		old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
 		/*
@@ -3195,19 +3218,6 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return;
 	}
 
-	if (is_huge_zero_pmd(old_pmd)) {
-		/*
-		 * FIXME: Do we want to invalidate secondary mmu by calling
-		 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
-		 * inside __split_huge_pmd() ?
-		 *
-		 * We are going from a zero huge page write protected to zero
-		 * small page also write protected so it does not seems useful
-		 * to invalidate secondary mmu at this time.
-		 */
-		return __split_huge_zero_page_pmd(vma, haddr, pmd);
-	}
-
 	if (pmd_is_migration_entry(old_pmd)) {
 		softleaf_t entry;
 
-- 
2.34.1

