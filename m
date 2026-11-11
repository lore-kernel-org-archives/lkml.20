Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794405014;
	b=0sl81krZvtN+KU33dtrGF4RjC56BhLZf2DLfyQ6leWNFLnTsfiT3AFfWG5zmEJrkB5Pv
	 BYha2BIuTN2bSlMMK7UKjbXWFTVcfuq7fnyV7cdY6qRuL58SUjdIxYqrZbKJwBySpszKY
	 dUr4JXvqx8LTFWKXQ1bpYdHeJzw3FUpO9Bgs4Bct8S4g/xPaQ+e/WLaNNURwc03UaIts2
	 e9Oq3ZZXtUHVcFeQg49WdzLqCxvGvNa2h6/8ZHrvoAeq3N/Yyi4j7Quv3J3N9Xu5afoWd
	 +KqKAe+E2EFz51/93L+4S80PyLF+SKsuwjniKWmPnR2+0awtemXBLNZcie4khB/IbPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LAzqXJmmTPUQnE1+GTZ/b0TQ8axo5J+C46CaOWTj6Ko=;
	b=f/+QsFIBCRMUgfhV+ZwO9voNy7LMeePzQSjUGL57PFB3asjchvvOXC/yG28xlLIJmpF6
	 xWthC0L15xI7Y5FiwL4CfAxkMrfSvRbbZXssCv7xpzvOqm4uZ0pKPmQZ8LG0wzY9zQy8x
	 5WzsZiEXYL9PRS99+R9shzS+CtMiP11zbqtz1tGtUaQ8COSImj+LtcYhLhGNjWtnVQCVF
	 KGSHs/mnvm5o07lQXdBqJuJDrJfFlPlGEII+yOVuMEpU5xDrIIl6UacLytg882jm1utrs
	 iari7fdvo73lACuF8SpV8kpwFJ64m8ZN6E6fqxcqALr7wuNsLyGYzPN4vmdvwK6D0hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I6FLAu8h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FEC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38FEC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I6FLAu8h
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-150ef97e790so5220c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:50:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794405012; cv=none;
        d=google.com; s=arc-20260327;
        b=RVEBT+XT3Zpn9+0N2PoqqNnN12GGEl9IHqJsZNKF5zXRn3uqAH7SeiGX9HATyi7+8u
         Xxl+I934x9kSiM7t59pJYsAPY/E89x1OWNtcbu6uj22MJQJPM+NBoO0aA0WyIAtTpNDU
         oNHQpW1QiD1uBmHxCsSI/j7vMGOKDbjYVOleRKF+vr5JujfLCnEK/t92vDTBH8iWrFV2
         hfHHG3Dgf6WdYK9XjCCmMAMYVSMxwtR7U15UiMQXhxuKqXT5HpAntflTriSezl38LXj3
         fUgaPOG2PZXSyL9GF/Q77doWvJfCkNNSMbc022ziJVPXS2Wz0JmPbVaQSgU1kfLOi3c3
         PVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LAzqXJmmTPUQnE1+GTZ/b0TQ8axo5J+C46CaOWTj6Ko=;
        fh=jqdwEY22ahsvrF+Pvhlwx6oPoF4xBillH1XpZy1FM/k=;
        b=EvEuqpv4/s9ZD6PUIhEWUnmrwhdJfV+UaZatsZofZhGLtSjC/rvIw4d1ZC2CJKwEBq
         5EXDOMYyMJrC1wA3Uo0jguVf6MKIsZJIoip+Hh7tkfSEIQGy4n1MMO4O6wseHCuJ0sNm
         dTOGsoVFf64oadFFbla1M5PpZjyfbNMs8EIf5pC/Dt6RhdOES2WIGzfGrKMvgMeK56R6
         dgaMWKdxnEY4qM03PU3+ZmqQIC4HSs4WiFmNoMNvvP5ByvAQQtMIIRfBVod1oDYRN1UT
         r/7Zuw/rcIFFhNvymLEk93xlh9LZZ5pvfGlyT+iOC5XAUW40YGs/0e2+dQoRm37dl0Fz
         vR/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794405012; x=1795009812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LAzqXJmmTPUQnE1+GTZ/b0TQ8axo5J+C46CaOWTj6Ko=;
        b=I6FLAu8h7YdzrfpPOgrUpuCwg/xsc5G2CgfRQ4L8NyYL1YhpiEHmNY/9JlUXimo54g
         VmX88jGl45coA5jluySUPCTsqQ3jWuCnnEGibRLCX+vHSc/o4unFIuWDh2rjSO0MTIQT
         ozz7HZdlWBQv+vgaXsgjhS9UeVpZ98dTkYt+s0mUWdVeUcboaVKp+gSLRxInxacKeZYT
         U28qUkYArAXgOST9LWgmTU3na2Z/0hMHIBK9YMXCHBheyArTEyNDAgYim0n5jUKzKyD7
         M+jK3XdShevjNP6GGoNTpcyUElLGTh7xl+DD9IXuBdgwb61x6kGUgzDPs6pLBVR6h/pp
         otBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405012; x=1795009812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAzqXJmmTPUQnE1+GTZ/b0TQ8axo5J+C46CaOWTj6Ko=;
        b=DDECm8Okl4uC7JSgFGh4XXX3r2jDLHSkcq/FF1ebAwoDCdWpeztLu4ynkW4qKdO5Pd
         ZypLmKeHHHw6qomyndTwLhWFfB3IjebJZ5yWuVEFyeqOXjmXw2I7GCSCZbhGxcehLtvD
         kodZbf26JtrrIRxtqlntfoZWoWjYJ4iYz6Zeyc/WJAcd/YytwIYCZEZgk2djyIaD9qtS
         1HQVwfukbntRPk8iHFWRT9xdZ3fvwkPf5B1mwNoszyet2YC3SigfR5F1UR9nOCjpdd1C
         CWJ78zOsuoT0t0ZCoi8D5+BGPphgNJWU7oQ1IuLJcIarj/EUCyJd0MOkd7bW0s95HUph
         Ltcw==
X-Forwarded-Encrypted: i=1; AL+hErGfYmn3J0VulfJ2ugFuqlbbUoYknuGJVOLNdPD5SIhbtf7ZE7D9OkoxzY5NPqq74kdI/oX07TzhMX5e7hg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9whltDkmS/toegpGnJZGXw228ubQ1s8plnlQf45zYiYXLabv4I
	jdhZnBwFcJN/az+3KHxu7XcoQ32NwkN27MvVCGzYws+UWIyOq5IqBILjQZdf9E4xHekNjUpCS3b
	eCooTye4U+qQaCck6aO1sxAt4VhMcOIMc/qK/WImL
X-Gm-Gg: AYBFou29z1Tk3j5ccnSzDM/tIkQH4ORZSK28kGrYVZaIQdcZHSGYOBcwkKgK4/+ITtD
	h41DoaYyc/0X9SWyMbyiziXP1gXWAiZdk66zdiUfQ9SKsC4XwnaP04btQ62E/30iwXh35M9ThQY
	TivoZngvkeEKjnd54mguVo6OMG/GNfK2ldJ1QfiYkzwwHZC0+EmXr5rKRCU1I3uNARPy0yrzK6u
	a23s8PP1FqTV1ZYMP6Ohmumb7VHoqbAYOqx5xEJgfiNjSjsyNUN4Arc3uM3SZpjZz2fkUsV8J1o
	eGPaYZku9+SwG8u+amWxtF7CBs5zITySQ1UtUNj3CDgLT8L3J8Uiy2+WAvFAw28WhPw7xFzfS7Q
	nZ6zAwXqZcGQudbNEq/1i2k1YyjOFQfDzjAd2mtidG1/rpTdNhiuybp8G4vjnu153OAA=
X-Received: by 2002:a05:701b:420d:10b0:155:1a18:e9fb with SMTP id
 a92af1059eb24-1b3c03072demr318941c88.17.1794405011103; Wed, 11 Nov 2026
 05:50:11 -0800 (PST)
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
In-Reply-To: <CAHS8izOxvUxCND3R18_HfZhB=2RS4_RNfAmx7S=Ex6b5z_CQuA@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 11 Nov 2026 05:49:55 -0800
X-Gm-Features: AclHuK--VoyZ9R5ERWwbbW8Q5Z3TjeeQ1Z3vaLOtqtyXf-txWLqBbnB8sJo4YqU
Message-ID: <CAHS8izNodRM1Bx+FT7okpdeDfCeyJVP5QoyxhSMJWXpGuwyL4A@mail.gmail.com>
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

On Tue, Nov 10, 2026 at 7:54=E2=80=AFPM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> On Mon, Nov 9, 2026 at 10:33=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gm=
ail.com> wrote:
> > > --- a/net/ipv4/tcp_output.c
> > > +++ b/net/ipv4/tcp_output.c
> > > @@ -2692,8 +2692,9 @@ static int tcp_clone_payload(struct sock *sk, s=
truct sk_buff *to,
> > >                                    probe_size - len);
> > >                       len +=3D todo;
> > >                       skb_shinfo(to)->flags |=3D skb_shinfo(skb)->fla=
gs & SKBFL_SHARED_FRAG;
> > > +                     to->unreadable |=3D skb->unreadable;
> > >                       if (lastfrag &&
> > > -                         skb_frag_page(fragfrom) =3D=3D skb_frag_pag=
e(lastfrag) &&
> > > +                         skb_frag_netmem(fragfrom) =3D=3D skb_frag_n=
etmem(lastfrag) &&
> > >                           skb_frag_off(fragfrom) =3D=3D skb_frag_off(=
lastfrag) +
> > >                                                     skb_frag_size(las=
tfrag)) {
> > >                               skb_frag_size_add(lastfrag, todo);
> >
> > From [0]:
> >
> > Maybe easier to not merge niovs here? Add '&& !skb_frag_is_net_iov' to
> > that 'if (lastfrag' check? (or your new skb_has_net_iovs)
> >
> > Looks like it is tcp_mtu_probe path, not sure we care about merging the=
re?
>
> I'm guessing this is not an issue with pages because they're
> PAGE_SIZE? But, seems maybe a bit lazy to just hammer all possible
> net-iov coalescing? Is there a slightly cleaner and more generic check
> ( && skb_frag_size < PAGE_SIZE or something) so that we don't add
> net-iov tech debt? Technically this will be an issue for hugepages in
> the tx path or large folios or something.
>
> Also I think it belongs in your patch series maybe. That's the one
> adding the large niovs :P
>

Actually, this comment made me realize: is the optimization that you
did with net-iovs here (that's showing so much better cpu) also
already implemented for pages? If not, is it possible? I don't see in
theory why the userpsace can't pass in a contingious 2MB page to
sendmsg() and the stack could keep it intact in 1 frag up to what the
driver tx supports, no? Is it worth it making your feature generic and
apply to pages too?


--=20
Thanks,
Mina
