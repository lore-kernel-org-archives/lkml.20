Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793344093;
	b=L95vhJSPObxidWcIa00jQahktVdGD8m5EeaFO8ayDmEztDq0LV4SG2Cs61BImx/Q30wD
	 bEm6STAXU/YrkoLm8eimthwea/3/zbtlDnYoI1zbzwASiUKl1JwQOWj3NthOzECUhW187
	 A3nHOXyJMjGdLLlFQEaBjF+3Qr2ihce8XH73IgsvMBlmNChORq+sKKRyWiWb5+T93eECl
	 Nu17DhXtOXoZIQZGEWJ+hZCOfZeAEBwTFFf1Ek1/MlK4hWO+Uo2Xl2Ikec7736pg5utUG
	 gr7QAR2Yc8s1/z/JKGLvWoCjCAFvurIfuHQ4pDm2tCyNoVbOX4d0xyShmhEplb2QbKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793344093;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mHQ5PY0q7ltLpy3AnqLRTF//Lss1FbxyLGYi3osAc88=;
	b=C62gVh0QHrW+8bYweouhOs29IpK8oBohT3Iylz76AL2WviWpMgkbrrkS9Fijwab1/NmX
	 QBPbN3wI6iHp6oVYv0KZnu9RGFwX3CRVvi1qApOwkAFEHe7dUg3UMZBoegYEqHdUr4jUj
	 qJkbCNRaLkMoEXwjOjTave+U8qMCbukUSexahL7UkR93Hp5orEd2ve1fabLeneRTZGTwR
	 xdqlcGT3cIhVC1u2DstoKG0tGlUja+MJkHvZokgtDEPtJeCtDAGsxWXlzOPBiY31h8Cuw
	 6Mu/SPN+SmP9KEZ79+NOhoje5hVqpArs5EdcVsmRl3qHJEdNoj9HAPM10PAWcXqXloQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ork93d1K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3916606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ork93d1K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875651F000C1
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793344092;
	bh=mHQ5PY0q7ltLpy3AnqLRTF//Lss1FbxyLGYi3osAc88=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ork93d1KCVTQe3TOUzBiEm2V1iEDkehNbT+JM8MCvkXcxQVRYegO+hEZFs2tWlpIq
	 yLDUS57PMybnUVs+Qf1DjmSmv0XJ/UJ0ZJXcT+PnLZKSA8pKi3mVvC+mOdHe8NCqSv
	 pGhASICcOraOSBySOMBwzIrvwKm4IgONSgmLKGpzeADmLbqiPfUGKzUWcLl3H18xYz
	 MWtccIF1k47q6QWf0vnK990jXIa/dbcmXFA+GEY6A3C5i90nMIgfZg6Fl7mIR7HCyl
	 ctdr0RpjSYUce0e8V0CsQpNllVdBi1Va1S0pFsVhJqz6BNpnH7FqYI61BOe4hL9chA
	 1M93IE/3/Lz+g==
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4b28d7c729fso225587b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:08:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx5D59aCl7dJMFMjsbQFynCiWc7Falajlt47q74l7rLwtuvqWZ67DcGIDu4/WOfWRV9KLNx821AAE2KPwQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKze4lUWcDIogN+voa7dpA7QemDrghOi/43fuVQRBzdDKKgOkJd
	5TNqiTiIf8LA1SMED6xIMjWPP/uBcGIQwrjmFGKoTCVBrIDLblK97VKWTJanzuszojRWnx4yhvg
	OsCn2Ua+EJZLE03MACit8LXcEkfYksvo=
X-Received: by 2002:a05:6808:1512:b0:53a:ff9f:4d84 with SMTP id
 5614622812f47-5640d91b306mr1132841b6e.2.1793344091902; Fri, 30 Oct 2026
 00:08:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030042212.73949-1-kylebot@openai.com>
In-Reply-To: <20261030042212.73949-1-kylebot@openai.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Fri, 30 Oct 2026 08:08:00 +0100
X-Gmail-Original-Message-ID: <CAL4WiipXOH=B2jbdDAprKTonTwgRe7qr1h8axzFZYThQc74D3w@mail.gmail.com>
X-Gm-Features: AclHuK9xLrLy2m0XOZ8wr86o8hZVzkdM5MtFQpYNijpLuHL3xzSe7P-0pKW8xk4
Message-ID: <CAL4WiipXOH=B2jbdDAprKTonTwgRe7qr1h8axzFZYThQc74D3w@mail.gmail.com>
Subject: Re: [PATCH] net: gro: avoid parsing headers from shared fragments
To: Kyle Zeng <kylebot@openai.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	outbounddisclosures@openai.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 30 oct. 2026 =C3=A0 05:22, Kyle Zeng <kylebot@openai.com> a =C3=A9c=
rit :
>
> When an skb has an empty linear head, skb_gro_reset_offset() can expose
> the first page fragment directly to GRO header parsers. For a
> SKBFL_SHARED_FRAG skb, those bytes may still be writable through a file
> mapping. Headers validated during receive can therefore differ from the
> headers later copied into the linear head and used during completion.
>
> For example, changing an IPv6 destination-options length between the
> short and full header fetches in ipv6_gro_pull_exthdrs() can make
> ipv6_gro_complete() pass an out-of-bounds offset to udp6_gro_complete().
> This is reachable with an ordinary TCP GSO skb containing spliced file
> data, without an skb zerocopy destructor or a second GRO packet.

"ordinary TCP GSO skb" ???

I do not see how a TCP GSO skb reaches skb_gro_reset_offset() with
skb_headlen() =3D=3D 0 : TCP always builds its headers in skb->head.

My guess is that you need a decap step first (gro_cells after a tunnel
pulled the outer headers), so that the inner headers come from spliced
pages and start at frags[0].

Please describe the exact path in the changelog, and send me the
reproducer privately.


>
> Keep the direct-fragment fast path disabled for skbs with externally
> writable fragments. With an empty linear head, frag0_len remains zero,
> so skb_gro_header_slow() pulls each required header into the linear head
> before it is inspected. Subsequent pulls preserve the already validated
> prefix. This covers both gro_receive_skb() and napi_gro_frags() while
> leaving the existing linear-head and private-fragment fast paths alone.
>
> Signed-off-by: Kyle Zeng <kylebot@openai.com>
> ---
> I have a reproducer for this issue and can share via DM

The fix itself looks fine to me, but for v2 please:

- Target the net tree ([PATCH net]).

- Add a Fixes: tag. This is requested for net patches.

- Tell us how the bug was found (tool, LLM, manual audit...), as the
  netdev bot asked.

Thanks.
