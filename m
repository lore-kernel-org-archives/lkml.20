Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3CF3B71BD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192078; cv=none; b=jf9BbJRp4jHdt52eFTQ4IwiS6x/8XY5ZJkvijCeqJ3gvN3y+XCTP9L1SnjqfhFQewFS0HTaK0fY4QHx0SdOfVg2Sy0Rzk7FC5RMxfByyUW9cmrZw3K/qRB1RknBBCu+Pin9xj/MXOe/suGpYYrfZII8sbtDlvrvgi/UCmlcvXho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192078; c=relaxed/simple;
	bh=7dSgCQgWyq3E3fqOXV9dJafKapyj9IKlRAueb9YfcN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fweeImq0iwkGb7bhdHF6rkoE4mEcAGAXBxdWMd09+rP47uq7myZWGjkV4r5jxdvnXZoqwNPgwrltZWzwRyoarK/Rpny5jwwVXd2mOj/gIla32v0cnzNbonvZL5MOcTAeD8+USF/DsHxcBdjvGTEjLvWJ5pAC7PwbZMWhmzpKYmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAW51z95; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAW51z95"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52CFC1F00A3D;
	Mon, 31 Aug 2026 16:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788192077;
	bh=bsHPREOjkfveq5u4pxKTH6RiMoREQm761eR8QKvbfA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nAW51z95D3uEnz318yGDrWEoUKuoLgFtkETS1phm5cUVmixY6b5POwHbMjnzf8TsA
	 /w+SgRZP3fL9bXmeXC54QMk7EdBbSvhCymnLxNsknhtHH7Bra02fy6Gp8DSjEpt7yW
	 C5NvXvwuLVktykO6mVBthRJ+PG9opVnIzMJu+RkfCbrLTdMUo3ZUcYVPfvCzpTv/dc
	 NS1UycgWhRwMkzzLvB+6+DK+EjbeL16mRVeS6SqB8Y9uuEO7iwgv/YPpi91VLI/Or6
	 yMso8ECpHRo6kTMYCIkMjINW9n3Gkz83Z9iFMyPBsnyn3Og1wJ/5/hTnZPliG22BZ5
	 S+dxj6AF/0TQw==
Date: Mon, 31 Aug 2026 17:00:56 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kunwu Chan <kunwu.chan@gmail.com>
Cc: Dev Jain <dev.jain@arm.com>, Kunwu Chan <kunwu.chan@linux.dev>, 
	akpm@linux-foundation.org, david@kernel.org, riel@surriel.com, liam@infradead.org, 
	vbabka@kernel.org, harry@kernel.org, jannh@google.com, lance.yang@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/rmap: remove stale hugetlb check in try_to_unmap_one
Message-ID: <apWlLTa3oZq1wwvR@lucifer>
References: <20260831082849.3573957-1-dev.jain@arm.com>
 <20260831155913.2497152-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831155913.2497152-1-kunwu.chan@linux.dev>

On Mon, Aug 31, 2026 at 11:59:12PM +0800, Kunwu Chan wrote:
> On Mon, 31 Aug 2026 08:28:47 +0000 Dev Jain <dev.jain@arm.com> wrote:
>
> > Post commit d4ec5572825a ("mm/rmap: add try_to_unmap_poisoned_hugetlb_one")
> > try_to_unmap_one() cannot be called with a hugetlb folio. Therefore remove
> > the folio_test_hugetlb() check.
>
> Yes, the d4ec5572825 change shows that try_to_unmap() dispatches
> hugetlb folios to try_to_unmap_poisoned_hugetlb_one(),
> so try_to_unmap_one() cannot be called with a hugetlb folio.
>
>
> It would be better to add:
> Fixes: d4ec5572825 ("mm/rmap: add try_to_unmap_poisoned_hugetlb_one")

Nope, let's not thanks.

This isn't a bug.

>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> Thanks,
> KunWu
>
> >
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > ---
> > Rebase soup - my huge_ptep_get() fixes landed after the refactoring.
> >
> > This patch applies on Linux 7.3-rc1.
> >
> >  mm/rmap.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index d1819fd699380..606c8ecf31302 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -2299,11 +2299,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
> >  		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
> >
> >  		address = pvmw.address;
> > -		if (folio_test_hugetlb(folio)) {
> > -			pteval = huge_ptep_get(mm, address, pvmw.pte);
> > -		} else {
> > -			pteval = ptep_get(pvmw.pte);
> > -		}
> > +		pteval = ptep_get(pvmw.pte);
> > +
> >  		if (likely(pte_present(pteval))) {
> >  			pfn = pte_pfn(pteval);
> >  		} else {
> > --
> > 2.43.0
> >
> >
>

--
Cheers, Lorenzo
