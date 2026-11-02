Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622332;
	b=1G2BYAB95dmg0D1dUSZ5FsuEz22yKhvUWJWC5Exde5bqRTyqy9U3ju1cNr9f7Y/qdHi3
	 17oZcqd+bgq9Bzfozv3EB9M8tQ3XYuDV6nQ29GGNle93E22qSO0qZJnrO9mjHI89PxmN+
	 ahMm1nj/uP7X5nS1lp1YPzBvP8jFBP7dnge2Bnc1bfennAqHo6tLzSRb7FQ8lJAgc/y90
	 0wml1rmClBh7/BIfjj651mEPFQQDmq6myVddC6K8Ks5AKDpWKHp502t0w3GeAhjO3KiqO
	 JxpoeOR7mEyNfxxkOf1FZaWmkPBXxhedy/socmqZFv8HducoAVLRYODylUwUreZLGOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=l+OOSIpi3LwKea2AwltHwR3lhfsf+u1HzeM7nFR6cqc=;
	b=VIpwHq/5vUWowJt60gI2eDAxu9swrBIOgfZUOA0UoGWysN7aWnKF6Rrws6hgflAW48KO
	 7uwpPL3gGetZClqBW9GlNPqnuB31nWIsgGnKG/2TbqRtV0xhyur4r34hRaZj86DvOAYjH
	 mweP1iIAACetVgMmhFV70xhERRzoEmnAD+ezND8YVR0ZLfQEU/zgJqkdozEz9O8qbV6Bi
	 h3ekuMZIKw7NJ6P1XnHI32V1KEFEU56JFhWGutePR6H4v4lU+/uJ7q+Rs2C8CWP50ehnc
	 58PyoS1JT2aAjBKLvpjjoZiZZuw66CYF6BJ/byaNFbF7VL11vLDiT1rz4uZHYbOQ/eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PuCeI0jZ;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D942C606D246
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D942C606D246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PuCeI0jZ
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso20300865e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793622330; x=1794227130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+OOSIpi3LwKea2AwltHwR3lhfsf+u1HzeM7nFR6cqc=;
        b=PuCeI0jZK0lQiDZt5w8ZHi0ppbv7HAFs5/Ugm9eIrzlz2iBz5H+IjJ7W8UjykMzbr2
         debOurqyLky/eSck+BHDIQW5OML2S/KRdzyxejPlvbKSFOBfzZTCL7FrCwXbXTliZxsh
         DoCQEQxq/WElopc7/Uh97bl4tLMKgI3pA/ew1gjRJLJ2FUfIBjeLwVmWr+l1eUts2gJO
         /G6rvyiUrid0BSqZHfEbwnWoGJ5Q2zXmiwCUxejZbkMSGVYpFb2l2czFKf4EgmCQFxki
         GDB5RpJpype+S9RFD++iVB8zl4IvxYTu/M9LQMaC+bMCnZkk4PsMZEtxhsTSiQ0G5jB8
         LnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622330; x=1794227130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+OOSIpi3LwKea2AwltHwR3lhfsf+u1HzeM7nFR6cqc=;
        b=Bssry1PuCpmHr17pa8VpLGXeNsGxOVK+8ZaYpMBEwkthJSLlV9zG8dVZHoS8mhvlxe
         HCn/0lXDlpnlLujEkSrLd/1bzxHtRhs1DpNxFqjxH21Aaqcl1vnKP8ykMYNiZ9uhiZvj
         bC75oBntoTJVpynaXluGc66LUMgq1IFOvdSU8poIjACiD4Ia/UhN5XCCqyFvNHGCoNsb
         QBtWYm9DUJ6bdZN94XLwEJlMs6/hHsB1AAlVRZHwI7JO0pSfo5kIDh3BB666ZxIIpvxq
         dSLUHHMlXtGhIs050OtYervxVrhmJVFRLFAzJjmPTJPorkRs5GYQCxCltvVJIwKA8gtK
         yiKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmEjVTmV3LTwYji+YxTuhyqkLmXC2neY6QGTjR+wFtCN5wDBcaMq0Se7433xhvetLHyHSs0zAu+GtGHe8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wmdK7hMRVgsKr7Vd7GfOOtt3c9qJQpvzGSnbFOKm1RPLVlydQ
	iHfS1opWtWiXp1D/gda8sVwpQQaup0BxeICHHjo0Tu1hs8d6btxc9nDBUv3HEfSfwbc=
X-Gm-Gg: AYBFou1JOd7idrEhG2ch/4ONU6Z8XSMgPCnd1GrvH6tYnJs0N4nw1fhEg/XHUCmdhvq
	Tvzx7kZ6lzCHnHPXfLYERv+c7Lew/02/QtzGp65ZmAAQ9HWSfKwTU2w+eLgR3iG6hox7SUms1bX
	aYGTp+BkMjsVoLld6phnPN4vmOJ2vFBb2wyzXr15Wp4MOXgwMoYgcDjX/KE3dwJ1eMiY4NxnWWI
	Lim+1vGTDvNhj1nDLFjOwojoNGPNo9mWt+LygmK4aGmpHqdGzGTITjeKguP6QiYB0YtiCvzG44a
	GrRNoXVxCNRFFr0ri4yJWOimuvzZ/XTt+JljxUvws9zIE8hZA1wYjw5aWcyFGLg+n1G4squw9G4
	qfvw62IVOB9KQwKPBslKO3q+dUeUBPEYnehjZGGIZ3kqZ1qxiSWYIPKrUFCxKSSoh24R1yiNili
	2+Z6gXCznbGmbEnOZo1whcnjiMTL5zfAqo0s40A2F5npW84iodpFRSxFkjdm4kfRcES1wlsdESP
	pnayCwk3DDdtQL7PMTAs8uOjcJrwXOJ34y46AoHc5URzw44kJJbaCXO+kotpC6zx2VQ+GU4GDhh
	UlWsIGTykIBwojFu9Oa5BgHCzRGu0EFsKPEugGOR84ZGjOWNT1Nd41gyrg1g
X-Received: by 2002:a05:600c:3554:b0:4a1:f7f4:7cf2 with SMTP id 5b1f17b1804b1-4ac1737c474mr214634185e9.17.1793622330354;
        Mon, 02 Nov 2026 04:25:30 -0800 (PST)
Received: from localhost (109-81-32-81.rct.o2.cz. [109.81.32.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm371193245e9.13.2026.11.02.04.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:25:29 -0800 (PST)
Date: Mon, 2 Nov 2026 13:25:28 +0100
From: Michal Hocko <mhocko@suse.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>, Tejun Heo <tj@kernel.org>,
	Michal Koutny <mkoutny@suse.com>,
	Oscar Salvador <osalvador@suse.de>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v7 0/5] mm/page_counter: move stock from mem_cgroup to
 page_counter
Message-ID: <auiBOBfRIiup8Aob@tiehlicka>
References: <at8XfoqWwe9HSL9y@tiehlicka>
 <20261026155937.1235453-1-joshua.hahnjy@gmail.com>
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
In-Reply-To: <20261026155937.1235453-1-joshua.hahnjy@gmail.com>

On Mon 26-10-26 08:59:37, Joshua Hahn wrote:
> On Mon, 26 Oct 2026 10:03:58 +0100 Michal Hocko <mhocko@suse.com> wrote:
> 
> > [Sorry for coming to this really late]
> 
> Hi Michal, no worries at all : -) Thanks for taking a look!
> 
> > On Wed 21-10-26 15:55:09, Joshua Hahn wrote:
> > > v6 --> v7
> > > =========
> > > - Preserve two cgroup v1 proprerties that previously followed implicitly
> > >   from sharing a stock:
> > >   - memory.usage_in_bytes <= memory.memsw.usage_in_bytes
> > >   - Reclaim does not swap when memory and memsw have equal limits.
> > > - Wordsmithing commit messages for 4/5 and 5/5 to document the
> > >   cgroupv1 divergence (bounded) between memory and memsw caused by
> > >   independent stock.
> > > 
> > > INTRODUCTION
> > > ============
> > > Memcg keeps a per-CPU stock of precharged pages so that small, frequent
> > > allocations do not walk the page_counter hierarchy every time.
> > > Today, the stock implementation is within memcontrol code, even though
> > > the operation it caches is a page_counter charge. This makes it
> > > difficult to add new page_counters to a memcg and preserve the fast
> > > path behavior.
> > > 
> > > This matters for future work like my tiered memcg limits series [1]
> > > which introduces multiple new page_counters to memcg. Without making
> > > stock a page_counter-level property, it means that every memcg charge
> > > now goes through multiple page_counter hierarchy walks, instead of
> > > being able to cache these charges.
> > > 
> > > To make future page_counters scalable and performant, move stock from
> > > mem_cgroup to page_counter so that each page_counter can opt into its
> > > own per-CPU cache of pre-charged pages.
> > 
> > What does it mean that each counter can opt into its own per-cpu
> > caching?
> 
> So right now for cgroupv2, there's kind of a 1-1 mapping between
> page_counter and memcg. I say "kind of" because there still is a
> page_counter for swap, but it takes a completely different charging
> path (i.e. not try_charge_memcg).
> 
> This means that currently stocking charge for memcg is equivalent to
> stocking charge for the memcg->memory page_counter.

correct

> However, one of the series that I'm currently working on [1] adds new
> page_counters to struct memcg to track the usage of memory
> per-memcg, per-tier. The goal is to (1) track how much memory of a
> cgroup lives on which tier, and (2) to limit the usage so that a single
> cgroup doesn't use up all the fast tier memory alone, and shares it
> fairly with all the other cgroups on the host.

Right. I guess you have layed down your motivation quite well in your
original cover letter.

> When adding a new per-tier page_counter to struct mem_cgroup that gets
> charged for every memcg_charge, I cannot use the stock fastpath since
> the stock does not distinguish where the memory resides. It would
> essentialy boil down to this pattern:
> 
> try_charge_memcg
>    \__ page_couner_try_charge(memcg->tier[0])
>    \__ consume_stock()
> 
> Where every path still has to do a hierarchy charge to the tier it's
> charging to, whereas this patch gets us:
> 
> try_charge_memcg
>    \__ page_counter_try_charge(memcg->tier[0])
>           \__ consume_stock(memcg->tier[0])
>    \__ page_countertry_charge(memcg->memory)
>           \__ consume_stock(memcg->memory)
> 
> So that we can avoid the hierarchy walk for most charges.
> 
> I'd be happy to submit a new cover letter which better explains this
> idea!

I guess I still do not understand what you mean by opting-in to the
caching. I believe you should focus less about what you plan to do and
rather explain what _this_ patchset achieves and how it works.
Also focus on describing why do we need to keep caches on all layers of
the hierarchy.

> > > We get an added benefit of simplifying try_charge_memcg(), which now
> > > has all the stock management handled transparently within the
> > > page_counter layer.
> > 
> > This is quite a large change and I believe it will be really benefitial
> > to have some high level design overview in the cover rather than trying to
> > chase it in respective patches.
> 
> Sounds good with me. I can add the call traces above which should
> explain my thought process a bit more. Hopefully the problem I am
> trying to solve is evident there.

I believe I follow where you are heading. I am not sure this is the
right path but that is a separate discussion. I would focus on whether
moving cache to the counter makes sense on its own (without that future
work) at this stage. Quite honestly I am still not convinced this move
is the right thing but I would like to fully understand the mechanics
first. Having discrepancies among different counters just sounds like a
potential source of future problems.

-- 
Michal Hocko
SUSE Labs
