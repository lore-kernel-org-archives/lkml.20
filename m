Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FCE4DEC1C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889789; cv=pass; b=WqoMu9xbfGxWQmmSh1SeqWd4xn9n7j2YM/WelwrAjcWGOWOCqXSXlpDVUIXeQ3qvkQ9Mrvn55znB0xMwLAaJBFNFQzS53pSs9cwVVH9gjbVuCM7h2GowUPsFu3kShOMBwuhSf5pnsvzdSlMpHXSLoOikZoOAAU4zp1KwzDoZAEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889789; c=relaxed/simple;
	bh=UcZVzRhoeIQP/WKE5W4aqOHyJbP2LuAlVU78KsWakoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqRjLl82fi8BBi1ZpLBzMrVMf+DTSk2uRw2U/LsGxohNnNFIX058rk1gHUVGEWSWbPFKyU7qdWCsJrv2/n6GY9VXCkqbTy54pi1E5+pFnRZuO/LiPdoTcAC8mZ2nLEiIaT3ZRmizzl2y9bkSlMPPMUVvgRlSjNN8iMgDmTq1Hkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFxLqOIQ; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFxLqOIQ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c33700b6435so42477466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791889786; cv=none;
        d=google.com; s=arc-20260327;
        b=Oo5MEFGJTRrDvjqW7yCCUT7AekoUf+eh/F38WZk2X+b9aAkfs2RLEttqzrA4BmaWZY
         MzrLnTP7j6DLlZmjGnQ6vZGXCypaXr8Yq/EJXbNdtRWaqvuaw/9SUJ5p5Lh2t8towBGQ
         sfnedrcnd6FnriH8bfvSIjgn0C7xobjaw/CRswDtIAT1/BhgrUQIUHj4R6H+n//ILhER
         aBM132Jptk0lmONh2iN7bPLmRhZEIoUoNKOUW2G8Te/GZqIZZlWjpGML+iZIn++GEq9F
         iZUm93VN0jAjQBn27a06kYPpqLotHpf5oBpoSa/uZ7QYFSOfIijCPlD8bDSakfSvu+od
         Uj4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qUYEAbMlagK2BL2xVw0lZM8FgHGPeijkSqSYtKkyQKU=;
        fh=wKAWMYXm9K3+Kja5r0BnTI3or4EzvEyBhgkj2AolZmo=;
        b=PXCKsmbfm7stXP3VZn2lVxpWi3Uk/Hif7krzEmj2a2Zk9cgCTZarszgwN5k4KZiI7+
         W31NYP+eKjYehGPK0+rjCNr5fZzgU+p3T4S7gNhtbxPNnQfervxQ/P7qiDYJl9OZnIVC
         AFPGgz3iI6NBj1tq01crKZ/oul4Q755zXxj9HqYGNLo47l3IgBVZY9hF1ZIcEXDpmLqN
         XyLRItKB8Dt1QZwUhDqo+N83LWUpXFg5xP46fW5nb2SmBbl6N1ka6Iq9b1ChYTn3AoX/
         meAg21z+4bmzqctx5fuzkxlbe+doBSYBpaaYpGsMJ/+GH/SEK9zryzMnZOibUzfpqy6i
         KQ7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791889786; x=1792494586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qUYEAbMlagK2BL2xVw0lZM8FgHGPeijkSqSYtKkyQKU=;
        b=YFxLqOIQyKcsHKYZ7D6hmlPpzOvsMCiLeHRRZBnCZqcxW1mGEBWT1FTFIyb7gm6DWw
         o1DgDtPzrOTTXOP0Rkp2eKOdbrAFZ6eh5pBd7fKblMm8B19g0uZDAYMnQNoHxe/rLcwI
         OUSfQVlFzEbhbBb0i6T3XuWlNYW1LdgHUX38CMOaMu7gkZu5VdY7rHBJn7ESOZUPXoxA
         zeHFSIhrX8WiGqFGq9HJT408hZ6+c5YoDsJu9prpzHymywBbx3o5okMKEtlQ3oB/obIO
         /W+zUZoontGefPsIceMlYcO4qonuzB3V6qOoYQiBv4fzUqIUQio3CcHEsO9aPa8eupFK
         rPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889786; x=1792494586;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qUYEAbMlagK2BL2xVw0lZM8FgHGPeijkSqSYtKkyQKU=;
        b=CFt54aVsq9I/DiaCcADWNt0/RZVKz/oAlhmvZlMMgOtmndyi5PEc5FCy6nMT42xG+f
         Y6pC+gZnDZeu2+WN4YNAc6+9Fdvjk38zBQDTlD0jYBvUVaFskJyOsT5/JtZrzaxqhK2n
         mL2fA3Ywaf6QebPr0cjEjKqUDO2quFaJEoiJznZfL2IIPkF1Wla1lWkwcnjZDoaGnCaS
         GTQ1+mboIdy2RkXdq8G+8eQxov2dYqRR6ckemhxa/rEZmcHjQVkdcTH6m0Zy7ymTqRvK
         1n9LDFoRrT/N43HF2iGEDxXVMcleGIThvLrXO4PmBdjhOVWknHkVprG0Z3E1auv0Wkw6
         9b4g==
X-Forwarded-Encrypted: i=1; AKwUvBxmkcsg5hXznaFIs7upNzkZ1ubmjgmDfdvQiRPI2YKj1o2XublX4FTJ9aI1VyZcqJ+3w7ubJ0bRQ/3WvkM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7aL7dcVe1/AgfzmdsgYu1X7ZLrT2B8sZla3XG3nKw7HutGPED
	d00NMtDjibtLYZuK5vBQMx/slbjQ6feH7I6pLZ+kIAjW6JKgp0711Y2rwV9z9rHcgZ4NifRNUCB
	5W7Eb/P5F/w0uo4QEnIur60hhWBx7WrNq8wQA2EWtSt4m
X-Gm-Gg: AYBFou2W3u8QcU3/oheEZvQgAChUDq9fEo2gz87uLqi7dMyel+YixMcQIRdcxcnsHYm
	K68NuJY7njnZviB0XYZFQaLnvT34ctEcGWncl46u2ywKxpHJcRrE/ClbxN1QB2qt47AQLhiJnDS
	EUCDLPEc8h2XvAhsvrfWeUb3UzWs73S8Ri5kh3wtQ3iF55Ntga0eOWyClchmGB17oEjPaJpu5X3
	YFHu/lFR5caqk3/OfJKBzxDyFf53srIONfOeNwsAmQJYNvUujdYWl9sZVRCZnxcBJy9ZIqFf099
	eImGadlTWpvz5hcZVNjZ+Y0z3SSlAU5esTzwcDFCC+ZYm1p1Pkh9VN38Ed+rWM/ul7Zy0qhRNst
	5TIkESS8L
X-Received: by 2002:a17:907:7fab:b0:c29:5637:ed76 with SMTP id
 a640c23a62f3a-c31a9d117ebmr1341139566b.2.1791889785658; Tue, 13 Oct 2026
 04:09:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904165544.1362052-1-nicoyip.dev@gmail.com> <20260906153354.GB323313@shredder>
In-Reply-To: <20260906153354.GB323313@shredder>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Tue, 13 Oct 2026 19:09:33 +0800
X-Gm-Features: AclHuK9729ycb5UEiVzzWrhYB1-2Fn5qggRfxnH7xBdvI19vdn6NyzLlKfU2-Is
Message-ID: <CAAo+4rW_P18KuihU+1DDyRrs8W-6TX52n=vBAWm=2uyfAK=V0Q@mail.gmail.com>
Subject: Re: [PATCH net v4] ip_tunnel: reserve FOU/GUE headroom before encapsulation
To: Ido Schimmel <idosch@nvidia.com>
Cc: David Ahern <dsahern@kernel.org>, netdev@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Xin Long <lucien.xin@gmail.com>, William Tu <u9012063@gmail.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ido,

On Sun, Sep 6, 2026 at 11:34=E2=80=AFPM Ido Schimmel <idosch@nvidia.com> wr=
ote:
>
> On Sat, Sep 05, 2026 at 12:55:44AM +0800, Chengfeng Ye wrote:
> > ip_tunnel_encap() expects its callers to reserve headroom based on
> > ip_encap_hlen(). ip_tunnel_xmit() currently pushes FOU and GUE headers
> > before it grows the skb headroom.
> >
> > That becomes visible when ipgre_changelink() publishes UDP
> > encapsulation before it updates the device headroom. The transmit path
> > does not serialize with RTNL, so it can interleave as follows:
> >
> >   CPU 0 (ipgre_changelink)        CPU 1 (ipgre_xmit)
> >   install GUE encapsulation
> >                                   reserve the old needed_headroom
> >   publish larger GRE flags
> >   update tunnel->tun_hlen
> >                                   push the larger GRE header
> >                                   push the GUE and UDP headers
> >   update dev->needed_headroom
> >
> > With REMCSUM, the new layout can push 16 bytes of GRE and 20 bytes of
> > GUE/UDP headers into an skb with only 32 bytes of actual headroom. The
> > final UDP push writes four bytes before skb->head.
> >
> > With the update window widened, the kernel reported:
> >
> >   skbuff: skb_under_panic: ... len:128 put:8 ... dev:gre0poc
> >   kernel BUG at net/core/skbuff.c:214!
> >   Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
> >   Call Trace:
> >    skb_push
> >    fou_build_udp
> >    gue_build_header
> >    ip_tunnel_xmit
> >    __gre_xmit
> >    ipgre_xmit
> >
> > Snapshot tunnel->encap, route and perform PMTU handling first, then
> > reserve the final headroom before ip_tunnel_encap() builds the UDP
> > tunnel headers. Because encapsulation is now delayed, pass the
> > snapshotted encap length into tnl_update_pmtu() so the inner packet
> > size stays skb->len + encap_hlen - tunnel_hlen.
> >
> > ip_md_tunnel_xmit() is left unchanged. It takes FOU/GUE parameters
> > from the skb metadata dst, not from the device configuration, so it
> > is not exposed to this race. tnl_update_pmtu() still runs after
> > encapsulation there, so that path passes 0 for the extra length.
> >
> > The IPv6 analogue of this headroom reservation is still work in
> > progress.
>
> Please wait for the IPv6 part to be accepted (some changes are needed
> there and here as well) and then mention its sha1 in the commit message:
> https://lore.kernel.org/netdev/2ce8f3e4bbed6060afb0aee33dc4e1d9ae021280.1=
788262122.git.petalzu987@gmail.com/

It seems that patch has not yet been accepted yet. Has there been an
updated series that I should follow?

Should I continue waiting for that work, or would it make sense to
prepare the IPv4 headroom fix separately while addressing your other
comments?

I also noticed a newer overlapping IPv4 patch:
https://lore.kernel.org/r/20261010223601.1193655-1-theodorlarionov@gmail.co=
m/

Best regards,
Chengfeng


>
> >
> > Link: https://lore.kernel.org/netdev/b58876297f7d45de008f2e94b6ecab8b2e=
d84d21.1786088695.git.petalzu987@gmail.com/
> > Fixes: dd9d598c6657 ("ip_gre: add the support for i/o_flags update via =
netlink")
>
> Looks like a more suitable Fixes tag:
>
> Fixes: 56328486539d ("net: Changes to ip_tunnel to support foo-over-udp e=
ncapsulation")
>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> > ---
> > Changes in v4:
> > - Not restructure ip_md_tunnel_xmit(); only pass 0 into the new
> >   tnl_update_pmtu() argument.
> > - Snapshot tunnel->encap with data_race() and reuse the copy for both
> >   ip_encap_hlen() and ip_tunnel_encap().
> > - Fix tnl_update_pmtu() inner packet size after delaying the encap
> >   push: pkt_size =3D skb->len + encap_hlen - tunnel_hlen.
> > - Keep reverse xmas tree for the new locals.
> > - Note that the IPv6 FOU/GUE headroom fix is still WIP.
> >
> > Changes in v3:
> > - Move the headroom reservation into ip_tunnel_xmit() instead of
> >   growing the skb inside the FOU/GUE builders.
> > - Use ip_encap_hlen() to reserve the final caller-side headroom before
> >   ip_tunnel_encap().
> > - Drop the IPv4 raw-pointer refreshes that were only needed when
> >   skb_cow_head() could run inside the encapsulation builders.
> >
> > Link: https://lore.kernel.org/netdev/20260824111944.187200-1-nicoyip.de=
v@gmail.com/ [v3]
> > Link: https://lore.kernel.org/netdev/20260808005956.3761487-1-nicoyip.d=
ev@gmail.com/ [v2]
> > Link: https://lore.kernel.org/netdev/20260801060115.3538849-1-nicoyip.d=
ev@gmail.com/ [v1]
> > ---
> >  net/ipv4/ip_tunnel.c | 24 ++++++++++++++++++------
> >  1 file changed, 18 insertions(+), 6 deletions(-)
>
> ipip6_tunnel_xmit() also calls ip_tunnel_encap() and seems to have the
> same problem as ip6_tnl_xmit().
