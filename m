Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6082E4908D0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816992; cv=none; b=dMnxzEzrDebt5FLYO3vl9W8TrFZYnFNvx5r1D9Rwo1cXhIaZFKkBWkdUJJXXEdNFuGABKLv9EB1W6BMYotwqkgvSXArwFYV6CrGKrnyjy+Y7urtH3FGgkKLO7posv9V2NHDUTW4KXwl9YBBtlSRDOPYmumZlNwKGnoSZT+a0iyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816992; c=relaxed/simple;
	bh=zzV1H8VuC6aKyIL6Nu1e4YLM0TUxzj/r7iNtBdypT/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xs0/cVEitBfO6Ptr5c88Z2QgZrkxdFFT1qsA4E8RBbUHrsFpPXFtkC+aqPPmpgB0x1XFn3BaERdVhgJQLI0P9aVBfDtcuMhdYtaGbZuUCP6t7GI2pbte1Ow5SkMAZNS/MUGDqE2h15sdc8xj/nJcCg4hYxiVIcAmIUnrzp6Lf9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEyrT119; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEyrT119"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7C71F0089C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791816991;
	bh=zzV1H8VuC6aKyIL6Nu1e4YLM0TUxzj/r7iNtBdypT/Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YEyrT119wH78rbXg8r9XKN58cwZQSmO2C3utNzdkqvlSzzwWhdBzLdv6w4y/qS+gU
	 fR1+uiWgJNUZEdKwKG/7TiRTpodHqZlQvT8/bzBH5hUVmiW14731eHJuncEk+Vmd3E
	 LZlKJsogxJjCfoJcIjCvhIOjpqafPFuuSCijt5uPMNFmHVyOn4lw8uIK/KQaz3TsWV
	 kUeEGfpnX6S2YrV/ONtgrgk30ZE6d4i7oJdqcpsR7yGLbrS/HEMK4OuHyNUFsVjsB7
	 8EbiS3fag2pgn1M9HrKa0CoUFlXwbXdHQZRJuf4Yerhgk+5jzKKQCzL4fXNtBen3fV
	 h8CuGI9brsQtA==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93ead211f14so203309785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:56:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzHfQ8OOtglIu7mlu1MIOYLYZrIA55n566TRN+DdNDVE5z2b7FUvMVimZ0kLI9bHNi/fIXI/WkNQA8GQmA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIf3gVlXPpKDFUbKgkSRStPQ0WdPhRLIq+ikj9Qdt0+/F+81+H0
	Lq+ywlMHLrdzGsE06Ol+BevMcSJXRObW+qONPXpxizDGDQwQPfkYEEaXXzLPdTeZ68Bv0WWBB6W
	uMnK9AcXflPS+nWQsP1WObTeBP+nQWDE=
X-Received: by 2002:a05:620a:408d:b0:93e:5508:24f8 with SMTP id
 af79cd13be357-93eb9677234mr1673656885a.32.1791816990380; Mon, 12 Oct 2026
 07:56:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007153915.53429-1-alex@ghiti.fr> <CAGsJ_4xyzgUH4uhKqpD7PTVuOzdsAkYgowsyn5iT1LHWiaYqqw@mail.gmail.com>
 <CAEmasaWQm6DPqAhmW_z=kuR+3LDWJ=h+yM0hAs+ryNoFQd6qmg@mail.gmail.com>
 <CAEmasaXa2pB_Jm_VgBZAWQwu1p75yUSY2=dr0Opt5okLgWk-YQ@mail.gmail.com>
 <CAGsJ_4xw+CLzrazOFxnvJCbvG0qoauEuFGR6OdtT3x78ef95pA@mail.gmail.com> <CAKEwX=NrMD1jpU=Kfh367mGArw_ju_8ku=Rh_v8TiLumx3+S3g@mail.gmail.com>
In-Reply-To: <CAKEwX=NrMD1jpU=Kfh367mGArw_ju_8ku=Rh_v8TiLumx3+S3g@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 12 Oct 2026 22:56:08 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wck1jiahYPHRT+n4YsjK+MH79Fwcq9NeJQB__AnUESiQ@mail.gmail.com>
X-Gm-Features: AclHuK9l5YlJmbsyV-N-AoDzMMoah_wy-giXfPgwPy_mojUYu5-uhB03Mnu4R_Y
Message-ID: <CAGsJ_4wck1jiahYPHRT+n4YsjK+MH79Fwcq9NeJQB__AnUESiQ@mail.gmail.com>
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
To: Nhat Pham <nphamcs@gmail.com>
Cc: Alexandre Ghiti <alexghiti@meta.com>, Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	baoquan.he@linux.dev, youngjun.park@lge.com, chengming.zhou@linux.dev, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, kasong@tencent.com, 
	ryncsn@gmail.com, chrisl@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 10:21=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Mon, Oct 12, 2026 at 1:01=E2=80=AFAM Barry Song <baohua@kernel.org> wr=
ote:
> >
> >
> > Thanks! This seems to be a strong indication that setting
> > `page-cluster =3D 0` can also resolve your problem, even without your
> > patch. :-)
>
> If every tenants use zswap, yes. But we have tenants with different
> kinds of swap backend in the same host (some using compressed
> synchronous swap backend, some async IO swap backend).
>
> >
> > But I'm still glad to see your auto-tuning patch!
>
> I think we need some smarter readahead work, for sure. I'm just not
> quite sure what it'd look like in the end, though.
>
> Doing synchronous readahead work in page fault feels wrong. I chatted
> very briefly with Kairui about this. Kairui is trying to come up with
> smarter readahead heuristics, but I don't know - even if it's 100%
> hitrate, we're concentrating work of multiple pagefaults into a single
> pagefault. That sounds off to me?
>
> Crazy idea time - what if instead of skipping readahead for
> zswap/zram, we offload it to asynchronous worker (only synchronously
> loading the target page)? That'll cancel out the latency issue at
> least...?

I am quite sure I tried this 3 or 4 months ago, and the
performance was very poor. The problem is that async wake-up
latency is highly unpredictable. For example, do_swap_page()
can complete all the mapping and decompression work in less
than 10 us. However, if we queue the work to an async thread,
its wake-up latency alone could be much longer than 10 us.

Based on my results, async zram readahead only works if we have
hardware queues rather than relying on async threads.

Best Regards
Barry
