Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C49476CFE;
	Wed,  2 Sep 2026 11:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347563; cv=none; b=X96nDtmWami88+eIkwOH7wAXanZrKPOoKzBKwOnsZk/z5XWYY1IpmhKJRWoQ947AQfv5FQTxQ9IGFRULiOKAdz3h+eTnB5as1NPA/vXLZps8bdenb9PmsspQFNevKVU8o1YD1GC3lhg/5UrwzH1OCEXmfupmdrCkJjPgzaCDx/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347563; c=relaxed/simple;
	bh=rr2P6Vj+ki12n5rVXWQ+/zaFmmVdJizBN4L5ZCwVTZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6azSx0ny1YRC2NlcUyrve+Yem2Zylj8uGsbn1OsCBXWuF7Vnd0oke98Lnbp+quZK2RTGbM4fUEwdhhk8FrhNg6yuQp7g/tvvRauS/M/ClnfjB2RT4nSMZ3O8wixp/9pS7wFjMR64koOPaJx2OkVxPzUgubiseKtmaprQkmZ5sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X3d1v59Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X3d1v59Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BE41F000E9;
	Wed,  2 Sep 2026 11:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788347547;
	bh=58XB0eVUu9nhpLw4LPlQFPtNwohk8xHymvle5Pvd3B8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X3d1v59QVHULLRSmINuxhMn7yGsjPXlugPKb49dKr+gdKIvmrAlH2uL2jJqlSluyG
	 6Dn/3F+79+ZjsxGgWeUU1jIhwilnSghVdwv9XDDabB0d6JufY1hPmIOprqinLEw5gz
	 L+ONzXoFS4HDWYCMq6dfDYYMtrIz/+L2+lqvff+N1XBdVU7s99u2CUWkFvqfCe208n
	 eeArjYNHzuIJ8ayZCY5TdCXVgHQP4kVKNETZuONOT5QJizcSQ7tlDbRggVVB4+FF84
	 4lQuIw6Iz8YAYzPlaEY9kpHNOTvN4K/nqpwUG3JcHqMVzqCIIc8htu02MpnyqCE/qk
	 r60q6BwCFDKxw==
Date: Wed, 2 Sep 2026 12:12:22 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Mike Rapoport <rppt@kernel.org>
Subject: Re: linux-next: manual merge of the mm-nonmm-unstable tree with the
 mm,mm-fixes tree
Message-ID: <apgEi1GacpI4T5m2@gremlin>
References: <apf4WaZ8D0P6W-FX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apf4WaZ8D0P6W-FX@sirena.org.uk>

On Wed, Sep 02, 2026 at 11:20:09AM +0100, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:
>
>   mm/secretmem.c
>
> between commits:
>
>   0d171c47f2be6 ("mm/secretmem: properly account locked pages")
>   a31a4988ca3e8 ("set_memory: add number of pages parameter to set_direct_map APIs")
>
> from the mm,mm-fixes tree and commit:
>
>   d2c5e077cbeaf ("mm/secretmem: properly account locked pages")
>
> from the mm-nonmm-unstable tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

LGTM, thanks!

>
> diff --combined mm/secretmem.c
> index 6cbb8efc994a4,384f5cfc457f9..0000000000000
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@@ -139,7 -139,7 +139,7 @@@ retry
>   			goto out;
>   		}
>
>  -		err = set_direct_map_invalid_noflush(folio_page(folio, 0));
>  +		err = set_direct_map_invalid_noflush(folio_page(folio, 0), 1);
>   		if (err) {
>   			secretmem_unaccount_folio(state, folio);
>   			folio_put(folio);
> @@@ -156,7 -156,7 +156,7 @@@
>   			 * already happened when we marked the page invalid
>   			 * which guarantees that this call won't fail
>   			 */
>  -			set_direct_map_default_noflush(folio_page(folio, 0));
>  +			set_direct_map_default_noflush(folio_page(folio, 0), 1);
>   			folio_put(folio);
>   			if (err == -EEXIST)
>   				goto retry;
> @@@ -228,7 -228,7 +228,7 @@@ static int secretmem_migrate_folio(stru
>
>   static void secretmem_free_folio(struct folio *folio)
>   {
>  -	set_direct_map_default_noflush(folio_page(folio, 0));
>  +	set_direct_map_default_noflush(folio_page(folio, 0), 1);
>   	folio_zero_segment(folio, 0, folio_size(folio));
>   }
>



--
Cheers, Lorenzo
