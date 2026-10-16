Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8EA3148B4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792114967; cv=pass; b=OIuE1fisIO1Vj96LNRzs0EeIz5CPNJtaSPzIUvScCFHrqq6j2xoH9TtRGkGPy2yk/kZCHwKm0Zv+EWuUqcU46XjYccArvzE5JnR7cKVhaLLpDClwLqmLHf3UrRDMw5/MOZdMmih1u3uUsq3B59bLh5GvKP7HGKkDb8vR0jZPT6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792114967; c=relaxed/simple;
	bh=6i0WeLMlEghQpb8uyJNW0pyE1aTfMio3zAYz4uekepw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYAS6B4XHjAr81iS+ya7Q7YHBuRaE+kh3R0mu8XKwjFIhRHfgVJihQhD1FrCZddighg0wurK6eExlw29FafHQl9fZV4VXyLh7REoh7/tjaDwX4GtvUeMJXhnMBrjHDuxZ6ENCYK0B4nm6utjwvEZnS83PvXc/lr6JGBsovDR0+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=dHwUKkxt; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="dHwUKkxt"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7c03744ef27so694436137.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792114964; cv=none;
        d=google.com; s=arc-20260327;
        b=WYqybf0h0hN9WN4BAmej1umySxfzfbX+4eFo0eBJD9ppxLhFrugrytn5bkkckp6g9e
         Edtoj/BxduReEerH22e+SfxAZnB4tNZ1B0wVnJW9OOQkuKC8DSFYSpCAgTyd1uy1w3dZ
         cgyHrcxF/Iidv9GMyKbgZVIHQDc0VUAaYhDsW2yE7GG+lyU1Qt3Lnf1rtklurPlZmMjD
         JNOJFvLBQKhvl38Sfjm4pQpHIB1JoB4sW7AUxZ0ELtjR069D702V+NRZpC1fH/xgaCXP
         d4jtU2B/fFrLvln6WcypVCYKUI7qSTISXBmI++pSqjPINnmlyrQ3gKraPeC4+oQR7/1w
         Rrhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vVZmsIf6HaIgsl+foEZt+wGwwAVohSj5QpggFF4Hfm0=;
        fh=lnpihNFwMncLXDJTnT8twfuVyFhdQT4O1cbqC1olgTQ=;
        b=inhZ1clppWivHPKX4P28BwMDlVf4UIgSTzjtR/Jikd1f6DAq+0+A5WexgHRe6nFtFo
         vCXYo2N0OR5HMLnEmJMSchCK1XbmwWet+h7y4t5HDI+0VIMd+xl/w/KVHjiBFelUn/cm
         d8L8+79pFDNDSHRuCj0gsAsKA4RwBZ8gIwOdZbtXxe5UzLzlaIejtFzbfInr54WIuR1n
         15HJiokHt0EgzaGCQWgC9TeLMyXPDnhAP9Yfz7aL++vm6C1F/O+c3idGyw7RXj5y+fKS
         PJgp6Sz/gOqjkZ5GBwpAvKG5HlKPDrJRRGjcUoBj4IRo2YvDLdIE1BqgGnYzL20LAX4x
         OXiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1792114964; x=1792719764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vVZmsIf6HaIgsl+foEZt+wGwwAVohSj5QpggFF4Hfm0=;
        b=dHwUKkxtT9v4HUYv2Lld2UBpMEcFf3QrincCRGO7nxo0C2NCt+rLHbMsRVi0CTdbXC
         CAOa/ulY+xcyzRp7Lsx1CZV8jwOF9L0fK47LvHAp2V7k/52bZxoi9dXBS+N59qc5RwBi
         LcvRfeO3yfDVTHbW3F/6EdQBtBszkeCvXPAn1/7wu1S/7KdWESV8fJFbXSuXnI8dKOw6
         6fWENLEA5WfJOeikjeARsP1G5yJg98Kl+xgJUCQY4CQ8tcdG5BjJ52R+ZlZCEqSa1rAj
         UV7aPcRqw1thDiWWUtrWSnXuqVNRO+QF/0dJr2YQjEoUxf3tgzQsQwrWmo1g0biXT9bK
         LNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792114964; x=1792719764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVZmsIf6HaIgsl+foEZt+wGwwAVohSj5QpggFF4Hfm0=;
        b=Hu2l4/8TWbDuiJqieRM5g5oiMe6dbfj/KmKJhffWrZ7NhiL8lK0Wn4AwK59iZDSent
         Zu/sQNrgOtzlPHROLLB7sghSfYVRudzo5WW1/Rxsp60FB/bIn1ptUaHMYe1TGYJDZ4Lj
         f+ZTems436Am979EvhtUtxeTYgUKkWnd2vhXbw8uhT1Ht+H0EYXzhlPqiv56eo1DG11L
         cnpr8+3M+ZjRPtZACRd8rq6y5P/3RtKEbOkUb1qCoreOeREFFJrfOAJvg6+JBE2r+K3g
         DoXO62PHQMfW14lqxKycuoX1bN9ysPQ5HtRuKNYzSDrNgyZmWdIH0idijWBMbRapvzF2
         jYQw==
X-Forwarded-Encrypted: i=1; AKwUvBxvfqczR4t3yNf4KybAzDuEKUPxQzpcS+HbIR/UKearIdnhnL2SSH+De//GlBJ+78XX0kGivxJjbboxhYg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRIlxQjRA/msyZJXyP+gd7ZB5LueDpHipA/p/rFiyTB0PuvMpO
	kjg8dLctq1x9n5fETP2WALhbY5MG8T648TCbRzDwYM9n7shbOr2NsysrABm5wmo4eWdtPTH4ZhR
	h8xLAXG2/7mBkWlo/m9Vx32WxDgfsuBC0sGvW3l7o8w==
X-Gm-Gg: AYBFou1oFJ+W35QmrQ2BfyW5qFX6A8jney1DkfBLTZcAo3xXvwqPxGyBBhM6TExnT9U
	Ylg8CZPQ4/Uj6u+7OR2Q6FfUswmY2ZrJNp3/LyRWK+3603+GdiDwF0O6j1e0cUHM7cpatZqmUOh
	MagsqBG4wyGhptwvzqnTkOiDABKtPY21x5R8zudzVLaFI8pOPlHQKxKANL54M+evMmsxPGIvxpt
	nhXf4MPIgqXBJpo3cbLNtYrTwh3WbtayYvBB8Oo5GDcGGM2EiaTCC/tDgNXEqE3XET33hNERq5h
	aF8Q5SnBdE/FELcgYNub2mJ/lrbWwGfmKWOPaUVovYPksS5DsBkeJO/xury37Wu0w0djzoKbDkD
	2M+l+HD6UsJ9jr+Xom6ycEpKOv24vrXXZSwhA3jePtSbRsdaGF7l3pUghh449/STEaRjmqnTDDC
	yHG3dFpVUoDJ6PUKz74WEWXCENvSUVeexIM/q8kpQ=
X-Received: by 2002:a05:6102:1624:b0:7b4:740b:9b6 with SMTP id
 ada2fe7eead31-7cb373de30cmr5338155137.26.1792114964042; Thu, 15 Oct 2026
 18:42:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013033920.2069285-1-rjethwani@purestorage.com> <179195063165.434549.13463545924832836566@kernel.org>
In-Reply-To: <179195063165.434549.13463545924832836566@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Thu, 15 Oct 2026 18:42:32 -0700
X-Gm-Features: AclHuK8N27mGc1KdN4KK4gKo4gYl82sgI4zi_aMkVLpv1hbhFdnlLIxftdE1ahY
Message-ID: <CAKaoeS1Bvpm2OQ_yrfqe6gJRMdY5UZ2P9oNc-d4CEqTMSUmuyg@mail.gmail.com>
Subject: Re: [PATCH net] kcm: defer receive parsing when the lower socket's
 read_sock may sleep
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, leitao@debian.org, zirajs7@gmail.com, 
	runyu.xiao@seu.edu.cn, jiayuan.chen@shopee.com, brauner@kernel.org, 
	sagi@grimberg.me, hare@suse.de, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:03=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] In net/kcm/kcmsock.c, psock_data_ready() now passes every
>   data_ready event on a non-tcp_read_sock lower socket (for example, a=E2=
=80=A6
>
> --
>
> kcm: defer receive parsing when the lower socket's read_sock may sleep
>
> This commit changes psock_data_ready() so that strp_data_ready() runs
> inline only when the lower socket's read_sock is tcp_read_sock(). Any
> other read_sock, such as kTLS's tls_sw_read_sock(), is now deferred to
> the strparser work via strp_check_rcv(). The goal is to avoid sleeping
> in softirq context.
>
> > diff --git a/net/kcm/kcmsock.c b/net/kcm/kcmsock.c
> > index 71af69d442f21..381a8f0b792e3 100644
> > --- a/net/kcm/kcmsock.c
> > +++ b/net/kcm/kcmsock.c
>
> [ ... ]
>
> > @@ -358,8 +359,19 @@ static void psock_data_ready(struct sock *sk)
> >       read_lock_bh(&sk->sk_callback_lock);
> >
> >       psock =3D (struct kcm_psock *)sk->sk_user_data;
> > -     if (likely(psock))
> > -             strp_data_ready(&psock->strp);
> > +     if (likely(psock)) {
> > +             struct socket *sock =3D sk->sk_socket;
> > +
> > +             /* strp_data_ready() calls sock->ops->read_sock() inline =
from
> > +              * this softirq callback. A ULP's read_sock, such as kTLS=
's
> > +              * tls_sw_read_sock(), may sleep, so hand anything other =
than
> > +              * TCP's own to the parser work, which runs under lock_so=
ck().
> > +              */
> > +             if (likely(sock && sock->ops->read_sock =3D=3D tcp_read_s=
ock))
> > +                     strp_data_ready(&psock->strp);
> > +             else
> > +                     strp_check_rcv(&psock->strp);
>
> [Severity: Medium]
> Will this serialize all KCM-over-kTLS receive processing on a single
> system-wide worker?
>
> strp_check_rcv() only does queue_work(strp_wq, &strp->work). strp_wq is
> created in strp_dev_init() as an ordered workqueue:
>
> net/strparser/strparser.c:strp_dev_init() {
>     ...
>         strp_wq =3D create_singlethread_workqueue("kstrp");
>     ...
> }
>
> So only one strparser work item can run at a time across the whole
> system. KCM psocks, the sockmap strparser in net/core/skmsg.c and
> espintcp in net/xfrm/espintcp.c all share this queue.
>
> With this change, every data_ready event on a kTLS-backed psock ends up
> in this path:
>
> strp_work()
>   do_strp_work()
>     lock_sock()
>     strp_read_sock()
>       tls_sw_read_sock()
>         tls_rx_one_record()   /* sync AEAD decrypt or crypto_wait_req() *=
/
>         tls_read_flush_backlog()
>
> While one psock is decrypting or waiting there, do_strp_work() for every
> other strparser instance waits behind it on kstrp.
>
> Before this patch, the common case ran inline in softirq on the
> receiving CPU, so several sockets could be processed in parallel. kstrp
> was only used for the sock_owned_by_user() and -ENOMEM fallbacks.
>
> Could this add receive latency for unrelated KCM, sockmap and espintcp
> users? Each individual wait is bounded, but a local user who controls
> KCM+kTLS sockets could keep the shared worker busy. Would a per-psock or
> unbound workqueue for this deferred path be a better fit?
>
> > +     }
> >
> >       read_unlock_bh(&sk->sk_callback_lock);
> >  }

Thanks, the point about kstrp being ordered is correct, and it goes further
than this patch.

kstrp has been create_singlethread_workqueue() since strparser was
introduced, and the serialization already bites today. strp_work() takes
cb.lock, which is lock_sock() for every in-tree user (KCM, sockmap,
espintcp, ovpn), so the single kstrp worker already stalls for as long as
any process holds the socket lock of any strparser-attached socket. That
wait has no bound and is a bigger hazard than one AEAD decrypt. KCM
over plain TCP already queues to kstrp on attach and under receive-buffer
backpressure (kcm_rcv_ready() -> strp_check_rcv()), and strparser itself
queues there when the socket is owned or on -ENOMEM. This patch makes the
deferred path more common for KCM-over-kTLS, which currently sleeps in
atomic context. It changes nothing for plain TCP psocks.

Nothing in strparser relies on kstrp being ordered. The workqueue core
never runs one work item on two workers at once; strp_work() and
strp_msg_timeout() both run under cb.lock; strp_done() uses the
cancel_*_sync() variants; and separate strparsers were never ordered
against each other, since the common strp_data_ready() path runs inline in
softirq on whichever CPU received the data.

So rather than a per-psock workqueue, which would need a new strparser
API, v2 adds a follow-up patch that allocates kstrp with
alloc_workqueue("kstrp", WQ_PERCPU | WQ_MEM_RECLAIM, 0), per-CPU and
WQ_MEM_RECLAIM like kTLS's tls-strp. That removes the system-wide
serialization for all strparser users, so a slow or lock-blocked psock only
delays its own work item. v2 also reads sock->ops with READ_ONCE(), since
kTLS can replace it with WRITE_ONCE() after the socket is attached to KCM.

pw-bot: cr
