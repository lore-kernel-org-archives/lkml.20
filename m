Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8CC4FD7A0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739224; cv=none; b=U/a4KCUofKQWjBQjSaI7sKUf/oWJi1LKP9LuiNXjkrjneL2t2Jn11Ykd7Nt3XqjUioMjYK5YCwDg9wo10cqgbxlvHLUkjQSEL2jjoinnIwAMyxmm4gsMf6lx2XNHMSpHL/90ne0S9TN9EaFg1wCxmwLcEQEasUnlGe0TcFTsgto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739224; c=relaxed/simple;
	bh=p5fI5L9DX2MDhuLbEK8/QoiotSUe44g5xg1NiPDCA0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OzSgjqaScBgC9oy17dj3LM8xLLXTSecwfiDNx6Je77VZckVDz9Ok/4svw+Q+hMIR3zGJrJA/Uu4SGu9L1KJK/ZhRh4O7yT2u8QZEG1K+bkY3RJKcOvfGbcaVddNYG34nQXTJk0LxUs2gPMNucDEuEI5qHGOY2lrmAL60QskLCsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=iaEW3ZC8; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="iaEW3ZC8"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109f067fso97808685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789739221; x=1790344021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pC80FFx3P+R/wVH2EKfilVtA17zP1wc/C+ZmKYlpplI=;
        b=iaEW3ZC8sHzuz03oP8sgRmSco1WSJcJ6ctqqsP9wejGLncfWqurgGfnalmbDAHSxjh
         pCe+5wsCWkYa5S/wWqEus6m+Q3h/FPxTMwvkNsJcH4af9XLJ6aDCsKKsaBYChi4alhH2
         oxcvWXUCzsE1QWS7kXSXn/bYd7erhpO3jKX2+lxc14U1xC+Q0kMvXdSLvdcUnbozYsgt
         fKaOvI10PwXyeCiH2mo0htaDV+0vSR9WI47OLeN6sMcj2NoeQxYDVRqqV9KxUcS1JhLt
         NHkcssDb2Qz3PK5kD0/MJEm2YnfrgOQ2bhGb8FQUeQjZcu/7fvtZKpd20xWhzBFfL+Ex
         1wJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739221; x=1790344021;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pC80FFx3P+R/wVH2EKfilVtA17zP1wc/C+ZmKYlpplI=;
        b=d3hU7FlWWFt8AoHC1lA/DOA7otIC3sdzpToLPq1bFRj1HcyIbX5BhtzcVV4fVn8BDP
         TIYTedUvyn8aPIvKxhnKCoT34X5TQhhrX5xxNP4jnnGEjAYfV8C6UoPZ5PzOr/MIyBMs
         nbLnsxiastvZ3AUfIAiV+xKfWDXIwisqXvK9mUXGcKFo/wx26oa6v3LinaFJIzQ4uQLW
         OXWepVhF58PAKXQmjWDMv1wwRLDuZxE+pZVmZOrpHo8HQoquHYgDskp3GT9VO5X71ZWr
         MYOcB8ufaVnVwz3jIGYRmWbIMLpybGzLMvihfgSYO1mkWQAv+bB8sBOocfU2KHZ06Jrd
         mo2A==
X-Forwarded-Encrypted: i=1; AKwUvBzYoYmTWVULN24RdVvzYplLGIyBLzHsx3pc0bAztv6lA9czLqGHM64M4gksYSAKmYYKq72qEWPzpMJcZC0=@vger.kernel.org
X-Gm-Message-State: AFuF++n88ZTwDeHVTo8TYZuiPQ+k8JjfqkiLo7lI21MJPCnUrMYuGwWz
	16IzTtCGdH9tfh9B1JEDf9+g8wF5Ir9mG7nHAPbA5W9qfGldDHKtHbK9D+PNQHIyRiM=
X-Gm-Gg: AYBFou2fG2zFMYwDvUSlSj7vEnVYATdmNDbzelXxQr5mFRIZHlGLfBhOAM9FXs7gJKI
	exEyayvCFeFnxXB14LozhKlr/cVYzR4EQBxX5HkGeHEijvAC6hX91X2Bo8fyNWBsaWEl2NGH8sb
	X977gQNdkBBJi7+uFSIsDU7fu4U2oquhrBrE1fpLUANKvXg2SmtywKqOhtgy7NBcTRZuscuPGvh
	pIUxQ80g4aelx4bHHKnjEwaNCfbGHzXKG3jGjX0JUCnvLGXBvcE5GyKqfJC0Wtw4dMPowNU7O3w
	VXGu6bA64Om/++bLwhDz42qmpaOPFHARyyOiSC4zIUWhC+lwX/sMA6zt/cxTgjxnocfT5dF72ob
	UXMZa+jCEtaHgJ8UWqKmv54GxNY0tLn3tky8YQoAJPyQZHZS4yWmMwYuHaXv+r9NnxMtVomyz4i
	xAXcYYo8wAXzxhzuBhmaZ87nR8XAwR7/rflRtF02m+k7+kh69TKld9ayWennv14ZW7f7tdO5XCg
	OdHGlWMeKBsWmjQv+j2aDrKCg6nTw/XXtmT/JffShImBfwaZ1dF1mg=
X-Received: by 2002:a05:620a:1b99:b0:939:7835:8f87 with SMTP id af79cd13be357-93bdc6a6dacmr356633385a.17.1789739220927;
        Fri, 18 Sep 2026 06:47:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0e9e752sm144316085a.22.2026.09.18.06.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:47:00 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:46:58 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, jannh@google.com, pfalcato@suse.de, 
	osalvador@suse.de, hannes@cmpxchg.org, raghavendra.kt@amd.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] mm: support promotion-only NUMA hinting scans
Message-ID: <aq08OIJ5mCnDVIfs@gourry-fedora-PF4VCD3F>
References: <20260911001826.2109390-1-gourry@gourry.net>
 <20260911001826.2109390-2-gourry@gourry.net>
 <9b5e1573-6fd8-48a5-a274-a6e7ff83d2fe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b5e1573-6fd8-48a5-a274-a6e7ff83d2fe@kernel.org>

On Fri, Sep 18, 2026 at 02:37:52PM +0200, David Hildenbrand (Arm) wrote:
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 969594074fd2..2d1b59a27629 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -3408,6 +3408,8 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen);
> >  #define  MM_CP_UFFD_RWP_RESOLVE            (1UL << 5) /* resolve rwp */
> >  #define  MM_CP_UFFD_RWP_ALL                (MM_CP_UFFD_RWP | \
> >  					    MM_CP_UFFD_RWP_RESOLVE)
> > +/* Whether a MM_CP_PROT_NUMA change is for promotion only */
> > +#define  MM_CP_PROT_NUMA_PROMO_ONLY        (1UL << 6)
> 
> BTW, shouldn't we just be using BIT()?
>

I originally had a 5th patch to convert it, but i dropped it while
making multiple attempts to avoid a CP bit at all.

I can add it back to the end of the series if you like.

> > +		promo_only = !(numab_mode & NUMA_BALANCING_NORMAL);
> 
> bool promo_only = !(numab_mode & NUMA_BALANCING_NORMAL);
> 
> 
> and in the later patch
> 
> if (vma_is_ro_file(vma))
> 	promo_only = true;
> 
> ?

Yeah this is confusing, but it is correct.

1) If we're in the code at all, balancing was on at some point.

2) If !NORMAL - then TIERING must have been set - so always true
   (promo_only says: only PROT_NONE low-tier folios)

3) In (NORMAL | TIERING) mode.  promo_only = !NORMAL = false
   (so in numab=3 - we PROT_NONE top-tier folios)

4) But this causes socket-to-socket bouncing when (NORMAL) is set
   so we retain the "no R/O file" filter by checking it and setting
   the promo_only filter back it.

It is, decidedly, quite awful.

But the problem isn't the fix - the introduction of the R/O filter broke
TIERING first.  The problem is that these filters never took both modes
(NORMAL, TIERING) into account in the first place.  They optimized for
NORMAL and broke TIERING.

> 
> Stupid question: why can't/shouldn't change_prot_numa() query
> sysctl_numa_balancing_mode? Why do we have to query this outside of the function
> and forward it?
> 

We need to calculate it anyway for patch #4 to track when the last full
vma scan occurred in numab=3 mode.

We certainly can, but then we calculate it twice in the stack and it can
change out from under us.  I didn't want to have to think about that
split-state problem, so I err'd on the side of calculate-once and do the
whole operation based on that state.

I'll need to pull up some investigation notes, but I also remember there
being a situation where checking it underneath this caused more scanning
work - didn't want to regress anyone. This might be resolved by patch #4.

> I mean, change_prot_numa() gets the vma and can query
> sysctl_numa_balancing_mode. Why not move that into the function and avoid the
> boolean parameter?
> 
> We do have a single change_prot_numa() caller in the tree ...
> 
> >  
> >  			/*
> >  			 * Try to scan sysctl_numa_balancing_size worth of
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 30b7c63b0e35..2f9ada1bbcfc 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -2784,7 +2784,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >  			goto unlock;
> >  
> >  		if (!folio_can_map_prot_numa(pmd_folio(*pmd), vma,
> > -					     vma_is_single_threaded_private(vma)))
> > +					     vma_is_single_threaded_private(vma),
> > +					     cp_flags & MM_CP_PROT_NUMA_PROMO_ONLY))
> 
> As raised, maybe just forward cp_flags
> 

Yeah fair, i'll do that and just add (or eliminate) the
single_threaded_private argument if possible.

~Gregory
