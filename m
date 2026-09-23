Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD91947FB0F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158890; cv=none; b=X1IZJnNxOYOjb6AEubX1jpEo6b/ITcPkNm7HBPhdkSnxHQ+xi0anoHth+4JV71QeDw7/2mZ6JtJSAxUXbuJl1sAn7FwbB/Fv5yGXwYQvVRaxWTlH7y6ZZwDXgyQsT2A7toKjt/3c1RNgy3p7/euRm4Sd8wpJCGxmeLeIvtgr6dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158890; c=relaxed/simple;
	bh=4qjSqIjJRSLWY8kT8aUZHOXLRBvJpPrV+p/O0kGjplU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEVMXRuEMCvDM/9NaOzKqwONKKuGFhsGBGJ/ZE0YDJtVTxlAbt4bykKNBzenSDg/uj5AsqiQEnqkHBsfTfo5Y2sG/2si+r8WRknjV276NGVe+DY6bOZ28UrVM2KkSWdyeNnop0pwQr8oby1JY4VpC3Tf8f3PaLnE6bM0GjzqXbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JgyfKQEW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AgxeiR2B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JgyfKQEW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AgxeiR2B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790158878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A/yNGk5DmsVVa7FPt1z8YmmINF36yskI05CuGhzTjCI=;
	b=JgyfKQEWOLHWK6f9mkuE+DPHhem11MsDaT741M8hQoAVe1KDDTwdoDDDYbe6k+uPVMD2CE
	+4+S7a5T/AlH8FWZXE3uvOWToiw3ogflTqlyW5EETBYYmkNo3jRCQo1kcpguvuQOztXc8w
	v6kvqzJ7NK6E3F3nMc7wKUF9n1QdcTw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-5nRgydIROA6M4WS27i265w-1; Wed, 23 Sep 2026 06:21:16 -0400
X-MC-Unique: 5nRgydIROA6M4WS27i265w-1
X-Mimecast-MFC-AGG-ID: 5nRgydIROA6M4WS27i265w_1790158875
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49fcd86b8d3so5558905e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790158875; x=1790763675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A/yNGk5DmsVVa7FPt1z8YmmINF36yskI05CuGhzTjCI=;
        b=AgxeiR2BD+8mJAlnclSpLHirysbv4xwP4VXXNk6YBp9b7LG0/m4jQxks6dALYqJ3Ef
         GR/pXQMQCq7Ckk1EBOmMoQW1QJiuYFo+QOePNX06HrxXK1JK11JLj4EUhjfwZvU8AqxJ
         kYj3hxfuQLMHC/+YlKUqMWe3jfRYBNfEHf4uRzKOWjRwI5KILuYMHKIgSSz3LBY/dxr3
         ZFCeG0TdBFJRIII0J8W9UG69FycFUAHuVQc1DSuZVLRQak1MdKS/B53gvj4pNDJ1UXcE
         d+AJ4MDHPCHL1lNs2fNSQAYzVI/fmzHlWW9cpL2PveKrU/tE/+UOwzCX1OXxXQwpsYAr
         tVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158875; x=1790763675;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A/yNGk5DmsVVa7FPt1z8YmmINF36yskI05CuGhzTjCI=;
        b=zQZVcicruQzSU8pPk8umLUHIL9i0u5i9KzLRsZR+e9XddYiPMEVbtPO0ZH3HW/Qg/j
         TB+3hFx4HecP4d523OvHavSD0Yq9X+Vdr4tDru7GMmcYcdnYO102Ru1UYr4ukuwpjISp
         hnYdEBr2t+O6NyPuHWYRzicIkrwZN0Mp3LfXK/ZcBrLsqRRDjD2AesXlH/hNqSF99iqY
         jjAesB0F6TozHszTLG0PqaeIWUggBChRvb+TiOqJwQeui3rl4X87a0fcYXma/FWEjC2p
         BiG10FhdzDur+oXnkFivXPai3Ele5bFv04H+ZLCsMZv88w8QAVfjfbsyMmIHefC/lU+8
         8png==
X-Forwarded-Encrypted: i=1; AKwUvBzXVnvJzh1Bn2K4YnotWqUhxHjGh4NX4hNofS1pNDrTGn6jocjMOV0aftn0IoK25JFChITyffPlJiRtn9U=@vger.kernel.org
X-Gm-Message-State: AFuF++l0rzff2OU9lMjJUWY8K79YSW17rsMs9LsTI0gGFn13EpjWTrXv
	mjUlIZfGSAxHAfzdBmmdQ9LqHEPU73eOm7/b3CdlVqk7NmKKRuKh7m5n3tCnoHCNv3Xmt1w3GLt
	q0DnggiKCgAu+MNejfXC4wxO/T+t4ETlEridvWQWO+DWFevm22DJbz+0GFY0pbWJw4g==
X-Gm-Gg: AYBFou3COvQIWueBVsHOKKN+fAUCBy0roQ+UcvrG4PnsDDv4WHdj9kBWVwaoMDGPSA3
	0pIE6UVVi6JxBSJs++dQK8GbUsdaPfWu0PWRPq8hV6xLsoeJeJuHxigBstOcr7sFgpySuOn57qm
	2l7cr6JpDaKrzqnZFjHA5DaOIkYUZR/3rCaFof5MZqi/nmGNbcGu/632r6/+beY3NnJ6Bc7bZ0r
	yd2uwM7pfY7ebNA0PMoWHwBZVjbK+OISZG3w0ydtwvebLEwyQFSnXJ4kbvtWxwaDvpbaK0kU498
	uCzvAbwLZwu0K4hZkIZ7t//jKWTIluQ62fxLbKRSRRZUwnRcW8mkypcarQ29ow8EltJpSA==
X-Received: by 2002:a05:600c:4712:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-49fdf24f928mr27542115e9.30.1790158875122;
        Wed, 23 Sep 2026 03:21:15 -0700 (PDT)
X-Received: by 2002:a05:600c:4712:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-49fdf24f928mr27541455e9.30.1790158874532;
        Wed, 23 Sep 2026 03:21:14 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf9691e2sm57317795e9.1.2026.09.23.03.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:21:13 -0700 (PDT)
Date: Wed, 23 Sep 2026 06:21:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Paulos Yibelo <habte.yibelo@gmail.com>, netdev@vger.kernel.org,
	richard@nod.at, anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net, jasowangio@gmail.com,
	eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
	andrew+netdev@lunn.ch, pablo@netfilter.org, fw@strlen.de,
	phil@nwl.cc, razor@blackwall.org, idosch@nvidia.com,
	dsahern@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-um@lists.infradead.org, virtualization@lists.linux.dev,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	bridge@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v6 1/2] net: validate virtio checksum start after
 network header
Message-ID: <20260923061215-mutt-send-email-mst@kernel.org>
References: <20260922030310.8684-1-habte.yibelo@gmail.com>
 <20260922030310.8684-2-habte.yibelo@gmail.com>
 <willemdebruijn.kernel.259bc7096258d@gmail.com>
 <willemdebruijn.kernel.2cdfef118aa1d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <willemdebruijn.kernel.2cdfef118aa1d@gmail.com>

On Tue, Sep 22, 2026 at 09:27:26PM -0400, Willem de Bruijn wrote:
> Willem de Bruijn wrote:
> > Paulos Yibelo wrote:
> > > __virtio_net_hdr_to_skb() checks a minimum network-header length for
> > > CHECKSUM_PARTIAL packets. Its checksum start is relative to skb->data,
> > > but some callers have not established skb->network_header when they
> > > convert the virtio header.
> > > 
> > > Pass the data-relative L3 origin explicitly. Ethernet receive paths
> > > parse the frame and nested VLAN headers without changing skb state.
> > > AF_PACKET uses the frame's actual L3 origin even when the socket
> > > protocol is ETH_P_IP and the raw frame carries VLAN tags. Non-Ethernet
> > > AF_PACKET devices retain their established skb network offset.
> > > 
> > > Also pass the actual L3 protocol so IPv6 packets use the 40-byte base
> > > header minimum even without TCPv6 GSO. IFF_TUN obtains that protocol
> > > from the packet before skb->protocol is set. Name the Ethernet parser
> > > accordingly, use the same origin for tunnel validation, and propagate
> > > conversion failures in UML.
> > > 
> > > The bound remains a minimum; fragmentation paths separately validate
> > > the parsed IPv4 or IPv6 header length before completing a checksum.
> > > 
> > > Fixes: 49d14b54a527 ("net: test for not too small csum_start in virtio_net_hdr_to_skb()")
> > > Fixes: a2fb4bc4e2a6 ("net: implement virtio helpers to handle UDP GSO tunneling.")
> > > Reported-by: Paulos Yibelo <habte.yibelo@gmail.com>
> > > Link: https://lore.kernel.org/netdev/20260920004733.6473-2-habte.yibelo@gmail.com/
> > > Cc: stable@vger.kernel.org
> > > Assisted-by: LLM
> > > Signed-off-by: Paulos Yibelo <habte.yibelo@gmail.com>
> > > ---
> > >  arch/um/drivers/vector_transports.c | 13 ++++-
> > >  drivers/net/tun_vnet.h              | 52 ++++++++++++++++-
> > >  drivers/net/virtio_net.c            | 10 +++-
> > >  include/linux/virtio_net.h          | 87 ++++++++++++++++++++++++-----
> > >  net/packet/af_packet.c              | 24 +++++++-
> > >  5 files changed, 163 insertions(+), 23 deletions(-)
> > 
> > The fix may still miss the case IPv4 packets have options.
> > 
> > This version is a very large patch.
> > 
> > Untested shorter first suggestion by bot, which looks plausible as a
> > starting point for discussion.
> 
> Cleaned up some more:
> 
>     diff --git a/drivers/net/tun_vnet.h b/drivers/net/tun_vnet.h
>     index f4c652b1fa44..c24607af2aad 100644
>     --- a/drivers/net/tun_vnet.h
>     +++ b/drivers/net/tun_vnet.h
>     @@ -180,6 +180,9 @@ static inline int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
>      static inline int tun_vnet_hdr_to_skb(unsigned int flags, struct sk_buff *skb,
>                            const struct virtio_net_hdr *hdr)
>      {
>     +    if ((flags & TUN_TYPE_MASK) == IFF_TUN)
>     +        skb_reset_network_header(skb);
>     +
>          return virtio_net_hdr_to_skb(skb, hdr, tun_vnet_is_little_endian(flags));
>      }
>      
>     @@ -199,6 +202,9 @@ tun_vnet_hdr_tnl_to_skb(unsigned int flags, netdev_features_t features,
>                  struct sk_buff *skb,
>                  const struct virtio_net_hdr_v1_hash_tunnel *hdr)
>      {
>     +    if ((flags & TUN_TYPE_MASK) == IFF_TUN)
>     +        skb_reset_network_header(skb);
>     +
> 
>     diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
>     index c381b916c1b5..02c448de0802 100644
>     --- a/include/linux/virtio_net.h
>     +++ b/include/linux/virtio_net.h
>     @@ -48,6 +48,42 @@ static inline int virtio_net_hdr_set_proto(struct sk_buff *skb,
>          return 0;
>      }
>      
>     +static inline int virtio_net_hdr_nh_min_len(const struct sk_buff *skb,
>     +                        unsigned int nh_min_len)
>     +{
>     +    int thoff = skb_transport_offset(skb);
>     +    __be16 proto;
>     +    int nhoff;
>     +
>     +    if (skb_network_header_was_set(skb)) {
>     +        nhoff = skb_network_offset(skb);
>     +        proto = skb->protocol;
>     +    } else {
>     +        if (unlikely(thoff < ETH_HLEN))
>     +            return -EINVAL;
>     +        nhoff = ETH_HLEN;
>     +        proto = eth_hdr(skb)->h_proto;
>     +    }
>     +
>     +    if (eth_type_vlan(proto)) {
>     +        proto = __vlan_get_protocol(skb, proto, &nhoff);
>     +        if (!proto)
>     +            return -EINVAL;
>     +    }
>     +
>     +    if (proto == htons(ETH_P_IP)) {
>     +        const struct iphdr *iph = (void *)(skb->data + nhoff);
>     +
>     +        if (unlikely(thoff < nhoff + sizeof(*iph)))
>     +            return -EINVAL;
>     +        nh_min_len = max_t(u32, iph->ihl * 4, sizeof(*iph));
>     +    } else if (proto == htons(ETH_P_IPV6)) {
>     +        nh_min_len = sizeof(struct ipv6hdr);
>     +    }
>     +
>     +    return nhoff + nh_min_len;
>     +}
>     +
>      static inline int __virtio_net_hdr_to_skb(struct sk_buff *skb,
>                            const struct virtio_net_hdr *hdr,
>                            bool little_endian, u8 hdr_gso_type)
>     @@ -98,13 +134,15 @@ static inline int __virtio_net_hdr_to_skb(struct sk_buff *skb,
>              u32 start = __virtio16_to_cpu(little_endian, hdr->csum_start);
>              u32 off = __virtio16_to_cpu(little_endian, hdr->csum_offset);
>              u32 needed = start + max_t(u32, thlen, off + sizeof(__sum16));
>     +        int min_thoff;
>      
>              if (!pskb_may_pull(skb, needed))
>                  return -EINVAL;
>      
>              if (!skb_partial_csum_set(skb, start, off))
>                  return -EINVAL;
>     -        if (skb_transport_offset(skb) < nh_min_len)
>     +        min_thoff = virtio_net_hdr_nh_min_len(skb, nh_min_len);
>     +        if (min_thoff < 0 || skb_transport_offset(skb) < min_thoff)
>                  return -EINVAL;


Certainly looks much better. But I'd like to ask, generally:
doesn't the net stack need to protect against weird packets?

It seems likely that not all drivers validate headers defensively,
and incoming packets can easily become outgoing ones.
So do we even need virtio specific validation, or is it enough to
validate everything in the net stack, where we are poking at the
header anyway?

Or maybe it's more a defense in depth thing?

My worries:
- more poking at the header, more cache misses, where we really
  do not need that
- future protocol extensions that now will require surgery in
  virtio, instead of just being passed through to the host

What do others think?

-- 
MST

