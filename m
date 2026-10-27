Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793122117;
	b=0RqpxcYzetbfohDn2NKDfucG3u31rEZ1X4adU497PHNfN8ZwW+spLmQI99JFGSIUSUsB
	 Obo/f/FUH7FqfiRyxaPCJOeXy3oWecfSF4BBtMdZf1bp1sECa/IPQdkG5JG4kXY0nJ/CF
	 0kKDHP3aHKfPflyaWrk1tGo6+PspjY0C8LzNZBt+EwpwioYOU989tkKTycfloGEGbAMhf
	 jPy8436Jh7wh6d4O45DlXcShYmctrR+Le5KVxJMhhr94JpekNLk/tZvOp8nO7rlBU93zf
	 Ss16s8XOhtKKtNs8Rh4UVcihi3+hGjTbAAWK7DGM5gNrqAuhmg29NMuiKGTwNxA0Gxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MWyXscpgq0mKENbth6U6G8hO/Fpg0qBlfyz578FuBms=;
	b=L3IZnZOaUHUsOI+s8uxQW6WZR+qSqI/Ek42l2ZRR/4riC0eDIdxwTOksTVRgi/wzr5bb
	 AwE1QaIfKJyMdBm+cUnL0b8x5wEVEtZG1cHH61WHBYevnGVrnMghPVAGbojB+pEDEZOr1
	 MjLOOT3WeWHzFtTa5Qz1zIjjl6qS8E8WHr0X4O3VuL7BogdiiPTnMSt1eziFBVUt06b4d
	 0mFlbUsV+xVgR3STRKjcBn6o6jdbAi4CKRrDSp6Q082iaCqNjG09ZrSJDzIg2wRB15nUS
	 tdlfNJgS6mRBWtnKALMR8j2TuFdLOvo7CL555qUaKniYNu1f8hezVqGAHRYUJpzdKMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UfJwrzbW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D6F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D6F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UfJwrzbW
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20d7a8984so1515e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793122115; cv=none;
        d=google.com; s=arc-20260327;
        b=q2BjheeDZ7uIpxbWKf0UmpByiqCi5nDgfXcVFnTp2hiK+7z18RPXiWypfarSqK/U/F
         vHq7aZCP8H8tAUgvQR6KUHREmlEYDdanh5c/nRsyT41yixRTuhiDbMJI7KulwPPbwL8Y
         7sPV+C8OaQ0TCZU1yIZqFYCxQO0wHi9d2RSe/UksyC+nigztVFCxaR4fip/G5V1FQka5
         Fq03FYglNXpbeATMtaFsARoDhKeQvjAjQDrIll+4TwR+bVGiHCpsgOryKikuXenRxRGK
         pFEremcRjz+PMn4lunZzZKq/CUM3n0lCIYNkI7IlYXRjVWtKQ/9EHH0XT6Zmd8/xSfDY
         bD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MWyXscpgq0mKENbth6U6G8hO/Fpg0qBlfyz578FuBms=;
        fh=ip+bqZa0lbahgYl6YJng1NVcZvn0piUDyS6KQOcpeqM=;
        b=HCluEIuW+Eyu1DnAqtz3x1dgNUJpO1wrEo3ZK6elZGc1qODDGkPDelY7IqC5ZxBhMv
         qxjASsO4mdxZtkTgTtkmRB7cI7u+Qdzv2KHQtqXxn5w44Mdqqfxj7Rfm9GWUeUEAXnFr
         jWmQJ1exJAAZmsabxByUu6CvYRQ5l8SXb5a5tL6i/57o29PNxiG2J3v3L6oR72lCwRv5
         xAaleeACHB/X1xuuXbYSxFWddlWbRY4e2UW7KGOOtp3n3xOGtw2Gf0tMpx0UsfQy+Jfx
         V1bHfagyHgrppTgatwsTeHHo78Uruv+VUh7kUfumGKmaRbvNozs5Hz1eemFyU3OSoPPK
         W6kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793122115; x=1793726915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MWyXscpgq0mKENbth6U6G8hO/Fpg0qBlfyz578FuBms=;
        b=UfJwrzbWe19olWOGWK9v9Tdy+n8MuTnu7Cpny2V9eunfRlSMAZIzGvtgPB0PzeHnHs
         jVkEovX+ZNVaIiuEm2UCvh7aEdPZ4yKMLydT6yk2SHzNWFp1asCzGTqJBL15ewsp+XJA
         PspYEXI3jBA0T9StwsqzgDI9SgdRFG2X+N9/4hDzAXFJZEuCr+PzNAlJUA1a3HCTqHhQ
         +mwqaQsv5Pj6PiCnXWAzky1ZxPK3utb/PcSVJ4OwobKu4h9yUMxVkx/ea/E467JSiQEL
         ix1iQ3yuVeRrs2b6OF8UxzH0CvL57o3dLvwgLdxrMxzV54KDcTj5LEGqOXNVL0bUaYWb
         W25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793122115; x=1793726915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWyXscpgq0mKENbth6U6G8hO/Fpg0qBlfyz578FuBms=;
        b=uO44Goh4PRW+1/z7CK2xSoxPFQLpJgP/trumL4yBpQH5NA9NLLvLE8KKFbfXqkPrJL
         LTjhdnNYssFRW7kKYwGP9kyB1oQ/6xC6JWk+9GQIO9CpV9JOU3Etaau1NLHDHGeSzqeH
         8mkkdFu904y226U/g8p2vUrAvmHpWXMMECGQ/0WVpnarz8d2jp1eI+pH5XY40UMiClIY
         kUdwEBiG58FJtn3KfwgNbGA8JPwAIvVF4uYLKySC3H3TrlmsSfxkad4UMPdJkZgRSOIh
         jGu1c7PVgy9sKsk9Ty105o9AR/W59yhnz3yqLnhmgZwco4qdj0ZTl2QeaOW3R/HE5xHP
         diSg==
X-Forwarded-Encrypted: i=1; AKwUvBz0Cg4gnBHOsCyinJK1Oll4tg9Lj8O4t/mBig3SWhSLHk+5TwfnfExmpKqOlaVNf7+U7kIB8Fw9GfBxlEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7sSs45OSnGc6W0StwJTWKibXGdb8F14n3NNXFjoywN3a0gfsi
	J6MbKYH+UktDy+fy6gMh6+jID4pSpGW3+xvnoSh/i6E1lzcsHNKHEHh5/+Z3UBzR0AkIWu4rNEf
	Ms41CrmglKXZLk5JdHtw6nfsrP1+t9wSXcplF6Z7A
X-Gm-Gg: AYBFou1xASWJAE8yO/o/cNo1TnjqCbCfILfST4CbKMgbOQ61bf6JcPCO2icvnU/ls62
	y9ZGqsIT/gnDf40XGXCMP5CXRcqoUS0vzNjVnIMa/48VPCTBbCwoNpi+e9M6Eh3D8JMxIjxfdRN
	Js6LzDDMBqdG8DeFrtJjb5gyyc+vpwH28IW8i7eKUADQO4Er8vnk/s+TWAWwd6rnKKcuZEHYZZ7
	MExycBptlW3K7GrcHboNozNEgOM9Gv5SOusLMcfZzXC7Vsz16Em/X3+9AYG4qxzR1hplvqyQT83
	RZvwellTHZGqueHtBImM9oGNANynob9/MF1c6aqD91PfIFbQlmSMMl5WeZE+kpw4rk6mXoDfiSt
	TuNQ9Je+2rgxsAsdxx/7GaSvGzVg90ffLVZEcrkBu5Rpdg9219Hf09aQ7Wp3GSqJBuxT/HPnakb
	E+ZX9qN7XoNuJkYw==
X-Received: by 2002:a05:600c:3049:b0:4a1:eccc:7807 with SMTP id
 5b1f17b1804b1-4a937e30731mr28445e9.8.1793122114845; Tue, 27 Oct 2026 10:28:34
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
References: <20261023222313.3979455-1-tjmercier@google.com>
 <at9U2HvyUP-iYOCt@tiehlicka> <CABdmKX1mLKEJNiecW+meJ=LB_Kb8-ieeWdZDd4T6rNR9gKuq_A@mail.gmail.com>
 <auBxqU34FQYauoQr@tiehlicka>
In-Reply-To: <auBxqU34FQYauoQr@tiehlicka>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 27 Oct 2026 10:28:22 -0700
X-Gm-Features: AclHuK-NAoFvZLQL5pNcy4EmaDv4m9SumnHLP9lwTJmOHtHQgmvKyUv42pTsi0E
Message-ID: <CABdmKX2Hua321nr9vR=Q7-Uu5N6e2JARtUe5RnC3JFu6aGRqhQ@mail.gmail.com>
Subject: Re: [PATCH] mm: memcontrol: fix NULL pointer deref in
 high_work_func() on dying memcg
To: Michal Hocko <mhocko@suse.com>
Cc: hannes@cmpxchg.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	muchun.song@linux.dev, zhengqi.arch@bytedance.com, akpm@linux-foundation.org, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 2:41=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Mon 26-10-26 11:01:51, T.J. Mercier wrote:
> > On Mon, Oct 26, 2026 at 6:25=E2=80=AFAM Michal Hocko <mhocko@suse.com> =
wrote:
> > >
> > > On Fri 23-10-26 15:23:13, T.J. Mercier wrote:
> > > [...]
> > > > ---
> > > >  mm/memcontrol.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > > > index a05d9a8baa1b..84f4a8fd4d16 100644
> > > > --- a/mm/memcontrol.c
> > > > +++ b/mm/memcontrol.c
> > > > @@ -2457,7 +2457,10 @@ static void high_work_func(struct work_struc=
t *work)
> > > >       struct mem_cgroup *memcg;
> > > >
> > > >       memcg =3D container_of(work, struct mem_cgroup, high_work);
> > > > +     if (!css_tryget_online(&memcg->css))
> > > > +             return;
> > > >       reclaim_high(memcg, MEMCG_CHARGE_BATCH, GFP_KERNEL);
> > > > +     css_put(&memcg->css);
> > > >  }
> > >
> > > OK.
> > >
> > > >  static void high_irq_work_func(struct irq_work *work)
> > > > @@ -4463,6 +4466,8 @@ static void mem_cgroup_css_offline(struct cgr=
oup_subsys_state *css)
> > > >
> > > >       page_counter_set_min(&memcg->memory, 0);
> > > >       page_counter_set_low(&memcg->memory, 0);
> > > > +     page_counter_set_high(&memcg->memory, PAGE_COUNTER_MAX);
> > > > +     page_counter_set_high(&memcg->swap, PAGE_COUNTER_MAX);
> > > >
> > > >       zswap_memcg_offline_cleanup(memcg);
> > >
> > > Should we simply disable_work_sync when the memcg is going to be
> > > released instead (mem_cgroup_css_released)? That should both prevent
> > > the run reclaim_high during the memcg shut down and and also avoid
> > > plaing with limits to work around.
> >
> > Hi Michal,
> >
> > Unfortunately that won't work for shrink_many() ->
> > !mem_cgroup_tryget() -> lru_gen_release_memcg() which can occur before
> > mem_cgroup_css_released() runs. (mem_cgroup_css_released() happens
> > through the cgroup_release_wq.)
>
> I do not follow. Could you explain why please?

Calling disable_work_sync in mem_cgroup_css_released() is too late. As
soon as the memcg refcount drops to 0, mem_cgroup_tryget() starts
failing, and lru_gen_release_memcg() can run.
mem_cgroup_css_released() runs async via css_release() ->
css_release_work_fn().

high_work_func() doesn't hold a memcg reference, so the memcg refcount
can hit 0 while high_work_func() is already running, or waiting to
run.

high_work_func()                    kswapd
reclaim_high(memcg)
 try_to_free_mem_cgroup_pages()
                                    <memcg refcount hits 0>
                                    shrink_many()
                                     mem_cgroup_tryget() fails
                                     lru_gen_release_memcg()
  shrink_lruvec()
   lru_gen_rotate_memcg()
    NULL pprev deref

... later, on cgroup_release_wq:
css_release_work_fn()
 mem_cgroup_css_released()
  disable_work_sync()   /* too late */

> > The high limit reset is also needed for targeting live ancestors above
> > the offlined child in try_charge_memcg(). Without the resets,
> > high_work is never attempted on them since it gets dropped when
> > attempted on the offlined child due to the first hunk, and
> > try_charge_memcg() breaks out of the loop.
>
> I must be missing something really obvious here because I really do not
> follow you here too. So we are offlining a memcg. We need to coordinate
> memory reclaim with the memcg tear down, right? For the high reclaim we
> can achieve this synchronization through disable_work_sync in
> mem_cgroup_css_offline.

We could call disable_work_sync() in mem_cgroup_css_offline(), but
that waits until high_work_func() is done and it could be performing
reclaim. mem_cgroup_css_offline() runs under the cgroup_mutex, and
cgroup_mutex contention is already bad enough. I don't want to add to
it. It would also block the rest of the cgroup_offline_wq.

Every other caller of try_to_free_mem_cgroup_pages() keeps the memcg
alive. high_work_func() should too.

> For a synchronous high memory reclaim we do not
> have such means but we are keeping a memcg reference which makes the
> lifetime well defined. If you reset counter you might help to bail out
> early(ier) but that shouldn't be necessary from a correctness POV as it
> doesn't provide any explicit synchronization.

The high resets are not for synchronization. They are for performing
high_work on the correct live memcg if necessary.

Even if we take the disable_work_sync() approach, we still need the
high limit resets. Any try_charge_memcg() on that offlined memcg would
break out of this loop too early at schedule_work(&memcg->high_work)
(a no-op), and potentially skip calling it on any of the parents.

do {
        bool mem_high, swap_high;
        mem_high =3D page_counter_read(&memcg->memory) >
                READ_ONCE(memcg->memory.high);
        swap_high =3D page_counter_read(&memcg->swap) >
                READ_ONCE(memcg->swap.high);

        /* Don't bother a random interrupted task */
        if (!in_task()) {
                if (mem_high) {
                        if (allow_spinning)
                                schedule_work(&memcg->high_work);
                        else
                                irq_work_queue(&memcg->high_irq_work);
                        break;
                }
                continue;
        }
...
} while ((memcg =3D parent_mem_cgroup(memcg)));


> > Shakeel's remote charging patch
> > (https://lore.kernel.org/all/20261010210957.1350874-4-shakeel.butt@linu=
x.dev/)
> > sends remote charges through high_work too, so without the resets
> > those would lose ancestor reclaim the same way. Before that patch not
> > performing the resets means reclaim_high() runs unnecesarily against
> > current's memcg (not the remote memcg above memory.high).
>
> --
> Michal Hocko
> SUSE Labs
