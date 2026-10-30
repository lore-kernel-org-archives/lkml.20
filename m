Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388120;
	b=Lzk+VJbsUY6f473c+646Ksy5MKY1QQVuHzSqLjlalKFt5EnSsWhYluyog9eSrXpGmeMZ
	 8L+W4igHbBRtyeMKnfcx/XYMGTUiqJYRRw9vurL/4NDMHmXSJ8m7MJx2x+HYb03ucF9dz
	 rp2NjsGbSI/URHs5cvwSna8bqLSxNSoo5xztOKNzFXQHkm/+kF/uW/ACrJMG903KcTyzI
	 JdHYblHbnmnaRIPgGAMyqTWUlDBfgtlI9A9BCORI03sBMl96LZ+C27pgJHRcARrWi6Dr4
	 jWvn+3PPZr6kNvY0BsKUyb9iqclHoPSrJg3w3Pc6Ux5pNu/nXiI1WVBFJE9xEvAt7+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GReiSolaeJ3iKYS1tEulym/+/oFcv/1Felx7ub1EYtY=;
	b=XU1yPbhirMHhYAzdOuHG7M4o4gx67ckxsFhtYr+P1S22PQW40d7h6UhfAIUFeZfpV0Hs
	 W5oXjOh2jKBwJAJlng9h/9Oxz011Stz+FTRY70V6RAvBY6PFsSRDqRpTM6TfmuH/R5WG+
	 Fa0sKC5ld2yqOTxcYHr1xug7BJs+o9AxBO5DkXlFRthr2FRGMKCpn9IuQEiDfLV5Tgrqs
	 2rLArWlSYPp+BFzhDSTIFrO+PSujjMT9GUGVUCiVyLz+NsDxRUUaDwieVZNTkcEdN5fCl
	 mIuI3fnfwGSyRTlWHlUnpwUtoV2hkIyRgyGhKPsfdZa1OYCgWPpOxV4Ocs9LUZi0Qig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hGESc6qZ;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B752606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B752606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hGESc6qZ
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7cc91ddf447so377080137.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793388118; x=1793992918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GReiSolaeJ3iKYS1tEulym/+/oFcv/1Felx7ub1EYtY=;
        b=hGESc6qZ5lRT/eiOv4Lnb1ihz2u+RN03xjtS7EBeMOrdT+SOHmNmLVdMB9qQHw2YxU
         39An5Y78ZM3mXvndMdQ1O9ZexnRrrAHPm7oFUk4pOLjhigz68P8a9fhNf+vP/8cTh/jv
         kQSHICeaqSqFaopyYGMEq/FQ70L7hpn3IdPjLRf6kxqaFBsiL+5r/F/7qK1Zq/RB/7tR
         p/UcB1X7TcBFlPhfh8hI2p6xewguyed3EPsux+9TnZWooeVUn4f2uQBA4yR4VconKgh3
         TFgh+OiNbuHESi4FRJo7dBG4GKZ+Y6VywDYeMszrFjbAk7dbxAvZC4IH7iORWsmbUAAV
         MVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793388118; x=1793992918;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GReiSolaeJ3iKYS1tEulym/+/oFcv/1Felx7ub1EYtY=;
        b=tHs7QpTRjDpbQG2td1mURTSRyPg5yS3I/7/CE1FuVSgw3ihR6RoLTY8kbsQ1nGgIGG
         IuNjV69CbVvxLa7kPFxkzN0cH7TAcnz6xiJY7o9TErNuzoFarBSBYyhZSGMfumPlblwC
         AzjY6mqbuvEGvsMLK6AlAHnVwn0uJq7AsU41QR88E4XFB+Ts/AVUqT4wKGUBTv6VA4Nh
         cePSAtrX2qhF69mOG/DiayZU+agHPjgrIBIW8PDMRir4ph/kjTHzTC7dEMvgVHRr9bJ7
         /8yNFDTYd4z738rU84lXyCWNPwotL4LVDO0HEDeetSmu4qScWgMWYuhrKbL2MkY1PlnT
         kTqg==
X-Forwarded-Encrypted: i=1; AKwUvBxmAZ2Pv6FmC9eMeKceX2sAW3j3CuEGaoafcCEuUncrfSYbGsbCcc8hfCXnw3tS7ikr2BKRR8aXYFhz7BU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwPYYaSjkqpZsVBqxDWX6UN9DWZo5/WJ/5TS+IZsJCED3cq3LE
	ZbczKcg9NWtdlcnCV/sDh1lFtRrfE7hYiJ2tqIr6Keo+ZXTrbp2+qIFU
X-Gm-Gg: AYBFou0mHVp98aVvg6Wcd5IAA1Uim8hP7/dIyPowYEEY1a7beP/U607Ps5WiqFFg6WR
	avlEYCFbHiho7aX+ls8TtaOtkf3+x1VKmXMoEaYD9fXVNx0abcySxX477tyDORfiuDuJXtxkRJi
	sGjucKZhHs525QDqf08WtSKWm0Jr2+KYVtHoda7eQkh0tyCw0DQdkA4X9a9XvjeKZOqbmqZcysw
	oVu1BdcSZ2XSKifZdPabOANxjz6QAsWDS4qszj9LIdYsiXf/y/G0YS+9mPi2gQnwPST1fI9v0nx
	2c5aJItHYsISMgn0QuL9wIRa+xE/hcnFdLu9L44wzwnEj9ujYOpvi1yaLnrdh8OfLjwSG7kFyp5
	xlHuYlmcoxpJ0nPx8CEmiUagcI/CwRFfow3fiTaVFGUUSTjfXrlDxzLT52PrxtVirtIGxDRRNlw
	7wWrqvUmdlNy1uOxhw/ucYGNvtMr6UyeVs+CfQSmCz7XkpOUvVUGweIJ5rclFTI7KelgQ8cFIkZ
	1/Wb1iYy9RPE7YxqOGkqMLApnqkji8Klf710pLZUmecG2U+D3gqj9GMUU8kaxSaweOr2KcufjU+
	k2+mcYJ1pcwShhAIZzVbBl6aZ2jNwHivVYNT1BKf5H93+6ujgxQIJg8NI7wMK99OEd3HQ7QNlEs
	TFI8HxVD3SufPMkoeT/6eOANaahVbK0UKRO17BM7KQ91zngq7hIZDb/ecqRl66NXZB8vV4Q==
X-Received: by 2002:a05:6102:3ec5:b0:7c3:8150:83e7 with SMTP id ada2fe7eead31-7d072635dd8mr1556432137.9.1793388118448;
        Fri, 30 Oct 2026 12:21:58 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4e7453sm3608852241.11.2026.10.30.12.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:21:57 -0700 (PDT)
Date: Fri, 30 Oct 2026 15:21:57 -0400
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
Message-ID: <willemdebruijn.kernel.10a41a35b45f6@gmail.com>
In-Reply-To: <93d0e37c99711bebdf60c120af03010455c2f2e2.1793276116.git.mst@redhat.com>
References: <cover.1793276116.git.mst@redhat.com>
 <93d0e37c99711bebdf60c120af03010455c2f2e2.1793276116.git.mst@redhat.com>
Subject: Re: [PATCH RFC v7 4/5] net: resolve uncommon partial checksums at
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
> Note that for zero copy, userspace can change the data after the
> checksum has been calculated.  This is fundamental to zero copy by
> design, and the only outcome is a bad checksum and a packet drop.
> 
> To mitigate the risks, the following patch will add a sysctl knob to
> bypass the resolution. This is reasonable if the setup is such that
> there is no protocol processing at all.
> 
> UDP tunnel headers get the same handling on the inner header.
> 
> Packets without VIRTIO_NET_HDR_F_NEEDS_CSUM are unaffected.
> 
> Note a fundamental limitation of this approach: an nf/BPF program
> that tweaks the payload of a packet in flight may rely on the
> checksum being fixed up later, assuming the packet carries
> CHECKSUM_PARTIAL.
> 
> For metadata that fails validation the checksum
> is now completed at input, so such edits leave a stale checksum
> and the packet is dropped at the receiver.  Protocols whose
> transport header we cannot parse (anything but TCP and UDP) are
> affected even when the metadata is self-consistent.
> 
> The sysctl added in the next patch is the escape hatch for these setups,
> but it is a very blunt tool.
> 
> Reported-by: Paulos Yibelo <habte.yibelo@gmail.com>
> Reported-by: Chris Arges <carges@cloudflare.com>
> Tested-by: Chris Arges <carges@cloudflare.com>
> Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

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
> +			/* Find the transport header behind any
> +			 * extension headers, AH included.
> +			 */
> +			*ip_proto = ipv6_find_hdr(skb, thoff, -1, NULL,
> +						  &flags);
> +			if (*ip_proto < 0 || flags & IP6_FH_F_FRAG)
> +				return false;

Minor, not cause for respinning on its own.

    `flags` should include `IP6_FH_F_AUTH` so `ipv6_find_hdr()` stops at
    `NEXTHDR_AUTH` instead of skipping it:

    - `CHECKSUM_PARTIAL` and GSO behind IPsec AH are invalid: AH authenticates
      the inner L4 header including its checksum field

> +		}
> +		return true;
> +	}
> +
> +	return false;
> +}
> +

> @@ -368,6 +660,21 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
>  	skb->inner_mac_header = inner_nh + skb_headroom(skb);
>  	skb->transport_header = outer_th + skb_headroom(skb);
>  	skb->encapsulation = 1;
> +
> +	if (!skb_is_gso(skb)) {
> +		/* Too small to segment: complete the checksum in place
> +		 * instead of dropping - senders do tag small packets
> +		 * with GSO headers, e.g. packetdrill sets gso_type and
> +		 * gso_size with --mss, whatever the packet size.
> +		 * The outer UDP checksum is not calculated, but a zero
> +		 * one is fine: UDP over IPv4 allows a disabled
> +		 * checksum, and so do tunnels over IPv6 where the
> +		 * receiver opts in (RFC 6935, RFC 6936).
> +		 */
> +		skb_shinfo(skb)->gso_type &= ~(SKB_GSO_UDP_TUNNEL_CSUM |
> +					       SKB_GSO_UDP_TUNNEL);

Maybe this carve-out for non-gso packet is best moved to its own
patch, as that is where the remaining issues (to merging the rest)
seem to be.

    1. Moving `!tnl_csum_negotiated` below `virtio_net_csum_partial_ok_at_offset()`
       accepts packets with an unnegotiated `VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM`
       flag whenever inner validation falls back to
       `__virtio_net_resolve_csum_partial_mismatch()`.
    2. `__virtio_net_resolve_csum_partial_mismatch()` calls `skb_checksum_help()`,
       which completes only the inner checksum at `hdr->csum_start` and sets
       `skb->ip_summed = CHECKSUM_NONE`, leaving the outer UDP `uh->check` with
       an uncompleted pseudo-header checksum seed.

    Despite the comment, this block neither completes any checksum in place nor
    is the outer UDP checksum zero when `VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM` is set:
  
    - With `VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM`, the outer `uh->check` carries the
      non-zero pseudo-header checksum seed (as expected by
      `__skb_udp_tunnel_segment()`), not `0`.
    - Clearing `SKB_GSO_UDP_TUNNEL_CSUM` on a `!skb_is_gso(skb)` packet leaves
      `skb->ip_summed == CHECKSUM_PARTIAL` at `inner_th` with nothing completing
      the outer `uh->check` on transmit/forwarding (`validate_xmit_skb()` only
      completes/offloads the single inner checksum, emitting a corrupt outer UDP
      checksum). Even zeroing `uh->check` would be invalid over IPv6 unless the
      receiver explicitly opted into RFC 6936 (`UDP_NO_CHECK6_RX`).

> +	}
> +
>  	return 0;
>  }
>  
> -- 
> MST
> 


