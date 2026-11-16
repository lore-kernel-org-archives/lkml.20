Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794859536;
	b=cvn3z94KazaqphftQTxuFE1ICE0PMuQaCvhjIl4VlPZ93JqK5kY9oOqBh39HneUD8iGg
	 8nXC79ipQfsDiNUfArlXj6KwX8hLFyeBD+R+OJX1oxNzv08fzFpYc13ht61wydLYjTVHg
	 V0DrYVBQ09VFrZUyXVhw5x1u2vD032MtOa07t1KdKtNElecCyfEra6uDMSAFGdrGX7vlc
	 w/TEFq8R43h/F3IoDnd9yi4C+ILLvsZREiTuad808HcSIitYYqVJfZmssrZKUFHci8Icd
	 /ixlgQn2jwib2vprHgsiW/6VfYOqRwchvNnMugIVfb6T8fxw+uXofIV20MyihIEp7GA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2FbHC+AouLeCTX4lljlFzinGOTMD7NXf67uVcoKnZkY=;
	b=sjRVNitWf7PK6a8K69Lf298WzoLAumYPgbfscD1PtP4tsYhDC2cldqz4nK/2rfs2b4Ml
	 qymRt6fcbKR1DXeD1M8/x6hw8skDtAXLlyiffZ9bZaE4oSUXGvp6ihunUQsvzs9hRqmm5
	 1jGRKKK++qpK1rB7npsqcxDU3WkAMLHp7Etce1Q/BSS9G+41glT3m+cvkCcrHyw5wXyDR
	 lV+T/W1BbCikYAZ9xVu/0SfX7288WoyzCf08km/dw+HG/IzdhvY7UDpkbi6PlGztFp5lJ
	 1ClQZt6bkPSHmXT3n6uph7WreA7WkdvW5f1H2+vYC0wZnYW9GJC+IJV8Z61VceilukQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IkksPml8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A644606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A644606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IkksPml8
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so1852a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:05:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794859534; cv=none;
        d=google.com; s=arc-20260327;
        b=GQ6Efmhenl3xTxMKc2+BiH3ghEavG83sBIeBAibIaMTtEeHA2nKVPeED89xHeG/M2u
         X0khPApaTZu1HEZn9XaF4FwTtW4LtIdNksv6x35PX5RFp8xqMrH3rCnuO9LHt6LHjnsU
         WMqmPVsAdwGVwwpNdwbBJSLe52gMG1Jk68MuX/a/7eV1Y1LfFylynQjnVlBYN5bSVjph
         Z/pc5hci8tj43fIHBpVrQElj76JG27iSNbnYPNWRhx+JD7A6kl4S7d0Nb9HuOLPHZ2cq
         uF3JdyenydMvDxbKUzfYaB04b/Tk4LoL6ISYCJEiPVWn/kDMML99lG6U8YhKE8DgBEFK
         v6/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2FbHC+AouLeCTX4lljlFzinGOTMD7NXf67uVcoKnZkY=;
        fh=bSxFNkjjZb/dXYHdPKWcdLjmtn9VOI8XE33PQ/rmAeo=;
        b=nR/I+egFXqIjDOlmCeDxEQYr5DdGYagJ2292THISCpBDHvIsDUHpR19MU+M/CO5rgg
         9s6ppmtdiL8ur4HQKVJR4bv+eBoMEz6a7ktdDHFXmBk0y13tOiTYCvN0OeViyoVGuFML
         xlxkdjkLr07eBly22Iupg6OJkLtglUH35S/7IhYOIi0/+4HNIM0otPDDccKPMtGngLZG
         i4sSu1h7EvMlfHwZ5WsqcNFum+2He0vKW9V2AjCyhn2qiUNSOx2NMM23g42YbV12NXps
         NABizAExRqtg7kyalXaL8G2aFnql03Prz0fdTDIp8v5Blzdia5y3q1KQS2WluIVL07yu
         NAdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794859534; x=1795464334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2FbHC+AouLeCTX4lljlFzinGOTMD7NXf67uVcoKnZkY=;
        b=IkksPml8E3hyTIxztKkLwWNm1VbUqDLEUUeOgZbiZlOAbOPlMK+i6fRCs/pkslK+S0
         AoQijbjLAoJdk6OzJ9w/HqLoOeJvtTmRW9cKaWBp2F2nidc/BrJsK8iVc2LaYj4dLWQr
         89u/N2AMvOoMfqct8NqjQv8AixlzjhSVovdYKDH6Yx5391GZwCD2FAADrLFSuE+rZObO
         c01IWug4iCdjZHswB2JK0S4kB9UXsoXVs/0c8hscDbY1L0C4xByQI0VthmXPN7kIcO1t
         4vRLVwCTnjp8BvaXwdPftIuUI3Qkrds0yKBicQ77EbgVdpbew7w9NmgeVp04fwmQTkVy
         Pybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859534; x=1795464334;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2FbHC+AouLeCTX4lljlFzinGOTMD7NXf67uVcoKnZkY=;
        b=PyIBr2UGV9WeIi/bmmM3PEa0fKgpThbXaFj/n/hVw3aqV2cdtT8bMJ2tw3EPwAfPzd
         9tmJ9nQBRy3e4qr13Z8oWthD0z6BX7lggyYZGCrKaGnTQDv6h9PwoQj8CsGY53uGXecP
         hRtAyQju7rMWwH5wOazRD7AdRzAzpUsxWybAXCZHRq6ezLKYvjTN8y2FonCp/HPiZqx2
         WJZNTnWmtFSeEVPzphuqd1JO6PRxuyfRjE92ab0imdRcjrZMdI1mecUcEXjgnEdCZoLe
         pLXJ89qvv4vZSlIGew+xWqFnEvEJrqaT/AWZmNK05PIMt2kBn7CuHCEtoLAmaXQ8qDDM
         Ruiw==
X-Forwarded-Encrypted: i=1; AL+hErGrmxAIxwzC/JisdMx9ziuXDIGHQ/ng3fu/PvswXMGk17l9cCCwHTQvVLvF41Y3VcGQEowqdZL7/rU4jj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DhhlaeSJ897EJsK9VPbO3YyXd9pAQwy9yc+7GCXJyynoRk3qo
	p1kFWl/RjSGWSfKQkG4MEEN7xl786jXgi/qk5jHR73qqGPjd0jgdWG410NtCDzDeDwANq/Vhe/I
	3vsUin958S4KDxBSaA8Aj4V5rcUQf96ecSbBDtdmj
X-Gm-Gg: AYBFou0WAkE/eXqIqZpgd2ax+q7Lazym9QlXW69UyTOBkQ3xLHzJ7QOXkyw41xpY/IX
	8djWGytDXHLwUb+vfJmf8dKKZjkrHaU786eK4nO+tkejuBehfOoQIPChxB0ksISd0D731isoNj/
	vWUMqRhCzoDeq7+E6j00Cp7CuXmz3qbGcMm1+KZBQDXWYUMLvagA1Gui9CBwnFOmrOhAk3Sw/Gj
	HQK2l2IauCQ9qe/JgLkSswsl/p3V8Y37OVmAzzCdcK6Sqb6oWXrqId5A8E2sdk2eWywGapKJNeW
	qzMzyy8hd2JOA6lcOzzgwWglHdz/7EOt89AhUaPlDVzdJ4fIQqEMvaWINIhZjIDwRF4xVwU1xy0
	eKk58SypxXXXMniMLNbuaaBxPVLGBekae3i8=
X-Received: by 2002:a05:6402:c51b:10b0:6b7:91a7:a637 with SMTP id
 4fb4d7f45d1cf-6b85b54dacbmr11086a12.6.1794859533949; Mon, 16 Nov 2026
 12:05:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115004003.3695475-1-almasrymina@google.com>
 <20261115004003.3695475-3-almasrymina@google.com> <avtRYLif2GvfuAmu@devvm16445.scu0.facebook.com>
In-Reply-To: <avtRYLif2GvfuAmu@devvm16445.scu0.facebook.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 16 Nov 2026 12:05:22 -0800
X-Gm-Features: AclHuK9UKGjj2K-M9UCbTvhamuiZBM47PX_Z2xi10nURBXzwNATp7PsG82osGLU
Message-ID: <CAHS8izN4eCMub+douN8P29KstidvsxVmpvDKhjZ4JDH9yXAJ9w@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] net: prevent mixing frags from different
 memory providers or bindings
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Pavel Begunkov <asml.silence@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:05=E2=80=AFAM Stanislav Fomichev
<sdf.kernel@gmail.com> wrote:
>
> On 11/15, Mina Almasry wrote:
> > Prevent coalescing, shifting, or appending skb fragments from
> > incompatible memory providers or different devmem bindings.
> >
> > Add skb_net_iov_provider(), skb_mem_provider_compat(), and
> > skb_frags_can_coalesce() to check readability and fragment provider
> > compatibility (net_iov_owner(niov) for devmem, niov->desc.pp for other
> > net_iov providers such as io_uring zcrx, and NULL for page-backed skbs)
> > across skb_try_coalesce(), skb_shift(), skb_gro_receive(),
> > skb_gro_receive_list(), tcp_skb_can_collapse(), and
> > tcp_skb_can_collapse_rx().
> >
> > Also add net_devmem_skb_binding() and use it in tcp_sendmsg_locked(),
> > zerocopy_fill_skb_from_devmem(), and validate_xmit_unreadable_skb() so
> > TX skbs cannot mix different devmem bindings or transmit non-devmem
> > unreadable frags on DMA TX devices. Reject converting linear head_frag
> > payloads into page frags on unreadable skbs in skb_try_coalesce() and
> > skb_gro_receive(), and propagate skb->unreadable and compare
> > skb_frag_netmem() in tcp_clone_payload().
> >
> > Update netmem_ref_test_net_iov and netmem_ref_test_try_coalesce so thei=
r
> > target skbs carry a compatible unreadable net_iov frag before shifting
> > or coalescing.
> >
> > This issue was found by manual code inspection and LLM review; it was
> > not triggered in production. Verified with the net_core KUnit test
> > suite; not tested on real hardware.
> >
> > Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
> > Fixes: bd61848900bf ("net: devmem: Implement TX path")
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > ---
> >  include/linux/skbuff.h | 55 ++++++++++++++++++++++++++++++++++++++++++
> >  include/net/tcp.h      |  5 ++--
> >  net/core/datagram.c    |  4 +--
> >  net/core/dev.c         | 14 ++++-------
> >  net/core/devmem.h      | 22 +++++++++++++++++
> >  net/core/gro.c         | 16 ++++--------
> >  net/core/net_test.c    | 42 +++++++++++++++++++++++++++-----
> >  net/core/skbuff.c      | 24 +++++++-----------
> >  net/ipv4/tcp.c         |  3 ++-
> >  net/ipv4/tcp_output.c  |  4 ++-
> >  10 files changed, 142 insertions(+), 47 deletions(-)
> >
> > diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> > index 1d6832878930..867e3ab17c17 100644
> > --- a/include/linux/skbuff.h
> > +++ b/include/linux/skbuff.h
> > @@ -3770,6 +3770,61 @@ static inline void *skb_frag_address(const skb_f=
rag_t *frag)
> >       return page_address(skb_frag_page(frag)) + skb_frag_off(frag);
> >  }
> >
> > +/* Return an opaque pointer identifying the memory provider instance o=
f @skb's
> > + * net_iov fragments:
> > + * - For devmem (NET_IOV_DMABUF), net_iov_owner(niov) (&binding->area,=
 1:1 with
> > + *   the binding across RX queues and TX).
> > + * - For other net_iov providers (e.g., io_uring zcrx), niov->desc.pp =
(shared
> > + *   across all areas of an io_zcrx_ifq).
> > + */
> > +static inline void *skb_net_iov_provider(const struct sk_buff *skb)
> > +{
> > +     struct net_iov *niov;
> > +
> > +     if (skb_frags_readable(skb) || !skb_shinfo(skb)->nr_frags)
> > +             return NULL;
> > +
> > +     niov =3D skb_frag_net_iov(&skb_shinfo(skb)->frags[0]);
> > +     if (!niov)
> > +             return NULL;
> > +
> > +     if (net_is_devmem_iov(niov))
> > +             return net_iov_owner(niov);
> > +
> > +     return niov->desc.pp;
> > +}
> > +
> > +/* Return true if the memory providers of @skb1 and @skb2 are compatib=
le
> > + * for coalescing. For any struct page-backed provider (the buddy allo=
cator
> > + * or a future provider handing out struct pages), coalescing is assum=
ed
> > + * feasible. For net_iov-backed providers, the provider instance point=
er
> > + * must match.
> > + */
> > +static inline bool skb_mem_provider_compat(const struct sk_buff *skb1,
> > +                                        const struct sk_buff *skb2)
> > +{
> > +     /* Check skb_frags_readable() first to reject readable/unreadable
> > +      * mismatches and avoid chasing frags[0] and struct net_iov when
> > +      * only one skb has unreadable frags.
> > +      */
> > +     if (skb_frags_readable(skb1) !=3D skb_frags_readable(skb2))
> > +             return false;
> > +
> > +     return skb_net_iov_provider(skb1) =3D=3D skb_net_iov_provider(skb=
2);
> > +}
> > +
> > +static inline bool skb_frags_can_coalesce(struct sk_buff *to,
> > +                                       struct sk_buff *from)
> > +{
> > +     if (to->pp_recycle !=3D from->pp_recycle)
> > +             return false;
> > +
> > +     if (skb_zcopy(to) || skb_zcopy(from))
> > +             return false;
> > +
> > +     return skb_mem_provider_compat(to, from);
> > +}
> > +
> >  /**
> >   * skb_frag_address_safe - gets the address of the data contained in a=
 paged fragment
> >   * @frag: the paged fragment buffer
> > diff --git a/include/net/tcp.h b/include/net/tcp.h
> > index 25d11fab1b03..bf5f28e52fca 100644
> > --- a/include/net/tcp.h
> > +++ b/include/net/tcp.h
> > @@ -1275,14 +1275,15 @@ static inline bool tcp_skb_can_collapse(const s=
truct sk_buff *to,
> >                     mptcp_skb_can_collapse(to, from) &&
> >                     !skb_cmp_decrypted(to, from) &&
> >                     skb_pure_zcopy_same(to, from) &&
> > -                   skb_frags_readable(to) =3D=3D skb_frags_readable(fr=
om));
> > +                   skb_mem_provider_compat(to, from));
> >  }
> >
> >  static inline bool tcp_skb_can_collapse_rx(const struct sk_buff *to,
> >                                          const struct sk_buff *from)
> >  {
> >       return likely(mptcp_skb_can_collapse(to, from) &&
> > -                   !skb_cmp_decrypted(to, from));
> > +                   !skb_cmp_decrypted(to, from) &&
> > +                   skb_mem_provider_compat(to, from));
> >  }
> >
> >  /* Events passed to congestion control interface */
> > diff --git a/net/core/datagram.c b/net/core/datagram.c
> > index ecc30a6f8302..88cc0a6c62f6 100644
> > --- a/net/core/datagram.c
> > +++ b/net/core/datagram.c
> > @@ -712,8 +712,8 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, =
struct iov_iter *from,
> >       size_t virt_addr, size, off;
> >       struct net_iov *niov;
> >
> > -     if (i && skb_frags_readable(skb))
> > -             return -EFAULT;
> > +     if (i && net_devmem_skb_binding(skb) !=3D binding)
> > +             return -EMSGSIZE;
> >
> >       /* Devmem filling works by taking an IOVEC from the user where th=
e
> >        * iov_addrs are interpreted as an offset in bytes into the dma-b=
uf to
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index a230ecce9327..51f5e4800eee 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
>
> [..]
>
> > @@ -4175,8 +4175,7 @@ static struct sk_buff *sk_validate_xmit_skb(struc=
t sk_buff *skb,
> >  static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *sk=
b,
> >                                                   struct net_device *de=
v)
> >  {
> > -     struct skb_shared_info *shinfo;
> > -     struct net_iov *niov;
> > +     struct net_devmem_dmabuf_binding *binding;
> >
> >       if (likely(skb_frags_readable(skb) ||
> >                  dev->netmem_tx =3D=3D NETMEM_TX_NO_DMA))
> > @@ -4185,14 +4184,11 @@ static struct sk_buff *validate_xmit_unreadable=
_skb(struct sk_buff *skb,
> >       if (dev->netmem_tx =3D=3D NETMEM_TX_NONE)
> >               goto out_free;
> >
> > -     shinfo =3D skb_shinfo(skb);
> > -
> >       /* All net_iovs in an unreadable skb share the same binding. */
> > -     if (shinfo->nr_frags > 0) {
> > -             niov =3D netmem_to_net_iov(skb_frag_netmem(&shinfo->frags=
[0]));
> > -             if (net_is_devmem_iov(niov) &&
> > -                 (net_devmem_iov_binding(niov)->direction !=3D DMA_TO_=
DEVICE ||
> > -                  READ_ONCE(net_devmem_iov_binding(niov)->dev) !=3D de=
v))
> > +     if (skb_shinfo(skb)->nr_frags > 0) {
> > +             binding =3D net_devmem_skb_binding(skb);
> > +             if (!binding || binding->direction !=3D DMA_TO_DEVICE ||
> > +                 READ_ONCE(binding->dev) !=3D dev)
> >                       goto out_free;
> >       }
> >
>
> Should we limit this patch to the real fixes only? This part does
> not look essential. validate_xmit_unreadable_skb already does skb_frags_r=
eadable
> check above, it already does nr_frags > 0 check here...
> so why go through the same stuff again via net_devmem_skb_binding?
>

So this is a real fix actually, although I agree it's kinda clobbered
into a patch with an unrelated fix. The existing checks do not catch
io_uring zcrx RX packets that have been received and the stack is
trying to forward them over a netdev where the memory is not mapped,
and this patch fixes that.

> If you want, maybe move this to a separate patch at least? And do
> something like:
>
> binding =3D net_devmem_skb_binding(skb);
> /* I hope likely() below properly unwraps net_devmem_skb_binding similar
>  * to existing likely(skb_frags_readable) case... */
> if (likely(!binding)) goto out;
> if (dev->netmem_tx =3D=3D NETMEM_TX_NO_DMA) goto out;
> if (dev->netmem_tx =3D=3D NETMEM_TX_NONE) goto out_free;
> if (READ_ONCE(binding->dev) !=3D dev) goto out_free;
> return skb;
>
> And call it cleanup with no fixes tags.

I could break it into a separate patch and reduce some of the
duplicated checks, but it's still a fix. It may be good as-is once you
realize it's a necessary change?

--
Thanks,
Mina
