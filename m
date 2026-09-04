Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212FA2192F9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488927; cv=none; b=UzxLSOFlU7kyS39k1XqLz8/gT4LqsSJ3GgkjlQx9ZGfrKmjyRfqDmagslXkFCq6lDRE0eljDlzzJPPEW1dheIcrHJhXI45xRYXVOUStNlmqV3lcth76mDH7WZk3jP6oSSCTd7zBZmRfPdKBNFjxVOgrtXAa1rs9+xuT9kZ29gPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488927; c=relaxed/simple;
	bh=pMidwbqagINCzuCxtCzFuvJEmibCLAdiVjz+TrjRCNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TH7sub19QvSy2j5+1WCXpWjkD3XD10rcE71/EYlrX7m6WmQhW074KUuLxK4OfajHyj34Q6c6+sZ6bX8Ap/StikfUr4KE7G4YKpZvcLM65iYEpYd3qhuedV1jUrhTvAzuEqcpbGQvQafFW8k68lA6EKXfve0URe8ZMqSi1+MV76o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W685DOab; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W685DOab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2B81F00A3E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788488925;
	bh=gr/6gU2VLqIj9f6Ya7EWpzVWAPYr+S/Edep5AAlZVio=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W685DOabWd/Nj4w3g1t8QDeE6tM+nMQkCwxekQly237o9ZnngYL2zQtKJDVHnufIF
	 HMJFRkCkHqwizQm4TzrCFnp1tJLPlN+3yWRtob4dRutXiW67pIosVrKTe3GeIl2daw
	 JhXfobBTaNK1QnidzPE9RPqgarZiNnlYQ4AgpKJaL1XnspxahflmXB9Ija484h8ODe
	 Td/SmbrpyH5Nx5WiyvYUHl5hS3ILSLJKu9x3NsQuEhoUR6YgJaFGjRSo9/86uJH48S
	 rjAndyEKd0orJKRXqb7CWF8kFdO1GXdKSFbgKb7zGMNsQfafdcVvFEU1D1vPrcWi1n
	 dk/PHRTaHQrqQ==
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-754ac74c495so176436137.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:28:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw367q9p+3jNu0Xey0ONi5i3fuTK5CAdPNZOJUWaeeXXD+cJHSm5vDI8BvZ+G5MTv7Eow3kfto3eY9K/4U=@vger.kernel.org
X-Gm-Message-State: AFuF++npy0Dxf2Kg9L13hXHn+5r0h0BRrUAe0rFhbaKK+1Xhdq3qMJTq
	6SM49LI08T7yqwchojsAasyE0ea2UJNsHe/Nuhn2o/akIxg5XkFGCxa4rKOE9ongPqYhq6O57BD
	6l08A07PqyeMxq26iF72oDEMTLJkH5OY=
X-Received: by 2002:a05:6102:5814:b0:786:b28e:f980 with SMTP id
 ada2fe7eead31-78a4a99f7c6mr721213137.10.1788488925089; Thu, 03 Sep 2026
 19:28:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901232421.40157-1-baohua@kernel.org> <20260901232421.40157-7-baohua@kernel.org>
 <c1992315-8e2a-45eb-a042-29f1f1725f76@linux.alibaba.com>
In-Reply-To: <c1992315-8e2a-45eb-a042-29f1f1725f76@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 4 Sep 2026 10:28:33 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4ybQbbxxyz5EU29cckoQQpm4PrQi3W2Bu3Mb22UCjFBrQ@mail.gmail.com>
X-Gm-Features: AcwNN1XlTuf33SqEleYaxTuUb-aK9RfjrAN952awxM3DqUWGAJMxHfNaoPeCQ4k
Message-ID: <CAGsJ_4ybQbbxxyz5EU29cckoQQpm4PrQi3W2Bu3Mb22UCjFBrQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] mm/mglru: move folios from oldest gen to
 second-oldest gen from head to tail
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baoquan.he@linux.dev, chenridong@xiaomi.com, david@kernel.org, 
	hannes@cmpxchg.org, kasong@tencent.com, lianux.mm@gmail.com, 
	linux-kernel@vger.kernel.org, ljs@kernel.org, lyugaofei@xiaomi.com, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	stevensd@chromium.org, wangzicheng@honor.com, weixugc@google.com, 
	yuanchu@google.com, zhangbo56@xiaomi.com, 
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 9:53=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 9/2/26 7:24 AM, Barry Song (Xiaomi) wrote:
> > For reclamation, it makes sense to reclaim folios from tail to
> > head, as folios near the head are relatively hot. However, when
> > moving folios from the oldest generation to the second-oldest
> > generation, using the tail-to-head order would effectively cause
> > a cold/hot inversion.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Reviewed-by: Baoquan He <baoquan.he@linux.dev>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > Reviewed-by: Lian Wang <lianux.mm@gmail.com>
> > ---
> >   mm/vmscan.c | 23 +++++++++++++++++++++--
> >   1 file changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 1907a946840d..76dfa9575852 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -192,11 +192,27 @@ static inline void prefetchw_prev_lru_folio(struc=
t folio *folio,
> >               prefetchw(&prev->flags);
> >       }
> >   }
> > +
> > +static inline void prefetchw_next_lru_folio(struct folio *folio,
> > +             struct list_head *base)
> > +{
> > +     if (folio->lru.next !=3D base) {
> > +             struct folio *next;
> > +
> > +             next =3D list_entry(folio->lru.next, struct folio, lru);
> > +             prefetchw(&next->flags);
> > +     }
> > +}
>
> You did not mention in the commit message why this prefetch was added.
> Just curious, does it really help performance?

Hi Baolin,

Thanks for your review.

I had this discussion with Kairui and thought it might be
useful to keep it here:

https://lore.kernel.org/linux-mm/CAMgjq7AJnWGGH=3DFNuV7ynXjbffktsDRgdcyagLU=
JUwJf1ukaJQ@mail.gmail.com/

It might be arch-dependent. Some architectures could benefit
significantly from prefetching, while others might see little to
no impact.

for my x86 test, it has very slight improvement:

***** no-prefetch:

agetest:
...
gen 100:    2.421 ms
gen 101:    2.424 ms
gen 102:    2.420 ms
gen 103:    2.413 ms

Total:   248.418 ms
Average: 2.460 ms

agetest:
...
gen 100:    2.393 ms
gen 101:    2.396 ms
gen 102:    2.395 ms
gen 103:    2.392 ms

Total:   245.627 ms
Average: 2.432 ms

agetest:
...
gen 100:    2.433 ms
gen 101:    2.427 ms
gen 102:    2.432 ms
gen 103:    2.450 ms

Total:   249.186 ms
Average: 2.467 ms

**** has-prefetch:

agetest:
....
gen 100:    2.314 ms
gen 101:    2.310 ms
gen 102:    2.321 ms
gen 103:    2.303 ms

Total:   237.619 ms
Average: 2.353 ms

agetest:
gen 100:    2.342 ms
gen 101:    2.343 ms
gen 102:    2.339 ms
gen 103:    2.335 ms

Total:   239.929 ms
Average: 2.376 ms

agetest:

gen 100:    2.344 ms
gen 101:    2.347 ms
gen 102:    2.352 ms
gen 103:    2.348 ms

Total:   241.188 ms
Average: 2.388 ms

Basically, it=E2=80=99s 2.3xx vs. 2.4xx, lower is better.

Best Regards
Barry
