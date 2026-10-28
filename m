Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793222573;
	b=kJZ2IrXZLmcIrDFRkP1GnC+Si9Yoq2REaZESp/5IdPiSl8PFTLAdzaIqbu3AnMBpk9+J
	 b5on21ger8GnexZyZgWM/GaAAECW2mr5OkYl2UfxMfJ8nu3oi9x+5jnPkqpCQJzvVQhw9
	 9Fjb45Zs6tQzYP2rh7OM1a86CURpTlY0OU35jDI9S6zvUa7L3ChzhgyAODYtRRIAh/6pC
	 j8znV21KQytEa9vR5NNKCcPGw+/V6Z5VRR8ZfEIJN05I0QufADL4z1J2KZFvAutwD9EJd
	 KPAt88SnvWvFQbBrNhSt3/O7v9kgej91XC/ZfSSMbzIkK8Xn4RY+dQ88nzSGFeYUM5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=H9OWahcyc0RtO0+EeUD26bkvPuyjvUzZOmtjTnKMJz4=;
	b=obwDHYqKx0HlcCIWM2adFp6536mFFahuwI6HSDzBcj5nSbUdp83exjxZZkkbqWFodFD3
	 LJ/OBjtW6ni4JdiKvEfv3hRjhX8O5dYLnffYYA+wPz5otDygtHJFcC1psDo2taqo1pGva
	 ZWQb3Rq01EjlnrYPLbyKzw8fjo740xjRgSDuo+rSMROaKgkAMQdoHPMbTrcViUvXOlSGh
	 e9y+rOZmuSkkWFH/zcyGRHEYIixcUtsMqgjIwKfAelISv0+vwdZfF95Q7oxjOr3LpkRXN
	 bsqablaryPNAKvi3kyS/gMKOf9KxO7VVksmjbuYCNTF9+GeVONbn4IPiI3EKc9c/rjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BdNpiMdS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120CE606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 120CE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BdNpiMdS
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20d7a8984so5165e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793222571; cv=none;
        d=google.com; s=arc-20260327;
        b=cxCsAgh2mjzfzkxkypg4EUcrzIfN5nkunzi8goFJn0301RpxxQR9d2BZPK0kaC3nhy
         Z3jDJ1YChufKcBxujmrFtlVEX6vIhxrz95HW+Xd6g+2ZN0EnwDcqGzz4Ph+VLu8kxu/i
         rwpoZYOsSqDxKdOVfzz4We3FCh6qpe5fsu89fGULw8YLiam7ghED7rKSJB4nyTUJd1ML
         bkQrt/sGYO+p95T4Ktc3fF2ZkN8vNzFFP/QPinCieOR9xGzsMsgEGOoLz7v47fv7XE0w
         xY6S+hcV2qRL7oBSntSvLtzaEY/M+mIpf4aCx1GYECki9keFctAfZosTBwkZEAy2WQMO
         W4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H9OWahcyc0RtO0+EeUD26bkvPuyjvUzZOmtjTnKMJz4=;
        fh=8yzauhv7Hl6HNFIBLs7YpRjVkHe49n002/xdXRN6Hz8=;
        b=fMs0tdIrxLL9dIeckG8RctKWhmFcce9gaTOINNzUlMLSvO5Kkgu4mG2TnQxMlN59lO
         joc5lkXmKnULjQrc19xNvv1o7q4pZw1bgqpEekwonm26y+0VHW/7vqzTdgPHMyDez36L
         oortKkg/bIKVVZj9qsPTs7eDvdXf60c5MXpJx4qU5DnitfyYjUJ6AKpO1Mvruj9eqwTF
         aqJvnPb3XhvPOb1ZIiLtNyUW9BOwM3pIQvzIBvKxRuuHNfahgxKKfr14C1vYNUIEaJV7
         hvJAvNEjcf9WVxJhG/RsAzWW5dMh8luxbicr3gORJ8IdslszNngO3iUodIHNqBSzeDlm
         C3dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793222571; x=1793827371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H9OWahcyc0RtO0+EeUD26bkvPuyjvUzZOmtjTnKMJz4=;
        b=BdNpiMdSCff2liQ8tiUGDfLBx2qXWrVA+PVPjmF/gUh6+AQ6ARYk6zGtN2RDjM12Kj
         tIv1KztstgoyrA910VMkmt94SokmjkeDp9gLkyXR3FzhenIwJ1SHYMhws0/gUOjjPw3h
         rr9YslNsq0hPwRxAUKG5HBPou5uZcM7MfwBEPWRgIdx//15NmzTabuUB2/D72zSoAbOS
         QMKlP9MDnNezExJwNAH04+y+MtLnvBXEqrNDrYRdMB3OXs0rQWcK7IRGecI5nxAwgPwg
         fKPLd9qt6W+jsh4IbfXjTdfrH0SuaHTq4UdkBUwRWZ0No43M3RMCwxJpHoAmsmReBPZ4
         B9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222571; x=1793827371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9OWahcyc0RtO0+EeUD26bkvPuyjvUzZOmtjTnKMJz4=;
        b=1Pe0gcAoTe2r4HFUerCORIE5+xq74hZrZPaIpDgWt7Ec7KelrPklGpcpgGQ8WAY2A3
         IAcUdlaNfoHTfN+DBOna7FULBe4RV1kBTYF1equmYZkpL/pTJ0RSsAqQB2jnr3Fmry36
         R+FCmTope6AsxPm1eOesXiFA6PgtSX2F99ZkmO4dVLJw98QmGav9joEQbkkRhIuAoCBI
         +A2h1ZVjRgVCNEEvia4ufrk4kkK43x1oMeTQBFM7iOmSt6t0tW7Nc3HiiRNFvp3CVFMR
         15g4YMHtqWDNvOn08X7w86tQ+BZtvQY5I/Zc7ab8LDwM8lO8qD4knQCw+cJ9ya/EiAIn
         6k7Q==
X-Forwarded-Encrypted: i=1; AKwUvBydTaiQelnyDbPx8/FCORiTlx6BoEtOWt/ukpsbMX5ezf3acCM7YZZLpuHmmiDQz2ChvHyHftaD42qC5vE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN4eDMG2W7Ipom4sd31Q4zXoUwUAAn9aooIxeK4g799OmUFC/J
	Y+gZFDtvtPAR4+7+oBt5kuxHt0pT6oyoCVCxWxU2cPuEdOSnGQi7G8QrASynMPonKG+XZykLxZQ
	T4Fy5EjMfzT8Tb4PSg7QnRzt+If8MYhdlw9ubU4PX
X-Gm-Gg: AYBFou2MmQEunzaKnjWtfQYxYTZv2iVUTuIK/LUOy9PP82fKsvmiRS3bAxELAJIZnHY
	y2yWxFIKJRl+YnqRH/+hEaYURrzvYn+ArpXA9mmCEp93aZaXYVX9s3wu9m5GecPBujX8QRF2eMW
	4yZP012U0ZqQueDpikLAyhKvieKYxpjcgfIRHwBYzNEr6O+nVwe1tpR6VH3jJmCNod2/+DDyGCO
	Yw/9y8VjQttnbWpd18iSCtyRXNyPyzQGpclgDoCHGHmHxZQohHEsdiaw5s8GpnbkYIdGXO0aKSr
	P+H9AMDkqOi3NgPPg+6wdpXB2rQiiK2AkLCOBO8gv6USTV7S7qmpF/JEtocR0Fdakm+6g85onUS
	8DC7pIV+5ugDaFoXgyq38dsk7epsueZixxW71FKotRwvccjQ20U0P46il7pbsLCswcA/ce1cK3g
	mgGxuwxIs0bQS+AEv99bWksgg=
X-Received: by 2002:a05:600c:26c8:b0:4a3:5de0:19ec with SMTP id
 5b1f17b1804b1-4aab692b046mr61845e9.9.1793222571076; Wed, 28 Oct 2026 14:22:51
 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028010611.3929937-1-tjmercier@google.com>
 <20261028010611.3929937-3-tjmercier@google.com> <auHMXBwnwuRwHLmo@KASONG-MC4> <CAGsJ_4zuGRjH+=1JxH4BYEC-vJumKjkhXPse0jW_nKEzQXXVmg@mail.gmail.com>
In-Reply-To: <CAGsJ_4zuGRjH+=1JxH4BYEC-vJumKjkhXPse0jW_nKEzQXXVmg@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 28 Oct 2026 14:22:38 -0700
X-Gm-Features: AclHuK-BDrgLvfZN_Z6mj4D7H_QyFDZWiVpmhu9KpmL6zRb0X5M1HcHjt7g6ziM
Message-ID: <CABdmKX1PvZjnJkqD48_Pb64Je_oZVO3F-oaxMsBYzHmY-GjbDQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/mglru: stop rotating offlined memcgs to the old generation
To: Barry Song <baohua@kernel.org>
Cc: Kairui Song <ryncsn@gmail.com>, roman.gushchin@linux.dev, muchun.song@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 1:57=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Wed, Oct 28, 2026 at 6:43=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > On Tue, Oct 27, 2026 at 06:06:06PM +0800, T.J. Mercier wrote:
> > > lru_gen_offline_memcg() moves an offlining memcg to the head of the o=
ld
> > > generation of the memcg LRU (MEMCG_LRU_OLD), so that global reclaim
> > > visits it first and evicts the folios it left behind.
> > >
> > > Since commit f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of
> > > dying memory cgroup for LRU folios"), those folios are reparented to =
the
> > > parent before lru_gen_offline_memcg() runs, and nothing can be added
> > > back to the offlined memcg's lruvec afterwards. Putting an empty
> > > offlined memcg at the head of the old generation no longer serves any
> > > purpose and only delays reclaim from the memcgs that still have memor=
y
> > > due to additional shrink_many() iteration.
> > >
> > > Remove lru_gen_offline_memcg(), so that an offlined memcg is rotated
> > > like any other memcg below the reclaimable size threshold until
> > > lru_gen_release_memcg() takes it off the memcg LRU. MEMCG_LRU_OLD has=
 no
> > > other user, so remove the op and update the memcg LRU comment as well=
.
> > >
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > ---
> > >  Documentation/mm/multigen_lru.rst |  4 +---
> > >  include/linux/mmzone.h            | 14 +++-----------
> > >  mm/memcontrol.c                   |  1 -
> > >  mm/vmscan.c                       | 20 +-------------------
> > >  4 files changed, 5 insertions(+), 34 deletions(-)
> > >
> >
> > ...
> >
> > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > index 636152d8c94d..45a2c1021f4f 100644
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -4538,7 +4538,6 @@ bool lru_gen_look_around(struct page_vma_mapped=
_walk *pvmw, unsigned int nr)
> > >  enum {
> > >       MEMCG_LRU_NOP,
> > >       MEMCG_LRU_TAIL,
> > > -     MEMCG_LRU_OLD,
> > >       MEMCG_LRU_YOUNG,
> > >  };
> >
> > I think there could be other usage of this LRU_OLD macro, but indeed
> > offline is the only user currently, removing it is cleaner.
>
> I'm imagining an Android use case where, after LMKD or similar
> userspace killers implemented by various OEMs kill an application,
> we may want to prioritize reclaiming its memory by making it more
> likely to be scanned and reclaimed, while the killed application's
> memcg still exists - not offlined.

I think it's an idea worth investigating. I had a similar idea which
is proactive instead of depending on reclaim hints. The code is behind
a currently inactive flag - it runs memory.reclaim on an application
cgroup before offlining it (so no zombie or reparenting), but I
haven't had time to properly test it yet.
https://cs.android.com/android/platform/superproject/+/android-latest-relea=
se:system/core/libprocessgroup/include_platform/processgroup/processgroup_p=
latform.h;drc=3D2ed7b05ab42dd67391ad2819b0ee399d89128ead;l=3D33-34

> Similarly, a foreground application might benefit from a lower
> chance of being scanned and reclaimed. This suggests that Android
> background-to-foreground transitions, or LMKD itself, could
> potentially leverage the reordering of memcg LRUs.

We are planning to use memory.low/min for foreground protection.

> But anyway, this is not a reason to keep
> MEMCG_LRU_OLD for now.
>
> >
> > And everything looks good to me, thanks!
> >
> > Reviewed-by: Kairui Song <kasong@tencent.com>
>
> +1
>
> Reviewed-by: Barry Song <baohua@kernel.org>

Thanks!
