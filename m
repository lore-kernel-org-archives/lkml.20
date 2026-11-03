Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717591;
	b=vxO4nC5LpI8nXWKiOQxWkflGGSWSVZRg6Eko8BuZbx0lJGHaoCI6zf96//wY03mj6xPy
	 zAWcu1nBWnpavibt1dUCOcIUNssY6ph9yp9oqWB72R9bwn1uczscQrfJOlE9zwOXBiW8m
	 Ercd1hWbl/CSLvEujGuAMJ899UcO/mU94Qd+Bn7dMMUpKvDKJ5jBAZ6t8QdOkMKYja2tp
	 Rv79MrLKe1PMyk2BDgcj5EtsfGFdBbVwv36Qoe1YuohFzf30325PHYp+JaUIITCG77WMS
	 uf047DqA/Hx19S+pYUUlMrgpSi+DSiGz8iWdf5ygx4iH55JLnTaLVNJ9p2hGRvCJtPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t6aL0KS08y3lw+fbFyxxj89k4kn2zrtKzdEdMJuh9jE=;
	b=PZNLr7KX+jTShqqrPvKxhiZnF6kcq+Jxjcr21jpbhOxeVCIa4uVz5Mcb6UZd0zERKgUu
	 7I5ALMeTyS1WOODiPFWZit+2egDC8YNaATkXe+PXlSwbtgZ4cS382VFDzrBESSToiREUi
	 EJ2Kwcg4ubOnT+IgtGtl9ToMeLi4xmUvUyqBKAqzaszBVycfTWzr0aV2FbcteJ0i/5qqM
	 dbdaXHUYNncRbmLSAXGJmx7POfIlUG4qHgfUCxuk4bIFGJxEFw4P5HQixqRHoYquRjuAQ
	 QQJ3pN3XGx6iQUs6WPDOuLvKJRd3WAPuonNx4T6TOG2woj9DxYGJwj+zAje1cIKw8ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y+H0OJPV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD29606C83D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AD29606C83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y+H0OJPV
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso9502a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:53:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717589; cv=none;
        d=google.com; s=arc-20260327;
        b=cCc95QEhTuude5z/jr6KOnOE9eJruxQnJupluJZfD+RIBWaMdACpUjzNG1D2Hu7P4g
         RHcL2IFf0+E1SzWaiolWEMmhwIFy9z4UCPqU+miczMHx2Br+GS/9XZ6jBIMAG6mQSNLL
         Jf5yPAvpP8elTeYAzBanonGUp6X6ZdrXeDmmoA2fHnZ7dtNp5UPPywchb5H0KjYE2ZaM
         uaD5MKEKQbOy3ir6tlv+JBfNNgaDqgzcgMQOMuAgv/dfQJFeke94ITREyDkuGMCPgp1n
         u+Nn8COlCqc01MQilRKhScQkgyCKhEIr8YMnosuwsP7k75PwUAcaVHTHRG3sA4FdBwgH
         3VOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t6aL0KS08y3lw+fbFyxxj89k4kn2zrtKzdEdMJuh9jE=;
        fh=f7gb1P3liubkLNX5sUiB/M4fM9RnMjdtgvnhczdrX60=;
        b=BIW4y9FwWhqe67clqmes2gtIgdf4s/S6NFXYrous6MkrnnUtpuvb441NRBl9czKfAJ
         EYCW9QukF158Smd9FSQrQ7ugJW/PEVOeT61onHmKAXlooZyqZchgVJqtaUk7ZdF/Qwxy
         RQjG/CT0SgSqkFfa7kDTMHES+IfdnuRjm1GKs5Ms3ONvt25uqXQxawelc3r73lgg/Jx8
         fEtOm4cbla//N5no8tPPZKWuVRH3DVg1fA2zMUjuKovjQw/nB8pdUW7Q0bOS21gXuEqw
         VVRngBNQD9cgCUOOVtsaU7ixG2tvPp8rVN8YPFBUjd8DKx1UYU6C5YeVBe7f7T1EABoF
         MA2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793717589; x=1794322389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t6aL0KS08y3lw+fbFyxxj89k4kn2zrtKzdEdMJuh9jE=;
        b=Y+H0OJPVgHDZCYeP2enbnr5FPxcAmQTxI3HKvOduQJ8ZbovEsbNIyW7B1wlNCh8u8w
         2Ydd3bDG91Z0lOjY81c6J1GwpiDRRALIQvxgXNYN062HfH62xQHnen5wx/sWgkoJGokf
         yIfE10xzWzomHsI4sASlc/W0lJUKAp92KwDdvlJWYn9Ks4r3qJlTQ7ycK+W1N28/wokx
         gyMmIU3yJhkRM0TD56x87F/uqu3waUu+VhdoIjCn5UdixXgVUDv2Fucrmul7VzIax2jk
         Ck2RrqeKIjxqw3au+C9KsvKS5JH+aBGCGUvyxtdXkOM0clMMdTCtr6W0N9fV3JSSQXxy
         d8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717589; x=1794322389;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6aL0KS08y3lw+fbFyxxj89k4kn2zrtKzdEdMJuh9jE=;
        b=H+7FDOujAAh4az4Vl4d+d+cz0DexUr4WElbtHqeqWADQ9P2mvtoNC8B7cHg/CpDfwh
         ys/eyBmtzjrsxN5hDwOaRJi7uWS8N3z/yBRdR5zLmcqCHluV3mRrBmKy8TNnle/QqAou
         B1LIwezveI1n2pd6xfNumtHNUirtOtKcF7zVG8WHCfIESE7MURzc/Tch5fN6pSd3jy0h
         eWl6PU1saEBdc0kxfr6SIFhPPShkBfYl8thTs4/cLN8Sz52TR2M36WGjeSzSPZd46P9H
         rqqT+Kru0QK5JXLWgOEZjGhfj2s68E/Z5e6ifDaep6VXVHdNFpm2MTZwuFl/nV8uhdlF
         36BQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkufoqkb3Co+7qzuVPgllBSXDE5FjtXjQAl9GXLUcFHfyJHIQ71m9mRzK1q5sTVeEr8qX2mzQ+XeKemeY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3szY5CeZZFaNVJqFLpowSiTWag4mNHnVeZZ+L0Yk1H0W0DzLz
	c77nVg9YKzpRuj22kU8r9v3rlRYd8cQyBSYElZgilTuFIIXK0cjn8OL2xf3VGyg/gqKjSKKcJd2
	51ryVLRPEGOjAuwIZ9boBNlxn83l2lAFnVfuidpr2
X-Gm-Gg: AYBFou2UV1/1r6kUi7uXKo+dvuJHrTmAwTrurM3LvCmIi1qnoKICNcCVQoxE2ojJaUG
	ZdI28lWw70j5AwjyhhTg55C0XMtoJ/NOhl3hCNLzXoanXYtADyVMpSJ0/+1Oax0KFpjyuhfwNno
	sBhe710uKLvCEBSrHo2DOacd4YlXZ+/loCQI08woLYEZOzQn2/aJE9AiuvqZQ401SkMj22FZ0cV
	iosASXgj6C6+vC1Gl9hERjsQkxwLfrW9TN+hw34E3gv3VPNc3Q18hsQbaG4Vp+qtlKF39U5yLfJ
	Mbt447ub6tiKEMr+FiDgE1mJ9MyhT0YmwM5omMJCH7rzoxEm9wWqh+NkQVmQ/IXbzEbKoQVt42Z
	ELAewmhPfh3rJvyn3xu4RarFe+qAoRecDhBDNAjRzYMnOqBbcoDV9N+aJ/Yaik2ZxZgcpdRYwYK
	Ee7+phXDZrmvKvy/W5F5nLZwQIdV8=
X-Received: by 2002:a05:6402:a519:10b0:6af:b196:68bf with SMTP id
 4fb4d7f45d1cf-6b53e7443a7mr46490a12.7.1793717588777; Tue, 03 Nov 2026
 06:53:08 -0800 (PST)
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
 <CAL4Wiio9VXUtGg4UrFFU1kG2JENYL8xi0DzsDmhOp=zXs0DiUg@mail.gmail.com>
 <b8595ed2-6e7a-48f1-8240-3d522776e378@linux.dev> <CAL4WiioRi2hZRMTv-v=iUpSZhbnj__rh=Uh+g2dOCre-YBa6Ug@mail.gmail.com>
 <aulxmZNZqmAzK6r1@google.com>
In-Reply-To: <aulxmZNZqmAzK6r1@google.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Tue, 3 Nov 2026 09:52:48 -0500
X-Gm-Features: AclHuK-j4hFEfW-ro6EopyT-Tk8HqSro_wq-t_bz6R1ZwuBKQefVxhZGd66IHmk
Message-ID: <CADVnQymrKnfXu4irTp6ysuR5puXeeWZVys=K7Z+ianbHsbE_NQ@mail.gmail.com>
Subject: Re: [PATCH net] tcp: initialize send sequence numbers before
 deferring TFO
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Qingfang Deng <qingfang.deng@linux.dev>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Yuchung Cheng <ycheng@google.com>, Wei Wang <weiwan@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 12:32=E2=80=AFAM Kuniyuki Iwashima <kuniyu@google.co=
m> wrote:
>
> On Mon, 02 Nov 2026 09:20:41 +0100, Eric Dumazet wrote:
> > Le lun. 2 nov. 2026 =C3=A0 09:13, Qingfang Deng <qingfang.deng@linux.de=
v> a =C3=A9crit :
> > >
> > > On 2026/11/2 16:00, Eric Dumazet wrote:
> > > > Le lun. 2 nov. 2026 =C3=A0 08:41, Qingfang Deng <qingfang.deng@linu=
x.dev> a =C3=A9crit :
> > > >> On 2026/11/2 14:11, Jiayuan Chen wrote:
> > > >>> On 11/2/26 11:59 AM, Qingfang Deng wrote:
> > > >>>> TCP_FASTOPEN_CONNECT can return from connect() before tcp_connec=
t_init()
> > > >>>> when a cached cookie or cookieless Fast Open allows deferring th=
e SYN.
> > > >>>> At this point write_seq contains the initial sequence number, wh=
ile
> > > >>>> snd_una and snd_nxt have not been initialized to that sequence n=
umber.
> > > >>>>
> > > >>>> Consequently, inet_diag and /proc/net/tcp{,6} report the initial
> > > >>>> sequence number as the send queue length despite no SYN or paylo=
ad being
> > > >>>> queued.
> > > >>>>
> > > >>>> Initialize snd_una and snd_nxt to write_seq before marking the
> > > >>>> connection as deferred. Both sequence-based queue lengths then r=
emain
> > > >>>> zero until the first write starts the connection and runs
> > > >>>> tcp_connect_init().
> > > >>> This patch looks good to me. But idiag_wqueue can still go negati=
ve
> > > >>> on the normal connect path, since the socket is already hashed an=
d
> > > >>> diag does not take the socket lock. We always set write_seq first=
,
> > > >>> then init snd_una later:
> > > >>>
> > > >>>     tcp_v4_connect
> > > >>>       WRITE_ONCE(tp->write_seq, st.seq)
> > > >>>       tcp_connect
> > > >>>         tcp_connect_init
> > > >>>           WRITE_ONCE(tp->snd_una, tp->write_seq)
> > > >>>
> > > >>> Can you try this instead?
> > > >>>
> > > >>>     r->idiag_wqueue =3D READ_ONCE(sk->sk_wmem_queued) ?
> > > >>>                       READ_ONCE(tp->write_seq) - READ_ONCE(tp->sn=
d_una) : 0;
> > > >> This does not guarantee the load order on a weakly-ordered CPU. LL=
M
> > > >> suggests using this load-acquire/store-release sequence:
> > > >>
> > > >> r->idiag_wqueue =3D smp_load_acquire(&sk->sk_wmem_queued) ?
> > > >> READ_ONCE(tp->write_seq) - READ_ONCE(tp->snd_una) : 0;
> > > >>
> > > >> Then in tcp_connect_queue_skb(), replace sk_wmem_queued_add()
> > > >> with smp_store_release():
> > > >>
> > > >> /* Paired with smp_load_acquire() in tcp_diag_get_info(). */
> > > >> smp_store_release(&sk->sk_wmem_queued, sk->sk_wmem_queued + skb->t=
ruesize);
> > > >>
> > > >> What do you think?
> > > > Please do not do this.
> > > >
> > > > /proc/net/tcp and inet_diag dump sockets without holding the socket
> > > > lock. They provide a best effort snapshot, and transient inconsiste=
nt
> > > > values are expected (see the comment about rx_queue in get_tcp4_soc=
k()).
> > > >
> > > > The window in tcp_v4_connect()/tcp_v6_connect() is a few usec, with=
 the
> > > > socket lock held by the caller. Adding memory barriers in the TCP s=
tack,
> > > > on a field updated in many places, to cover this is not worth it.
> > >
> > > tcp_connect_queue_skb(), as the name suggests, only queues the
> > > connecting SYN. So this adds a small setup cost on weakly-ordered CPU=
s
> > > (on x86, smp_store_release degrades to a compiler barrier).
> > >
> > > If strong memory ordering is not required, do you prefer Jiayuan's ap=
proach?
> >
> > Neither, let's keep v1 as is.
> >
> > I know tcp_connect_queue_skb() only queues the SYN. The cost is not the
> > problem; sk_wmem_queued has many other writers, and one release store
> > among them is a special ordering rule that nobody will remember the
> > next time this code is changed. This is too much complexity to hide a
> > transient value in a best-effort dump.
>
> +1.  v1 looks good to me too.
>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

v1 LGTM as well.

Reviewed-by: Neal Cardwell <ncardwell@google.com>

thanks,
neal
