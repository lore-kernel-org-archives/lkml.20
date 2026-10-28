Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200843;
	b=jb8tb0wu03u6fbA218mHsH0locPuRhL0ynrIVbZOobJ2pXb2iov5BRKZapnAyuMBg62L
	 TkI/pEUjBGakBtV44ZXo+cTt3GOcSi7y5ysIRZFui4WPnu2fVpNmCvl1JfM7atiBVEd2M
	 dwSxWOK+TM57jqXbQzVcJzDo0F5FOKBPL6JOzni9XhY6HemyzWAhAVUutac6XUfi+8qMl
	 7DNOtR8fzYjB1yjIFyf4B90b2jmWX75f/Zegh1yGL0yeQjR4v0h6xWsjlvy5r5DtNffPY
	 lX5EBOH2u47mc8Kw4SqHCyr5qBogrFO8Q5CIDM7uXatHdCZ6MA537kbx++OhmPMXsgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200843;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M9H03uw9rwsnXe1/kt8jL1QHRA9wURlXY3aLRAghr50=;
	b=3m2D2PXAeqqANdpENIK5aa6i51WOhKD5QSXvwn6pr3p5dAKfhReBOx0A9Wl/kkPUjSrE
	 dBZJ5vTjJOunU2hGVIusrOZ3tI/Kuucu8/ZTt7+oQTDfRNg+ZGscGhxq/tEN92RB6dRAr
	 bV+5XVCZdjs9Qcnjw3OKxyIU1Too04icGOC7vJpQrWbNcWGLRDUjYhiTRtEEQE6vqV3jc
	 BxGu8gKGN0EESIbgYJAFpllEzhCN0BlhjMOUGvBNheeDRURdIO5gBNnDY9BzWBTzSA7wi
	 rN1hUpxIzWdD1nxxFNTI3EnklIogSEBL0eih3tY35nYgllwYhD/RzC8LQqzgxmAwWgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ntkb2XS1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1853606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ntkb2XS1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789081F01828
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793200842;
	bh=M9H03uw9rwsnXe1/kt8jL1QHRA9wURlXY3aLRAghr50=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ntkb2XS1JA72z7HgBKdwki9QR3bY/bNslQQXySnA5JcaHe7l8pQ0GIwuo0R8w7lbv
	 i5m3v6/wdmACZuK+CzKnmhANtPleEPF3mPwPrxEQZXHzB83LnpNJlrw0pSx9ywl3ym
	 jdzC9i74kAk16bRw78cZw3MJFeQ2/NeoyBkSI1QJSOCLh9Pr1Q5TojCNhjCbZVtlB0
	 u/r3/jrk4bLJPs8FbTB/ue/3cdiNiJ7isp4jGbWK1j/EuzaOViwEGD1leT5UcDsYUz
	 4d1jD2T9IwpCxxQBCCOuei5TednUmQohi0spuSTU37MILrMp8JHdOAgvDJEplcWRDp
	 zTi+Fxl/o0+gA==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-49ddddefadbso518688fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:20:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwjShtw6SxJC11YiCGBchr+xVKTuRcmDmpPcvZ5TdgAdAgczJOYhAqeJkGTAyOTskKSwtk6EEH2AniLdsI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmo5v7pxUwi9Xl1bSMIcFykSt/jz1pGRPNxkuxFAhV8RDZqyNT
	/m4OqCgpENsHQR9Qtpup+f55ikx6jrkVHELixyOy3bZs+19djbYC7CA3xtT8d5PlocG4CwullKl
	rBPrh4om6p14RlGl6k3dL4DU2jQVLHqc=
X-Received: by 2002:a05:6871:3324:b0:485:d31b:7767 with SMTP id
 586e51a60fabf-4a8bb549eacmr2121417fac.37.1793200841827; Wed, 28 Oct 2026
 08:20:41 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026032216.1145201-1-tavip@google.com> <20261026032216.1145201-2-tavip@google.com>
 <CAL4WiiqQ3cychvCccpNW+WOU2SYCfNt6L=wgPkNmfTLHLy605Q@mail.gmail.com> <auALgSUuoYmfKSz3@google.com>
In-Reply-To: <auALgSUuoYmfKSz3@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 28 Oct 2026 16:20:30 +0100
X-Gmail-Original-Message-ID: <CAL4Wiirpss0inrC7gKhsNfwUO-KGZ-nnF5h7N8jXS9qziiSW4A@mail.gmail.com>
X-Gm-Features: AclHuK8qub-e-4irsY79-0gVFC2QdUE5nzCC7FcYSl-R8IvezAwIoZ7r3NmeCSQ
Message-ID: <CAL4Wiirpss0inrC7gKhsNfwUO-KGZ-nnF5h7N8jXS9qziiSW4A@mail.gmail.com>
Subject: Re: [PATCH net v4 1/2] tcp: clamp return value of tcp_wmem_schedule()
 to non-negative
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Octavian Purdila <tavip@google.com>, Eric Dumazet <edumazet@google.com>, 
	Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 27 oct. 2026 =C3=A0 03:28, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> On Mon, 26 Oct 2026 13:06:56 +0100, Eric Dumazet wrote:
> > Le lun. 26 oct. 2026 =C3=A0 04:22, Octavian Purdila <tavip@google.com> =
a =C3=A9crit :
> > >
> > > When sk_wmem_schedule(sk, copy) fails under TCP memory pressure and
> > > sk->sk_wmem_queued already reaches or exceeds sysctl_tcp_wmem[0],
> > > tcp_wmem_schedule() returns min(copy, sk->sk_forward_alloc).
> > >
> > > However, sk->sk_forward_alloc is a signed int that can transiently
> > > become negative when tcp_collapse() re-packs partially read or high
> > > payload-to-truesize SKBs in the receive queue and charges newly
> > > allocated SKBs via sk_mem_charge() before freeing the original SKB.
> > >
> > > If tcp_wmem_schedule() returns a negative value, tcp_sendmsg_locked()
> > > passes that negative copy length to skb_copy_to_page_nocache() ->
> > > copy_from_iter_full() -> check_copy_size(), where it is converted to =
an
> > > unsigned size_t > INT_MAX, triggering a WARN_ON_ONCE(bytes > INT_MAX)
> > > in production and returning -EFAULT instead of waiting for memory or
> > > returning -EAGAIN:
> > >
> > >   WARNING: CPU: 1 PID: 939331 at include/linux/thread_info.h:249 tcp_=
sendmsg+0x10c1/0x1530
> > >   Call Trace:
> > >    <TASK>
> > >    __sys_sendmsg+0x292/0x490
> > >    do_syscall_64+0x88/0x340
> > >    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > >
> > > Clamp the return value of tcp_wmem_schedule() to [0, copy] so callers
> > > treat negative sk_forward_alloc as 0 available bytes.
> > >
> > > Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under memor=
y pressure")
> > > Assisted-by: LLM
> > > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> > > Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> > > Signed-off-by: Octavian Purdila <tavip@google.com>
> > > ---
> > >  net/ipv4/tcp.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> > > index 87ef6d5cbfeba..0e062fcd94a6c 100644
> > > --- a/net/ipv4/tcp.c
> > > +++ b/net/ipv4/tcp.c
> > > @@ -1037,7 +1037,7 @@ int tcp_wmem_schedule(struct sock *sk, int copy=
)
> > >         left =3D READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_wmem[0]) - s=
k->sk_wmem_queued;
> > >         if (left > 0)
> > >                 sk_forced_mem_schedule(sk, min(left, copy));
> > > -       return min(copy, sk->sk_forward_alloc);
> > > +       return clamp(sk->sk_forward_alloc, 0, copy);
> > >  }
> > >
> > >  void tcp_free_fastopen_req(struct tcp_sock *tp)
> >
> > I do wonder if the following fix could be better (no change in the fast=
 path)
>
> Exactly, this looks better too, we can avoid negative
> sk_forward_alloc and clamp().
>
> The packetdrill will need to be adjusted as it triggers cgroup
> OOM with this approach, or we could defer the test to net-next too.
>

Let's defer the test. We also have an upcoming fix for tcp_collapse() anywa=
y.

Octavian, could you resend a v5 (sorry for that) ?

Thanks!

pw-bot: cr
