Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606439;
	b=mOehFccYb+H+8LT0nkeIPdQOsOmCTGebf6ws0HAljb+aWbniD6z4vlqTHcgSY8RDkh91
	 Ot8Q3MIEiTil0z72ILDFX/iIjBf/y5wNZKno2QEgFiOSasO0AtTKkndri1RjyIdJS06Fe
	 RaTm+aCYoMzmAdOnGUDVHS1UuRhTm2ze6wlWnTRWDUBFUOguro8FN0Fj1RZWaztbLB96U
	 a3i62AGLMkPUuwJBpMHh0e7ipt/CfyOu6UgLG0Bss/ko6jDn0gvh9wskyuUTKKLaSZUxc
	 ZGDjku5oU+LATbbzPLVHgmGFKeR/YrVTJQIbM89ptbc8MReqcnOFkCwlEpqR2HXI9NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606439;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UxeipMHe24UJoW0StdcKRq8hhjWgp+O+lIamilF6Bf8=;
	b=MR0gxboG2if1C7b5dRcqjGf5Sr19eAnrFDCiab5jiBhe2nxqLWhQjKhrPYyVOSOsoN9O
	 bvvsa4hKV/yImpWsI3bjIWGfvsFg19oNcfYFTe/xIWLBsZidOCfeEjEmN5i0/vYQaXMB0
	 vmdpSgZF2H8tshUz30FM82YVpRGexfP/AmjkVNT/9zHns885a+YRvFn3wWydfPzcTgRU4
	 K8CLcM1Uj0m66bb/OWmhZJ6W/NVtdveyx7nE9gRVeQ+2dsEA6YVl471Q8jfAmlCVNukYm
	 Be3BK9QyTkX3JOaJWzSJU0NV1BfBO96n9Z80vH2QgrJEUzMpf9MIwaBfMA3+0vnLsZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CObg6+Ql;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24C6606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CObg6+Ql
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6311F0093A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793606438;
	bh=UxeipMHe24UJoW0StdcKRq8hhjWgp+O+lIamilF6Bf8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CObg6+QlYojDX1yQsGZ6K1F5kKqIK1MTG5B032yx80tfmrMASwF2qnFxf9oZBwrcF
	 owqEhqKJ61JoQGmQ/Ja9/xmhiHdAkM1WN9qS1G3WaHnjO1Q2rwgW0njo4+VDZp3lZp
	 8vAyX/Fa2PJK9ThlEgDBzNkfSr2KD/YlmmcCNCXREU2mylVqqOfLI6g73Ji4vT9Jq3
	 OF1s1Cf+19gOm2WwCLugwIh7lNcaEvJM9UfAf81xj81IOg3Zt9kdnxyfAkpi9i8Gt+
	 PVvQN/+tHM2ukfqJxk3y9CNeUK9veG7U8GbFKRzQOo0peE1uOVht0xsNVQkdibm4oX
	 DsC5DeWuYaMLQ==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-70b875f6f1fso2669621eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:00:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxldnKrvRGF6we4ZSeMs7YSwuPZYkk/6P4guTPFMPf4HrLzweUvMcBKxLXN+KA3RaoDlDxhfRWjZY40ZdA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4fYwCNKLzpTk6Q1NrfBkgSVYTh8sferKTj0R8a0jfUg6YwgC3
	udPMAduCLNA8xnRJyFalYX4QPQ5OKJzZ4pNuXf8KgFdwTowDN9OOawE0d4xh7p6IpYou+d7YsFm
	ZbZWWR7yoNok9jxUKp0rGkNxXiHolD+c=
X-Received: by 2002:a05:6820:3387:10b0:6f6:dac4:65e6 with SMTP id
 006d021491bc7-714f29b29f3mr3741896eaf.41.1793606437869; Mon, 02 Nov 2026
 00:00:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102035943.9700-1-qingfang.deng@linux.dev>
 <bfbc4b3c-fe19-4070-97b4-4ff8ded06011@linux.dev> <d6ba5426-fbee-49da-b18b-1419fd84fa0f@linux.dev>
In-Reply-To: <d6ba5426-fbee-49da-b18b-1419fd84fa0f@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 2 Nov 2026 09:00:26 +0100
X-Gmail-Original-Message-ID: <CAL4Wiio9VXUtGg4UrFFU1kG2JENYL8xi0DzsDmhOp=zXs0DiUg@mail.gmail.com>
X-Gm-Features: AclHuK9SmNGORmbePi3c69Ve3JiodtYwh0DOBYxIaVnw8tAtpaEBH0-uq__Cwu0
Message-ID: <CAL4Wiio9VXUtGg4UrFFU1kG2JENYL8xi0DzsDmhOp=zXs0DiUg@mail.gmail.com>
Subject: Re: [PATCH net] tcp: initialize send sequence numbers before
 deferring TFO
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Yuchung Cheng <ycheng@google.com>, Wei Wang <weiwan@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 2 nov. 2026 =C3=A0 08:41, Qingfang Deng <qingfang.deng@linux.dev> a=
 =C3=A9crit :
>
> On 2026/11/2 14:11, Jiayuan Chen wrote:
> > On 11/2/26 11:59 AM, Qingfang Deng wrote:
> >> TCP_FASTOPEN_CONNECT can return from connect() before tcp_connect_init=
()
> >> when a cached cookie or cookieless Fast Open allows deferring the SYN.
> >> At this point write_seq contains the initial sequence number, while
> >> snd_una and snd_nxt have not been initialized to that sequence number.
> >>
> >> Consequently, inet_diag and /proc/net/tcp{,6} report the initial
> >> sequence number as the send queue length despite no SYN or payload bei=
ng
> >> queued.
> >>
> >> Initialize snd_una and snd_nxt to write_seq before marking the
> >> connection as deferred. Both sequence-based queue lengths then remain
> >> zero until the first write starts the connection and runs
> >> tcp_connect_init().
> >
> > This patch looks good to me. But idiag_wqueue can still go negative
> > on the normal connect path, since the socket is already hashed and
> > diag does not take the socket lock. We always set write_seq first,
> > then init snd_una later:
> >
> >    tcp_v4_connect
> >      WRITE_ONCE(tp->write_seq, st.seq)
> >      tcp_connect
> >        tcp_connect_init
> >          WRITE_ONCE(tp->snd_una, tp->write_seq)
> >
> > Can you try this instead?
> >
> >    r->idiag_wqueue =3D READ_ONCE(sk->sk_wmem_queued) ?
> >                      READ_ONCE(tp->write_seq) - READ_ONCE(tp->snd_una) =
: 0;
>
> This does not guarantee the load order on a weakly-ordered CPU. LLM
> suggests using this load-acquire/store-release sequence:
>
> r->idiag_wqueue =3D smp_load_acquire(&sk->sk_wmem_queued) ?
> READ_ONCE(tp->write_seq) - READ_ONCE(tp->snd_una) : 0;
>
> Then in tcp_connect_queue_skb(), replace sk_wmem_queued_add()
> with smp_store_release():
>
> /* Paired with smp_load_acquire() in tcp_diag_get_info(). */
> smp_store_release(&sk->sk_wmem_queued, sk->sk_wmem_queued + skb->truesize=
);
>
> What do you think?

Please do not do this.

/proc/net/tcp and inet_diag dump sockets without holding the socket
lock. They provide a best effort snapshot, and transient inconsistent
values are expected (see the comment about rx_queue in get_tcp4_sock()).

The window in tcp_v4_connect()/tcp_v6_connect() is a few usec, with the
socket lock held by the caller. Adding memory barriers in the TCP stack,
on a field updated in many places, to cover this is not worth it.

The bug you found is different: with deferred TFO, the bogus values stay
forever, until the application calls sendmsg(). Your v1 fixes this.

Note that tcpi_notsent_bytes (tcp_get_info()) is also fixed by your
patch, you might mention this in the changelog. Not a big deal if you
do not want to send a v2.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
