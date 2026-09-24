Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E47770830
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236706; cv=none; b=IugeZrGG43Z2vBlrIY2JxieKAJD8AngMAav7CRR94TnDghTd2yHlb4Vk4b6h7SaIvzcSC7qtluPPLBN8oKwRvNWz7T7qi+t2KHxACPT8pYVAT9KqcdRHj5FP5q/JpDg58qrSiShgZuxiC1RioKCsAcDSgTdwCk7RipZtSu5Xmyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236706; c=relaxed/simple;
	bh=PiGnJMNyBjTVcRCDpm+MFKfL7YehhRKtCMkb9T496h8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6jC3mU4xIuyH3Xur0BZEZ50Q/ZbJLmVVJL77PHWGUaqciqF6C0vGUvcwcJ+0B1ff9q/4KyLxMxB+jAKO80vZ7F0JEWFatHWIpZYeCIq6w3To0GJREQXk8UgNcQnS5Sjv8Qntgx/EpSLku1pflgxnNBvTb/yEKuPwS4L2rLfsC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HErrwnBU; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HErrwnBU"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1284262a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790236704; x=1790841504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIuII5z6VGpIszxqYOaYyPM2+uByFb+jC50FCk2K+v0=;
        b=HErrwnBUHLVQX41x5Rnpyz61mTtp36cb4P+6iAcs8QXSwnIoskEKSabDUfn2u5489i
         oxzmQz4FRcwTqDwYz7oLXvUyCdTbrDswVWjVpNZuseqy6Kz8wmnlkMpoG4iJribqrl1l
         tcKXimWJYOkpvNKUW9LJP1mI4Z4zZe/VgX+fkrzueWaZM6YqXs0EgjgcNsKLeG243F6e
         piP3BsT1U7XUGjmcSlO9C5SF1vpGxNrJBdq3H23RzMm5wiKxpVgOlooFGnQDsTbkUpis
         cIyxe3bG9ziqMyPkGF2VGGNbuYtDZiSklZITLfXFroKSqf3O7a0ONFmpyw3GikXsLhGD
         Vybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236704; x=1790841504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIuII5z6VGpIszxqYOaYyPM2+uByFb+jC50FCk2K+v0=;
        b=tf46yz61OQ3ZdNDtEsvSAE7q/j61kxX3Ta0rs2rt30WsbADcFXg1sQClvYy45hYplO
         ExSxP3EzVjf/GO7F3KhFjvD9l7DKtFYvajS58dnnMatG+tcAEssdfR+c3eZ91cJitYMt
         RG3zkf3dDNPqfRwG4l06va3U7RUV6WZ3VWXBiQibuai5hQiW1sVlIqwJd5LOhk/bMa5K
         X0VNCcziT0EfXdF3cjaKbdpt7K94h9lJiAvAozC4Z8FIdeh50tVl/jFUNEp4/JQuypbl
         Q8h2UDlc7mOXvRR9WdTDk9kbTRcXd++8zfn3vNfP973oCntSKjgCfIrNmWVda/CsSbrH
         CExA==
X-Forwarded-Encrypted: i=1; AKwUvBzXO4NFkp7JJxVsDiFAABshZpubxXWaFASrYq/BNcsQa+5FtXG/Cb6QDhtWPea2IMS7bF0CdvjZ5ticdks=@vger.kernel.org
X-Gm-Message-State: AFuF++nBENwpB3tRnTU/t0fZ+PJJouKTq8/TZoPHAFxjE/Ocd6aAL7Dp
	L0bcRgtBQUzxDZbRdhVyOqJup3SSO/cD5/t22GNHhwbLjbiOSWDwv+dKbiPHXycoJa0=
X-Gm-Gg: AYBFou3q4imaGnqbWQ/hTGrT11Rkm5Tw/re7UnCLGeb187lFIS/TPuCTWN0DAgQJYlW
	IqItV/KdP8da6ROnjcpbiAvO2/gLpl5XbHMf2y/CYV+omif9l9Qu8TCc+i4d8yw1mA/NWU2L+o0
	BRbCdsD4QXaOw2mgOIkLpuHYurM9O3Ovqsel/Em0ec9NHxOUrpvjdse8mVzKqRtqUER9fZiuhmE
	MpP4SWPhQYTbjV7lpvGWk4zWsgGEExuuBYa6LxcnYpNmSRhly+tp2frcdtgKaN6h687gpnAGeCL
	l43vDRs7fhF29xGFrL3J2fP+ZzY7rbN3I6GrO6FJ0vdRPypRn8TAOjldT52O1mMBnRxhYCf4Ztu
	B6q9fI334p41jyUMAkbTMR9ispu1PTcx0C2XU0sB+aSK5oNgDF1EQTJ/H1d/97me3xZqPB78ZBb
	MtWyjW5rD4mrVIhNLyBT8kEyHH2XYup1pGvTq8hbsEd2bp7F0EeSQ5PJfKCNjs6BRAwbrXpxAwv
	NFkHTuwG+7cT+o714nA
X-Received: by 2002:a17:90a:e7ce:b0:3a0:2662:815a with SMTP id 98e67ed59e1d1-3a098db8c10mr1546074a91.43.1790236703641;
        Thu, 24 Sep 2026 00:58:23 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972eec92sm3575622a91.7.2026.09.24.00.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:58:23 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v2 4/6] mm/sparse-vmemmap: remove the unused ptpfn argument
Date: Thu, 24 Sep 2026 15:52:57 +0800
Message-ID: <20260924075259.2013039-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260924075259.2013039-1-songmuchun@bytedance.com>
References: <20260924075259.2013039-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmemmap_pte_populate() no longer uses ptpfn as an input. Drop the
argument to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 4aae22beca21..a5b47e496322 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -245,7 +245,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
 }
 
 static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
-		struct vmem_altmap *altmap, unsigned long ptpfn)
+		struct vmem_altmap *altmap)
 {
 	pte_t *pte = pte_offset_kernel(pmd, addr);
 	unsigned long pfn = page_to_pfn((struct page *)addr);
@@ -316,8 +316,7 @@ static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
 }
 
 static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
-					      struct vmem_altmap *altmap,
-					      unsigned long ptpfn)
+						  struct vmem_altmap *altmap)
 {
 	pgd_t *pgd;
 	p4d_t *p4d;
@@ -337,7 +336,7 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 	pmd = vmemmap_pmd_populate(pud, addr, node);
 	if (!pmd)
 		return NULL;
-	pte = vmemmap_pte_populate(pmd, addr, node, altmap, ptpfn);
+	pte = vmemmap_pte_populate(pmd, addr, node, altmap);
 	if (!pte)
 		return NULL;
 	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
@@ -347,15 +346,13 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 
 static int __meminit vmemmap_populate_range(unsigned long start,
 					    unsigned long end, int node,
-					    struct vmem_altmap *altmap,
-					    unsigned long ptpfn)
+					    struct vmem_altmap *altmap)
 {
 	unsigned long addr = start;
 	pte_t *pte;
 
 	for (; addr < end; addr += PAGE_SIZE) {
-		pte = vmemmap_populate_address(addr, node, altmap,
-					       ptpfn);
+		pte = vmemmap_populate_address(addr, node, altmap);
 		if (!pte)
 			return -ENOMEM;
 	}
@@ -366,7 +363,7 @@ static int __meminit vmemmap_populate_range(unsigned long start,
 int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
 					 int node, struct vmem_altmap *altmap)
 {
-	return vmemmap_populate_range(start, end, node, altmap, -1);
+	return vmemmap_populate_range(start, end, node, altmap);
 }
 
 /*
-- 
2.54.0

