Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423722;
	b=0/RpAFn8dt3Sogynqgset95ajSfeh2MBks099ZDFCDPGhBMdB5QxKScgZXEHqLnE7nEF
	 49HyFbYJIco00C7gmpbXLBcXBSnzoRyfHwdc3gtrRRNT1qdFHXy125GQvglQ65+QOtF2j
	 zYBJfgEQdrZ/P78JIt8K/wTKJPQKNEzDXQ7Spg87A77LDJe6tnhNpQkJ1cMXV76Tc8Vyh
	 HyezL2XOteq0bshQof+M0s41Hg4GAXfgKEP/TMyoPI0ZNVUtzVjF5hXZJWQh+O6Ny3ma3
	 hU9hMzMW9PGI490GKL9oi07YEruTHieTH3YblmNq4+Mv9et4r/iGlbuTuj6HofkI5tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423722;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=UGvA7aNbElvHdqmQ/xMwu/aFIwDZ9xdeje6P1XRIG3E=;
	b=VCyELKpNxsCFLJIPSFSDowdEo/TK8Lq0Sjpu7KE3vi0SMIMIW5jBKJ3D/Wv6VgeFQc6w
	 TJ1XT+XRzrWgfUfAPAtv0awEcPXjb/lUjTcgsD2oLeEEwwBY1xk7OYQhGkqKX8NKJDmqZ
	 0L1/0C9gjbkySiaipELI7oQ3sy5OgP3FqLyvFa5d7Xrkz6UwYfipR0w6ma+ecOh+XYwwq
	 EK5mix7Oqj4tL45kT0Qc/ezJjFHSNJkDnW1kXDjR95zSiWS0ctiLV1aODGHHDgMUTLFW3
	 +5iTUoJ8XnaNPJJpq2pq6e/X2gYWfV1vx8bk2A6NXd7zK+TbMGgY7f0kXXb9LD9czfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYh0Hc5W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDF5606A888
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYh0Hc5W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B051F00A06;
	Wed, 11 Nov 2026 19:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794423721;
	bh=UGvA7aNbElvHdqmQ/xMwu/aFIwDZ9xdeje6P1XRIG3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nYh0Hc5WTvLXWR0PpdeDEQycij6SQVynG/D9w8M6LNmJF6fZnX+KZhqmcr9+DofTL
	 1t869zG0ixpyUwRsMt3QwMx5ThEG9Bs8ZLo8VfWWQs03p77SnH/0m4BPhxklYl5p4E
	 qLnpsBM96i9dW1JgfsTos/MYnkoPxVDpBCVFBQHCJWqxB1Cu2A6lj5t076B63LWVYz
	 pdtQrojzSvgJpSxUnaZ/WAP/T8jpr2H6hsgE/UDlifpjUWOel+gkuHuwUYFBf8Nmkz
	 CiO2rDoMh/Uzwyh6wFvwy84CBThROr1FbbUXBEb1cfAn7v27vpKfkasmGPV0QRwnXS
	 2dQy0JEAJJGFQ==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 45AB9198004A;
	Wed, 11 Nov 2026 14:01:57 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 11 Nov 2026 14:01:59 -0500
X-ME-Sender: <xms:pLv0auFvRs13t94fambPBJxaah0jl9soK9jYvksUwEnSQMFUiv7_cQ>
    <xme:pLv0avNH0BHJJysjdWJ0KAtbCZ2JluCm6hK8b7C_Tzf9l14Wp-zveuD2kDJmEmCzn
    Lxjr-dasRnZykEn0_ssIzr-zAvor5YsYf5DIuhLOb6Ib69OgTj7StNE>
X-ME-Received: <xmr:pLv0alf7Lhu2rO9745tEPXz2cD8D1p6-Jfg8z3UY9esl3NWls50yvUb07cU>
X-ME-Proxy-Cause: dmFkZTGUrBls5w/UEENbc4QSrU45nLKjL4/o++nqxC9OJS9f5x3nG4z2h0vA9zTXVlIrwk
    CwfDyXOcV7vO+BP7Z89KGrkm4YQkxS96v2gVR/kgVbZBHpUz2ZXhJO8sIGLtQj2Tn3CoVw
    hG0wp+uaydBlisb2ScHtGCEd4zxa002LBa33wxBHeD1SO2skN4MjcRow7HuyZS+C9CHS3X
    1FcU34iQECUsMDUhAG3tswsFel1JQc9DrrukwJo2Jx7ZCpcvn27jIuhpDvLHrUp+EucfbC
    UuoCLpjHnrpn3/cNfboWDuvRCcwgCfNKam4Uj7NynoW0ZDHcY/FmkLsgm6RcxCgB13MxaY
    qNJfZ63LHM1TLvxg9XzJ4AZzQh2FqHvqBn5XcefCQ7zln8J+tkHM7S7B3qyxFVOyLsCuG+
    aXReTLfd7xIPgO+kPGAOWnEnz8FBaJOvZ2d3vb6i132Qck9TpIkgM/rYZXgiNKVOqYa42L
    KA+Pt7RK+i5vWp3sEQpf7ObXQtNV+HFtkVgrWy6//p7vnTbQrBoqE6VZXWDe45Ooi5rv/e
    mJwBUg0Sigiy6BNH4OymxE2Wgf794hMQ05VG4dg2BtZiuXTvEm7vo+sNZZO2hC66pNhjlm
    BWq5x2q6oauGQt61tBKF3S+un8za9g8FYXHJAg/jFFoifSYnVYbwyGVsKt0w
X-ME-Proxy: <xmx:pLv0akTltdapm9PFC0tYwCjfAj_TxsUfUqqFlu3hmg46Vn9rjKYBOg>
    <xmx:pLv0aheLpWDc__1-d2kIRQApBXAWn3YxIOmEAOk47fqwuDNJZuG4gg>
    <xmx:pLv0asoogV_DY8Y9z02GhVBDWQKjBO9Bmtqber5ICa1Iy4WbDj_Qig>
    <xmx:pLv0aqeVLJlCdZkd1bX1rMWUV3dXQYLG_JvpLsklDqd7s3qtsgiPtQ>
    <xmx:pLv0aslaqHjoC7cmEZh296IHSmUbxZ7gIMTcVtgfZSFfqKedoNBkqcuE>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Nov 2026 14:01:56 -0500 (EST)
Date: Wed, 11 Nov 2026 19:01:55 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Wandun Chen <chenwandun1@gmail.com>, hughd@google.com, 
	akpm@linux-foundation.org, ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/migrate: improve mlock tracking for PTE-mapped
 large folios
Message-ID: <avS7FfzvjieHufUE@thinkstation>
References: <20261110123218.1579490-1-chenwandun1@gmail.com>
 <5f9c449e-43b3-4732-9c14-8199418cace0@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f9c449e-43b3-4732-9c14-8199418cace0@kernel.org>

On Wed, Nov 11, 2026 at 09:00:10AM +0100, David Hildenbrand (Arm) wrote:
> On 11/10/26 13:32, Wandun Chen wrote:
> > From: Wandun Chen <chenwandun@lixiang.com>
> > 
> > Commit ab521b4142aa ("mm/rmap: improve mlock tracking for large folios")
> > mlocks a large folio when all its pages are added in one rmap operation.
> > However, when a PTE-mapped large folio is migrated, remove_migration_pte()
> > restores PTEs individually, passing nr_pages = 1 to the rmap helpers. As a
> > result, PG_mlocked is not set on the destination folio.
> > 
> > Reclaim can restore mlock in try_to_unmap(), but Mlocked in /proc/meminfo
> > remains undercounted until that scan occurs.
> > 
> > Restore mlock once the full mapping has been restored in a locked VMA
> > under one page table lock, rather than waiting for try_to_unmap() to
> > restore the mlock state.
> > 
> > Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> > ---
> >  mm/migrate.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index 94033c222e04..140e291d4587 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -353,6 +353,7 @@ static bool remove_migration_pte(struct folio *folio,
> >  {
> >  	struct rmap_walk_arg *rmap_walk_arg = arg;
> >  	DEFINE_FOLIO_VMA_WALK(pvmw, rmap_walk_arg->folio, vma, addr, PVMW_SYNC | PVMW_MIGRATION);
> > +	unsigned long nr_ptes = 0;
> >  
> >  	while (page_vma_mapped_walk(&pvmw)) {
> >  		rmap_t rmap_flags = RMAP_NONE;
> > @@ -446,9 +447,16 @@ static bool remove_migration_pte(struct folio *folio,
> >  			else
> >  				folio_add_file_rmap_pte(folio, new, vma);
> >  			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
> > +
> > +			nr_ptes++;
> >  		}
> > -		if (READ_ONCE(vma->vm_flags) & VM_LOCKED)
> > +		if (READ_ONCE(vma->vm_flags) & VM_LOCKED) {
> > +			if (folio_test_large(folio) &&
> > +			    nr_ptes == folio_nr_pages(folio) &&
> > +			    !(pvmw.flags & PVMW_PGTABLE_CROSSED))
> > +				mlock_vma_folio(folio, vma);
> >  			mlock_drain_local();
> > +		}
> >  
> >  		trace_remove_migration_pte(pvmw.address, pte_val(pte),
> >  					   compound_order(new));
> 
> I guess pte batching would be one way of handling it, but that requires more churn.
> 
> The spirit is similar as in try_to_unmap_one(), where we count the number of
> ptes in one VMA. For consistency, I would call it "ptes".
> 
> @Kiryl, can you take a look?

Looks right to me. Agreed on "ptes".

With that adjusted:

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

> 
> BTW, why don't we care about that in try_to_migrate?

try_to_migrate_one() unmaps the folio whether the VMA is VM_LOCKED or
not, so there is no mapping left to keep mlocked; removing the rmap
munlocks the source.

The mlock is rebuilt on the destination in remove_migration_ptes(),
which is the path this patch fixes.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
