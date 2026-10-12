Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD65948E0EB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809905; cv=none; b=NgM92fdeyhyxHvl+ZNfmyCyGs2Z8XFU60JucfunSa4EMNVDp2vrOCw+I+K4pkcqWpqgsSTePPrY+VApJ2LmMyfzY3H3d9UtiEyL8bozln5PRvASUWo3ZlfswYhlGhSc/V/GPbSU6zz0Cum4cD/oTEALw18hcNLZtr9oCU1XSzU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809905; c=relaxed/simple;
	bh=Pw3m0MrcOzqjNa5MUqz9a3dHBXx7PPv+P4KBYfrD2FM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCU7PZAbq3nrjE5MUyAbwQPC727GesPpUTfVTe6jUkkGXwtahJYXOQGSuOR1Kap0DsL7tIQK8CWAdK4imSP94+14HKjvDYOKfCC5QQmhF+S8DbYfU5j6BGULpKq82J0yy5tNuFx++fYPMAzy064NPsp9dt+jkuKyyqoTfJhb87w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtbQWd/R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtbQWd/R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65521F0089B;
	Mon, 12 Oct 2026 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791809903;
	bh=eCffV+LjU44fVuxwyaH6GZe0H0I+W3HmXDUIbPeaT3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AtbQWd/RyZIQcaJSOx4arO+G10/M9zPE282t83jiUPnxcFMILI/MR5c98mRbJf8L1
	 1pXTATvUmoZmucTydvz2d3g18BgZz/thVtXTRpqMuILL7E5tjZTveHb+IawsOIhY9Z
	 ZCZR+vhM8poY6rmI3ZhSS2LZllcI9jEFLl6Fl0Z8A8qQIDUFgsVSBp4YDvdXANnlLH
	 rfqbOeJXUC4hK6qHvY8yh/6vH65kg9ad1AB+kMwWNzkRn89CoShs5r7ux6lkVKuIQg
	 FQ1s1nUBFaZOg2uxuF8v/vZOxIaQY7qPMHVtXbZ0r/JHUMBlP7WDog9T338kfKKYtx
	 uxpjrUIn73aLA==
Date: Mon, 12 Oct 2026 13:58:18 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Gregory Price <gourry@gourry.net>
Cc: albin_yang@163.com, akpm@linux-foundation.org, liam@infradead.org, 
	david@kernel.org, vbabka@kernel.org, jannh@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, albinwyang@tencent.com
Subject: Re: [PATCH] mm/madvise: add cond_resched() in THP branch of
 madvise_cold_or_pageout_pte_range()
Message-ID: <aszZPq92qX3jpsNE@gremlin>
References: <20261010024042.4070048-1-albin_yang@163.com>
 <aspKmWIrOzNjiP-t@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aspKmWIrOzNjiP-t@gourry-fedora-PF4VCD3F>

On Sat, Oct 10, 2026 at 10:26:33AM -0400, Gregory Price wrote:
> On Sat, Oct 10, 2026 at 10:40:42AM +0800, albin_yang@163.com wrote:
> > From: Wei Yang <albinwyang@tencent.com>
> >
> > Crash log:
> >   watchdog: BUG: soft lockup - CPU#63 stuck for 23s! [stress-ng-vm:1665914]
> >   ...
> >   Call trace:
> >   pmdp_invalidate+0x48/0x68
> >   madvise_cold_or_pageout_pte_range+0x84c/0xb00
> >   walk_pmd_range.isra.0+0x1ac/0x3b0
> >   walk_pud_range+0x120/0x190
> >   walk_pgd_range+0x170/0x1b8
> >   __walk_page_range+0x184/0x198
> >   walk_page_range_vma+0x94/0x128
> >   madvise_cold+0xd8/0x198
> >   madvise_vma_behavior+0x234/0x638
> >   madvise_walk_vmas.constprop.0+0xdc/0x210
> >   madvise_do_behavior+0xa8/0x328
> >   do_madvise+0xd8/0x140
> >   __arm64_sys_madvise+0x2c/0xe0
> >
> > Signed-off-by: Wei Yang <albinwyang@tencent.com>
> > ---
> >  mm/madvise.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index eeee82cf2b3f..0755e6d99757 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -450,6 +450,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
> >  		spin_unlock(ptl);
> >  		if (pageout)
> >  			reclaim_pages(&folio_list);
> > +		cond_resched();
> >  		return 0;
> >  	}
> >
>
> This same improvement came naturally from refactoring the entire
> function into a proper pagewalk structure:
>
> https://lore.kernel.org/linux-mm/20260922235830.2350770-10-gourry@gourry.net/
>
> this function is really nasty.

Nice!

And thank you for looking at this horror show of a function.

But yeah as Andrew said, need something for the backport, then your work can
help eliminate the source of such things! :)

>
> ~Gregory

--
Cheers, Lorenzo
