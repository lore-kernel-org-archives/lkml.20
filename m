Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607654;
	b=Xjkeco1XjIbU9+EJ99GjEX8AHrh4ti0vtfMLqGykWBvbGGvNAPbJpGXgrx2VHJPzb7jQ
	 CvTX7JSXETTkEPcM/JKHm3trpWkBrnOAIJOO8/lzJWmx1ZptKKE7esj+MU1PFqzUZrsnU
	 j3sbMyUde4knX3EnHq65P9OZMQRSwh47jfWci/sw0jZCHoYssSXfcZcuLxLYlLtyVak0w
	 9xa/1bpjJO33weA/vC2BUEfFQ8qxcP9qVl+ssz+3lnZEv/oPQUt2GlxLqm69LwA9wzukV
	 dNClM9/yc3GcC95tC3OHcRGsewq0qdjmM3G3WDRpMW7KG1qzA+IFIL+oA6sELp9pk8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607654;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=a94/cjy7p6szhw9hzS0p+6MZPDElnqdXk1fwfe+RjpE=;
	b=CSccJfa2wSrKd2b8AsyT2KqDWg11nNuNLP8h4QF7d4p83UvpizbC4/FCJ1/v73j9V3Ic
	 AKIulc4O0GL0qx56jsUqm2AJ0+r2mvKhygMtT6riPdmQGo+cLiLSrxHXpufHwKmXJ8GHM
	 7YY5BX4yaUo2YZ5rKFP59rbKlhSXwoppys21Mu3hHI1cgGKh1l0VXjAG/Ap3yxpNG8DB1
	 iP+H07IpDywarkEisW/n0/60fV0M9mve6C8IAVvl5Vfl3nRsfFsirDxVKqnew1ScwZeFs
	 S44dNJKi8PK8qLHJSBsqsj0plNK9NRScjR6sZzvMgZURACXc/6LpnjXaOQQjoe26RGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cf2PTmlI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B20B606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cf2PTmlI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3BE1F00A02
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793607653;
	bh=a94/cjy7p6szhw9hzS0p+6MZPDElnqdXk1fwfe+RjpE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Cf2PTmlIe9bAtwtVIP/4UYMfeT7OlrqqbEfyfEryca5kAQf+jVO4yTxKIGlbz5xwD
	 e5fnifIyXiuFTUS/6T4fQ00G4YktxBFw7XKRBqpxEq+0AEfO9ywwGWX4c8CsUHKCSP
	 jIdFRd/P/GpudO+hhvsJwF9IZd/kzkOh7wicrDVRnD2mCsrQOYMeT8RwBmuiZ/e52x
	 aLsctn9rofa8NTwkLo6O2rTeHtgUWgXcbtji5o5QdNYUuf4/FiGBxEiE4KhEpzQxO+
	 AXeL94srm/ePUZnrScaKgxWXi2p3lBX4keE5HqKLfvNQGCXmeuFIZmlSTUF1qgwhEl
	 cPubAhREL1lSQ==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6b19e291cc6so2950311eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:20:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy/2OjdhdXlSCYbf8u4pqYhNAJSuwmYo+46zc6pGq7jMdz92ULv5Xa0mdYkLQlWsNEjhHl5ZnHniZH7unQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrJlStyHj/XLJrzgEVxvXSBj59YtX3Wwkj6YkxapJj3JzDdcGW
	YUUxnqv6tHFyNAV9HI8P6eLgxMlpmcISsdOGIk1tEIlyX0++63EfqtDFQGH2H/G6mBTPFlSDgrH
	B9MSPf807V5sYH88tgVdtYHqaWizF1FE=
X-Received: by 2002:a05:6820:a290:20b0:700:371e:ee06 with SMTP id
 006d021491bc7-714f2a6b900mr2980101eaf.80.1793607653166; Mon, 02 Nov 2026
 00:20:53 -0800 (PST)
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
 <CAL4Wiio9VXUtGg4UrFFU1kG2JENYL8xi0DzsDmhOp=zXs0DiUg@mail.gmail.com> <b8595ed2-6e7a-48f1-8240-3d522776e378@linux.dev>
In-Reply-To: <b8595ed2-6e7a-48f1-8240-3d522776e378@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 2 Nov 2026 09:20:41 +0100
X-Gmail-Original-Message-ID: <CAL4WiioRi2hZRMTv-v=iUpSZhbnj__rh=Uh+g2dOCre-YBa6Ug@mail.gmail.com>
X-Gm-Features: AclHuK8Xupe88TcKCHCib38ybjK5zp2uH3F2lIdfCw_YoWgKtjV7dTc0AeviD08
Message-ID: <CAL4WiioRi2hZRMTv-v=iUpSZhbnj__rh=Uh+g2dOCre-YBa6Ug@mail.gmail.com>
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

Le lun. 2 nov. 2026 =C3=A0 09:13, Qingfang Deng <qingfang.deng@linux.dev> a=
 =C3=A9crit :
>
> On 2026/11/2 16:00, Eric Dumazet wrote:
> > Le lun. 2 nov. 2026 =C3=A0 08:41, Qingfang Deng <qingfang.deng@linux.de=
v> a =C3=A9crit :
> >> On 2026/11/2 14:11, Jiayuan Chen wrote:
> >>> On 11/2/26 11:59 AM, Qingfang Deng wrote:
> >>>> TCP_FASTOPEN_CONNECT can return from connect() before tcp_connect_in=
it()
> >>>> when a cached cookie or cookieless Fast Open allows deferring the SY=
N.
> >>>> At this point write_seq contains the initial sequence number, while
> >>>> snd_una and snd_nxt have not been initialized to that sequence numbe=
r.
> >>>>
> >>>> Consequently, inet_diag and /proc/net/tcp{,6} report the initial
> >>>> sequence number as the send queue length despite no SYN or payload b=
eing
> >>>> queued.
> >>>>
> >>>> Initialize snd_una and snd_nxt to write_seq before marking the
> >>>> connection as deferred. Both sequence-based queue lengths then remai=
n
> >>>> zero until the first write starts the connection and runs
> >>>> tcp_connect_init().
> >>> This patch looks good to me. But idiag_wqueue can still go negative
> >>> on the normal connect path, since the socket is already hashed and
> >>> diag does not take the socket lock. We always set write_seq first,
> >>> then init snd_una later:
> >>>
> >>>     tcp_v4_connect
> >>>       WRITE_ONCE(tp->write_seq, st.seq)
> >>>       tcp_connect
> >>>         tcp_connect_init
> >>>           WRITE_ONCE(tp->snd_una, tp->write_seq)
> >>>
> >>> Can you try this instead?
> >>>
> >>>     r->idiag_wqueue =3D READ_ONCE(sk->sk_wmem_queued) ?
> >>>                       READ_ONCE(tp->write_seq) - READ_ONCE(tp->snd_un=
a) : 0;
> >> This does not guarantee the load order on a weakly-ordered CPU. LLM
> >> suggests using this load-acquire/store-release sequence:
> >>
> >> r->idiag_wqueue =3D smp_load_acquire(&sk->sk_wmem_queued) ?
> >> READ_ONCE(tp->write_seq) - READ_ONCE(tp->snd_una) : 0;
> >>
> >> Then in tcp_connect_queue_skb(), replace sk_wmem_queued_add()
> >> with smp_store_release():
> >>
> >> /* Paired with smp_load_acquire() in tcp_diag_get_info(). */
> >> smp_store_release(&sk->sk_wmem_queued, sk->sk_wmem_queued + skb->trues=
ize);
> >>
> >> What do you think?
> > Please do not do this.
> >
> > /proc/net/tcp and inet_diag dump sockets without holding the socket
> > lock. They provide a best effort snapshot, and transient inconsistent
> > values are expected (see the comment about rx_queue in get_tcp4_sock())=
.
> >
> > The window in tcp_v4_connect()/tcp_v6_connect() is a few usec, with the
> > socket lock held by the caller. Adding memory barriers in the TCP stack=
,
> > on a field updated in many places, to cover this is not worth it.
>
> tcp_connect_queue_skb(), as the name suggests, only queues the
> connecting SYN. So this adds a small setup cost on weakly-ordered CPUs
> (on x86, smp_store_release degrades to a compiler barrier).
>
> If strong memory ordering is not required, do you prefer Jiayuan's approa=
ch?

Neither, let's keep v1 as is.

I know tcp_connect_queue_skb() only queues the SYN. The cost is not the
problem; sk_wmem_queued has many other writers, and one release store
among them is a special ordering rule that nobody will remember the
next time this code is changed. This is too much complexity to hide a
transient value in a best-effort dump.

Without barriers, Jiayuan's version is only a heuristic: the loads are
not ordered, so it guarantees nothing. It also ties a sequence-space
value to memory accounting, and it would have to be copied into
get_tcp4_sock() and get_tcp6_sock() to be consistent.

Thanks.
