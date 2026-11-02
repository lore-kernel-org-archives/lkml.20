Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637018;
	b=gn7/BHEmPR3cmF8Whsz00YEwYbi5p4fr7IZ4hX/BkDwB/qc/JzSogBdrok0bfw5Xh77c
	 WJ1RtUy09c8/o6v0phb93Y5LNXL63iBGVvQCbT4rhYue0VnDOP2nw0xPZhQ4bTz4gXFmP
	 oN1IuWA9FcUt7KU3N7ChRGySliySesEKnpiq+Bscx7Q5v31MwYmNtyflzAlh8RamhQMNt
	 srFLyLl4cbr7Re6RwUrjdJ6EdmfSAezoQbB49WJpd6sb4tKYVUsLAktjmfVwFatfklC/W
	 i52eBauWUZu7HeFuXPrI4c8PszNqq3sV8zohsa9kiQLE8qchfHdJXpfS2Sf/a/wSEFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iNKubM0bQBA+ECydhGutl5fpgFXycwBIVGn2oasC3ms=;
	b=OLt/Tc1R0PwYwaw87ktS1gRURh7l8ec3CRYO8saDUmetaGHwkpgW+mK/tqa7dHvKJ+p5
	 8cLyxOj4SkFzWoXKGdkbcC8pn9no3HJcqexMdHk+m6tg9nhLruseTUPvxc8NtjpFL89V+
	 ESH43edsdXiRDigP4gGkFGtSX4PlbyZn2irkyXX9nEiW290GY2X/2Mr6zULiIcctfIdI3
	 rGJy9V4DXcVU8QUn2r6+q9Wq2xiSYvHZIKdQKRjIKZ318frxDqLKvon9u2rofdOecj86F
	 hGcFKPbiPQI8tNz+kYlP8yfxqS0E30evMAUhRFwyMfm5mqd1W8n1/29StB9hpLoG15Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dcj9lXkM;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E0260895AE
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E0260895AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dcj9lXkM
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b10d24345dso27812017b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793637017; x=1794241817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNKubM0bQBA+ECydhGutl5fpgFXycwBIVGn2oasC3ms=;
        b=dcj9lXkMeFUkJ02fRaKCx3clhj7OUV6T+6I11NZRn/R/SiKHRDWVTzdbah55HcS1FB
         FJAK4rLJaAxbCFxHBrB9e2I23AoeMdmZpWtrlJPH/Jm9JcSvfQyb6nazra6SrFETmpNo
         M4n7n7WatVBuqUi3SEWlAE+59cjWj38H/LDJCc86o9M6nqpmXfo93c5eawXzgxKkkZzR
         mDQKoZvVUQBr/ZkXBqyic9OUmfJ8PEwcgwE0sMnDMVetftb7bqJGr48TpoXUPX5SBJIx
         Kyp3u0VSDNfSgl/70+R1N3Is6Ntcw7x18XSeL4zVrHkVlIyynaMVcq8ibrAS0Cc4uOAk
         or6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793637017; x=1794241817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNKubM0bQBA+ECydhGutl5fpgFXycwBIVGn2oasC3ms=;
        b=Ib5IcnlzaT1hIFs5zlLgVJMOxUQZUAMMZKo6Mrz/1OGTFDu+4hm27ID4szQx5X72g0
         Qs749YypNePRu1z8E0XAmJIdnFaSvknKemzL0s7aBbmRPmjLQn5ppQ0ggb5VsXZizlaB
         Kbjt9LPnsaqdqD7y33e5FzfBychvc0ggsCSMxFyrmj3r2ls/tbpBMRmQcRZMVDVMrqTq
         6nctAfF+zsAR9fuJiEpm9i5Yov1EPFkYNdQHC7hx4dOTgqOSb1SVKKW/Bhbehpqg66FE
         6N/fnSxKnD4YOrnSrnV8HrZ5OuiHul+0QEyfPgs2AQHU/kjyDKfg5OflpRGfeKgI6JIh
         Z7jw==
X-Forwarded-Encrypted: i=1; AKwUvByASDXZ9qd9xBhPLHyExN1BXoSrj2z5sDSsJtNE3EyCHk59vRGQrIQLM+sS1ioQMt1CGN+qtjXetvJTNOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CSrv0APxJ3MXyIFN3RWmDl8VuyyAzG82gU04l5PKs4MVRCr0b
	I1q/yFwL40H1rVdGXuZMGOe/ZQmn3lrIV9ImeviNZGAdOEdtJg51Tvms
X-Gm-Gg: AYBFou2PCsr5CG7RZORjj43N4TQM7IzAFrPSY279OwbtBo0ve8N4NPbfrNMqNo7o8xX
	GNfg9Qa7IQ/5YXk5P0FFRjbHtn7q+yN5m+kU9Z2ZzxWuVyv8+jqNqIG3HEDne3FhazD1TzGCHmD
	PWGb0xQdFmDl0htsEuPxuYgpg1FrCX6VEXCt1e4CMvgDoRDzbFBHHTF9QQV6ccDZ8398arWsoO+
	AnYM2dZCtUA/qNyrfPqGKNuKPtGp8hJAJS5N4z5fJLKc0kWQv2iKigUO6e9dvjmxRAOzvYczqDX
	g6mgHh81l/H/xl0YtTE3GcJxtgwJ/QNwiLogFU+YYBKec5opboME6LL/CNukodFf9CxN4C0OWcC
	p4R4jzk4sKiWY9z1Ep/RiIpMX0XJGuBUMx/oPxAwCpCH6DrdzBec8/0SDMvNJ4/r3pkyJ0SWI6y
	WDqKLwdFsjWm/XqthrlF//YqODLMDWMReZQWNppnaptRTg9TqH4ZyOKGCGcVVMKDpeWnj+ATXwJ
	N4VKaR5WyGyWFkTIepGQBzU0LYwJ253nDtf9PuFZ94D7Cbzz9krxzUgPCXSqt01uMHw6b8ywU8/
	1UXKAbyF3g0BtxpPTYfc1vyre7Yjl2Gszgw9XpXldl2wBQ/vMW1xHEZOyFr/
X-Received: by 2002:a05:690c:9216:b0:8b0:f1c0:60c8 with SMTP id 00721157ae682-8b2b67112bfmr61784587b3.22.1793637016851;
        Mon, 02 Nov 2026 08:30:16 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:11::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7165e59sm55425717b3.31.2026.11.02.08.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:30:16 -0800 (PST)
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
Date: Mon,  2 Nov 2026 08:30:14 -0800
Message-ID: <20261102163014.237806-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aui3TJqadHUv-4RW@tiehlicka>
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

On Mon, 2 Nov 2026 17:16:12 +0100 Michal Hocko <mhocko@suse.com> wrote:

> > > > > > We get an added benefit of simplifying try_charge_memcg(), which now
> > > > > > has all the stock management handled transparently within the
> > > > > > page_counter layer.
> > > > > 
> > > > > This is quite a large change and I believe it will be really benefitial
> > > > > to have some high level design overview in the cover rather than trying to
> > > > > chase it in respective patches.
> > > > 
> > > > Sounds good with me. I can add the call traces above which should
> > > > explain my thought process a bit more. Hopefully the problem I am
> > > > trying to solve is evident there.
> > > 
> > > I believe I follow where you are heading. I am not sure this is the
> > > right path but that is a separate discussion. I would focus on whether
> > > moving cache to the counter makes sense on its own (without that future
> > > work) at this stage.
> > 
> > If I'm being honest, most of the generic benefits that exist beyond that
> > work were in the other part of this series that I got rid of to scale
> > down the scope of this version. But to explicitly name the generic
> > benefits, it would be unbounded memcg stock caching per-cpu, eliminating
> > random evictions, (like you mentioned above as well) limiting stocks
> > to leaf memcgs only, etc.
> 
> limiting cache to leaf memcgs makes a lot of sense and addresses a big
> concern I had. How exactly does this work?

It's not a big change, actually. This was the implementation from the
origianl RFC of the series:

https://lore.kernel.org/all/20260410210742.550489-8-joshua.hahnjy@gmail.com/

The idea is that you treat a cgroup as a leaf until it becomes a parent,
at which point you drain the stock. Stock can land on the parent due
to hierarchy walks, but I can also write another part to this that
prevents stock from getting cached when a cgroup has children.

> > I think there was a proposal to make the number of memcg stocks per cpu
> > even lower than it already is, because the author wanted to include
> > additional fields into the stock that would make 7 no longer fit into
> > a single cacheline. I feel like we are reaching some limits with that
> > side as well, so the "unbounded" portion seems to be quite opportune.
> > 
> > But I believe those benefits that we would like to see are made better
> > by this series, which makes the stocking transparent such that the new
> > optimizations don't make the existing memcg charging code any more
> > complex than it is. By abstracting away this mechanism, we can make sure
> > that memcg just handles the logical charging semantics, and page_counter
> > handles the implementation-level details of stock management.
> 
> Yes, these are all good arguments. Especially when clarified that this
> leaf only feature. I have to say I was struggling to see how caching on
> all levels of the hierarchy would work in practice.

Sounds good. If it makes sense to you then, I can fold in the
leaf-only caching into this series to maintain more parity with the
existing code. How does that sound? 

> > Personally I am a big fan of how try_charge_memcg looks after this
> > series, what do you think? 
> > 
> > > Quite honestly I am still not convinced this move
> > > is the right thing but I would like to fully understand the mechanics
> > > first. Having discrepancies among different counters just sounds like a
> > > potential source of future problems.
> > 
> > I hope that I can present a good argument for why this is not as
> > concern as it may seem initially.
> > 
> > My first point is that the memory usage counters were always fuzzy, as
> > specified in the memcg v1 documentation too: 
> > 
> > usage_in_bytes ... doesn't show 'exact' value of memory (and swap)
> > usage, it's a fuzz value for efficient access.
> > 
> > Secondly, the raw value of the usage is actually always accurate. It is
> > just the stock portion that overcharge the memory at times, making it
> > seem like there is a discrepancy. Flushing the memcg stock immediately
> > bring the counters to their real values (like what happens right now).
> > 
> > Finally, this is a change that is only limited to cgroup v1 users.
> 
> Right but is there any actual point in adding caching for memsw charges
> now? If you have a way to opt-in to caching then you can simply disabled
> that for memsw counter altogether. Fewer problems to deal with, explain
> etc...

I think the problem actually still exists, unfortunately. In fact I
think the issue becomes bigger if you remove stocking for memsw.

Let's say only memory gets stock. Then on a single page charge for a
new cgroup:

memory page_counter charges 64 pages to refill the stock, memsw only
charges 1 page to fulfill the current allocation. Then you have
memory: 64 pages
memsw: 1 page

And the invariant that memory <= memsw is immediately broken.

Unfortunately only stocking for memsw is not a solution as well since
successful memsw charges still charge memory and will therefore go
through a hierarchy walk.

Actually maybe then, the solution is just to remove stocking for
cgroup v1 users? Does that sound like a fair tradeoff to you?

> > This entire series actually has no effect at all on cgroup v2 users,
> > which I think is a nice perk. Obviously I'm not out here trying to
> > make cgroup v1 unusable, but I wonder if anyone is still using the
> > legacy feature.
> > 
> > I hope this wasn't too much of a brain dump on you. Thanks for your
> > feedback Michal. Please let me know if there is anything I can do to
> > clarify my intent.
> > 
> > Would you prefer if we continud the discussion here, or if I sent out
> > a new series with just the cover letter changed? (I don't anticipate
> > any code changes, based on sashiko review or anything else that I see).
> 
> Let's just iron out things first.

Sounds good to me. Thanks!
