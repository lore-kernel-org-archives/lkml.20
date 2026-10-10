Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4496A37AA86
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619151; cv=none; b=S/E9ha2MBaxB8u/ACIkRyxICnoDTGVuvOsnEaHCDRD+06hnpR93vZtTihcNYk8O9nDyAjWKSrWfS3GdO19E7SRrEZsJYnrqyQaT6Xu9y2Syqw6cPlGjZMgtCPi33r4jQj9YlzIernO8EHa5mtecsgWGHwDBQS+jlDsRxcdICrks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619151; c=relaxed/simple;
	bh=8SvVMW9YcsGqibNy5STWE8tWUE5JD688lhZhh6dltv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Btf9xpF3OEw+t/iYqsF3qbaY1S982mxXWS0in5uiC49NEiZvG6os6H6UcTpgNXW7hDSu3Cjhbz8SmMeKBiD0ko40/GPBrfBb2gfeXr540QGE05iDnm7cn27DfJoYYt22I/EPE5+r6E29XW9SsSVdEz39qPrOLPDiUdX2/XZZJH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=M69ecZt5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="M69ecZt5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e61f017091so2554275ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791619149; x=1792223949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUYV9kBM40++h+Iuf/kFSxpEvNiJz1Gg8/l7n+m9rxI=;
        b=M69ecZt5IWzETN1zcSyHMAQP+er5ho3FEkRt9PwJjluep90NsJ9GgS6xFVD2NOfSyi
         fS/xnb64lH1nNWPe+m2zC7CCIh6FnkOi9cl+AMzdwXowp6eeW1seouz0unU5sdkqhVmZ
         ael48lQR79d4+4OdgSKHFUwcOL175nkEDCBhYgqVNITroikCQRVOg9tFyici766nzooa
         Vnjop+btSiRAHnWcXYtQ6aS+xjMqUFAlhGs9D5JElxuAaw5SwZULkFXiLeAOXwUDlTvB
         ad9KTdJ97b1cpB9728yn6vyP8Y97rNihRTUyvEz+LAVU3xtyZyIOJ+h03D/K/Xz9R6pw
         RAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791619149; x=1792223949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JUYV9kBM40++h+Iuf/kFSxpEvNiJz1Gg8/l7n+m9rxI=;
        b=orbkHrfgCJXoPTf24feKDMMWifXd82zTvGYnQn9eln4622Kcka8D1as9eR21D6vNg6
         JsHTIG8RpQkZ99J4g5KyvxQ+o99fD7wdW8jctKUm6k42Tnb1akVKZqYGuTDkAX+E4Whu
         VFIwB8hWYTgmjbllRfhEDnMf28luYtU/ImjEpKAD3jkRyoPozfMxKGI6ahASR7Of1Lt+
         ruG1D3qA86eXPxJSz+V0sF6ADfJ6Zd1uMQSjo/eVy2mBUECEXjB3v5sM35U4rA+HZaA7
         ueh4Wo2uWw0qh+TwaBy5SkogrNPAgTRGrpYBp14oxUwtmfTxrrmyleZ+rOuI/8Z0FPIK
         MhIw==
X-Forwarded-Encrypted: i=1; AKwUvBxB0FCLIByXYl3pYVTATczShBHmpxd58JaWbxw5E7tS9+Yn0HitWO40c8Zp1Mwj+FXWSbRWfsTzq24l02Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDt43x2fSpAOScJKkE4GydoBaOsvIb5Cr8mOgGPmJowVwA8s2+
	emYm4KSFXZowzXoClTUFrCbxeMD+ZOnH6LLO6CG3opE89REK6z8+RdzMULrVlsCLexs=
X-Gm-Gg: AYBFou2dxHX2ms2s1X317gZJ4LDVQwKIQRWSowQwxgpR0xzhkySaXucESM52A1qitqj
	N+YHYivCxXE21xNDZPRz3TsH0k7QzykZT0O8U9AJXtJaHpmgGups5A5/f8pGOqlbGqIiNOe4wqT
	t+NdsdIWNofEB9BmLwru7/V43OpfySabtVcKHq+s9rDb9PexddE7HobVcWAjRlTvGdjQZZvEB9d
	JfliXm4tT9Z9Ij1wedPDiChewd3GIGhJNNFn8M0yb89pMmR87ZFSrewPibKxkBYGqUx3SeQN+PN
	Uao5oNdm78ScEcl3eYjBAGim9Yn+HwjU1Iyct5xZUmJBiPRfhZsPd6htMN7VSKfaeOhmhyGUC4Q
	P2lfwFbL8jnC+5+5128ZIlIZagKzcU4KMyvU+/KwEaF1BRjvIrQVe0jrfnhsxE8dgqr8PeEWI75
	Z5ANcnsIkvyrr6aUGUwu2DR2SmEhZK/gyNfGYfIGEd1NhHJ7NqHqK8gYdrOzBWWNQdiUFQ/QvB+
	WvaERanYPc4z+bcCeBk+XWZFkLChDinn8I/yA==
X-Received: by 2002:a17:90b:2d86:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3ab3a60d1eamr3205394a91.20.1791619149216;
        Sat, 10 Oct 2026 00:59:09 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab57c05724sm3473569a91.4.2026.10.10.00.59.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 00:59:08 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v4 5/6] mm/sparse-vmemmap: open-code vmemmap_populate_address()
Date: Sat, 10 Oct 2026 15:57:54 +0800
Message-ID: <20261010075755.83339-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010075755.83339-1-songmuchun@bytedance.com>
References: <20261010075755.83339-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmemmap_populate_address() no longer has any callers that need the
returned PTE.  Its only remaining user, vmemmap_populate_range(), only
checks whether population succeeded.

Open-code vmemmap_populate_address() directly in
vmemmap_populate_basepages(), remove the now-redundant range helper,
and return -ENOMEM directly on failure.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v4:
- Collect Reviewed-by from Lance Yang

v2:
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 54 ++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 37 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 07188cdf00f6..40eba70c0048 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -352,8 +352,8 @@ static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
 	return pgd;
 }
 
-static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
-						  struct vmem_altmap *altmap)
+int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
+					 int node, struct vmem_altmap *altmap)
 {
 	pgd_t *pgd;
 	p4d_t *p4d;
@@ -361,48 +361,28 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 	pmd_t *pmd;
 	pte_t *pte;
 
-	pgd = vmemmap_pgd_populate(addr, node);
-	if (!pgd)
-		return NULL;
-	p4d = vmemmap_p4d_populate(pgd, addr, node);
-	if (!p4d)
-		return NULL;
-	pud = vmemmap_pud_populate(p4d, addr, node);
-	if (!pud)
-		return NULL;
-	pmd = vmemmap_pmd_populate(pud, addr, node);
-	if (!pmd)
-		return NULL;
-	pte = vmemmap_pte_populate(pmd, addr, node, altmap);
-	if (!pte)
-		return NULL;
-	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
-
-	return pte;
-}
-
-static int __meminit vmemmap_populate_range(unsigned long start,
-					    unsigned long end, int node,
-					    struct vmem_altmap *altmap)
-{
-	unsigned long addr = start;
-	pte_t *pte;
-
-	for (; addr < end; addr += PAGE_SIZE) {
-		pte = vmemmap_populate_address(addr, node, altmap);
+	for (unsigned long addr = start; addr < end; addr += PAGE_SIZE) {
+		pgd = vmemmap_pgd_populate(addr, node);
+		if (!pgd)
+			return -ENOMEM;
+		p4d = vmemmap_p4d_populate(pgd, addr, node);
+		if (!p4d)
+			return -ENOMEM;
+		pud = vmemmap_pud_populate(p4d, addr, node);
+		if (!pud)
+			return -ENOMEM;
+		pmd = vmemmap_pmd_populate(pud, addr, node);
+		if (!pmd)
+			return -ENOMEM;
+		pte = vmemmap_pte_populate(pmd, addr, node, altmap);
 		if (!pte)
 			return -ENOMEM;
+		vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
 	}
 
 	return 0;
 }
 
-int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
-					 int node, struct vmem_altmap *altmap)
-{
-	return vmemmap_populate_range(start, end, node, altmap);
-}
-
 /*
  * Write protect the mirrored tail page structs for HVO. This will be
  * called from the hugetlb code when gathering and initializing the
-- 
2.54.0

