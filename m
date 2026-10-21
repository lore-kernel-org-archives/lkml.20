Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605354;
	b=Zbg+ZkCyi/4+im1ZT4yHFRvzF3XClDABWu01hpCEb8bvjV/8uVLvzyp7C4vaU0XHXv5f
	 0V7RGv1d636RM5d/d6ChZ4OLvKmaLKlvkBDpEzxHrNEGjONRa+NKNAzqBFhXVt8D3lqbH
	 89c3gKbPW6gt2U8UGiLkuN1E5XN1l0+qjFcGOmNQJuIa7MvvtshevIYrq9bDD4ZxgNZwg
	 +Rx1EZaIF8WDlA9tWuvVZaPnNWFWfn46iMDT2jqokD2Rh1wrrN9saJACmXLp6x9an1jIA
	 5/aflaRcUKa5LdxNmJX+4+NJeczRjL9I39x25G48en6tBBqR3tY41Ihf18YRHm9/ggg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605354;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GX7t2+rzhC36CUFljRoCQC6FXVLVHmjq/gaYHLsA5tY=;
	b=LuOW7RW94i1wj/Bpi7C+FirNJxuH6sUPLQNrsuZuwSH8uIRhSg+EpVv+tGHgtnCMvfDd
	 b2+agwapomC89yWEjlCd5a2K5M3qi9Z2BQdht9wmcpBgx6cWYjDT9a1V3a1llqRgM9W4c
	 /bHv9lQSxHqcqsdWJuoVizahlQitbgu1pfw6WOSHQRUyuKI8PUKx928vBmnUH84K+7Dq8
	 4ty9+nwYboi5LjemyppjgApZLufWYMWtGaLU5/IxnFZey0Wlg3O6I3xtaBiDMjcMNeclS
	 S3ujklZj8aNVz5rQkWqZi4TRPbn6xte84+8zZW2V3JEW7TzbI9RDTGCWM9mVIhSSpNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GZbOALAr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1E8606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GZbOALAr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCBF1F000C7
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792605353;
	bh=GX7t2+rzhC36CUFljRoCQC6FXVLVHmjq/gaYHLsA5tY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GZbOALArO+E73lqVEGZdu0mugIdOedXGxIsqd2gdWg10F1/jdv5fE+vcyl7DZFdvD
	 lY4PJDXyTdd4OU5IaLND6ZoLKvvUkFh4fNPp5f3u/CfOIzJwdck7McSvgQ6e6qTOdg
	 oLAU92+/j9QqK/1/EWpc3ObypsJB5j0/LjYHIkcBQMn7WcE+Xh7VRkCuw7k/wru0BJ
	 ORciyG1YXX4LDfsNhh6MblZ6w7Yaz+5ZLprSNyc7/v1jWR+gsmBJyRX02pKK7ZqmGZ
	 uyWmd0uE5kdTkr51q2ZQQ8uBwl/66F04gpIqBVezCdEyS7gKk2zx3fI5JD7dmAbzAt
	 51vVgUpmLe+Uw==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-48ed188ee81so558642fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:55:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy6DRJUkcrO/TqvhZRQiTnW3x+nq69nKVvThDfIL/3rXnpxGYM0z+faO+gaoO/wSxEsaXvvxgTkYw8UoRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6ouzrOqnwUePbtB6uyUA/ZZXPF4pc1CvjJJuTkLW0GSaQ9v8f
	nCNL6WooTjSRS43L1saEhEFuyr5W2CSWQIiwF7CZNC4AKV7O3ozS4ZEb8R2S52PbJyfPHTcMxpY
	QD23lakZcLw818Xl4Ou7DyqNYuWMeFmo=
X-Received: by 2002:a05:6871:4045:b0:494:7d13:7a5c with SMTP id
 586e51a60fabf-4a7dc1b092emr1616137fac.30.1792605352760; Wed, 21 Oct 2026
 10:55:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021023608.55867-1-qingfang.deng@linux.dev>
 <179255036282.3290.8488375760281728576@kernel.org> <c0f348bf-0e13-4cb1-8014-cd9b7787bfe6@linux.dev>
 <CAL4WiirRPnbSBgcoh8Aiq8zGVzsy34w9uaqAgSKQwpgJ0ht7aA@mail.gmail.com>
 <315a8794-db40-4d0f-9e4c-0cad66174bff@linux.dev> <CAL4WiiouaJ5QU24uKt=CuxpfgHmWHS5oxoE2E_C6KFCLbDh0+w@mail.gmail.com>
 <51ccddcc-53b0-47cd-9526-ccd825f0f6d9@linux.dev>
In-Reply-To: <51ccddcc-53b0-47cd-9526-ccd825f0f6d9@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 21 Oct 2026 19:55:40 +0200
X-Gmail-Original-Message-ID: <CAL4Wiip2F59XO3BrjUHVrFqYMuD-LxNmZXhtftkV-JG0Ya84Yg@mail.gmail.com>
X-Gm-Features: AclHuK-8olJtlfn_X0E97Dd5-TyqwSFatGSZBBSxpWG1Y-iSJJgCbCPIvp7Vs8A
Message-ID: <CAL4Wiip2F59XO3BrjUHVrFqYMuD-LxNmZXhtftkV-JG0Ya84Yg@mail.gmail.com>
Subject: Re: [PATCH net] ppp: linearize bridged packets when required
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: netdev-bot+sinfo@kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Breno Leitao <leitao@debian.org>, Kees Cook <kees@kernel.org>, Taegu Ha <hataegu0826@gmail.com>, 
	Tom Parkin <tparkin@katalix.com>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, James Chapman <jchapman@katalix.com>, 
	Sashiko <sashiko-bot@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	Pablo Neira Ayuso <pablo@netfilter.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 21 oct. 2026 =C3=A0 19:04, Qingfang Deng <qingfang.deng@linux.dev> =
a =C3=A9crit :
>
> On 10/22/2026 12:31 AM, Eric Dumazet wrote:
> > Le mer. 21 oct. 2026 =C3=A0 12:27, Qingfang Deng <qingfang.deng@linux.d=
ev> a =C3=A9crit :
> >>> +       case PPP_IP:
> >>> +               skb->protocol =3D htons(ETH_P_IP);
> >>> +               break;
> >>> +       case PPP_IPV6:
> >>> +               skb->protocol =3D htons(ETH_P_IPV6);
> >>> +               break;
> >>> +       default:
> >>> +               goto drop;
> >>> +       }
> >>> +       skb_set_network_header(skb, PPP_PROTO_LEN);
> >>> +
> >>> +       segs =3D skb_gso_segment(skb, 0);
> >>
> >> Passing zero features to skb_gso_segment will linearize every segment
> >> prematurely.
> >
> > Good point, PPTP and L2TP do not need linear packets.
> > I will pass NETIF_F_SG: checksums are still computed in software by
> > skb_segment(), as openvswitch does, and ppp_bridge_xmit() linearizes
> > segments only for channels without direct_xmit.
>
> What about NETIF_F_FRAGLIST?

I do not see your point. Can you elaborate?

There=E2=80=99s also nothing left to gain on fraglist packets.

SKB_GSO_FRAGLIST packets already go through skb_segment_list(),
which just unchains the original skbs without copying, as the fraglist
test run showed.

Frag_list skbs that aren=E2=80=99t fraglist GRO go through skb_segment(),
which with NETIF_F_SG already shares the pages of the chained skbs
instead of copying them.
