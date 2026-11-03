Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793683921;
	b=v5oM5W7Fh96dTinhTGHu5Mf4NzDRFK5ZPq5ndTiaBig2hoMcHaX79c0GVFha+5Af8fTn
	 mup6qWJtikgaZZeRD27TokG06xp66PtkrTCkwHJ1hyHkZJUlb2o/m89hgWBCRyUKz0OHC
	 pMc0QTj5tC5ho+eXTdW4UwiAUYDEVl6Zct8hU1cDlwRtE8nAT50JxJKEJ39P6S/a7kRKs
	 y5g5TNTdAfVvTpsUIk3mNbSI8+e3Pl6HUzRKnK8NuiKry6lPh5DtFwUH6pNVNiI+Toqwb
	 pgNWnPxVRDB+olQaYwieQXuHrrSVNNUa2ueqIXiJDgC8a5oo5KnbuimsaCzFg+AQ05A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793683921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=xIO2p5tYrEpaq2n/QfwjZeXI7kU+eJQ5+b8ckU+HtYU=;
	b=K0619ThU4fz6pVRvo8VK0vvpcTBmNurHTE4BESKSanzwN1ppCJXV12zBUmtRqjxYkmKR
	 JXg+NOoslT1UpkXrUrF1nN9tZsTX0u+hN9ST8zq2AN4emWiox3IUXtS1ZotLkNUstndGj
	 qKWNLqqlINmv5DtFnVMVjhlDV+IytFNePIBlWLkqN8EMtcdrYrmza3jTvawJTpfe9oO3d
	 YUo/1PEDSOj7zz9YgAxqn2favTX/2TB9oAj+42wS8vaXVJM+9LYMnQcWIfsq988Izmbit
	 r7ZTCfgHgtJJZu0dh4NPA+k8+gVow6TViPIi8SNIyEyYEFEEj9LdLbssQe7CBZB62vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KHTrgv55;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF4606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AFF4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KHTrgv55
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a073778890so2597522b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 21:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793683920; x=1794288720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xIO2p5tYrEpaq2n/QfwjZeXI7kU+eJQ5+b8ckU+HtYU=;
        b=KHTrgv55L5jRUpGS0pkOTtgCHdCehw7SscRH5zb01bTV7n0hSsadRaI2qgUpK3oyl0
         BB8euP8guD8NlUoDxn256k3h3xrRbMfYGZ3hwqc5RkjSd7OBl07c8PtV6Ftx3TOZ/GdK
         eDGM9xecKbl8EPM3VynH44kSXIAHmE3qsZxB763j5ZwWVgPRyEkxsbQBX91nH0QpmO65
         fIjmRVc8TSw9T+O3h67VyHQgEVq3QB9ehXyPvpZJ0M83B1iU494HqctHAcvaIJ7m3+bm
         +vJLvFpFMWZtcEz7bVBdnhfyzNcTWdqjj1En4TtO7mRWQh5W0R0gdnW/N3HEQ2N3ks1K
         SybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683920; x=1794288720;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIO2p5tYrEpaq2n/QfwjZeXI7kU+eJQ5+b8ckU+HtYU=;
        b=jsaJmoO6xpmAexaDQdOd0cs4XhfO22TWkjdN0jS9UDkQghCcpvqpgaZVfKImW216+G
         1ESXl/ffoPL5UhprIIh9LXO3zveag/14KVg/HBz6xCz/1X3oL1DaZU0KrvGfrtKg3UEI
         Bq3EPevN8R1t2nrCogEd00o1Z3P1XQ1rvteEHrmW/+nwCTORVFfmGsLkl+lcidFp+8ZY
         ODUmJie8sU0BE3TPqOIOPIQCkAbVGxQBtZsA3RVJquSPY5YU9ZlXCaaxEoIZlZfLUVox
         V+xW3X3gF9oFuMfNCT7P66YPvfudjnhpnlNhrt1mGQ5xzJU/dnGWqvocm6b7AwE6qfkK
         D3eg==
X-Forwarded-Encrypted: i=1; AKwUvBxY/E2cJlV9mUdtUYSv7YedUmedBalwJZ2isRA/RaUF/Ar7buNYdZUhUEClWOa1xmRBlZP1Ak2x9RiPmEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/ldCecHXGutJniN1yKrgL2Lc8kgPPpwn2qZiH9Nmni74/p3bX
	liglmUZ1Jx9H42/GuZuzfMfFBjh/WzoH2tDUDXZmnhQ8A698KBC/j5RiJTQWLOa6M6JaMM0pakr
	vwfEp4w==
X-Received: from pgby21-n2.prod.google.com ([2002:a05:6a02:6515:20b0:cd6:9a9f:f4b9])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9cc8:b0:3e2:47cf:17f1
 with SMTP id adf61e73a8af0-3e928e66cb3mr10029400637.51.1793683919547; Mon, 02
 Nov 2026 21:31:59 -0800 (PST)
Date: Tue, 3 Nov 2026 05:31:59 +0000
In-Reply-To: <CAL4WiioRi2hZRMTv-v=iUpSZhbnj__rh=Uh+g2dOCre-YBa6Ug@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102035943.9700-1-qingfang.deng@linux.dev>
 <bfbc4b3c-fe19-4070-97b4-4ff8ded06011@linux.dev> <d6ba5426-fbee-49da-b18b-1419fd84fa0f@linux.dev>
 <CAL4Wiio9VXUtGg4UrFFU1kG2JENYL8xi0DzsDmhOp=zXs0DiUg@mail.gmail.com>
 <b8595ed2-6e7a-48f1-8240-3d522776e378@linux.dev> <CAL4WiioRi2hZRMTv-v=iUpSZhbnj__rh=Uh+g2dOCre-YBa6Ug@mail.gmail.com>
Message-ID: <aulxmZNZqmAzK6r1@google.com>
Subject: Re: [PATCH net] tcp: initialize send sequence numbers before
 deferring TFO
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Qingfang Deng <qingfang.deng@linux.dev>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	Neal Cardwell <ncardwell@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Yuchung Cheng <ycheng@google.com>, Wei Wang <weiwan@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 02 Nov 2026 09:20:41 +0100, Eric Dumazet wrote:
> Le lun. 2 nov. 2026 =C3=A0 09:13, Qingfang Deng <qingfang.deng@linux.dev>=
 a =C3=A9crit :
> >
> > On 2026/11/2 16:00, Eric Dumazet wrote:
> > > Le lun. 2 nov. 2026 =C3=A0 08:41, Qingfang Deng <qingfang.deng@linux.=
dev> a =C3=A9crit :
> > >> On 2026/11/2 14:11, Jiayuan Chen wrote:
> > >>> On 11/2/26 11:59 AM, Qingfang Deng wrote:
> > >>>> TCP_FASTOPEN_CONNECT can return from connect() before tcp_connect_=
init()
> > >>>> when a cached cookie or cookieless Fast Open allows deferring the =
SYN.
> > >>>> At this point write_seq contains the initial sequence number, whil=
e
> > >>>> snd_una and snd_nxt have not been initialized to that sequence num=
ber.
> > >>>>
> > >>>> Consequently, inet_diag and /proc/net/tcp{,6} report the initial
> > >>>> sequence number as the send queue length despite no SYN or payload=
 being
> > >>>> queued.
> > >>>>
> > >>>> Initialize snd_una and snd_nxt to write_seq before marking the
> > >>>> connection as deferred. Both sequence-based queue lengths then rem=
ain
> > >>>> zero until the first write starts the connection and runs
> > >>>> tcp_connect_init().
> > >>> This patch looks good to me. But idiag_wqueue can still go negative
> > >>> on the normal connect path, since the socket is already hashed and
> > >>> diag does not take the socket lock. We always set write_seq first,
> > >>> then init snd_una later:
> > >>>
> > >>>     tcp_v4_connect
> > >>>       WRITE_ONCE(tp->write_seq, st.seq)
> > >>>       tcp_connect
> > >>>         tcp_connect_init
> > >>>           WRITE_ONCE(tp->snd_una, tp->write_seq)
> > >>>
> > >>> Can you try this instead?
> > >>>
> > >>>     r->idiag_wqueue =3D READ_ONCE(sk->sk_wmem_queued) ?
> > >>>                       READ_ONCE(tp->write_seq) - READ_ONCE(tp->snd_=
una) : 0;
> > >> This does not guarantee the load order on a weakly-ordered CPU. LLM
> > >> suggests using this load-acquire/store-release sequence:
> > >>
> > >> r->idiag_wqueue =3D smp_load_acquire(&sk->sk_wmem_queued) ?
> > >> READ_ONCE(tp->write_seq) - READ_ONCE(tp->snd_una) : 0;
> > >>
> > >> Then in tcp_connect_queue_skb(), replace sk_wmem_queued_add()
> > >> with smp_store_release():
> > >>
> > >> /* Paired with smp_load_acquire() in tcp_diag_get_info(). */
> > >> smp_store_release(&sk->sk_wmem_queued, sk->sk_wmem_queued + skb->tru=
esize);
> > >>
> > >> What do you think?
> > > Please do not do this.
> > >
> > > /proc/net/tcp and inet_diag dump sockets without holding the socket
> > > lock. They provide a best effort snapshot, and transient inconsistent
> > > values are expected (see the comment about rx_queue in get_tcp4_sock(=
)).
> > >
> > > The window in tcp_v4_connect()/tcp_v6_connect() is a few usec, with t=
he
> > > socket lock held by the caller. Adding memory barriers in the TCP sta=
ck,
> > > on a field updated in many places, to cover this is not worth it.
> >
> > tcp_connect_queue_skb(), as the name suggests, only queues the
> > connecting SYN. So this adds a small setup cost on weakly-ordered CPUs
> > (on x86, smp_store_release degrades to a compiler barrier).
> >
> > If strong memory ordering is not required, do you prefer Jiayuan's appr=
oach?
>=20
> Neither, let's keep v1 as is.
>=20
> I know tcp_connect_queue_skb() only queues the SYN. The cost is not the
> problem; sk_wmem_queued has many other writers, and one release store
> among them is a special ordering rule that nobody will remember the
> next time this code is changed. This is too much complexity to hide a
> transient value in a best-effort dump.

+1.  v1 looks good to me too.

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
