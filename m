Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712E4384CE1
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201298; cv=none; b=W9xq6S9LicSfph9xUJyBxZnONunrxW/Gp98FpbOg52CL6suNxTrHU1/ZCVEG7C2YAD8FNlPud442kO1qS5Gce+0jLv6veWg//a4uwzkOSBYJn8K+tRm5/l7p5ZQce56PlAMRyVxyY7NKtm5+r6oFWo7+Ys9Z5L8Z4ClznaIhQYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201298; c=relaxed/simple;
	bh=e6X+D5c/Tv+Ez0yFoodFngWklvLeykaCU8B+V7wc9tg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=o7UG3KLbKPwUWXgqrvW7F8wWV+d69EtxhqauJEOckSF2fTq6abVVDXIDc1zihtV6j7FblpHLlnuwuGA0RZWy0hp9sJgCG/qDnMVUpPwfmJmre+4MV0gnj3bPlcmx4NOXlRvZseACo2J+jRqwDICr6+x5f5/U7OQaI5FkhHvumVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsvPzqB2; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsvPzqB2"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5e9239c772cso390323e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792201295; x=1792806095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yKsSek1QBLZx4VbISQM48zQ9ZZju16PuBgR+zu138+g=;
        b=AsvPzqB2AMkAUnOgBySfx+Hw3l8yEXPYIW92JNpxIa+hu8PoWZZgLJd84RKbyoTOsX
         dXc57wYZN9LWkOiMpj3KutBOgcxjqzwVq1a3V5jMH0lrnqImMdl0Sfp772LYYEjcObGL
         ee5ZPCddT96Qnr7lVb1p98Qljv7TC1F9hDw+WyDhsYnAj0sGro10wFOCF4Br9+f1x++M
         mVmBCMy87nrXJQFgB6BUh66flTlUvm9y/kbaRWUG/XLqHRhZ8iaNYFlcGBUKGfTNNlSc
         OpIPntJ8baS7C5VtEPgkuUIcnYkDr/qTnOH9Qrrvvsrs0mgllEgvtVxNaVspwByeSELv
         e/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792201295; x=1792806095;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKsSek1QBLZx4VbISQM48zQ9ZZju16PuBgR+zu138+g=;
        b=IIeW3F1QnnjTyQNDD6pqfrOI7SNJlriVr5PHbQm/aYdBEciDRyetDACmfy4G+Z/BMK
         lIx7lZJCmT1HztIzku42kBoY3lBYOu3YFt/0TRUo1PCgL9PLnnr9jL8rfG+rFWBLpPAP
         9dIXYc36ZTk6VyYHFzMXks5xH5GFv6C4+KbVDauoBSfSbKZrO1oyyNub6M4o5TMOP4TS
         Kl3mD6G+6Er66Eu27sxUV7ow/3vqwe9D0A4lXaYJgYyx0rgBwxbV/gYkA02GR7QZGTok
         6g0xUhP+T77EUHhxqKOCHdMs0KDu3NqrTLY6U2i8D4o//KZ/VUEEVgTsCxmWD3kSopUD
         L/SQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgafGDPjuFxLVUsskXKofu1rvm/eYxP4ddem0Ecu+rC7clceL9HeNeFOz/VLyZRv90jAI1Zu1nBmGBRkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBFRx9TldP9XbXvHXXxTPXqeMtse/V6ZDkljkK9toSx8LLarL3
	nXpJYDdBPl41aYhbiQ12zFWzuRHv7/k975WGCa9Am+3NDdOTldZ3XgmrJSWkgg==
X-Gm-Gg: AYBFou0GWFX6TGUNQVQXA1FgBu6Q+N02uNIPCRPPr7UAIsD305oCkGqZEPcxFP1Gs9Z
	U/kb6yl5cgkwYK6l7v8I1WZEQXYIbSI8tu54eHC7qVqbQLLJfpMDGRv9e8XBQQx//1yFYfoeEaQ
	XBv002Vrgh3NUJU3jUVoL+o5wSNBzuaRwuGX04mVEza4cHisP6OGeQ0dFFx4jEn8qR9AWqchHDp
	pWvrfI1ef8/vV1LcalqTsnMnNt36DhOPfD8qKYl04dtkPFpWdsBqAEehHzXMiAvJ2QvU2LNWP2O
	JltVTD2lyD0bcrFVsMXX43g54QS6HI1kZQzFtMjDfsQdjWpbCA/d1oOCtqdeJcVTbj0/UBqfkso
	0Q1oKhC0loguqR57FMm378/v1WwbNRF6kHbIU9YCP+LP5sT2TGvmNHSmcMAJwItRQZgOfVFd/LV
	+56usu09/0FL7/hZw73UiioqMTOckUhTOluIQQPadK2IeGRHViQBnBNLhTC5CsP9IPMkvbBxtsX
	8ecg9iPd+ecCxTTkFTIfec0kNm8jMfOgafBmVxV86rxWaoqCaLEvjOpBnHdchcT95eBiNR6uZ6X
	30TnBx04K83SBFzPFZVBxUE4zaHuylSBNFtu0wxBRKoUTQuQ
X-Received: by 2002:a05:6102:1612:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7cc36a38330mr415620137.23.1792201295404;
        Fri, 16 Oct 2026 18:41:35 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990836389b0sm2847007241.11.2026.10.16.18.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:41:34 -0700 (PDT)
Date: Fri, 16 Oct 2026 21:41:34 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Boyan Liu <yymhvert@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 co+98d7de09cd94fec5@bugs.sh, 
 andrea.mayer@uniroma2.it, 
 dsahern@kernel.org
Message-ID: <willemdebruijn.kernel.ddaa3b8e2bca@gmail.com>
In-Reply-To: <20261016090526.2497-1-yymhvert@gmail.com>
References: <willemdebruijn.kernel.2a345d6bd54c5@gmail.com>
 <20261016090526.2497-1-yymhvert@gmail.com>
Subject: Re: [PATCH net] udp: Fix out-of-bounds read with unset mac header in
 unexpected GSO path
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
> Hi Willem,
> 
> On Thu, Oct 15, 2026 at 10:49 AM, Willem de Bruijn wrote:
> > I wonder if the right fix here is to not call skb_unset_mac_header in
> > the first place.
> >
> > There are plenty of L3 device type with no L2 header. They still have
> > a valid skb_mac_header.
> >
> > This fix may be papering over a tunnel doing something non-standard.
> 
> You're right, and after digging into it I agree the seg6local side is
> the real offender.
> 
> I checked every skb_unset_mac_header() call site in the tree. There
> are exactly two: net/ipv6/seg6_local.c (end_dt_vrf_rcv) and
> net/core/filter.c (BPF egress, unrelated to the rx path). Every other
> receive path delivers packets with a valid mac header: NIC drivers set
> it in eth_type_trans(), and L3 tunnels without an L2 header (ipip,
> sit, gre, tun, loopback) reset it to the network header after
> decapsulation. seg6local is the only producer that lets a packet
> continue up the stack with mac_header unset, which is also the state
> skb_mac_header() warns about with DEBUG_NET_WARN_ON_ONCE().
> 
> One complication: the unset in end_dt_vrf_rcv() is not gratuitous.
> vrf_l3_rcv() -> vrf_add_mac_header_if_unset() relies on it to
> synthesize a fake Ethernet header when a sniffer (e.g. tcpdump) is
> attached to the VRF device. Dropping the unset entirely would change
> what sniffers see on VRF devices.
> 
> So instead of removing it, I restore a valid mac header once the VRF
> rx handler returns:
> 
>         if (!skb_mac_header_was_set(skb))
>                 skb_reset_mac_header(skb);
> 
> The sniffer rebuild happens inside the handler while the header is
> still unset, so tap behavior is unchanged; when no rebuild happened,
> the packet now carries the same mac header state as any packet
> received on an L3 device.
> 
> Tested under QEMU with the original reproducer:
> - unpatched kernel: KASAN slab-out-of-bounds in inet_gso_segment,
>   same stack as the original report;
> - patched kernel: no crash, the re-segmented datagrams are delivered
>   intact, and the unexpected GSO path is confirmed taken;
> - with a sniffer attached to the VRF device, the fake Ethernet header
>   presented to the tap is identical before and after the patch.
> 
> I'll send this as v2 with the fix moved to seg6_local.c. If you'd
> rather drop the skb_unset_mac_header() altogether and accept the
> sniffer behavior change, I'm happy to do that instead.

Thanks Boyan. This sounds good to me too.

