Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793643390;
	b=GHdr/1yLzibpcM5ESfJd4JIkPn7BU65t83P1NHepUa8fwZ15OuBhdoKi/nS9oXQ4LwlC
	 9lXcpqlp9QEZnXC+CAuICJr1BRci4lK3f6iJ0tHKBZj8GSq42W64bQbfehgtsg/ymIJ+j
	 vz28Jc8jDLQ+xwydxj/Vl86awnXQgcM1v1PJNKLmfuydy53pYp8aiXSKDuL9GaFey77J4
	 VZcc1yLcxXSX0jt9VrHTrsNe7L2L1WUYGeT8C78AJSav5wov2i0muvmfx9gPEjjxPC2xU
	 PYb5LJ3sSQZPunUO8WsM6fBUmowamI6NrH6CtQYWTaGMQE5eFssq536kteTX7hF14pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T9ICWzy7eh1ZDcwlW7hKp1lrYbcuv/hAuIABl4o9hxM=;
	b=boHY6F8J+d6axl/gqjH/tKjj6ZnBwQJZwS1X9k7l1DF3EuftKWz6fb4ixgQUum2U5Lq8
	 FgtGzc7R0UJ//k60oUXi3xUUv5d6Dro4YsGbkpsSlQDJfNiLt+HPK1q8EjRq/izkEPXhR
	 4p+hCS5qURGkUTSVuECSFFV1KcZUztPRAkpfTcuebxTU54+I0ugn9sz76zcI8MsVgUa2j
	 zQreHWnmq6v7ZPo0r4W6JH1N+aMZVxd6MvAE82Byc5nm888tGiwZ1mXBcSTrJ9hj52ByZ
	 V0iAO2FWvIzunInozTrKMDq/b0pnt74zaddzKSH6lXTBFfXWh+ctuNrLyd0DmVaahng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MV/9PO20";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE88606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CE88606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MV/9PO20
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7cc365db987so2297199137.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:16:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793643389; cv=none;
        d=google.com; s=arc-20260327;
        b=PenHDcwIvwmf9sj3txi1AUaNX6RzQFe3layuVM1zuBAIiClMrPRMrJxK1no4x4dPyv
         gaWAOGruKO5u9ELsXdf5HstavjspITfTJ/GKooSFE/k8xcaq1SUSPmg2bx+kBSnYcuRp
         h9rrSX9SkOtC5PSUWwPQP9O4dpNUfvsvm5+e0sVFsstwYqX6a6yKEGWMS3VesSLQ+atK
         BNt2I6vu/ECvTMB/VFZXVC9tfL3H+T68LYx0DXCOwp9BGIXVly8IkzIYxpKBnlKDWvwJ
         Qaz7Hhwo2JYJn3/wT31eFHqXE/C1v3C7TDw1fkAJR8aWufdsKg2d1hu+ToWes/qM32ME
         ZbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T9ICWzy7eh1ZDcwlW7hKp1lrYbcuv/hAuIABl4o9hxM=;
        fh=zizNbIDFkPmpL2uPv2nCbM30DgG8e3yEqe7WPcisPRI=;
        b=OWwAs5ezC6Ju3a0GytbjIff/Sxr1Yw8OSV3NEz3jKbvReWCPV3vwGctgRPXfkVVLBx
         oWaXh+ixsZp+EWYBQzIuBJNFAyyZlj9TVqnbddJj+TY3Ip9iX31RokxUMBq+NcPZy4me
         YYi2nGVhGYlasTFTZauyaFKH3kWRwyg7Yn4rIz0m1YvXKjMuy8928UBvNeP84tVP+y69
         NYML07UGSMdl2QCy9g/yBWilvQKwk7vd+eHeUYUXDmFVdZ7p//Mt+XTKHWqyvCQHp1A1
         82ci24UHsjwxWmXQRZcGuj8a91/ObADNnoLAJfKBzQXHNJGnM4ivaXGVsDxge02/M9uI
         YFBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793643389; x=1794248189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T9ICWzy7eh1ZDcwlW7hKp1lrYbcuv/hAuIABl4o9hxM=;
        b=MV/9PO20iTv/IbWrD4hFexyIGZZNqdsY5fggwZvmD41h+5Pw2hmnxnCC0ByLAJgOmN
         L9B2aZFYygwucrR/n9M3yuI10kX6ktGciuq2wBBy96XtooJwnNVogS5PPFM7fafTIUo6
         V1pwseLy6CyoWnePc+ZsGOA3J/8VsK4n8UzYGxR3S82/QjgxvOdU/RZW6LC5egXqNqjA
         Lh8F4ut8zlhnnVhU1oTCGiHwjfNoacEt1mZsZ7EsLXWcN10JSgFW34xjytg8gNVlidw+
         Y4ZkJku7Ka6TZ/LFzB9Ex96ukzXyZaBViOU+gScstg9XcfyoZxFqIasEbJbuaZItVBt/
         sIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793643389; x=1794248189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9ICWzy7eh1ZDcwlW7hKp1lrYbcuv/hAuIABl4o9hxM=;
        b=fZlEL3Fb0cjEZP63bonNsTNzQ1ODkdfjLCeL7VHVDxEXNiNSeaNAykBcR1ADzSWlup
         4BUoPLCBLVHrFQAbA2gFUkI6ROpYrAkwIjQV4ZFlguFBhT4WMbG39qDrnlz5kgZxl6dR
         G6xEOhuIAkLKbkWKSR3OcxNJWzjUlNefK311lN41oG11IVV2ghGecNo59DHqmWSSNu75
         JqbPTXHbnAhqV6k2aSB/aTeXez0k1Pvqkjs+b72rkVmblRryxJkyAil0aUIICp7nSJbr
         WiUZKVoDLT5c1HiCjYhCHcY4ZDGrhZiybsvtaESSLiYUKWGjCVYz5DlhrZ6XnAVW5YUc
         ECvw==
X-Forwarded-Encrypted: i=1; AKwUvBwbG8KMOcGS0FbJZ8IulNOfNqd9TRueKI1EkqCeJmD/BarlRhEBjFBy1N8wguoCewBvIA/K8c6zKvLWdsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AkL9G2YWxVxjASXeb6rI2iPOQ14uoDC/4rKNkl6NuQcj9y6ik
	YB/O6ZmNKqDFTp1s0QEMKkmKKri+mGxajmMelNfqKSvh9pAAPw7KLQwXFrDtPnkZ6mVzwskJEdE
	7Q9Ow2GcGsZWcM+5lkWwO/chn1bncFhk=
X-Gm-Gg: AYBFou0uCbknSo2wUbIfraHruQE7lnrK3Qpiz/eZ7CfHKqTju/Yfb55k5X7yXxUt8T9
	+aqTtGZL1qq0dSMTwfvBXHuX4I3W4SRaSmt5rPA4/uAoI7qGbJj5vc5aYBSOh56oeAP/6JkggyF
	UmSVSiITwa2hmtthnxdC2PWgd1DwBL64l4nxo7viFsraMCnMqdThhsn0NBXVyMT3xapmejR03nG
	2UMkxikbqlYMn2AeS5TRmzpvyhuhrxZS0YMUq4380eWINPgUxzXt7clc1IOWsutotsm9aKaLNS6
	E8aXzsSao7zmu0lmzX1OnPm7o1hBDyqMFx12rhVh1myf4subWW/Ws064H3U82UUs3HpTi678THR
	nOaZd2Xq5CYkbNYpJf/mMehv8lk+/FyYsXfU0icxASqBZvsdcl6DOV7XY+0c2lplLROPsBoEi2C
	Bsgf97+NfL
X-Received: by 2002:a05:6102:e0c:b0:7cc:2bb7:1335 with SMTP id
 ada2fe7eead31-7d07276121fmr4390550137.33.1793643389113; Mon, 02 Nov 2026
 10:16:29 -0800 (PST)
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
 <aujCcqKKyio7oZ0x@tiehlicka> <CAN+CAwOwRJUDXHj0RMr4p2+sdA1V9bX-OgOH1PpER+u_cB2fAg@mail.gmail.com>
 <aujSP_sfbasQaKu7@tiehlicka>
In-Reply-To: <aujSP_sfbasQaKu7@tiehlicka>
From: Joshua Hahn <joshua.hahnjy@gmail.com>
Date: Mon, 2 Nov 2026 13:16:16 -0500
X-Gm-Features: AclHuK9EkEv8FL6xfP3eWXeFQa1t-cPp0lrx5vZ8E-g9cOqfGbbE6u5P1MgVKZ0
Message-ID: <CAN+CAwNVuxqHxbaEuu2n8BmUtXhuVeX5v-v5Gu7eegyV0sT+=g@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:11=E2=80=AFPM Michal Hocko <mhocko@suse.com> wrote=
:
>
> On Mon 02-11-26 12:40:33, Joshua Hahn wrote:
> > > > > > Personally I am a big fan of how try_charge_memcg looks after t=
his
> > > > > > series, what do you think?
> > > > > >
> > > > > > > Quite honestly I am still not convinced this move
> > > > > > > is the right thing but I would like to fully understand the m=
echanics
> > > > > > > first. Having discrepancies among different counters just sou=
nds like a
> > > > > > > potential source of future problems.
> > > > > >
> > > > > > I hope that I can present a good argument for why this is not a=
s
> > > > > > concern as it may seem initially.
> > > > > >
> > > > > > My first point is that the memory usage counters were always fu=
zzy, as
> > > > > > specified in the memcg v1 documentation too:
> > > > > >
> > > > > > usage_in_bytes ... doesn't show 'exact' value of memory (and sw=
ap)
> > > > > > usage, it's a fuzz value for efficient access.
> > > > > >
> > > > > > Secondly, the raw value of the usage is actually always accurat=
e. It is
> > > > > > just the stock portion that overcharge the memory at times, mak=
ing it
> > > > > > seem like there is a discrepancy. Flushing the memcg stock imme=
diately
> > > > > > bring the counters to their real values (like what happens righ=
t now).
> > > > > >
> > > > > > Finally, this is a change that is only limited to cgroup v1 use=
rs.
> > > > >
> > > > > Right but is there any actual point in adding caching for memsw c=
harges
> > > > > now? If you have a way to opt-in to caching then you can simply d=
isabled
> > > > > that for memsw counter altogether. Fewer problems to deal with, e=
xplain
> > > > > etc...
> > > >
> > > > I think the problem actually still exists, unfortunately. In fact I
> > > > think the issue becomes bigger if you remove stocking for memsw.
> > >
> > > Yes, you are right. We do actually cache memsw through the charging p=
ath
> > > which charges both mem and memsw with the batch.
> >
> > Thanks, Michal! So it seems like we are in alignment on everything
> > except the cgroup v1 implications for fuzziness. FWIW I think nothing
> > really changes from the userspace POV. memsw and memory usage has
> > always been fuzzy due to stocking, so all this series does is to
> > change "why" and "when" the stocking becomes fuzzy.
>
> Right. The discrepancy was not so obvious but I agree that this change
> doesn't fundamentally change the picture.

Thanks!

> > What do you think about this? The other alternative would be to remove
> > stocking for cgroup v1 users completely. But I am not sure that is a
> > good solution either. For the record, I tried making the stock tied
> > together so that they refill together, but that was a nightmare in
> > terms of added complexity.
>
> Nah, that seems overreaching without much added value. While we do not
> support new features in v1 we shouldn't cripple performance for those
> users unless there is no other way around.

Sounds good with me, and I also agree here. OK! I think it seems like
we are in alignment with everything. Let me spin up a new cover letter
being more explicit about everything we've covered here and send it
out soon. This was really helpful for me, thank you for your time
Michal : -)

Have a great day!!
Joshua
