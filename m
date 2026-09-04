Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932F54F7971
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539233; cv=none; b=SPxzUpu9JCPEgCvz8HNkX5uG3OxsARxiT5MiScBxJWdJu0aDZx/Q/5DRU+A8igS0ibrimir+yiZGaQ2DbEL/pnARdk2EVIqQBXcsJp1PwW6hmn6kfZGD6cKQ27LpoL6frXX67A5iAMc1oqd7A6SiiCGxqCj0c9I6sr/6eNc85n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539233; c=relaxed/simple;
	bh=Bzqda/OM9WfC5QROOwP+UVPMJJ1L/EIMryh5/bfDl/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIVQwRaRWAR4iWrLue/yvZJd7mKv6rloyt8AAHyxs1cHDHKprzsGxJpZx4Kum4DRA32JG7PoV9U2LoGh9t7qG18c+bR7R+HLHYi5gofL/g8xwTttNGBCPFZyM7wcJBuRo+qMNe/lR06EV/F0larOER/tFFfy5rWfr54XxLuMKmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZnyPxW47; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZnyPxW47"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b8687630fso11062665e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788539230; x=1789144030; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r44+M//4DhylFOBUCmAtsCMDMPsNkoNaCuU6IAuNSxs=;
        b=ZnyPxW47L4xepgcFDH2vlsOPFkNmZhH/BPXeMI5vEX9wt+OnllLDzwcS9Ooq2JB7Gs
         cRbW2Avs6bEhmdmqo8VUETlRjD/8MFQnInKs3MsF+FP+NmCaS5xFe70JpPdl5IOoLecf
         3e5Fo4jO+BPmzU/3chOUVYqPklThCVnYx6J0tU2Se9HEXDgI+PpzERLVqSZ+1UrUQf/k
         xF8A1VEFVSoyYOPEW2w3w+Fp9j+HrDj8YulsnK80iVpK48FQp0GfXrezWU6PVH18wQxa
         BHNnyJHEqsF7WznVuDQLXS3XGYgS8RH5SVZHf1pi3ntC4d5ZHPAYWEnw43OcC6Lp+0Wh
         ufMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539230; x=1789144030;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r44+M//4DhylFOBUCmAtsCMDMPsNkoNaCuU6IAuNSxs=;
        b=IWRUHHQrZroMtcnUAP48dO8woRdoRKl+Dz5XZLfjL7MGqRTQw9zKiBSTAXfggk2DSC
         BYorcdjSPWTLp5l1bLrigQ2f3cBdjDFYoj16lfzW/Kobk0PMCOoRcD2gYzqDWVZ7PSfh
         3lNW4QWZCOjex8N0Ar0zr2K8l5ieUnhzZ0AbmWlOwBJjnC0WmPrBEbRneMVvV3m70aWv
         WCAC5JHyWlXARaiVDgPwolSmMMy8M4ClV65Ckm1KyObt8Smyfscr6j0+9dN1npieH9+I
         vCn2OcixsNnAJCcjr+6GqTSkKEo/MKo9T8Ctl+PC6qdEBEudxtrtDF+n+vIa9VyHh66l
         O6xQ==
X-Forwarded-Encrypted: i=1; AKwUvByspeJrcxOWFUwFOYTbe50PlOeKY/L99CpU+v44iDSxjHFukXtve/4Hx0MIU+EDjWdD8a4BMRkqgthPt0I=@vger.kernel.org
X-Gm-Message-State: AFuF++nQHJiP81M7B0PgE5HwcUh2noleOmu/c0mG/jdpQQIj8Nny12Wv
	qA1EnjDrDLdMHIIzp0nnIwHHv9pLHv2rOmJWUou4PzeXD0tuAfOY/qg9IrHc15lTmI8=
X-Gm-Gg: AYBFou3dHiLkuzi6NPfH5u1ci3w2JeL3kOMG0gXxUfwv569KLFmeIkaWP8oiO9QWC5C
	ODjoHXpZCgRpENC013gz6n3ebGozOO99jUYV0UKqHc4C01XsKSTvngnjQH9ZI6RA3qhdgicC5Jc
	XAo86u47c9MAFg8546ZRJcIpkjEGtJj4vahq9AbfbVgifgzvdQ83X56pPbTzyK+fj+mQmy4Mb3N
	tX+6dZV/lWploA/FpnATdfCjjVMuH60KqCvQdBMLsUHSQM/H88SzdmYxRKMdLujyQQycklLBV9O
	y6E6LsKarZ4mKvGzckZbVv0izjx7Lk+oT5FYkPn8C6dQW7IjSEohJOXx/dhDTGgZI3+ia4VfOQY
	fKvKpZ73aoPfhHTnxblDR2yo9unMXJLkqDPyQyTe9t0SlMEOJD4V/dImiXls6G+wbC8azIeVYPq
	pbAvYZDN9oUqaKiF7QmFuvSp7NbL5vYtk9O4nw9Yt+6uLd0OpOckvjzn9aaf9F/8GRPMPnzusC5
	A==
X-Received: by 2002:a05:600c:190b:b0:49c:fa21:e743 with SMTP id 5b1f17b1804b1-49cfa21e92amr53496425e9.25.1788539229587;
        Fri, 04 Sep 2026 09:27:09 -0700 (PDT)
Received: from localhost (109-81-91-122.rct.o2.cz. [109.81.91.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff8195ffsm20600285e9.14.2026.09.04.09.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:27:09 -0700 (PDT)
Date: Fri, 4 Sep 2026 18:27:08 +0200
From: Michal Hocko <mhocko@suse.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Charan Teja Kalla <quic_charante@quicinc.com>,
	akpm@linux-foundation.org, mgorman@techsingularity.net,
	david@redhat.com, vbabka@suse.cz, hannes@cmpxchg.org,
	quic_pkondeti@quicinc.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 3/3] mm: page_alloc: drain pcp lists before oom kill
Message-ID: <aprxXHSh-LyqaFCW@tiehlicka>
References: <cover.1699104759.git.quic_charante@quicinc.com>
 <a8e16f7eb295e1843f8edaa1ae1c68325c54c896.1699104759.git.quic_charante@quicinc.com>
 <aphSYFTd12oia8K2@google.com>
 <apkhSHr3by5Bf8jW@tiehlicka>
 <CAO9r8zPCYNmJbkQEA62z75AB=ziWqGb38_E-ee_6o40Sz=zHXA@mail.gmail.com>
 <apqppFukssaAQz3w@tiehlicka>
 <CAO9r8zMBBhhqepbLR9buOOu7bpyLW+UTu55DjbCYrbBp56rkCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9r8zMBBhhqepbLR9buOOu7bpyLW+UTu55DjbCYrbBp56rkCw@mail.gmail.com>

On Fri 04-09-26 09:09:35, Yosry Ahmed wrote:
> On Fri, Sep 4, 2026 at 4:21 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Thu 03-09-26 07:03:33, Yosry Ahmed wrote:
> > > On Thu, Sep 3, 2026 at 12:27 AM Michal Hocko <mhocko@suse.com> wrote:
> > > >
> > > > On Wed 02-09-26 16:49:48, Yosry Ahmed wrote:
> > > > > On Sun, Nov 05, 2023 at 06:20:50PM +0530, Charan Teja Kalla wrote:
> > > > > > pcp lists are drained from __alloc_pages_direct_reclaim(), only if some
> > > > > > progress is made in the attempt.
> > > > > >
> > > > > > struct page *__alloc_pages_direct_reclaim() {
> > > > > >     .....
> > > > > >    *did_some_progress = __perform_reclaim(gfp_mask, order, ac);
> > > > > >    if (unlikely(!(*did_some_progress)))
> > > > > >       goto out;
> > > > > > retry:
> > > > > >     page = get_page_from_freelist();
> > > > > >     if (!page && !drained) {
> > > > > >         drain_all_pages(NULL);
> > > > > >         drained = true;
> > > > > >         goto retry;
> > > > > >     }
> > > > > > out:
> > > > > > }
> > > > > >
> > > > > > After the above, allocation attempt can fallback to
> > > > > > should_reclaim_retry() to decide reclaim retries. If it too return
> > > > > > false, allocation request will simply fallback to oom kill path without
> > > > > > even attempting the draining of the pcp pages that might help the
> > > > > > allocation attempt to succeed.
> > > > > >
> > > > > > VM system running with ~50MB of memory shown the below stats during OOM
> > > > > > kill:
> > > > > > Normal free:760kB boost:0kB min:768kB low:960kB high:1152kB
> > > > > > reserved_highatomic:0KB managed:49152kB free_pcp:460kB
> > > > > >
> > > > > > Though in such system state OOM kill is imminent, but the current kill
> > > > > > could have been delayed if the pcp is drained as pcp + free is even
> > > > > > above the high watermark.
> > > > > >
> > > > > > Fix this missing drain of pcp list in should_reclaim_retry() along with
> > > > > > unreserving the high atomic page blocks, like it is done in
> > > > > > __alloc_pages_direct_reclaim().
> > > > > >
> > > > > > Signed-off-by: Charan Teja Kalla <quic_charante@quicinc.com>
> > > > >
> > > > > [Sorry for thread necromancy]
> > > > >
> > > > > Hi Charan,
> > > > >
> > > > > Are you planning to respin this patch?
> > > > >
> > > > > I know that Michal was questioning the need for it. While doing some
> > > > > stress testing I came across a couple of OOM kills that had significant
> > > > > amount of memory in pcplists. Something that would have been prevented
> > > > > by this patch.
> > > >
> > > > Could you share some numbers to see the scale of the problem?
> > >
> > > Sure, here's a sample from an OOM log (ignore mapped/free_mapped, it's
> > > from the ALLOC_UNMAPPED series):
> > >
> > > [   40.336188] Mem-Info:
> > > [   40.336195] active_anon:96 inactive_anon:1540181 isolated_anon:0
> > >                 active_file:51 inactive_file:0 isolated_file:0
> > >                 unevictable:382720 dirty:43 writeback:0
> > >                 slab_reclaimable:20339 slab_unreclaimable:26597
> > >                 mapped:382858 shmem:153 pagetables:8291
> > >                 sec_pagetables:0 bounce:0
> > >                 kernel_misc_reclaimable:0
> > >                 free:17264 free_pcp:16890 free_cma:0
> > > [   40.336199] Node 0 active_anon:384kB inactive_anon:6160724kB
> > > active_file:204kB inactive_file:0kB unevictable:1530880kB
> > > isolated(anon):0kB isolated(file):0kB mapped:1531432kB dirty:172kB
> > > writeback:0kB shmem:612kB shmem_thp:0kB shmem_pmdmapped:0kB
> > > anon_thp:10240kB kernel_stack:2576kB pagetables:33164kB
> > > sec_pagetables:0kB all_unreclaimable? yes Balloon:0kB gpu_active:0kB
> > > gpu_reclaim:0kB
> > > [   40.336202] DMA32 free:34808kB boost:0kB min:11028kB low:13784kB
> > > high:16540kB reserved_highatomic:0KB free_highatomic:0KB
> > > free_mapped:11032KB active_anon:0kB inactive_anon:1487720kB
> > > active_file:52kB inactive_file:20kB unevictable:393252kB
> > > writepending:4kB zspages:0kB present:2096760kB managed:1991156kB
> > > mlocked:393252kB bounce:0kB free_pcp:42404kB local_pcp:2460kB
> > > free_cma:0kB
> > > [   40.336205] lowmem_reserve[]: 0 5976 5976
> > > [   40.336210] Normal free:34248kB boost:0kB min:34024kB low:42528kB
> > > high:51032kB reserved_highatomic:0KB free_highatomic:0KB
> > > free_mapped:34028KB active_anon:384kB inactive_anon:4672764kB
> > > active_file:180kB inactive_file:0kB unevictable:1137628kB
> > > writepending:168kB zspages:0kB present:6291456kB managed:6120144kB
> > > mlocked:1137628kB bounce:0kB free_pcp:25156kB local_pcp:764kB
> > > free_cma:0kB
> > > [   40.336213] lowmem_reserve[]: 0 0 0
> > >
> > > As far as I can tell there's about ~65M of free memory stranded on
> > > pcplists (in an 8G VM), which would have kept the amount of free
> > > memory above the watermarks and prevented that specific OOM kill.
> > > Although, as I mentioned before, this is a synthetic stress test.
> > > Perhaps in practice it doesn't matter all that much in practice, but
> > > it seems like the logical thing to do.
> >
> > yes, pcp lists are quite (unusually) high. Is it possible they simply
> > got repopulated after the first direct reclaim run? Or is there
> > something else(odd) going on?
> 
> I think in this case there wasn't a lot of reclaimable memory (mostly
> anon with no swap), so at some point direct reclaim didn't make any
> progress. __alloc_pages_direct_reclaim() only drains the pcplists if
> reclaim makes progress, I am not sure if that's intentional. An
> alternative would be perhaps removing this condition, something like
> this:
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 8d79f76cdd0e1..98e9079240ad5 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -4592,11 +4592,12 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask,
> unsigned int order,
>         psi_memstall_enter(&pflags);
>         *did_some_progress = __perform_reclaim(gfp_mask, order, ac);
>         if (unlikely(!(*did_some_progress)))
> -               goto out;
> +               goto drain;
> 
>  retry:
>         page = get_page_from_freelist(gfp_mask, order, alloc_flags, ac);
> 
> +drain:
>         /*
>          * If an allocation failed after direct reclaim, it could be because
>          * pages are pinned on the per-cpu lists or in high alloc reserves.
> @@ -4608,7 +4609,6 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask,
> unsigned int order,
>                 drained = true;
>                 goto retry;
>         }
> -out:
>         psi_memstall_leave(&pflags);

Ideally if we can make the function call less hairy. Maybe we want to
make draining part of the reclaim as the last resort when normal reclaim
fails.
-- 
Michal Hocko
SUSE Labs
