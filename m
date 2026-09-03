Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C34B26FC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444654; cv=none; b=iBv6tCG/pRI96MmpPC84eIAtY79ROL6fv8DFfhdOjsDhe3MIs9MAKFWCOqc2KCVy+jHml+mnysWxh3+jWJSFyz31gLbWY3N+g3uexK2pxPy0ieHiTybjfMwKHlaWVTKKl8xZVLifTWoqgTZlcD/cLYjQJG7XlA2t59GMyESMUW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444654; c=relaxed/simple;
	bh=uyaj7kG6TPS6LEfhjwIhpsOwcFNptcTWq6h8aScAAaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJfUN5ZvakeWUuaFjoPa9OaRkexSITUTNpfDPU6KJep1XpOPf1L/09mJvBdKswZNPSxwmUvHm0ObFFNXHcDkDMO6n69KPjAssAsJXOjdveEPFRWNyX0kgqCKTfS17lW/RKeKFWuetfEhXoSk7mO5YfSzAIZb6BO9hRBeCodya+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jygmUT9I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jygmUT9I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B131F000E9;
	Thu,  3 Sep 2026 14:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788444645;
	bh=3JZzmgG9bG+UNAMwOnm5lvihONair7Pb+TlG3wgKfYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jygmUT9I2xlA9gFXYgsMjQnieC9T4700PPohryUEchjY9qdyFurXttHb/9ScGKasp
	 p/6yyvXWyKak+rj+jCkxoAKJSG2mYUuM3ZfRJT0u0LPIzdpjHRfDUxArBrhmtTLMkP
	 OuzjGv3w8HqZAY9nskFe1nP6D+3HSC5IZl4AeyXMPenTlWaC+n2qzuDxpC5way5ZCf
	 kGE+P/qYXmD0QnB1+vuyXte9h5HZ2orivrgTMbbLj8pBFnhlVbi0X3hkLahkoJL+u9
	 iBP8TxMau6ClWm9iHmKoRz0aYWFHSewpMoeDVtJzpmvJNoj0Gtiqlu/GBow7WEsoS/
	 USHFM1ZcYVHyw==
Date: Thu, 3 Sep 2026 15:10:39 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Christos Skarlos <christosskarlos.kernel@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/huge_memory: fix various coding style warnings
Message-ID: <apl_vDvfWZldRknr@gremlin>
References: <20260903092200.88910-1-christosskarlos.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903092200.88910-1-christosskarlos.kernel@gmail.com>

On Thu, Sep 03, 2026 at 12:22:00PM +0300, Christos Skarlos wrote:
> Resolve coding style issues flagged by checkpatch.pl Specifically:
> - Add missing blank lines after variable declarations.
> - Remove unnecessary braces {} for a single statement block.
>
> No functional changes are introduced.
>
> Signed-off-by: Christos Skarlos <christosskarlos.kernel@gmail.com>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  mm/huge_memory.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index ced400f72d43..371ee8d38c45 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1104,6 +1104,7 @@ subsys_initcall(hugepage_init);
>  static int __init setup_transparent_hugepage(char *str)
>  {
>  	int ret = 0;
> +
>  	if (!str)
>  		goto out;
>  	if (!strcmp(str, "always")) {
> @@ -1510,6 +1511,7 @@ static void set_huge_zero_folio(pgtable_t pgtable, struct mm_struct *mm,
>  		struct folio *zero_folio)
>  {
>  	pmd_t entry;
> +
>  	entry = folio_mk_pmd(zero_folio, vma->vm_page_prot);
>  	entry = pmd_mkspecial(entry);
>  	pgtable_trans_huge_deposit(mm, pmd, pgtable);
> @@ -2613,6 +2615,7 @@ bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>
>  		if (pmd_move_must_withdraw(new_ptl, old_ptl, vma)) {
>  			pgtable_t pgtable;
> +
>  			pgtable = pgtable_trans_huge_withdraw(mm, old_pmd);
>  			pgtable_trans_huge_deposit(mm, new_pmd, pgtable);
>  		}
> @@ -3901,9 +3904,8 @@ int folio_check_splittable(struct folio *folio, unsigned int new_order,
>  	 * swapcache folio split. Only uniform split to order-0 can be used
>  	 * here.
>  	 */
> -	if ((split_type == SPLIT_TYPE_NON_UNIFORM || new_order) && folio_test_swapcache(folio)) {
> +	if ((split_type == SPLIT_TYPE_NON_UNIFORM || new_order) && folio_test_swapcache(folio))
>  		return -EINVAL;
> -	}
>
>  	if (is_huge_zero_folio(folio))
>  		return -EINVAL;
> --
> 2.55.0
>

--
Cheers, Lorenzo
