Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6266414A0A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791407097; cv=none; b=V7EIuSaEftbtRTfwAwmArL3GBEr+T9KkFbhinqrNe6/+CLmPdBuJgC918Jg76WyMiQhHUWq+G3AIoOB3AeVerHW2u9UAWlPKqu9E7kK21tKqqeP7SYfov0KwNL9xrkq5GND6bZDtrBpJwAAuLcSjG+pHdwksbYCCHGZjqdj70RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791407097; c=relaxed/simple;
	bh=wAyqVI1LDvHEX0enoHEMwHv/HzpOdH7ZmeO8g+obelk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=In/02MIAzxqiHXua/EIylZhrjMWITyLsledYpMXKR//qqeEbAEpgBP2+MeoUMTjTaK5R6AOrcCydOqPBnc3ADFf1kM5C0QtSad6ur1JD7eOtsVxLDcgbgAvbjJhnB9RrDHR/+70b/VQBaP7MRsPPh/Ef1jOMkTj9pLKrBnmp6vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALxriuZq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALxriuZq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB35A1F0089B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791407096;
	bh=SY4BNQmExtLA5V0QkPM/ia0QudX9jnU9puhlcNUIvPA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ALxriuZqpZUgqbKwJ/ZFNcK6K1tEL0LsVlzbyROnpX0kTYmDbuq348XGrfSrW8WRF
	 k0b82ylSxYC0L8qmI03wgkw6tdNVI4ekdCtwhVv72WOs+v9R+tpFN14Gh3+5s/4mTh
	 RRRb40DTbTBelQKy4jbW3JNVfIwHHoDpfYw+A6zYblrE1Vj1aldH776kg5NmI+AOhN
	 RnPPk0h7ay4osrcaae/9OxnEw55xO7fmzjcE5HH8coomWOpJihkgj02h75FxwzmvBr
	 y2tutUEs/gWIzLx1UC6q7KoLQDtO59TtGYaEib/5jXkvOBwBjBVYvAja5+LZC9Eo88
	 mb/3A8esYOzWA==
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5350cc60b51so37847991cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 14:04:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy4fV32bXam9wzgto6coib/0+5zHlA82Fq+yUDt8dSJ1wi7RWBDMmmy93QOvlRrbTjupGxL5H+hRIYP0OE=@vger.kernel.org
X-Gm-Message-State: AFuF++lb4lZzzfc0RdEPKBHQAOYgU2laXAIvCPWGEFkZ8h5+kM4gXqeE
	xY0I/tq5lw9zGaBMWp2szrbYlty092AxRWweKMdImQLKIJfnD8zUx1OEIur9ID+gAr/jrTKbUhB
	SKKxWfsTV9wS4vkKsVwYFmKAFplO+W+E=
X-Received: by 2002:a05:620a:2612:b0:93e:4d07:150b with SMTP id
 af79cd13be357-93e9b0f2babmr671623885a.10.1791407096067; Wed, 07 Oct 2026
 14:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007153915.53429-1-alex@ghiti.fr>
In-Reply-To: <20261007153915.53429-1-alex@ghiti.fr>
From: Barry Song <baohua@kernel.org>
Date: Thu, 8 Oct 2026 05:04:45 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xyzgUH4uhKqpD7PTVuOzdsAkYgowsyn5iT1LHWiaYqqw@mail.gmail.com>
X-Gm-Features: AclHuK-VeYBJ2XBsx0kQHpR2pW-F7px9RJBjDEmJr74P6hAx4We528PPnSQ0d5Q
Message-ID: <CAGsJ_4xyzgUH4uhKqpD7PTVuOzdsAkYgowsyn5iT1LHWiaYqqw@mail.gmail.com>
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, yosry@kernel.org, 
	nphamcs@gmail.com, shikemeng@huaweicloud.com, baoquan.he@linux.dev, 
	youngjun.park@lge.com, chengming.zhou@linux.dev, david@kernel.org, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, kasong@tencent.com, ryncsn@gmail.com, 
	chrisl@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 11:39=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> Commit 0bcac06f27d7 ("mm, swap: skip swapcache for swapin of synchronous
> device") made SWP_SYNCHRONOUS_IO devices (e.g. zram) skip swap readahead.
>
> zswap is the same kind of in-memory, synchronous backend as zram, not a
> swap device flagged SWP_SYNCHRONOUS_IO so it still goes through
> swapin_readahead().
>
> Here are the results from bypassing readahead for zswap too: it was
> measured with a kernel build (make -j16) in a memcg, zswap=3Dzstd, shrink=
er
> off, on Sapphire Rapids and 3 iterations.
>
>   768M memcg (sustained swap thrash):
>     metric                 mm-new    + bypass    delta
>     build time (s)          405.0       341.7    -15.6%
>     zswap-in (GB)            79.5        53.0     -33%
>     zswap-out (GB)          144.8       115.6     -20%
>     swap readahead (pages)  6.79M       0.45M     -93%
>     swap_ra hit (%)          72.1        89.9     +18pp
>
>   1G memcg (light pressure, build not memory-bound):
>     metric                 mm-new    + bypass    delta
>     build time (s)          177.7       176.0    ~same (no regression)
>     zswap-in (GB)            10.2         7.5     -26%
>     zswap-out (GB)           27.7        25.1      -9%
>     swap readahead (pages)  1.07M       0.08M     -93%
>     swap_ra hit (%)          68.6        87.2     +19pp

Hi Alexandre,

I assume your configuration is as below?

/ # cat /proc/sys/vm/page-cluster
3
/ # cat /sys/kernel/mm/swap/vma_ra_enabled
true

I am curious whether setting `/proc/sys/vm/page-cluster` to either 0
or 1 would result in the same performance gain on a zswap-enabled
system?

>
> Similar gains were observed on an AMD EPYC 7D13 host.
>
> The gain is from no longer prefetching pages that are pointless for an
> in-memory backend: readahead inflates anon residency and thrashes the
> page cache (file pages get evicted and re-read), lengthens each fault by
> synchronously (de)compressing a cluster of neighbours, and adds
> compression traffic when those extra pages are reclaimed.
>
> Bypassing swap readahead for zswap therefore makes sense.
>

The change makes sense to me. I am just curious whether setting those
configurations would result in the same performance gain.

Maybe you can mention the `page-cluster` configuration in the changelog
as well.

> Suggested-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>

This is RC6 now. You probably need to respin it after the new RC1.
