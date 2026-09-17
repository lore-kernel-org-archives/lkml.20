Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB694E06D6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653003; cv=none; b=UcVOE0+L2+K1XA0hcMoBNYgKBxrPTMH2OiviFN85raHwboeDyP978z/uqseYJxZ26chNLCavf+CpGsIqwnYOGnbVjWMAe/EsaOJO1Sp//Uz3tBGPqgV40Z2QuFlan7YBAjLd0KkwnEBF/TCiiz3L0DY1WrrrJ5MfliBjCYzQNyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653003; c=relaxed/simple;
	bh=8lFICmfqJojG+kgOE2npvaipvOhxVqiPlB0ak/ZpJjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+WhAjFWUBvYR9x2Crz41xlfWfGjxtjBpLbXB0V1vmVWzRzRk+Adi3ELrkl1BDQ4V8H0pvm5NhQItxWMMl7aclocFFBMdhfQ/X1k9+Qsjpw/fvbGfP6yIJMMv3/jLeAsX++HzzFZ2G4CpRAcg16MTBWpv8YK6LaqYUk+mnMsJNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=FnRRCeZl; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="FnRRCeZl"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cc46c7so58132785a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1789652996; x=1790257796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XRIStKi2LZ8v+jiCS8rV0NQyhsz0Xqewo2THt2Su17w=;
        b=FnRRCeZla3ACAuBrd3KBcDdgSJt1Dxjs97QMFBq8mz17NvgajtNsbo3J+9MWpygz5B
         PCbeCdbYyo/Ya403AYTIfpQw5nhbOY6uCKoymzSTMnpd5oofzpre8rf8R6mM9W8erWB6
         HbUFBfw/aDs179TvNrwRm2LN7Y5lqshJSnaI925M3SszpMuJyLgLxZSc8jHUwqE+Bbbn
         yy+RgB2oHgoIdJ/jDudJ95vkZNLaz7TVp3W6pyT8+D4E/S5eB/RiQ/1nPnxEpxpPDSnx
         fjlIVdlsKBJ508UcG3xZjaaKHFn+RypERGXF/9R95+sbDQEujWGki4VZjTstJcK7tNjD
         fWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789652996; x=1790257796;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRIStKi2LZ8v+jiCS8rV0NQyhsz0Xqewo2THt2Su17w=;
        b=mu1J9bHE6jfmt+VwN947jmCJDzrFhc0PqaLcjv1LJ0QlnTog5goWUsx9/iL9kxHUt3
         5DQGcfl9l7LH4aC9ZDKxQ11xt1Z7t4GtNGyCd6CPjs6jLv22Y7OvTjjQ5NLgqSlY5/Dj
         xChggxE/3N1gzC73oW/8R1n+V7f7dwSwFR4pQeAKSdjkoE/ucRec2b5WuYTgKMl5uf2F
         4FWTk3569Y6T/FLp156x78g2mEaIRQPVSfoQL02udC3L1MHNZgfqjvflI+EVHtgh+Jrh
         h45tnRUsUPeyBT1bI9jO/EHdcZir1+NswIcIvHU+zKNH1gIM2iXVAo64897VxlZ4oWWv
         tFtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsvLMiMKMxwbqUvBmbLEcDqOyGORhQdgAiPvG81XEO1cvJk2faOsSLJwUfL3rYoWs4t416erIL0YUF6oA=@vger.kernel.org
X-Gm-Message-State: AFuF++kCfX0fbZ3HnaNizx2c6BCOAIOSoMQQZKRy7z9QOXt7pdHAhdoe
	kId5wlX6Y3HOXBiEW/u621kjoBnJaVbM/N/GRYU3oHsmPqYCAA/wBRhmeuIaeEZ9lXU=
X-Gm-Gg: AYBFou3w+SAB+kZ4ZWsWkbDcipvCJLNyyYxmUCbLwNSFMUD/exabh1w4rx8j6lA8EAR
	NJYcPDk6rhRk3Lz8GWA8dvp8KvEogs8c2lurSA0ng8ssfJBZJt+BEoPt+EOvFeLXJGMc1JYuyWD
	/SxmHWso1rgMc1uX1A/b2g9H7upfYijB4639wWr+4sQ0/F031GO41etfFsirmzEMhknO1x66SwO
	cJZyog2iCuPD7yhe3nXN4WOR54Gj6qVGnkTZeBdO3o3emxEJE9HTno/FFS5yb6RFcSXfdIergX9
	REujw0Q6qPLfRWbK9yuSx2zr0+gPqKSfpLJAxUCEBYEf9Ydhh21DKummir2ASrVgNxNt6hjHN4/
	jmmJ3MxHcIURFi8Ll5jdefcO4iIw/hZKhk/CQKpRzRM9u65t1vv5lXQ42aHp4MYgVsIcbFTQzGL
	6uUn1DNm+s0cGJYu8TDvm1lzma4pf2OjJq24CQYfPNL7RTQ63l9jbBcCKUYv9hat1s1v73HZx7w
	IV7cjAFOg==
X-Received: by 2002:a05:620a:6489:b0:939:6c96:af6c with SMTP id af79cd13be357-93bb76dd1demr1109294885a.7.1789652995812;
        Thu, 17 Sep 2026 06:49:55 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:1f35:22b6:fe30:2a34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81cf2568sm451922085a.36.2026.09.17.06.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:49:54 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:49:49 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Nimrod Oren <noren@nvidia.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
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
Message-ID: <20260917134949.GB1344@cmpxchg.org>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <20260902162323.GO3004@cmpxchg.org>
 <aphS2TancJAZLND7@gremlin>
 <20260902183752.GP3004@cmpxchg.org>
 <a1f19a59-7dd5-4fb1-b5db-3efee8d249e7@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1f19a59-7dd5-4fb1-b5db-3efee8d249e7@nvidia.com>

On Thu, Sep 17, 2026 at 01:19:12PM +0300, Nimrod Oren wrote:
> On 02/09/2026 21:37, Johannes Weiner wrote:
> > On Wed, Sep 02, 2026 at 06:00:55PM +0100, Lorenzo Stoakes (ARM) wrote:
> >> On Wed, Sep 02, 2026 at 12:23:23PM -0400, Johannes Weiner wrote:
> >>> I'm not against carefully evaluating and testing out today's need for
> >>> set_recommended_min_free_kbytes() in real world examples. But this is
> >>> not that.
> >>>
> >>> Nacked-by: Johannes Weiner <hannes@cmpxchg.org>
> >>
> >> Isn't every possible change to address this kind of issue subject to
> >> exactly the same kind of constraint?
> >>
> >> I'd like to know what not rolling that dice looks like :) or what
> >> constitutes 'careful evaluation'.
> > 
> > Usama gave some great examples in his other email. I'm not really
> > arguing to keep things out of tradition. But I think it's fair to say
> > let's at least test the common 4k/2M THP setups under memory pressure
> > before and after the change.
> 
> Hi,
> 
> I tested this on an x86-64 (4K/2M) virtual machine with one NUMA node
> and 16 GiB online memory, using mmtests config-workload-thpchallenge-fio
> with THPCHALLENGE_MADV_HUGEPAGE=yes.
> min_free_kbytes was 16 MiB patched and 66 MiB unpatched.
> 
> I ran each kernel 30 times, rebooting before each run. The results did
> not show a regression in THP fault success rate or latency:
> 
> Average THP fault success (Percentage Faults Huge) increased from
> 13.07% unpatched to 13.34% patched, and average fault latency
> (Fault Latencies) decreased by 6.5%.
> 
> In contrast, compaction metrics were higher on average with the patch:
> 
>   Compaction stalls:          1,635 -> 1,713        (+4.7%)
>   Compaction failures:        1,350 -> 1,416        (+4.9%)
>   Compaction migrate scanned: 4,812,254 -> 5,587,587 (+16.1%)

A 2% increase in THP success bought with a 16.1% increase in
compaction work looks like a sizable efficiency regression.

A scan efficiency drop is in line with expectations of what happens
when non-frag placement reserves are taken from the allocator. A
comparison of trace_mm_page_alloc_extfrag rates could be instructive.

Why the 2% success boost isn't quite clear to me. Allocation latency
improving suggests the extra work is primarily picked up by background
compaction. Reduced reserves could be making proactive compaction more
aggressive. But the improvement is unlikely to hold once you run out
of idle CPUs and the additional compaction work actually eats into the
workload. It could be useful to look closer at who is doing the extra
work and based on what triggers.
