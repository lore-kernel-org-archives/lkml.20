Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794434598;
	b=b/qiQ6rDjOm8DN3JkAWAO9+yOzds5QbkksClbTwxcoRAcyeXxwx/pRYfo2BUuDjrW13H
	 rvy3/ytBsAVImk/aZJCxoKv1qIJldkfE9EGdZuQnPd8JpaBYdUAK314trdaAgpNZfsrPw
	 OTrPjslwyYDK1rubCYcqapFfzaRgZgH8KgHC34V8xM7BCcAZGBiHS2a40Rpfzns6cVzPS
	 3xip8Hfq4BVVJs4Ia4j++X+FkSfXK6Qtwa4oqTE1BfkEJE3vHnTVrH24AH+wkJHPJXZrX
	 fbyN/uiqVDRmd8nyk4ll9pqwOgp1/NVy4hW5UHniGSMf4DCwynzjyrPrY8JX38Q92yA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Mul4fa6Ln0hB4RFr7GPev/ectXNF1bK3kmmDXWQ6hQs=;
	b=0H9LRGBL3/Q4k6XVSjN1lPbiGgrm3c5nXarsUV9BcXxpkagpKTl6DY0gW4LJSdkIiueJ
	 zsdjvJlH1MpxBaW6gMPVeOpMNYTVKRceT/mPm3+fJqbrD0vHOIPB+C/xtyaOwtN4VMTvF
	 /GWTzgJkQ7hZlHeVTZVQ3wIg9l7mJewYr3UJFc3S4/esPBqztzvDBTL4wyfcBsMQV8Eew
	 odVLWGhpAPvMCqMe2dybqcozDtwxaTM3KVNIsWq0yrLzyGEzkHQElqJjFVl/Hy6Vsecsg
	 c3QUPcPq+3Dh/CuDqWWA60M81XY9HJquNmD80Bhjhodhip7+xgpzjgshgiUMPxYMf5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="f/VzwH8r";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BD7606A898
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9BD7606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f/VzwH8r
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so655a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:03:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794434596; cv=none;
        d=google.com; s=arc-20260327;
        b=FrS1NXMLlKtb5KDRvqXACooNyyFbLWM5zJd75uI4YR/4DjQXPp02a0iuy5Bor1Pxj0
         h3RLxTPAMTAgst3fy9C5hhRnOjCZda5sRwK60/bpNceblFnKGluWVv1nq9QLYgCRakDd
         nlAzsoiqRDEkqesvmAWuoyTpe8BI8skD05f8iGviUQ6QUewQgmSXGcn0Gi8dXMdn5yDc
         uj6chkvzZUoVwJfP8NyGlco14AmMvthfKCeyoo7nkp3//cQjnHp7X/ZalkkU9JdPwXW3
         x13M+B7IHLOkDe3kDuImBmuWg1L+MmLXHNYjfJShmoCM6krOnOdI1ASN0Yq9v+fz7cTN
         Ze4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mul4fa6Ln0hB4RFr7GPev/ectXNF1bK3kmmDXWQ6hQs=;
        fh=ZWs+V5sVpNxbP/2IL/yK2i4UqyzV7nLiXJ0eGb6dbyc=;
        b=FukR8c4Ixme8ZrxOjR17HJWEundJkqXlOHSN3B8zWuBCBLcSBazEiV217cgKWsiWhz
         nbrvZFmoXq7TGC5AxCjTIGgUZ5yrQbzv9svVaQ37q6x5/plKDCAmEUblUELPvJWILfeW
         /MadJo/fxRFBKQd0AYsyAKEzocMDffx5nuB0kX25J00hVIdr+oV8lDQQTuPMBfeq+e7f
         ASI58c08NymkzhDxJtPYFmt9HeXZYw2k82t14d6PV9edpC4p5ZJCZY2dDpt59xGKncFg
         141oK5HezT2QtuRDIr+sPLucuKUva4bhO5W8SnZmM+MsqbO/g4K5NRLVTw+iZVd/qA0e
         LTPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794434596; x=1795039396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mul4fa6Ln0hB4RFr7GPev/ectXNF1bK3kmmDXWQ6hQs=;
        b=f/VzwH8r+rOT4OVHePl1yP77vum2XzLCVem9F6zhtDKY95k2C+p84Y/B9cBUwfJo0H
         DX1bpY9AdLJUx4p5B2SYKJchkD7WduR6DHVLk8BLeHG4rHn9JWrBtbvYtENmXMFVXu2p
         oQ3V3g5w19Ypc+hv3ttO4Kqo0lKBqNnSC4nIZy59ZpLWLmEoxf+IwVm7HP8/hcaBoFU3
         GTaT3MW2J+DTcaXOv8YlOCQ29lIHkwn8rQ9xTzs5AZ0l4eFCxSYtb1dXeMHp2l77B4lZ
         AjEiCru+VIsq8nAT3AxhvhIfHnMWdwavvxva6foOrwOSl5DQzxzTx9o24tPUPL5h1RdU
         uBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434596; x=1795039396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mul4fa6Ln0hB4RFr7GPev/ectXNF1bK3kmmDXWQ6hQs=;
        b=zCdSqQEFiF6tdNlf9BrvfJNQoHyndgzdEyLevB0eQB6CYgq7AqN9pULehh7RO5I7re
         j2XMbcUkcF0mMJ8ku21s2RtTsh0AohTwuKWiTYgUd8gb0qtuYkSMrPTK6j9+KpSGD2C0
         IXVu53/N0+CIEX7J0HdGY+tyvIpQaXXxLen7fdcA9hIz1qAuTmZqYhPhPQpuIOFXwzow
         4mAcpsfMQD9HhuaS+SjX8oWUXIxCYmbBTKfNbrmH1bCKKAMQ119LVlIuBWGJGMesIekW
         lg3tq41FudZVFpmQvfty6/SFcAjuQ96nmQ47F18go4i/eghI7t8ctiXh//6WiVOHF4jb
         Iw6g==
X-Forwarded-Encrypted: i=1; AL+hErGiWXJcuyRpr8n7+jmZ4g3y1wGzNAcIYc6CQnEum2xNlCuwUjpeBswy9LVqNEoy9hIqqLn7pz9DSl5EE/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kArOPtE+LHlUyhANA/Cq8E61g1HZS73XHFJxealkOMUdsQpTN
	So7XUN73ZXLR9pcZoJe2eA+2mQ8VK3cSK+eQQLitdxVhM8oHP5vnGpc5+pXQ6lU3cySTWqOQ28q
	zpEb4n4l6buGuWZCP6le3PrnfokoZJZwElgleMO4L
X-Gm-Gg: AYBFou00n9vS1pV+G5RkXJgMkoNTq9Zb6qgNGSwZjp7uiROjpmbSflrd5OdvG7XdNN3
	suI+o8Og0RV164v6+VAXlhPBL5hofiNtannwoz8q+fIpQXQYvR5ouKY0ZDUUslCOgqj52FCTvPa
	tDgdPO28Zd9FBn+BhU6Y7YRvYvLhrEWI/mhLPug+nWYC4zy6+OIq5S1KXxq7mIZnAvqR+bFFZbd
	WXgkNjRpc+HH8aLG8VZPoL/aQWe2KHwxO5m1VbtKRIXgLz6Mst8RQUUlAAxN1BTHq4F6AgGlrHI
	nyr2eDVF/wk9GEflgmGiRNSGCEnqB2zkNlgORjyCd7AQATNxvXKZ1p1MAmgQb2kjr0BpFIgA18A
	G+lsecI4KwXnHQyLjXCPrBRmwdH5rjVAJ33drZnWl1FreN8zKcMux5kuXjzzVUND5Rck=
X-Received: by 2002:a05:6402:c520:10b0:6b7:91d9:b087 with SMTP id
 4fb4d7f45d1cf-6b7a2a88237mr5290a12.15.1794434595704; Wed, 11 Nov 2026
 14:03:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108013838.1454450-1-almasrymina@google.com>
 <20261108013838.1454450-3-almasrymina@google.com> <avIRJ3vdIj6Jr9zJ@devvm16445.scu0.facebook.com>
 <CAHS8izOxvUxCND3R18_HfZhB=2RS4_RNfAmx7S=Ex6b5z_CQuA@mail.gmail.com>
 <CAHS8izNodRM1Bx+FT7okpdeDfCeyJVP5QoyxhSMJWXpGuwyL4A@mail.gmail.com> <avTkuRVZcOuYlu9T@devvm16445.scu0.facebook.com>
In-Reply-To: <avTkuRVZcOuYlu9T@devvm16445.scu0.facebook.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 11 Nov 2026 14:03:04 -0800
X-Gm-Features: AclHuK8z31nDU3h0IDvtHI4N0WvsgMD2xFT1mD0hWH2bfCjrrHB2M3Hvc2x4WQk
Message-ID: <CAHS8izO+yUW47rhCnaKfMS1iLHEpx44_NkB_uUoMDms0ZmJMGw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/2] net: prevent mixing frags from different
 memory providers or bindings
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, linux-kernel@vger.kernel.org, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 2:01=E2=80=AFPM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> On 11/11, Mina Almasry wrote:
> > On Tue, Nov 10, 2026 at 7:54=E2=80=AFPM Mina Almasry <almasrymina@googl=
e.com> wrote:
> > >
> > > On Mon, Nov 9, 2026 at 10:33=E2=80=AFAM Stanislav Fomichev <sdf.kerne=
l@gmail.com> wrote:
> > > > > --- a/net/ipv4/tcp_output.c
> > > > > +++ b/net/ipv4/tcp_output.c
> > > > > @@ -2692,8 +2692,9 @@ static int tcp_clone_payload(struct sock *s=
k, struct sk_buff *to,
> > > > >                                    probe_size - len);
> > > > >                       len +=3D todo;
> > > > >                       skb_shinfo(to)->flags |=3D skb_shinfo(skb)-=
>flags & SKBFL_SHARED_FRAG;
> > > > > +                     to->unreadable |=3D skb->unreadable;
> > > > >                       if (lastfrag &&
> > > > > -                         skb_frag_page(fragfrom) =3D=3D skb_frag=
_page(lastfrag) &&
> > > > > +                         skb_frag_netmem(fragfrom) =3D=3D skb_fr=
ag_netmem(lastfrag) &&
> > > > >                           skb_frag_off(fragfrom) =3D=3D skb_frag_=
off(lastfrag) +
> > > > >                                                     skb_frag_size=
(lastfrag)) {
> > > > >                               skb_frag_size_add(lastfrag, todo);
> > > >
> > > > From [0]:
> > > >
> > > > Maybe easier to not merge niovs here? Add '&& !skb_frag_is_net_iov'=
 to
> > > > that 'if (lastfrag' check? (or your new skb_has_net_iovs)
> > > >
> > > > Looks like it is tcp_mtu_probe path, not sure we care about merging=
 there?
> > >
> > > I'm guessing this is not an issue with pages because they're
> > > PAGE_SIZE? But, seems maybe a bit lazy to just hammer all possible
> > > net-iov coalescing? Is there a slightly cleaner and more generic chec=
k
> > > ( && skb_frag_size < PAGE_SIZE or something) so that we don't add
> > > net-iov tech debt? Technically this will be an issue for hugepages in
> > > the tx path or large folios or something.
> > >
> > > Also I think it belongs in your patch series maybe. That's the one
> > > adding the large niovs :P
> > >
> >
> > Actually, this comment made me realize: is the optimization that you
> > did with net-iovs here (that's showing so much better cpu) also
> > already implemented for pages? If not, is it possible? I don't see in
> > theory why the userpsace can't pass in a contingious 2MB page to
> > sendmsg() and the stack could keep it intact in 1 frag up to what the
> > driver tx supports, no? Is it worth it making your feature generic and
> > apply to pages too?
>
> Based on [0] I'm thinking that I'll drop all per-frag enforcement
> and will not add any special handing to tcp_mtu_probes. Looks like
> the drivers are expected to handle large frags (if they advertise
> large tso) or have a [1]-like segmentation fallback signal to the stack..
>
> And yes, regular msg_zerocopy path already merges pages so this is
> not niov specific.
>
> 0: https://lore.kernel.org/netdev/20261105222058.944293-1-sdf@fomichev.me=
/T/#m169832053b43604b0c5df7f7b1d04e9d4f390cbc
> 1: https://lore.kernel.org/netdev/20261105222058.944293-1-sdf@fomichev.me=
/T/#mb6e882ab1aecd6c15552773653301cc235b987d8

Thank you sir, I think I'll carry out another iteration with the other
comments addressed. Thank you for the review! Lets try to avoid these
net-iov checks when it's not something actually net-iov specific like
a kmap or something.

--=20
Thanks,
Mina
