Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632821;
	b=yt+q2oSZFA7K6zdF89E+lj8JlDuKJ4f1V01MB9OM1RrNgRv7F1jx2UFJSI66Mal1Tt9T
	 1bUB4YoRkIE6XfYdkwYGri67K73QVjKxz+FZlLNVO5HaAI3e1Q67rax7RFPspO3u3FTr7
	 Wm3y9qN0wBtHAwaPeQLCYfPUK5zkMNJgt8kyg7hi3qJf6IRfnjcYhKQUbcAB4Z8s+jTb7
	 QtND+aNX6lBlMiereHQhJfRPuBCsqTmVwV+9Wda8zRCTTtrT+trgTD3WBiVV8NnKTq7Rw
	 tIfImP8kR4nczCyeRm6IQJweTWUucR1VdJOQOhX3cNutHGoTWdfd0m/ZTON2kogqI1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sSGTZ1xgzqrwbhvUAaYmxuAHPwq3oOxMzrzwAdYGKgg=;
	b=BUDmY95zWAUa4ZWhii1DciQfau/zdjS2OVKKQg2X3hSKHlINJZ78MY0nDDA7wQ42SA6p
	 9Dh2BR2Yd7exhlv//yD9cCb5hDLcYe1SMRE6nkjmFMGyHo+eGQmTpoBYZVG3g4xIBDEiv
	 xOy+OlREcm9jq5YQmjFRb9zqwmgYZODdnCTThpjLH+Fe6d6xLx8c3sJ0scwfjoiX0mbcK
	 PnZfujs433+Iub+AiTvNdfUZXpqNdOJ4M3ejsLs1mlp6oPkWyzTkydo15wUuV5IYi6jkG
	 IdkMMzNauKh1YaFY9SfTcIKbX/RUM4LVoae+JxJOZKxIvMPmLWycJZ7t5zLvosotxdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SD8P3Egv;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4786060C1588
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4786060C1588
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SD8P3Egv
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ac4806e210so25443147b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632820; x=1794237620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSGTZ1xgzqrwbhvUAaYmxuAHPwq3oOxMzrzwAdYGKgg=;
        b=SD8P3EgvYGl2azkjcnpUsZJnVAt6qOCOFAhdRyNODtZdaR1GXChiW1NA308xk606ZN
         bRIuKlzA7n+KZRUNfFj3JV1QELCPchL6rtEy0iW4o4hmOWsBNWgX+XRAW9NOyfpQ3vmf
         xHIX9zHYGcaFSk40WiDwWsVXvxusg55e8YKHQ3bPx4GEckLZ6xf2MgbBiS0cQMo5/Z3G
         2GJvNQO0DqN/YJJCW39xrZaKfcy8ZO8QvC3ErwhstwyIvpZnWA7zCL52XkgW0+NgtBVe
         H/TO5KM6bMcReqBRJFyvWBnhIcuP/JWczvviH+n0AOOQMcCPfBS2tnFFBPLW0P+tHRao
         AUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632820; x=1794237620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSGTZ1xgzqrwbhvUAaYmxuAHPwq3oOxMzrzwAdYGKgg=;
        b=OzklxciHLe94o/SlErSjndvTFPhpKfl3C0ZIy5aQgyrMRZTGsoerMt3kfxr4MU6ekV
         qKe0wGl7/oYz3Ta6pagj+bY6ArfgIpYCQGBv0DSp6Jf8XFUU/lgmVGwe7NtCUW+aVSdQ
         jsvOQROmPiZDmVaFaQ0KPK8ihVv0PxKMN01JC8d4Wt1MohsOqi776M5goa93AorV3KMg
         8hNDdcLfJsUC/RU0VWoT50/z5LDv9vbyDIo+p5wEq0YYwX7/AjEl7Eq5AD75yPHtAW7x
         9l/hH7VqTaEfQAlvcgW2sMsJnptjldgcfNCHgQ2E3c6uNranrypfb3aVr4YSNWxNSrHG
         zyGg==
X-Forwarded-Encrypted: i=1; AKwUvBxqM4akqCCZxQFz41g/5q05E5SJk+nFUOch1KRSyzfLCe/VAkxDQ60XYGgOE1DbTghNgOnI8ffyY8F+xNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M0rX2V8SjvDp6mcJPJgCORLuFzkK7FEoTKrq7TedQ2vue9ksW
	nDe7FQAwTw/BvJh581fMYcEDPQrgewwNIsmYt7h9/8vwF+UKmlG5hySd
X-Gm-Gg: AYBFou2w1MVAtzWuoBQCPoKV9NbkWsE975Nat9loL1rL8OnjiqXz6HmD/GpuavFBSwn
	IRHs9HBB71VJbcWedKads75ls8mJYaAG6bfoMJR6mj1YQn7eHhuksSHbSwtHzeYl85bRBQmYAKd
	WwYPcJ5Mrwrl7SV6NiW3I7O8K0PneVpCURzUej0VqdZmUJ4lpftIWhtap3+Zdvly2zInirycI2j
	oNWvtGkCOIqD9qsy1+4S3mZ9DrHceNqPTmoXClmkYZpC37jviUUw8Ua0Yh0MEJoKG3urKEjRF3X
	zkwMelxnq0KrzjTvM10KVMgfZDzKewAC+il5nvRU1s4BnSjz3xKDAe4UoSrfFKe4Sh+IH4+Nbgc
	2go5j+lOXG7/Ys0lsBCgtrp4zwmFiqxKOkrM9lRayEsMrgZLx3ejRNs+l4KrhurlinIYoCdaL5s
	+6pw0FgpuQUkROFfS1Cs2LVTD2LCvCzvLBRdRl0dtJkDI9mS1Kw0pKZd8TMvioU7+zI/DSjrhk8
	IyXOaxA2f61C1EDz29a0FOH2bKaSNTg/2+aG2wSEG0YbpP8YqTwfkszr4Cb17poi7MIxgHqjTpf
	1lviMirLXju5kbij9zIg8NVBGDMuUaBYTEP9C8nTf4CAtZUYpEEDDE5CF74D
X-Received: by 2002:a05:690c:6d81:b0:8ae:ed29:c4c0 with SMTP id 00721157ae682-8b2b682de50mr71858797b3.66.1793632820195;
        Mon, 02 Nov 2026 07:20:20 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:52::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7123dfasm55131787b3.10.2026.11.02.07.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:20:19 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Michal Hocko <mhocko@suse.com>
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
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	Michal Koutny <mkoutny@suse.com>,
	Oscar Salvador <osalvador@suse.de>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v7 0/5] mm/page_counter: move stock from mem_cgroup to page_counter
Date: Mon,  2 Nov 2026 07:20:17 -0800
Message-ID: <20261102152018.2773572-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <auiBOBfRIiup8Aob@tiehlicka>
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

On Mon, 2 Nov 2026 13:25:28 +0100 Michal Hocko <mhocko@suse.com> wrote:

> On Mon 26-10-26 08:59:37, Joshua Hahn wrote:
> > > > To make future page_counters scalable and performant, move stock from
> > > > mem_cgroup to page_counter so that each page_counter can opt into its
> > > > own per-CPU cache of pre-charged pages.
> > > 
> > > What does it mean that each counter can opt into its own per-cpu
> > > caching?
> > 
> > So right now for cgroupv2, there's kind of a 1-1 mapping between
> > page_counter and memcg. I say "kind of" because there still is a
> > page_counter for swap, but it takes a completely different charging
> > path (i.e. not try_charge_memcg).
> > 
> > This means that currently stocking charge for memcg is equivalent to
> > stocking charge for the memcg->memory page_counter.
> 
> correct
> 
> > However, one of the series that I'm currently working on [1] adds new
> > page_counters to struct memcg to track the usage of memory
> > per-memcg, per-tier. The goal is to (1) track how much memory of a
> > cgroup lives on which tier, and (2) to limit the usage so that a single
> > cgroup doesn't use up all the fast tier memory alone, and shares it
> > fairly with all the other cgroups on the host.
> 
> Right. I guess you have layed down your motivation quite well in your
> original cover letter.

Thanks, Michal!

> > When adding a new per-tier page_counter to struct mem_cgroup that gets
> > charged for every memcg_charge, I cannot use the stock fastpath since
> > the stock does not distinguish where the memory resides. It would
> > essentialy boil down to this pattern:
> > 
> > try_charge_memcg
> >    \__ page_couner_try_charge(memcg->tier[0])
> >    \__ consume_stock()
> > 
> > Where every path still has to do a hierarchy charge to the tier it's
> > charging to, whereas this patch gets us:
> > 
> > try_charge_memcg
> >    \__ page_counter_try_charge(memcg->tier[0])
> >           \__ consume_stock(memcg->tier[0])
> >    \__ page_countertry_charge(memcg->memory)
> >           \__ consume_stock(memcg->memory)
> > 
> > So that we can avoid the hierarchy walk for most charges.
> > 
> > I'd be happy to submit a new cover letter which better explains this
> > idea!
> 
> I guess I still do not understand what you mean by opting-in to the
> caching.

Reading my original cover letter again, yeah. It does feel a bit strange
to call it "opt-in"... I guess I just meant that not all page_coutners
will be getting it, it would only really be the memory page_counter
(and memsw page_counter for cgroup v2). I'll change the wording in the
next version.

> I believe you should focus less about what you plan to do and
> rather explain what _this_ patchset achieves and how it works.
> Also focus on describing why do we need to keep caches on all layers of
> the hierarchy.

Yes, I'll do that. Actually, this patchset is really quite limited in
what it does. I actually explicitly tried to do no optimizations or
behavioral changes at all, this is mostly just a clean-cut code
move from memcg code to page_counter code. 

You may recall earlier versions of this series did a bunch more stuff
(making the stock scale past 7 memcgs, dynamically allocating the stock,
at some point I even had a version that only cached leaf cgroups, etc.)

I got some feedback that these optimizations were orthogonal to the
movement of stock from memcg to page_counter, which is why this version
explicitly does none of the fancy optimizations on top. It mostly is
just moving code from memcg to page_counter.

> > > > We get an added benefit of simplifying try_charge_memcg(), which now
> > > > has all the stock management handled transparently within the
> > > > page_counter layer.
> > > 
> > > This is quite a large change and I believe it will be really benefitial
> > > to have some high level design overview in the cover rather than trying to
> > > chase it in respective patches.
> > 
> > Sounds good with me. I can add the call traces above which should
> > explain my thought process a bit more. Hopefully the problem I am
> > trying to solve is evident there.
> 
> I believe I follow where you are heading. I am not sure this is the
> right path but that is a separate discussion. I would focus on whether
> moving cache to the counter makes sense on its own (without that future
> work) at this stage.

If I'm being honest, most of the generic benefits that exist beyond that
work were in the other part of this series that I got rid of to scale
down the scope of this version. But to explicitly name the generic
benefits, it would be unbounded memcg stock caching per-cpu, eliminating
random evictions, (like you mentioned above as well) limiting stocks
to leaf memcgs only, etc.

I think there was a proposal to make the number of memcg stocks per cpu
even lower than it already is, because the author wanted to include
additional fields into the stock that would make 7 no longer fit into
a single cacheline. I feel like we are reaching some limits with that
side as well, so the "unbounded" portion seems to be quite opportune.

But I believe those benefits that we would like to see are made better
by this series, which makes the stocking transparent such that the new
optimizations don't make the existing memcg charging code any more
complex than it is. By abstracting away this mechanism, we can make sure
that memcg just handles the logical charging semantics, and page_counter
handles the implementation-level details of stock management.

Personally I am a big fan of how try_charge_memcg looks after this
series, what do you think? 

> Quite honestly I am still not convinced this move
> is the right thing but I would like to fully understand the mechanics
> first. Having discrepancies among different counters just sounds like a
> potential source of future problems.

I hope that I can present a good argument for why this is not as
concern as it may seem initially.

My first point is that the memory usage counters were always fuzzy, as
specified in the memcg v1 documentation too: 

usage_in_bytes ... doesn't show 'exact' value of memory (and swap)
usage, it's a fuzz value for efficient access.

Secondly, the raw value of the usage is actually always accurate. It is
just the stock portion that overcharge the memory at times, making it
seem like there is a discrepancy. Flushing the memcg stock immediately
brings the counters to their real values (like what happens right now).

Finally, this is a change that is only limited to cgroup v1 users.
This entire series actually has no effect at all on cgroup v2 users,
which I think is a nice perk. Obviously I'm not out here trying to
make cgroup v1 unusable, but I wonder if anyone is still using the
legacy feature.

I hope this wasn't too much of a brain dump on you. Thanks for your
feedback Michal. Please let me know if there is anything I can do to
clarify my intent.

Would you prefer if we continud the discussion here, or if I sent out
a new series with just the cover letter changed? (I don't anticipate
any code changes, based on sashiko review or anything else that I see).

Thanks again. I hope you have a great day!
Joshua
