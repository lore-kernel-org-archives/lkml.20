Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14E40E8D6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121082; cv=none; b=toWO2o17rGJEhN2UFCHnkNBaMz9DG0fq67ii0TxkURRY4L6F3cG3GxqtM6EZv09yJiFH0d5N4q1maG8fpAthQHj6kpAFdK3f1TXS17GYkoMhggiF5YKxRMvBPOulcWZo60A7+T9e5x3RmzZZ0dmA7WIWFcQnWLyKbDTrMleGm/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121082; c=relaxed/simple;
	bh=I25+yut4NdUZ1Sr7JuktfsvDsRjtjZ3ZaLauNYYdOFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c6bBPm7J9LY+Cz5adyypGz1HRYNoXJV/ncPbDKf77fDeaG1ka8N0mCAwdi0MCbgrwGpM7+2G9tmCctj+xdJWC+ZsrbFzXf1Y2LERKhhO2jayzpFMMd3LZB+NQFFH1FysQCzrFDGYD4nOZBcsIwnhj2cZmCRadzmqB8f6ol2TKos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhHoy47S; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhHoy47S"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398a5aad413so719683a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789121075; x=1789725875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGxseeOS2BtWoFf00OyiAKmDRr1RXqvuTr0ihtThX8U=;
        b=BhHoy47SvGEOyi4CrSsQPxiWqcidnlEEmfGHueCrXGvMgdwHk7SCk5skqvsaZHh+5B
         tC2ieqhxhrQLU44mP0IhGe3RFIRb7CXHjY5ku59tkofws41w2ml5RVxzTO1CbzjQs8AS
         nBlMTMSo9QMZCZ3+AhtJ7QupyzvvUKIc7lnQIZQfjjtrr6iUqL5Md1qDEota4Ye7nauk
         V07dWVtATXhKXJPilJ/XGBpGI9Y/pfdyKRkGLfe3ukUK+nyoXK0N4NGv/DVqnpxmlUUR
         AHyPz6faXzsV/8cu2KmDvx6NzFJVMSws+EwqNrxu1sa0/L04be6zE2N50T713r9gyQvA
         w7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121075; x=1789725875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eGxseeOS2BtWoFf00OyiAKmDRr1RXqvuTr0ihtThX8U=;
        b=W2SbxnhoNGsSHTVQ60uzvzvWJ4z9jw0NRGnX84o6GkXkAG6zqWyld2cnRLeCNbpj60
         QcLVfMVtgdR7UUcHTuT6s2S9PIpjLQkLso40cqU4HnkNPQK+opYA3bbPtbWgmm9ELwUN
         YWaB0eu9AgQ1jYmZjM80ST1QXMcxO7JsTGbYmieRA7Ki/DFY/H2WmMNENUbzie2ZQ6vf
         DVjQPvqyzaL+hrCI0o7UVQAAPz6vSW2AMDnMZwcRA0myx26EGQ5HJiPMyIQe8FQGxJas
         /H0nOFbdI8WjlTWDoD1ZVKfh/a893ZPCRKD//BUPSNQrfe36qAD5qEagtOdbLXzIfwCH
         mPPA==
X-Forwarded-Encrypted: i=1; AKwUvBwljefEPQynnd7R4vEyCS8wdYgctpbAbedEaxzeQyE/gh2GG/QlKGQ8fDJIL7wAkE3wUoyXNSextMAesN0=@vger.kernel.org
X-Gm-Message-State: AFuF++nOUBNZrNkKMPdbCVas9yEI+DETu10d70pcJaWGLqUeRZn/6jEw
	lwjvouVpM08wAtj/r85EenuWI7yQxOtiY9fHIpyLMAIY8ArvoEv/7R6Q/NLz6anz
X-Gm-Gg: AYBFou1/sN3OO//3A7n++wATy3mYl9ZYU9v6NfRn3xAaPB3JWXeLSeLcJ11RKPO4z3g
	3gbCVn/Zk6QZe81p2TcjSbFPCpf9teIgzmqINmTWQs6BRGmY2Fu8r4Q0p0B0dhUjgMSu6DRVP29
	rQf7LcBMiGGhXWmHbUF7donMT/rVBu8n36zvTT10toSA135iVQ/nhfNtNF48HZKR6Q0EG19J5SE
	ykdWzC/iEu+hIvPd5oijKD/yrIDK+F+JFdCAm2RfIMe85ytrNQbGYegKpUziaEV+C9xnvjXzBvb
	r+0Z1uos5SrxMKTfhGjRZCUbG/3ANtl8g5H1qnAjOmFe5lpALC1rEom/qKKeg43fLX4q9t+hXI7
	Pyh7EipIwAlOYiYZiZLLcEYmAig5FBkB2K1ZLyyR3vx2sTcgm3pDrNR3doNgl3jxG7LwGwnvC0x
	Z1IzvLiinG4QryNiddGL34M6R1CZ//e5TsPko8WLi33rcsCBbV85mtDRacm3bbo+TNAU/oxQ==
X-Received: by 2002:a17:90b:3885:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39d9c3944aamr5330624a91.25.1789121074583;
        Fri, 11 Sep 2026 03:04:34 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95864b85sm4681860a91.14.2026.09.11.03.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:04:34 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH REPOST 5/5] mm/damon/vaddr: support pgidle_unset probe filter type
Date: Fri, 11 Sep 2026 18:04:26 +0800
Message-ID: <20260911100427.2804601-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909140408.104699-6-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed,  9 Sep 2026 07:04:07 -0700 SJ Park <sj@kernel.org> wrote:

> DAMON virtual address space operation set (vaddr) does not support
> pgidle_unset probe filter type.  Add the support.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/vaddr.c | 55 ++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
> index 45239f05e113b..9a38dc89a156e 100644
> --- a/mm/damon/vaddr.c
> +++ b/mm/damon/vaddr.c
> @@ -522,13 +522,49 @@ static void damon_va_prep_probes(struct damon_ctx *ctx, bool set_samples)
>  	}
>  }
>  
> -static bool damon_va_filter_pass(struct folio *folio, struct damon_probe *p)
> +static bool damon_va_young_addr(struct folio *folio, pte_t *pte, pmd_t *pmd,
> +		struct mm_struct *mm, unsigned long addr)
> +{
> +	bool young = false;
> +
> +	if (pte)
> +		young = pte_young(*pte);
> +	else if (pmd)
> +		young = pmd_young(*pmd);

Hi SJ,
I see that all callers already check pte_present() / pmd_present()
before calling this helper, so I don't see a correctness issue here.

However, the other DAMON young/accessed helpers, such as
damon_pte_young(), damon_hugetlb_young(), and the PMD path in
damon_folio_young_one(), keep the present check together with the
young check.

Would it make sense to keep the same check here for consistency?

Thanks,
Kunwu

> +	young = young || !folio_test_idle(folio) ||
> +		mmu_notifier_test_young(mm, addr);
> +	return young;
> +}
> +
> +static bool damon_va_filter_match(struct damon_filter *filter,
> +		struct folio *folio, pte_t *pte, pmd_t *pmd,
> +		struct mm_struct *mm, unsigned long addr)
> +{
> +	bool matched = false;
> +
> +	switch (filter->type) {
> +	case DAMON_FILTER_TYPE_PGIDLE_UNSET:
> +		if (!folio)
> +			matched = false;
> +		else
> +			matched = damon_va_young_addr(folio, pte, pmd, mm,
> +					addr);
> +		break;
> +	default:
> +		return damon_ops_filter_match(filter, folio);
> +	}
> +	return matched == filter->matching;
> +}
> +
> +static bool damon_va_filter_pass(struct folio *folio, struct damon_probe *p,
> +		pte_t *pte, pmd_t *pmd, struct mm_struct *mm,
> +		unsigned long addr)
>  {
>  	struct damon_filter *f;
>  	bool pass = true;
>  
>  	damon_for_each_filter(f, p) {
> -		if (damon_ops_filter_match(f, folio)) {
> +		if (damon_va_filter_match(f, folio, pte, pmd, mm, addr)) {
>  			pass = f->allow;
>  			break;
>  		}
> @@ -543,13 +579,15 @@ struct damon_va_probe_walk_private {
>  };
>  
>  static void damon_va_probe_folio(struct damon_ctx *ctx,
> -		struct damon_region *r, struct folio *folio)
> +		struct damon_region *r, struct folio *folio,
> +		pte_t *pte, pmd_t *pmd, struct mm_struct *mm)
>  {
>  	struct damon_probe *probe;
>  	int i = 0;
>  
>  	damon_for_each_probe(probe, ctx) {
> -		if (damon_va_filter_pass(folio, probe))
> +		if (damon_va_filter_pass(folio, probe, pte, pmd, mm,
> +					r->sampling_addr))
>  			r->probe_hits[i]++;
>  		i++;
>  	}
> @@ -574,7 +612,8 @@ static int damon_va_probe_pmd_entry(pmd_t *pmd, unsigned long addr,
>  		folio = vm_normal_folio_pmd(walk->vma, addr, pmde);
>  		if (!folio)
>  			goto huge_out;
> -		damon_va_probe_folio(priv->ctx, priv->r, folio);
> +		damon_va_probe_folio(priv->ctx, priv->r, folio, NULL, &pmde,
> +				walk->vma->vm_mm);
>  
>  huge_out:
>  		spin_unlock(ptl);
> @@ -591,7 +630,8 @@ static int damon_va_probe_pmd_entry(pmd_t *pmd, unsigned long addr,
>  	folio = vm_normal_folio(walk->vma, addr, ptent);
>  	if (!folio)
>  		goto out;
> -	damon_va_probe_folio(priv->ctx, priv->r, folio);
> +	damon_va_probe_folio(priv->ctx, priv->r, folio, &ptent, NULL,
> +			walk->vma->vm_mm);
>  
>  out:
>  	pte_unmap_unlock(pte, ptl);
> @@ -615,7 +655,8 @@ static int damon_va_probe_hugetlb_entry(pte_t *pte, unsigned long hmask,
>  
>  	folio = pfn_folio(pte_pfn(entry));
>  	folio_get(folio);
> -	damon_va_probe_folio(priv->ctx, priv->r, folio);
> +	damon_va_probe_folio(priv->ctx, priv->r, folio, &entry, NULL,
> +			walk->vma->vm_mm);
>  	folio_put(folio);
>  
>  out:
> -- 
> 2.47.3
> 

Sent using hkml (https://github.com/sjp38/hackermail)
