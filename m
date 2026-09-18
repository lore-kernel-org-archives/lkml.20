Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7CF514768
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748545; cv=pass; b=afI+qk9/4/oyih3DZvdb3IcKw7b+qEWriiP1eU6/LnclQKPdGPt6+2qO6nnKtbEtQuvVnQgySCKrWt4unCLoGlCOQ+4JS6WGl70ITvKXfXMgwkClOcVx2A9t4u8sQVlVrLbLrTYDKz2vilFVuP7g//RPn7/CC6EIM1KnXY8qEhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748545; c=relaxed/simple;
	bh=+bv28cFDp1hCz4ppO/3tdotk7KxDsNEhJCDiI4kXg1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OATSYVPy2X4W7ojjyT5hqSykIWPhRWdct/mxwxYD9wO6YeUEvYnbuuJt/hyDgRToIeN52iInsBnokms0H40ciIrXX/Kl1IDLoV3a81M+kU0uf6W2+qGbYry9JeYEjM/UvFxcN2do6rMHyXgF3evq+UerHuFwbX5L/rftDqPmuDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mBjPH9wG; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mBjPH9wG"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso778293a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789748532; cv=none;
        d=google.com; s=arc-20260327;
        b=fifpEy2i26a/BqtPDNKQUWa5PtFJ5PrN1pKl5f+WPt3iKHg2k6W5Ofv1Zc2KGbACdV
         4rEK/zuJpDijCCuJmOBKkN21g6f6ejrAwLiIeZat3ikUa9oob7q4VJWqdiQOA/9z9Lsh
         tFWe2algzX9xz6iqgQuASD+07NGeBf1Nmynj99MylHo0cR+4HqIlHmjHZIoBUKBMqjmF
         oBfoInb2uuToqmoJOCrZaqT18/dtFlePkAcgTm5e9pnvy0nxQ6zm2Ey/kyUTcpnw3r4g
         gF/KSTPBrD/HuVSuxnQ39+NmAmiSBJUoD5BQwby83/s2GWj//v3wQBzKkCG7OBmu75c+
         ZLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/LYEEUEJCTSCEc5A+NjwjIdHJqSahq7aUmXdkpcbW1s=;
        fh=7rmBbab5GlNcpGhhTpLU9oBDKmpHwJF2iZlwSDWGNeg=;
        b=maBi/ftJUW0z8Kad4Z1yehL6J0fg4I+e2HJJMVwNDKXsBDp7o1iH/ljNINM9sBDnIR
         xh55s1uuLGiZk4ca9wn8ZbNDGaqlRDu8AaJxQs0xX0/OzHom9d6S9KfJ8WFRAm73xFPz
         2tAsMFWddxqod0OnK2A7Ny+8wOb2tubw59lYvnh20xPPTxhDTykQtMzip+KaQX1v+TCX
         9NuHKmKxjYW/QP6VYnhJR6o49zahH7Fk72m8pf73g+oDtTSh+Uk3I9g6meTLfROeUylt
         9aQX63eVCYOwgdHPmz1bQfe5WF+69SBNPWs1mn9rjDJ5yDvHzXsNiAuGyi5WxW8xjnhf
         uvvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789748532; x=1790353332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/LYEEUEJCTSCEc5A+NjwjIdHJqSahq7aUmXdkpcbW1s=;
        b=mBjPH9wGjONCeViqiT5D2zmXHfmK6speUucqdfRzwSzgwSBX6hlY/W1ixV+lZoh2nr
         NPOPLpkz8YPMT1Q3aXYVsfcU/x5LzsfDvQm/jIRkWqIjnHjT/E7N/c03yfIgAuqpzZLm
         FPB/DtaaF0R9DjZB06AofdNV4gREzNhb2tCXZYfxakHAnlizZIPilc48x6XeJzdRJoJC
         m1VRer+JxOoggOkVzNZfXPwhlCWTtT6Pgi4AsFW6yy1VDf6ZdeoSG0FmQnn+y8OyqhNp
         cTeqC7TDiNsFAv5dMEa3SByc1OqOD46jFL0qKGKCZpyEWp1aaOB89OmfsjUF2HfC8vOt
         L1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748532; x=1790353332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LYEEUEJCTSCEc5A+NjwjIdHJqSahq7aUmXdkpcbW1s=;
        b=dYmbavqMAz6V0cl/k3583/12eEUuVJNXpmD+ErJzNE3CKQyMhm7JUC906fhZbmrl8/
         xW8JSPcqnwFQPJgwYW2ba7dO283UboM1u7nYdB7hm8/OrF+XMhTSJPuOvumIj1B6fmJM
         ji09wCSWfRBMpjDMlTEPpriuMeiCv2ECTrocBuS+LURUlxAazESKIyTejzEkWKZPxkT9
         tsHs8QaBo1iuz2hUEXRJczx6esAyQ+dFUJJHDk5l6/JsULgcdeSXnEOh8LIrhHWDRo3V
         lTU+SYo7h0I9PMu+7BGQKBmJH3/XjcT9Y1u5VoGBU06ESrtChaezXpWvPahCt3rRtjYU
         wL3w==
X-Forwarded-Encrypted: i=1; AKwUvBwKr8sv0VcXbspD1/0ZxJs4EEBJtff8OCrm0zvoJnRDBVa8Q+L32sgBUZMyaFrdi/8yHmVIg3nV1ROzFDw=@vger.kernel.org
X-Gm-Message-State: AFuF++ls4GiZx6tWBvSshfY7NzVYtK3IA2Q+WugZqhju89bXWLl9P4yW
	j2pH86YL+3+U6iMsUQ+Pl8O+E1tRhjiPfbEBoeq37FR38BaL8lThiZPV4IDFc/aDWlnBCaHiykX
	7hfmRlmjYs9Hyjser1Eqq9gTp4RQVk+HVyHt4sc1q
X-Gm-Gg: AYBFou1Cspjw610DivnqbOAw+BTRtgfKlB7Oxm5ebl4l4QgLwnmSW/TY0ULTivgTdV5
	88e6xZz+mor/2M6Isxe3tRK9/GwqsansxpsHOvz8LRKe7rsY/nF5C4Q1Nd2BXXOnrnIdLzGAw0q
	FfRPQEpDXvmc4Jr8lYHYBqUV6tAN9AtuOQWOvN9MzkgNdcnC7Ea4u/6/4YQlP0khl9pwyCpA6rs
	NthWgQ5DtqqynfnbEHUR/CiB2W0dpQsidK5/WeNkygdMF/ZsYzJe4icTuus4655SXJKoPwpfzSn
	BcERdASgSE26nkcH3/AudLtAx3xYH/B0cxQ0i3HFSa+DFWA1dq9xoTGM9q2fESbutDYCwEt+bon
	E8dwwfliU8TM6yFT6qBl2+hGMv4HofHfLN7ZLHpMMkGlqxLNOua83jRaAfm4Pw9ZvNF24KQ2Uzg
	ZVckpyIavYf7St2tVcP49md/cLnh/kXL2C
X-Received: by 2002:a17:90b:2f50:b0:39d:f08e:e6e7 with SMTP id
 98e67ed59e1d1-39e54e3c71emr12155781a91.9.1789748531262; Fri, 18 Sep 2026
 09:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918153604.579277-1-mbaragiola@linux.com>
In-Reply-To: <20260918153604.579277-1-mbaragiola@linux.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 18 Sep 2026 09:21:59 -0700
X-Gm-Features: AcwNN1VLKD08fJfVArzYhHKcjg0xdqCCPzeVi9-zbMxkS2fHkhyMYFmnbx_lVPs
Message-ID: <CAAVpQUAmGAACd1rBomaY-B2vRiE-VX9u4JRCteVB-940RhRtbg@mail.gmail.com>
Subject: Re: [PATCH net] udp: resubmit encap packets for secondary mcast sockets
To: Mariano Baragiola <mbaragiola@linux.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Anton Danilov <littlesmilingcloud@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 8:36=E2=80=AFAM Mariano Baragiola <mbaragiola@linux=
.com> wrote:
>
> Multicast delivery clones packets for listeners after the first one.
> Commit 3cb8d4b9bfeb ("udp: fix encapsulation packet resubmit in multicast
> deliver") fixed encapsulation packet resubmission for the primary
> listener by propagating positive return values from udp_queue_rcv_skb()
> to the outer IP layer. However, it left the loop over secondary matching
> sockets unchanged.

Did you see a real problem or is this triggered by an AI report?

https://lore.kernel.org/netdev/20260415203624.4057135-1-kuniyu@google.com/


>
> When an encapsulation receive handler requests protocol resubmission for
> a clone (ret > 0), the secondary delivery loop currently calls
> consume_skb(nskb), silently dropping the packet.
>
> Resubmit cloned IPv4 and IPv6 packets directly to the returned protocol
> via ip_protocol_deliver_rcu() and ip6_protocol_deliver_rcu(..., true),
> matching the ownership and resubmission conventions used in the
> segmented GSO paths.
>
> Fixes: 3cb8d4b9bfeb ("udp: fix encapsulation packet resubmit in multicast=
 deliver")
> Signed-off-by: Mariano Baragiola <mbaragiola@linux.com>
> ---
>  net/ipv4/udp.c | 5 +++--
>  net/ipv6/udp.c | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
> index bb8cfc62cb00..d79be57854e3 100644
> --- a/net/ipv4/udp.c
> +++ b/net/ipv4/udp.c
> @@ -2522,8 +2522,9 @@ static int __udp4_lib_mcast_deliver(struct net *net=
, struct sk_buff *skb,
>                         __UDP_INC_STATS(net, UDP_MIB_INERRORS);
>                         continue;
>                 }
> -               if (udp_queue_rcv_skb(sk, nskb) > 0)
> -                       consume_skb(nskb);
> +               ret =3D udp_queue_rcv_skb(sk, nskb);
> +               if (ret > 0)
> +                       ip_protocol_deliver_rcu(net, nskb, ret);
>         }
>
>         /* Also lookup *:port if we are using hash2 and haven't done so y=
et. */
> diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
> index 93478d1ad576..ca8d0a1844d2 100644
> --- a/net/ipv6/udp.c
> +++ b/net/ipv6/udp.c
> @@ -1001,8 +1001,9 @@ static int __udp6_lib_mcast_deliver(struct net *net=
, struct sk_buff *skb,
>                         continue;
>                 }
>
> -               if (udpv6_queue_rcv_skb(sk, nskb) > 0)
> -                       consume_skb(nskb);
> +               ret =3D udpv6_queue_rcv_skb(sk, nskb);
> +               if (ret > 0)
> +                       ip6_protocol_deliver_rcu(net, nskb, ret, true);
>         }
>
>         /* Also lookup *:port if we are using hash2 and haven't done so y=
et. */
> --
> 2.55.0
>
