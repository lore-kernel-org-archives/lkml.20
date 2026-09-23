Received: from mail-qk2-f21.google.com (mail-qk2-f21.google.com [74.125.230.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1007A2EEE60
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128781; cv=none; b=uvGxZf5g8f/WSPfmoyefK+aj33Kde1NT1VxPLfaMl7sZPRT+ER6ah5dP/EHbd0NCzcJzRisqtOb//DclFMNeSmi61n70Rvel3+wp+78q49xWXiyG5LKn6tyAhFHK5Q5sO9kFGUiZIMxHU3PetO52k+z/caQ4zdkpfhLvNQSrmYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128781; c=relaxed/simple;
	bh=txXV104ZI601HlQXtbivBRA727Ce+XjFql96CfIW5zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWDwmmne6iml8+YmIEPSmoBICZ93osFn3u93qKGTN4DGR+3XfsRxvJmqCoX49O/SLL5W1uK7Y+2TwmFoVNRjtDQVfwu69NB3d1lQBl/okt6K1PNNnFBWl46B9Z4coSjk5wQR/sKEHP3w5L2q9pMjL6W1ZEtXqdgo+mc2CNh+iDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=bjBrCJoJ; arc=none smtp.client-ip=74.125.230.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="bjBrCJoJ"
Received: by mail-qk2-f21.google.com with SMTP id af79cd13be357-93910cadea0so33622585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790128778; x=1790733578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pUjXO0uskRHAPb0FNYBwdm7PFr+ea41NeGJqQkShqkw=;
        b=bjBrCJoJQmDU4F1cDPY6UcFZ2cM9k1mz0vlGNZGyOPh/1jG0GM/nfX/mpjgegrvGEE
         RtC1fe0WM886Vm2kWkQr8MhmJch1wNKeDhl6pY3xnjzphU2GACP0klswavF1k05n0jVv
         nNG3/m9ObQ8CbFVt1x2yUEaMFbOd6hE+XhY/qt1ZfsJ/5kwRmdGjSxxZsr67I6mGJurg
         CkHu/RFAcwWQTqRLOGKrgWLs7xRagXjwcC1e59iklPjPc1r1scCJBMeGpe8dNBPpKmwM
         LIZnUClezAqjMJN733mcQ2fj53cI+aDJMhH7jrj0DR4pmE9+sJkJzrq7UUA398MZ0XUm
         nvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128778; x=1790733578;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUjXO0uskRHAPb0FNYBwdm7PFr+ea41NeGJqQkShqkw=;
        b=0kZql8OJoxGiU7qWpjpYoehxM+kWHt47M79ERQc5WxItLwQn6EZnD+njUqBGO49a4F
         62XPa0+oMjK5qAaoE4Itec8KK6q0UBStC8Qdzr39RsKeUddtiDYbp6nzjvmkRhAo6YMh
         gaSe319wAReO3+M65pj6z9CMwcN0DX7+gogrPgb2o8eNkiILxMOB5f3pQnK27CkM0+70
         0JAGIoHGA0gakfUPVvubrw9ueXmuMYKF0ZMRB1YUIXJ5Bok+3kov62rgtF5LTnOzmW5M
         pHpSF4nnYiuYel/rEZDMBS4iRLFyW9SduEIc1AscrhcIVVckm0CuLbu9rs064fO1uK3z
         6IkA==
X-Forwarded-Encrypted: i=1; AKwUvBzaAw5JP6W/E6LPxETHUXbXiQtAZZESAXIkCuIs58bE2SgxaYZnYOcDi4GT2YrZIucS4YZ5gLWCpkeXETQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kSw01Ip0ZCLZqSdXfftIGTUDm4UaossNsxXG3FONzXVSUXAQDW
	if/h258fQ9V+/h1NdSb1k5Z4YUDAieCz0q1V9F2vqb+WHMH2lYNxNEgcoWlUfbyUS+Y=
X-Gm-Gg: AYBFou34uQHvRLoX3+yKSxPBQ/GM+m3t+XXnio7RegQo209NlseWtvCC20g5TILtsTK
	tcQeX60WKTI3oAL0bx9gkmFa9tTDxrwrvrOmxnB+nmRsJ9NZdYu9vg45VwEMxLrUDC1e46IejLf
	wTQWGCcg9IdgMOYaiae0YS250+sXpKtxGFOzgVc2025uBe8xXapUmgU+xtK6/MwPmVkypUJz11y
	Fa37vvTlkm6msK89K+GKsyd/d/mfos1gHl3iVFRMMOLK33mE5/P9jKhL9CqukYYomSM0PCDTnWV
	87FLruzJKGs2ywS4EcrcRjg+G4eoDOd4u0J8bNURdsrlqlaOkRetI7EMixxVb29zZJKTE4EXwkp
	kcKXFv0nXQMALhJSM2AuwKFsHYlls9p5zxtBp0zCB8lNimrjFfv9Aq1yLsACpqVSYdPyM0YKEBW
	E8z2625UEGckAOu9tMbIDsYtdxo2bGJuIzPavds2tvZvDpEOMDiexNGjZe2MjPEIHGodbuL1ZLv
	M51m1wNQyMhpFC1M4yfb8Xck4VF84YHDopqNiOs9Dr/8ZBwb4EUjpZhhLAk/fGo9w==
X-Received: by 2002:a05:620a:3941:b0:939:6df7:73f1 with SMTP id af79cd13be357-93c251dd03fmr205767185a.51.1790128777754;
        Tue, 22 Sep 2026 18:59:37 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c45d3a7sm10691616d6.37.2026.09.22.18.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:59:37 -0700 (PDT)
Date: Tue, 22 Sep 2026 21:59:35 -0400
From: Gregory Price <gourry@gourry.net>
To: Lance Yang <lance.yang@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com, 
	brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com, david@kernel.org, 
	ljs@kernel.org, liam@infradead.org, rppt@kernel.org, 
	baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, usama.arif@linux.dev, kas@kernel.org, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com
Subject: Re: [PATCH] mm/page_alloc: let the bulk and folio allocators carry
 alloc_flags
Message-ID: <arMxm4ia5Md-Zt4R@gourry-fedora-PF4VCD3F>
References: <20260914155115.439742-1-gourry@gourry.net>
 <20260922130558.48402-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922130558.48402-1-lance.yang@linux.dev>

On Tue, Sep 22, 2026 at 09:05:58PM +0800, Lance Yang wrote:
> 
> On Mon, Sep 14, 2026 at 11:51:14AM -0400, Gregory Price wrote:
> >__alloc_pages_noprof() takes an explicit alloc_flags, but the bulk and
> >folio entry points do not, so callers cannot select allocator behaviour
> >(e.g. an alternate zonelist) through them.
> >
> >Thread alloc_flags through both, matching __alloc_pages_noprof(), and
> >keep the flag-carrying primitives mm-internal (page_alloc.h) so the
> >public gfp.h wrappers stay flag-free:
> >
> > - add __alloc_pages_bulk_noprof(gfp, ..., alloc_flags) in page_alloc.h
> >   alloc_pages_bulk_noprof() becomes a wrapper passing ALLOC_DEFAULT
> >
> > - give __folio_alloc_noprof() an alloc_flags parameter and moves
> >   __folio_alloc_node_noprof() moves into page_alloc.h
> >   __folio_alloc_noprof() is no longer exported
> >
> >No functional change: every caller passes ALLOC_DEFAULT.
> 
> Yeah, but what if a caller passes ALLOC_NOLOCK in the future?
> 
> __alloc_pages_noprof() checks alloc_nolock_allowed() first, but
> __alloc_pages_bulk_noprof() can enter its fast path without that check.
> 
> That fast path can reach _deferred_grow_zone() or pcp_spin_trylock().
> Shouldn't we do the same check first?
> 
> Or am I missing something?
> 
> Cheers, Lance

There is some concern around NOLOCK here yes, in fact sashiko picked
this issue up and I've been poking at it.

I've actually been reworking this patch and pulled in changes from the
ALLOC_UNMAPPED series to address this all at once.  I've been developing
a page allocator unit-testing harness to help validate some assumptions
before I post it.

~Gregory
