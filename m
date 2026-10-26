Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029989;
	b=xzy5AZfkU/9N8RS4yJ+VaHQ1FNovJYdBA3DABlqcGpH+R27PsiSt5G8Ncmpv6Tgd4/Sq
	 aY7x0zKAXWqiCN4jKOotFgG9MhH92iMQWc90KHqk4QeT/6OgeQwhLGB8W26Z8xE7kemcb
	 xVA1NDw8isgLRnlWd5DGByOkpXlWT19zQUb++Ma/+ReKvM0OQmqcuvADmzAEj3olBLX+C
	 SPVIKX/kEbhMKt6am7kXXqEPP+9iN3pQwDpXj4TEgAFIM0IPnc7b/QXQHl/+zIsQvWbcf
	 THqV5Z3Kg9dJ1Wjt/iC3rE8fYKiBhpO4DPNivuefqPzwL6nI4dThFiqMoYKOKOhF8Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029989;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bBoElw9ysLsJQUI5C4w63KN4DXiE3vbiLtAf+efL9h4=;
	b=o9NUg25SRuU3wmcA2ujVg4/kpJQbRUqzNfbajg2OnH3VoDvEbSIhqD9cwsl2GEcB4ZWn
	 fJ1pvlgsn4ZH6EPZ6UKtYMfg9b2X+f05ydg8E33VqhrH4H+H2v0+K6ueoN5yAGhohk9QN
	 5l05Sh0luMZjPgHbztZXBfK9m2UGQUDFyBMbHLl1Vibx7qc2g2akLmtbvR3T6xxxbTHes
	 TnAy4usywBsVuT8X16CwsfIztMhuoRst68qXC9LKGBGsemjPEokDggWCiM027SsvfAzLF
	 shXm2/RCka+GyH58Pb1P5jrTlWJcCDn9kCzV3GhARhOHg8LGGnrW7SqnBeo/HG/h2Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jTdinQVJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08AC606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jTdinQVJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820BD1F01825
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793029988;
	bh=bBoElw9ysLsJQUI5C4w63KN4DXiE3vbiLtAf+efL9h4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jTdinQVJ6Y/zy7EOvUPX92o7sAFic0UzNWh5zy2glqPkYzkVh3Mc/rzKkgivWTJgz
	 n2kioSaFNnRWT1912/50vIAmCwUtoQlQf8ZW7nnaWs3b1BnV4S+at/FQaGbnRKR3Tg
	 0I97p72cKWGIgupJzxJzrcrvzYzdxTa8SplXNF+jQR8Ca4SOiElW3Dew83xM0EnGwJ
	 4sRUwGEORnH0t84ne6SnJ/cMuPa8PcWRXY3L0Gvg0muwGaiPwCv/hlMKghav9l2vM3
	 72rkolUxi97UkeuZ0krOpd7fVW6HsRv93YPqfpEVWvvCmZgskCfCW/x0r2288lTpbp
	 i+J05wTD6AoaA==
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4ed6d69bdfaso1640426b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:53:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzR00MbiRkCLO2eh8H+3hzoAPMceDBq6z8V9o0938FabzYjSSXCU3DiKgUqFRrMHkVTou8U4XF/t72K26A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKedNHP9c4AvMA2UNXvcI/fVhKjI+xkM4p/8dgRO/2eR+HK5g8F
	OEKZLYRtlgXUf1tMjHF9OPGOgOJwwIjs/4S0Wa1pTvOSX0K+zzO3TgFA06CHuLQVZyiI5SDhjDm
	ADTpNb0T/VX8RmpTxOWd6liS7Yy4LSBQ=
X-Received: by 2002:a05:6808:6f97:b0:53c:af69:84dd with SMTP id
 5614622812f47-55c0023cd9bmr4694423b6e.12.1793029987656; Mon, 26 Oct 2026
 08:53:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026153113.3275494-1-antonio@mandelbit.com>
In-Reply-To: <20261026153113.3275494-1-antonio@mandelbit.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 26 Oct 2026 16:52:56 +0100
X-Gmail-Original-Message-ID: <CAL4WiioW-1AcvoL6OxOJK3RiKCUumhprte=hBeLRT6gY4QhENQ@mail.gmail.com>
X-Gm-Features: AclHuK-WozjKfrhLn3dLLvjqv4oI1SvuaLyn7JbhC-t-dDZ906WiZQoSv-YDBKA
Message-ID: <CAL4WiioW-1AcvoL6OxOJK3RiKCUumhprte=hBeLRT6gY4QhENQ@mail.gmail.com>
Subject: Re: [PATCH net] net/sched: fix packet reordering on requeue
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: netdev@vger.kernel.org, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 26 oct. 2026 =C3=A0 16:31, Antonio Quartulli
<antonio@mandelbit.com> a =C3=A9crit :
>
> dev_requeue_skb() appends requeued skbs to the tail of q->gso_skb, while
> dequeue_skb() takes them back one at a time from the head. If the driver
> returns NETDEV_TX_BUSY again for the first of them, it moves behind the
> skbs still parked there and is sent after them.
>
> This showed up as heavy TCP reordering while benchmarking over veth,
> which returns NETDEV_TX_BUSY whenever its ring is full since
> commit dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring to =
reduce TX drops").
>
> Requeue the skbs at the head of gso_skb, keeping their order. With 4 TCP
> streams over a veth pair with a pfifo qdisc, this removes about 1.3M
> out-of-order segments and 15-37k retransmits per 15 seconds, and raises
> throughput from about 40 to 76 Gbit/s.
>
> Fixes: a53851e2c321 ("net: sched: explicit locking in gso_cpu fallback")
> Fixes: 9540d977618c ("net: sched: fix skb leak in dev_requeue_skb()")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
> ---
> Notes:
>
> - Setup: 8-vCPU VM, veth pair; sender with a pfifo qdisc and TSO off,
>   receiver with GRO and threaded NAPI; iperf3, 15 s runs.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
