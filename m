Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541132;
	b=2UCRjZZTA4T6KR1H6CCqTK96PKSz7EOsY0efnTrzUettBDpt8PCS/usUMfVaOfnUhdhA
	 VW2CkNL51E/+Z3jWCwdMu502ZbVI5+jODbeKP1N550D/V3R9iIcAcroWmlnGPXboBeV5q
	 ytaiEyImv9kpA/0bINdYdjC+QChKEL7h0fUIHltMO5ARUFU0+tklrsfXhUbhD3ZQENcgV
	 y2ORlCnSM9j4xhRibnzsZN8mvwApaiMaTbqsxP1AldAtISNT4J0eN5PpF2ru2XRIvxt2+
	 GNRCSqnW0KOtH/46hULeLYUzr/ZHXpg2kNFPGQiKA4rHfpVFwHds2d627zw0qObJCOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9KmVjMJTY8zcLg9QfQKrHKxwneViwt4HwZ1IqLmXRp8=;
	b=Q02E39PIzji0fjq/2maHAUCvAAOedrosNiy0MZQYShiRITGs9P1b461XaPhn4mJ/DJd3
	 Oj1jzVqNNomWVGIJ+Qq78HchAVvNm3yfOB/HaLsRx80KTMKWTHhfPmzV1W0ZJ0obAgx9x
	 kR9d7M/bbeKzIoXeofL0du7eGHYa1tP0N0ZsZY6HbGFNDWDKXE8IJotYfmLxr+FFNdw/T
	 0J7IGhkC4zeJ891mmBHiroW/RhaoG25CFvBgx282qlcQYmdlL+zch0lpeJ2sHjg3sVtLZ
	 cS1URwPm6PZ4wbs5bV2q7osWN0M6vPehyQy+H+hKTdQJVkXmhtAeu39gAVNS76KWqPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oheBebjs;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED44606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED44606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oheBebjs
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5e9a1f1681dso84350e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792541131; x=1793145931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9KmVjMJTY8zcLg9QfQKrHKxwneViwt4HwZ1IqLmXRp8=;
        b=oheBebjsamFrOmbLheQaS9kwhGj2/5c8GFJHxr1Jfk8Ef0D34wwjyBvsEuKf35hI0e
         ztFETiGiNiTqwzVtvgcutrbe8xxY0xHvKLB2UNa5RoZIS0HWDfL6Dvty6FSovI5n6Xku
         /KfXaRvgxwuzIdR4tzYn/Bt8iOegGcUfGHNA0QmVwZBoJ304o/WuLdOjczSNAyjAhMV2
         wgaMP6IwezPX6lF2zR8kRvmI/0gArW9734zefhGoFIFVpLLtAltqkztEsqTKHt3s1XjX
         y7WuFnIyWIxtggIiJJe9ZwlTYEbqoZqWc9D7k6qqNmoBMTNJr7xWng2tkaPsVfD9eRFN
         kEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792541131; x=1793145931;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KmVjMJTY8zcLg9QfQKrHKxwneViwt4HwZ1IqLmXRp8=;
        b=iZi0bLgNqtZaoYzcqVcdh5SPGHkdBx/t/gJj+RyW6F9bZnkW3pIoFIG2090FBNeXNy
         VxlnJNv33tiE+K224yVLmeKL88lBXLLhqHXqsf7LrznomL/EYsZtafkkcZJMOUPmSvGb
         cMt30zEyFNY4rFAsGwCn7V7PAcHQbQ4xRV4OoCatGPI/xZW32GUvM73m5ZR76fBuEF4K
         d0R3/DPqT6eLpXxksluAu/kUzLl3iJbZIEDb1TDDiLmoJ18HG8k2YX4slGpetvm8XRKy
         tz2ybLx9OXpwUJeEYWqItaYWubhEa9zwUMxnOdN6rz0nYB3qLv95BKrbwC+5omo+X6qi
         SDqQ==
X-Gm-Message-State: AFq9FYIHVR/nX2gaOHhfEyMfBDPQEw3l0juxg0kkVgE+pG4rgw78tFBY
	/dlvtcVQc0t2nNoxge2tTZvWgvlRM3VgAFlMLhSYY0Ed3xy8aOcu/aYk
X-Gm-Gg: AYBFou2p3suVv/zKZC22qR04fpRYrKHYorfr/3wRCCrrAGi5d7KubYHIFGoCeYZDXPi
	VbHbQTHQ+s5I+Cx97qF7oYHmnA8YNZEc8FyZ/BX0hDO6GdyVLQRBxYYohXuE9o9b9KiKylxnOMW
	QRM4coE1YKNVconMf1zzCKNzN1m1zLHAOSl+dmVz0LvH7V3y7pKOylomPU3CwLGbpyMrseUnEXV
	umgStuaSGKbpB4n+y9DAwMuyzinB2GxEkKEgUJ25HgWybALZQhKduyrL6d6H7zDR9TJZpNw6oq6
	rnTx7wODJLPC62thaTItOOlHVeVPVHKboKk1I3xHHhDNH2ZZRTQXDh78NrLqhvEgJcIfae8AE7R
	sawga458DK6kHrEdLYVlmCj3pLwuhIb6NyO8tTp0DoImDD7j7gMbPPcYPp5jH16u7Pt4rGy6ItT
	dwfuI0K0pyXKA2Lru44fRN02KWI9Cp3biWhXQYo1tumNKcfmrg46sb76PnOduuEeisLqpTr/xFM
	WA/I8OsdsyZhLJhAZG+DMymccikCwLtcQMSKv8/ttJ+8716KoeeNEciyTxwz5uPobPiILAqZXmS
	WWiQCbqe2aUN4riiD2lp30w33gk/uk1AIhSlpg==
X-Received: by 2002:a05:6122:1d9f:b0:5e6:82ca:c551 with SMTP id 71dfb90a1353d-5eaebef16acmr141977e0c.22.1792541130631;
        Tue, 20 Oct 2026 17:05:30 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae981d239sm1228104e0c.14.2026.10.20.17.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:05:29 -0700 (PDT)
Date: Tue, 20 Oct 2026 20:05:29 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
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
Message-ID: <willemdebruijn.kernel.1da723f98c23a@gmail.com>
In-Reply-To: <20261020170908-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <9c08d12b3a7819ae03ded6a154e4f908276e93d4.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.2eb449439b094@gmail.com>
 <20261020170908-mutt-send-email-mst@kernel.org>
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
> On Tue, Oct 20, 2026 at 03:44:35PM -0400, Willem de Bruijn wrote:
> > > +/* Walk the L3 header at @nhoff: where does its transport header
> > > + * start, and which protocol is it?  Returns false if the header
> > > + * is truncated, malformed or fragmented.
> > > + */
> > > +static inline bool
> > > +virtio_net_l4_start(struct sk_buff *skb, unsigned int nhoff, __be16 proto,
> > > +		    unsigned int *thoff, int *ip_proto)
> > > +{
> > > +	if (proto == htons(ETH_P_IP)) {
> > > +		const struct iphdr *iph = virtio_net_ip4_parse(skb, nhoff, thoff);
> > > +
> > > +		if (!iph || ip_is_fragment(iph))
> > > +			return false;
> > > +		*ip_proto = iph->protocol;
> > > +		return true;
> > > +	}
> > > +
> > > +	if (proto == htons(ETH_P_IPV6)) {
> > > +		const struct ipv6hdr *iph;
> > > +		int flags = 0;
> > > +
> > > +		if (!pskb_may_pull(skb, nhoff + sizeof(*iph)))
> > > +			return false;
> > > +		iph = (const void *)(skb->data + nhoff);
> > > +		if (iph->version != 6)
> > > +			return false;
> > > +		*thoff = nhoff + sizeof(*iph);
> > > +		*ip_proto = iph->nexthdr;
> > > +		if (*ip_proto != IPPROTO_TCP && *ip_proto != IPPROTO_UDP) {
> > > +			*thoff = nhoff;
> > > +			*ip_proto = ipv6_find_hdr(skb, thoff, -1, NULL,
> > > +						  &flags);
> > > +			if (*ip_proto < 0 || flags & IP6_FH_F_FRAG)
> > > +				return false;
> > > +		}
> > > +		return true;
> > > +	}
> > > +
> > > +	return false;
> > > +}
> > 
> > for all this parsing: could we use flow dissection, like the
> > !VIRTIO_NET_HDR_F_NEEDS_CSUM case?
> 
> Hmm I don't see how.  That one trusts the caller's protocol and network
> header. We could parse L2 ourselves and use the dissector for L3+. But
> it stops at whatever it does not know, and every miss would turn into a
> drop or a software checksum for a packet the stack delivers fine.  Our
> parser deliberately covers everything the stack can deliver.

You're right, the protocol and network offset need to be parsed
manually. After that it could be passed to the flow dissector.

Totally untested:

    static inline bool virtio_net_setup_l3_input(struct sk_buff *skb, int *nhoff, __be16 *proto)
    {
        const struct net_device *dev = skb->dev;

        /* Devices with Ethernet framing: ARPHRD_ETHER, loopback, macvlan, etc. */
        if (dev->header_ops == &eth_header_ops || dev->type == ARPHRD_ETHER) {
            if (!pskb_may_pull(skb, ETH_HLEN))
                return false;
            *nhoff = ETH_HLEN;
            *proto = eth_hdr(skb)->h_proto;
        } else if (dev->type == ARPHRD_NONE) {
            /* Raw L3 devices (e.g. tun in IFF_TUN mode) */
            *nhoff = 0;
            *proto = skb->protocol;
            if (!*proto) {
                if (!pskb_may_pull(skb, 1))
                    return false;
                if ((skb->data[0] >> 4) == 4)
                    *proto = htons(ETH_P_IP);
                else if ((skb->data[0] >> 4) == 6)
                    *proto = htons(ETH_P_IPV6);
                else
                    return false;
            }
        } else {
            /* Fallback for other netdevs using caller's network header */
            *nhoff = skb_network_offset(skb);
            if (*nhoff < 0 || (unsigned int)*nhoff >= skb->len)
                return false;
            *proto = skb->protocol;
        }

        return true;
    }

    static inline bool virtio_net_csum_partial_ok(struct sk_buff *skb, u8 hdr_gso_type)
    {
        struct flow_keys_basic keys;
        __be16 orig_proto = skb->protocol;
        u16 orig_net_hdr = skb->network_header;
        __be16 proto;
        int nhoff;
        u16 csum_offset;
        size_t min_thlen;
  
        if (!virtio_net_setup_l3_input(skb, &nhoff, &proto))
            return false;
  
        skb_set_network_header(skb, nhoff);
        skb->protocol = proto;
  
        if (!skb_flow_dissect_flow_keys_basic(dev_net(skb->dev), skb, &keys,
                              NULL, 0, 0, 0, 0))
            goto restore_fail;
  
        /* Disallow fragments: partial checksums cannot be retained across frags */
        if (keys.control.flags & FLOW_DIS_IS_FRAGMENT)
            goto restore_fail;
  
        /* Validate protocol matching */
        switch (keys.basic.ip_proto) {
        case IPPROTO_TCP:
            if (!virtio_net_hdr_match_proto(keys.basic.n_proto, hdr_gso_type))
                goto restore_fail;
            min_thlen = sizeof(struct tcphdr);
            csum_offset = offsetof(struct tcphdr, check);
            break;
        case IPPROTO_UDP:
            if (!virtio_net_hdr_match_proto(keys.basic.n_proto, hdr_gso_type))
                goto restore_fail;
            min_thlen = sizeof(struct udphdr);
            csum_offset = offsetof(struct udphdr, check);
            break;
        default:
            goto restore_fail;
        }

        /* csum_start must match the dissected transport header offset */
        if (skb_transport_offset(skb) != keys.control.thoff)
            goto restore_fail;

        /* csum_offset must point to the transport checksum field */
        if (skb->csum_offset != csum_offset)
            goto restore_fail;

        /* Ensure the transport header is linear */
        if (!pskb_may_pull(skb, keys.control.thoff + min_thlen))
            goto restore_fail;

        return true;

    restore_fail:
        skb->protocol = orig_proto;
        skb->network_header = orig_net_hdr;
        return false;
    }
