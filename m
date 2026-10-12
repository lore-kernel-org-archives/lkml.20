Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E12364926
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792084; cv=none; b=mqbsNzGwyDITweWtYuPEvkKqPXYTAqs8Su8SJHBC0zZ3QBrdidoURJ1ytYNXqVfMG8CJ1BNT+jTjJQ+N2WI8xssDbRZ2pIcY5OixmFqcTzrYzTSOHiFL6Wo9NfEhKF5Z85+xHG6/2wRWd8DHvbib4Fi9qxuiG6KKy9PoVBJZdyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792084; c=relaxed/simple;
	bh=nWuXCx/7DPazUmSBzEGZs7Zdqlk+bGwIqKwfgQmkKV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rntcH/uBpwQ06M2xYLvpdO9/HmbfUhA+1t0fTf9Q/ghWOACO5jjo1nkCHgVbcBEC9a/yOj//oUKIwQB91wC+jnEkeVqDAHW0E37MEb0iF9dO8Df1AQr3vydt2hh/wuod1miftpXEWeAStVkZBFlTSTSoOvLLLVo97T1BGsvDYKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LiCoR9Kw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiCoR9Kw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162371F0089D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791792083;
	bh=VFJCTOee66kxc8V6r3kv+pIOgrnSLrYGq1H3NUTohKg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LiCoR9KwQklxGnaAd7874H4CHvE1PZVseMsln2OtO9mI46DAXRvjOBJfebS9dUz+r
	 jzNk8f7IFnVlQzGA5WvcpoR7FBjn/KUIleYP0UuD/c/Pbu5uCdVDvdYKiHbBmXEukO
	 i6j4cyRWy3EnThhhH/idFsTC7eXlXhP7DSqqENIubppmTxhPOanKOAgASMVN8/htR5
	 o9z8jpoyoPZJjo0S21ZUlPW65ddTVsm1d/l/NJHx0vJN1TCsytw2G6pM7/ekjnCpWK
	 l2KR6lg2vFszJRyE3ZRO4rCaORtn2UPSomDS0JzIkMVlXdI4F0Dn0EXqIfhl4Qz0uk
	 cJNZWLrroI0TQ==
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e4e37788cso184078085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:01:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBykhrQ38KtIWaMYYv7nT8lo8P/uijI5nhulanBpFjYDt06Le0nGdL246j7wqrbyQ52tMpCdShJxiB1qABc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWJ4GFZO1s9dPIZ1yQLovlFoHvQ2YZZIZQ3nFXOdlQ39bV/rcH
	zsYxdhodOFYj0gf1zUedZ1xf+0ieCDLwDuwxvJ10Y0ofTzBjwTDbDDuYqDknv9aWrNN/+OBsKEi
	jeOKJVwqdwfUltwEoXJdJ4b34PHu+nzQ=
X-Received: by 2002:a05:620a:271c:b0:93e:942f:b8a5 with SMTP id
 af79cd13be357-93ebd20ede1mr1614851285a.14.1791792082466; Mon, 12 Oct 2026
 01:01:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007153915.53429-1-alex@ghiti.fr> <CAGsJ_4xyzgUH4uhKqpD7PTVuOzdsAkYgowsyn5iT1LHWiaYqqw@mail.gmail.com>
 <CAEmasaWQm6DPqAhmW_z=kuR+3LDWJ=h+yM0hAs+ryNoFQd6qmg@mail.gmail.com> <CAEmasaXa2pB_Jm_VgBZAWQwu1p75yUSY2=dr0Opt5okLgWk-YQ@mail.gmail.com>
In-Reply-To: <CAEmasaXa2pB_Jm_VgBZAWQwu1p75yUSY2=dr0Opt5okLgWk-YQ@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 12 Oct 2026 16:01:10 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xw+CLzrazOFxnvJCbvG0qoauEuFGR6OdtT3x78ef95pA@mail.gmail.com>
X-Gm-Features: AclHuK8IOexl_8V3bBRbq6TRfOHJmNLkbnQq5h2MM7v35kR54WFVJ9QbpGusTiw
Message-ID: <CAGsJ_4xw+CLzrazOFxnvJCbvG0qoauEuFGR6OdtT3x78ef95pA@mail.gmail.com>
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
To: Alexandre Ghiti <alexghiti@meta.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	yosry@kernel.org, nphamcs@gmail.com, shikemeng@huaweicloud.com, 
	baoquan.he@linux.dev, youngjun.park@lge.com, chengming.zhou@linux.dev, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, kasong@tencent.com, 
	ryncsn@gmail.com, chrisl@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:59=E2=80=AFPM Alexandre Ghiti <alexghiti@meta.com=
> wrote:
>
> Hi Barry,
>
> On Fri, Oct 9, 2026 at 8:22=E2=80=AFAM Alexandre Ghiti <alexghiti@meta.co=
m> wrote:
> >
> > Hi Barry,
> >
> >
> > On Wed, Oct 7, 2026 at 11:05=E2=80=AFPM Barry Song <baohua@kernel.org> =
wrote:
> > >
> > > > >
> > > On Wed, Oct 7, 2026 at 11:39=E2=80=AFPM Alexandre Ghiti <alex@ghiti.f=
r> wrote:
> > > >
> > > > Commit 0bcac06f27d7 ("mm, swap: skip swapcache for swapin of synchr=
onous
> > > > device") made SWP_SYNCHRONOUS_IO devices (e.g. zram) skip swap read=
ahead.
> > > >
> > > > zswap is the same kind of in-memory, synchronous backend as zram, n=
ot a
> > > > swap device flagged SWP_SYNCHRONOUS_IO so it still goes through
> > > > swapin_readahead().
> > > >
> > > > Here are the results from bypassing readahead for zswap too: it was
> > > > measured with a kernel build (make -j16) in a memcg, zswap=3Dzstd, =
shrinker
> > > > off, on Sapphire Rapids and 3 iterations.
> > > >
> > > >   768M memcg (sustained swap thrash):
> > > >     metric                 mm-new    + bypass    delta
> > > >     build time (s)          405.0       341.7    -15.6%
> > > >     zswap-in (GB)            79.5        53.0     -33%
> > > >     zswap-out (GB)          144.8       115.6     -20%
> > > >     swap readahead (pages)  6.79M       0.45M     -93%
> > > >     swap_ra hit (%)          72.1        89.9     +18pp
> > > >
> > > >   1G memcg (light pressure, build not memory-bound):
> > > >     metric                 mm-new    + bypass    delta
> > > >     build time (s)          177.7       176.0    ~same (no regressi=
on)
> > > >     zswap-in (GB)            10.2         7.5     -26%
> > > >     zswap-out (GB)           27.7        25.1      -9%
> > > >     swap readahead (pages)  1.07M       0.08M     -93%
> > > >     swap_ra hit (%)          68.6        87.2     +19pp
> > >
> > > Hi Alexandre,
> > >
> > > I assume your configuration is as below?
> > >
> > > / # cat /proc/sys/vm/page-cluster
> > > 3
> > > / # cat /sys/kernel/mm/swap/vma_ra_enabled
> > > true
> >
> > Yes
> >
> > >
> > > I am curious whether setting `/proc/sys/vm/page-cluster` to either 0
> > > or 1 would result in the same performance gain on a zswap-enabled
> > > system?
> >
> > I'll test and report back here.
>
> So I ran the same workload (kbuild -j16, 768M memcg, zswap only, n=3D3 pe=
r arm):
>
>     768M memcg (sustained swap thrash):
>       metric                                        mm-new
> page-cluster=3D1    page-cluster=3D0    + bypass
>       build time (s)                               530.0      462.0
> -12.8%      452.3  -14.7%    452.7  -14.6%
>       zswap-in (GB)                               95.7        66.7
> -30%         64.2    -33%     64.4    -33%
>       zswap-out (GB)                           169.3      138.3
> -18%       135.2    -20%    135.6    -20%
>       swap readahead (pages)            8.37M     1.93M    -77%
>   0      -100%    0.53M    -94%
>       swap_ra hit (%)                            73.6        86.5
> +13pp          -          -          90.7   +17pp
>
> Exact same results with page-cluster to 0, so I'll add that to the
> changelog as you suggested.

Thanks! This seems to be a strong indication that setting
`page-cluster =3D 0` can also resolve your problem, even without your
patch. :-)

But I'm still glad to see your auto-tuning patch!

Best Regards
Barry
