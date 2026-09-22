Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344A148E0E7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790116209; cv=none; b=PZeKnsoS06FzqsN2MU/+yqw2xpwDppsfW3rnA6+MITVRqV0vu98yNmaBrdjMTK9J9+9KVxAPXLWleqb6DLz+kAWrZjBBEFtxsFwbrCIznl7IjUokL0AgZZp57UQXRRhzhrRwqEkIiqvpz4FlGSXyxyaXLAReWrhiZ2e2gClft2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790116209; c=relaxed/simple;
	bh=GPLKcgE/IGUmibjYksV+m38Ut7/zFBjUgzhUH19TbD8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=hRo73VS2EnfkZkITm3z4AVB5QaoRxvSoLxrg1NkfTfOLIL30tX2I1esx0KRiSwij7cmCPGeEKdw3bqSvFffoU6cIlI1uYkKabCAiPagAdl9JaE15zpFs5GDeIaVRYmxMZfet+ZcaaZ+W0PFJnrnH9aUlcVqyk+vnD6GI0fZuduo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ys9uvVRS; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ys9uvVRS"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d45ae011cso6224907b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790116191; x=1790720991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0qPZh/r/REXP5ZSy0nxs+oUBSRD0aY6qVWm9CYsML3E=;
        b=Ys9uvVRSJwCh5svQvp/RAv00KXVGJmhotLNBqseMO2qZ0tq1W3XoM19jTFngBc0CRr
         aKCTfpDG8pIwoJgXDx/C0r/xid3JPY17ccgySynzqXO2NGmF7/z8auG7q6K44UxkVTPF
         pKgXIiWKiSqd8ReKKb0/IOSr332hkOjBy7ApNSj8aNEk0r8sIu7sBc4fjEKTfAZoPUP6
         gun44WmVspZgPYZpsJwE8NIoLAWSe7Hup9S2fHfPSHgFaeDfyKZJy63Apne5wKhEMOj5
         cTSAKVyWfKIPchJl/qQSNI+I7Q5LgYEcwg/ZBzCim+gcSS56Ok5yGQE7vVv7fBBSAK55
         ryOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790116191; x=1790720991;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qPZh/r/REXP5ZSy0nxs+oUBSRD0aY6qVWm9CYsML3E=;
        b=ws3F23smKAPuGNYjjT3AZoBR8RxPwCPMsB9lcsEA0a1mdjqy+oA1vIXiJQtY6yl6hS
         F2FGIpgqM3Hfxmyc/3LL5rCrGp0KWyPl0midRKjMimV2/gaiq8F1kW7iSUjo6kGhDdC7
         /g8Km3v4MhIAX+5sdmmS3et0+y+szkR0hyGw+nzyxOZl/UZZeHtjjL3eYVFxsTU1j49P
         cLC3oVQvgsOxK+L0UqAtpEaTWkvtbGLZDBIG2g5N90+rRNvJwP1vpIs0Gl55tMvLl3RX
         o6qsyA7p92BWH6HwmaV40X8uzfJhvdD/ZiM8EAsXZi+eVYHWzZSSRW+Ezm9UAAglSEER
         I9Iw==
X-Forwarded-Encrypted: i=1; AKwUvBySiR09Iwm3wAGZwX8WSLdQgWZA+mCCCAbxoJhDpeRWLwtZvxitQHjEaw4mhFohPePY6NDoQ7etZbbZkbw=@vger.kernel.org
X-Gm-Message-State: AFuF++nCIk87J6ni3o60Kk3U+zZz0wgriDGdbRKz4ggZoe77oKU5KGEa
	aBnqaGRZF20ixEZiYxlI/13i1n+h+0vFwlZ4uq7gqztaa/mMr8LNjAaL
X-Gm-Gg: AYBFou2S+DAEtCcLzcgL9Gv06CsfbJuA1LTESwB5rwsKRDOZvAXhZ912HzkOaD0XEob
	5JiI/2NdTcPscTEeqeoUU7vgTIYGfK/hUYoiAUdWNrUgTQtozOaz6Bpop3pl8rc5cHlBGo4VFIO
	pw1iSr5Voox0uq2a8tw4Nyf+kDAEGdE4jOKKbl5LL+dwmoms/jyB06iO5yAQqayZqTlG3q+f+ci
	jC9uITHWMc0S1pp0r+WlSrpbx2mzf0B1YokJUhKR8uLsMNXdw7XKDQqsmynAH4Mb4/aYFPRo743
	bvWI8B4BQjpMzBmjUUJ7SxKVK64hqOi2xu48CJOmEtzk1+DPwXq83fW9LDyZLkmWuj1D6Ldh2/S
	7fgbkxHzSzlYmkD1ZshfAWprVjYuQoB+XY67ePWXNK3zFkMzv1uq+UGZoSHp6J8K4A5xmqw3fA7
	EEIpKP+sgw6SOtlIb59KbGDinGGyN8nl4n/B8gfYkfEIdCN7ZejldXHbzOOjho0kyt6FCKMTt/e
	YtgW+Y3+O23J/fO+UIR4uHjifMiJy3UncKUxc41ApqyQhwxmoMM
X-Received: by 2002:a05:690c:c:b0:873:5bb2:6c32 with SMTP id 00721157ae682-8a45bb75c4bmr5165927b3.57.1790116191128;
        Tue, 22 Sep 2026 15:29:51 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a465ec41acsm3153167b3.26.2026.09.22.15.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:29:50 -0700 (PDT)
Date: Tue, 22 Sep 2026 18:29:49 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Paulos Yibelo <habte.yibelo@gmail.com>, 
 netdev@vger.kernel.org
Cc: richard@nod.at, 
 anton.ivanov@cambridgegreys.com, 
 johannes@sipsolutions.net, 
 willemdebruijn.kernel@gmail.com, 
 jasowangio@gmail.com, 
 mst@redhat.com, 
 eperezma@redhat.com, 
 xuanzhuo@linux.alibaba.com, 
 andrew+netdev@lunn.ch, 
 pablo@netfilter.org, 
 fw@strlen.de, 
 phil@nwl.cc, 
 razor@blackwall.org, 
 idosch@nvidia.com, 
 dsahern@kernel.org, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 linux-um@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 netfilter-devel@vger.kernel.org, 
 coreteam@netfilter.org, 
 bridge@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.259bc7096258d@gmail.com>
In-Reply-To: <20260922030310.8684-2-habte.yibelo@gmail.com>
References: <20260922030310.8684-1-habte.yibelo@gmail.com>
 <20260922030310.8684-2-habte.yibelo@gmail.com>
Subject: Re: [PATCH net v6 1/2] net: validate virtio checksum start after
 network header
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Paulos Yibelo wrote:
> __virtio_net_hdr_to_skb() checks a minimum network-header length for
> CHECKSUM_PARTIAL packets. Its checksum start is relative to skb->data,
> but some callers have not established skb->network_header when they
> convert the virtio header.
> =

> Pass the data-relative L3 origin explicitly. Ethernet receive paths
> parse the frame and nested VLAN headers without changing skb state.
> AF_PACKET uses the frame's actual L3 origin even when the socket
> protocol is ETH_P_IP and the raw frame carries VLAN tags. Non-Ethernet
> AF_PACKET devices retain their established skb network offset.
> =

> Also pass the actual L3 protocol so IPv6 packets use the 40-byte base
> header minimum even without TCPv6 GSO. IFF_TUN obtains that protocol
> from the packet before skb->protocol is set. Name the Ethernet parser
> accordingly, use the same origin for tunnel validation, and propagate
> conversion failures in UML.
> =

> The bound remains a minimum; fragmentation paths separately validate
> the parsed IPv4 or IPv6 header length before completing a checksum.
> =

> Fixes: 49d14b54a527 ("net: test for not too small csum_start in virtio_=
net_hdr_to_skb()")
> Fixes: a2fb4bc4e2a6 ("net: implement virtio helpers to handle UDP GSO t=
unneling.")
> Reported-by: Paulos Yibelo <habte.yibelo@gmail.com>
> Link: https://lore.kernel.org/netdev/20260920004733.6473-2-habte.yibelo=
@gmail.com/
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Paulos Yibelo <habte.yibelo@gmail.com>
> ---
>  arch/um/drivers/vector_transports.c | 13 ++++-
>  drivers/net/tun_vnet.h              | 52 ++++++++++++++++-
>  drivers/net/virtio_net.c            | 10 +++-
>  include/linux/virtio_net.h          | 87 ++++++++++++++++++++++++-----=

>  net/packet/af_packet.c              | 24 +++++++-
>  5 files changed, 163 insertions(+), 23 deletions(-)

The fix may still miss the case IPv4 packets have options.

This version is a very large patch.

Untested shorter first suggestion by bot, which looks plausible as a
starting point for discussion.

    --- a/drivers/net/tun_vnet.h
    +++ b/drivers/net/tun_vnet.h
    @@ -152,6 +152,9 @@ static inline int tun_vnet_hdr_to_skb(unsigned in=
t flags, struct sk_buff *skb,
                           const struct virtio_net_hdr *hdr)
     {
    +    if ((flags & TUN_TYPE_MASK) =3D=3D IFF_TUN)
    +        skb_reset_network_header(skb);
    +
         return virtio_net_hdr_to_skb(skb, hdr, tun_is_little_endian(flag=
s));
     }

    --- a/include/linux/virtio_net.h
    +++ b/include/linux/virtio_net.h
    @@ -71,9 +71,27 @@ static inline int __virtio_net_hdr_to_skb(struct s=
k_buff *skb,
             if (!pskb_may_pull(skb, needed))
                 return -EINVAL;
     =

    +        if (!skb_network_header_was_set(skb) ||
    +            (skb->dev && skb->dev->type =3D=3D ARPHRD_ETHER)) {
    +            int nhoff =3D ETH_HLEN;
    +
    +            if (unlikely(start < ETH_HLEN + nh_min_len))
    +                return -EINVAL;
    +            __vlan_get_protocol(skb, eth_hdr(skb)->h_proto, &nhoff);=

    +            nh_min_len +=3D nhoff;
    +        } else {
    +            nh_min_len +=3D skb_network_offset(skb);
    +        }
    +        if (unlikely(start < nh_min_len))
    +            return -EINVAL;
    +
    +        const struct iphdr *iph =3D (void *)(skb->data + nh_min_len =
- sizeof(*iph));
    +        if (iph->version =3D=3D 4)
    +            nh_min_len +=3D max_t(u32, iph->ihl * 4, sizeof(*iph)) -=
 sizeof(*iph);
    +        else if (iph->version =3D=3D 6)
                 /* ..here I don't trust the initial bug output, but the =
branch is clear.. */
    +        if (unlikely(start < nh_min_len))
    +            return -EINVAL;
    +
             if (!skb_partial_csum_set(skb, start, off))
                 return -EINVAL;
    -        if (skb_transport_offset(skb) < nh_min_len)
    -            return -EINVAL;
         }

    --- a/net/ipv4/ip_output.c
    +++ b/net/ipv4/ip_output.c
    @@ -772,7 +772,9 @@ int ip_do_fragment(struct net *net, struct sock *=
sk, struct sk_buff *skb,
         if (skb->ip_summed =3D=3D CHECKSUM_PARTIAL &&
             (!(dev->features & NETIF_F_CSUM_MASK) ||
    -         skb_checksum_help(skb)))
    +         skb_checksum_start_offset(skb) < (int)(iph->ihl * 4) ||
    +         skb_checksum_help(skb)))
             goto fail;
  =

And the summary of the problem:

  ### 1. What the Problem Is

  When userspace (AF_PACKET, TUN/TAP, vhost-net) or a device (virtio_net,=
 UML) injects a CHECKSUM_PARTIAL packet using struct virtio_net_hdr,
  virtio_net.h:47-119 validates hdr->csum_start:

    // include/linux/virtio_net.h:107 (added by commit 49d14b54a527)
    if (skb_transport_offset(skb) < nh_min_len)
        return -EINVAL;

  This validation has three bugs:

  1. Missing L2 + VLAN offset: skb_transport_offset(skb) (hdr->csum_start=
) is an offset from skb->data, which points to the L2 header (14
  bytes for Ethernet + 4 * n bytes for 802.1Q/802.1ad VLAN tags) on Ether=
net callers (virtio_net, IFF_TAP, PACKET_SOCK_DGRAM/SOCK_RAW).
  Comparing csum_start < 20 allows csum_start to land inside the L2 VLAN =
tags (14..21) or inside the L3 header (22..33).
  2. Wrong nh_min_len for IPv6 non-GSO: nh_min_len defaults to sizeof(str=
uct iphdr) (20) and is only raised to sizeof(struct ipv6hdr) (40)
  when gso_type is VIRTIO_NET_HDR_GSO_TCPV6. A non-GSO or GSO_UDP_L4 IPv6=
 packet is only checked against 20 bytes.
  3. Ignores IPv4 options (iph->ihl > 5): Even without an L2 header (IFF_=
TUN), an IPv4 header with options can be up to 60 bytes (ihl =3D 15),
  allowing csum_start =3D 20 to point 40 bytes inside the IPv4 options ar=
ea.

  This causes two kernel bugs downstream:

  =E2=80=A2 Bug A (WARN_ONCE / panic_on_warn in skb_checksum_help): With =
2 VLAN tags (22 bytes L2), csum_start =3D 20 passes 20 >=3D 20. Once
  eth_type_trans() + skb_vlan_untag() pull 22 bytes, skb_checksum_start_o=
ffset(skb) (csum_start - skb_headroom(skb)) becomes -2. In
  dev.c:3645, offset >=3D skb_headlen(skb) promotes signed -2 to 0xffffff=
feU, firing WARN_ONCE(1, ...) and crashing panic_on_warn=3D1 hosts.
  =E2=80=A2 Bug B (TOCTOU L3 Header Corruption -> OOB Read in ip_do_fragm=
ent): With csum_start =3D 20, csum_offset =3D 0 on TAP/AF_PACKET, csum_st=
art
  lands at byte 6 of struct iphdr (frag_off) or byte 0 (version/ihl on do=
uble-VLAN frames). In ip_output.c:774 and nf_conntrack_bridge.c:42,
  skb_checksum_help(skb) runs before hlen =3D iph->ihl * 4 is read. The 1=
6-bit checksum write corrupts iph->ihl (e.g. from 5 [20B] to 15 [60B])
  after ip_rcv_core() already validated it, causing ip_do_fragment() to r=
ead 60 bytes out-of-bounds from skb->data.
