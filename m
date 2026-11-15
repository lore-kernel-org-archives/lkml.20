Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794730394;
	b=Se9+JrPBUSEs6Tlx1aPZ/gfKXXp+m0MfKKgge5RiLekVPgaXexP2hXaJ9iaMHS4GlHOo
	 w6Q0FyR/qyXYbuDtH6oEfBVo2ZaoRvD88dOVCBhDhy3VPIW5l9PVQQcNXxOeY+o5tviog
	 4QL6wUl9Rj8pZJstKIxY8ZI1g/iagywMWXM7lg8KkJ/ZVlfJUQgYRzUZgjSuirbE5EJkQ
	 HUCR9z3oQL4mGSB4e3TVQ3aBIArqk+Y2CWLoXMbXz2N0+03oRCswo6siR/zoYA0YF9h3x
	 0cQxNH+xKZu/C3h3TbXyhOW44ExfLHunT/gJHrq1/8hq6Dah7OAwCMav5DPgWwexFkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730394;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=58ohGE5HfnaaNE/R5vDAEDTMjYmQAZqLVv8WLaa6z3E=;
	b=bgqt2BSGmOvcdFIjdJjq5w8TpgYCnsKN+NK/xR1rgO6tn66S3J2ypCtO+1waQRPCY+Qx
	 62i3VUJGtUUnjOnLHaD0BHBoLj+Z4W9u3BwAlhWxMrf76922MwO4cefDKLPyhIU+8tCXN
	 ZCzS/YsaMQo41dq/M+ApSuTm6Hs6HbOkktydgcJOifvCu1YvryNRiLpqmFYUT0aesCokG
	 9IlaO3sQEKYA1q9EYqDhGBRpZt1QRbbVqK0vp50cbbNHZo9HI0Z7DDU9GExBrDj5Cd7xX
	 mXObHdvGfKbYarIbz85Ner3tdMONUh+GVHuQUIm3GYjSyF1UtvUQkQ7Hj/1ecmjsa3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DzqQvyQ/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E308606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DzqQvyQ/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40D11F000CC
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794730393;
	bh=58ohGE5HfnaaNE/R5vDAEDTMjYmQAZqLVv8WLaa6z3E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DzqQvyQ/Hu8aJ4p1/1KEMG9Wbg7/uW7Say+9jPsXdxeekBjs4LfuhRocRfXXZlE9H
	 nmp5nycB3b9rmEzhPwTmLc0P4zwaG9zAyKuKsSHCjNERKC277ZWpp94FDi9RVrHZEg
	 8bta/hKr4Yi7gEPTITB/MrFswobMoRs9uvyKIxCRmTKqs0jgX9hebW5gvuHEUOr2ZB
	 Tiq9Hk3/Jho5NblvnjWmABwFqezn3HTED/OraQ/SCoPxdsRXQmTzzLHoiSu/hxvMNE
	 HyXb1uGSZF5tlOYlYvO67aFz7oTlTudpiPqFYybUoOqFBQoRABP8rB8R4EY6NyNsIb
	 H+sRi0jN7iwig==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6df5e315bd1so2799053eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:13:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFpSTmN9HQJLswL11E6XpLTAADZxovMeo22ZxPlZ2cv8uUKm1g6Dh4Ke5o/ytPx9b/1W1/JDppmGa6AfKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kPcRgDVUYUVPoPTBdN/yb4PYxuQUO7BfI0NC59kbtK9P4Almc
	Dm1dbpgZ40WpmW4qARspqTL/wWiK2BBnMtsDk/nkhmub8jlygIPUK0/jt9uW/nYJTQ/fhdIaeZs
	++39zzZVG2E1Ou/F4aY2o/goBb48225g=
X-Received: by 2002:a05:6820:c0d4:10b0:6df:7bd3:21e1 with SMTP id
 006d021491bc7-71ab5253d8dmr3108400eaf.88.1794730392916; Sun, 15 Nov 2026
 00:13:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114161248.3428695-1-thaisonphan@google.com> <20261114161248.3428695-3-thaisonphan@google.com>
In-Reply-To: <20261114161248.3428695-3-thaisonphan@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sun, 15 Nov 2026 09:13:02 +0100
X-Gmail-Original-Message-ID: <CAL4Wiipd8pVX8Rxkof+29iSmfoAC5tytsOh0afnovEwaZ4NEjQ@mail.gmail.com>
X-Gm-Features: AclHuK9Ndm_aliyiHUcAgnslWco5EoHUob48WM_5Q4rHVDU5cunncq9BhLB1WPU
Message-ID: <CAL4Wiipd8pVX8Rxkof+29iSmfoAC5tytsOh0afnovEwaZ4NEjQ@mail.gmail.com>
Subject: Re: [PATCH net 2/2] tcp: accecn: initialize AccECN fields in
 syncookie path
To: Thaison Phan <thaisonphan@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ij@kernel.org>, 
	Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Simon Horman <horms@kernel.org>, 
	Stan Iliev <stani@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 14 nov. 2026 =C3=A0 17:13, Thaison Phan <thaisonphan@google.com> a =
=C3=A9crit :
>
> cookie_tcp_reqsk_alloc() and bpf_sk_assign_tcp_reqsk() allocate struct
> request_sock without __GFP_ZERO, leaving saw_accecn_opt,
> accecn_fail_mode, syn_ect_rcv, and syn_ect_snt uninitialized. When
> accecn_ok is negotiated in cookie_{v4,v6}_check(),
> tcp_ecn_openreq_child() reads all four fields to initialize the child
> socket's AccECN state.
>

Right.

> In addition, because the temporary request_sock used to send a cookie
> SYN-ACK is immediately freed, treq->syn_ect_snt is lost. If the listener
> marks ECT (e.g. DCTCP), leaving syn_ect_snt at 0 causes
> tcp_accecn_third_ack() to flag TCP_ACCECN_ACE_FAIL_RECV when the peer
> reflects ECT, disabling ECT for the rest of the connection.

This is a different bug than the uninitialized fields above, with
a different impact. I would prefer two patches, one per bug, but
since both Fixes: commits landed in the same release I will not
insist.

>
> Initialize the AccECN fields in cookie_tcp_reqsk_init() to match
> tcp_openreq_init(), and set syn_ect_snt from the listener's TOS/tclass
> in cookie_{v4,v6}_check() to match tcp_{v4,v6}_send_synack().
>
> Found by code inspection while auditing request_sock initialization in
> the syncookie path; reproduced without kernel modifications in a KASAN
> VM (tcp_syncookies=3D2, tcp_ecn=3D3) and tested against the reproducer an=
d
> packetdrill AccECN/syncookie selftests.

Same remark as for the LOOPBACK4_IPV6 patch: KASAN does not catch
uninitialized bitfields. Please say how the failure was observed
(KMSAN, tcpi_accecn_fail_mode in TCP_INFO on the child, ...).

>
> Fixes: 3cae34274c79 ("tcp: accecn: AccECN negotiation")
> Fixes: b40671b5ee58 ("tcp: accecn: AccECN option failure handling")
> Signed-off-by: Thaison Phan <thaisonphan@google.com>
> ---
>  net/ipv4/syncookies.c | 5 +++++
>  net/ipv6/syncookies.c | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/net/ipv4/syncookies.c b/net/ipv4/syncookies.c
> index 4e0ff3b82062..5747f9a5a6d1 100644
> --- a/net/ipv4/syncookies.c
> +++ b/net/ipv4/syncookies.c
> @@ -290,6 +290,10 @@ static int cookie_tcp_reqsk_init(struct sock *sk, st=
ruct sk_buff *skb,
>          */
>         treq->txhash =3D treq->snt_isn;
>         treq->syn_tos =3D TCP_SKB_CB(skb)->ip_dsfield;
> +       treq->saw_accecn_opt =3D TCP_ACCECN_OPT_NOT_SEEN;
> +       treq->accecn_fail_mode =3D 0;
> +       treq->syn_ect_rcv =3D 0;
> +       treq->syn_ect_snt =3D 0;

I think syn_ect_snt is always overwritten in cookie_{v4,v6}_check()
before being read, this line is not needed?

>
>  #if IS_ENABLED(CONFIG_MPTCP)
>         treq->is_mptcp =3D sk_is_mptcp(sk);
> @@ -502,6 +506,7 @@ struct sock *cookie_v4_check(struct sock *sk, struct =
sk_buff *skb)
>                 ireq->rcv_wscale =3D rcv_wscale;
>         ireq->ecn_ok &=3D cookie_ecn_ok(net, &rt->dst);
>         treq->accecn_ok =3D ireq->ecn_ok && cookie_accecn_ok(th);
> +       treq->syn_ect_snt =3D READ_ONCE(inet_sk(sk)->tos) & INET_ECN_MASK=
;
>
>         ret =3D tcp_get_cookie_sock(sk, skb, req, &rt->dst);
>         /* ip_queue_xmit() depends on our flow being setup
> diff --git a/net/ipv6/syncookies.c b/net/ipv6/syncookies.c
> index b33011b71fff..7435ebcc366c 100644
> --- a/net/ipv6/syncookies.c
> +++ b/net/ipv6/syncookies.c
> @@ -276,6 +276,7 @@ struct sock *cookie_v6_check(struct sock *sk, struct =
sk_buff *skb)
>                 ireq->rcv_wscale =3D rcv_wscale;
>         ireq->ecn_ok &=3D cookie_ecn_ok(net, dst);
>         tcp_rsk(req)->accecn_ok =3D ireq->ecn_ok && cookie_accecn_ok(th);
> +       tcp_rsk(req)->syn_ect_snt =3D READ_ONCE(np->tclass) & INET_ECN_MA=
SK;
>
>         ret =3D tcp_get_cookie_sock(sk, skb, req, dst);
>         if (!ret) {
> --
> 2.56.0.611.g1030f0b940-goog
>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thanks.
