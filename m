Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AC033F8B2
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792252648; cv=none; b=ai3N1y5dp74TjG1eFiw7X88iDGw0x97NqFGE8dwFBRbdJciUrFwigGez5TyLNqejxKMyCp4ZAemlP3Pvrnzks/RwmOY7Mw3bKHfJ+JKpoOmaHrktU9VFBT6ORj+RR3dQ0drJ1GlYcjaGGLBHAqp4UwVNEDElvzc8aUzuHqZds68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792252648; c=relaxed/simple;
	bh=buDbH2F3njrRXDQ6sKsXG1aceZOpDv/n8vQhTMP7H5I=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ESIHimfKpvyaabiGAoR8jAke9BWr4wuLVs7Evb/TjOV/0ZpIPoK2qnNNd5NsUff1vcPv3PMD/iZNbCkN8KlxJaW2Cz9f52n7VA5z7eFLwa0Vq7xkpzCJoz+S2cAUxWMnzcw4K9N1SaRW9HoWMDf1twUSkHNny/wO0cPB473vrGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zr3Zdkoy; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zr3Zdkoy"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7cc0892f92cso236052137.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792252646; x=1792857446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZlkplhADRs5o0g+DjBrPDoiSvTdMdtK+ibJQdYkg8KY=;
        b=Zr3ZdkoyHecZwh9gUpewrKThHwH8ysmKyeqyvgOSByIDDBN6JXS490PYarmrSFxQO4
         RRq9l/RBMCOsbvgI1F/V3xkP0HOyfn4LFY8lfsi6onaZySWQnQGY038y6yCdvz6+PrgX
         migzCdGZYo25ItVsJk2ukvDMgEc/tqeb2OLsIl0FNdfsMzYK8r+spG0XM07Ow08H/8K6
         KnSX+uOcI3WFhBOBZ2ddxjqwjHmiWmSAQFKhosrGdH5kK9ljinRypvNq1JDRJgTr65Q7
         9lcFlvv/Bpy/jW8JeuKg6c1PGFo1XPcnUt9qmW/Qbitg29xmeRdSCPfUzs7QpZhS8hxj
         byKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792252646; x=1792857446;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlkplhADRs5o0g+DjBrPDoiSvTdMdtK+ibJQdYkg8KY=;
        b=MiMjqiVl9GeRzvSj1Vgz4pjmjy+EGqI4tn9usvd5X0y1RgcF+FyDJZNf6uU6feXpCX
         SnJGikyXL1vtjm45oIHg/CK1oKI0ZKz3SnX8pGkvle+oE0CQBVx0+1z05XjJyMN6/Mc9
         0JXalVwqbcSngxnL56rbv8gz/GWZUyiT3XdvYUWsoTwkNavTs217yhPDdsQtw9DHHeNW
         EBlhDdDGXvfGA7U61UA36RuyoEmotySP2EGoRMy+mcWnFNfWDQ3Ke5juiadlJ/3yd7Jq
         xn4BPOJit4OxzfhUeT1XWDDDEY4/E8FFHZon36AxYWDE9x/FHnsweVBU8cqhvNli55nP
         tS/g==
X-Forwarded-Encrypted: i=1; AKwUvBxLQnaoS7sq45As2For3oYBTvJdDNClkEgvlfdfz3NwX4RC0yz0OhqQ8ON4j07adoMhdt2M9KQdq8mu2yk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJnb5SEVrLZ5n9Q8xPXd8Jg/DJcyu/VNaPM7ey07Lbj+L2uHXw
	JZFG6UIbBdr71dGvGRd8zoM+EE8pbNPpUKuRSBWP+Md2pX8zZMuEZldn
X-Gm-Gg: AYBFou1TP8fqlP0G/7ZNZke+t78OW0V+JcI2sFQ/oD8CYaHjGZx1ghQSV0ti5zx+CSd
	0TlAD2uBNz3NArwiU0AY7g5636ZqjcRj1JZw/fHBJ64CVVrtvkL1PQgcJ9OE4enCsw51YVRopAT
	IF3HpwmjDOLSMpG35wBwO5HrkkaAP9Ez+ZYVNh5NTJZPONsFIJ4EcdgMSf1I93zTkNNoDtoxxKI
	dva2Q6UBU/ByK6iy03pUwT7/WZJWjLJ4vsOtq07Sg8oW3xp/dqER2qTqkjo2ALISdUfspcFyphU
	7LipaELZL/e6PgkQAL73Yckr9Xd9Ozukiv5LrIXKBbMkiMKh5sk8h2ws7UX25FA0/i8ZQ4tjeVL
	7l9kdGB8sHN4GcAj0D053lN6W4ZJ/WbEKGiR9OcpU2NwBZQt8etp/QJvtNpSx77/Y9IKvFxVHs9
	2uReaQsc7CYrMS30lJiiNzWlrlFTW4zxGKDcc5WYmlVutpm3ip4XbYraPZKnCqodZiL7iP0cMaa
	vrANklefVzie3z2UzYVH3c8NQAd8SBeEvKCSYvKU8UakL5gTuD/VmC0SNfZCMK1rj1QUkj7/rTq
	FW2eFG4RrojDijpdX5ED1B2/BST0F0+Xb57GdQ==
X-Received: by 2002:a05:6102:5488:b0:7cc:2086:34cc with SMTP id ada2fe7eead31-7cc369c0cd8mr778804137.16.1792252645798;
        Sat, 17 Oct 2026 08:57:25 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990835f05c7sm4323730241.6.2026.10.17.08.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 08:57:25 -0700 (PDT)
Date: Sat, 17 Oct 2026 11:57:24 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Boyan Liu <yymhvert@gmail.com>, 
 Andrea Mayer <andrea.mayer@uniroma2.it>, 
 David Ahern <dsahern@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 co+98d7de09cd94fec5@bugs.sh
Message-ID: <willemdebruijn.kernel.3068e5bf74671@gmail.com>
In-Reply-To: <20261017120144.3059-1-yymhvert@gmail.com>
References: <20261017120144.3059-1-yymhvert@gmail.com>
Subject: Re: [PATCH net v2] seg6: Fix unset mac header in SRv6 End.DT VRF
 decapsulation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Boyan Liu wrote:
> SRv6 End.DT4/End.DT6 VRF decapsulation unsets the mac header in
> end_dt_vrf_rcv() so that the VRF device can rebuild it for packet
> sniffers. The VRF rx handler only performs the rebuild when a
> sniffer is actually attached to the VRF device (ptype_all
> non-empty); otherwise the packet continues up the stack with
> mac_header == 0xffff.
> 
> Every other receive path delivers packets with a valid mac header:
> NIC drivers set it in eth_type_trans(), and tunnels without an L2
> header (ipip, sit, gre, tun) reset it to the network header after
> decapsulation. skb_mac_header() even warns on the unset state with
> DEBUG_NET_WARN_ON_ONCE().
> 
> If the decapsulated packet is an unexpected UDP GSO packet,
> udp_queue_rcv_skb() re-segments it after restoring skb->data to the
> mac header with __skb_push(skb, -skb_mac_offset(skb)). With the mac
> header unset, skb_mac_offset() returns a large positive value,
> which the unsigned __skb_push() argument turns into a huge length:
> skb->data moves far outside the buffer and skb->len is corrupted,
> so segmentation reads out of bounds:
> 
>     BUG: KASAN: slab-out-of-bounds in inet_gso_segment (net/ipv4/af_inet.c:1383)
>     Read of size 1 at addr ffff88800da7ffff by task exploit/149
>     Call Trace:
>      inet_gso_segment (net/ipv4/af_inet.c:1383)
>      skb_mac_gso_segment (net/core/gso.c:53)
>      __skb_gso_segment (net/core/gso.c:124)
>      udp_queue_rcv_skb (net/ipv4/udp.c:2476 net/ipv4/udp.c:2466)
>      udp_unicast_rcv_skb (net/ipv4/udp.c:2620)
>      ip_local_deliver (net/ipv4/ip_input.c:262)
>      seg6_local_input_core (net/ipv6/seg6_local.c:1640)
>      lwtunnel_input (net/core/lwtunnel.c:465)
>      ipv6_rcv (net/ipv6/ip6_input.c:351)
> 
> Restore a valid mac header, pointing at the network header, once
> the VRF rx handler returns. The sniffer rebuild happens inside the
> handler while the header is still unset, so tap behavior is
> unchanged; when no rebuild happened, the packet now carries the
> same mac header state as any packet received on an L3 device.
> 
> Fixes: 664d6f86868b ("seg6: add support for the SRv6 End.DT4 behavior")
> Cc: stable@vger.kernel.org
> Reported-by: co+98d7de09cd94fec5@bugs.sh
> Signed-off-by: Boyan Liu <yymhvert@gmail.com>
> ---
> v2:
> - Move the fix from the UDP GSO path to seg6local.
> - Restore the mac header after the VRF rx handler returns, preserving
>   the VRF sniffer behavior.
> - Verify the original reproducer, datagram delivery, and VRF sniffer
>   output under QEMU.
> v1: https://lore.kernel.org/netdev/20261010073015.7665-1-yymhvert@gmail.com/

Thanks. As discussed in v1, this sounds the better approach to me too.
But it would be better to get the opinion of experts on VRF and SRv6.
