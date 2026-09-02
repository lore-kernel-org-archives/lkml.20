Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43984B1B2D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368465; cv=none; b=AMDH0iYM77ivdRkcZDOlyysIqkIqsTBPOnt2EhMja1h39RBkJYB/l4m7Ee0OBXlb1xOLYxb6OyCf34IGSE/hYat9UFSOquS4cjxpo2QjdHnRacKjUhkbLL2nWYB6VKREaSJoF3zYUIUJhmRxpFtsjJtmCvHx0SeL4djfsoyoQI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368465; c=relaxed/simple;
	bh=REz7hmB4Ijo/+yZ5Thr22+MHsTgzpM0b+E1MV7iMpaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZHuoHLbT9UfulklJm5eGg8Q0ICcRozi6Sd0qXfjBYYoGOIAbBR1+gw3Fgmm11TmZO3wCKdyF77eVEEc5V1w/WOKJrP3V2T1G6tMshOKrtgIqvGqfj6snanZP6/H8SOPQ+wKlFjFQAIRRwelW03iIQwlrkPBns17S+FcG6k35jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byKryE9L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byKryE9L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AC21F00A3A;
	Wed,  2 Sep 2026 17:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788368463;
	bh=21zjI9Xcw32ih4YadF8IlNWvz6bQgsRvY/kqV5dVaMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=byKryE9Lv5s3K+JQGJImtjfD0byGnvsScT87swdhpJeCwEPWHG+owbO+qreV2oMQq
	 4StXz9oJXoTMiM0g2daA4nVTRZFaC+1gJ6a2ZRFb7amP30a7Ta2uBGTqXK11tujQgn
	 whuBbEpxT+A22/Tvbics4ozFKBw28z0t7Cd4mQ6cbq+fzpMhPl87TpLFzQV4CFkKut
	 URsVju/ZM4vZyGFjLu4YRxSeyA2deg6ZSakhk+aKZ/QMiVsaEZVZbQAczjFaUExjNa
	 NTqepT8RK/JQeDTHQyqksTP5r4jCOmmTiyGYdcJEcnSJwLJSyASUCg7/BTS0m65g+r
	 f+cXQcDlwN4Pw==
Date: Wed, 2 Sep 2026 18:00:55 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Nimrod Oren <noren@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <aphS2TancJAZLND7@gremlin>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <20260902162323.GO3004@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902162323.GO3004@cmpxchg.org>

On Wed, Sep 02, 2026 at 12:23:23PM -0400, Johannes Weiner wrote:
> Just to summarize my take from the subthread with Zi: the premise of
> this patch is to roll the regression dice on every THP setup out there
> because certain ARM configurations result in a questionable pageblock size.
>
> I'm not against carefully evaluating and testing out today's need for
> set_recommended_min_free_kbytes() in real world examples. But this is
> not that.
>
> Nacked-by: Johannes Weiner <hannes@cmpxchg.org>

Well you don't have to listen to me any more as ex-THP M ;) but my 2
pence...

Isn't every possible change to address this kind of issue subject to
exactly the same kind of constraint?

I'd like to know what not rolling that dice looks like :) or what
constitutes 'careful evaluation'.

It feels like in certain areas we paint ourselves into a corner where
everybody's too scared to change anything until we're sure nobody in the
world is broken*.

And so we continue to ride the merry-go-round of proposals/rejections
indefinitely.

All the while regressions in tip kernel are a regular occurrence (yes we
don't want that, but they happen), and they are resolved as they arise.

I wonder if we aren't limiting ourselves by thinking this way.

Michal's proposal was that the original code was written _long_ before
improvements in the compaction algorithm and fails to account for those.

It seems odd to retain the same constraints given the rest of the kernel
has changed.

Perhaps a compromise would be to put the ability to disable this behind a
config option or maybe a kernel arg? Of course that becomes something of a
uAPI... but at least it gives the option to constrian this for those who
want it.

--
Cheers, Lorenzo

* I think, for instance, about how the hell we can test changes to the
  compaction algorithm in a way that's sane and acceptable to people?

  Though that is something that really _does_ need it, as it's vastly more
  complicated and impactful than the proposed change here.

  I'm not sure what the answer is really :) ideally we'd have some vast
  farm of machines doing representative workloads with software that does
  careful statistically-signficant analysis of how they perform, but that
  seems rather like a pipe dream.
