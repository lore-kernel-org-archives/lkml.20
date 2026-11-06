Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934895;
	b=Se+8P2pl0rro+YrXnmkVro7qRWArGph4tTF7Ho/CEOVPV1BMSpXbaZZWrqtsv4qI6DKF
	 EN3Sp/NhIBUm6QR5pHppbpepvSB7WAGfpw1K6/NyvMuQahZ29kPzDqccjR7ROaKDwH6Cq
	 z/fomjM7sdTfgurC9sI3FidCK9IaOzDUC51zrkPiJB/1LL48N/RJdNvB629nEgEAu9G2E
	 PQRZ2C9+yI3y+Sa4M3nrgtRyBQjKz526LBrfYr8Uu+mkcAwazMDG/spy36IB2inaFCoS/
	 JsXnmqVcHl5z8t7QUbPKq2sA+I3aJJlq6BbFu2hEFLBHeVKVcNn0uprqaOrJ6HAD+fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wJj0oR2pSKsMay/M1e8Ih51asYPlBe9zasBmF6ztsDo=;
	b=wt8KKlkZ9+WYlPDsLG67MOIuG12LqEE2Te3pdwknl8uNmQRaopbfan3TFBgfnx5ijdPQ
	 e9cIp58SwuYU7ZiX1KE7n1VUP2hyQwTDxATC9q5oCq73Q5eEKTfm7KBBHuCCnxTc+w2eV
	 AOIWfPHgjHGYkJHd8EEmhi848NGne1lzhBHSt+8Roipp2WPkQKipfXagpvei2PBoMm1rH
	 2YZg/23rTfiOuf864qCDZP09+diKkRm1JMwA1h1PJ4i9E9YaTaJb/VU0IHkysxZO8+yY3
	 WVE1zeLNOPmaCRiAB9bMG3rQK0h9kpwTVDAxAJDIMSgFcGPi1mB9C3U7CczCbQzeKHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y2gj7zZJ;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DFD606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78DFD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y2gj7zZJ
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eafa528803so76321e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934894; x=1794539694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wJj0oR2pSKsMay/M1e8Ih51asYPlBe9zasBmF6ztsDo=;
        b=y2gj7zZJ0s84u8Y3vAQA6OUE3k6+rRtGJ8LpvPBLcpePX2omhpXxg5HJV5wz5jodfw
         6Zz9Ondu5uJBs0o0jaDhhgOVSCpujT6TiBFw1OBCN9+LBcZkhH11J2CltoZbCEj11ytS
         tcSyV4q8ap42K0iPksccTp7UMzX6jMkZdygmrx+mgjw1tapU4z78oDH1tokeDA3dHFdR
         HP4Kt6YqVDtbe9r7OwpsfRF/dIIJw9lPEqkPdWbw03xjxM/Dz3m9fMAwwj7n2mUeyrWI
         65F5Gs01U4R0z2zvaup+YqCw+iU+jjjK3WjNHAXuMoKcK35Uuiyqlm/OKBtMPgJJaEQY
         5BfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934894; x=1794539694;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJj0oR2pSKsMay/M1e8Ih51asYPlBe9zasBmF6ztsDo=;
        b=FyKV+X1feqE0r3rSaMBMuJ6eFI14vPathVFm64KrMfJ8/WKWBDF16Ujfbt2JpLwx8z
         pCm26y3SAFAZXYJa9uapftheBxGS3wDwBYAhdCJDn3zXrbQYeF0p43+p/puIIl9jSnpG
         zP4zRi92c3NQPSiaz9+KoF1eXlPVrVZEUmalTAOxcrAzWRN3xIw3/dNE5zxEjRuNjlXV
         4wQ1MOi24EX55kt6lm7EpMHDR2Q/A/LdDnGCaRGKSpmC8zh4Epjk1YBaha4JPJPTWvlP
         Nsp2j3PKH3twntyPOHNM7epmlR6gdirwIDpflcpbeSx3/i8zLUbG3/ZRnwQjicCCwLTY
         r0pw==
X-Forwarded-Encrypted: i=1; AKwUvBx+tYEcPW2j1pXxrWIAcmnbX2aZMoLn+hL0ySL/2ZnaNpERpVrlKBAdGt1zeD71vefYY1hECGYhYyog/CE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tQcTKU9emJQPKXqWI7C9gfgeunwMqi8OK+kRiotz2N2RPBu3r
	UigOZ695HUf7okw/3wDRniXGc34xd3ZZG0Z+crvGe4ZLAy3afT7rB0tP
X-Gm-Gg: AYBFou2qYBUnKZtg6Tz2GwNN0rNT/kBpsC4wSJvR+47WQKLF/MR+rN4B2nY4ij/4TnK
	dVsXKdvbTFezTA/IxQc7t03hGULc8XdIj0CRMHmPuhudPeLtzvNmnbCAhqKio+UinRZkPIlhpW2
	ApqIx3mbA96Pty84EUcRSfAvh+SvsWvgIf3FIy0iAsS97A9kZX3AYYn/NlHbzAwMazkLk5yHUTn
	KtwsVk1oyz6ZKlQ5sY/S+GemQZT0F0c/8DZbrioMfU4rdr2kVgu2ank5WBKp8/O29iwAi1iwpOh
	vVURP5mu2XMgvtxy9y021dYP1KAKEFjsu/34X+cPJqecdE7Jj3accPu4CUTrC5Qy2xmDoi/KvgT
	raetUNu3jLp6TJP2G4lcNiISlg/h6HT++iPMbQeOcK/g4ygPRXAoNJdy0BlXpn+V/dstzfvMdij
	q8mFkdXitjHBI1gqshYW9PedpINSxUibTZq+3jYvgGrURMuTQ6/dBhdIh1F2bd5OOW0PNUKYjdo
	8xFlvFQEdlnZoyll8DIiwr76ujPMgYXil//D2Z3W5j65r7OH4FwAykWp4cEGPBqu5+x+3x4qOmQ
	wCG+M7IbApBDwJU4nczq+5ra9LNefTdqNecCP8ZbnjZ/IjH49mW7azqFVDBAewXR56k12uaSuAb
	l03xLpnpooMBIHlMrLEfRi0ShIWEdwYaFp1VraOOBkdunVt4FMt/6Qj1GlEv7584NwZcS6eE=
X-Received: by 2002:a05:6122:ec5:b0:5ea:dbae:3cb1 with SMTP id 71dfb90a1353d-5ecc4431e09mr715241e0c.19.1793934894431;
        Thu, 05 Nov 2026 19:14:54 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc64cb602sm473888e0c.7.2026.11.05.19.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:14:54 -0800 (PST)
Date: Thu, 05 Nov 2026 22:14:53 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>, 
 netdev@vger.kernel.org
Cc: dsahern@kernel.org, 
 idosch@nvidia.com, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 willemdebruijn.kernel@gmail.com, 
 linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 yana06070@163.com, 
 shuah@kernel.org, 
 linux-kselftest@vger.kernel.org, 
 willemb@google.com
Message-ID: <willemdebruijn.kernel.1e0038bcc3ef8@gmail.com>
In-Reply-To: <20261104092240.15649-1-yanxia@cmss.chinamobile.com>
References: <20261104092240.15649-1-yanxia@cmss.chinamobile.com>
Subject: Re: [PATCH net v2 1/2] ipv6: fix cached route reuse for SO_MARK
 control messages
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Xia Yan wrote:
> A connected IPv6 UDP or ping socket can reuse a route selected for the
> socket mark when an SO_MARK control message supplies a different mark. A
> packet can then bypass a prohibit rule for its per-message mark instead
> of failing with EACCES.
> 
> ip6_sk_dst_lookup_flow() consults the socket dst cache even when
> connected is false. That argument only controls whether a new route is
> cached. The cache check does not compare the mark used for the lookup.
> 
> Record whether SO_MARK was supplied by the control messages, including
> an explicit zero. For UDP and ping sends with that flag, call
> ip6_dst_lookup_flow() directly. Keep the cache handling for sends
> without SO_MARK unchanged.

The extra cookie flag is unfortunate. Only to handle mark 0 as different
from not set?

Another approach that may avoid this and simultaneously also solves the
other inputs to policy routing:

    IPv4 udp_sendmsg() avoids all of these with one rule: if
    ip_cmsg_send() ran, connected = 0, and then sk_dst_check() is skipped
    entirely. udpv6_sendmsg() already sets connected = false in that same
    case. The only gap is that ip6_sk_dst_lookup_flow() ignores the flag
    for the cache read.

    Simpler and more complete: consult the cache only when connected, e.g.

        struct dst_entry *dst = NULL;

        if (connected) {
            dst = sk_dst_check(sk, inet6_sk(sk)->dst_cookie);
            dst = ip6_sk_dst_check(sk, dst, fl6);
            if (dst)
                return dst;
        }

Would this be a viable alternative solution?

> The concurrent SO_MARK case was identified in the review of v1.
> 
> The issue was reproduced on UML with connected sockets and mark-based
> routing. A separate test kernel paused the sender after it acquired a
> cached dst reference; another thread then changed the socket mark to the
> per-message mark. The old code still sent the packet. The fix bypasses
> that cache path and returns EACCES. The 50 UDP/ping route checks and all
> 54 cmsg_so_mark.sh cases pass with the fix.

this can be skipped

> Fixes: c6af0c227a22 ("ip: support SO_MARK cmsg")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>
> ---
> v2:
>   - Replace the current sk_mark comparison with a flag recording whether
>     SO_MARK was supplied, and bypass the cache for those UDP/ping sends.
>   - Add connected-socket regression coverage in patch 2.
> 
> v1: https://lore.kernel.org/netdev/20261030141435.779302-1-yanxia@cmss.chinamobile.com/T/
> Review: https://lore.kernel.org/netdev/179371875338.488856.4546363285391899557@kernel.org/
> 
> Tested on net cb284914e749388eef402938bdb3115fe1f6d337 with GCC 12.3.1:
>   - UML normal: baseline 41/50, v1 and v2 50/50; the same extended
>     cmsg_so_mark.sh has 2/54 failures on baseline and passes on v1/v2.
>   - Test-only pause: baseline/v1 retain the old cached dst and send after
>     the socket mark changes; v2 skips the cache helper and gets EACCES.
>   - x86_64 W=1: full vmlinux, bzImage and modules builds pass on baseline
>     and v2 using configs derived from allmodconfig and allyesconfig.
>     WERROR, KASAN and KCSAN are disabled; KUNIT_ALL_TESTS is also disabled
>     for allyesconfig. The unmodified configs fail on the same existing
>     GCC 12.3.1 Werror diagnostics on both sides. Derived-build diagnostics
>     are identical on both sides, including their occurrence counts.
> 
> 
>  include/net/ipv6.h  | 1 +
>  net/ipv6/datagram.c | 2 ++
>  net/ipv6/ping.c     | 5 ++++-
>  net/ipv6/udp.c      | 5 ++++-
>  4 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/include/net/ipv6.h b/include/net/ipv6.h
> --- a/include/net/ipv6.h
> +++ b/include/net/ipv6.h
> @@ -353,6 +353,7 @@
>  	__s16 tclass;
>  	__u16 gso_size;
>  	__s8  dontfrag;
> +	bool mark_set;
>  	struct ipv6_txoptions *opt;
>  };
>  
> diff --git a/net/ipv6/datagram.c b/net/ipv6/datagram.c
> --- a/net/ipv6/datagram.c
> +++ b/net/ipv6/datagram.c
> @@ -819,6 +819,8 @@
>  			err = __sock_cmsg_send(sk, cmsg, &ipc6->sockc);
>  			if (err)
>  				return err;
> +			if (cmsg->cmsg_type == SO_MARK)
> +				ipc6->mark_set = true;
>  			continue;
>  		}
>  
> diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
> --- a/net/ipv6/udp.c
> +++ b/net/ipv6/udp.c
> @@ -1693,7 +1693,10 @@
>  
>  	fl6->flowlabel = ip6_make_flowinfo(ipc6.tclass, fl6->flowlabel);
>  
> -	dst = ip6_sk_dst_lookup_flow(sk, fl6, final_p, connected);
> +	if (ipc6.mark_set)
> +		dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_p);
> +	else
> +		dst = ip6_sk_dst_lookup_flow(sk, fl6, final_p, connected);
>  	if (IS_ERR(dst)) {
>  		err = PTR_ERR(dst);
>  		dst = NULL;
> diff --git a/net/ipv6/ping.c b/net/ipv6/ping.c
> --- a/net/ipv6/ping.c
> +++ b/net/ipv6/ping.c
> @@ -148,7 +148,10 @@
>  
>  	fl6.flowlabel = ip6_make_flowinfo(ipc6.tclass, fl6.flowlabel);
>  
> -	dst = ip6_sk_dst_lookup_flow(sk, &fl6, daddr, false);
> +	if (ipc6.mark_set)
> +		dst = ip6_dst_lookup_flow(sock_net(sk), sk, &fl6, daddr);
> +	else
> +		dst = ip6_sk_dst_lookup_flow(sk, &fl6, daddr, false);
>  	if (IS_ERR(dst))
>  		return PTR_ERR(dst);
>  	rt = dst_rt6_info(dst);
> 
> 


