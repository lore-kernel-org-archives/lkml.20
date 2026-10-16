Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1207D3932FA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122270; cv=pass; b=ZWxfiqXqK0hHX9j+2GgIEN4+KGzTZRpfPaNhGxzv+QgWDXrI2sRfGnu2Flz+t86sUncrvKekxIYsM40uk8Hb4RLy9ssOEgBrJSKbV7I/rsv/kRwGJUX79AhJ1Kpb4d8E3MCNkG/ymPKgqwJHn1jE/wwyFSqCoKYB24JJ+Y6ZuG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122270; c=relaxed/simple;
	bh=YYI72lySTmWGCOX7Pagi7+kqJl1I9aBv6sQuY8k0tgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DALjv51Abt68CX84Fd4ufd/4AZ3LQ1jUOn01nbjebSAxvdj8u9Xd4cPAT/I7jULSyjylp/ZtbrIte7+Xl586Re0r/ytCq+BYdVIt8IUGjsGMRHHiy/8W2ef8Z32aLB/Zt4MM15+lY5wsI89wIrYYwzIj4U74OwT6TXrBHx5KIcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YUJiQtqk; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YUJiQtqk"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so6229a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:44:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792122263; cv=none;
        d=google.com; s=arc-20260327;
        b=ECjw2kodAlSM5NPs0KB6o8hpreg1fCLAumbZz6wDNdD2XGfIqFaRiXVpDmer9KrfYt
         59jvPXmQ2BzrggoJQzfT+9hCueeDvJV6zCkj47quNDFhB9VlKh0oVZOmMnh8xYA+IJbT
         VpK+fxHkeLkIhMywRJTdNLYbAhabU1SSIHOl1cPBA67N9ngtTJBARxsyXh4qj5jKeivO
         zgukCaEKl98vu3FDUOiFXOKlUWRfEV+zdH2SGdiEg0OzQXT7gLJSB7k8r19RwYasqAPr
         InqiUuehqrFihFJtCpz2/HdxgLNkBOlAJZtbpwpRMVuGCN+G43PqKuqx6IR5cj1ER3FT
         Rj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9ARhpOy9hpz9ipUHAeNJOJtGmLehX9Lp4TUcEpx4ik4=;
        fh=qXpqHylfX7HltEly98uLVl4VC2r3grVbnqR8AeG3dis=;
        b=AqLX61i1jam8KbvroWREMsTs117+Sk74sXFykZDKegxnAlSc1pUjgf3rq6vmy43jmj
         tpM3yxi7oATcZ7cJk4DDs2mNhCCGbho8+zE2Int88IcnQI2dWVPcK4wNmBqiHzJqAvCs
         9gPJ/dD5TnV4jx7gGNZKMvYad2aXWcX/BfxE0GlNpdiyiA82STtBnpFMDIWiKKQHujv8
         UkwJZ0gIm/UpJvE2l6hPqRXwqLybp6a+RFlG9YVkJcFi6cPhbdN+Feu4h2OTuAnPLJma
         8zl8G2P6Bc+zK6Kdm/461b3QChrUsZBAJGy6R/ux+ar61fyMyuFMdbYv53GpLp+rihyG
         odbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792122263; x=1792727063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ARhpOy9hpz9ipUHAeNJOJtGmLehX9Lp4TUcEpx4ik4=;
        b=YUJiQtqkTrt6feVFqGQCGwLB2qnZzADg3Uis52z7J89aQEYaMq1kKAOU8qcHkFIcsh
         LZIojymcHxwSB1La3faXjnniNLv9ZiyXbyXyhGgBwDcj53KUdARL0HvKxJGO0gTGlng2
         Y/7gjdjHbQ7b6PUpEp8cGY4Cvg/ejEB+dh2M4oAPciEOK24iZ/VRr4YtlYRoWjru5GzZ
         WNv1L2XYmuxe0tVGPng0NARj+1duoN1gz0O6REMOvVfLHDHyE7gf0Vuww70eHRT0viZX
         MDk4KLvBeC6A4RolcRtxVlIjS9g2E74Be1J6mlUdRbPf1ORVYLl110adQpWfuozeDAs8
         teLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122263; x=1792727063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ARhpOy9hpz9ipUHAeNJOJtGmLehX9Lp4TUcEpx4ik4=;
        b=LgZktf5Ykcg5YkAg6Sz5+Rnz7tMs9CaP4CoQ1JMjK+hF/QRYNTHaptVITBc1cJVaeE
         KA/kkx79GZBXRJE7tHigL/4ii27fY0q0rM2lxln5ROp+4xthPnsEb/wGE+fV3adKCAda
         duJYjFoKriufNqN8bW/j2u9JQk5rWAQq5Co8ag3O6nHaX7OCGBKmmXs4NCtkU1lDv3ph
         IFrSzA7KLwRTfBTQDpoK+8bZKIGb78O6knpsUjb9Onq2uvyzojrgoAsvXi4RB1zwVFr7
         0GQb4eOE39qObyvKobYnClUpW3LI+oOcaFY+82Vrs7icGippiWauLkJDsu4ChMfGMnav
         1ldg==
X-Forwarded-Encrypted: i=1; AKwUvBwwJppaLgz92UyuLw+yUzjYppgGUkq4lBnuTOr6+eFuBaGdw6lUh7nLDPDqS7tLHsiDEaupY1T3aS/bFRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmrjgoU1rNQ3N6LA22jlgAXqBEo9DtjOK/lpwJjfAnZsWJmaIs
	Pa/YVJlyCquuUpDTa/RQZy2boLjAjgTlTB5FeUwzHdmapWdW7Io95s4u2SDLwwIG9FusWYu3PdF
	QDetcjaK/EgcO+2BNf9YHxyMutBN0r5c2ck1VARlb
X-Gm-Gg: AYBFou0SX1+bpVEHGvguGXfU7su84HD/BgYBCMEhP8sFE7vTguJPuvhq4mkywCpELQm
	A7NNjlLcHTsJM+UdUtY4NhLl7X67tHbwL1ynVrSZ88J7wyvlWrSPVSut+fUd0Xvop5v1hS1xNY9
	bKApEkSvJwQ3YQcAdo9yusMgtOKSWZidFiQa5++6EKeSTAPfXnMlyeK1nMx9BFEzxc3e0UUoCfL
	fAukfEL4icS2Z2oxjROE4CQZQ/YKts3HRrYdsZfGnoR9HLZ1BCkNn3WRxzBvVjf9/EcjQiG1CFp
	QCfrmpSJzDPtAcoGl1DrZqoy7mMp8p2Q/lVnGRcp4O0oDBnZoJdWXg==
X-Received: by 2002:a05:6402:5168:b0:6a6:7385:3eac with SMTP id
 4fb4d7f45d1cf-6b38c3c0061mr20821a12.11.1792122262666; Thu, 15 Oct 2026
 20:44:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014173945.373295-2-almasrymina@google.com> <179209665647.434549.4410094840593695015@kernel.org>
In-Reply-To: <179209665647.434549.4410094840593695015@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 15 Oct 2026 20:44:10 -0700
X-Gm-Features: AclHuK_AY7S3EHhUJkVZl3m_UeQ2fg420IBocWoHLNeVVf6pF9O3oqXG1dOFVmw
Message-ID: <CAHS8izN47FP2nuY26hZSCekf2vB1SXqz59h66NOWA_C6T8+vCQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/6] netmem: rename __get/__put_netmem() to get/put_net_iov()
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, ayush.sawal@chelsio.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, tariqt@nvidia.com, horms@kernel.org, 
	steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	ncardwell@google.com, kuniyu@google.com, john.fastabend@gmail.com, 
	sd@queasysnail.net, ebiggers@kernel.org, kees@kernel.org, 
	aleksandr.loktionov@intel.com, petrm@nvidia.com, u.kleine-koenig@baylibre.com, 
	j.raczynski@samsung.com, wang.zhan@smartx.com, willemb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:37=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] At this commit, generic RX skb handling can reach the new
>   else-branch DEBUG_NET_WARN_ON_ONCE(true) in get_net_iov()=E2=80=A6
> - [Low] The new kerneldoc for get_netmem()/put_netmem() in
>   include/net/netmem.h says they always take or drop a non-pp backing=E2=
=80=A6
>
> --
>
> netmem: rename __get/__put_netmem() to get/put_net_iov()
>
> This commit renames __get_netmem()/__put_netmem() to get_net_iov() and
> put_net_iov(), which now take a struct net_iov directly. It adds kerneldo=
c
> for get_netmem()/put_netmem() and the new helpers. It also adds a
> DEBUG_NET_WARN_ON_ONCE() for net_iov types that do not support non-pp
> references.
>
> > diff --git a/include/net/netmem.h b/include/net/netmem.h
> > index 0cc8572f62caf..697d50c51a5ee 100644
> > --- a/include/net/netmem.h
> > +++ b/include/net/netmem.h
> > @@ -399,21 +399,37 @@ static inline bool net_is_devmem_iov(const struct=
 net_iov *niov)
> >  }
> >  #endif
> >
> > -void __get_netmem(netmem_ref netmem);
> > -void __put_netmem(netmem_ref netmem);
> > +void get_net_iov(struct net_iov *niov);
> > +void put_net_iov(struct net_iov *niov);
> >
> > +/**
> > + * get_netmem - acquire a non-page_pool reference on a netmem
> > + * @netmem: netmem to reference
> > + *
> > + * Acquires a non-pp backing reference (page._refcount via get_page() =
or
> > + * binding->ref via get_net_iov()) regardless of page_pool membership.
> > + * Counterpart to put_netmem().
> > + */
>
> [Severity: Low]
> Does this description hold for every net_iov type?
>
> io_uring zcrx sets up its net_iovs with net_iov_init(..., NET_IOV_IOURING=
)
> in io_uring/zcrx.c, so net_is_devmem_iov() returns false for them. For
> those niovs, get_net_iov() and put_net_iov() don't change any refcount:
>
> net/core/skbuff.c:get_net_iov() {
>         if (net_is_devmem_iov(niov))
>                 net_devmem_get_net_iov(niov);
>         else
>                 DEBUG_NET_WARN_ON_ONCE(true);
> }
>
> Without CONFIG_DEBUG_NET, the else branch compiles to
> BUILD_BUG_ON_INVALID(). The same is true for every net_iov when
> CONFIG_NET_DEVMEM=3Dn.
>
> The kerneldoc for get_net_iov() does mention the warning. get_netmem() is
> the public entry point, though, and its kerneldoc doesn't mention this
> limit.
>
> The put_netmem() kerneldoc below uses the same wording. So does the commi=
t
> message:
>
>     always acquiring or releasing a non-pp reference regardless of
>     page_pool membership.
>
> The skb_netmem_ref()/skb_netmem_unref() kerneldoc added later in the seri=
es
> repeats the claim ("otherwise acquires a non-pp backing reference via
> get_netmem()").
>
> Could these comments say that only pages and devmem net_iovs get a
> reference here?
>
> >  static __always_inline void get_netmem(netmem_ref netmem)
> >  {
> >       if (netmem_is_net_iov(netmem))
> > -             __get_netmem(netmem);
> > +             get_net_iov(netmem_to_net_iov(netmem));
> >       else
> >               get_page(netmem_to_page(netmem));
> >  }
>
> [ ... ]
>
> > diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> > index b25d8e2c9aafe..23a40e1ec2b15 100644
> > --- a/net/core/skbuff.c
> > +++ b/net/core/skbuff.c
> > @@ -7555,23 +7555,39 @@ bool csum_and_copy_from_iter_full(void *addr, s=
ize_t bytes,
>
> [ ... ]
>
> > +void get_net_iov(struct net_iov *niov)
> >  {
> > -     struct net_iov *niov =3D netmem_to_net_iov(netmem);
> > -
> >       if (net_is_devmem_iov(niov))
> > -             net_devmem_get_net_iov(netmem_to_net_iov(netmem));
> > +             net_devmem_get_net_iov(niov);
> > +     else
> > +             DEBUG_NET_WARN_ON_ONCE(true);
>
> [Severity: Medium]
> At this point in the series, can generic RX skb handling hit this warning
> for io_uring zcrx niovs?
>
> packet_rcv() accepts unreadable skbs and clones shared ones, so the
> original skb is left cloned. If pskb_expand_head() later runs on that skb=
,
> for example from ___pskb_trim() or from skb_ensure_writable() in netfilte=
r
> or tc, it takes a reference on every frag:
>
> pskb_expand_head()
>   skb_frag_ref()
>     __skb_frag_ref()
>       get_netmem()
>         get_net_iov()
>           DEBUG_NET_WARN_ON_ONCE(true)
>
> skb_release_data() then sets skb->pp_recycle =3D 0. The final free theref=
ore
> goes through put_netmem()->put_net_iov() and hits the same warning in
> put_net_iov().
>
> Before this patch, both calls were silent no-ops for these niovs. With
> CONFIG_DEBUG_NET this gives a WARN splat, or a panic with panic_on_warn.
> The trigger is RX traffic on a zcrx queue while a packet socket tap is
> active.
>
> The later patch in this series, "net: skbuff: replace __skb_frag_ref() wi=
th
> symmetric skb_netmem_ref()", seems to fix this. It changes skb_frag_ref()
> to use napi_pp_get_page() when pp_recycle is set. It also stops
> skb_release_data() from clearing pp_recycle, and it carries pp_recycle
> through the copy, split and segment paths.
>
> Could the series be reordered so this warning can't be reached at
> intermediate commits, which would help bisection?
>

It cannot be re-ordered easily no. This is a very minor concern IMO.

--=20
Thanks,
Mina
