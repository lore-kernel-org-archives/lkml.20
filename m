Received: from mta0.migadu.com (out-16.mta0.migadu.com [91.218.175.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9182737FC
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789198690; cv=none; b=l5b3AcT2gxWieZJWWnTcB/FM1xPKaDiZlkezm+SjYeVqH17VnHb2oMPRczN3R46hc0rPHc6ChHELFVCDtB3LZzk1Rp5JAf2rgoeTFStQ2p3HgTqHLU99OYezdQBULlaTvY8BAzKeUwUaJgSLEDvODGXVvCl1nL4LScNEnmKmsC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789198690; c=relaxed/simple;
	bh=951k9p3C3OHpYcCEeTeS+zKRLsyye3/AWkca/cyq9wg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hXT03aRaCN3wPYfx1RZjgaXakr/iE+fhbw4+Z26S8MVxOdI3hXDejI1SR3py+r68zzDSyklbwNIElFuGdw4uKE2UOWYmGk74MPcktJSZrXbaCbUT0/EXWasmn+Oez4U+jjHG8ZPDOs+U8+k2k9ZxpmTcUNxS4cOM9GxTSGZ2HYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PdYkI8Bc; arc=none smtp.client-ip=91.218.175.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PdYkI8Bc"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=951k9p3C3OHpYcCEeTeS+zKRLsyye3/AWkca/cyq9wg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789198685; v=1; x=1789803485;
 b=PdYkI8BcRaRDXjOUAnW/wi8lDGLlrzQ4swELZzUuADDe+4CMU+j6m9wR3smMKHkysii8vq0f
 Qjy7mW5zpPUZ72zYf9HslYFoadSQgMZaQDF2YoHNAKtJxnSONSp/c7QYxwP5r8pKlx2uu5c8rq1
 tlxJjn5JeSKAuiV1kHFFI56Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 937d4987c72d0ac1;
	Sat, 12 Sep 2026 07:38:05 +0000
X-Mizu-Trace-ID: 937d4987c72d0ac1
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: yintirui@gmail.com
Cc: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	david@kernel.org,
	ljs@kernel.org,
	dev.jain@arm.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	ryan.roberts@arm.com,
	nico.pache@linux.dev,
	usama.arif@linux.dev,
	liam@infradead.org,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 4/9] mm/huge_memory: use normal_or_softleaf_folio_pmd() in the PMD split path
Date: Sat, 12 Sep 2026 15:37:55 +0800
Message-Id: <20260912073755.8403-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <efae5222ad43f749c40aaca9b759b41844fdded8.1787941780.git.yintirui@gmail.com>
References: <efae5222ad43f749c40aaca9b759b41844fdded8.1787941780.git.yintirui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Sat, Aug 29, 2026 at 02:33:14AM +0800, Yin Tirui wrote:
>Get the folio once with normal_or_softleaf_folio_pmd() and decide the
>deposit once with has_deposited_pgtable(), as zap_huge_pmd() does. That
>makes split and zap classify an entry the same way, and drops
>vma_is_special_huge() from this path.
>
>Behaviour changes only where the entry and the VMA flags disagree, which no
>in-tree path produces.
>
>Signed-off-by: Yin Tirui <yintirui@gmail.com>
>---
> mm/huge_memory.c | 21 ++++++++++++---------
> 1 file changed, 12 insertions(+), 9 deletions(-)
>
>diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>index aefd62827139..b2ede9a6ae5d 100644
>--- a/mm/huge_memory.c
>+++ b/mm/huge_memory.c
>@@ -3172,7 +3172,7 @@ static void unmap_huge_pmd_entry(struct vm_area_struct *vma,
> 	 * We are going to unmap this huge page. So
> 	 * just go ahead and zap it
> 	 */
>-	if (arch_needs_pgtable_deposit())
>+	if (has_deposited_pgtable(vma, old_pmd, folio))
> 		zap_deposited_table(mm, pmd);

Staring at this ... I think we're missing raw PFN mappings of the huge
zero folio ...

static bool has_deposited_pgtable(struct vm_area_struct *vma, pmd_t pmdval,
		struct folio *folio)
{
	/* Some architectures require unconditional depositing. */
	if (arch_needs_pgtable_deposit())
		return true;

...
	if (is_huge_zero_pmd(pmdval))
		return !vma_is_dax(vma);

...
	return folio && folio_test_anon(folio);
}

If a non-DAX raw PFN mapping on x86 (say, via mshv_vtl_low) matches
huge_zero_pfn, vmf_insert_pfn_pmd() won't deposit a page table, but
has_deposited_pgtable() will return true ...

Before this patch, arch_needs_pgtable_deposit() skips withdrawal when
splitting this mapping on x86. The new check would instead reach
pgtable_trans_huge_withdraw() and dereference NULL through pgtable->lru
if pmd_huge_pte(mm, pmd) is NULL.

The helper already causes the same bug in zap_huge_pmd(), but extending
it to split is a regression introduced by this patch. I'll send a separate
fix, and we need it landed first :D

[...]

Cheers, Lance
