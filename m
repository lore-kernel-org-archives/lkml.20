Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924029;
	b=ULq/2Eew0A9zhQMDUYNp6leKiWYE/yX6FydfwTCQwNeJgl6+A90fQSHUmKSzoMCY2bNe
	 P9rhbRNPTrQmS6R+CxAQPGPfVRuQwRELqCsFaPA/ctUQYKqCZ2Wtge9RVgGPeSeHnaoqH
	 e6O9zDsrNm3FIe+w5/TfAibyYF8yR7+wUKn/YNRg6Nrlipt1gviNJ5OzaCGtEQstUu9mz
	 qYp716klOchUm5HLLIFM/PROuwagCPdYfsRqNB1qnuZOzsBkPbtOTzLfaVGKv3U7+1fdY
	 MA7uuxUqb+mm8zTd3kI5oz5U5WdTpxxw528UN1srPaPT925gxHVNmFqNdAFxPoxMnPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924029;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=PaSpzfjLcp7igfDIyJz+8MA/pcT4rZXruabsNht94zM=;
	b=w5e6oLhxBRX+mUt4K0GYatVHn1DJTAywrAG+yGHOqlw5KjEzmbrTzFODqFYa0hH497a6
	 O0rfBWzqUa5MicgFmTjx0307cun1fAiqDIHtlYs9bdYkoUfkT5POgJltvIKVcVeFLWWSl
	 K6F2ujIfOYz0WTAxNsAO1L+XySJCSr3ARjeONTkb1JF0ElVDYjqyazxEKQmLvCYsvfUso
	 X7guQ5D18NH4LIHZp7hjadM85xy/4lMMrS0A4korur1kEQTTys7U5bgjOliS2+GZ/bJk0
	 eDtbwXMLv8DeluUe4hY1NkmH6WwCuBfWhU3Z9TPV5b+PwxGYlQQm0ERgyDQHXFBFl0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojjM4wVX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BBD606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojjM4wVX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F8E1F000CD;
	Tue, 17 Nov 2026 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924029;
	bh=PaSpzfjLcp7igfDIyJz+8MA/pcT4rZXruabsNht94zM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ojjM4wVXpAlMLrEN7Hu87eessuJ/x7zF7MBF4cu2bozT3SheD/Rcr+UENuMH11SSk
	 P7A8vQl/1JpQNWBekxNO/BH+wQLZxN2Y8kzw4hJe9fSnkrvNW3BiKngwy/VRsqzzSY
	 w/Le2ftac9dSucqEQKUP3XhQMwGSImueD9cTdk1/PTMqBgN4/nU4nbpmi6guQtNLpU
	 DqM/f7V28REpMPFCXw6kF3m8IDCZHQj+u5DtgErNCSVb/j7h2cvXDXWodErBolL5k/
	 RLVrmIuFoQbw8xRW0t4Dm/5P7yTWIXoXPnh2NY09fy2VBsIeQCyuy0D1NesLebjGjm
	 uk/a12o6fe9Hw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 17 Nov 2026 16:00:21 +0200
Subject: [PATCH v2 2/2] riscv: mm: check the valid bit in
 kernel_page_present()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-fixes-riscv-v2-2-5edc9bdc54fd@kernel.org>
References: <20261117-fixes-riscv-v2-0-5edc9bdc54fd@kernel.org>
In-Reply-To: <20261117-fixes-riscv-v2-0-5edc9bdc54fd@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.1-dev

set_direct_map_invalid_noflush() clears _PAGE_PRESENT, but the kernel
mappings keep _PAGE_PROT_NONE set: it used to be _PAGE_READ and now it is
the same bit as _PAGE_GLOBAL. pte_present() and pmd_present() still
return true for the invalidated entry. kernel_page_present() then reports
that an unmapped page is mapped, and hibernation copies it without
remapping it first.

Test _PAGE_PRESENT directly for PMD and PTE leaves.

Fixes: 32a0de886eb3 ("arch, mm: make kernel_page_present() always available")
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/riscv/mm/pageattr.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index b13811375535..5a1a3b4473c9 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -428,7 +428,7 @@ bool kernel_page_present(struct page *page)
 	pgd_t *pgd;
 	pud_t *pud;
 	p4d_t *p4d;
-	pmd_t *pmd;
+	pmd_t *pmd, pmdval;
 	pte_t *pte;
 
 	pgd = pgd_offset_k(addr);
@@ -450,11 +450,13 @@ bool kernel_page_present(struct page *page)
 		return true;
 
 	pmd = pmd_offset(pud, addr);
-	if (!pmd_present(pmdp_get(pmd)))
+	pmdval = pmdp_get(pmd);
+	if (!pmd_present(pmdval))
 		return false;
-	if (pmd_leaf(pmdp_get(pmd)))
-		return true;
+	if (pmd_leaf(pmdval))
+		return pmd_val(pmdval) & _PAGE_PRESENT;
 
+	/* pte_present() is true for PAGE_KERNEL with _PAGE_PRESENT cleared */
 	pte = pte_offset_kernel(pmd, addr);
-	return pte_present(ptep_get(pte));
+	return pte_val(ptep_get(pte)) & _PAGE_PRESENT;
 }

-- 
2.53.0

