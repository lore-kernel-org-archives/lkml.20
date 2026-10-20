Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523020;
	b=T7fuLdcuUaCSi3XR5k+N76F2bv7HWxmOMNZyE+RCgxet+gcRP71U6I8/bytt8qRIOSzZ
	 WsGlRExo6Kui+F2OQTYmglv61PHz5OVM79aOImbDKbhXxi3nonkz0Y4vkR/nBiprUh3pA
	 osqWhsm5N/NeZdJ4IUi9mDoIZdOz6b59MeOWW/sarXzWNeS95sigJfyJ3uINGGy/aH6mU
	 1J9sCA2el8WjjAMN5VD7tLZocsULK37y/XyGY2W/lkT9jwj9c2dNr1vqtQvGhqxGHrI7Y
	 sspKFfsGVlLqYw5l1P4wnGu0Glxo8RxG3/j5YFMLZvLgusvwJlKS77F2+czmQp9VSEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Dz9sk4E9ive+ns4UsYhR2kWDOdODtXZD9F+Re5l2VcM=;
	b=T360auszXqPFWYs0HM2DXV8R1AI80m+Vy2Bs9zVEIvtCjRGI6eZfXt1HGqM1CNCkFUQL
	 /vO3CElmWjG8WW51GBg6fc8k7tNzvyVcj4ZfVjtekstEGaB3aJQsVaSrOwVP1EMXxFkIM
	 fBopSxrCj6hEYviivrXliOG98lOZ8C5cP+zaPf1UVqrf+mwk5ZlZDXeQ32uutoYqHpuAL
	 3rSOLzqC7adUKl74IiKH6JBmEjdDgzSIe/522ejG93FvMjPSYo7cWOvE/jXd7Of8foQUU
	 mh1lfJ9LlQN2uFGfBmy36xVdYbjzMqPxJC8nA7uyFvbtzJ6Ta4lame86wsgAnVFMujw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F6LTqspz;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9973606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9973606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F6LTqspz
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0e21048f8so28984937b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523019; x=1793127819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dz9sk4E9ive+ns4UsYhR2kWDOdODtXZD9F+Re5l2VcM=;
        b=F6LTqspzQ8t6vWGnBXRpTK7e/E/2yghnP7i9ZTBsB+71Opz2FKC6WGRoz9U/C8v9/m
         10nRaecamwsb+EujNCubt7xPAwCWSMWvpSEhhcvVh4DLXm/P2m88t6wbMQajS00WY1CG
         D2ws5Y6VKYj0HCnkmLskBSrrvK5fDL3fKDtiaZeXZPRwbP2DnadOu1MKg5kOtn7tgMR1
         th4bf9cSv3u06QOOiTI2Oa/m7TcQf1nzeLenz/hzoxB8ansV3wwj3DHzjeB6y1I9D7a1
         lp/ouzJfCSx/tux+9pGBMRGm6h9eiUT0aJfEISDKwWB66KJA6fmyI3B4WtXqnX76vcEJ
         37BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523019; x=1793127819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dz9sk4E9ive+ns4UsYhR2kWDOdODtXZD9F+Re5l2VcM=;
        b=SRBOo9g7/y/6OxQaKW1nf6sXkRSq+h5tPrhC1n92BhRsBD+sOjBWchp6LldWQGb4OT
         TxbpeNYjEnMZLEQZUp0HP5J6b1hpVY4dbd/e0qj8HvjgtPfEmlH2eqmDqCoOlqrADmmc
         utCn/Ok0sGRIhBKamJ+zrdSCJDyGntxO+OL3sah/ETRsESG9gQAF5DlaxXVmSwXrwGgj
         C0RoqbNC7AbjqMBvpP65JQUpMpZ59cn2O/9Z0Li3TzW2+F73nP78JU3eZ/U0X6dPRN62
         msJ684OH0T8H6SgEG52qlt2abyeAwL9BoOAJXakU7XFSC0xhwZcLAEDaS4rHbMk3dU7s
         o1kQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvU7Z52Ovp9OKDgJjrV9wdQha8LtE9akEMsvmIeAj1LX3FzGpWrHG5C36/CV4ESQki87qmh0EX1QJ+I/c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwXcFrD8D+i4c4iDxFuksWip+NrpsNPVAEYITBvRxo7LOpMfhh
	5e7COGSqNBrlF+Ph0unjpRwK8+DGD+tTOWaSCZ/lyOO6+yQX3U1wtWQ6i/xBaQ==
X-Gm-Gg: AYBFou1/8R46fR6yFeY2T3FhC8fO1dsnWtKfvGrZieNS40Th6+xvA3y3bqNDEJ0+8+h
	TQ4p1F4BQDJN3+y9t+9C04kjg1xntJA5ggh8EKxRSM+K1Brur0mWitTUUX7pubXql8fqAyn+khG
	SRG+RXi5e0p1wXqhB12p0NHiYg8uBOni6A6GAd5UpYyapzJEtHfX9hGgOM5iK8yBSB9d+03OJjS
	FsrsIrmTfYvp5HOIZKyNaGlS6TLur5R9Yt2cA+ZJYei0nEwf/jGB1l0AVQmRcvF7TJC57XgnZgx
	1kpQAuQsBAmUCn1YUntN/VcHR6bhecyCGLhgZ7demnhRPK6APu9JTemOVyqyCQx4k2t5/rSCWTL
	vfnQgrNqBGuS/fxPe9eazfb+aiebGRhWVWyN0q2CdGpHRHyEUzLUqd1M7C73f1vUPZeyHv0jedt
	w/s6tPepcn2JvbCuoA25N5Cd53iNfgXpJFgOKNi7JCQjzDZco1KGleGVI0t5otGOdzPF4ic+mSV
	THtDzb2h8ZzJYYgbzDPkVpij2v+
X-Received: by 2002:a05:690c:4513:b0:891:c494:1a99 with SMTP id 00721157ae682-8b0f2170891mr45756487b3.24.1792523018791;
        Tue, 20 Oct 2026 12:03:38 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:9::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b13016fce2sm1798577b3.40.2026.10.20.12.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:03:38 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] mm/memcontrol: publish null pointer before dropping css reference
Date: Tue, 20 Oct 2026 12:03:36 -0700
Message-ID: <20261020190336.3754557-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ateuS_d6hRKFFeZW@linux.dev>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 20 Oct 2026 11:13:27 -0700 Shakeel Butt <shakeel.butt@linux.dev> wrote:

> On Tue, Oct 20, 2026 at 09:56:26AM -0700, Joshua Hahn wrote:
> > struct memcg_stock_pcp hold references to cgroups that it tracks to make
> > sure that the memcg never gets freed with unaccounted charges still
> > living in the stock. The cached stock can be cleared either via
> > drain_stock() or consume_stock(), which drop the reference if the
> > stock goes to 0, and then clears the pointer from the stock.
> > 
> > If that was the last reference, the memcg is freed after an RCU grace
> > period, but this can happen while the pointer still points to the
> > to-be-freed memcg. Then a reader that enters its read-side critical
> > section after the grace period has started is not waited for, and then
> > can dereference it after the memcg gets freed.

Hi Shakeel,

Thank you for the very quick review! : -D

> These are per-cpu fields and are accessed within local_lock. How can there be a
> reader where a cpu is still between css_put and WRITE_ONCE and within
> local_lock?

I think there is a case where a different CPU can actually access the
percpu stock. drain_all_stock walks every online CPU's memcg_stock
and calls is_memcg_drain_needed, which reads the value with READ_ONCE
with no local_lock. So I think there can be a concurrent reader that
doesn't need the local lock. 
 
> > In practice, this is very rare and I have not been able to reproduce
> > the issue in my own testing.
> > 
> > Switch the order of the reference drop and the publishing so that
> > we first publish the NULL pointer, then drop the reference.
> > 
> > This is based on a report from Sashiko, who found this pre-existing
> > issue in my page_counter_stock series [1].
> > 
> > [1] https://sashiko.dev/#/patchset/20260928192349.3432886-1-joshua.hahnjy%40gmail.com
> > 
> > Fixes: e1a366be5cb4 ("mm: memcontrol: switch to rcu protection in drain_all_stock()")
> > Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> > ---
> >  mm/memcontrol.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index e7d7db5718f9a..a05d9a8baa1b6 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -2172,8 +2172,8 @@ static bool consume_stock(struct mem_cgroup *memcg, unsigned int nr_pages)
> >  			stock_pages -= nr_pages;
> >  			WRITE_ONCE(stock->nr_pages[i], stock_pages);
> >  			if (!stock_pages) {
> > -				css_put(&memcg->css);
> >  				WRITE_ONCE(stock->cached[i], NULL);
> > +				css_put(&memcg->css);
> 
> This css_put can not be the last reference for the memcg from this path as the
> caller of consume_stock() (above the stack) should be holding a reference to the
> memcg.

Ah right, that's true!

> >  			}
> >  			ret = true;
> >  		}
> > @@ -2209,8 +2209,8 @@ static void drain_stock(struct memcg_stock_pcp *stock, int i)
> >  		WRITE_ONCE(stock->nr_pages[i], 0);
> >  	}
> >  
> > -	css_put(&old->css);
> >  	WRITE_ONCE(stock->cached[i], NULL);
> > +	css_put(&old->css);
> 
> Here this can be last reference but I don't see any concurrent readers of stock.

So for drain_local_memcg_stock I agree, since FLUSHING_CACHED_CHARGE
is set, so you can't have it concurrent with drain_all_stock since it
will skip that stock. But refill_stock also calls drain_stock when
it evicts the slot but the flag isn't set, so is_memcg_drain_needed
can read it at the same time.

What do you think I should do? I think reordering makes the intent more
obvious and maybe it's just me but I did find it a bit misleading at
first that we were dropping the reference and then publishing. 

Thanks again Shakeel. Have a great day!!
Joshua
