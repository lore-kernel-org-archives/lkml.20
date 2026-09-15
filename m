Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850CC414418
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491643; cv=none; b=LHbY4OPqnoUK4eR2fYdAwuywirYkxCIakSK7r5hkCcA+HhFw04lnL/KCk3/2HF3Cznnyjp1uLK7EHeiXvVCqf58NpxrD7dfGHyCmV2MQO4hgH/9Mec8d5GsPbs6oPosSixP52bgX8P5eXcHrMO+S3AZHo5E1QJaosIIOAmQIW78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491643; c=relaxed/simple;
	bh=OnuZ+BwkSdhjDschQ2BAweRJ8IwvXb1/GKs0Z+4e8Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzN9cM/PDyvS31QiMBtflqjShixc4UvF7QI7tD7gIoIHKK2q+BnIEtqaxC8K1GZ9cvB3WTi+5s556pnVrSwK5Uxj9xpcBcaaoZutKk/V1z0XWdpYR1rnAkb6Zj3FtU2dxybzet2/zpyYdMEPPyyej3HBHcyFRlAuEZeFWP52q2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=iZVMgkKo; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="iZVMgkKo"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb3so41356446d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789491638; x=1790096438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7OHDMKW8AHHfxeSwNE6rmRPVcZ+sv/FI4h4eXB3h1kY=;
        b=iZVMgkKoNk5E1J1NjCon471jyV4Ju+MJ6mSFOyJ98N5lNkjcSuxp1hly5qjtC6y0Uk
         rMHKn5VhYiwCMa0B/0k+SGeIBXqnYMU7g0Zd39LICvG80sFb/SwiTROh79S/ipO+9bp4
         UJcgVsH88AdG6JQIxX/Jux9yi18Iv7XOoVzm0TyqwIoYnP6l/Fo11UFBslLSpFN1P845
         qzKZQIvkzkZMuQG+BHC/Tks6fxetrsZe6NIAe8bKJfSBCiC7s8PhtaYpfLIG3riLxbro
         LdzJ082AuYdGbFiG9LTvPRWRdeeYoOdco1cVXogljts+6XTG84ZUHdN2WmEaEfXmtDjD
         7B6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491638; x=1790096438;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7OHDMKW8AHHfxeSwNE6rmRPVcZ+sv/FI4h4eXB3h1kY=;
        b=btscLc/T1UXeqxLwGPNjTiH3iSmARIuNqISqX3u5G5pqAoU0ODyhv62pu1RicscSfI
         hpC6OT1pxhW9ntpOSWAmZ3Gvn329uCikFDs7YTDvD7Ts+0q1MoASlOI/B20BFgX6YKA8
         vTwGPuJeG0WVIpAIC/B1+qR7+q3X+yD6Zx4lnGDy3JyDE4MV+bnAWHT6QMq/tL2avWrG
         5v0C2zl1o5uq9QecZwMDFzRrvkkfNjklH7ZI9kt8wIoBHvtoDYWm8AD42m2OkqNvlx3i
         901E97UQYsrmOXM8JtffixF5kzz4y9WRqHEn4zxHWHIFhUpJ9mdxANhD8DlzyOWfQTp/
         gZpA==
X-Forwarded-Encrypted: i=1; AKwUvByqSNd0NYb8DDSMkvivppFcR7VB5KM1KoTzvPAvl1vs3nCRQIwLEDrUYCTJxvnrVtIfkNIP/u+Ora0WG5U=@vger.kernel.org
X-Gm-Message-State: AFuF++kBbriYRyZVPOIbWXQUq8viB4oEf96Kh3IRhFfHsju6sNmQ/NHL
	/iCcBwbUjpvPSRyIZTR9o5LRMbV2lxs+ZsPmh8K3TBK1h5M7tTqxzA5dp5syYM4cA8Q=
X-Gm-Gg: AYBFou12KPsywI8VnEy/f4K00sDj1ZGVUEz8+Zhevh9k4H8nrVE6uiR/aDvibcoXn1S
	T5YQ0W/esgetQ6VPw200DpwCOVuMhZiRnoCfTMelWE9SvCcC4OYrFTZIwzD7lijgOBxvNK2JhkY
	aBh0V+3o9n8iOu/dRoLqWJOzcOYiwU/fEnztkYDRyXZ0wlVUpU60fa3Qr7AYydBCAe0qIhuWWAs
	EHo1oAdNjVVMn8rsRQmsJu/RwfBznWl8KJT3npgKQFROXnIGNHNUCNoJzMx2giIXI51gHqZIkCL
	dfLlz3pFCEtuv2ef9qlA91LxMiNnQ4iUFvszSm/1iztixb9WxfGVbYCnRDdy17NzN17Rru3q3vx
	X7cJ9r9X/WRsBMHujKlTXb2VCrvYjVii+uoFWHxxi7vxyZnGjPMM86Pi5bN0y9j3mIVmx21RhXl
	pFgs00SAOT+9bG4YgGbvK6CkZG7vGnP9jTvq33TwFi0FiOiIxWEWbnL9Wp9a+uEFKiUTDVD61zQ
	+h2D2TQqrXzHMqz5m7wm2GsRt6ACL+Z9NCafDOBLLTdoB31nxb3jl8=
X-Received: by 2002:a05:6214:2e47:b0:910:345a:f453 with SMTP id 6a1803df08f44-9122e65cc6dmr128613806d6.36.1789491633607;
        Tue, 15 Sep 2026 10:00:33 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123bed0aaesm2890416d6.41.2026.09.15.10.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:00:33 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:00:31 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, liam@infradead.org, david@kernel.org, vbabka@kernel.org, 
	jannh@google.com, wangjiexun@tinylab.org, sashiko-bot <sashiko-bot@kernel.org>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/madvise: reclaim isolated folios if PTE restart fails
Message-ID: <aqlzzwLOVT79Ti_7@gourry-fedora-PF4VCD3F>
References: <20260912110832.3203902-1-gourry@gourry.net>
 <aqloB0zm3RjJ47m1@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqloB0zm3RjJ47m1@gremlin>

On Tue, Sep 15, 2026 at 04:55:47PM +0100, Lorenzo Stoakes (ARM) wrote:
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 574aa2bb7c7e..ba5a3d77241a 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -464,7 +464,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
> 
> This function is truly some of the absolute worst code I've read in
> mm. Shocking.
>

relevant meme: https://i.imgur.com/W0N40BK.png

No argument here. This function in particular is really horrendous.

I think i'm now 4 or 5 stacks deep on the "Thanks for fixing a bug, but
while reviewing your fix sashiko found yet another CVE-worthy bug".

I'm convinced (like you below) madvise needs some attention.

> >  restart:
> >  	start_pte = pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
> >  	if (!start_pte)
> > -		return 0;
> > +		goto out;
> >  	flush_tlb_batched_pending(mm);
> >  	lazy_mmu_mode_enable();
> >  	for (; addr < end; pte += nr, addr += nr * PAGE_SIZE) {
> > @@ -568,6 +568,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
> >  			folio_deactivate(folio);
> >  	}
> >
> > +out:
> 
> Seems odd to put this here for a condition that explicitly guarantees
> !start_pte? It should be before the if (pageout) reclaim_pages(...);
> surely?
> 

I wanted to prevent any future use of the label from skipping the
start_pte check.  The function is so bad I was err'ing on the side
of being a bit defensive without making it worse.

I suppose reasonable to say the goto is worse.

> I honestly wonder whether, rather than adding yet another label/goto into this
> absolute bloody mess, whether we should just live with a bit of duplication and do:
> 
> 	if (!start_pte) {
> 		if (pageout)
> 			reclaim_pages(&folio_list);
> 		return 0;
> 	}
> 
> I actually think that'd be clearer at this point than throwing in some more
> indirection.
> 

I'll spin a v2.

> That's for the backport but somebody needs to rework this entire bloody
> function going forwards...

The longer I look at madvise, the more I think it is a wart on mm/
as-written.  A userland-driven page table walker that requires all
the special-casing of Yooj Pages, zone device, swap, soft leafs, a
bunch of tlb flushing 5-tabs deep...

Scary surface.

I've been trying to think about how we might make this more reasonable,
but generalizing the different walkers across mm is pretty hard.

~Gregory
