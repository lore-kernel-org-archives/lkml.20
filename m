Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73286324B20
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788929932; cv=pass; b=Cqxow9lUtvqKBu1WsU4u1OKmpxIaU+wtyYlkzb8FzHsfpzMupBlJNrucCcezwQy4gIKUb1G52wJM/yE1EBp0+IWxwkA+4JWK0gQMCBNaxaluiCoxBKWOzEMwQ4t0gWipVEEGIZVrgwp7AXY3KzgAAdjDicreIXEH76VCmnA/6Ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788929932; c=relaxed/simple;
	bh=6BSVwfZXLQVl5JnJAKqT01FUDTNPH8UPXa4syTmMYh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c9iyk59tVv4bnDynx23v5cB1l3ZlsrMnESUwDdRo5OkiY0jqpELglc1EJTmIBmQHRj3E522/+4mDyfOdDMArwwe/AH1Mgv8UqExl1OOHuGjrrsleyYhcL2YbsJ0qMVCoAiYWk0y2nmKHSMiTotncVpgo/h8HpkYPgIdSBAIMENw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=Wz2ZEf3a; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="Wz2ZEf3a"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff15fadfso5081651fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 21:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788929927; cv=none;
        d=google.com; s=arc-20260327;
        b=VbKryyrOZ4H+Y1k33ZnX+09V+vrHfuUnB6dXp0UoQoW8iDwDogZSu+0T4bvBr7jyUP
         0JWrEVtuQZvw41Jq/x9hvH9aFzOz28hNw5NCs13dTljtJWC/3UzrjCrUVd2fZFrjJlqN
         uTZrutZTC//ByI497TsyKLULcl7F7a7Upwh2+RXo+eZv6JLkC2KPyBBNyw1BSgdaaHE6
         Vc41pjhJlrIiA9Y7ppgwF6FMH6jHLgTWnlGqdtP0D3ZTj6NpNj3pH7qUHEImcvqUW/5p
         yyuwEz4ZXEkpPIFNHY9x8W8ohWRsSE3k3/V+WzT8O8ovhjONYXsfvDlMgOuqDjhD2i7w
         rRhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s9VFBDAskaJjI+w62/ArkmTkSfDF0OWlLydsynpPx70=;
        fh=6vCLwbcsLsOeRNW8+F4xlV2uPLLKtMI1mcLg95WPMb8=;
        b=YHKO0SOIYy7JrkCp/JD7/17nutQd3W4WSQUZcWRU0hAx3G/cFqV8mQHne1hgfl/T3X
         RQ4OwFDgd9Qzgxu9Az2X6Dla8epd11PWwxo12saRMMSaAB3pmjD0KuN5jyIOwSZGSb0S
         yQH/9KfSlpQRx7oZpi6lDqUzmubaFMOESiBd6pEKj3rkWZ6O8V78KJYCGL6tWaKhvZia
         8TaayWp/eCaiSjHGjm86cMl5G/VLcDojqoja1dc9vgmTMGj7Xy3R8UEqdOypGx52N7Fx
         5WhbMeTOiEA4lRpJ8NA5xuiz5yjxfXHZN9fdKdQHgvr0JaH5BOyzjwZWEAi3W6QfEddp
         p06A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788929927; x=1789534727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s9VFBDAskaJjI+w62/ArkmTkSfDF0OWlLydsynpPx70=;
        b=Wz2ZEf3alJY8lfT9VbS2GAYJIkGpbpIqZywjiMU1ePmzdADjIGSFi3k0tufwV8ritb
         +RL2qHBpvzW/+uvI4n3+GDedYx+MhG8q3xKQHG+ACoF6dnzKbl2MqAdFmdz3rBi+JD9N
         Dc5igON1tRBA0Dkm2jIiZ7/ScB/RVXSXP4ex+3sjb1dry0LsEMIj1Sb/1wfJSGI6tuAj
         Ma0zG13YxXuFUDV6K4MvKQl10Y1uC6+kz1ADechk4NrEmloKDMoQ41K59K2ly12lcBQ0
         ZUugN4qqb1N3aWkU+Nls8LbsnScbT2Jvuo/YqVinegP8lND8RoMwXwVFyhjhpa/4DgaV
         phOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788929927; x=1789534727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9VFBDAskaJjI+w62/ArkmTkSfDF0OWlLydsynpPx70=;
        b=iAwVQoZMrk11LdBXHn0twsEsqulJ/XWVi2qf5od2e5qGciI/DGA1mIZzY1CNUjw17M
         hYKV2uMOIL+16ThHcGmjjz/xIC1j3tbWCOc/rhyhW0YrBrhRt6ZXc0OedkwKoi9Xagwr
         rzdbyJ9LPomLW479MiuHlbC95J+vKJP0y8CkiUaGKCbqp/98m+beeCZprIhBGg0+BrhP
         U+rWiHnTWo53gWlMphEzjQ4nHLJHQjE8FGbYCJqgP86uRNKZsAuktqpGFnSNYoVGN2Vp
         4ltvhcqXUP6dI+/yXYh4xCWj4vE7z1Th1brC/rYDuxwYyiEK7ii4yUbYGyVFHntFbUk2
         CFDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSS3Lrc4O0duDFWG/QFLRDIyN5vJBiyGP6yo0RQsh+hsaPM5lpPJEzLE/EmITJzXCoDBgMkfAqsP8WRCA=@vger.kernel.org
X-Gm-Message-State: AFuF++lUEOG+4VJJ7fNo24isrO1EonUmXwKPFhOowrKDa7CSWmlnyAkG
	IJ5nFasOcbIPsOJpbr96Liogdw2dGqh6yikGinFDNlDX0RYqgKzOlMA7ewuMwThF36uzztjJfEI
	cWmPIdPEq1ULbJ3tjgzknxelK1uCPbtnrR0cH47sWa0Q=
X-Gm-Gg: AYBFou1JGZBCJbU7Mw/EgMkgWD3mZnNZjsASE8oLpg2a37oj12ZeAi4yRikBVvavE20
	e+NjdFaU0e5d3rGZW1FvGyZR5hBl3TaDRd84aMNf/8Iu38BxZ8lFzw4ytuT3Zd6ireFSDisPck1
	+DJgtwPqUFi7Y2XvR8ICPxutSRA5pX1/iB0r0A3mLoKIeLZbo9UakeYDLHkP6ddgU9gQMhx3vj3
	55mYXejvfSrHHnSOI3eTxXMaxR4guSmdRdLuvNLMmjJksu6eWg7YdyTshFM++mkjkrE+oiTRru/
	tgJRTRMwFDlDriNQhtN95TNDuHlU0zOW0h6v2z1/pAzOifjbO8zYZ3+aKJELwnqs4MyWCS22gvB
	/heKN9LP/MsDHQwMTFFV0
X-Received: by 2002:a2e:bcd2:0:b0:39c:a24b:f0b8 with SMTP id
 38308e7fff4ca-3a4881c1db7mr11397781fa.2.1788929927221; Tue, 08 Sep 2026
 21:58:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a2bd6f3ed29919a7328363b548299ae583f052b0.1788539302.git.zihanx@nebusec.ai>
 <20260908121740.432088-1-horms@kernel.org>
In-Reply-To: <20260908121740.432088-1-horms@kernel.org>
From: zihan xi <zihanx@nebusec.ai>
Date: Wed, 9 Sep 2026 12:58:35 +0800
X-Gm-Features: AcwNN1XLjO4F21biATQaD_969-WKwl2sd6yzBtfOuB3Ma_LEzaAoVfhJP4tHTRo
Message-ID: <CAANe3eSNAtgh0wiN56TEk_fKhDrLoJGJxhEA+ZBJ14-PK-rjvA@mail.gmail.com>
Subject: Re: [PATCH net v3 1/1] rxrpc: fix encap_rcv skb accounting exhaustion
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, dhowells@redhat.com, marc.dionne@auristor.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 8:17=E2=80=AFPM Simon Horman <horms@kernel.org> wrot=
e:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/a2bd6=
f3ed29919a7328363b548299ae583f052b0.1788539302.git.zihanx@nebusec.ai?part=
=3D1
> ---
> > diff --git a/net/rxrpc/io_thread.c b/net/rxrpc/io_thread.c
> > --- a/net/rxrpc/io_thread.c
> > +++ b/net/rxrpc/io_thread.c
> > @@ -52,6 +50,19 @@ int rxrpc_encap_rcv(struct sock *udp_sk, struct sk_b=
uff *skb)
> >       }
> >  #endif
> >
> > +     if (atomic_read(&udp_sk->sk_rmem_alloc) >=3D READ_ONCE(udp_sk->sk=
_rcvbuf) ||
> > +         !sk_rmem_schedule(udp_sk, skb, skb->truesize)) {
> > +             sk_drops_inc(udp_sk);
> > +             kfree_skb(skb);
> > +             return 0;
> > +     }
> > +
> > +     skb->dev =3D NULL;
> > +     skb_set_owner_r(skb, udp_sk);
> > +     skb_dst_force(skb);
> > +
> > +     skb->mark =3D RXRPC_SKB_MARK_PACKET;
> > +     rxrpc_new_skb(skb, rxrpc_skb_new_encap_rcv);
> >       skb_queue_tail(rx_queue, skb);
> >       wake_up_process(io_thread);
> >       return 0;
>
> [Severity: High]
> This borrows UDP's rmem accounting without borrowing the lock that
> protects it.
>
> rxrpc_encap_rcv() is called from the UDP receive path in softirq
> context with neither lock_sock(udp_sk) nor
> udp_sk->sk_receive_queue.lock held, and nothing serialises two CPUs
> delivering to the same local endpoint. Both new accounting calls in
> this hunk perform an unsynchronised read-modify-write on
> udp_sk->sk_forward_alloc: sk_rmem_schedule() reaches
> __sk_mem_schedule()/sk_forward_alloc_add(), and skb_set_owner_r()
> calls sk_mem_charge(), which is the same non-atomic
> WRITE_ONCE(sk->sk_forward_alloc, ...) update. The newly added
> skb_orphan() in rxrpc_io_thread() closes the loop from the kthread
> side: sock_rfree() -> sk_mem_uncharge() does the same non-atomic
> update concurrently with softirq enqueues on other CPUs. Note that
> only sk_rmem_alloc is atomic_t here; sk_forward_alloc is not, so the
> atomic_read() guard at the top of the hunk does not make any of this
> safe.
>
> The normal UDP path does not have this problem because
> __udp_enqueue_schedule_skb() performs the forward-alloc bookkeeping
> and the skb_set_owner_r() under sk->sk_receive_queue.lock, and
> udp_rmem_release() takes the same lock before reclaiming. The
> consequence of losing that serialisation is not confined to this
> socket: the drifted sk_forward_alloc is eventually handed to
> __sk_mem_reduce_allocated(), which subtracts it from the protocol-wide
> udp_prot memory_allocated counter, so a flood of RxRPC-shaped packets
> can skew global UDP memory accounting for every UDP socket on the
> machine. That is a worse failure mode than the unbounded rx_queue this
> patch is trying to fix.
>
> How do you want to serialise this? Options I can see are enqueueing
> via the existing UDP receive-queue locking rather than open-coding the
> charge, or holding local->rx_queue.lock across both the charge in
> rxrpc_encap_rcv() and the skb_orphan() in rxrpc_io_thread() so the
> charge and uncharge sides are mutually exclusive. Please say which you
> intend, and make sure the answer covers the I/O-thread uncharge path
> too, not just the two enqueue-side calls.

Thanks for the review. I agree this is racy: sk_forward_alloc is not
atomic, so a BH encap_rcv() on another CPU can update it while the
I/O thread orphans the skb.

I intend to keep the skbs on the RxRPC local queue and serialise UDP
rmem with sk->sk_receive_queue.lock, the same lock UDP uses:

- rxrpc_encap_rcv() already runs in BH, so it can take spin_lock()
  around sk_rmem_schedule() and skb_set_owner_r();
- the I/O thread takes spin_lock_bh() around skb_orphan() for PACKET
  skbs charged in encap_rcv(), so a concurrent BH charge cannot run
  at the same time.

I will not enqueue these packets on the UDP receive queue.

A v4 addressing this is coming shortly.
