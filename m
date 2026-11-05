Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893204;
	b=YFWpnYdOT9Fxi2J2b4ywOgfHT/VzzS+Qiggx71LEbivO/+ujliiJlhHptBGmZDFxV8DI
	 7VREjvayBh7WFRBEW0ICZnyqdwFk83KCTIAMLPjrmd4Yh5NVrYjkSxK1tVPMBIs03rkxI
	 +137/XwWvIqCcbNbMkMM2MbUT8nwJeUijDQ/+2nlhD0CZnGTwY6GcRJQWL7K3oayKlQXy
	 xy8+s/uWRI7Hk7BItuNsHeUe59nzdKcATawsIxNMZ/s/wfK7lbfDW/oljASaIQaNqRbRG
	 xaB4fSm3qXDFhNQUDOQ5nJLZ9uWOKhmuYVMii0N3Mla79jf7OwIzur4nFP9ZctwTrgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893204;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PDZV0+pjHqmTjjQUQ4uC9YSnJ7Vm1jvBfF5OI0JOMto=;
	b=LcxO8ivCuby9huSjc8Z+Rj4wyvfB6FHyMfKBhls9HkO+L60wdn84u5yR7OKdj3/fEwaC
	 2XKKLNM4XHgpQyBTMECzM1Q1032MjmccAyUp6VbDSqp+r55LNEnnFigxdAbugHNDECigj
	 P/k+cTptOna3oUEuXC3L2J4L1m9/lELw9xH9w2C0Kb7wXjI1McDJjxGxw15RKN527uzUL
	 gj6NOxMrX2nv84n56E1C3EYNC29QaB+aYVagyKcLvgl1PqELhTbkC0fwzIpWlYA4Cyxow
	 uzezcxGguhq13VJQMe4L0Rf5FMdnBxmN0zdg4vcj5OMj5bIwRAb8zZdABz/XjNeFQRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EqgbKL+C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD75606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EqgbKL+C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF381F00919
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793893203;
	bh=PDZV0+pjHqmTjjQUQ4uC9YSnJ7Vm1jvBfF5OI0JOMto=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EqgbKL+C5NvEF8nHOZcg7HYI6aeL/KWezyfGE9tktcf6hCt/fZBzlmpHSzhGpqKTA
	 1Bp7+DHi1qlvjwdiLqtkslWRSj7IRkXqEU5FF4UDEqh72a5AZ9VK2IpnMJa/BqFDJQ
	 0YyM+nmtaIqfaqc/VTFjuCGeZMoqLp9EQlC0N9kYC/2TT8uwrGpX3XmIrQ+zrzgfBT
	 PyuHKNJ9Pz6091Y0Mz2Wv5WdjdI3yk2qWu7xU0DvRo/JQ8nBzMzTD/MF6ZYWXWUQpk
	 JJWjtgQQxqcA1jIAW3nP4e+dnq+0gjyOOoy9S6/NmfQ3h6Oy4bUdBi3gTPQ5Dreh8J
	 K1uOZb7LV23Mg==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso30675266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:40:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzR9KfSzvCUAucRVifPB3V0QK23O6VNfI1MTJzpnvBPk9nInc2Vu6zrKfKmpljL1aQ8JGCgnP85qp9PcFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MFTaH++IVcMZoU0luoJEbSM82ni/4XRaI5oUPIIiByJwHfG0d
	AaJvQDKg0XI3cl2FbixrWGcSLpv0xrbczU8Z3JjdeLJBSafGjylNDBzcbpfld8Wu7MHdjYmSRqa
	j083JHV5hv0ItVfh7WcVquokwsJdEngs=
X-Received: by 2002:a17:906:9fd0:b0:c40:80eb:c54e with SMTP id
 a640c23a62f3a-c4d3449c0c7mr1350366b.4.1793893202865; Thu, 05 Nov 2026
 07:40:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com> <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
 <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
 <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
 <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
 <179384102494.19062.12740032892044628762.b4-reply@b4> <auwOBaRtM9p_Wxfx@google.com>
 <18e529a5ab0738f7.3137322e32332e3235332e313736.873cb.0000sendgmr@google.com>
 <CAKEwX=OUt4=wqDLiPvYuiTnkpuZYnszkuNQScNR93hHhVPRRGA@mail.gmail.com> <CAO9r8zMMGem-LTJQseT5xSSBjfr3UX2gzG_ftpw6+KF8m9v5yw@mail.gmail.com>
In-Reply-To: <CAO9r8zMMGem-LTJQseT5xSSBjfr3UX2gzG_ftpw6+KF8m9v5yw@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 5 Nov 2026 07:39:50 -0800
X-Gmail-Original-Message-ID: <CAO9r8zOY1E7gCYnJZAfKvyHcbj8e2WVuXMqsaPGPsKR4-9itsg@mail.gmail.com>
X-Gm-Features: AclHuK-nHEy3W7VEoyAO170_A3kmjjHwVOoZaVi1Y45j7hC5yeix6KXpEhEkBoE
Message-ID: <CAO9r8zOY1E7gCYnJZAfKvyHcbj8e2WVuXMqsaPGPsKR4-9itsg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction budget-aware
To: Nhat Pham <nphamcs@gmail.com>
Cc: Chris Wiseman <chriswiseman@google.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Xueyuan Chen <xueyuan.chen21@gmail.com>, Xueyuan Chen <xueyuan.chen@vivo.com>, 
	Barry Song <baohua@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 7:38=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrote=
:
>
> On Thu, Nov 5, 2026 at 7:08=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
> >
> > On Thu, Nov 5, 2026 at 6:36=E2=80=AFAM Chris Wiseman <chriswiseman@goog=
le.com> wrote:
> > >
> > > On Wed, Nov 4, 2026 at 9:05 PM Sergey Senozhatsky <senozhatsky@chromi=
um.org> wrote:
> > > >
> > > > On (26/11/05 09:10), Xueyuan Chen wrote:
> > > > [..]
> > > > > > SGTM, but I'll let Sergey chime in!
> > > > >
> > > > > Thanks, Nhat and Chris, for the discussion.
> > > > >
> > > > > If Sergey has no objections, I'd be happy to send a follow-up ser=
ies
> > > > > to make the shrinker configurable and add the unlocked pre-check =
as
> > > > > Nhat suggested.
> > > >
> > > > Thanks.  Sounds like you and Chris will to have "Rock-Paper-Scissor=
s"
> > > > to determine who sends a oatch ;)  Just joking, let's first figure
> > > > out how exactly we want that zsmalloc-shrinker thing to behave wrt
> > > > zswap expectations.
> > >
> > > Haha, Xueyuan is welcome to send the patches!
> > >
> > > Dumb question on the zswap side - aren't the zswap shrinker and the
> > > zsmalloc shrinker independent?  Even if zswap's shrinker is turned of=
f
> > > at runtime, normal swap-ins still free slots and leave fragmentation
> > > behind, and unlike zram, zswap doesn't have a manual sysfs compact kn=
ob.
> > > Would it be simpler to just keep CONFIG_ZSMALLOC_SHRINKER as its own
> > > standalone config rather than tying it to zswap's runtime knob?
> >
> > Yeah those 2 shrinkers are independent! I think we should just let
> > ZSMALLOC_SHRINKER default to the value of ZSWAP_DEFAULT_ON.
> > zswap_load() (i.e zswap-in) by itself is enough to create
> > fragmentation. The zswap shrinker is just another trigger (and it's
> > also irrelevant if zswap is disabled anyway).
>
> If zram doesn't benefit from zsmalloc shrinker, especially during
> reclaim, I wonder how much zswap benefits. AFAICT, it was hooked up
> before zsmalloc was hooked into compaction, and compaction seems like
> the right place to do this although it technically is freeing pages
> from the page allocator's perspective.
>
> I wonder if this is something we can collect some data about, and
> maybe kill it off instead of putting off behind a config option. If
> hooking it into compaction is not enough, maybe we should add a
> similar interface in zswap to do proactive pool compaction from
> userspace, or maybe move the interface to zsmalloc itself.

Never mind the compaction argument, this is just to move zsmalloc
pages around, it doesn't help with internal fragmentation. -ENOCOFFEE.

I still think we should check if the zsmalloc shrinker actually helps
zswap or not tho!
