Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8839449BD96
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340587; cv=pass; b=iXxas5jOkT1jtmQ/rzqrvwKoJh3XFlXas1qoYKiz+OZUvg/Uye85K9q/G/T9WXK8kc4ROUcqIVcO4VRwt5p6+OlhroK5EabFQsvogvE8ysM872HvASldVf/h/dgC8aJ2zK9Hn0jCX4Ooroe47epZ/snXA0E7siVVPJ0lWz0ZeVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340587; c=relaxed/simple;
	bh=2Gz2UeRKZ24g45wBnk1gIJDu8zb1+RkJBTqudMiS5n4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lFtLtuR2Hn7Fs9aZgW1zOL3QpzudEUdqEzCVngRHDlO+Vj4bVBo+lCRuj5/tLXxsNvVqiJqQYVrP0W7IiG8Kiu3znxzjJxaJUTnkOuJWygMNiNC+A+E3DwGRlnUR3nP7k/0lkIqm6vpf00K+IVCTcY2cbMe/tcdqpwo3yrbQUsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JkY+frEa; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JkY+frEa"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso10465a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790340584; cv=none;
        d=google.com; s=arc-20260327;
        b=N3xwUf4knqdwMigtuJhNwOqXs0V3Tj7IsXz2/0x8+ySpZOrBN1jEsNpSXptSJsBVNi
         S0un5bMV+WUTt8b+e1hw5G37JaQ7CeUJHIGh2XC61flhEHUuC8oAuqQD+JZSNOlpDt1r
         +IW+jScbAHjZRGNzqjK9h2Am+Aj5CoyE2Liqf9w2/uLWBOxRI6Wea2Ve2OL+074c5nFH
         27ZF0tE1dVcMRrp74L90cJy/MqDdJEulys8YH4+kc0iA0wCELqPyAOFEB8MTljayZIJx
         q7WzvqWkbNdsnXGQ3anL3kYjHdA/e2fA396WJ7ZlSkMMFcTcJczhdZ5Cw+HjgO39BH6B
         ghJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JEaNxzWMP8zBe2t/2kfrudklKHVc3TEq0coVkXXGBbA=;
        fh=lOTmmuSy3xF74N3AESeVo84mkBAMFOQzPpgApPL/te8=;
        b=jOtuH+7LhzbN2MA3xGyIdWjqJoT+oUUTN3FITBz2BOAhkB2AgGk2SoVD6SJjVaS3rj
         u2qJLgSbMRNW5Yz/EwfEreZ499MM86wwL6U/3OpyRms+g7ZAGp4Fui8htZdqtIrOu0bY
         Hstwt2jMuMgyRQLzKTKdFQEXz22rVIs2LJZRDkBE+Dh/uA//MShAUJT6VSJKHsofrnd0
         9C854TnOmP/e+/hy6va0hu7SmEa711mYJRdvCjHg1/t/AqZJ47cveB7bizlJDaVdbJNG
         BfU2R09USixcqpNTvf1oQKAit7uzg2y9TqAM4YnhQBZWlSTfcMzYlyouapOF4ZfC3e//
         XwCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790340584; x=1790945384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JEaNxzWMP8zBe2t/2kfrudklKHVc3TEq0coVkXXGBbA=;
        b=JkY+frEaxPzU0XEr0lRnayQhtQBSuDlM8DGj41U5TpW7yuFZzlsk2i/HqbzqBfiOGn
         KMln75CN0/sEua7QefZwkZ7frBYu+eL3UBDJytmd4cvZXRQf/lRCGoO9Bjk6P5QN60EL
         hNyVbC+sALgZzTeAhxbnDLGMDvFl/AH2DpiJZVjm5w2ch62bMeI5eLFykDb3bM3WgApM
         d1mjY9DNhNPd6ggxESRj9Y1s4q06ralnXf5virLuaIUeKLLbKNKdPR2o2xs3Huf6mNHx
         /b7Y4KHKCG+IVpytc9IpJIaVjd5WqyLT6TN/UMPgtNvw/fDqS93McfhMtEGqKNTe5dKj
         cZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340584; x=1790945384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JEaNxzWMP8zBe2t/2kfrudklKHVc3TEq0coVkXXGBbA=;
        b=lzDcGtb/OQtsbsYLfSiWgOsaORTvigRg41EhKxnJOBDxDoY8Hb1DfGPeTFz6ExA80C
         E1N/kRfXimaD8m6DoksTgRlbsqQfzSbatD8LxSgqCZXZbo4DxqZsWguOZcOSw69OV104
         le6YVJv0z8H1KnxjdPuAZ+yFQxlFTqLTZsFnCTDSqQypyWkagm0oCxXsAM5XcgCjHU9o
         py6PuCRhyWZPQ0P+/1yWgXRUwxJRYOA4A3sC2CJeQTCdH08zqWVwy/dhSWbhoKzs8Nzl
         a/eAtehOsZZICRpZlNfF8KX5WK22Rp8tX+3l4KqiHMTnf+LFAEC0g+JKQUDnJWuJsnkl
         PXTA==
X-Forwarded-Encrypted: i=1; AKwUvBx9xJsHCNkz1ZuVN5+ad4Eks6N7d4NYWTP76UwLj1MRQvRNxX41BaXKlC1hBtx/z7FgalyhGgC6SJOLoX8=@vger.kernel.org
X-Gm-Message-State: AFuF++mW1ribg4S99Q8WDedNlgJ4LuJJcokxy8ojPaHvVdXXrQTamAt9
	3C0t6PKVwOeVnPuLcSfB46hLfT+zxvPDnQmbR40YgQ7fTOmflWdT1NHP/aSCSs+rAqJ5ZhRv+Qa
	n93q1uhTYiPB8u+RoOVv9tWZM9lp9s63LPzjYu7oBq9E+981KP4dA5gUY
X-Gm-Gg: AYBFou2LWbB40YtaFWCCuHi+vuh2STxcf5dmMgt6T/f0t4m8M7tx11Q9xozJhsb0Juj
	mQtqq0bn2FOhCtStu79Rjt+JY/ktpog5y24f/wPtxKF/ECP9M09MDvk3Yl4OnoaukL4XdyyoR2x
	F4I1iqZRGpUZ/M7lfse8WAmmwL95Dnfb7VlhZ02YIU7B4mS1u0togvQSadzHcUn4PY9baw79fQ9
	nmRPpNS/3E7FwQ4ge9HMecvG34WEEKhtSPt2NtAZMIADlLSqLd6uuCTW0zcjlOKlK9VwcL9K7Pk
	/bevRIgQLsRg2hyzgMV/Wj6BHeaqMd31LnK5Eoho90sde3unAuEz2XFXt2tn6pi3MKRAN9idYWH
	KUZeHncYn4ol5JY0=
X-Received: by 2002:a05:6402:a50e:b0:6aa:128c:36ad with SMTP id
 4fb4d7f45d1cf-6aaf8475cd6mr3116a12.10.1790340583030; Fri, 25 Sep 2026
 05:49:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922193356.542922-1-kaifengw@google.com> <179028939171.2160803.706522228583664641@kernel.org>
In-Reply-To: <179028939171.2160803.706522228583664641@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 25 Sep 2026 05:49:31 -0700
X-Gm-Features: AclHuK8EGd49bkj4acT1-UozI1H1RBoepM97mY3Mb4oTcfAxodBew5rvHOkNTmQ
Message-ID: <CAHS8izP+ZdYM_rApxjDAhtb+jyAHLqTNKhj80p1YSNgTbBmuEA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: devmem: use page_pool_put_netmem_bulk
To: netdev-bot+sashiko@kernel.org
Cc: kaifengw@google.com, netdev@vger.kernel.org, edumazet@google.com, 
	kuniyu@google.com, pabeni@redhat.com, willemb@google.com, davem@davemloft.net, 
	kuba@kernel.org, horms@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 3:36=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] sock_devmem_dontneed() (net/core/sock.c) now releases the last
>   page_pool reference of devmem net_iovs via=E2=80=A6
>
> --
>
> net: devmem: use page_pool_put_netmem_bulk
>
> This converts sock_devmem_dontneed() from a loop of napi_pp_put_page()
> calls to a single page_pool_put_netmem_bulk() call per batch, so the
> page_pool ring producer lock is taken once per batch instead of once per
> netmem.
>
> > diff --git a/net/core/sock.c b/net/core/sock.c
> > index 2948dffcc3e1b..a6b6d5b2051df 100644
> > --- a/net/core/sock.c
> > +++ b/net/core/sock.c
>
> [ ... ]
>
> > @@ -1123,8 +1124,7 @@ sock_devmem_dontneed(struct sock *sk, sockptr_t o=
ptval, unsigned int optlen)
> >                       netmems[netmem_num++] =3D netmem;
> >                       if (netmem_num =3D=3D ARRAY_SIZE(netmems)) {
> >                               xa_unlock_bh(&sk->sk_user_frags);
> > -                             for (k =3D 0; k < netmem_num; k++)
> > -                                     WARN_ON_ONCE(!napi_pp_put_page(ne=
tmems[k]));
> > +                             page_pool_put_netmem_bulk(netmems, ARRAY_=
SIZE(netmems));
>
> [Severity: High]
> Can this reintroduce the page_pool use-after-free that commit
> 271683bb2cf32e ("page_pool: Fix use-after-free in
> page_pool_recycle_in_ring") addressed, when CONFIG_PAGE_POOL_STATS=3Dy?
>
> The old path went through napi_pp_put_page() ->
> page_pool_put_unrefed_netmem() -> page_pool_recycle_in_ring(), which
> updates the stat while still holding the producer lock:
>
> net/core/page_pool.c:page_pool_recycle_in_ring() {
>         in_softirq =3D page_pool_producer_lock(pool);
>         ret =3D !__ptr_ring_produce(&pool->ring, (__force void *)netmem);
>         if (ret)
>                 recycle_stat_inc(pool, ring);
>         page_pool_producer_unlock(pool, in_softirq);
> }
>
> The bulk path touches the pool after the unlock:
>
> net/core/page_pool.c:page_pool_recycle_ring_bulk() {
>         ...
>         page_pool_producer_unlock(pool, in_softirq);
>         recycle_stat_add(pool, ring, i);
>
> Once the netmems are published into pool->ring, does the setsockopt
> thread still hold anything that keeps the pool alive?  The barrier in
> page_pool_release() only covers work done inside the producer lock:
>
> net/core/page_pool.c:page_pool_release() {
>         page_pool_scrub(pool);
>         inflight =3D page_pool_inflight(pool, true);
>         /* Acquire producer lock to make sure producers have exited. */
>         in_softirq =3D page_pool_producer_lock(pool);
>         page_pool_producer_unlock(pool, in_softirq);
>         if (!inflight)
>                 __page_pool_destroy(pool);
> }
>
> so the sequence would be:
>
> CPU0 (setsockopt SO_DEVMEM_DONTNEED)
>   page_pool_put_netmem_bulk()
>     page_pool_recycle_ring_bulk()
>       __ptr_ring_produce()          /* last inflight refs published */
>       page_pool_producer_unlock()   /* spin_unlock_bh(): BH/preempt windo=
w */
>
> CPU1 (page_pool_release_retry() worker after deferred destroy)
>   page_pool_release()
>     page_pool_scrub() -> page_pool_empty_ring() -> page_pool_return_netme=
m()
>     page_pool_inflight() =3D=3D 0
>     producer lock taken/released uncontended
>     __page_pool_destroy() -> page_pool_uninit()
>       free_percpu(pool->recycle_stats); kfree(pool);
>
> CPU0
>       recycle_stat_add(pool, ring, i);   /* this_cpu_add on freed memory =
*/
>
> Since the release is driven here by returning the last outstanding user
> tokens, would it be better to move recycle_stat_add(pool, ring, i) inside
> the producer-lock section of page_pool_recycle_ring_bulk() (matching
> page_pool_recycle_in_ring()) before converting sock_devmem_dontneed() to
> the bulk helper?
>

Thank you my dear bot. This seems like a real issue, a latent bug in
the *_bulk() put. Let me use my pet LLM to develop a fix for this,
send to net, and then respin this.

Lets hold onto this for now Kaifeng, and resubmit after my fix goes into ne=
t.

--=20
Thanks,
Mina
