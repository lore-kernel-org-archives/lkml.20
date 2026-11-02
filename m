Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643074;
	b=tv9pjBe/tno+yG6Y4OSRqRWHoBTPP/X86+ojB8g2Kqx9Q6iMif8clPWL0thwKwhFhzFa
	 euRe9Gmp34Tg1Pod1pIjUTvkv+Kjk6OHw5yEJ7aMJ1VLp2/GWvETLBtYNig9in673+6IN
	 6OXv3INhvPOo3mn0J/ru1MYW5cWblUZOLdC+IRUEYR7AGM7Yvea25YQgVHgOuRfKthJpn
	 MY/WjDK+amZCdWRu8GZcRkk9xxHKKxWOm4gTwKd1UNObZ7Q9AzBbIGQTW29m7FQhdKmQw
	 1K7ZyO/k9rbgO0MQEFXFXljjNzSnsBpGG1tlzjvxPcCPPKyG1Ao/EaFmDqMr+tUkJxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aQruTCC5hEy9EJEA7VtNTy/+BSL1Xc1NZBa6W4LKkR0=;
	b=KoGIKCde3y0xDIyD13ck8Ys4Jxx5QCvohLqv2QsUVdsw0N+9H35kEci6dt/wBLKschnL
	 k0YnqgCgcoOEzFVcXMCSwawhOpjG9kQfr8xanxnmbTTit6k0GbDjIBWprJ4arfJaDHKU1
	 0OLwSHPLaqbRkUxUC6SPfZ8yS8QYK0uA/Odddjf8rbVsvHBCri6JOD8B0v38SL2to1IwF
	 IPct1ns+phvnaW4qkfJRlImuI1goGDWcmLzvQk9y6WZBHwfEJxaUNEj6x7dCvs7ZiQp4w
	 MDlNre5GqhEF5vCyit8gDZ8ZatBT1iwy1Z1h5zwyracfndRuyOzWONR8LXp1pZnp5BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=S7fZGOJn;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A1D606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05A1D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=S7fZGOJn
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so25592075e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793643072; x=1794247872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aQruTCC5hEy9EJEA7VtNTy/+BSL1Xc1NZBa6W4LKkR0=;
        b=S7fZGOJn+iw6rZCKUziMBDNX5mLSfgdLS/L1NKTMKwQ6NhlhF85qAINiVQ0JBrYun9
         LYubZizvwAujb1n0IT5qjIGOy26KpHahFuQDanB/1WX3pCn11z02F8gLHbUmG85g0QnV
         Y+RLPLcpcsLzQZETsbrkjsxNiZrkpqVV1wIFFGSPrYdMLal3u0BWWfk6+hN+GLk6f4ZB
         EzWsqPYeOC2jGYUKpON0Cp19myXk8x7nu2fa31Mwn+IdzMEwCfsSxf5ibbMNu2CvW53d
         x4bOa13B18BMt1F3qrloJtNHav0ELfxzVQnktiu7iXFL5ZHvGv2vvc2KhDF8viO6A89q
         7pqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793643072; x=1794247872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQruTCC5hEy9EJEA7VtNTy/+BSL1Xc1NZBa6W4LKkR0=;
        b=1xum7cvy15tRIXISie2O8S3A5TNqmdRfyES3rzbtOOJ7TH8mBk3AOW9Xp5e47uxRwI
         sHWvjg9lvrrzMQ2qaN1ioDLwXsFFOWGNzh9GvCh9wlb114NtbyTYje9HZhX70BfNAvop
         1nrbLQnEmQ9Sb+6prHwu3gxHPdX4W8QMnRl6riEFStdZ+Y7exo3DM2U3l8ZUYDEi7QtE
         lzqLI1m/hqaoqEhaR83iPb0R4jxjsrrJWwyTsQaIR0zgrxX9MX8SdmipS/y4KAMR+qkb
         PDaO31SDlIrluBC2SnCR6StunfvC7n2AFP2yogdttU3Fn09sYPdjf1UDB7uZVPL23qTd
         aIzw==
X-Forwarded-Encrypted: i=1; AKwUvBzKFvuqWxNoNnRawl2zBF1IfdtE+xjnpGYYjlyPUXQFsVq8G97HTrCUq90ul84vBEk1MrJArJHsoWQDcTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJexWF4wAVaABi5y/mt16KLYFoOIlrti0gCCEmdLhC1GNx2JRZC
	Fynb7WPPEdWzoC7vBbqXkqjbIvzo+L5eXxl2XvjPOTue6WOuGngG3ClhR0yshNIpKkg=
X-Gm-Gg: AYBFou0V9o0KSKmwKGD03CPWCi6NdINGXgewfrdhj6l2sUr0Vxw+9xdxmdSKmlsleCn
	9ISRC4n+WgmD7Wj6kuAEy+GPx3ogy37K9n1hRC13Q2+3Il2+OE9AomVNIXA0kVat/BfIejFaK5y
	Ww+sq7Y8/az67fcxvcGPi6nlFcKRGWKAYO1uRw77Twvw1KugbeKc21Ajv4YgjSGK1v6FkHATfYa
	UTv7ghj4zjlg5iFIKuOuJoLnIc8aJuYVUV2bXUKfOSrdOLFcbzUBEM5zSZr4aLaTXP1DlkB0FOr
	TaXz4qg07QxGHMiX+Qhr8NW7nn5WDLs+ezT8znksNwZLt1f9vgLV2X1i1PQI4HJolDsYuzaRLTX
	WfoR++OCSddlA/w1ZXSBnsq2OpaSGmXV2L/sST8ZopWWMUQtBbtTCowjAn4KbWjGIJvhC9icLya
	L62xi5EOIQDLnrW4G7Bl+xeQf1mwZkHbL7BT6eQW9Ul5NMLMJ0HDNXRExhHUb5rz44pTOzP+XYO
	Z9NFpc/Z7NUj7P6By7iuX3OqADzZVghS5CdexXlY5L4D6u9b+bR8rG4Yx70MQW23YRaZBVJPj+n
	CF0K+sa2KyuKyujBkU2UPVVSYMxFUOt/Uuuh2UE=
X-Received: by 2002:a05:600c:1c0f:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4ac1709a7bdmr254417725e9.12.1793643072380;
        Mon, 02 Nov 2026 10:11:12 -0800 (PST)
Received: from localhost (109-81-32-81.rct.o2.cz. [109.81.32.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm5836795e9.1.2026.11.02.10.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:11:12 -0800 (PST)
Date: Mon, 2 Nov 2026 19:11:11 +0100
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
Message-ID: <aujSP_sfbasQaKu7@tiehlicka>
References: <aui3TJqadHUv-4RW@tiehlicka>
 <20261102163014.237806-1-joshua.hahnjy@gmail.com>
 <aujCcqKKyio7oZ0x@tiehlicka>
 <CAN+CAwOwRJUDXHj0RMr4p2+sdA1V9bX-OgOH1PpER+u_cB2fAg@mail.gmail.com>
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
In-Reply-To: <CAN+CAwOwRJUDXHj0RMr4p2+sdA1V9bX-OgOH1PpER+u_cB2fAg@mail.gmail.com>

On Mon 02-11-26 12:40:33, Joshua Hahn wrote:
> > > > > Personally I am a big fan of how try_charge_memcg looks after this
> > > > > series, what do you think?
> > > > >
> > > > > > Quite honestly I am still not convinced this move
> > > > > > is the right thing but I would like to fully understand the mechanics
> > > > > > first. Having discrepancies among different counters just sounds like a
> > > > > > potential source of future problems.
> > > > >
> > > > > I hope that I can present a good argument for why this is not as
> > > > > concern as it may seem initially.
> > > > >
> > > > > My first point is that the memory usage counters were always fuzzy, as
> > > > > specified in the memcg v1 documentation too:
> > > > >
> > > > > usage_in_bytes ... doesn't show 'exact' value of memory (and swap)
> > > > > usage, it's a fuzz value for efficient access.
> > > > >
> > > > > Secondly, the raw value of the usage is actually always accurate. It is
> > > > > just the stock portion that overcharge the memory at times, making it
> > > > > seem like there is a discrepancy. Flushing the memcg stock immediately
> > > > > bring the counters to their real values (like what happens right now).
> > > > >
> > > > > Finally, this is a change that is only limited to cgroup v1 users.
> > > >
> > > > Right but is there any actual point in adding caching for memsw charges
> > > > now? If you have a way to opt-in to caching then you can simply disabled
> > > > that for memsw counter altogether. Fewer problems to deal with, explain
> > > > etc...
> > >
> > > I think the problem actually still exists, unfortunately. In fact I
> > > think the issue becomes bigger if you remove stocking for memsw.
> >
> > Yes, you are right. We do actually cache memsw through the charging path
> > which charges both mem and memsw with the batch.
> 
> Thanks, Michal! So it seems like we are in alignment on everything
> except the cgroup v1 implications for fuzziness. FWIW I think nothing
> really changes from the userspace POV. memsw and memory usage has
> always been fuzzy due to stocking, so all this series does is to
> change "why" and "when" the stocking becomes fuzzy.

Right. The discrepancy was not so obvious but I agree that this change
doesn't fundamentally change the picture.

> What do you think about this? The other alternative would be to remove
> stocking for cgroup v1 users completely. But I am not sure that is a
> good solution either. For the record, I tried making the stock tied
> together so that they refill together, but that was a nightmare in
> terms of added complexity.

Nah, that seems overreaching without much added value. While we do not
support new features in v1 we shouldn't cripple performance for those
users unless there is no other way around.

-- 
Michal Hocko
SUSE Labs
