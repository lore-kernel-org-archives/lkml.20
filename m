Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525478;
	b=rS2l4yw1GijdjTj5Zc2wLBPNZ0evJoh9D0CCHJ5X4fEJcSQ95ILbWTQTq/x2iXsz+UjX
	 2Fa/sxQ8rjwy8B24Ty9rzPMRcoGDp8ma7oM2yZC3RKyE8ewUSrUdb1fXGQ6j1O/vTUet9
	 lO/bMYRCsPNOCw+T7qogFAeOfvaCPG1WW9gy0r/NaH2CLzSnH4QCmZzGMHXsODN67fQhs
	 v2QIq5lYZUHQSdWXSC5S2exC6x9Myf0KTxehvaQdLbTzi5VrooBR4oQG1+sykznbMgqSb
	 A1L/eXbv4M+4ZUcB6McXkaMV+CMxjeUlH6VzeXDA+XTmIVm2ciPNlrupBI8wJjiGavA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Dzmoem720PHBzBWe/Rb7MLiHBpmmRV/01RnquKtib/c=;
	b=XR0ZavO6w51syopChrpaJGOaPe+m+X37nZpiQbZOyyJjKDEecsXj00yu1mN5e8f1p1mr
	 XW3wSEI8ZbUQ4yHkeJE/1bTNfRZoyGRBqV6Tcbb120YY036f10Tj0y3h0JyU77GXamx3w
	 eECsXUIa6A1+9lviowOHGjIFU37D67Nd9zjZbjHUZJoDNUUVIs8CBzskOhquhaWqyCETP
	 W4pSP6i4lSvMIzPm9GtEjTR3Fu5SMMfgE/6ov9Smz5oI73ZpGuUyztSk2hMNlLi3It0me
	 5Os4dUD79zqBxHbZRASGxEGOSso9MvAR9JqQMqEIGjlR98JGp5m13wR+B919u9kLpZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n9eBKnPr;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4667E606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4667E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n9eBKnPr
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eae12762c9so414553e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792525477; x=1793130277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dzmoem720PHBzBWe/Rb7MLiHBpmmRV/01RnquKtib/c=;
        b=n9eBKnPrwa0PSKNL1XlHYIRvmD+RfTtXoQI404bqCLo5xTooqp2piwD7cvKl/Uh7iD
         rVB1EDLplD+YxClmi3UoJYuUeNBKye/T9YULzbem72Kw1H8wOuNijI6HMqBD5l555/28
         5P6S7Ls3ABaeXzPpyf7dCiKtTpwCEbt41OeAsXmKID6lAPnrWpNTmJXAgwsKds0hLTri
         8ROq1vhFa+x9vN2gFfDQLbnbNZ/mLZo4lcIcQL4h117simRHje07+6NXXWxzWzZJoGGM
         mNOfzS+LBzIW5dySrw1wYPnHQJw13lrM0lVipw7BmYxleWI6w0r/Zj6C2yzsMa3T1aC2
         nFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792525477; x=1793130277;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dzmoem720PHBzBWe/Rb7MLiHBpmmRV/01RnquKtib/c=;
        b=ivh20aRAE7yrc2+ZL2eikD3ac3OH4A1vPxjPH1fAPf9JL8PjLhqAE7aLbwj8hYGRqs
         5/4z16JJkIaHO+LCwX9O3ZxMKEZ71ALsPdCgzDBK1r/+qEqkJ2U97iGlI37uM5G53jUI
         qvlSOHEOzCHZVkvbmfx1iYZnllnxWBJHp6RSyB3SOaeA3TiQXX+dyp5Kg2S09Ztk2IHk
         4vI4mNCFJ5tzWyyrGNS5ebj9BrIvZzI+OGyTxsinagVV4jQg6dKMAkgii6bpLkTf+/JB
         Vord7OLk4ppoUMBloIGB8eY/tO7xruzecSQwo3cAuLwROPd+Cm5njoaXr5j0k1v0w8hk
         CmVA==
X-Forwarded-Encrypted: i=1; AKwUvBxqrmqD/DnhDwjPIA588tOmegCJi8K8VfipqtZz3qR3FT47M27r9jkbsm0LdBi0nOLJG9UisJtl5+fr/uw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcTQi9JbFZ6sJGP3tnyFQ6yaKu4MO6YP5MWpx0jXdKlGXkBwu/
	jr08vHkV+TK0kiQPAHJ4d/5rH6S3ogYk2M8mteaB8THMEAuLE+z+32O+
X-Gm-Gg: AYBFou2h/UjZG9Hu45K2Z50vIhgxDMtfIfTTp3DyT87ojGNUH9/hIq0GH2xs89MH8zr
	eWxUtO+Wope2Eyv3KVaL9+1SY7aJd+62JPfEmgvLm5k3wosh6xozRuE+s56wCWL9LA+sshsNdPf
	GG+mAWWFbnMCw4D2nFkHUrdqiXEX4f/RLaFQ6jQKqpMfR7j9rrncClNwUaOFLkXUwT0q6vnsJz6
	XD6bbSsv5XdCdzqkcDU0s5kesJp5eSsHrX7MA4qqzGWg1einGg5SZB9awl0RCjJxbEe2S2u7khZ
	H8QYDdCq1v0uxzFXINIxDH8JH81m0kkLw8IcUFdUIlCRAZAFxA6hvBCOoFKay51qdXCM10C0Kgu
	ckjVlI6zucW1CJ12A8YNMiGkngXdbKG4xDF/RtPF+YbSn5JjAVMdg41+yWG28Pg/rws7BiIQd++
	i6yjRkxEfQYZ/hpKkYw86vrqR6Yg8v+ktwWW/7sQuvlZNmcPwXQndbbcbPcWz920Q3zvhsQHIVE
	gt6Pms8RuTELqjbC8CNM2ihGNF1wJdM2bm1WlGCKkJ+iaq4dFOVNnbn6B5yhiMivzp9l9a2AvdT
	SWr+JHMZlcbw32QsY8KihL50wt1UvaB5yQDl7Q==
X-Received: by 2002:a05:6122:a5c5:20b0:5da:a74:d6a4 with SMTP id 71dfb90a1353d-5eaaa6635a5mr2177159e0c.15.1792525477019;
        Tue, 20 Oct 2026 12:44:37 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae983efe8sm472945e0c.17.2026.10.20.12.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:44:36 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:44:35 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Chris Arges <carges@cloudflare.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Phil Sutter <phil@nwl.cc>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?UTF-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Paulos Yibelo <habte.yibelo@gmail.com>
Message-ID: <willemdebruijn.kernel.2eb449439b094@gmail.com>
In-Reply-To: <9c08d12b3a7819ae03ded6a154e4f908276e93d4.1792411304.git.mst@redhat.com>
References: <cover.1792411304.git.mst@redhat.com>
 <9c08d12b3a7819ae03ded6a154e4f908276e93d4.1792411304.git.mst@redhat.com>
Subject: Re: [PATCH net v3 5/8] net: resolve uncommon partial checksums at
 ingress
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
> As reported first by Paulos Yibelo <habte.yibelo@gmail.com> (after which
> others, credited below, found more ways the bug can affect users) a
> virtio net header can place CHECKSUM_PARTIAL at any in-packet offset.
> If that state is retained, later checksum completion can modify the
> packet after protocol processing has made decisions from it.
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
> seems like an overkill for something that shouldn't happen.
> 
> There's some risk here:
> - non-gso packets which can't be parsed get checksum calculated in
>   software, adding performance overhead
> - gso packets which can't be parsed get dropped
> 
> To mitigate the risks, the following patch will add a sysctl knob to
> bypass the resolution. This is reasonable if the setup is such that
> there is no protocol processing at all.
> 
> UDP tunnel headers get the same handling on the inner header.
> 
> Packets without VIRTIO_NET_HDR_F_NEEDS_CSUM are unaffected.
> 
> Assisted-by: LLM
> Reported-by: Paulos Yibelo <habte.yibelo@gmail.com>
> Reported-by: Chris Arges <carges@cloudflare.com>
> Tested-by: Chris Arges <carges@cloudflare.com>
> Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  include/linux/virtio_net.h | 272 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 268 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
> index 013c6c7e2dea..97b554ef7123 100644
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
> @@ -48,6 +52,198 @@ static inline int virtio_net_hdr_set_proto(struct sk_buff *skb,
>  	return 0;
>  }
>  
> +/* TODO: nothing virtio specific here, move to ip.h */
> +
> +/*
> + * Pull and minimally validate the IPv4 header at @nhoff.
> + * Returns the header and stores the transport header offset in
> + * @thoff, or NULL if truncated or malformed.  Only the fixed header
> + * is guaranteed linear; callers that need the options or the
> + * transport header must pull further.
> + */
> +static inline struct iphdr *virtio_net_ip4_parse(struct sk_buff *skb,
> +						  unsigned int nhoff,
> +						  unsigned int *thoff)
> +{
> +	struct iphdr *iph;
> +
> +	if (!pskb_may_pull(skb, nhoff + sizeof(struct iphdr)))
> +		return NULL;
> +
> +	iph = (struct iphdr *)(skb->data + nhoff);
> +	if (iph->version != 4 ||
> +	    iph->ihl < sizeof(struct iphdr) / sizeof(u32))
> +		return NULL;
> +
> +	*thoff = nhoff + iph->ihl * sizeof(u32);
> +	return iph;
> +}
> +
> +/* Where does the L3 header start, and what protocol is it?
> + * Handles Ethernet and VLAN headers; other devices use the
> + * network header offset the caller set up.
> + */
> +static inline bool
> +virtio_net_l3_start(struct sk_buff *skb, int *nhoff, __be16 *proto)
> +{
> +	/* skb->dev is only guaranteed to be set since 44378d02c5aa
> +	 * ("net: always dissect GSO packets in
> +	 * __virtio_net_hdr_to_skb()"), do not crash when it is not.
> +	 */
> +	if (WARN_ON_ONCE(!skb->dev))
> +		return false;
> +
> +	if (skb->dev->type == ARPHRD_ETHER) {
> +		if (!pskb_may_pull(skb, ETH_HLEN))
> +			return false;
> +		*nhoff = ETH_HLEN;
> +		*proto = eth_hdr(skb)->h_proto;
> +		if (eth_type_vlan(*proto)) {
> +			*proto = __vlan_get_protocol(skb, *proto, nhoff);
> +			if (!*proto)
> +				return false;
> +		}
> +	} else {

loopback uses ARPHRD_LOOPBACK, but expects Ethernet (apparently).
We can add that ARPHRD to the if condition.

> +		*nhoff = skb_network_offset(skb);
> +		/* An unset network header shows up as an offset
> +		 * outside of the packet.
> +		 */
> +		if (*nhoff < 0 || (unsigned int)*nhoff >= skb->len)
> +			return false;
> +		*proto = skb->protocol;
> +		if (!*proto) {
> +			u8 version;
> +
> +			/* A packet socket bound to ETH_P_ALL leaves the
> +			 * protocol unset: infer it from the IP version
> +			 * nibble at the network header.
> +			 */
> +			if (!pskb_may_pull(skb, *nhoff + 1))
> +				return false;
> +			version = skb->data[*nhoff] >> 4;

is this endian specific? maybe just cast to iphdr

> +			if (version == 4)
> +				*proto = htons(ETH_P_IP);
> +			else if (version == 6)
> +				*proto = htons(ETH_P_IPV6);
> +		}
> +	}
> +	return true;
> +}
> +
> +/* Walk the L3 header at @nhoff: where does its transport header
> + * start, and which protocol is it?  Returns false if the header
> + * is truncated, malformed or fragmented.
> + */
> +static inline bool
> +virtio_net_l4_start(struct sk_buff *skb, unsigned int nhoff, __be16 proto,
> +		    unsigned int *thoff, int *ip_proto)
> +{
> +	if (proto == htons(ETH_P_IP)) {
> +		const struct iphdr *iph = virtio_net_ip4_parse(skb, nhoff, thoff);
> +
> +		if (!iph || ip_is_fragment(iph))
> +			return false;
> +		*ip_proto = iph->protocol;
> +		return true;
> +	}
> +
> +	if (proto == htons(ETH_P_IPV6)) {
> +		const struct ipv6hdr *iph;
> +		int flags = 0;
> +
> +		if (!pskb_may_pull(skb, nhoff + sizeof(*iph)))
> +			return false;
> +		iph = (const void *)(skb->data + nhoff);
> +		if (iph->version != 6)
> +			return false;
> +		*thoff = nhoff + sizeof(*iph);
> +		*ip_proto = iph->nexthdr;
> +		if (*ip_proto != IPPROTO_TCP && *ip_proto != IPPROTO_UDP) {
> +			*thoff = nhoff;
> +			*ip_proto = ipv6_find_hdr(skb, thoff, -1, NULL,
> +						  &flags);
> +			if (*ip_proto < 0 || flags & IP6_FH_F_FRAG)
> +				return false;
> +		}
> +		return true;
> +	}
> +
> +	return false;
> +}

for all this parsing: could we use flow dissection, like the
!VIRTIO_NET_HDR_F_NEEDS_CSUM case?
> +
> +/* Does checksum metadata match a known TCP or UDP header? */
> +static inline bool
> +virtio_net_csum_partial_ok_at_offset(struct sk_buff *skb, u8 hdr_gso_type,
> +				     unsigned int nhoff, __be16 proto)
> +{
> +	unsigned int thoff;
> +	int ip_proto;
> +
> +	if (!virtio_net_l4_start(skb, nhoff, proto, &thoff, &ip_proto))
> +		return false;
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
> +	int nhoff;
> +	__be16 proto;
> +
> +	if (!virtio_net_l3_start(skb, &nhoff, &proto))
> +		return false;
> +
> +	return virtio_net_csum_partial_ok_at_offset(skb, hdr_gso_type, nhoff,
> +						   proto);
> +}
> +
> +/*
> + * Handle a packet whose checksum metadata does not match the packet:
> + * GSO packets are dropped, as segmentation needs one checksum per
> + * segment; others are completed in software.
> + *
> + * Return 1 if the checksum was completed in software, else a negative
> + * errno.
> + */
> +static inline int virtio_net_resolve_csum_partial_mismatch(struct sk_buff *skb)
> +{
> +	if (skb_is_gso(skb))
> +		return -EINVAL;
> +
> +	return skb_checksum_help(skb) ?: 1;
> +}
> +
>  static inline int __virtio_net_hdr_to_skb(struct sk_buff *skb,
>  					  const struct virtio_net_hdr *hdr,
>  					  bool little_endian, u8 hdr_gso_type)
> @@ -194,11 +390,36 @@ static inline int __virtio_net_hdr_to_skb(struct sk_buff *skb,
>  	return 0;
>  }
>  
> +/*
> + * Return value:
> + * 0 - success
> + * >0 - checksum was completed in software (slow path)
> + * <0 - failure
> + */
>  static inline int virtio_net_hdr_to_skb(struct sk_buff *skb,
>  					const struct virtio_net_hdr *hdr,
>  					bool little_endian)
>  {
> -	return __virtio_net_hdr_to_skb(skb, hdr, little_endian, hdr->gso_type);
> +	typeof(skb->transport_header) old_transport = skb->transport_header;
> +	int ret = __virtio_net_hdr_to_skb(skb, hdr, little_endian,
> +					  hdr->gso_type);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (skb->ip_summed != CHECKSUM_PARTIAL ||
> +	    virtio_net_csum_partial_ok(skb, hdr->gso_type))
> +		return 0;
> +
> +	/*
> +	 * Here we do not trust the checksum metadata.
> +	 * __virtio_net_hdr_to_skb set the transport header to csum_start
> +	 * from virtio hdr, restore it to a known good value.
> +	 */
> +	skb->transport_header = old_transport;
> +	ret = virtio_net_resolve_csum_partial_mismatch(skb);
> +
> +	return ret;

can return virtio_net_resolve_csum_partial_mismatch(skb)

>  }
>  
>  /* This function must be called after virtio_net_hdr_from_skb(). */
> @@ -282,6 +503,35 @@ static inline unsigned int virtio_l3min(bool is_ipv6)
>  	return is_ipv6 ? sizeof(struct ipv6hdr) : sizeof(struct iphdr);
>  }
>  
> +/* Do the tunnel offsets match the outer headers in the frame?
> + * The L3 header the tunnel claims must be the one the frame
> + * carries, with UDP following it at @outer_th.
> + */
> +static inline bool
> +virtio_net_tnl_offsets_ok(struct sk_buff *skb, bool outer_isv6,
> +			  unsigned int outer_th)
> +{
> +	int nhoff;
> +	__be16 proto;
> +	unsigned int thoff;
> +	int ip_proto;
> +
> +	if (!virtio_net_l3_start(skb, &nhoff, &proto))
> +		return false;
> +	if (outer_isv6 != (proto == htons(ETH_P_IPV6)))
> +		return false;
> +	if (!virtio_net_l4_start(skb, nhoff, proto, &thoff, &ip_proto))
> +		return false;
> +
> +	return ip_proto == IPPROTO_UDP && outer_th == thoff;
> +}
> +
> +/*
> + * Return value:
> + * 0 - success
> + * >0 - checksum was completed in software (slow path)
> + * <0 - failure
> + */
>  static inline int
>  virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
>  			  const struct virtio_net_hdr_v1_hash_tunnel *vhdr,
> @@ -293,6 +543,7 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
>  	unsigned int inner_nh, outer_th, inner_th;
>  	unsigned int inner_l3min, outer_l3min;
>  	u8 gso_inner_type, gso_tunnel_type;
> +	__be16 inner_proto;
>  	bool outer_isv6, inner_isv6;
>  	int ret;
>  
> @@ -335,9 +586,12 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
>  	/* Let the basic parsing deal with plain GSO features. */
>  	ret = __virtio_net_hdr_to_skb(skb, hdr, true,
>  				      hdr->gso_type & ~gso_tunnel_type);
> -	if (ret)
> +	if (ret < 0)
>  		return ret;
>  
> +	if (!virtio_net_tnl_offsets_ok(skb, outer_isv6, outer_th))
> +		return -EINVAL;
> +
>  	/* In case of USO, the inner protocol is still unknown and
>  	 * `inner_isv6` is just a guess, additional parsing is needed.
>  	 * The previous validation ensures that accessing an ipv4 inner
> @@ -353,7 +607,7 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
>  	}
>  
>  	skb_set_inner_protocol(skb, inner_isv6 ? htons(ETH_P_IPV6) :
> -						 htons(ETH_P_IP));
> +			    htons(ETH_P_IP));

unintentional indentation change?

>  	if (hdr->flags & VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM) {
>  		if (!tnl_csum_negotiated)
>  			return -EINVAL;
> @@ -368,7 +622,17 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
>  	skb->inner_mac_header = inner_nh + skb_headroom(skb);
>  	skb->transport_header = outer_th + skb_headroom(skb);
>  	skb->encapsulation = 1;
> -	return 0;
> +
> +	/*
> +	 * We know VIRTIO_NET_HDR_F_NEEDS_CSUM was set so __virtio_net_hdr_to_skb
> +	 * set CHECKSUM_PARTIAL.
> +	 */
> +	inner_proto = inner_isv6 ? htons(ETH_P_IPV6) : htons(ETH_P_IP);
> +	if (virtio_net_csum_partial_ok_at_offset(skb, gso_inner_type, inner_nh,
> +						 inner_proto))
> +		return 0;
> +
> +	return virtio_net_resolve_csum_partial_mismatch(skb);

GSO is implied when reaching this far, so can just return -EINVAL. And as
only one caller of the function than remains, can avoid the helper.
>  }
>  
>  /* Checksum-related fields validation for the driver */
> -- 
> MST
> 


