Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9C8359A81
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 20:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791665478; cv=none; b=RvunQ4eUS/3FeHdeumh6KYsH+8atgpa8vVG+AQ6ohP8ndaWQ7L4wEQlSbcBFClucCSpf6Rqv/lLiVFvdz6gVO7OF6moirUBUDkFuVWyzdNvMK/B8VPDTSSMw+If8M8wnaGCLkL2ZUXSM4nan4J9CyAF5NXNZU6xBIpW7Y/HiDrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791665478; c=relaxed/simple;
	bh=vn1wgRF37gxK2rxoSmHVovtLeOOTf8BoaKJJcdq7oig=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=OunITC1L2XxwC3Kb6c8IAU3II85gbJz7gfctChEughbDkqtVtAql1Mx9gOYy+KZDaCWanwInxmsxD+Z//eVFwApv8UcubxyUO6XNxnTcskjaroOkfv0sHf7DVWaTiLCNtNCZAH11Thuv9eCTJWpShM5vRHTOteuDGhqP5tp2asI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UCHDDdub; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UCHDDdub"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093061F000FF;
	Sat, 10 Oct 2026 20:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791665477;
	bh=NUFEw/UvQszY8V/MSvsl3qes7TlA12pcLfGdknNAePo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UCHDDduboxO+fyA8mS2uiVB9eEogTIMRs9IW5Aq2BjUCxHSf6BtyxLzks7JuwqszS
	 GOgQwxtPFF+h+r/MTxGa0wiI2oR3R7t5v5nUgaEm7MLdpVfD5WoSqTwH/WNVcdNABp
	 vk7eCigaFDA7GdnNLfwrzHUqfCR/XawWOgHZ/YnM=
Date: Sat, 10 Oct 2026 13:51:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Gregory Price <gourry@gourry.net>
Cc: albin_yang@163.com, liam@infradead.org, ljs@kernel.org,
 david@kernel.org, vbabka@kernel.org, jannh@google.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, albinwyang@tencent.com
Subject: Re: [PATCH] mm/madvise: add cond_resched() in THP branch of
 madvise_cold_or_pageout_pte_range()
Message-Id: <20261010135116.7d2a4f3b1a25e54fe4617fb6@linux-foundation.org>
In-Reply-To: <aspKmWIrOzNjiP-t@gourry-fedora-PF4VCD3F>
References: <20261010024042.4070048-1-albin_yang@163.com>
	<aspKmWIrOzNjiP-t@gourry-fedora-PF4VCD3F>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 10 Oct 2026 10:26:33 -0400 Gregory Price <gourry@gourry.net> wrote:

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

I'm thinking

Fixes: 9c276cc65a58 ("mm: introduce MADV_COLD")

Sep 25 2019.  So 5.x and 6.x kernels want this.  Current kernels
actually don't need this because PREEMPT_NONE has virtually
disappeared.  But 99%(?) of machines run 5.x and 6.x.

I'll go with Wei's simple one-liner for backportability & safety. 
Let's look at broader changes in future -rc cycles.

