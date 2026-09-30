Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F05A3D669A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758671; cv=fail; b=X/DqhNv77WkS09L1qqLV/L9qZk4Xo6tt0OAuU76PyM4pdrdPZ2ZVlVe1qRgQttGWi1VqBRgW3hvbR3E94FeMs6073skn4kDwl23qZCobhMcgnkng9u0axTMU2xX8+MUf4gDL+8L0uKU8FbcouiFDrZ/dBKlJXhpVavjtCWqpHWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758671; c=relaxed/simple;
	bh=jjd0KEG/NBOXWmwGkt2V1dWNw5vceT2ola78j22GHAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0H28QUGIVskXhWlaS2S6ciXrHW122ged/ivNBQ0p03sTOmOowD43jCnOpKoJwA5rTDyfjc7sBpcmY/t6Iysla+nJQeMNV7KWLcLZAafC/HokK9oM1iZO8N9F8IuZFZjrbF6xIyjSpnWpktbDwaBXmUQHm42zqd1TFpSydwOPvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=MEbkSTuE; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="MEbkSTuE"
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7cm68617379
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:57:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=FSbzH3J8GpCu3CO+DRX2zaPG7BxRBagXxEyW5
	XsxKiw=; b=MEbkSTuEtJDyWYMNO6YL71WnCSoBA2M2Ck/I1j+uuUHs9mx4xl1lP
	gEqVlxysJcR7edYasoLN4634LrDsZRUwbwdmJVoFzEjMQJrdc2dUZfzF+dZo469C
	5b186aQQR+hHRBosxnqh344iEb4SzDtTYD/teK309BdwlV2lRDorTb6kPJni+ZWa
	W4E/9CX0ofByb7dQQjPCOTa2hzmevHGcOwgw3KwZjp0bp4d0aaffmeV4b5S63UWM
	uLJX101Vdvir1zuV9/bkNFYr8hoPBW91pSuY/NMULyzKjf/x1DEgQ91XgiTsTBK+
	0Q34mZldvMxcKiDGUn9y4QuzYXk5yFVnQ==
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4h0u9s9dwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:57:46 -0700 (PDT)
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a1188c8948so5715131a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790758665; cv=none;
        d=google.com; s=arc-20260327;
        b=N/TGHozNE0YO2YEx3fpjFmICzkj4CnTWYjNTefv6Dmzj2yiImzOuz7vM9hceNVbPjy
         AI10sVrGsbzrFeq/s01Gjw3GGZ2rRw2nmgfDpt5YH+n6TBYP5MWG2lbjon31HhRRQWvm
         k0Y+KG3WVYdUtlBWSTxnLRIeKnaDjIQRqlgv5DE+5YRqxBpa/2GkG1RKX3qz6tnyRZf5
         JaH471uRROK6nXeQlPrvvhemsrPI44A2rV+Nl/ma2h5DKFkeqbAZxsiprEABWr3v7fqn
         +95084fJqr9CRRd2NCpgR4up7QyqsO/sS5F6SbKVgCptjHsJDQCqdWYaXFQn0CL2jrAm
         KLwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=tm60U/TGR2G1p40eU4sJMqqHLE9qAL4X5WQ6mS0UHeE=;
        fh=13JNQsjPJfn04N57cIzfkkCOJ/Ooq69EqgsAP/K7udg=;
        b=sv1TPy+D7Io9EQn/Eai9JENE/h+rX7bV7DJj0lbzUIHj1MFT4N3YVdDUnoIrVE5nhG
         S6uJl8KPPsusuS9DnRdVHSRFmoe9VXJ9C3+5Y525iDdWU+h/0vdQlUVrboQIQpSNN7h6
         2IO94VZSGDOEbcjRdUNfdvGy8cAVQpBeFhxpKoWoOic175NEqiu0vaVNoFgBgFcMTuwc
         BQtujdpsGYi0wulzz1YMR3HBpgmSJhXMSI1chWKx16j0N0rGTdq+Oq7dPjTws8SBcLUc
         JBdlRawDzyuQYB1WtOfuy78w4w2tdibOayLgUEmIi5PLMjBkEWNtlvLTLvPd8HasGSLx
         Mf3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758665; x=1791363465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tm60U/TGR2G1p40eU4sJMqqHLE9qAL4X5WQ6mS0UHeE=;
        b=L6vqwloBsUPhF8oPJ7rwAcv76eIkQEbohbYYrxxwhg0JtIMD4QVZOzPw/fL1VBT726
         npBOkqVOZc/phrElvmGTQ4PLryDXirUcbfgAEQjMYygsrI5mx/5HkaDvqagwdTko4eNA
         b6RMwNFReXDCC+JM2Fz3Fv/I8pcQ9wUMHodUu0t8fq04cbpCZ54tWsr6D1hECCkDxMxl
         bdFAZLwR+eLxuwVKWyn1z3b0lHVQ8yB9IUsoXiKDxf58i/ggQkn6kBeiKpO+clN2HMi3
         jzw4pXZ0OmmYORbolg8a9abhBDS4J+HwTNnhPe17hCRX8dqvJXzHW4DBt/CDY9S0uP+0
         pfNQ==
X-Forwarded-Encrypted: i=1; AKwUvBygupXxMxvtle+IqNI3wkttVS5F7ODjLxahXIBe3XKUWA2S+hE6F7+NAJ2/XHETtz/Zo3sHMK5xeCY2FS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmfJP5WyGe+CKOCW8kMnOWuabAWmdMwOO+meHnVcmKnTILCl1H
	1ymKH910spEyVgrRvFfozfqVhGNy8W21n8aHx+DVfVgbguCZu0TVLXafUg5BckF8Zku9+eQ+awN
	sJEPCmiuA1k0BwqyvsJl7xiYX1+nPQi+ZQcpAk7OYE5LGOSAiYm5/JuSq/Figmok2fuApYWIqGT
	u/KlatwMi7EIdWxLIlAsxBnxinBr3fhD+qHIFLlJ0=
X-Gm-Gg: AYBFou3g2PYHJGxTBRRNgirT4udMCUKenYPK3JtQ3nVwquXuZTxvaqyAiGV0oJnxlJC
	VzsFOx4jTY6s8vvRY1AJpgy+L23dTarNTic6AwZ8vc4y20V/BE06EedPLiEXalyHqg1bngHIYFW
	On5fVjQo5EA/41oLHt4+G2RQPCwtmQctG7EMDEuS0t9CAhyV6a4U5sxY2e3iK4G/BbgiqRukDK3
	w9gQcWyVatfOYzKOw==
X-Received: by 2002:a05:6402:24c6:b0:6ab:1c2:967e with SMTP id 4fb4d7f45d1cf-6ae1997603cmr348800a12.32.1790758664845;
        Wed, 30 Sep 2026 01:57:44 -0700 (PDT)
X-Received: by 2002:a05:6402:24c6:b0:6ab:1c2:967e with SMTP id
 4fb4d7f45d1cf-6ae1997603cmr348775a12.32.1790758664322; Wed, 30 Sep 2026
 01:57:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928081900.4187482-1-alex@ghiti.fr> <20260928081900.4187482-5-alex@ghiti.fr>
 <CAKEwX=PJjGe3kjYCHwxijaZ+W8HvOiNQTTS-Da1R02hPW=kCDA@mail.gmail.com>
In-Reply-To: <CAKEwX=PJjGe3kjYCHwxijaZ+W8HvOiNQTTS-Da1R02hPW=kCDA@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Wed, 30 Sep 2026 10:57:33 +0200
X-Gm-Features: AclHuK8QO5DXy2cZ_qgdu0179rbpj5mlyiQ1Y2SMBWaoqm3aGlQoLCg7t0LKm2c
Message-ID: <CAEmasaWgracciCPNB-39iZ6RRCbGfQYFNiWSHsfP0qaaxCXCKg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] mm/zswap: move reclaim-driven writeback to a kworker
To: Nhat Pham <nphamcs@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
        cgroups@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
        david@kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
        Josef Bacik <josef@toxicpanda.com>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzNSBTYWx0ZWRfX3KoCOhp5llvF
 xOEWwQcUsOIqcU4p0M7fwp1Tby28JlHMHs7djobOLEl46i66v3KnarCmY+yHShIEg1zRpdZe1iH
 og++ynvCtz+RxUazg1GyYBnTJ+5r2anBfF8L0wf0iQmgrEdvqC8Cp1Cwy6lepI8mWXwdrigfRnX
 78Iai6jZqLBef76CLlkslgxZJv7CbhnnvyLqVKh6qc29HDFF6guntBJAN4RWdDvoSQiB6u6Co6K
 izGOU6mKBlayydqyUtkw/XZG5zHI5EbeHILuL1W1gIzqHv82XaNujNBt0HmraJKuORcsPcAiJO0
 QVaPdJDDqBaHp8vbEpjs4/9Gyd4t+Cpznx931GjfHUuKkrgoYcZwMYKTh9S+TT/tWh2TEtvuUmk
 +VuC5NBidj7iYhTPpNWcoCepj8XD8Y/f4fzoEpSIsIFAND+bmdUtDX6kwTiiOGBqNxVGli+EfK0
 PrIvPiZ2R+nrShIGaGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzNSBTYWx0ZWRfX8rwqF42lqmmV
 H1pHZBMCsvgspqRHQVxUhQmxT8DQCKeymJENyG3KHH63nLYZ1zQyF8fGpylzUo2/ai694ufKu4A
 M0EAXftxVbM/s9RLsW5aYbN53EgO5ks=
X-Proofpoint-GUID: vyfs8DxQSz_2MJVn9KfLORztDqbf6lEY
X-Authority-Analysis: v=2.4 cv=PK+aavqC c=1 sm=1 tr=0 ts=6abccf0a cx=c_pps
 a=Tczdrg5if7+wQeIJmxD/XA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=U_y8lYiYyhHBU5rMqhb2:22
 a=pGLkceISAAAA:8 a=Esfd6WMfZuu0XR_NPF4A:9 a=QEXdDO2ut3YA:10
 a=1oAhN8tkTtOBK6_UvoHx:22
X-Proofpoint-ORIG-GUID: vyfs8DxQSz_2MJVn9KfLORztDqbf6lEY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01

Hi Nhat,

On Tue, Sep 29, 2026 at 3:43=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote:
>
> >
> On Mon, Sep 28, 2026 at 9:23=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> w=
rote:
>
> I understand the problem this patch is trying to solve, but this
> solution seems more involved than the changelog suggests :)
>
> >
> > zswap_shrinker_scan() writes back in whatever context reclaim called it
> > from: an application thread inside a page fault, or kswapd reclaiming
> > for the whole node. Now that the cgroup IO controllers throttle zswap
> > writeback, that context sleeps uninterruptibly until the owning cgroup's
> > IO budget allows the write. Such stalls were observed on a large
> > production workload.
> >
> > So defer the writeback to a kworker: each lruvec has its own work item
> > on shrink_wq, which writes back what reclaim asked for, SWAP_CLUSTER_MAX
>
> Ahhh, so it's one work-item (added to the shared shrink_wq)
> per-lruvec, not one kworker or thread per-lruvec.
>
> Hmm, supposed multiple tasks in a cgroup enter direct reclaim. In the
> past, the amount of writeback submission will scale with the number of
> tasks entering reclaim. But now, it's just a single work item
> per-lruvec - IIUC, the submission of his work item is idempotent, so
> it wouldn't scale like that anymore, right? I haven't wrapped quite
> wrapped my head around this, but this sounds like a non-trivial
> effect...

It would not scale indeed, the worker does not accumulate in this
version of the patch. That needs to be tested and discussed.

>
> Also, do we need to defer writeback submission for proactive
> reclaimer? Or kswapd? Only direct reclaimers have concerns with the
> latency blowup from the throttling right?

Today the writeback bio is issued as root, which incurs debt to the
cgroup. The submitting task repays it on return to user or on any
other IO of the cgroup until the debt is paid off.

With this series the bio is throttled at submission instead, so
whoever submits it sleeps until the cgroup has budget:
- for direct reclaimers, that's the application latency we observed
- for kswapd reclaim, it would stall on a single cgroup's IO budget

So we need to defer for everyone.

>
> There are a couple more behavioural changes, without proper
> justifcation or mentioning in the changelog. More details inlined
> below:
>
> > entries at a time, while holding a reference on the memcg. The shrinker
> > does not queue more work while the worker has yet to claim the previous
>
> Why not?

In the large production workload I have worked on, when the shrinker
is enabled, the zswap pool size decreases by ~97%. So I did not want
to accumulate "too much" work to prevent zswap from draining "hot"
pages, it acts like an additional throttling mechanism. But that needs
discussion, hence the RFC.

And you're right, In the next version, I'll clearly point out all the
behavioral changes I made with their justifications.

>
> > one, and reports nothing freed, as nothing is until the worker runs.
> >
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>
> [...]
>
> > +
> > +static bool zswap_defer_writeback(struct shrink_control *sc)
> > +{
> > +       struct lruvec *lruvec =3D mem_cgroup_lruvec(sc->memcg, NODE_DAT=
A(sc->nid));
> > +       struct zswap_lruvec_state *zls =3D &lruvec->zswap_lruvec_state;
> > +       long old =3D 0;
> > +
> > +       /* Do not accumulate work: back off if the worker is lagging be=
hind. */
>
> Why not? This also has a non-trivial effect on the writeback amount...

Explained above

>
> > +       if (!atomic_long_try_cmpxchg(&zls->nr_deferred_writeback, &old,
> > +                                    sc->nr_to_scan))
> > +               return false;
> > +
> > +       if (!mem_cgroup_tryget_online(sc->memcg))
> > +               return false;
> >
> > -       shrink_ret =3D list_lru_shrink_walk(&zswap_list_lru, sc, &shrin=
k_memcg_cb,
> > -               &flags);
> > +       if (!queue_work(shrink_wq, &zls->deferred_writeback_work))
> > +               mem_cgroup_put(sc->memcg);
> > +
> > +       return true;
> > +}
> >
> > -       if (flags & ZSWAP_SHRINK_SWAPCACHE)
> > +static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
> > +                                        struct shrink_control *sc)
> > +{
> > +       if (!zswap_shrinker_enabled ||
> > +           !mem_cgroup_zswap_writeback_enabled(sc->memcg)) {
> > +               sc->nr_scanned =3D 0;
> >                 return SHRINK_STOP;
> > +       }
> >
> > -       return shrink_ret ? shrink_ret : SHRINK_STOP;
> > +       /* Nothing is freed until the worker runs, so report nothing. */
> > +       return zswap_defer_writeback(sc) ? 0 : SHRINK_STOP;
>
> This will have effect on the shrinker control loop too, right?
> Shrinker API accumulates the number of writebacks overtime based on
> shrinker_count()'s output, and we serve that number of writebacks
> throgh shrinker_scan(). With this basically that accumulation just
> grows over time, correct? Check do_shrink_slab() in mm/shrinker.c...
>
> Feels like this completely breaks that control loop.

Yes, this is another behavioural change that I will explain in the next ver=
sion.

Indeed the work piles up in the shrinker control loop if writeback
cannot catch up but note that it is bounded, which is what we want
right?

>
> >  }
> >
> >  static unsigned long zswap_shrinker_count(struct shrinker *shrinker,
> > @@ -1807,7 +1897,7 @@ static int zswap_setup(void)
> >                 goto hp_fail;
> >
> >         shrink_wq =3D alloc_workqueue("zswap-shrink",
> > -                       WQ_UNBOUND|WQ_MEM_RECLAIM, 1);
> > +                       WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
>
> This turns a single-threaded workqueue into multi-threaded workqueue, IIU=
C.
>
> Worth at least an callout in the changelog?

You're right, and the explanation is "we cannot starve other memcgs if
one worker stalls because it exhausted its memcg budget".

Thanks Nhat!

Alex




>
> >         if (!shrink_wq)
> >                 goto shrink_wq_fail;
> >
> > --
> > 2.53.0-Meta
> >
>
