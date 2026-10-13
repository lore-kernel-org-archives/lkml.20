Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F2B221FB6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889591; cv=none; b=qEG1ujx7iZa+RqNQ9MazC8tsCXTdfnjJ/9QEQKmC43NxBqgRscFYoqVIq7tPrIGLfpSnBuen87ULoAXAwocr/zazmK4vKUbkv6+j1Hll/yRmKmRXdxIkXZVwkWOMd421XU4NuMKZPVMm/3vvPNKUrjqoF45b6cM0kT2ZvE/l4bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889591; c=relaxed/simple;
	bh=UyQkmdzDcick2Dn7whRhnwQ46am0jqM+7z6Zh3M0hT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKed2C3RfC/fGngGr4mma0VrPYqgHWfAENAaGb4Devw+F7IkGWv2kQZzz+rRt+5vcth4YMBcqlBNNi2B3DW2vq6UqRnrLqujBtZfNWAyrkoPF5urzXurZR0EhJ8UyL1dfrkii1Jv2yXQm47K/5NomjxPY5n6g4rXgr798QwMkeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=awmaJV8X; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XGPFws9O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="awmaJV8X";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XGPFws9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791889587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hg0nkgC/H/qP4EBezsTJwBXZCXWQIzyamudmANQSzco=;
	b=awmaJV8Xmphf9CyT6KRzFwe9Uby8zkMbHsIYQFYdOkCVmT+xAHym8oLBPpExaSOb0igU8n
	mlmrkrxE7ihWGeQ5pUufIdm7ItN3D2H5Nf/xMhp9LVr62N92DFBn+ftH2cnXPGFuFGmF8h
	1F54Oi03QCYjHU5p3KgrGfoPDKfpV/Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-vwGsVBmhNOacWQVa3y3EuA-1; Tue, 13 Oct 2026 11:06:25 +0000
X-MC-Unique: vwGsVBmhNOacWQVa3y3EuA-1
X-Mimecast-MFC-AGG-ID: vwGsVBmhNOacWQVa3y3EuA_1791889585
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48b09f01f56so1734447f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791889584; x=1792494384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hg0nkgC/H/qP4EBezsTJwBXZCXWQIzyamudmANQSzco=;
        b=XGPFws9OoIvPDNHlNjQnJtiqpE60/6UE5LgDOyrQX17ES25HIAAPBs4Gd4UEvhvly6
         umKkg1QfXYUgPv0Pl/dAedeShYqN2FWWOWVk+OGTU3V0X7q3HZ2zn1un8OIwZNdIYGt+
         NOh9sZesEgB4iLHs53t5k71Frb4D/QzymltC2ypuLjZdrkb37WweF2vh3EkrR+8Kk1uy
         oPiiKc3fvXygeScl+vB3ZVyqhSleF9w3EioUOZab5ujxqcJaS5d3jJvL4bLJCrqDHKtq
         1wdmb74aDig82pAZi9FDa7cj7o+2vTcc54QNpPbE0xY/O+86JUjsA5SruAlOYyFL4nBi
         xNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889584; x=1792494384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hg0nkgC/H/qP4EBezsTJwBXZCXWQIzyamudmANQSzco=;
        b=pFC1kRZ5l+eVgA6zpfeDKSntP4X+Z0U7Au8L0GZZWxz8rBzZ8+0704sUyN0YCl4bOA
         D7y8w0uw5N9w27MEU7e1T5/lpGq0WewfRqZfj/j2+3v273hyVreqktpSJeV7nojzoXOq
         WnrqaGywyEupaSiUTDk7sLAfZkGq+lfeKMN6GgF3CYnTkER57Wxl3BTziumBjopCKYPQ
         hInIiGDymNU923Fj3Ti4jPNzd7Y4wDeEexa4xHyY0HsDvS91dyEuzDx5HC8ODkA8IdqU
         7JUnIbqqbQMtefBxIAWtQJdK95//hcDCV0ZIyQcdB0AK3dO2PK/Jju5lYTbgCcouWjLp
         pA6w==
X-Gm-Message-State: AFq9FYIOX7ENrfHqt5zKRW9W5Vv5WLOvLGlbHcd9amiWnPsHVBbcUrAk
	cFCGCL5P+j0xDGl8MCXCMVRfNK9qQbGMku70LnKbcoqpJkRQuA/z4pk0YhfKlKRDKuTFMG0hMu1
	0nKiNzGeR3XpTkec45d3r0j7qPez6StIGb/Qk3r8kE+YHfsaos6tjpnjoCyWIg510E50YMtyQU+
	riiF659MCw0g4096FGtagQRawxNe2c1JMgirKx86fOTH8=
X-Gm-Gg: AYBFou25dKEBRQ32390jKkj6m5CLALwo5nf4A0+TAQBsY7i0h2E5iEeJ4Jxoc/ZurL6
	uGcqWi+2N+Tefj/TAi1ndCWbvmW3uXwIQOEe5skg1wiiIgxEIrkn/juK32WJgMHGD6AZq2TvS22
	aRf0jQv6b8/LCDywK6KCBe8AymuWM67Z71aKlLOe43hYQc+u26OXab3zvZFXLYo4TjmkxIdHmTQ
	xY7QRrdRQzn77ebX6xiZPKnybZ2oXnvUN2P6yG+Q4oTTvceLs3eDoQm3u5NIFvAhdZgvnLL8ZCA
	fRmFcQ/7CFAuxzEtdX5M2q860ZyqMsDhYdk9nCmo2szt8IAQdL0eM2aqh4p22cDqRbSlrg==
X-Received: by 2002:a5d:62d1:0:b0:488:898b:5c78 with SMTP id ffacd0b85a97d-48dbacdaa8cmr16842467f8f.29.1791889584409;
        Tue, 13 Oct 2026 04:06:24 -0700 (PDT)
X-Received: by 2002:a5d:62d1:0:b0:488:898b:5c78 with SMTP id ffacd0b85a97d-48dbacdaa8cmr16842391f8f.29.1791889583710;
        Tue, 13 Oct 2026 04:06:23 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de096922dsm3712960f8f.8.2026.10.13.04.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:06:23 -0700 (PDT)
Date: Tue, 13 Oct 2026 07:06:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH net-next 3/4] net: resolve uncommon partial checksums at
 ingress
Message-ID: <20261013070549-mutt-send-email-mst@kernel.org>
References: <cover.1791887415.git.mst@redhat.com>
 <e12c6a45aae251d1642af55d8d3121e554993a66.1791887415.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e12c6a45aae251d1642af55d8d3121e554993a66.1791887415.git.mst@redhat.com>

On Tue, Oct 13, 2026 at 06:58:41AM -0400, Michael S. Tsirkin wrote:
> A virtio net header can place CHECKSUM_PARTIAL at any in-packet
> offset.  If that state is retained, later checksum completion can
> modify the packet after protocol processing has made decisions from it.
> 
> Let's fix that: let's validate csum_start and csum_offset and only keep
> CHECKSUM_PARTIAL when csum_start and csum_offset match a parsed TCP or
> UDP header, while handling VLAN headers, IPv4 options and IPv6 extension
> headers.  Complete other non-GSO checksums immediately, before any
> protocol processing runs.
> 
> We can't easily "complete the checksum" for GSO we don't recognize - GSO
> assumes knowledge of the protocol. We could segment ignoring the
> checksum then do whatever csum_start and csum_offset say, but that
> seems like an overkill for something that should happen.
> 
> UDP tunnel headers get the same handling on the inner header.
> 
> Packets without VIRTIO_NET_HDR_F_NEEDS_CSUM are unaffected.
> 
> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Assisted-by: LLM


I forgot reported-by tags:

Reported-by: Paulos Yibelo <habte.yibelo@gmail.com>
Reported-by: Chris Arges <carges@cloudflare.com>


> ---
>  include/linux/virtio_net.h | 151 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 133 insertions(+), 18 deletions(-)
> 
> diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
> index d6466f96cdd00..b181183118b3a 100644
> --- a/include/linux/virtio_net.h
> +++ b/include/linux/virtio_net.h
> @@ -5,7 +5,11 @@
>  #include <linux/if_vlan.h>
>  #include <linux/ip.h>
>  #include <linux/ipv6.h>
> +#include <linux/netdevice.h>
>  #include <linux/udp.h>
> +#include <net/gso.h>
> +#include <net/ip.h>
> +#include <net/ipv6.h>
>  #include <net/tcp.h>
>  #include <uapi/linux/tcp.h>
>  #include <uapi/linux/virtio_net.h>
> @@ -48,15 +52,111 @@ static inline int virtio_net_hdr_set_proto(struct sk_buff *skb,
>  	return 0;
>  }
>  
> +/* Does checksum metadata match a known TCP or UDP header? */
> +static inline bool
> +virtio_net_csum_partial_ok_at_offset(struct sk_buff *skb, u8 hdr_gso_type,
> +				     unsigned int nhoff, __be16 proto)
> +{
> +	unsigned int thoff;
> +	int ip_proto;
> +
> +	if (proto == htons(ETH_P_IP)) {
> +		const struct iphdr *iph = ip4_parse(skb, nhoff, &thoff);
> +
> +		if (!iph || ip_is_fragment(iph))
> +			return false;
> +		ip_proto = iph->protocol;
> +	} else if (proto == htons(ETH_P_IPV6)) {
> +		const struct ipv6hdr *iph;
> +		int flags = 0;
> +
> +		if (!pskb_may_pull(skb, nhoff + sizeof(*iph)))
> +			return false;
> +		iph = (const void *)(skb->data + nhoff);
> +		if (iph->version != 6)
> +			return false;
> +		thoff = nhoff + sizeof(*iph);
> +		ip_proto = iph->nexthdr;
> +		if (ip_proto != IPPROTO_TCP && ip_proto != IPPROTO_UDP) {
> +			thoff = nhoff;
> +			ip_proto = ipv6_find_hdr(skb, &thoff, -1, NULL,
> +						 &flags);
> +			if (ip_proto < 0 || flags & IP6_FH_F_FRAG)
> +				return false;
> +		}
> +	} else {
> +		return false;
> +	}
> +
> +	if (skb_checksum_start_offset(skb) != thoff)
> +		return false;
> +
> +	switch (ip_proto) {
> +	case IPPROTO_TCP:
> +		if (skb->csum_offset != offsetof(struct tcphdr, check) ||
> +		    !pskb_may_pull(skb, thoff + sizeof(struct tcphdr)))
> +			return false;
> +		break;
> +	case IPPROTO_UDP:
> +		if (skb->csum_offset != offsetof(struct udphdr, check) ||
> +		    !pskb_may_pull(skb, thoff + sizeof(struct udphdr)))
> +			return false;
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	switch (hdr_gso_type & ~VIRTIO_NET_HDR_GSO_ECN) {
> +	case VIRTIO_NET_HDR_GSO_NONE:
> +		return true;
> +	case VIRTIO_NET_HDR_GSO_TCPV4:
> +		return proto == htons(ETH_P_IP) && ip_proto == IPPROTO_TCP;
> +	case VIRTIO_NET_HDR_GSO_TCPV6:
> +		return proto == htons(ETH_P_IPV6) && ip_proto == IPPROTO_TCP;
> +	case VIRTIO_NET_HDR_GSO_UDP:
> +	case VIRTIO_NET_HDR_GSO_UDP_L4:
> +		return ip_proto == IPPROTO_UDP;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static inline bool
> +virtio_net_csum_partial_ok(struct sk_buff *skb, u8 hdr_gso_type)
> +{
> +	unsigned int nhoff;
> +	__be16 proto;
> +
> +	if (skb->dev->type == ARPHRD_ETHER) {
> +		if (!pskb_may_pull(skb, ETH_HLEN))
> +			return false;
> +		nhoff = ETH_HLEN;
> +		proto = eth_hdr(skb)->h_proto;
> +		if (eth_type_vlan(proto)) {
> +			proto = __vlan_get_protocol(skb, proto, &nhoff);
> +			if (!proto)
> +				return false;
> +		}
> +	} else {
> +		nhoff = skb_network_offset(skb);
> +		proto = skb->protocol;
> +	}
> +
> +	return virtio_net_csum_partial_ok_at_offset(skb, hdr_gso_type, nhoff,
> +						   proto);
> +}
> +
>  static inline int __virtio_net_hdr_to_skb(struct sk_buff *skb,
>  					  const struct virtio_net_hdr *hdr,
> -					  bool little_endian, u8 hdr_gso_type)
> +					  bool little_endian, u8 hdr_gso_type,
> +					  bool need_csum_check)
>  {
> -	unsigned int nh_min_len = sizeof(struct iphdr);
> +	typeof(skb->transport_header) old_transport = skb->transport_header;
>  	unsigned int gso_type = 0;
>  	unsigned int thlen = 0;
>  	unsigned int p_off = 0;
>  	unsigned int ip_proto;
> +	bool csum_partial_ok = true;
>  
>  	if (hdr_gso_type != VIRTIO_NET_HDR_GSO_NONE) {
>  		switch (hdr_gso_type & ~VIRTIO_NET_HDR_GSO_ECN) {
> @@ -69,7 +169,6 @@ static inline int __virtio_net_hdr_to_skb(struct sk_buff *skb,
>  			gso_type = SKB_GSO_TCPV6;
>  			ip_proto = IPPROTO_TCP;
>  			thlen = sizeof(struct tcphdr);
> -			nh_min_len = sizeof(struct ipv6hdr);
>  			break;
>  		case VIRTIO_NET_HDR_GSO_UDP:
>  			gso_type = SKB_GSO_UDP;
> @@ -104,11 +203,11 @@ static inline int __virtio_net_hdr_to_skb(struct sk_buff *skb,
>  
>  		if (!skb_partial_csum_set(skb, start, off))
>  			return -EINVAL;
> -		if (skb_transport_offset(skb) < nh_min_len)
> -			return -EINVAL;
> +		if (need_csum_check)
> +			csum_partial_ok =
> +				virtio_net_csum_partial_ok(skb, hdr_gso_type);
>  
> -		nh_min_len = skb_transport_offset(skb);
> -		p_off = nh_min_len + thlen;
> +		p_off = skb_transport_offset(skb) + thlen;
>  		if (!pskb_may_pull(skb, p_off))
>  			return -EINVAL;
>  	} else if (gso_type) {
> @@ -158,8 +257,6 @@ static inline int __virtio_net_hdr_to_skb(struct sk_buff *skb,
>  		case SKB_GSO_UDP_L4:
>  			if (!(hdr->flags & VIRTIO_NET_HDR_F_NEEDS_CSUM))
>  				return -EINVAL;
> -			if (skb->csum_offset != offsetof(struct udphdr, check))
> -				return -EINVAL;
>  			if (skb->len - p_off > gso_size * UDP_MAX_SEGMENTS)
>  				return -EINVAL;
>  			if (gso_type != SKB_GSO_UDP_L4)
> @@ -167,10 +264,6 @@ static inline int __virtio_net_hdr_to_skb(struct sk_buff *skb,
>  			break;
>  		case SKB_GSO_TCPV4:
>  		case SKB_GSO_TCPV6:
> -			if (skb->ip_summed == CHECKSUM_PARTIAL &&
> -			    skb->csum_offset != offsetof(struct tcphdr, check))
> -				return -EINVAL;
> -
>  			BUILD_BUG_ON(TCP_MIN_GSO_SIZE * GSO_MAX_SEGS < GSO_MAX_SIZE);
>  			gso_size = max(gso_size, TCP_MIN_GSO_SIZE);
>  			break;
> @@ -191,6 +284,17 @@ static inline int __virtio_net_hdr_to_skb(struct sk_buff *skb,
>  		}
>  	}
>  
> +	if ((hdr->flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) && !csum_partial_ok) {
> +		int err;
> +
> +		if (skb_is_gso(skb))
> +			return -EINVAL;
> +
> +		err = skb_checksum_help(skb);
> +		skb->transport_header = old_transport;
> +		return err;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -198,7 +302,8 @@ static inline int virtio_net_hdr_to_skb(struct sk_buff *skb,
>  					const struct virtio_net_hdr *hdr,
>  					bool little_endian)
>  {
> -	return __virtio_net_hdr_to_skb(skb, hdr, little_endian, hdr->gso_type);
> +	return __virtio_net_hdr_to_skb(skb, hdr, little_endian,
> +				       hdr->gso_type, true);
>  }
>  
>  /* This function must be called after virtio_net_hdr_from_skb(). */
> @@ -293,6 +398,7 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
>  	unsigned int inner_nh, outer_th, inner_th;
>  	unsigned int inner_l3min, outer_l3min;
>  	u8 gso_inner_type, gso_tunnel_type;
> +	__be16 inner_proto;
>  	bool outer_isv6, inner_isv6;
>  	int ret;
>  
> @@ -334,7 +440,7 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
>  
>  	/* Let the basic parsing deal with plain GSO features. */
>  	ret = __virtio_net_hdr_to_skb(skb, hdr, true,
> -				      hdr->gso_type & ~gso_tunnel_type);
> +				      hdr->gso_type & ~gso_tunnel_type, false);
>  	if (ret)
>  		return ret;
>  
> @@ -352,8 +458,8 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
>  			return -EINVAL;
>  	}
>  
> -	skb_set_inner_protocol(skb, inner_isv6 ? htons(ETH_P_IPV6) :
> -						 htons(ETH_P_IP));
> +	inner_proto = inner_isv6 ? htons(ETH_P_IPV6) : htons(ETH_P_IP);
> +	skb_set_inner_protocol(skb, inner_proto);
>  	if (hdr->flags & VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM) {
>  		if (!tnl_csum_negotiated)
>  			return -EINVAL;
> @@ -368,7 +474,16 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
>  	skb->inner_mac_header = inner_nh + skb_headroom(skb);
>  	skb->transport_header = outer_th + skb_headroom(skb);
>  	skb->encapsulation = 1;
> -	return 0;
> +
> +	if (virtio_net_csum_partial_ok_at_offset(skb, gso_inner_type, inner_nh,
> +					       inner_proto))
> +		return 0;
> +
> +	if (skb_is_gso(skb))
> +		return -EINVAL;
> +
> +	ret = skb_checksum_help(skb);
> +	return ret ?: 1;
>  }
>  
>  /* Checksum-related fields validation for the driver */
> -- 
> MST
> 

