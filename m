Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772505;
	b=1qUjyxiVK6GdQQTOEOi8EP2vxHgzWVCwi4wUwK1/onSiWIqx7VUXj9hp0y/Gnz4I12wt
	 ojqWMmy7lMfPOU1Li4sGs+iteU10ZEmTR0qoHH20X0ZI4VwlQEwFJwgCsiqbDDLLCSZhm
	 SgdP42cpEp0o7EVSDF0twbOHTCZl9jKgUumUTEet+xf/SWLgujGqud9WnBA5dhc7wI4RK
	 puKppPSmiKBpZ+SDKFeLsTim9SUyvl4SSGpzqd/W3HnFLDzHlmjTQGuucTtIeyu8Cau/A
	 9eScIDFXqRRtJxNHYKQLbQqJHG7wQDTor0Ntcp2ESdAQudUz87HRvxpLAD/2Bmac5UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772505;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Tf5fTI11AZRTr+M5HKlJWhT3pOd4N99OrUGmhNOVbAY=;
	b=pUXnMsW2PWGr6za4i8B04c7t+8PBkcqZ9NBQis87qFcMMRNg0yyeCw5A5y8uxrsC09El
	 JkeSKtGndzjWlQXpQU3Gjr6eVCHH3mYXAqhBr+iRRBh7dPUNCAflMuLCcJRRluQ43d86A
	 AgXu457kDIVzvdWULXYDaHWa2KQzmaLOrwHzKNtPTyTf9iVXo+Duqobc3vshHgo1wm0G4
	 bb6JDda9E2ALWUlzF3l6TbvJAk8jY1FBhfwtjxJHQ9ZaJdg9uLrxhXywMFiS+cnb8dIUx
	 FFYXNsblvHYBX941pJCDUDPugpUfLPd3RiTNKmXibBwLeg8PJHj5Mu1dOGVX2aO85Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DUcydec6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CF3606A331
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DUcydec6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEF21F031E3
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792772505;
	bh=Tf5fTI11AZRTr+M5HKlJWhT3pOd4N99OrUGmhNOVbAY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DUcydec62e9Z3jYUjIG4gFSufzUGRWqeEbIBnl2OBWtlHo4cE25QZRLSrghtxwbUq
	 ROri1zrQJJLSuqyshoaW/qaXbVwFsuwVnWgPDo2kJBEnv6FQ4O0+VEq5miAbhWWVlF
	 a0rYju/WX5RpPu/qRA6CmEfJ+GRIjYGCygm3KLTEb4Mq7V2yung9VbrJ03Jn4TEns9
	 UHWJ0h61b3520cv9t82YjXbHHbnL5AcJ9mmf/mFvSnDPuBCH170sxdN4lBhFBqLs4X
	 1qqIRK0jYVDl85ttFrwjDScLAGOniple+HaFhRpvluFXPri/gfbtD1vs0KdhhBzGV1
	 YchQMHbNBTuMw==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4a75171af39so399704fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:21:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzaMHxBumEqAfwtAG9bI1L1YPS7f9ymfJ+bPN+HZl3Apz/V5rkrOsbHgavaMZNsGKY1cljrRzByK65WLzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdWjA6c804yNE2piwFVZ43m/fKeU5s3qpbhOXdMtFRlBy6U+VO
	9Ro4HA3JwLM1LgyL3ter3iYbYYnsNmjPR7oA7vFRWjml5KVLd5eENK+u6m09uQMVmJARl0iQvOV
	KID0YFuYqFbAmRVw/6UUhuVjKpt4ZqFA=
X-Received: by 2002:a05:6871:79d:b0:48f:e24e:6b6a with SMTP id
 586e51a60fabf-4a8224ea80fmr1602443fac.61.1792772504596; Fri, 23 Oct 2026
 09:21:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023074515.2347924-2-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20261023074515.2347924-2-Jeremy.Jean@oss.cyber.gouv.fr>
From: Eric Dumazet <edumazet@kernel.org>
Date: Fri, 23 Oct 2026 18:21:33 +0200
X-Gmail-Original-Message-ID: <CAL4WiioOu48M55PUHNJY3B-e_PJVqc0BZYWmgpkDpFj=bz_5_Q@mail.gmail.com>
X-Gm-Features: AclHuK9JCAxJ-YMpRHctjjSF-nP7EZBfB7migQ3rYOkVPPQdYDjvEVAI0GVA6K0
Message-ID: <CAL4WiioOu48M55PUHNJY3B-e_PJVqc0BZYWmgpkDpFj=bz_5_Q@mail.gmail.com>
Subject: Re: [PATCH net] inet: frags: prevent acceptance of partially
 authenticated reassembly
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 23 oct. 2026 =C3=A0 09:45, J=C3=A9r=C3=A9my Jean
<Jeremy.Jean@oss.cyber.gouv.fr> a =C3=A9crit :
>
> A reassembled skb retains the secpath from its first fragment, which
> makes it possible for the final policy check to accept bytes that were
> not covered by the transform recorded on the skb. This can affect IPsec
> tunnel traffic, including AH and ESP, and allow a packet to be accepted
> even though only part of its payload was authenticated.
>
> Reject a fragment when its secpath differs from the fragments already
> in the queue, and keep overlap statistics limited to actual overlaps.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> ---
>  include/net/inet_frag.h  |  1 +
>  include/net/xfrm.h       | 17 +++++++++++++++++
>  net/ipv4/inet_fragment.c |  5 +++++
>  net/ipv4/ip_fragment.c   |  3 ++-
>  net/ipv6/reassembly.c    |  3 ++-
>  5 files changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/include/net/inet_frag.h b/include/net/inet_frag.h
> index 365925c9d2628..b02d2472b003e 100644
> --- a/include/net/inet_frag.h
> +++ b/include/net/inet_frag.h
> @@ -171,6 +171,7 @@ extern const u8 ip_frag_ecn_table[16];
>  #define IPFRAG_OK      0
>  #define IPFRAG_DUP     1
>  #define IPFRAG_OVERLAP 2
> +#define IPFRAG_MIXED_SECPATH   3
>  int inet_frag_queue_insert(struct inet_frag_queue *q, struct sk_buff *sk=
b,
>                            int offset, int end);
>  void *inet_frag_reasm_prepare(struct inet_frag_queue *q, struct sk_buff =
*skb,
> diff --git a/include/net/xfrm.h b/include/net/xfrm.h
> index a6d69aaa6cd2d..493faac0faa45 100644
> --- a/include/net/xfrm.h
> +++ b/include/net/xfrm.h
> @@ -1201,6 +1201,23 @@ secpath_reset(struct sk_buff *skb)
>  #endif
>  }
>
> +static inline bool
> +secpath_equal(const struct sk_buff *skb1, const struct sk_buff *skb2)
> +{
> +       const struct sec_path *sp1 =3D skb_sec_path(skb1);
> +       const struct sec_path *sp2 =3D skb_sec_path(skb2);
> +       int i;
> +
> +       if (!sp1 || !sp2)
> +               return sp1 =3D=3D sp2;
> +       if (sp1->len !=3D sp2->len || sp1->verified_cnt !=3D sp2->verifie=
d_cnt)
> +               return false;

verified_cnt is policy check bookkeeping (written by
__xfrm_policy_check()), it says nothing about which states
authenticated the payload. I would only compare len and xvec[].

With the verified_cnt part removed:

Reviewed-by: Eric Dumazet <edumazet@kernel.org>



> +       for (i =3D 0; i < sp1->len; i++)
> +               if (sp1->xvec[i] !=3D sp2->xvec[i])
> +                       return false;
> +       return true;
> +}
> +
>  static inline int
>  xfrm_addr_any(const xfrm_address_t *addr, unsigned short family)
>  {
> diff --git a/net/ipv4/inet_fragment.c b/net/ipv4/inet_fragment.c
> index b286ee429da8f..c18da91c1f031 100644
> --- a/net/ipv4/inet_fragment.c
> +++ b/net/ipv4/inet_fragment.c
> @@ -23,6 +23,7 @@
>  #include <net/inet_ecn.h>
>  #include <net/ip.h>
>  #include <net/ipv6.h>
> +#include <net/xfrm.h>
>
>  /* Use skb->cb to track consecutive/adjacent fragments coming at
>   * the end of the queue. Nodes in the rb-tree queue will
> @@ -441,6 +442,10 @@ int inet_frag_queue_insert(struct inet_frag_queue *q=
, struct sk_buff *skb,
>  {
>         struct sk_buff *last =3D q->fragments_tail;
>
> +       /* The reassembled skb keeps the first fragment's secpath. */
> +       if (last && !secpath_equal(last, skb))
> +               return IPFRAG_MIXED_SECPATH;
> +
>         /* An IP fragment is never a GSO packet, but an untrusted source
>          * (virtio_net_hdr) may have attached GSO metadata to it. Do not =
let
>          * that reach the reassembled skb, whose head keeps the first
> diff --git a/net/ipv4/ip_fragment.c b/net/ipv4/ip_fragment.c
> index c790d2f494870..36105dd192823 100644
> --- a/net/ipv4/ip_fragment.c
> +++ b/net/ipv4/ip_fragment.c
> @@ -378,8 +378,9 @@ static int ip_frag_queue(struct ipq *qp, struct sk_bu=
ff *skb, int *refs)
>                 err =3D -EINVAL;
>                 goto err;
>         }
> +       if (err =3D=3D IPFRAG_OVERLAP)
> +               __IP_INC_STATS(net, IPSTATS_MIB_REASM_OVERLAPS);
>         err =3D -EINVAL;
> -       __IP_INC_STATS(net, IPSTATS_MIB_REASM_OVERLAPS);
>  discard_qp:
>         inet_frag_kill(&qp->q, refs);
>         __IP_INC_STATS(net, IPSTATS_MIB_REASMFAILS);
> diff --git a/net/ipv6/reassembly.c b/net/ipv6/reassembly.c
> index 05c51f669754a..53a685f5c6b7f 100644
> --- a/net/ipv6/reassembly.c
> +++ b/net/ipv6/reassembly.c
> @@ -240,8 +240,9 @@ static int ip6_frag_queue(struct net *net,
>                 err =3D -EINVAL;
>                 goto err;
>         }
> +       if (err =3D=3D IPFRAG_OVERLAP)
> +               __IP6_INC_STATS(net, idev, IPSTATS_MIB_REASM_OVERLAPS);
>         err =3D -EINVAL;
> -       __IP6_INC_STATS(net, idev, IPSTATS_MIB_REASM_OVERLAPS);
>  discard_fq:
>         inet_frag_kill(&fq->q, refs);
>         __IP6_INC_STATS(net, idev, IPSTATS_MIB_REASMFAILS);
> --
> 2.47.3
>
