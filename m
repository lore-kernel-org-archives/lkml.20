Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9838A3C4B83
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460474; cv=pass; b=as72twUhTlD/+cSK3yQxoa2lseKe8zIT15o3d2z6xunPhVBjdSyByF8QkHwNsY+g9jP3G2/FWVNMSGwinewRdG5PDiZHMq8ouxVJwbLTbHtaOGMhHpZrSC0RaiLLNgne7Uip6ieqlRNdtY6tGGxnoAO4fM/IvocUzE/Z2PwyPPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460474; c=relaxed/simple;
	bh=JSY7FjPX3z5BPlaii9O02tEGU6YcZFqUm/z+a9q3NFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ld5DvqMSID4dI8JKG85HfbGgHO11g9JkW6682U2q791PM31h2+blUZK8GXKgttn6ZM9nReI9ivjOr1mFbi2kBL3QfqqiZVNoegWY/5P2KXmJuMvQNqNy44SQuBkhKQ4cTWGpDcIy8pfKqeWPP1QY20cJobJT/nI+IaaZWaRcwUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzjFhXOk; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzjFhXOk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so36608015e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791460471; cv=none;
        d=google.com; s=arc-20260327;
        b=FiZWHfIe69TUY0LmRwNni2ShKJNzfGk9edgNaAL69uhKxqNk9BRYtsT8+Xy9/Xud05
         35FYmXPqUQr5ww9By4a157E3+6I7kzPb7ZZqEaH5Ql3S9HoAiN3yi8K1AeP1AN0NoYAh
         GTSCyvzDuipfn0x3YhU3/V1tQvqdMYhh1x1WNEe4lWdZbHKKrua0sAZ/HMPz5UxcPiP7
         jYYKdZn1o+xIWMM7avq3ovWyqtRuAdRG5tUFIRmE5dufaHmEPlsxdeYqKgeys/oaWOyp
         gw0GA2IwQUVwfSLI4/+Y69s7UGfP9o4tE8UtryvWD3zlALMN0UKZJ6wh5yw7g++9MR+m
         hqCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hbwotZ9+3Jxb1MnRiz1KrC/3p1ppRlaHEScVsaHdM/4=;
        fh=KhPcp9sL6zSo12ywTv0tkLr+rcL0QbqE5765LQg8gEk=;
        b=aN2MJb3FRtD6uuHZr7Ggez7eNUxZxGAqxwxtvtB1g4VTJyo4FbmOVdfU7YUrEGSAE/
         mCJxgGOtqfFNEHuViPrnAm1CalT07HSlssV/plomwtWY94w6TFela3AjkFSz7WTKCHHU
         i+KgdUekKqLFddmGejUiJKfSXjbQV3z2RXoRV9kPiIDw4tIsbQoWddYmuuDCS13PjGCU
         C9zk7/l9/of/nim9oIUd95z1e+8dbDXW3KJBJ5bhPCCi67pPXHCJU6JApdiersD2mnrt
         r/82NnM9vB9McHZYHEGF7mD+FrRj9jrp2j0sYLZMFXpSDVkGZgQziQnKvndOu9etl9lu
         6J3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791460471; x=1792065271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hbwotZ9+3Jxb1MnRiz1KrC/3p1ppRlaHEScVsaHdM/4=;
        b=WzjFhXOkCuAbnHqvdwdy8evRA0lkVS5y/5G6adQ89IL2bH4Jox05QkYbYfdLVdGX1O
         aVvcAfDFbsJaZCZ1SA0t+w/8ZyVFKPK/mf9NdCJoSkOlteBfUgnIfc9hSCGEnFbR4TuV
         vW2yswrEVzSe2m3CZU8HhkoBNjOek0B7v1X5Zo3o5c8uczVlrJWClYJgREEZjB099Z5g
         nQOOvMo+JaOAvtffDDWNG/vW7W4JAy96560yWr3uUmUOC7dFVzRo3sXsXaICWkSu/42f
         MLnh8TBZaopfOeKGVAeZN49sg2L2M0IUfYgYh9jMsMTduiZtAzrOnhu0bdguJ2O4uFXe
         6o6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460471; x=1792065271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hbwotZ9+3Jxb1MnRiz1KrC/3p1ppRlaHEScVsaHdM/4=;
        b=ic3i759pKHyq4SRxfuLX0hFvRhkaAMFuLiN41HKvMcAkDuddQdspeCEu2VlqchE7zo
         AwXS8uS5V0rkd2+qF7vutKuzBS2BOu96zJNaWpnmNBiaq4qQCDI3o0GCD6vdO3o3cV23
         /N9XPWr2jenNBxff2U4kx/E9Dz0yLzBIQdvwDkPSTJeydtVvX1V8x6/ehd5Ne47LO0Aq
         sXcP65Ji16eLFAhuwXEGjKh+eh77zNKl3pzEL3EaM4NH01vCxqgh/MTPjxOa7TE/YiZN
         iIAhyXhlOq2wT51WVI16ff4GygcHU0jh3oGH952t/AMae9vZFW6kl4In6vuVqcFQftwO
         eKSA==
X-Forwarded-Encrypted: i=1; AKwUvBz4P0e9iI/U6XEfZaZT/KC1nA5ruIdrrQSroNoCZTbJYnOXNb2QmvRhYbC7DYeyCXbc+V8Zp5o63SDqQ7w=@vger.kernel.org
X-Gm-Message-State: AFuF++lQT66ScQzG5BoM8UpIMorHJ4qVWVpWerfro4dPe8IAYsbBgP/E
	HYEhNmpFUavpcywC0QLgwqNLIznzZuMphhivb6mygqOIuxFAJjIJfeZKSaAkjffoO6+1I+9EoEC
	I+a/j3eRg3a1zOzCax9mMQgQm4TI6C2I=
X-Gm-Gg: AYBFou2lgy5zqAki2AeTuOaWDde912uN1l6V4nWGAxoGnD/IHlprM+iVgqE8jqaUl9A
	NKIjSzBSKnQkPnyx5rIkHtbyk44IowQGWKqo2t3VEXyICgAYEwcYQ9GGHout+RVKdXFlp9+S2jW
	djfpSwC+yCVk04GF8mQGG9xhhT3WmvfkhLBCJ2MhgB4KskDPJOma57/ceGom8zpG/3sh7wbHFdc
	OvUmby88nS8/+lGH7BHP1woHKbIpd+z5/UDBbqUi2neDK6UVyuFSWNbbrg66be8LF6yBY+1u2eU
	w+AhkPSIYG2XQ5ZiLwZRqKHZYDeLNB0W87ZpcGmimmCVeJCacRU8W35JtPI569w=
X-Received: by 2002:a05:600c:3ba2:b0:49f:ff32:8044 with SMTP id
 5b1f17b1804b1-4a18043dee1mr109269585e9.7.1791460470659; Thu, 08 Oct 2026
 04:54:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008100423.1256884-1-theodorlarionov@gmail.com> <CAL4WiiqDffWyo7+gbffB2PYuKAbjboK7D=JJD+z=5J5MX=9Y3Q@mail.gmail.com>
In-Reply-To: <CAL4WiiqDffWyo7+gbffB2PYuKAbjboK7D=JJD+z=5J5MX=9Y3Q@mail.gmail.com>
From: Theodor Arsenij Larionov-Trichkine <theodorlarionov@gmail.com>
Date: Thu, 8 Oct 2026 14:54:13 +0300
X-Gm-Features: AclHuK8EBP8sBxwCAHL7G9F-97FidCR-ex3gbgPZwUHVed67BeOk-y7sotT9Mgw
Message-ID: <CAEZyMPCUQvQ43P5sGTC_moe5boDirjcBS0E+-eTQ9dBBW8w_Qw@mail.gmail.com>
Subject: Re: [PATCH net] net: use the full socket in sk_mc_loop()
To: Eric Dumazet <edumazet@kernel.org>
Cc: Ido Schimmel <idosch@nvidia.com>, kuniyu@google.com, pabeni@redhat.com, 
	willemb@google.com, davem@davemloft.net, kuba@kernel.org, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> (Was it a public syzbot report ?)

No, this one is from a syzkaller-based fuzzer extended to target nftables.
The fuzzer reached it through an nft "dup" rule in prerouting, which
re-injects the SYN over loopback with its dst already attached, so the
martian check never sees the multicast source.

A raw IP_HDRINCL socket sending a SYN from 224.0.0.1 to an address on
a dummy device also reaches it, without nft. That is the repro in v2.

v2 with your inet_csk_route_req() check, the changelog, the trimmed
splat and the repro is here:
https://lore.kernel.org/netdev/20261008114942.1376889-1-theodorlarionov@gma=
il.com/

Thanks for the review,
Theodor

On Thu, Oct 8, 2026 at 2:23=E2=80=AFPM Eric Dumazet <edumazet@kernel.org> w=
rote:
>
> Le jeu. 8 oct. 2026 =C3=A0 12:04, Theodor Arsenij Larionov Trichkine
> <theodorlarionov@gmail.com> a =C3=A9crit :
> >
> > tcp_make_synack() sets skb->sk of a SYN-ACK to the request socket.
> > If the SYN-ACK destination is multicast, ip_mc_output() calls
> > sk_mc_loop() on it, and inet_test_bit(MC_LOOP, sk) reads inet_flags,
> > which is past the end of the smaller request_sock object.
> >
> > KASAN reports a slab-out-of-bounds (or slab-use-after-free) read in
> > sk_mc_loop() from tcp_v4_send_synack() when a SYN with a multicast
> > source address reaches a listener.
> >
>
> How does such a SYN reach a listener ?
>
> ip_route_input_slow() rejects a multicast saddr as a martian source,
> so this can not come from the wire.
>
> I guess this needs a local sender : raw socket with IP_HDRINCL, and
> the packet going through loopback, where the dst is kept
> (skb_dst_force() in loopback_xmit()), so that ip_rcv_finish_core()
> skips ip_route_input_noref().
>
> Also the SYNACK route only uses ip_mc_output() if RTCF_LOCAL is set
> and the output device is not loopback, so the SYN must target an
> address of a non loopback device, and the source must be a group
> joined on this device.
>
> Please describe this in the changelog, and include the (trimmed)
> KASAN splat, and a repro if you have one.
>
> (Was it a public syzbot report ?)
>
> > Map the socket to the full socket before reading its flags.
> >
> > Fixes: ca6fb0651883 ("tcp: attach SYNACK messages to request sockets in=
stead of listener")
> > Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmai=
l.com>
> > ---
> >  net/core/sock.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/net/core/sock.c b/net/core/sock.c
> > index e8551df8330f..1302c1e848b2 100644
> > --- a/net/core/sock.c
> > +++ b/net/core/sock.c
> > @@ -769,6 +769,7 @@ bool sk_mc_loop(const struct sock *sk)
> >  {
> >         if (dev_recursion_level())
> >                 return false;
> > +       sk =3D sk_const_to_full_sk(sk);
> >         if (!sk)
> >                 return true;
> >         /* IPV6_ADDRFORM can change sk->sk_family under us. */
> >
>
> This only addresses the out-of-bounds read, masking the root cause.
>
> We still answer a SYN with a multicast source. With this patch the
> SYNACK is looped back depending on the listener MC_LOOP setting,
> and syncookie SYNACK (skb->sk =3D=3D NULL) were already sent.
>
> tcp_v4_conn_request() only looks at the input route flags, ie the
> destination of the SYN. tcp_v4_connect() refuses RTCF_MULTICAST and
> RTCF_BROADCAST routes, I think we want the same check on the route
> used for the SYNACK.
>
> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_s=
ock.c
> index 6a30f11384547e6adaeff13a005c7ce1d316a602..aa928015cd143234d3d0c72e2=
b607d8347f73269
> 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c
> @@ -779,6 +779,9 @@ struct dst_entry *inet_csk_route_req(const struct soc=
k *sk,
>                 goto no_route;
>         if (opt && opt->opt.is_strictroute && rt->rt_uses_gateway)
>                 goto route_err;
> +       /* Never send a SYNACK to a broadcast or multicast destination. *=
/
> +       if (rt->rt_flags & (RTCF_BROADCAST | RTCF_MULTICAST))
> +               goto route_err;
>         rcu_read_unlock();
>         return &rt->dst;
>
> pw-bot: cr
