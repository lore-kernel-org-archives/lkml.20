Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793641247;
	b=J9r3vKc3pjfJFI+vS3JqCIYGi2BYv2TtJggR41f8NL0bs8+de76PuwxspbBKwAm9Ewp8
	 53mzAE+A7ylNxSc531APlG4Ocx2B1+VD0ykin1/sGZ3HTbzuvSsw61mJuHifhfprJRc9y
	 hEQbcflvtWKCHgyn5jfcvMmgdYaN15kMiht488De562/kJvcYw4PmEINbgsj8YLDaF39j
	 SAqe/CEtsIU2JZnTcuM9hRz/LJ/1u4zWS7iB41gWFg8cT/hSacUG8+/gAAMmKsLy6GqZG
	 Lr694wvFGkvuBpiBCx/AlCpcdQiRrGId49+udH/MpfqmN+EsxKyZ86Fv7zXKukB0Siw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=TlWIVwA/UXKyoa6jSw1HPI+XreVDEaVcyeg+VBHTtLE=;
	b=e+ybGW+mHOnpnVWeOKMaZ53tUDuCw5BO/82nZuWwXiwEddmE+C17HY0GUWpTKPJb/AST
	 5H2IKxiyRwetN/sQ8Mf/Ky4hHQZVpopj/3OwkfVLQwzLAFXkHbmcR8fZVjiZrruusfxTs
	 3PXM646ejTL47GyNtL2ZLpWO96xd1Gye9LCaWYJWVRChzzehARbFaXCUwfvET8ncFTE3M
	 dsHzbfe/DdQLBPhrVxiySkVYsEDFS/JEAxVXTI8uEYvrPhycE1c+gkMKVT2iDwKoHEWNa
	 PXcnC7CVZBd4pydWxmVD+w0dwPCSpCkLYT5n4b5ZLia+jsqGX0M0kqHGTtyOlPOtRZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXFUDEQU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C98D606AEB3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C98D606AEB3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXFUDEQU
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7cc91ddf447so1184289137.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:40:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793641246; cv=none;
        d=google.com; s=arc-20260327;
        b=CdRTvhc6Vn2b/iw7mzI5mhTB+A3wGgmlKwAVXTop2LfKQdFCI4Ycahn/okcSxUYD9V
         lCn9LS59QuWIzA+8nmfXF/r+z7q8v7I1zRbevbykomgx2PovS9bwc+BqxsMJFZyyszoB
         8uWOEaWFBOlypJuUdeluP7mFwSr+YArIdc7PztApG1KFUVLedt5c3xa0Rpah+1iQg1i3
         5XkFj9QPiHQoD9xbiYzZ7vJNQP6XafplCoKBAhx83BYMd2Tz09QdmHaT5wgL99vdZ+wo
         4+6ZIKqltCl1GO+VoRW2dtfQ6usXYk+eG0ohLl5hRUFigpfhDWtBRXk8J6Cgu8KBPQNX
         y85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TlWIVwA/UXKyoa6jSw1HPI+XreVDEaVcyeg+VBHTtLE=;
        fh=dbg0ah4rDSrFGsqSUTgiSNShBE9Yvaijs+qckzYEo+o=;
        b=QT8XybYwnImD+QZkWk+403J1mJtcRZ/vgZ8Qb7FhpLnzTW+0kuzYZeDImrV7cIcxAs
         rG7KSdPFnVsviFjMwA1ktF6Qwkfj6U39CoAJhbeKoYmKSX1Sw239wfhmPg7DIbYvmQGo
         12ihdjbNVS9YQz74cXciOARL1JE8W676gMXEgHUcntA3k0CBo7JIauPLjcRN/Ec7IqKG
         BBZZLD284jaElb8zdhWCI5gNlUICmAM6pyv+sJYsML2FeXFDeNh2p7K1JktlwQrQmOhG
         poznEK3EoxUVhFQk1S+vKgqNzd2GKgUgs6NuubLR27o0PKOQovK1LbsAc2QjW5iEjHaN
         1ayw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641246; x=1794246046; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TlWIVwA/UXKyoa6jSw1HPI+XreVDEaVcyeg+VBHTtLE=;
        b=XXFUDEQUt/RMwmcuNPfKQeIT1xPpcppGrlw5ABGLmtU7yZAJ6n902Ihf0F9RqyoXGQ
         w5eXCYiY/h4klsDQOLtleFyi9PYc6hcxhB4hQlh7tOmhsWfuuyZw+nswEinQ26obyRnW
         7+qQskOy9D8z+w1Kd/RBd58h7ZIlpS2gqO5InM7u23y6TzzOK2YmqVtTCNLL0xUcvxL0
         tOjn0gXV2Qipm97u81+wczAuVYIszmor5UqnbJ1QuoqPCV8Pg4fjPeNWbenBLcvnWeik
         6mH90Wo+WohV6CURPrdk1l+EWP8YfAOsyuAqWQ0CsVcpFu40p5AcD10OTDMAv9K2TE0r
         nYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641246; x=1794246046;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TlWIVwA/UXKyoa6jSw1HPI+XreVDEaVcyeg+VBHTtLE=;
        b=YyCmuAx8a6KSq2fYkCl+Rw4cRVt5rms/w2QPD3fyEDjbaiu+VJivm2JzYCvqlJalhf
         C6fTaOFrnfwiDIrHqCOtiBqrrwqi8JKVDKSAh+j/sPeyY6nSXvrvrG7QBr74zgbznrTo
         VXi8IWase+74A2DpH9ZWrvGD/oTviUJWOsf4iAZ5rcRRUdY0Bm501pT0S7nzmiyER/pF
         iJ6Ygg51ZPxB7SNsLtQg0dCV8FqI5fBGdjlHulYPAM8VDyuJlTWAmagvzjzi/K+W3/P4
         3KpQTIHseMX2ljq6Wa7fCyi1HAAnkZqWqXFvkUvKTdFtjUxnOn9fRCAPqL08FpWZFIkf
         Ur0w==
X-Forwarded-Encrypted: i=1; AKwUvBzrG/RtPfQxmH37rDOkF1aDQLR+epHBml5lN6rIIbW44JXY0qZwF6+TOoh0Lsv1J7GFS2cH2Rvur5bTIZc=@vger.kernel.org
X-Gm-Message-State: APuU4Z91R8QQTOfnMXQg94C32C2xM/TNvv35SWEJA1QKQMGNP+ce9zhr
	ujYTsVuY/MVwev5U4ePcUOOkZzvPVYqThAZAX8UOArFoY8u/MJPuPTq+SewGtDFCy3FluxNyenN
	KATr6PzkrwZU8F8P0u9ETxc6PO5+KS4w=
X-Gm-Gg: AYBFou1Vu2ci4sU2c5bNU0ALmbPeWrxsANkXd3eXHZJ9USHzfg+Lgq/3qIBEfuJ8OQj
	lfpUlIrwCSVcBq+4QsaMhs8CdFExbLCvfePTj5aHtvB5vsFvPMJGtXuAteijLgP51VRORZSYgbP
	WFonh3A5z1F6fs+d2nKCvlOqIxt+EDST914Xjf0mL4UGogh6ikRpo8DNBT5KZY67fPGcbY9NihR
	YtIxnbAbcxdlV/JD1Ilgv76AwdlyUftzUZRiwJBkMBHZTapEXp4pOBojR5Z2Sx0GHRMx5b8lqTn
	LwX9NgQ5wjHsJy+OIBkWzeKMXO0RGrI2mWxPVi6uVHVe8p4GeZ7WatIEc1XxNlaMiGtwo3nIteH
	v9Ung8gljeUnwsydFN/SMOfBFcQDimho6GBCe8YqZH4e43mPRWMO8cjUAsqSGEuXXzQx3FUWJXM
	RTyQeryOM=
X-Received: by 2002:a05:6102:6cc:b0:7b5:7cd5:2a1b with SMTP id
 ada2fe7eead31-7d072634fbamr3742461137.10.1793641245530; Mon, 02 Nov 2026
 09:40:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <aui3TJqadHUv-4RW@tiehlicka> <20261102163014.237806-1-joshua.hahnjy@gmail.com>
 <aujCcqKKyio7oZ0x@tiehlicka>
In-Reply-To: <aujCcqKKyio7oZ0x@tiehlicka>
From: Joshua Hahn <joshua.hahnjy@gmail.com>
Date: Mon, 2 Nov 2026 12:40:33 -0500
X-Gm-Features: AclHuK8Kcc-o5KfW3KwHQal0BbNJdxHPlCZpE8gC1XELnC_g5cw3VrvhXhvc0MA
Message-ID: <CAN+CAwOwRJUDXHj0RMr4p2+sdA1V9bX-OgOH1PpER+u_cB2fAg@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] mm/page_counter: move stock from mem_cgroup to page_counter
To: Michal Hocko <mhocko@suse.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, 
	Natalie Vock <nat@pixelcluster.dev>, Tejun Heo <tj@kernel.org>, Michal Koutny <mkoutny@suse.com>, 
	Oscar Salvador <osalvador@suse.de>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

> > > > Personally I am a big fan of how try_charge_memcg looks after this
> > > > series, what do you think?
> > > >
> > > > > Quite honestly I am still not convinced this move
> > > > > is the right thing but I would like to fully understand the mechanics
> > > > > first. Having discrepancies among different counters just sounds like a
> > > > > potential source of future problems.
> > > >
> > > > I hope that I can present a good argument for why this is not as
> > > > concern as it may seem initially.
> > > >
> > > > My first point is that the memory usage counters were always fuzzy, as
> > > > specified in the memcg v1 documentation too:
> > > >
> > > > usage_in_bytes ... doesn't show 'exact' value of memory (and swap)
> > > > usage, it's a fuzz value for efficient access.
> > > >
> > > > Secondly, the raw value of the usage is actually always accurate. It is
> > > > just the stock portion that overcharge the memory at times, making it
> > > > seem like there is a discrepancy. Flushing the memcg stock immediately
> > > > bring the counters to their real values (like what happens right now).
> > > >
> > > > Finally, this is a change that is only limited to cgroup v1 users.
> > >
> > > Right but is there any actual point in adding caching for memsw charges
> > > now? If you have a way to opt-in to caching then you can simply disabled
> > > that for memsw counter altogether. Fewer problems to deal with, explain
> > > etc...
> >
> > I think the problem actually still exists, unfortunately. In fact I
> > think the issue becomes bigger if you remove stocking for memsw.
>
> Yes, you are right. We do actually cache memsw through the charging path
> which charges both mem and memsw with the batch.

Thanks, Michal! So it seems like we are in alignment on everything
except the cgroup v1 implications for fuzziness. FWIW I think nothing
really changes from the userspace POV. memsw and memory usage has
always been fuzzy due to stocking, so all this series does is to
change "why" and "when" the stocking becomes fuzzy.

What do you think about this? The other alternative would be to remove
stocking for cgroup v1 users completely. But I am not sure that is a
good solution either. For the record, I tried making the stock tied
together so that they refill together, but that was a nightmare in
terms of added complexity.
