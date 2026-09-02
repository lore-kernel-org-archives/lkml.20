Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B0F4AA1C4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374283; cv=none; b=LKQJZg7YFZE3PpqEl3za3MSH/jWyv/u6H6NcFJbvqm705uxfxG1aEjptJmHoTzPtpkPk4CdF4oRv3GL2HO8Kl8Yxm5VY2TaKA30BD1PH4r8nzski6G8TINNoQ5CZVjjedA+qNN2ouI6WYFQ/4KQrS0KNDmMXO8fyl4yhF9zJiaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374283; c=relaxed/simple;
	bh=Ok0ICnT7GDwLfN1nwl9e6VZBIdy3xi8AzAbFnQGhTuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgLDvEWZqlMj1I86qtOVvdKgEG1UIxKtYBvUImEvJfIyhYAuvW0pfqvvfDKzs7Ia/9FxuoFAnj6oPRNFccjgFNcKuJpvFesj7BOPRNR+uBUkEKAhg33uNQhncOId19L4rZF/+xsiHfWN1IwTCloM4lOehlKESGdg2iFAkPTCcWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=WjJn9qbC; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="WjJn9qbC"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66c744a00edso1423363d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788374278; x=1788979078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GVn0LX9ImSUgjtR/GVkbTBYzReYbgIL/PfeqeDfhMoE=;
        b=WjJn9qbCAELoo6ggK7vV2hx7RVC46aM6GSy+Ud7Xx8itfopz5GXH/SpRNeTwnwpf4f
         B1Exan2Jl0pCrp5rCpa/3uv+yWr3EbTjhGKpS8ua/tlRVAsHm//EKgAT805a9Q239udb
         OrktSDqzOniMIr3YLmVzKzeWzalVGsyVbW/F1CVP0EI+4Ju7k0NULKqkNR67hUhFbJRk
         VY1tTLzUDTQ6g9OwFOkPOecwjchsDTTwy/x7d/KLxFBK0d+3PWIYI9WUJlj+T+NzbZ4f
         asWnoBbj6l3Y+QuZlaYlImMmQLR1RU61Cy5VEcPeCVWiWc0F64vcs+ebHd7rFaGvj1T+
         QY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788374278; x=1788979078;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVn0LX9ImSUgjtR/GVkbTBYzReYbgIL/PfeqeDfhMoE=;
        b=atUsdZD97WJbj8jRGotwlAHsmCM1QmudXSlLks7TlTvc0WnwDJplGxdzWL2vvSJSH0
         R1btM05INoeMgudhdWmvAdlRYb2SJJakSVWyX7Z4Zp1fyDtYJ58ELFWlC1VGltUfHhs0
         vkHg1TCM8zyUv3RJClhNRB/SFW7UFjE6Uw2/ZicT3NBDJsK1s/8iFpdJ0FaTuWYjxh2t
         K/rnBuxNXg9gTyGfsVfQhQO/ONvbD6SBga0ZjA/mJ7tdEGQ4a+TDG46YGaE2Anmjc9mj
         jk0lJ283hiJ8Ei1am24mFCpARycKJfAkvwys/dSYOdeu8EkyJHdrwgCyAuf39XZ3wiO/
         Ckrg==
X-Forwarded-Encrypted: i=1; AKwUvBxYOI4cgmQ1/F/c7OcmyhNltKF8m6vGFOgoTnMrTjtuNN9hk6Kl6a9Fhc6NzShiF40L+OwEinJvWoocT+M=@vger.kernel.org
X-Gm-Message-State: AFuF++nUi5Loyuy3w6abu1nsrRXRZZvvSv7iZy7e59jiN9zBQP4F7maw
	5fcRK9nBXAhxL++GTaUz5bfxNL35NzDAiNtpBlfZlv16mQdBqX6L5+j9jp9HBo07w9Q=
X-Gm-Gg: AYBFou1UTdjqIlmPaYHOccr9ciBJvcFqNXhE4SAyyvQyPXUIv6uMp9Uzb/WbFp8HFyb
	n77t3/fxT5rDuT3TkyxeeeNXwJhdV09+AjnAikYH/wOQxBVLBuy40NFs8kuyQT+52C/lBA7UdyD
	3OQXfBADccu0NvwxGO1jqrVvPCKeL9OufOooJGIUsckoEJ5THdVmrIB329pAt7Jc0nqvsB+uXZr
	R9ZE3Cqczv6itxnl8SeoxdbKS0gdJbmfM/R00CclAU1JMRB9uZl876xx3r87DBfPR10qXiUeSCy
	/zFL7jQo6n9Nlpdx8lvmY0nqBQc/WxIAW0VVEEDMe4ZB+lPA0PWJG4H1flW2k1Tgn8SpJ87I39N
	HMiKvq3sJYPIeNMigLJQzag0Vkt24A2CoPWS4G5Uzu8Bec4JRjS/zQchl+eHB56SRNqXBoXRQ7j
	6HxYAiw6474PJ8kSpO6HO6SfUip21DSoa9DDSgPAuh3ofXomXDUYJSjBjGZkk7
X-Received: by 2002:a05:690e:4388:b0:66c:effb:3706 with SMTP id 956f58d0204a3-66fa14e8167mr1271604d50.38.1788374277367;
        Wed, 02 Sep 2026 11:37:57 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c10c94648sm24094157b3.10.2026.09.02.11.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:37:56 -0700 (PDT)
Date: Wed, 2 Sep 2026 14:37:52 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nimrod Oren <noren@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <20260902183752.GP3004@cmpxchg.org>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <20260902162323.GO3004@cmpxchg.org>
 <aphS2TancJAZLND7@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aphS2TancJAZLND7@gremlin>

On Wed, Sep 02, 2026 at 06:00:55PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Wed, Sep 02, 2026 at 12:23:23PM -0400, Johannes Weiner wrote:
> > Just to summarize my take from the subthread with Zi: the premise of
> > this patch is to roll the regression dice on every THP setup out there
> > because certain ARM configurations result in a questionable pageblock size.
> >
> > I'm not against carefully evaluating and testing out today's need for
> > set_recommended_min_free_kbytes() in real world examples. But this is
> > not that.
> >
> > Nacked-by: Johannes Weiner <hannes@cmpxchg.org>
> 
> Well you don't have to listen to me any more as ex-THP M ;) but my 2
> pence...

I'll always listen to you, Lorenzo. <3

> Isn't every possible change to address this kind of issue subject to
> exactly the same kind of constraint?
> 
> I'd like to know what not rolling that dice looks like :) or what
> constitutes 'careful evaluation'.

Usama gave some great examples in his other email. I'm not really
arguing to keep things out of tradition. But I think it's fair to say
let's at least test the common 4k/2M THP setups under memory pressure
before and after the change. Or be more specific about which changes
obviated the additional pageblock reserves, and how.

> It feels like in certain areas we paint ourselves into a corner where
> everybody's too scared to change anything until we're sure nobody in the
> world is broken*.

I'm fine with calculated risks, actually. A bit more surprised that
Michal was so readily on board with this :)

> And so we continue to ride the merry-go-round of proposals/rejections
> indefinitely.
> 
> All the while regressions in tip kernel are a regular occurrence (yes we
> don't want that, but they happen), and they are resolved as they arise.
> 
> I wonder if we aren't limiting ourselves by thinking this way.
> 
> Michal's proposal was that the original code was written _long_ before
> improvements in the compaction algorithm and fails to account for those.
> 
> It seems odd to retain the same constraints given the rest of the kernel
> has changed.

That's a great motivation to take a closer look at whether we still
need it. I'm not attached to anything that's plausibly shown to be
unnecessary.

But I think there are levels of argument quality:

1. This code is old as in time
2. This code is old as in the surroundings have changed
3. This code is not needed due to sha1, sha2, sha3 supplanting it thusly: ...
4. This code is not making a difference in represenative tests

The patch is at 2 and I would really prefer we get to 3 or 4. That's
not the same as saying we should stop making changes.

And honestly, while we tend to claim we want 4 for everything, we're
happy many times to roll the dice at 3 - iff the story is specific and
plausible. And I believe that touches on your footnote ;)

But let's talk about plausible. Because I'm reading what
set_recommended_min_free_kbytes() does, along with its comments, and
can't help but think that this still applies in the current world.

The compaction aid is/was always incidental. Yeah it would suck if
that is/was (still) an implicit dependency, but ridding us of that
could be a more deeper-reaching change than you would want to make to
fix that pressing reserves issue with 64k pages.

The fallback avoidance reasoning OTOH still seems cogent to me. The
mechanism it references is about passive fragmentation avoidance by
giving the allocator placement options, before compaction gets
involved. That makes sense in how I understand page_alloc.c today.

> Perhaps a compromise would be to put the ability to disable this behind a
> config option or maybe a kernel arg? Of course that becomes something of a
> uAPI... but at least it gives the option to constrian this for those who
> want it.

I can't force you to engage with the idea of capping the pageblock
instead. But I'm still kind of dying to know what the reluctance is ;)
And I apologize if I missed any prior arguments on this specifically.
