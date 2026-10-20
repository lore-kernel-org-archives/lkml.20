Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523446;
	b=3wGyJSBN2nDYdfNmlCj4RTGzQwTE22rE2Ojo7iMw9OAPJXZMmWHP+jRfQS+Cogh5wPgm
	 Q5HdOtjOb/y3QVVuO52zBFzDJ2jNUqKLAZDWof240QNp7xWEIHCY26HVbOEhCksFc8mvu
	 613LSd/JL+LEj7gw17EXNkHV7Jj8oqmLF92lQCuVT4CH9zennkPy2VbNhQAIt4P/0rfAD
	 KwBKtFOcuueT2RL6Ig+QLUiAhS5w0nuLgAvEPJ00LqnELT7OWrouPBBa6E9SS7uIJDVLo
	 K6pP4rwGtUgXLlrOOoYmYwHFxPjGgc+/eBYDf0ahy1zJ6ypcKWePq9fOWGaw2nr0j/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tQS2FN8JQ42IhOSeHQbcnX+yVhuf3CDEMlpJxq9g1kI=;
	b=zOA+BySw4jgwv3ETcXEMlUxWmCLn5frcbDlv/H75HrTBqt5/jDUmKMEn95PZun0f2aZM
	 iHTTAbUBHFYTRUB05uXB3gRIf/lkj+8MvYH8nb89Tz7sZr4V6e8WYyh6XNPKWfhXnfu1T
	 x60qy3iTrJPM8z8ZG0iGzFXmnbD34a8LRJ+v5eX7NqVWwdu6htmO/Nv03E1l0bM6TbmKY
	 6/MvD1eVPifSPTGs+qzC5YbwzpS+U/q2J8kMXQQtbCNlmN4Mz8QLhrGeHFOuQq0qySBMz
	 wUlonTzk4jPrOZL0t/qySBkbXaEJdYohdk2aCRgpxp1PAKSHmL4NqPSBNnWopKSnk9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YAf4RO0J;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDDE606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CDDE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YAf4RO0J
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-78fb1fb9508so697997137.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523445; x=1793128245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tQS2FN8JQ42IhOSeHQbcnX+yVhuf3CDEMlpJxq9g1kI=;
        b=YAf4RO0JkhUM1fp1rRSEgHyi0KG+7Q86qjZzz0NjQ9yl4Vmk10QLTX7AbzvwqyBjMT
         RPipHAYldqpPZK1+cR+sKJtMZi/yR8iZs+1+fiK2basFZM7I8jgewMavfyQVygSSRMuV
         4Qq4hwayQiPBcZtrKO8KAgpTdKFrwz65+jq4i4HpCY1HjW3IRHvCUJYzlLVeooaS9MjN
         6e7Dp9qSRsBjHgfi2WvRa7x2TyDvsr29aFEgbThQt1xgTCQG2yvdj64q+PMpRRVRdQoZ
         U12rdZKjuMzC4taJchi+eaXQsYJowuPXXa7hpO4UUt05m2sHubip8P7Z7UO9nTEkbD5n
         aDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523445; x=1793128245;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQS2FN8JQ42IhOSeHQbcnX+yVhuf3CDEMlpJxq9g1kI=;
        b=xJOVkGcUVpAc6UUljAW4HWzQmES+BS9b8BAqhSdZMcOvWyF+7pHG/5uKBobVWnb08H
         z7oL5bGqq78Dx7qPuXwgoNYz7wK97OhWw6uC/xxcMFiJuD6uTkfG838GkBw4Qxh96TUp
         +xsq8BF1SNoJ2eJSqBXE6Xai7w2aMRDZqXNV/4hSncvM9o77aaB8iz+brOg6WP4xmDb8
         mTKCDvpPKggEoOLaaV6ZHBnVBlBtAMSptW7oYMr8kEKHiLN5C938nAAK2pFZzIBjfJDO
         6oWKx2I05b7UboA+4tT4vCf+uWLpDREHGBSAjV7O6wYsKQu2Ni5k3q9wWbE0K+s7Fj2L
         Atdw==
X-Forwarded-Encrypted: i=1; AKwUvBxWxPQhnIVfB/cVlEgeTgWNzr1OXziFpLjXUUuX0A6uO4iQos5b4CVoIpIZ2XU2Lh4C0bDcc/OpQf9aHng=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrYRWT//+w8ACbvulI14u8mwGbHRBFxSfaDVjY3SqL1LertuPv
	l13zxYacQzIRnBAqejJd3ljOshWB/ocbUL0XtY+38zC3x9OcckL2g5Ew
X-Gm-Gg: AYBFou1PA3y3robg2ShxxSpd0ARDtKQ18z8KQsEY0p+mvBmF0AZHd67S9cCyFtPDAsF
	JxNxZOu/LsZyr3G8vZYmIntiAZsmWC31hqlBNuKdnGMdW0lFDj5IdjoruBP+TPq17AZC9aypS7F
	jsLx9riETdc4wcboajfyyMBO8xGWcRka8CoDmkgOi6Qgq4ZbWSnkxyhZSEreyehOWuTXL3GzLKE
	SiRa+LqLb7yljwkNIkQ0+3yHoyT4+j/uvWG4FDBReheK7DYdvpfzCNQesWhfsHicz7fO3WYQEIR
	FDpE2Qoiw8yow/9SIcjjWHs9WN4ATFgXom8yDerbUDkebjWIb0xB7Y6MHxg+sHzCNcogjwCBEdq
	rW8jdXGa+olM6gV4mTf0gH9rEFiDIPhONv9VtHXkFYApKfM1hSWzK3LWISuKYOHrSy8mjd/UhsU
	NzXDN//5Wp6ZsJ57Tweg4Pe4uL88c1o2RUdgFpBxZdQvx+Fge3ybcnNPNe4FT4QcXRtJGwJoi5t
	Mrnl1vlVZVWPgb9znqjFrQ9rpXNV7jr9HfKkXopoXRgRd66Peb7DmNtEJm02n7W9irXDVqQKUtp
	xjj5lj5C7HdB6IL1Cl4Upu2lIExY+gVWvF94PMA=
X-Received: by 2002:a05:6102:8645:10b0:7a9:e680:efd5 with SMTP id ada2fe7eead31-7cc7bca6de0mr523697137.28.1792523444982;
        Tue, 20 Oct 2026 12:10:44 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d0e116a5sm667068241.2.2026.10.20.12.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:10:44 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:10:43 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemb@google.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 netdev@vger.kernel.org
Message-ID: <willemdebruijn.kernel.2909e80133e26@gmail.com>
In-Reply-To: <a53dbcdf068b3813689cf2359949578f627f9edd.1792410745.git.mst@redhat.com>
References: <a53dbcdf068b3813689cf2359949578f627f9edd.1792410745.git.mst@redhat.com>
Subject: Re: [PATCH net v2] net: gso: validate transport header before
 computing segment length
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

Michael S. Tsirkin wrote:
> If a TSO packet is processed in the stack before a transport
> header was ever established, the TCP data offset is read through the
> unset header offset, far outside the packet.
> 
> This was demonstrated by syzkaller, back when the input path did not
> dissect such packets: a virtio net header supplying a malformed
> network header was enough.  Qdisc length estimation has carried a
> guard against exactly this since a0dce8752193 ("net: Skip GSO

please insert commit here and before 44378d02c5aa. I'm surprised
checkpatch did not complain.

> length estimation if transport header is not set"); the GSO length
> validators never got one.
> 
> We used to, but we no longer allow such packets in: since 44378d02c5aa
> ("net: always dissect GSO packets in __virtio_net_hdr_to_skb()") the
> virtio net input path dissects all GSO packets.
> 
> But as a defence in depth measure, let's also check before we read: if
> the TCP header is unset or outside the linear data, drop it.

is the packet indeed dropped?

> 
> Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
> Cc: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> changes from v1:
> - address Willem's comments, in particular, teach skb_gso_network_seglen
>   to return a negative error, and propagate through callers.
> 
>  include/linux/skbuff.h |  5 +++
>  net/core/gso.c         | 82 ++++++++++++++++++++++++++++++++++++------
>  2 files changed, 77 insertions(+), 10 deletions(-)
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
> +}

It may be possible that skb_reset_inner_headers gets called when
skb->transport_header is ~0U. For safety, also check ~0U here?

>  static inline unsigned char *skb_inner_mac_header(const struct sk_buff *skb)
>  {
>  	return skb->head + skb->inner_mac_header;
> diff --git a/net/core/gso.c b/net/core/gso.c
> index e96ef6350064..874e4c8b1f1b 100644
> --- a/net/core/gso.c
> +++ b/net/core/gso.c
> @@ -131,6 +131,35 @@ struct sk_buff *__skb_gso_segment(struct sk_buff *skb,
>  }
>  EXPORT_SYMBOL(__skb_gso_segment);
>  
> +/*
> + * TSO processing (but not UDP/SCTP GSO, which uses fixed header
> + * sizes) reads the TCP header as specified by
> + * skb->transport_header/inner_transport_header.  Make sure it is
> + * there to read.
> + */
> +static bool skb_gso_transport_header_ok(const struct sk_buff *skb)
> +{
> +	const struct skb_shared_info *shinfo = skb_shinfo(skb);
> +	int thoff;
> +
> +	if (unlikely(!(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))))
> +		return true;

maybe skb_tso_transport_header_ok given this limitation
> +
> +	if (skb->encapsulation) {
> +		if (!skb_inner_transport_header_was_set(skb))
> +			return false;
> +
> +		thoff = skb_inner_transport_offset(skb);

skb_gso_transport_seglen reads both transport_offset and
inner_transport_offset, so if skb->encapsulation we probably should
not check only inner, but both?

> +	} else {
> +		if (!skb_transport_header_was_set(skb))
> +			return false;
> +
> +		thoff = skb_transport_offset(skb);
> +	}
> +
> +	return thoff >= 0 && thoff + sizeof(struct tcphdr) <= skb_headlen(skb);
> +}
> +
>  /**
>   * skb_gso_transport_seglen - Return length of individual segments of a gso packet
>   *
> @@ -140,12 +169,18 @@ EXPORT_SYMBOL(__skb_gso_segment);
>   * individual segments, including Layer4 headers (TCP/UDP).
>   *
>   * The MAC/L2 or network (IP, IPv6) headers are not accounted for.
> + *
> + * Return: the length, or a negative errno if the TCP header is not
> + * there to read.
>   */
> -static unsigned int skb_gso_transport_seglen(const struct sk_buff *skb)
> +static int skb_gso_transport_seglen(const struct sk_buff *skb)
>  {
>  	const struct skb_shared_info *shinfo = skb_shinfo(skb);
>  	unsigned int thlen = 0;
>  
> +	if (unlikely(!skb_gso_transport_header_ok(skb)))
> +		return -EINVAL;
> +
>  	if (skb->encapsulation) {
>  		thlen = skb_inner_transport_header(skb) -
>  			skb_transport_header(skb);
> @@ -175,13 +210,21 @@ static unsigned int skb_gso_transport_seglen(const struct sk_buff *skb)
>   * individual segments, including Layer3 (IP, IPv6) and L4 headers (TCP/UDP).
>   *
>   * The MAC/L2 header is not accounted for.
> + *
> + * Return: the length, or a negative errno if the TCP header is not
> + * there to read.
>   */
> -static unsigned int skb_gso_network_seglen(const struct sk_buff *skb)
> +static int skb_gso_network_seglen(const struct sk_buff *skb)
>  {
> -	unsigned int hdr_len = skb_transport_header(skb) -
> -			       skb_network_header(skb);
> +	unsigned int hdr_len;
> +	int tlen = skb_gso_transport_seglen(skb);

nit: reverse xmas tree

>  
> -	return hdr_len + skb_gso_transport_seglen(skb);
> +	if (tlen < 0)
> +		return tlen;
> +
> +	hdr_len = skb_transport_header(skb) - skb_network_header(skb);
> +
> +	return hdr_len + tlen;
>  }
>  
>  /**
> @@ -192,12 +235,21 @@ static unsigned int skb_gso_network_seglen(const struct sk_buff *skb)
>   * skb_gso_mac_seglen is used to determine the real size of the
>   * individual segments, including MAC/L2, Layer3 (IP, IPv6) and L4
>   * headers (TCP/UDP).
> + *
> + * Return: the length, or a negative errno if the TCP header is not
> + * there to read.
>   */
> -static unsigned int skb_gso_mac_seglen(const struct sk_buff *skb)
> +static int skb_gso_mac_seglen(const struct sk_buff *skb)
>  {
> -	unsigned int hdr_len = skb_transport_header(skb) - skb_mac_header(skb);
> +	unsigned int hdr_len;
> +	int tlen = skb_gso_transport_seglen(skb);
>  
> -	return hdr_len + skb_gso_transport_seglen(skb);
> +	if (tlen < 0)
> +		return tlen;
> +
> +	hdr_len = skb_transport_header(skb) - skb_mac_header(skb);
> +
> +	return hdr_len + tlen;
>  }
>  
>  /**
> @@ -253,7 +305,12 @@ static inline bool skb_gso_size_check(const struct sk_buff *skb,
>   */
>  bool skb_gso_validate_network_len(const struct sk_buff *skb, unsigned int mtu)
>  {
> -	return skb_gso_size_check(skb, skb_gso_network_seglen(skb), mtu);
> +	int seg_len = skb_gso_network_seglen(skb);
> +
> +	if (seg_len < 0)
> +		return false;
> +
> +	return skb_gso_size_check(skb, seg_len, mtu);
>  }
>  EXPORT_SYMBOL_GPL(skb_gso_validate_network_len);
>  
> @@ -268,7 +325,12 @@ EXPORT_SYMBOL_GPL(skb_gso_validate_network_len);
>   */
>  bool skb_gso_validate_mac_len(const struct sk_buff *skb, unsigned int len)
>  {
> -	return skb_gso_size_check(skb, skb_gso_mac_seglen(skb), len);
> +	int seg_len = skb_gso_mac_seglen(skb);
> +
> +	if (seg_len < 0)
> +		return false;
> +
> +	return skb_gso_size_check(skb, seg_len, len);
>  }
>  EXPORT_SYMBOL_GPL(skb_gso_validate_mac_len);
>  
> -- 
> MST
> 


