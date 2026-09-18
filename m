Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC6548AE24
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789757403; cv=none; b=ISsi49EMpH4t0lu2/mwLr5Rv7v0L49yi6tDgANgihsYs4X0aU+o9VxZpUMKESPKIOxmTgxASiSFj+Hf9+v1mDwG4qyj7Ybq25ia9nc1AoPjQkaF6IvILMgprGzygJgFFU2Fgo7izHNsEltNVQvGg1XdIL03BGjR6OKGHmGX2SBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789757403; c=relaxed/simple;
	bh=9oC39/JappGs0sqzr06Vb/T9nRG9qxulTyMwkYPuvjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KVnV7ecIvnEFEsgPW4nHDnA2BPd4kK4nfKRCymFGgA7BUF6QlhOp1HwsBHSFucwdfkBP13Y4FInoFmigs3K86OswrXjjX8ivsC9vTzUZDiNhYHy7IJr1YFuImQY/00w002PEbv/yJ0bj3F+cSxAIkptp0ZmacYAEc1dBZ0jSR8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pR6TXwrp; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pR6TXwrp"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a2ffee6so468737b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789757390; x=1790362190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Ph6ZaVxaO7CXgv08gaPlk+fBtFgV6Zs+sxg/G7AO88=;
        b=pR6TXwrpMEITHw2br1BoaGrggsW7bp1HhgIFVbGpV1QTAcv4U+YsMI1N7ixc0z+hJb
         ElQGHys3Gn8tXBrOXLBfNLXmaCLRZYpE4KdFuOOhyYqt9NFLm+3PrBq7MIePSjrPYmVk
         hGeIT2CZL1Sru91/5dQHdJ2LWfSo08eKWWLyUBJQzpcvfsreXK1S7UO7vdEHbTnLp+jb
         3ugysWsEf61cAExDw4/gmoaClvYMNtcqyFmTBFhVzzn8zKe2Smsau5ZsqYt5tD9Vaywr
         3Ho8ozYTiLY9most3r4hMEN23idPpARFlwn8T4VLlOvSoUizBe5pmuuk2rq9WZdVN4fY
         vRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789757390; x=1790362190;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Ph6ZaVxaO7CXgv08gaPlk+fBtFgV6Zs+sxg/G7AO88=;
        b=SP33it938aLDgxKgxXnWl+nvRMkFRt4usmZHSnJtqsuiooY3DCWy20XBSsRF6DcTj3
         Ycgub7f6b3x0q+VjKppM37FG8Yjxy9cpyHdMnVadOpFWTQZMeht8iBq4wqSRfkgAta9t
         Ae9D7w9xrykURp6Jrn8Wv/yaNATQQJXZZXfPcPEAgg/HzLpw+HBcRLqq87addBAOII4h
         zjCWV38Rac+QtXCtQ0mmC6xUhPnpDLleBcU9Gfej//1VOBeF0U2HKkhH0kiT2mFbrfxH
         /w15uuFKHkhzSMR4n0pKlBDKI1CN3U0vRWwCSDwsPwcrbs4cJHhGuc0k/fiHj4bZz4mN
         ugOA==
X-Forwarded-Encrypted: i=1; AKwUvBz5OLGSq0rv6T9QkchBdxfhiassUgYDWZ6UAWCoqzGpcB6kRh2VwEDTMyRRbCYsLSGV9/vAV1qQkGXKGcc=@vger.kernel.org
X-Gm-Message-State: AFuF++lkYkGI8UYzEDYnbkJqQUn4KiHTAQ+8VaIrI0nYim+MMjQ5Uzg/
	Hk2I/xWBy8tcaD11nU3FILo214RNvP+gvdlHvBnGsejyY8G+XJNRiV+M
X-Gm-Gg: AYBFou0CNEFNkyc850t3URZAXDpKBqW4MwNYK2tw+OlwqOE2xxRhl3+501iGtG21w/P
	xOUSkE+Ch0TndWJO4EzJvBohEy8ZcxEiZHWSnbMK1p3/gZku2JpgO6m3ZiHpcXZWn0MSG8ginQt
	oVN9/m2F6potK/HTFXzSeMvebPn+BWY6xDfG5oV/Jwjffc7gw9M265Z62KfsHcYSijGdKhKww22
	EiYmT/h+43JVBUiZz4TtzG2XW+xFUiQSTllNwTxmW/ekf8r9XjQxpDTVjwoWtLfAmMbIPO1eYXc
	wXrtFhCu4/er+GQUi/3XdwesQt69DY3Wu3Wets+zpt0ZUmctPb+9Pi2VX5WlffE9jbrQCFVTq05
	sK9furfvOpHujo+Ty3IncWOO4y0DTlTInSzz1GhKt2b9IOfaMKD6dUr4a++h+hG4AV8LU/MydqD
	wy4Hbo9L0RbENkB3de/eaCfaZFQxCi+hSMnH38cWGSoIiI+r2ozzVk7/JmyLmNda9nx1F+8q+e8
	UpoOZVAzwpdJ74m/Z4EocGnesmsbg==
X-Received: by 2002:a05:6808:13cd:b0:4c1:83fb:8c7b with SMTP id 5614622812f47-4ccf6f9803amr3772164b6e.12.1789757390210;
        Fri, 18 Sep 2026 11:49:50 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:17::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cf3f77781csm69823b6e.18.2026.09.18.11.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:49:49 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
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
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v6 0/5] mm/page_counter: move stock from mem_cgroup to page_counter
Date: Fri, 18 Sep 2026 11:49:45 -0700
Message-ID: <20260918184947.3681164-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aqzulM8S63363Tr1@localhost.localdomain>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 09:58:17 +0200 Michal Koutný <mkoutny@suse.com> wrote:

> Hi.
> 
> On Thu, Sep 17, 2026 at 10:57:00AM -0700, Joshua Hahn <joshua.hahnjy@gmail.com> wrote:
> > 
> > This is true, but this is already the behavior for vanilla memcg.
> > In this series I'm hoping to preserve all existing semantics without
> > changing behaviors, so I can fix this problem in a separate issue.
> > 
> > Specifically, in vanilla try_charge_memcg:
> > 
> > done_restock:
> > 	if (batch > nr_pages)
> > 		refill_stock(memcg, batch - nr_pages);
> > 
> > ...
> > 			current->memcg_nr_pages_over_high += batch;
> > 
> > So I've just preserved the exact semantics that we used to have before.
> 
> Kudos to you for the conservative approach.

Hi Michal, thanks for your kind words : -)

> > 
> > The problem isn't that big anyways though, it's a transient inflation
> > in memcg_over_high and will be wiped on the next high handling run,
> > and there is no effect on accounting or permanent inflations.
> 
> It reminds me [1] where stockage imprecision could even trigger OOM but
> it was reportedly only visible in LTP.

So I was thinking about this part quite a bit in the older versions of
this series where I changed the draining from being async to sync.

If I understand the issue you saw in LTP correctly, it's not one of
actual memory OOMs but that there was stock that the memcg could use,
just not in the current CPU that was trying to fulfill the charge,
and also the draining for the remote CPUs did not happen in the time
that it took to run through 16 retry attempts.

IOW seems to me we are synchronously waiting for asynchronous drains.

To me this did sound a little bit unfortunate since there really is
memory that the memcg could have used, just cached in the "wrong"
place (and for some reason that CPU is too busy to do the drain).
One of the versions that I worked on previously (v4, [2]) used an atomic
for the stock so that we just always do a synchronous drain via
cmpxchg and we wouldn't have the problem above.

Obviously there are pros and cons. Synchronous means the reclaim path
has the ability to reclaim more memory NOW and prevent futile reclaim
retries, but also it makes each flushing operation more expensive as
the cmpxchg operation is more expensive than acquiring a local trylock,
even if it succeeds on the first try. 

In my opinion just doing the synchronous reclamation makes a bit more
sense to me since it gives a stronger guarantee that we are going to
get the charges we need to fulfill the charge attempt NOW rather than
spinning until some remote CPU gets scheduled to perform a local flush.

But this is just personal taste, I haven't really seen too much 
evidence that we are wasting too much time on the reclaims. So maybe
asynchronous drains are OK here. I can do some more digging in our
production data to see if we're ever just waiting for remote drains
to finish.

Anyways, I still intend on separating out the two efforts so that this
one is just a simple code move (and make stock more scalable) for
cgroup v2 users (and I hope not-so-big impact for cgroup v1 users)
and I can work on removing the 7-slot limit and improving the draining
as a follow-up work.

> HTH,
> Michal

Thanks for your thoughts Michal. Have a great day!
Joshua

> [1] https://lore.kernel.org/all/20250530151858.672391-1-mkoutny@suse.com/
[2] https://lore.kernel.org/all/20260623180124.868655-2-joshua.hahnjy@gmail.com/
