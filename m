Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDEB51DB0E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756913; cv=pass; b=OfJopoY67d0VW3KsJ+mQGbWuQETnyBso/LI7o6pIcYXwhaJMjPT7rpC23w7njvtPKF62VYgugF+7tcrk0vofWZdn3IjCZaryIe0Fc9pKIkekH2Q+iF+S87CSAlrTks+9xsCTUiXw4lJSu9pC/j9sx4pzLkGeKjTl7R/MxoTZuVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756913; c=relaxed/simple;
	bh=Q8kkoI9QqrR4BWwHpqPvOzkefuLSVO6IwXVa5vt71T8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9jvi0FmWojtRfcaleTbYuEiS52mph03H36UWWYq5Tgz3DJB/gumOUwLAsAI5rwojLMNqvpeVLNuQjtQAy8V9eekIw3C/2Ki4xQF3t6bcrRhP8yg04O3KOEaeltp+qSUrl0ksd91TglEDqd04QaC99wZ3Z9HU4lKBrzKM/M0L4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wGMIcxpd; arc=pass smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wGMIcxpd"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so922583a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756906; cv=none;
        d=google.com; s=arc-20260327;
        b=EADnyhMLVLzDUx+nFoJokvIdilvXzVf9QtfVw3dk6y+5kXw0A3QmY4w6z+LSYyawoh
         9OWPJQ7ga/S0ixdRR/FdsBVAFGZqkZXLYKa1wdoCMee6jdqE0XhQinlShlqW7izuZ7MX
         eTF0Qh9C0V4vYwstV3okcwKOGoAWz3vHq5vx/j/2qU+ZqTr1ctgjJQKfYIwMvMq3PKz6
         iO9h8/0lVVutXkkmiiHzs22HROZ9sUrcxD3/kq4aJguFtkTa4ipXXOMny6wD2s6bpV92
         YyHWX7MXaiyjWy6VNccymakEfb5fqyqjQpaJAjD5EOldQRfLsP7X3PSa6e5sOaw31zJw
         LJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yigc03ybrtRAGj7IJjhu02MFv33g38bHvAEAEo9T+Ik=;
        fh=5XjemQP4aQ7looafZaRyMQCege26yTPcv8pINFisW2A=;
        b=or96T46GsJwNMC51P9XTNDznM0TaFfqg9hQkdBssNzG9bkc1M0h84hUOqniCmHtNOi
         Gf2DouZK74HEPUpti/nuKcSIxoC0tZi9iv5AI6GL36jQfwDq23s9aupjx2qWwg2fJjFV
         /lOowxRRzXof6FsEumAmEJGGaiuNRzeT15VmsKNrwOhtbOlhj4BpQlMZsyTKX7PcI9Lr
         oQvzUtlwNSYw5GJ8rv1yZ/jMnrUbZLV44Usxw24nFPyPV/MSXhq2BPr6nGPnZxx+0+bl
         pFaZmB9V4g90VpmRYt25j78WZ62h4CF337ZbBoUWxlMa4GIOxN7/PY8GcHmr+LWsCIu+
         b/rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789756906; x=1790361706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yigc03ybrtRAGj7IJjhu02MFv33g38bHvAEAEo9T+Ik=;
        b=wGMIcxpdidJ4aKILxjbUVKsjPv5RKo3Gp57VVqbrpQi4KuOm6wJO9snh41BR6AzNv9
         LodJnPl0P0nVPvVk6a6SbrL2kAsOxKlNGdBhfve0q7wNL/NOO0l9N4gMFIXKhLmKxYHn
         Ge2So5XSBT1xDZ0ziNtFCCkgoMqSg/nrBmYBM6Z+wiE4/1zLwOFgQIIZN3XuCnnH86CV
         M7lpLtCwjM2xEOxlc69UcxvA4lTQrUQzQLiLNp/D26vOy582rvj/CR/fTC229hGvk0QS
         elSGRV/XXwa05P3eR9sfGXvpqYvIE11urInSdZBrBbaNJDWIsOW+WWKgXLWE2qd5yn0G
         8zFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756906; x=1790361706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yigc03ybrtRAGj7IJjhu02MFv33g38bHvAEAEo9T+Ik=;
        b=Q178oILMljDkafzmJMi6ZFPBqP5b/ezOHClu1lvDk1t/WU/v1O0kyg0gmTUAOa0f4R
         1si1UmLJLOWwvLFn/R9A55FoqqN6M1gkhEJ4RgziT/vnQm+5/koOq33Yu5W8NZ0RwAS1
         Mg1HA42OYXwDAliMZSdVGlb0pKfNH2U91qmrSTCYSE+lYOEoypgBWrQ4QtORQFe5vyV6
         LAn1IcBO2M75BwJmOiB6kpqk/DxC4O4y0JIvu6qGk+eIyoEHEGWTmNpqWiiK4u+LCPLI
         wnni9zmM3b+ffIpqKspgXk1RQ1ZKAheY5RM0sZAcGU5YzFETbOY4wpz1zKJCO4ZeWpdI
         Ruog==
X-Forwarded-Encrypted: i=1; AKwUvBybtn6Q4mIgok2JagsGEj3GQOin5oq3Rp8rFlIzwqrdmrJXZQXO5K140Mhx5B8KFX+02Ri1PlmjnOSi8RE=@vger.kernel.org
X-Gm-Message-State: AFuF++ljZ2MBcceBGJ9V5WGN5Pwe1+FdCJg+hr8qkEIkq6/iSRs2NcBY
	eOcZtp2WHWbaimbV4Hwkibnicu0F83MIk8977TYoXY61YorFPba1mHa5qVzJTlAFjZ9hqe7O9JS
	0GQh7exKhpIw8U0lqHpCrtR+W4lMKQOWqYOKkJjDs
X-Gm-Gg: AYBFou1IBwf/t+Fbjobbp5m0rtYEOuKmGKx0dSK8l93y0EK4w98OOA41PAgzAcRU4Qb
	q9TVfBlP3LLAvsxbzhZY3l9pfPfXTlrKoOmYJ/2lBoO8SOfOW8uvG3h+mSfSbQA6RPtBfp7ldDi
	fwmAnkS6oYx4u6xzVca73j6NcJhKpdRwnDwv5MHZrpELehpDoW9d+w7KwIBaPsvz36KU6mr+p8T
	hDPmQigpAMZ+UdSoKuv0KGXdBqq4zTcczH/kuLx1BokACX5S5iOaDaWUSHnVAdGesvKlZeAGPjX
	gerzzBXgys6xwMXupsqAc+5lp+9JoWVS7Nw0NGbnWtU2rxVkvUbrlsj7wrDVT28xBY7QkWRsCFF
	jj+C5yFCi675PUGQGlt5Od0ezaxhxrxH5MDe7vMwf7JHUwRw5Q7HgwDqiSsT/YkgvuLS8389lAZ
	XCB2VqSX4FBSnk0cXJQnNsGRpwm29vxpYY
X-Received: by 2002:a17:90b:1647:b0:39e:4498:4863 with SMTP id
 98e67ed59e1d1-39e54f4187emr10996270a91.10.1789756905720; Fri, 18 Sep 2026
 11:41:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aqyIEE5bRoxRyrFZ@20HS2G4> <20260918042110.2581679-1-kuniyu@google.com>
 <aq2B8PSfjn-xau4V@20HS2G4>
In-Reply-To: <aq2B8PSfjn-xau4V@20HS2G4>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 18 Sep 2026 11:41:34 -0700
X-Gm-Features: AcwNN1U_wRZ_cMbwfEJmIW3q1Qd9L-P9A846ypz2R_CtNGbxLJdF1kkNVVEz-bY
Message-ID: <CAAVpQUD9NJGR-odxR6om0EWTC++BybAA3uyA8ezip4SJBf-Qpw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/3] net: hash uncached route lists by device
To: Chris Arges <carges@cloudflare.com>
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, idosch@nvidia.com, kernel-team@cloudflare.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 11:24=E2=80=AFAM Chris Arges <carges@cloudflare.com=
> wrote:
>
> On 2026-09-18 04:19:34, Kuniyuki Iwashima wrote:
> > From: Chris Arges <carges@cloudflare.com>
> > Date: Thu, 17 Sep 2026 19:38:40 -0500
> > > On 2026-09-17 22:10:22, Kuniyuki Iwashima wrote:
> > > > From: Chris J Arges <carges@cloudflare.com>
> > > > Date: Thu, 17 Sep 2026 14:38:21 -0500
> > > > > We have observed hung tasks blocked on rtnl_mutex while network n=
amespaces
> > > > > were being removed. The namespaces contained many network devices=
, and the
> > > > > host had accumulated a large population of entries on the global =
per-CPU
> > > > > uncached route lists. A perf profile collected during one inciden=
t
> > > > > attributed most of the cleanup worker's samples to rt_flush_dev()=
:
> > > > >
> > > > > ```
> > > > > 99.92% kworker/u384:3-  worker_thread
> > > > >   `-88.71% process_one_work
> > > > >       `-81.02% cleanup_net
> > > > >           `-81.00% unregister_netdevice_many_notify
> > > > >               `-79.42% notifier_call_chain
> > > > >                   `-78.05% fib_netdev_event
> > > > >                       `-77.92% rt_flush_dev
> > > > > ```
> > > > >
> > > > > For each device, rt_flush_dev() visits every possible CPU and sca=
ns the
> > > > > global uncached route population while its caller holds rtnl_mute=
x. If N is
> > > > > the number of devices, C the number of possible CPUs, and R the n=
umber of
> > > > > uncached routes, the cost is O(N * (C + R)).
> > > > >
> > > > > During namespace cleanup, other processes that issue RTNETLINK op=
erations
> > > > > requiring the RTNL lock can stall until cleanup releases the lock=
.
> > > > >
> > > > > A minimal reproducer is available here:
> > > > > https://github.com/arges/linux-reproducers/tree/main/rtnl-flush-s=
torm
> > > > >
> > > > > This series replaces each per-CPU uncached route list with a hash=
 table
> > > > > using the network device as its key. Each table uses 64 buckets.
> > > >
> > > > This sounds a bit overkill.  Also, this series still leaves
> > > > O(N * C) loops.
> > > >
> > > > Given unregistering a single device is less common than
> > > > destroying netns, I think the right approach should be to
> > > > make the route flush once in cleanup_net() + outside RTNL.
> > > >
> > > > Could you try this change ? (only compile-tested)
> > > >
> > > Excellent, I'll test this and report back.
> >
> > I found a pre-existing issue, which affects the previous
> > diff, so on top of it, please apply this patch
> >
> >   https://lore.kernel.org/netdev/20260918041439.2575935-1-kuniyu@google=
.com/T/#u
> >
> > and this diff :
> >
> > ---8<---
> > diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> > index d35b66b33bbc..c12e20e07749 100644
> > --- a/net/ipv4/route.c
> > +++ b/net/ipv4/route.c
> > @@ -1567,12 +1567,13 @@ void rt_add_uncached_list(struct rtable *rt)
> >  {
> >       struct uncached_list *ul =3D raw_cpu_ptr(&rt_uncached_list);
> >
> > +     rt->dst.rt_uncached_list =3D ul;
> > +
> >       spin_lock_bh(&ul->lock);
> >
> >       if (!check_net(dst_dev_net_rcu(&rt->dst))) {
> >               rt_replace_uncached_list(rt);
> >       } else {
> > -             rt->dst.rt_uncached_list =3D ul;
> >               list_add_tail(&rt->dst.rt_uncached, &ul->head);
> >       }
> >
> > diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> > index 6cffe8440b44..f22793abbbb8 100644
> > --- a/net/ipv6/route.c
> > +++ b/net/ipv6/route.c
> > @@ -155,12 +155,13 @@ void rt6_uncached_list_add(struct rt6_info *rt)
> >  {
> >       struct uncached_list *ul =3D raw_cpu_ptr(&rt6_uncached_list);
> >
> > +     rt->dst.rt_uncached_list =3D ul;
> > +
> >       spin_lock_bh(&ul->lock);
> >
> >       if (!check_net(dst_dev_net_rcu(&rt->dst))) {
> >               rt6_uncached_list_replace(rt);
> >       } else {
> > -             rt->dst.rt_uncached_list =3D ul;
> >               list_add_tail(&rt->dst.rt_uncached, &ul->head);
> >       }
> >
> > ---8<---
>
> Kuniyuki,
>
> I was able to test this diff, the previous diff you sent plus the fixup
> mentioned above. I was able to confirm even greater reduction in contenti=
on
> as measured by how much latency an unrelated process takes when waiting f=
or
> cleanup_net to complete. This makes sense since we don't even need to hol=
d the
> lock when processing those routing entries with your patch.
>
> Some rough average latency numbers with 36 devices, 160k routes, 8 vCPUs:
> - main: 137ms
> - my hashing proposal: 13ms
> - your patchset: 1.8ms
>
> I'd be happy to retest any proposed patches.

Great, thank you for testing !

I will post patches officially once my fix lands in net-next
(so should be after next Thursday)

Thanks !
