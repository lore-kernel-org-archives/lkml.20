Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665242;
	b=TzWe1svJaZc5IZ+VdOgvg5/IRD0jgirlma9Vr0Jy4emnZFQOlIMK30ENf7et/gLzLkdv
	 rbUb6A5QRXhdvsZVEEDwwaCJ1Z2kSqB1g3BdfFK+5LrjZ0x5XfEnSvyLUy4fsQ0vWdUeP
	 QhHJ8Oy4vA4IsS9d7VHNcDIlqRmOUFyolglIRS03/hMgVqfL1vIkwK/xrLy1ZHf+fkbGN
	 VMT4iR6zcG0XjOzUxx45+z9yvGZpxOQnf3qxgvpz6GyHYSoN3d5ukzoUua5mIXgAJePDm
	 w6hk5lamJ5+V/KKOBZCINRZ9dbQw5P7mzw8qs/P3eU//f+QyKWS5mLCOE6Gj1fw0V3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665242;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z4QhvnTdFTIPtKVQmOBZJGW3hPjEUkPMalQ5nPTeXuU=;
	b=iTSHlcr5Cw4I+KO3HvSaSWH4jzlfydY1VoDbG5A+XFRiy2zHGiWA9EF+RQ/jZlFnLB7V
	 Dkbrj+lrPkggUEh/eXkiZ7fBSmUjjCFqzo65bXRPLtVdyNi7sDC9Z4tvLw++T5f+XR941
	 qz0W9gHhTwH5k3q0XkkGlWRyrMlstplYks3/lwO3hAsXFEPg7QDRaha2sJJJqx2RSlIgV
	 qf61hWb9cz2d5M/FNI0bB7YS4zZllznOwjCuzXcn4JCGt10KjrA+DKnkszyMIr/wwqSsv
	 EJYe3jxAfj1S8pwHmOlO1HGFHaWQjFO2lqiTM/yXmhjQlFZ3avonruazFnjd53WZLQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIrQqyXU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ED0606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIrQqyXU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98041F000C1
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793665241;
	bh=z4QhvnTdFTIPtKVQmOBZJGW3hPjEUkPMalQ5nPTeXuU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MIrQqyXUk/UNpSOznb0IVqfhRBIcSG1Hh+JhO7zGRw/8aijMvD2RYsnKCLhmhgktb
	 80g4ue1dCmswxOyfxWym/cjg7Q2iUVz1KalsyyIABzOMsKyf66BIre76aI3Wx6XOIu
	 w7nMvxRPEPQ4pkMKtlx6V3pl/ZNp1I54QziwyuIEwq2W/53XqOoJu2+pA0S6loedgi
	 of2XKolZSwyq1/871vsphIEVi6up+R/E6dkpyd8Ta98G6V6wjyBc9z/muqRsZJiIlq
	 ikP81XCw6oeRtvm6PiLvTkFsE4WNSVe3zLX/SHYh6bRspyroJ6JjhyngbRaKV7JhLl
	 ne8IRKdAA8V+A==
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e6eb77f0bso351708085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:20:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwmuUuKH0PfuBbnTClGqHu7nbPUp5CYBlO5PsiKyXTIIuTcFsSbIuvIv7ZRm34aFvwizWfXgNhqxA9dk4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZvfJuzFzauYd+Nu9UTWrHQCa1vLXfNUUAjCupwng6S/lkK2Rq
	y81PDg+dkADf29V9W75txSlvi07LnM12XbGfBLN9JuMAKeEdJv+l4fjJ21gXZW5RjIICqqXcHcn
	0YM3B0Lt25SWm71yx8hstDKv/iva8GVA=
X-Received: by 2002:a05:620a:450f:b0:93b:be6d:4f3e with SMTP id
 af79cd13be357-9442171a2admr1967653585a.25.1793665241000; Mon, 02 Nov 2026
 16:20:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026202313.63122-1-sidchintamaneni@gmail.com>
 <20261026202313.63122-3-sidchintamaneni@gmail.com> <CAGsJ_4zGmtvOApjFH_-V9z_zNWWQnrBX9q0_iWtbqzENCetfgw@mail.gmail.com>
 <CAE5sdEhVfFuiYySA0cNPTV6FjY3wnwccfLR7HA9vhVOF7DH+_g@mail.gmail.com>
In-Reply-To: <CAE5sdEhVfFuiYySA0cNPTV6FjY3wnwccfLR7HA9vhVOF7DH+_g@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 3 Nov 2026 08:20:29 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wHywBK9iYAzH8DY2KMFO-9oGa0f9N8aLUtzNNv6j3C5g@mail.gmail.com>
X-Gm-Features: AclHuK_7UQvjP-Xm2CLADiISuf35vQH0n9JvwhUN10k7Qal5QybgDLpeEf9nfV0
Message-ID: <CAGsJ_4wHywBK9iYAzH8DY2KMFO-9oGa0f9N8aLUtzNNv6j3C5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm: multi-gen LRU: remove get_lruvec()
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, david@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, ljs@kernel.org, 
	kasong@tencent.com, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	yuzhao@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	apais@microsoft.com, rlmenge@gmail.com, 
	Hardik Garg <hargar@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 7:35=E2=80=AFAM Siddharth Chintamaneni
<sidchintamaneni@gmail.com> wrote:
>
> On Mon, 2 Nov 2026 at 14:56, Barry Song <baohua@kernel.org> wrote:
> >
> > On Tue, Oct 27, 2026 at 4:23=E2=80=AFAM Siddharth Chintamaneni
> > <sidchintamaneni@gmail.com> wrote:
> > >
> > > get_lruvec() was originally introduced in commit ec1c86b25f4b ("mm:
> > > multi-gen LRU: groundwork") to guard against NULL NODE_DATA(nid) on
> > > uninitialized NUMA nodes (`return pgdat ? &pgdat->__lruvec : NULL;`).
> > > After commit 09f49dca570a ("mm: handle uninitialized numa nodes
> > > gracefully") and commit 931b6a8b36a2 ("mm: multi-gen LRU: remove NULL
> > > checks on NODE_DATA()"), that NULL check was removed, leaving
> > > get_lruvec() as a thin wrapper around mem_cgroup_lruvec().
> > >
> > > Remove get_lruvec() and call mem_cgroup_lruvec() directly at all call
> > > sites.
> > >
> > > Suggested-by: Barry Song <baohua@kernel.org>
> > > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> > > Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
> > > ---
> >
> > It's great to see the MGLRU-specific get_lruvec() gone. Thanks!
> > Hopefully, we can get rid of more MGLRU-specific code,
> > such as get_swappiness().
> >
>
> I just looked into removing get_swappiness() in favor of its LRU variant
> (sc_swappiness()). Do you mean moving the additional conditionals
> directly into the callsites?

Nop. In MGLRU, swappiness has values: 0, 1=E2=80=93200,
and 201.

With swappiness=3D0, MGLRU only reclaims file pages and
doesn't care about the hotness of anon pages.

With swappiness=3D201, MGLRU only reclaims anon pages and
doesn't care about the hotness of file pages.

In both cases, we allow cold/hot inversions in
inc_min_seq(), which can help reduce CPU usage:

static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
{

        /* For file type, skip the check if swappiness is anon only */
        if (type && (swappiness =3D=3D SWAPPINESS_ANON_ONLY))
                goto done;

        /* For anon type, skip the check if swappiness is zero (file only) =
*/
        if (!type && !swappiness)
                goto done;
       ...
}

Then we could have cases where swappiness is 1 ~ 200, but
we still cannot reclaim anon due to:

1. Swap is full, or the memcg's swap quota is exhausted.

2. The allocation uses GFP_NOIO, but the swap cache is low
[1].

So right now, we have to hack get_swappiness() to return 0
to ensure that reclaim only happens on file pages, or we at
least need to hack reclamation path to use swappiness=3D0.

This is quite bad, as it can cause cold/hot inversions for
anon pages. I believe this is already a bug in the current
get_swappiness() implementation when swap is full.

Ideally, swappiness values from 1 to 200 and the reclaimable
type should be orthogonal; they should not be coupled.

In other words, we shouldn't need to force swappiness=3D0 to
reclaim only file pages. If swappiness is set to 60, it
should remain 60 across all MGLRU reclaim paths. The
reclaimable type should be handled separately, without
forcing swappiness to 0 and introducing confusion and bugs.

[1] https://lore.kernel.org/linux-mm/179248830836.1744016.84242178112866169=
19.noio-mglru-rfc-v2@bytedance.com/

Best,
Barry
