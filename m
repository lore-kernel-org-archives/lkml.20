Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793924823;
	b=rYLVizbD+1dZ4QUDOANGPnD6CvVmEQtVpC/ZdQyu2wfoNiGOkAB7oXCrKzs5H02wYnEj
	 47KyzWLvwZ06Scj7Z2WzklduHN+0YQm/z10/+JjKRoXJ+PUjyaoML+sOeA1eCCOtVJG3Z
	 Iv3bXdGztPNMaJaTRRpsdJ5XnlNKdJqZyDWunCJQJbPsaYSvz/8X49gV/56u0BLVIIFni
	 9ZaX+OmQtIpkcJuhO+IgKgOpwN2s8nk7gE1L37Nwp2ut7iYHh19EuSTTiIPK8mgljairS
	 TY+2Wbn5raSbWogxEjfBESte7cKKN/lLYWmWMi//4kUCPouMmnOl7H1vvpUSgCQ/I2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=q0hyvU+ucajnUy7w/QIwVHHHP6trSeKQe02htFHCQbE=;
	b=JUC6T2VvTHWgHt1SzcbeGxM7KP36JuZzcRuOkCTNwX71Th86wwyJz8rAvZLxFTTfXMhL
	 xqsZzs5mWBEXRMG2blMOhgZqekxzyTDemwGZkxdjqPXTZdkRvp4bwXQI1dh2FrZyWp42h
	 xAr/9cpzQEOvtRXBwNVZ5X69iDl+6RcMT99MQnpgj19lUBkrXT66iZgYEQ6FtrtwFRe8S
	 +sWn7zEpz18WaPoR9PyW8349sHEqqojKnDNczaqNnC7fOIm1A92aagfnC7Yv/KwQjBWYa
	 iyX7Wq0KR5e2L0Jk9HDARHPYPPKdyrR+EuvfmZf1+ON9X5DwExhE90XNvQp8tg5dBJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OR3sP8id;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA56B606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA56B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OR3sP8id
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-54492d8a988so5711cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:27:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793924822; cv=none;
        d=google.com; s=arc-20260327;
        b=nmZfxGiTgf95MWPB4msLxDNI02MD8NiJLmGBybt73O+Uiwd+ZknxLgzp2jLBovblRk
         ZlJx0Bw0PcSQTONuMMPeoNpqPgfQLJzvxlIfc8cmnW6fLUPTvBJc2a/mnnWMT5spAta4
         h53OFRqXmov8nVpsg4JdNn+tt/Tzj9XqvTETDp3x7ekzCnUZsSyqkANtC7+qmPrwI0Ro
         p5r2a+nGnGV+fvM8TpmkGxNxHVjIvvbShAyAOFwNEwigcCv480+7PrShxLGzZwKK1LTg
         JyNOPHFo4s3JExt2vYQC7sB00rjJTNGfA5/i88i51Nw2E9NGhXNAYXwiITMQ6zcVFEwL
         9X7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q0hyvU+ucajnUy7w/QIwVHHHP6trSeKQe02htFHCQbE=;
        fh=EoLqZGOB5Mujh/DQ77IyCRvpPQddwb9uvdAHDVW9Ob0=;
        b=Xjj7IB89EvhWyiOzXWVX4NUY+ezUgNUWR/VqMbw74JOu8vn3kttZD4Rx2uGziqR7PW
         KKwtyRhbuRhp93jyajLngV5llti466xgi7kUyJYxpGf3L4rXD8hL6y365DAZ18J1Wl2J
         2ldaGSHQ6QfF7pDWa4EFrD9G63wXiyyC4P2OBgZ7Ob0xJvTmIbVE6+Lzr0OlKro3gB6O
         KfCps5s4YSWknWDdxhlCczvtoTCkIGJ/9ctSPQgmOXtswLDqhXrhRhW1q1UdTod7HR0N
         EaYNyTcURB8v3c5BTiCjoYQQeF4hXLT8S4rvYzlgosoXJ7cQW86EG0FKZcnuVcn4zIIY
         zmNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793924822; x=1794529622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q0hyvU+ucajnUy7w/QIwVHHHP6trSeKQe02htFHCQbE=;
        b=OR3sP8idCd8lFUwObgHP+VoQLI2+GkZfdoC5R3Lts44EKxKYVtT0Cr+35JH1bp3CwN
         BtFmUm7qNizvngsg1eH2rzSzvjrVqUfH0amDOFKV8cL39dERSLelT5MNEYA21oCikqgH
         gVDndYYv51i0S33sBB89IZM76e5UdJvtwjA+uuVqrzO8rmC2b8LLnVTSPuCrRWnBmLde
         /Xw9xlvEw5VcCzVgQxS+4FnO2RVKk7lZKjkBexwXNYP9971NFZOcjmAIoFJyEBR8C3vO
         dTPVSxa9F9c15TSmKpv1SPbBG7MUbtQ3Y+ZH/0cfOHE8Ad3xbLAOkwa5VBehntKIhw0E
         xXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924822; x=1794529622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0hyvU+ucajnUy7w/QIwVHHHP6trSeKQe02htFHCQbE=;
        b=zSTOnZUqInXq6TDIe3n1jaKpofVe2z7qwW+zhfYA5D58zgMaApRpbWGtlmDL6tuH4T
         nuByWNVi/BL2nrdOHrhH8WDreYpFsMybubSI41QD+m8sVWuMX98TkCFufJqGhyW+4MhC
         KkrORamJI8QVyU0NyjkN15zA/qDIpq8td+C9aon+/uw44fo3EBSewCqJ7zAw5L21tzyF
         6jBJ8LCcqDU9s6P4kKc+0W1nB62WLixlwD93vTlOV9gbi2gtozwuzv0liGqPA6rdSY0Y
         t1palDfNRWGBgJXk8tnQYICoDS4XtSeJgG/LIBlrEeEcQDT1MEgvApLBETAKU7KBjeg0
         n4CA==
X-Forwarded-Encrypted: i=1; AKwUvBywKc8DImoTTHMM7pxMqdowKNYXH306xLYb4gRjhsGIhsSnCc6JvkHfpP2IFiYBYjMt8uWujyUxQ/xuaRI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iYYEGBHOPa2RwAA63H3zJXkLeAUH6YehQk1ufhP/g3tbRWBph
	wvrrKnmcMjEJloK356AzRJC5bdovsK+pY+BGXnPcGFU/oYmO2HiVLLHMMOC6oAiRQliWvZ+4v0y
	0MnexSR68Tzw/CPYyNXywSex+0MhKIhscIxvQvXXN/Id9Mr2HnNwLUt3Z
X-Gm-Gg: AYBFou07Ea3DiaFpQudUzj5rdcYUpnamyU/cdD/QIZ7G8pwk0m0K6Ogx40Tb02t+/Bl
	zS2FUUDjJRH//170PoHtB0GdM3E1zFGp2uMLqOtpy4fdcR67TTzGoCUXEsyWopoqkw/D4g+hUB1
	CMuiQ/a2LVDtTE8btp08kpbElkEpk/JtJMdUfYmITRnA5YRLBXHTzTQECb43RXDk9Z/2Zp0qalX
	TquhVDiTZigIjSrS2eI5mJLPk7nbhokU1O6ytaf2TZQBR1G5S78oEnobT8pXM8/SQpzzRPvWcub
	wPsrDNHhE5TlpWpdyKswc5lQmoAeFSKPVciQ4IbWfntcO2KYefJzIVVJJtLPGJv9moFZZ0f5VKV
	XU9G2NeITA/XV61ADEqbtNf2pWQSOM4mZAN1k
X-Received: by 2002:a05:622a:1246:b0:536:353e:8d2a with SMTP id
 d75a77b69052e-54e18330dcdmr8567761cf.1.1793924821140; Thu, 05 Nov 2026
 16:27:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030043145.2185700-1-weiwan@google.com> <20261030043145.2185700-2-weiwan@google.com>
 <DMNC538FF7AS.2JZQJXNEZG6P6@gmail.com>
In-Reply-To: <DMNC538FF7AS.2JZQJXNEZG6P6@gmail.com>
From: Wei Wang <weiwan@google.com>
Date: Thu, 5 Nov 2026 16:26:50 -0800
X-Gm-Features: AclHuK-ILsDSgY5YgNMpnZ8hmoNqhj7qLVOd_4uN32yLwqUvq0acaga0lCDJnaI
Message-ID: <CAEA6p_CuU1o25nXzd71C7chjj5xRS=qtNhP-ypwzV9H90MSy=Q@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] net: Make PSP skb extension survive packet scrubbing
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 6:09=E2=80=AFAM Daniel Zahka <daniel.zahka@gmail.com=
> wrote:
>
> On Fri Oct 30, 2026 at 12:31 AM EDT, Wei Wang wrote:
> > skb_scrub_packet() drops all skb extensions unconditionally via
> > skb_ext_reset(). It runs on tunnel encap/decap (ip_tunnel_rcv, vxlan_rc=
v,
> > etc.) and virtual device forwarding/redirection (dev_forward_skb,
> > netkit_xmit, skb_do_redirect).
> >
> > When a virtual device such as netkit is associated with a PSP device in
> > another network namespace via PSP_CMD_DEV_ASSOC, incoming PSP packets
> > decapsulated by psp_dev_rcv() lose their SKB_EXT_PSP extension when
> > scrubbed during redirection into the peer netns. Without SKB_EXT_PSP,
> > __psp_sk_rx_policy_check() rejects incoming TCP data segments at the
> > socket layer with SKB_DROP_REASON_PSP_INPUT.
> >
> > Introduce a static skb_ext_scrub() helper in net/core/skbuff.c to
> > preserve SKB_EXT_PSP across skb_scrub_packet() while dropping all other
> > extensions. If SKB_EXT_PSP is not active, skb_ext_scrub() simply calls
> > skb_ext_reset(). If SKB_EXT_PSP is the only extension in the skb_ext
> > buffer, nothing needs to be scrubbed. Otherwise, save the PSP metadata,
> > reset the extension block, and re-add a fresh SKB_EXT_PSP extension (or
> > clear skb->decrypted if the allocation fails).
> >
> > Fixes: 06c2dce2d0f6 ("psp: add new netlink cmd for dev-assoc and dev-di=
sassoc")
> > Link: https://lore.kernel.org/r/20260910-bpf-meta-inside-skb-ext-v2-3-0=
b21e42180b0@cloudflare.com
> > Reported-by: Daniel Zahka <daniel.zahka@gmail.com>
> > Closes: https://lore.kernel.org/netdev/DLODSKPY6ON6.1G6SP3CFFLCPJ@gmail=
.com/
> > Co-developed-by: Jakub Sitnicki <jakub@cloudflare.com>
> > Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
> > Signed-off-by: Wei Wang <weiwan@google.com>
> > ---
> >  net/core/skbuff.c | 31 +++++++++++++++++++++++++++++--
> >  1 file changed, 29 insertions(+), 2 deletions(-)
> >
> > diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> > index 93c2f440b9ec..5c4a2e982ebc 100644
> > --- a/net/core/skbuff.c
> > +++ b/net/core/skbuff.c
> > @@ -6369,6 +6369,32 @@ bool skb_try_coalesce(struct sk_buff *to, struct=
 sk_buff *from,
> >  }
> >  EXPORT_SYMBOL(skb_try_coalesce);
> >
> > +static void skb_ext_scrub(struct sk_buff *skb)
> > +{
> > +#if IS_ENABLED(CONFIG_INET_PSP)
> > +     struct psp_skb_ext *pse =3D skb_ext_find(skb, SKB_EXT_PSP);
> > +
> > +     if (pse) {
> > +             struct skb_ext *ext =3D skb->extensions;
> > +             struct psp_skb_ext tmp =3D *pse;
>
> I would move the copy just before skb_ext_reset(skb), but it probably
> won't make a difference in the generated code.
>
> > +
> > +             /* Nothing else to scrub if PSP is the only extension in =
ext. */
> > +             if (ext->chunks =3D=3D SKB_EXT_CHUNKSIZEOF(*ext) +
> > +                                skb_ext_type_len[SKB_EXT_PSP])
> > +                     return;
> > +
> > +             skb_ext_reset(skb);
> > +             pse =3D skb_ext_add(skb, SKB_EXT_PSP);
> > +             if (pse)
> > +                     memcpy(pse, &tmp, sizeof(*pse));
> > +             else
> > +                     skb->decrypted =3D 0;
>
> Agree with sashiko not to clear decrypted. It would at least prevent the
> skb from being forwarded cleartext back onto the network.
>

Yea, makes sense. Removing this in the next version.

> > +             return;
> > +     }
> > +#endif
> > +     skb_ext_reset(skb);
> > +}
> > +
> >  /**
> >   * skb_scrub_packet - scrub an skb
> >   *
> > @@ -6380,7 +6406,8 @@ EXPORT_SYMBOL(skb_try_coalesce);
> >   * operations.
> >   * skb_scrub_packet can also be used to clean a skb before injecting i=
t in
> >   * another namespace (@xnet =3D=3D true). We have to clear all informa=
tion in the
> > - * skb that could impact namespace isolation.
> > + * skb that could impact namespace isolation. Note that PSP skb extens=
ion is
> > + * preserved across packet scrubbing by design.
> >   */
> >  void skb_scrub_packet(struct sk_buff *skb, bool xnet)
> >  {
> > @@ -6388,7 +6415,7 @@ void skb_scrub_packet(struct sk_buff *skb, bool x=
net)
> >       skb->skb_iif =3D 0;
> >       skb->ignore_df =3D 0;
> >       skb_dst_drop(skb);
> > -     skb_ext_reset(skb);
> > +     skb_ext_scrub(skb);
> >       nf_reset_ct(skb);
> >       nf_reset_trace(skb);
> >
>
> The only thing I would say is that skb_ext_scrub() won't scale if a
> second extension comes along and wants the same treatment as PSP. In
> that case, either we could make a bitmap of "no scrub" extensions and
> then use the same approach of allocating a new ext block and copying
> them over, or the original approach of skb_ext_del() could be used after
> changing the reference counting scheme for the special extensions in the
> release path of __skb_ext_put(), but that is a more intrusive change.
>
> I'm ok with the approach from a PSP perspective:

ACK.


>
> Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
