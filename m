Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893128;
	b=0A0da0flefNymL5zX4MtFuuMKj2kgrL7sC+qYrreyj7E5HfaXueWPHLAewC9JueIVhTF
	 3xLx98F1pBbEJJYC5DdH4yru5KInZQifw9VHHG6FLHsvm6OXdzac6KTK5DXARgYn8aIa+
	 oSPDqVhaWXKHSRTHu6mZbebzDa7RROporz+44fUA2IcIOvhMxe5dQTheQbP2AdQgGz+dI
	 befqnuOw050FfLCS4mhBHzAQtIw4kZJkm54nuuq4JhOrlblqJAfW4Z4LSuSh3xclGrXID
	 ZGe2NRYbFV4Wgo1KuC+m9/W3OXts9KB6HV84CRrOfRNfpnEsHSuWY7lit1AG+hrcgsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893128;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0ZRMOu7q8zj8hzZXCiqSBsOFqMESxoThKf7jqYV+cxg=;
	b=SjmboVNPTJOyyfChQpYYcM4Re1yhKUjG137scTr2QCtb7WuVNjzcomkr1bnxJn9VId4/
	 aEYe7iO529HU68Onwc2W4r6vAfkuTpqFWfC2t7RtDRJuUh2Vfl2EFqDnKoEAcU0ASvh10
	 +tbstJKnSHPeWVDpqPO2fzqWnb2pOUX6tdSnfIc+tCnH2OhPzncQEUvx5k7YTMTtDBpQK
	 84db0T2q68wHX4htBU0XMyCiQ/kvfk5MjsLJepsk++KCDYMDA3aanLkZeP2YjSEw0zBAz
	 ScNtYZ3omJLHQMrDD5jZkn8mBhQDfqQTdwaOa6Ekk8PD/2N2f7CGYbC7UUtdkYnrbQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eHTnPPRl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF40D606A336
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eHTnPPRl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A58A1F00A21
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793893127;
	bh=0ZRMOu7q8zj8hzZXCiqSBsOFqMESxoThKf7jqYV+cxg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eHTnPPRlc0IH7Q8u3jaVpzNg12W4eRz/VwrILsZzaVscg0JSbM7yFkdkvamrOilYv
	 PRIvX/sqpEDayj+Lk93vQDhjPTOAxYuegaE4P94ccLX3a2yR6vMwleDpCiMEZRbaq+
	 eot6JHGw3a6ueS2ysJI8vNzq/73IwWSIndFB4A75LOh0NlWwZtnMC0cII1bMHcA/HA
	 e2RmPVM21KYVjaZlRGD7bbnFh3EzkFwlFlXURm3gCqQkcynaax6Ya4QpYxJvMh+YJJ
	 GCwZbt+jCS1M74E1L5AFBUcH5Noi6xZ+gp8Vk/Gqbu5WYrIkfVNbPow5hRpUT8lahV
	 YUZWyhqKMB0Dw==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so1721857a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:38:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy8r+2shfYKZXjf+5gn8rN1XS4k5zWn8mstlfR21FdqToRa+uvaNDaNC1B5dnUxl8w4YlwxHCTVu1cH4Yc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pMvopx/OEafZH/iSW0Y8rcc+ylS0f1ML7xyx8OxLoHDjWussj
	hEWaI2b72RqB+0tcdVtEmhQTJ8pdQB2lTCE4AUEZIL2RpNEj2me8FEH7jEBGq0THG/P6y+3BmqE
	ELgjHJR4lCWXgQvUebJtNJs2bHeWYM9Q=
X-Received: by 2002:a17:907:5c5:b0:c49:df95:f0dc with SMTP id
 a640c23a62f3a-c4ca7b1b763mr1566645766b.19.1793893126389; Thu, 05 Nov 2026
 07:38:46 -0800 (PST)
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
 <18e529a5ab0738f7.3137322e32332e3235332e313736.873cb.0000sendgmr@google.com> <CAKEwX=OUt4=wqDLiPvYuiTnkpuZYnszkuNQScNR93hHhVPRRGA@mail.gmail.com>
In-Reply-To: <CAKEwX=OUt4=wqDLiPvYuiTnkpuZYnszkuNQScNR93hHhVPRRGA@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 5 Nov 2026 07:38:35 -0800
X-Gmail-Original-Message-ID: <CAO9r8zMMGem-LTJQseT5xSSBjfr3UX2gzG_ftpw6+KF8m9v5yw@mail.gmail.com>
X-Gm-Features: AclHuK9v1LUqQa8y4F5WwBt7lgtm31VOg2z9IkfQynsl03ZvTXjiDfaCGV4M1pA
Message-ID: <CAO9r8zMMGem-LTJQseT5xSSBjfr3UX2gzG_ftpw6+KF8m9v5yw@mail.gmail.com>
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

On Thu, Nov 5, 2026 at 7:08=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote:
>
> On Thu, Nov 5, 2026 at 6:36=E2=80=AFAM Chris Wiseman <chriswiseman@google=
.com> wrote:
> >
> > On Wed, Nov 4, 2026 at 9:05 PM Sergey Senozhatsky <senozhatsky@chromium=
.org> wrote:
> > >
> > > On (26/11/05 09:10), Xueyuan Chen wrote:
> > > [..]
> > > > > SGTM, but I'll let Sergey chime in!
> > > >
> > > > Thanks, Nhat and Chris, for the discussion.
> > > >
> > > > If Sergey has no objections, I'd be happy to send a follow-up serie=
s
> > > > to make the shrinker configurable and add the unlocked pre-check as
> > > > Nhat suggested.
> > >
> > > Thanks.  Sounds like you and Chris will to have "Rock-Paper-Scissors"
> > > to determine who sends a oatch ;)  Just joking, let's first figure
> > > out how exactly we want that zsmalloc-shrinker thing to behave wrt
> > > zswap expectations.
> >
> > Haha, Xueyuan is welcome to send the patches!
> >
> > Dumb question on the zswap side - aren't the zswap shrinker and the
> > zsmalloc shrinker independent?  Even if zswap's shrinker is turned off
> > at runtime, normal swap-ins still free slots and leave fragmentation
> > behind, and unlike zram, zswap doesn't have a manual sysfs compact knob=
.
> > Would it be simpler to just keep CONFIG_ZSMALLOC_SHRINKER as its own
> > standalone config rather than tying it to zswap's runtime knob?
>
> Yeah those 2 shrinkers are independent! I think we should just let
> ZSMALLOC_SHRINKER default to the value of ZSWAP_DEFAULT_ON.
> zswap_load() (i.e zswap-in) by itself is enough to create
> fragmentation. The zswap shrinker is just another trigger (and it's
> also irrelevant if zswap is disabled anyway).

If zram doesn't benefit from zsmalloc shrinker, especially during
reclaim, I wonder how much zswap benefits. AFAICT, it was hooked up
before zsmalloc was hooked into compaction, and compaction seems like
the right place to do this although it technically is freeing pages
from the page allocator's perspective.

I wonder if this is something we can collect some data about, and
maybe kill it off instead of putting off behind a config option. If
hooking it into compaction is not enough, maybe we should add a
similar interface in zswap to do proactive pool compaction from
userspace, or maybe move the interface to zsmalloc itself.

>
> How do you feel about this, folks?
