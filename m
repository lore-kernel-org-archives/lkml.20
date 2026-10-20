Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508936;
	b=ufc5UPkuP/7C4vzrLLHzQeNsQEmPXaPcU71+CPj+pyEzskLqqxs9/j4gk+NiJ2fxOLu/
	 qFnqba2F/YqzCQ5lLrXb8JkLca4M3zvKaUVdtUFpmvUO3gQW8p7+xuiNg0G6rDLaGd5ND
	 vXQ8IWk2V+lZ4qHP6tDqwomAFEK/07+4g2iT/Eh/X4OhulS0ZTvfvmfULbFf1EZp2O835
	 efEOVU/sUFrg+hm6VatZLeRBvw+L7yc0JXk1Z48qE4gSnWEVFQ7N2NC+UWd+Q5N3y/Eg7
	 A3VmDzZvKyV9iagVUE7cCbRybxOUotpSE+1z9UQ/Sdz3Cc7LxD9d0v4w11yXRycB2pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508936;
	h=Received:Received:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=x/LDu3V5q69aJnMnC8UTw2DlNI1htl3YHUpx31QNhLA=;
	b=5LboER5H90d/XnPvFb4/ZK7L0c/rJ18/NNnjSmSuEnWiJfg8rm00nk+V1W3mUHl3QSAd
	 d+E+PsMibaqFtn4PvLfY9sT0zJKS4Y4KsUAE/npzovljbs7A9IxFR7i9JWwR04YYZwK4Q
	 g7XCnA8MyTiDkyO/A+CXOUK58e052fnIaLWFRqBH2Y5OQ1y6pJanCdkICSEe+ZF/RRqbm
	 1YMLJnTiW1R4CzAL6kBpMay6+Q+/CP2tEEPTxptJ2WtHjFpTKBkqog+5ceB486Ip/LiVv
	 FBLizYtjEw6XVnV4cM0tSv5tkj86WzmZVGu/JyB6Ya8/IoNnYWDN/gwkq4ql7G+PzQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE0E606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3531F000C8
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:08:56 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-483d290f398so1712354fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:08:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwmi5l/vkK+s36aVsHIZyu5dXXDhE2MmlzFRVZB39CwM8qFOfQgAJRt8dY7mXds08YI6lnkbSMtFWYVkZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwNxmQnUhxdon+z8mjPy/77ta+1nhQQxbklHxwEWhVe0ft/pCK
	MK7KSrMrzFiMyCMeRMc6D7g+3ho+R9dZxb8kGgfUaPaY+TGQ/c2MqvI7W7TaWS9ZlEt+oYv4a71
	uPuVTL3Uokoon0cJEMXjr1v0ojsElEnM=
X-Received: by 2002:a05:6871:878e:b0:4a7:233d:6b8f with SMTP id
 586e51a60fabf-4a7579aece6mr9724160fac.36.1792508905251; Tue, 20 Oct 2026
 08:08:25 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020143031.1829-1-qingfang.deng@linux.dev>
In-Reply-To: <20261020143031.1829-1-qingfang.deng@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 20 Oct 2026 17:08:14 +0200
X-Gmail-Original-Message-ID: <CAL4Wiiptz1zyxRDKrCrnK2Q-qn0_1d1aSxuUPkJKWnODpjMp1g@mail.gmail.com>
X-Gm-Features: AclHuK8hTXIraLSjqiX-ygtYNxZi_7BJWAcAxLMq2zWJ_IkOfRwEoETe4HBpDSw
Message-ID: <CAL4Wiiptz1zyxRDKrCrnK2Q-qn0_1d1aSxuUPkJKWnODpjMp1g@mail.gmail.com>
Subject: Re: [RFC net] net: force software segmentation of PPPoE packets
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Stanislav Fomichev <sdf.kernel@gmail.com>, 
	Hangbin Liu <liuhangbin@gmail.com>, Martin Karsten <mkarsten@uwaterloo.ca>, 
	Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pablo Neira Ayuso <pablo@netfilter.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 20 oct. 2026 =C3=A0 16:30, Qingfang Deng <qingfang.deng@linux.dev> =
a =C3=A9crit :
>
> Ordinary TSO does not update the PPPoE payload length. A PPPoE GRO packet
> forwarded by a bridge can retain hardware GSO features and reach the
> driver without software segmentation, if the egress Ethernet interface
> advertises TSO.
>
> To force software segmentation, clear the GSO feature mask for
> ETH_P_PPP_SES in harmonize_features().
>
> Fixes: 55a5d8fca836 ("net: pppoe: implement GRO/GSO support")
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
>  net/core/dev.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/net/core/dev.c b/net/core/dev.c
> index a6951ea08961..27483a2ad747 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -3831,6 +3831,10 @@ static netdev_features_t harmonize_features(struct=
 sk_buff *skb,
>         type =3D skb_network_protocol(skb, NULL);
>         features =3D net_mpls_features(skb, features, type);
>
> +       /* Ordinary TSO does not update the PPPoE payload length. */
> +       if (IS_ENABLED(CONFIG_PPPOE) && type =3D=3D htons(ETH_P_PPP_SES))
> +               features &=3D ~NETIF_F_GSO_MASK;
> +
>         if (skb->ip_summed !=3D CHECKSUM_NONE &&
>             !can_checksum_protocol(features, type)) {
>                 features &=3D ~(NETIF_F_CSUM_MASK | NETIF_F_GSO_MASK);
> --
> 2.34.1
>

Ouch.

harmonize_features() is called for every packet, GSO or not.

This is a GSO-only problem, please do not add more protocol-specific
tests in this path. gso_features_check() is only called for GSO
packets, and the cost there is amortized over all segments.

Devices without NETIF_F_HW_CSUM already lose GSO for ETH_P_PPP_SES
because of the can_checksum_protocol() check in harmonize_features(),
and fraglist GRO packets (the main use case for PPPoE GRO) are
segmented in software anyway.

This leaves bridged, non fraglist GRO PPPoE packets sent to a
NETIF_F_HW_CSUM + TSO device. Have you hit this on real hardware?
