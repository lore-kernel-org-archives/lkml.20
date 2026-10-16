Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FC13B8111
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141558; cv=none; b=Nhvs2Zf9fUxPcHahzj01VgRAWm8hk68wYX4V+QaVJBFsAztI2KnZLa79WRGg0O2xtSnFoPjY6LyWHcb+yylXsAqR0fLl99q7NCede5sfRB1Nh8wbQYN0OWW6VTNaWQK/U/5KE9LhubjAcK//yJw14f3ExpLgjofpXh0eqrUsMVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141558; c=relaxed/simple;
	bh=vBIXkU5a0czakfaG5UvhQYLDQmtPpOHhwRqC+37to5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bn0iZ4kbjyBlthjXpetyEQ8omqkXlL6NXn4JeNxY+eoekl4xZuOQcXwlJGsbgI4j58c4leZsGw0MHxI+xQesGt83Mb8SCVBS9n44KfPSU9jBz0bmQyyXrl0WP/EPJY9rZtqzJW5yMWhYiuYLUVPiXXSPa/llf7tBqgd8J9K1Kd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/ma36wG; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/ma36wG"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-39569e136f9so1845547a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141557; x=1792746357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yIua1GyF5CyLs9zVRRQ2YP0+xQy31M4iXC7gh2QlT8o=;
        b=R/ma36wG/IHRU2eoU0KCWSBoMR66p9M6DTdmOOjFlc/4eMkm5OzKOY0h56NXsULWRY
         IgsALiiGVxAVMLQL7HCOIv+AbktrciTx4F3MkyaXiPIi637hKWySRrD+hEdtTuDPpzcT
         PUbRvbJw6xC7unByrBbLZoCGZry+bWJ5MeodvfScKLm8GObt1ltBDiBNGDO8OoEAzuDG
         S2VwVqWIrI8ptNhYehpvTZE/CfJeP1bBSZe+yQgtlQDOdAcTUW2g9wk+BDZhuTmtASqC
         Qyqop8R0nbuEjwJfiJiPmjuLZQeOT0z+ljTYOrc8er4X2LhLtpK1s4QNct00ji8/iJEN
         iAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141557; x=1792746357;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIua1GyF5CyLs9zVRRQ2YP0+xQy31M4iXC7gh2QlT8o=;
        b=PX0kLeH7d70ud8eC3ZBKqXCdQodv+DXGyg3aDNPrVoCjF1oQwBfKkWKW1vGwqIC0M/
         T8Y//eJm0Swe9+RDPURYejfba+v9rPSL8gBGquLOiPgVaFgbiREGAKoCReJc9L1Xrh1L
         lRU2+QwA5dw36qqMV9oxf8rfATfdLKumA26DTSw8b4EXug6nAIswkIa+d8p1NhfzHgEf
         okCMvHWg2nnpz/L+WPMgSXGlgWgMDy5bMb9FCy/mFlVSl4wyODoYXdYGOyvNzemlUYBs
         bjMxs+sapLoEexxbAhkYti+M/yeBXFhn7k7I47tF6BCAP3WkRyfZIhR+nzLwf6jo95y0
         9bxw==
X-Forwarded-Encrypted: i=1; AKwUvBx1KBsnm4eDLJoWa+HpMbF8WQiWZBa0D1J3KZT8B6JQRpJkouIbFH6amC9e7fVlqiFg/S0EZBWmPBvayqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuXVk6qegq6DhDNTNHW9cXoi1xdyjhBINwnJR8zOsFxGYWAZbe
	ZACppEu/N3QjpXLiUbFds2OXsHWBenIQK/H0ko3oHmi6iGBHAYv40It2
X-Gm-Gg: AYBFou1KaGBrQA4Xwm7PtHfFFQr4EyK/j15IW03mjs4kPlBme7DghJx/J8bcIc6N/so
	LAV1ruoSjHrfq6+XHjmbyP1YE5vr2Y2Uc26c0xtWgLpAIPmLRCgVoNGC/7pJMWJfNfiDA6sgyzr
	z2ZYwrfXbXATWFAN5G1gDSmMGH4AmeTF+f9JInwmkMfPOFGPqoj+EVC0Ai7Oa9bDkAmrmQ3teLJ
	NQlL6LShmvUy701CNhFyP7b3Yjj9vQ+DC8R9MdeOxE0ggh9PfY5flquM03anFCVgl1NYINcfpPq
	3srOFEVaGSPv0QbVm4jpRKY0Y5ZZEVl+FVisKxKigm6y3eKZGfI4u9D0neXRBvHB5Anuc/sU7Ib
	I5gNn/hygQlQJEo6ZaYtDKDG5ZGddBKQoYFR2Iy/tMqrt4V2eB3C/QZOjnkeypf/+CXgPe5FtgD
	5k2vXaxYfCIr0aCN1fJSxKkXXq38w1GPf/HwqMSGkxHAUlW2bWUCPNJprHDUZMfnCca7IA8EqC6
	lB6Dq+8TUf26vcQt8Q=
X-Received: by 2002:a17:90b:2d0b:b0:3ab:36c4:b4ff with SMTP id 98e67ed59e1d1-3ab3a747069mr19095398a91.24.1792141556494;
        Fri, 16 Oct 2026 02:05:56 -0700 (PDT)
Received: from LAPTOP-QJLDGQ2L.localdomain ([112.224.225.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0aa3c24sm1310370a91.4.2026.10.16.02.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:05:55 -0700 (PDT)
From: Boyan Liu <yymhvert@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	co+98d7de09cd94fec5@bugs.sh
Subject: Re: [PATCH net] udp: Fix out-of-bounds read with unset mac header in unexpected GSO path
Date: Fri, 16 Oct 2026 17:05:25 +0800
Message-ID: <20261016090526.2497-1-yymhvert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <willemdebruijn.kernel.2a345d6bd54c5@gmail.com>
References: <willemdebruijn.kernel.2a345d6bd54c5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Willem,

On Thu, Oct 15, 2026 at 10:49 AM, Willem de Bruijn wrote:
> I wonder if the right fix here is to not call skb_unset_mac_header in
> the first place.
>
> There are plenty of L3 device type with no L2 header. They still have
> a valid skb_mac_header.
>
> This fix may be papering over a tunnel doing something non-standard.

You're right, and after digging into it I agree the seg6local side is
the real offender.

I checked every skb_unset_mac_header() call site in the tree. There
are exactly two: net/ipv6/seg6_local.c (end_dt_vrf_rcv) and
net/core/filter.c (BPF egress, unrelated to the rx path). Every other
receive path delivers packets with a valid mac header: NIC drivers set
it in eth_type_trans(), and L3 tunnels without an L2 header (ipip,
sit, gre, tun, loopback) reset it to the network header after
decapsulation. seg6local is the only producer that lets a packet
continue up the stack with mac_header unset, which is also the state
skb_mac_header() warns about with DEBUG_NET_WARN_ON_ONCE().

One complication: the unset in end_dt_vrf_rcv() is not gratuitous.
vrf_l3_rcv() -> vrf_add_mac_header_if_unset() relies on it to
synthesize a fake Ethernet header when a sniffer (e.g. tcpdump) is
attached to the VRF device. Dropping the unset entirely would change
what sniffers see on VRF devices.

So instead of removing it, I restore a valid mac header once the VRF
rx handler returns:

        if (!skb_mac_header_was_set(skb))
                skb_reset_mac_header(skb);

The sniffer rebuild happens inside the handler while the header is
still unset, so tap behavior is unchanged; when no rebuild happened,
the packet now carries the same mac header state as any packet
received on an L3 device.

Tested under QEMU with the original reproducer:
- unpatched kernel: KASAN slab-out-of-bounds in inet_gso_segment,
  same stack as the original report;
- patched kernel: no crash, the re-segmented datagrams are delivered
  intact, and the unexpected GSO path is confirmed taken;
- with a sniffer attached to the VRF device, the fake Ethernet header
  presented to the tap is identical before and after the patch.

I'll send this as v2 with the fix moved to seg6_local.c. If you'd
rather drop the skb_unset_mac_header() altogether and accept the
sniffer behavior change, I'm happy to do that instead.

Thanks,
Boyan
