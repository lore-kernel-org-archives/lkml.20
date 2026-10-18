Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35B221FF25
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792332993; cv=none; b=hWnEeLAfg8GXPwIWf3x464EX3FdPuU3L86/3l0MkyWaJoaN+MDGpoPpqMJmzuyW5FtY68Wu3X/KrYipOT5ahsi6DlMxRSYvHXUHbYVbEqJttAFurViPovRT7mZ8bA34iSi6gUu0rk1K55XrO0WQ15WrGcF+0u6ttQ9TV9gA76TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792332993; c=relaxed/simple;
	bh=W8vn7NiA5BAvJ8dEFYX46Aidk7UOs5AMvgvxnbQ2tgQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=EMCQ9TFHckqU89xacVFcG0L4YGLmi+/Ltc6UZcBuxnY2uWAADhJZ/FAGru0x+bTjsEt9SyYfpben1PN8UhVTG9NneYu+Ms81ZeYxRo7O+cykseuyTWCjzdsI0FvXK6/kEvsD8PZ8fCFZFetmhWW/vvjqSssO1/PCezedaMu5wFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQAbk4g1; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQAbk4g1"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5e931215e5fso1178603e0c.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792332985; x=1792937785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jVaSw9+ay5U/DMzzP2wiXweasla5TRaQQp0iRi1bG1w=;
        b=ZQAbk4g1Cuyrantow3ZsAYFbVcs/uo1TTu24T1L+lWUTsAuJeGI4+dXVKqDZMzeFoZ
         wQQtgnknZNfaJQiqDPZzUA3KIxmYbu/RXVZ3wVEj936oSgqqMjNKjARrEq9PQun9+FM3
         UF5CWy87JAZHnZeyZ67JwxOt2kpGy4t6el4FkX+KrKm/CnDyAsjG6h8JJqtgxjtwNSkd
         6mRloEOSNa+R/FuW5pRt3L0cUUjhDX2AsJgwqryXByYyBD7VfpfpgkzJj4lHqVGRk77k
         6SMjCxRb1lEBAp+bDUi2Qkf6GEi8Kcp6iZtpxaU7sjTGo+YE0BoKta1KR7K8/ZMe5jkV
         jxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792332985; x=1792937785;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVaSw9+ay5U/DMzzP2wiXweasla5TRaQQp0iRi1bG1w=;
        b=bk+k17KNLoa36+4pZvPvg/UGTokVxrACjfCj86YdfnO105rI9Xb1N9b7EQJUrk0x45
         2AYoBbCkc25MG0GbmC25E+f4zRZez5qSEC7T7bYdS5VGw/fJp6vxwFgsnMgou0fQNVI/
         qnj8X71RUkKLo8pC5lnPCq9pWdjcACAF90+LzOT6bc9VqLO29wfjso0F/OZ6CZrh+zKN
         BIN8gkhDgVz5u+TAYZOPuUOrTCmwGr/fCzvdax7Pg5RUzUVWGTkCxTlXUEFnuTmXiiLF
         p1WiUkD/cDVDt7OvadKj/+2qF+ypWGktsrg7iE8JTlwXYE6bJGwTaLFQLELoED6Y1hyp
         iQ6Q==
X-Forwarded-Encrypted: i=1; AKwUvBw80fSSZV4ypRJTFpJFWmrcD2yq5q4wnOzQ0inPiYQyMJ7eeXDniOOLmJxQBdYg0gYY/VwZsjG+HW0WWlA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZhayx2lbOAsfDJxFMfeYG4Pzi7r8OMfrN1/uEUpL1d75P8Zj8
	p8yXXv1wlISpXHOrr1VjEiXUGWlEBBYlTgPWCM4vOhHt+n6mO3VgmJmU
X-Gm-Gg: AYBFou0LVPjBW2tW5eZTBJNhgVdh5J5Qnkz63AkU8NEq5gEpd5wdWMjTwifA0wXNujJ
	dqMfZwrgYBPMa1iYIa5fIGxOTtNXUchXjDA3JnU7aGmJqXxf0ix/dhM8u2QwyKhMHlC3w9cz4SL
	KyxPgs3dC2A15sb3q2oXjsk2Y/bKDgEArzMJPYSv1r0+lKwqRqAzijBPtkpOinb1Vpxp8gb9MTW
	nAhGVKTN+OxEKNYP4Le/zVKjbBvWP3URSR11VciiLo3XKeiJWwXnpdyarzPiOM+gormSgun4aXk
	gkvQdSPAx3Y4XZnmfb0P1bJYwHFrw0CV9TAzQr3Cs9UuE0mtayCj6/uzQSqder8dt7ldNm2dloD
	xsjuVVPIaPdhEVlGzu3Py9clkKtKiV7Y1E+GctVoAighuYRWCo66JxPShhGT85sglBVNcpCH5iQ
	IfaoL+QMPtIcvaKYYP6qBetIBvBdBDEIFGFxakh1rwRyFXHBFjrztZdv3hBp816LfgAZQR/jBzq
	3JdbvGVOl5uxUbaHzhZLnJwOtmafA6p7UgpSEOeVOyKqaIl2QL/xOJYQGzh1M4POIiHyW+i2NUi
	hV0JJGnYeR+4IhR/ANtvUobKj2Ap1El3PLrRLQ==
X-Received: by 2002:a05:6102:549e:b0:7a0:eb10:79b5 with SMTP id ada2fe7eead31-7cc3691f4e1mr1759603137.10.1792332985368;
        Sun, 18 Oct 2026 07:16:25 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc1928aef3sm7607647137.0.2026.10.18.07.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:16:24 -0700 (PDT)
Date: Sun, 18 Oct 2026 10:16:23 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemb@google.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 netdev@vger.kernel.org
Message-ID: <willemdebruijn.kernel.3a3160b92eb96@gmail.com>
In-Reply-To: <b714fa38ab650b313ca3121cd4cb3ee847d06a0d.1792327180.git.mst@redhat.com>
References: <b714fa38ab650b313ca3121cd4cb3ee847d06a0d.1792327180.git.mst@redhat.com>
Subject: Re: [PATCH net-next] net: gso: validate transport header before
 computing segment length
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Michael S. Tsirkin wrote:
> If a TCP GSO packet is processed in the stack before a transport

TSO

> header was ever established, the TCP data offset is read through the
> unset header offset, far outside the packet.
> 
> This was demonstrated by syzkaller, back when the input path did not
> dissect such packets: a virtio net header supplying a malformed
> network header was enough.  Qdisc length estimation has carried a
> guard against exactly this since a0dce8752193 ("net: Skip GSO
> length estimation if transport header is not set"); the GSO length
> validators never got one.
> 
> We used to, but we no longer allow such packets in: since 44378d02c5aa
> ("net: always dissect GSO packets in __virtio_net_hdr_to_skb()") the
> virtio net input path dissects all GSO packets.
> 
> But as a defence in depth measure, let's also check before we read: if
> the TCP header is unset or outside the linear data, drop it.
> 
> Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
> Cc: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> Can be net or net-next, but given we have Eric's patch in net already,
> net-next seems more appropriate, and it's safer.
> 
>  include/linux/skbuff.h |  5 +++++
>  net/core/gso.c         | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index a3ff380d43f0..aa5bc608de06 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -3041,6 +3041,11 @@ static inline bool skb_inner_network_header_was_set(const struct sk_buff *skb)
>  	return skb->inner_network_header > 0;
>  }
>  
> +static inline bool skb_inner_transport_header_was_set(const struct sk_buff *skb)
> +{
> +	return skb->inner_transport_header > 0;

skb_transport_header_was_set has

        return skb->transport_header != (typeof(skb->transport_header))~0U;

is that initialization different for inner_transport_header?
If so, slightly confusing. But also understandable that zero is the
default initialization, I guess.

> +}
> +
>  static inline unsigned char *skb_inner_mac_header(const struct sk_buff *skb)
>  {
>  	return skb->head + skb->inner_mac_header;
> diff --git a/net/core/gso.c b/net/core/gso.c
> index e96ef6350064..d98acfd68595 100644
> --- a/net/core/gso.c
> +++ b/net/core/gso.c
> @@ -131,6 +131,36 @@ struct sk_buff *__skb_gso_segment(struct sk_buff *skb,
>  }
>  EXPORT_SYMBOL(__skb_gso_segment);
>  
> +/*
> + * GSO processing (but not UDP/SCTP GSO, which uses fixed header

TSO

> + * sizes) reads the TCP header as specified by
> + * skb->transport_header/inner_transport_header.  Make sure it is
> + * there to read.
> + */
> +static bool skb_gso_transport_header_ok(const struct sk_buff *skb)
> +{
> +	const struct skb_shared_info *shinfo = skb_shinfo(skb);
> +	unsigned int thoff;
> +
> +	if (likely(!(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))))
> +		return true;

The likely case for GSO is TSO.

> +
> +	if (skb->encapsulation) {
> +		if (!skb_inner_transport_header_was_set(skb))
> +			return false;
> +
> +		thoff = skb_inner_transport_offset(skb);
> +	} else {
> +		if (!skb_transport_header_was_set(skb))
> +			return false;
> +
> +		thoff = skb_transport_offset(skb);
> +	}

This is not GSO specific. Could be a helper in skbuff.h?
> +
> +	/* A negative offset converts to a huge value and fails. */
> +	return thoff + sizeof(struct tcphdr) <= skb_headlen(skb);
> +}
> +
>  /**
>   * skb_gso_transport_seglen - Return length of individual segments of a gso packet
>   *
> @@ -253,6 +283,9 @@ static inline bool skb_gso_size_check(const struct sk_buff *skb,
>   */
>  bool skb_gso_validate_network_len(const struct sk_buff *skb, unsigned int mtu)
>  {
> +	if (unlikely(!skb_gso_transport_header_ok(skb)))
> +		return false;
> +

seems weird to test a transport header feature in a network
header test?

Should this instead where it is needed?

>  	return skb_gso_size_check(skb, skb_gso_network_seglen(skb), mtu);
>  }
>  EXPORT_SYMBOL_GPL(skb_gso_validate_network_len);
> @@ -268,6 +301,9 @@ EXPORT_SYMBOL_GPL(skb_gso_validate_network_len);
>   */
>  bool skb_gso_validate_mac_len(const struct sk_buff *skb, unsigned int len)
>  {
> +	if (unlikely(!skb_gso_transport_header_ok(skb)))
> +		return false;
> +

even more so in a link layer header test

>  	return skb_gso_size_check(skb, skb_gso_mac_seglen(skb), len);
>  }
>  EXPORT_SYMBOL_GPL(skb_gso_validate_mac_len);
> -- 
> MST
> 


