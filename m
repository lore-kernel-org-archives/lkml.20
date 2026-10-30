Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400595;
	b=D5nxSknoa6/HVesHxhF3pxEg38RXbnfy7CE0f5NYSJ2seWCP5ozeAilK4C11n2a3joDC
	 RRa8ZEQsH1sBaPKGmWZwS+s+Naouw/HczxWHdNR39hhggvJH0rpGhtwEI9t29RzZMva/W
	 extq/TAl2pLZVW82n1v0ecX9idqpYXTNlEPyJPdWhVQCJr5cVINRzOQd3dsaakULg8DB1
	 bsJKwns7MAlsx1aXK7Tf2aJoCovKGu/BhL6dWwsCQK0Eo2RMutPoog7532hhT7NDb1/3N
	 Db4DWkOrf5tJPd5Dey0eAT/2U+MNkWO91l+GMDusiWwK1ZP9wXwuFXCHIsvRk8HJY0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400595;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+T9BCD4WHAeHhgAEVu7K97ymFe/bRNG12NnyP6fiFZk=;
	b=HSQWYncoZ8mx8zoHhHs6msP0iOkBIMiX9AQDVDvNpARv7oxv9N21tEJv+PYof6JL6/95
	 L0KJMXyNNjOIHlFj3vSXlISXKUbZ4ggjZEVfgPAbwePQttUONGRGwzqFxiMzbPCBIN1LX
	 HdMPpS0E236ws0C0FQR1uozwHkC+z+LPLVm5+PEYo39nWO9Tkde6PBfY/U9xdGrSPqzI9
	 Wb7Esp9iXn13kk5rbKKHz7Lj3i9WGD7ICyUO3shx2GurzR8M9O5R0fWvQQgWR6R2+MCMC
	 A8uCPRN8KAG5+XeY5iTHJOuXD0XP2p5435U6qYUD/q5+u4TIXZSjmbxIIU8roxJTesw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gVUqsrrZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=oaWb7p3H;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A082606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A082606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gVUqsrrZ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=oaWb7p3H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793400594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+T9BCD4WHAeHhgAEVu7K97ymFe/bRNG12NnyP6fiFZk=;
	b=gVUqsrrZkg6LpTfju9XTWs6XqPcv4Yk4oUEBoMjYA90Yxo2LDgqoFpdrTPwwLBOwFDrwli
	Wm9RMYIuOaJMl4e61QLyldCkkjM5XDRSOnok8n2F1DEnT0QXF5c4xY4KDLDuKwflhOnTAz
	6OVrkLqxQvuI9/OpyuJgzP52FuVjqWw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-g7SJTqFMPwG-leNbE1siCQ-1; Fri, 30 Oct 2026 18:49:52 -0400
X-MC-Unique: g7SJTqFMPwG-leNbE1siCQ-1
X-Mimecast-MFC-AGG-ID: g7SJTqFMPwG-leNbE1siCQ_1793400591
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a2063be13dso10826845e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793400591; x=1794005391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+T9BCD4WHAeHhgAEVu7K97ymFe/bRNG12NnyP6fiFZk=;
        b=oaWb7p3HPm1mrzmvjrrcD+rOOBFyNsI8emRPZ5AatU7kaZAZrx8guT4wTF63JJQorQ
         Y1BY5gLgakr6iMvTeSPMe4ugW4tTRGytqCMpW1rm5pR91agRoDR+S7JsVxFNqNZouGQM
         tGM8I/CGzI2jA9V3P1cRsH8h9VR57LKOD4/79SJnOIRlBpw1Xm7ffbNnmIHilX5I98Gg
         2XHalYTUxfp9mrI5qDBSO+z66INAtJjiyGV8N7j0SozuGYRDxAOmjcXKm786iH5m6go1
         E2j8UKQ8GdE9SHDQzn8uZsP/xlIWKS0m4dzqNZjehYbaNT2qVEXKI2V+7YBviY0aMnuW
         Alwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793400591; x=1794005391;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+T9BCD4WHAeHhgAEVu7K97ymFe/bRNG12NnyP6fiFZk=;
        b=k0uGBhX8fiFj4UeVIodc94jIS5YVIY/wKcgIxVgJHHEg0wDCe2GIwcGeMEJPh6Z5Qe
         iu7K+B0kTaTumLCOaLXlxCw2fiOw9gG2uN/dRZibNiv160RIsSWWM/ZeS6U+2UBCMR7O
         Xs3u2SByDSf5g5h8S1t0NYfKY1TZY0sRZFxv7Z8pexJH9zWiSHk39ZfzHoWdItkbzW6l
         8/vUprq37RYbV/tkAKkxpnjYBeB02R/YyBo2gh2A6eHAQRIpfQium7bI59mQJGn6UJUY
         4X6P56OkUQwlVsBb0RM/dXI2av516VNQV14R/AniXGpXDQjLKIN5bcZb32uwu/sGa/31
         zEvg==
X-Gm-Message-State: AFq9FYJVzEdQ17ZANE0amd6OA6P2PwdtWz/vit1MnKDmdhMCErJ9zFaO
	2/ffVIgQ+c8LabXEZh8GM+O9sZF2rdMTJMSASHLFD7bMKb+XKc+V3GttaKFdpvAcJy/nsY6gPot
	RCgFCx32BCWKIft/5b4fI8E7QQK9WTZAHRer2n1C2yGHh1Xnsai+XnkFR98HU58pfAw==
X-Gm-Gg: AYBFou1hKV+EChKj4vANPf8N9oZK3OEidwri/2383hqzlq5p3DiP9QJdDP8fDU7P3/7
	UGighNXQ7QzqS7dwOXR+YBiJF2LQLWeDchi7jMxWKf/HrK35O+ZqKD4/6FuppUijJQiCmjs2yfd
	r0il2CWC4PC5D0bVLn7va4UwNfq86wRC5ahfgWb6Vl/+vjI7mXJf0MX2Zjicl/Hxfd3Vx5xmn3t
	2T/E2hmUHdnK31Ovu5G7xAcxRnF5TM+5BygEC881BuIEAwet8ORjkhh71qlpDekpjuDjqzwPoqU
	ELojT3acUijJ0TtzosaG3MLiJihpc6KjW7rX/qHAzZoqKf+LVtE45Dhg0kE02nducsfYFzWjYt3
	/e7sXDMOn82fMW7FPOTNRX0kcOaf7xe7FdJ+LDE1VtO+k
X-Received: by 2002:a05:600c:46d1:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4ac17b2c8a7mr81098275e9.25.1793400591332;
        Fri, 30 Oct 2026 15:49:51 -0700 (PDT)
X-Received: by 2002:a05:600c:46d1:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4ac17b2c8a7mr81097795e9.25.1793400590841;
        Fri, 30 Oct 2026 15:49:50 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73c1:fd00:6c8e:5a61:f533:519d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf0b36853sm80313395e9.0.2026.10.30.15.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:49:49 -0700 (PDT)
Date: Fri, 30 Oct 2026 18:49:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, Chris Arges <carges@cloudflare.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Paulos Yibelo <habte.yibelo@gmail.com>
Subject: Re: [PATCH RFC v7 4/5] net: resolve uncommon partial checksums at
 ingress
Message-ID: <20261030184752-mutt-send-email-mst@kernel.org>
References: <cover.1793276116.git.mst@redhat.com>
 <93d0e37c99711bebdf60c120af03010455c2f2e2.1793276116.git.mst@redhat.com>
 <willemdebruijn.kernel.10a41a35b45f6@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <willemdebruijn.kernel.10a41a35b45f6@gmail.com>

On Fri, Oct 30, 2026 at 03:21:57PM -0400, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
> > As reported first by Paulos Yibelo <habte.yibelo@gmail.com> (after which
> > others, credited below, found more ways the bug can affect users) a
> > virtio net header can place CHECKSUM_PARTIAL at any in-packet offset.
> > If that state is retained, later checksum completion can modify the
> > packet after protocol processing has made decisions from it.
> > 
> > Let's fix that: let's validate csum_start and csum_offset and only keep
> > CHECKSUM_PARTIAL when csum_start and csum_offset match a parsed TCP or
> > UDP header, while handling VLAN headers, IPv4 options and IPv6 extension
> > headers.  Complete other non-GSO checksums immediately, before any
> > protocol processing runs.
> > 
> > We can't easily "complete the checksum" for GSO we don't recognize - GSO
> > assumes knowledge of the protocol. We could segment ignoring the
> > checksum then do whatever csum_start and csum_offset say, but that
> > seems like an overkill for something that shouldn't happen.
> > 
> > There's some risk here:
> > - non-gso packets which can't be parsed get checksum calculated in
> >   software, adding performance overhead
> > - gso packets which can't be parsed get dropped
> > 
> > Note that for zero copy, userspace can change the data after the
> > checksum has been calculated.  This is fundamental to zero copy by
> > design, and the only outcome is a bad checksum and a packet drop.
> > 
> > To mitigate the risks, the following patch will add a sysctl knob to
> > bypass the resolution. This is reasonable if the setup is such that
> > there is no protocol processing at all.
> > 
> > UDP tunnel headers get the same handling on the inner header.
> > 
> > Packets without VIRTIO_NET_HDR_F_NEEDS_CSUM are unaffected.
> > 
> > Note a fundamental limitation of this approach: an nf/BPF program
> > that tweaks the payload of a packet in flight may rely on the
> > checksum being fixed up later, assuming the packet carries
> > CHECKSUM_PARTIAL.
> > 
> > For metadata that fails validation the checksum
> > is now completed at input, so such edits leave a stale checksum
> > and the packet is dropped at the receiver.  Protocols whose
> > transport header we cannot parse (anything but TCP and UDP) are
> > affected even when the metadata is self-consistent.
> > 
> > The sysctl added in the next patch is the escape hatch for these setups,
> > but it is a very blunt tool.
> > 
> > Reported-by: Paulos Yibelo <habte.yibelo@gmail.com>
> > Reported-by: Chris Arges <carges@cloudflare.com>
> > Tested-by: Chris Arges <carges@cloudflare.com>
> > Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
> > Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> > +static inline bool
> > +virtio_net_l4_start(struct sk_buff *skb, unsigned int nhoff, __be16 proto,
> > +		    unsigned int *thoff, int *ip_proto)
> > +{
> > +	if (proto == htons(ETH_P_IP)) {
> > +		const struct iphdr *iph = virtio_net_ip4_parse(skb, nhoff, thoff);
> > +
> > +		if (!iph || ip_is_fragment(iph))
> > +			return false;
> > +		*ip_proto = iph->protocol;
> > +		return true;
> > +	}
> > +
> > +	if (proto == htons(ETH_P_IPV6)) {
> > +		const struct ipv6hdr *iph;
> > +		int flags = 0;
> > +
> > +		if (!pskb_may_pull(skb, nhoff + sizeof(*iph)))
> > +			return false;
> > +		iph = (const void *)(skb->data + nhoff);
> > +		if (iph->version != 6)
> > +			return false;
> > +		*thoff = nhoff + sizeof(*iph);
> > +		*ip_proto = iph->nexthdr;
> > +		if (*ip_proto != IPPROTO_TCP && *ip_proto != IPPROTO_UDP) {
> > +			*thoff = nhoff;
> > +			/* Find the transport header behind any
> > +			 * extension headers, AH included.
> > +			 */
> > +			*ip_proto = ipv6_find_hdr(skb, thoff, -1, NULL,
> > +						  &flags);
> > +			if (*ip_proto < 0 || flags & IP6_FH_F_FRAG)
> > +				return false;
> 
> Minor, not cause for respinning on its own.
> 
>     `flags` should include `IP6_FH_F_AUTH` so `ipv6_find_hdr()` stops at
>     `NEXTHDR_AUTH` instead of skipping it:
> 
>     - `CHECKSUM_PARTIAL` and GSO behind IPsec AH are invalid: AH authenticates
>       the inner L4 header including its checksum field
> 
> > +		}
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> 
> > @@ -368,6 +660,21 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> >  	skb->inner_mac_header = inner_nh + skb_headroom(skb);
> >  	skb->transport_header = outer_th + skb_headroom(skb);
> >  	skb->encapsulation = 1;
> > +
> > +	if (!skb_is_gso(skb)) {
> > +		/* Too small to segment: complete the checksum in place
> > +		 * instead of dropping - senders do tag small packets
> > +		 * with GSO headers, e.g. packetdrill sets gso_type and
> > +		 * gso_size with --mss, whatever the packet size.
> > +		 * The outer UDP checksum is not calculated, but a zero
> > +		 * one is fine: UDP over IPv4 allows a disabled
> > +		 * checksum, and so do tunnels over IPv6 where the
> > +		 * receiver opts in (RFC 6935, RFC 6936).
> > +		 */
> > +		skb_shinfo(skb)->gso_type &= ~(SKB_GSO_UDP_TUNNEL_CSUM |
> > +					       SKB_GSO_UDP_TUNNEL);
> 
> Maybe this carve-out for non-gso packet is best moved to its own
> patch, as that is where the remaining issues (to merging the rest)
> seem to be.
> 
>     1. Moving `!tnl_csum_negotiated` below `virtio_net_csum_partial_ok_at_offset()`
>        accepts packets with an unnegotiated `VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM`
>        flag whenever inner validation falls back to
>        `__virtio_net_resolve_csum_partial_mismatch()`.
>     2. `__virtio_net_resolve_csum_partial_mismatch()` calls `skb_checksum_help()`,
>        which completes only the inner checksum at `hdr->csum_start` and sets
>        `skb->ip_summed = CHECKSUM_NONE`, leaving the outer UDP `uh->check` with
>        an uncompleted pseudo-header checksum seed.
> 
>     Despite the comment, this block neither completes any checksum in place nor
>     is the outer UDP checksum zero when `VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM` is set:
>   
>     - With `VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM`, the outer `uh->check` carries the
>       non-zero pseudo-header checksum seed (as expected by
>       `__skb_udp_tunnel_segment()`), not `0`.

Oh yea i kept tweaking this and forgot to update the ocmment.

>     - Clearing `SKB_GSO_UDP_TUNNEL_CSUM` on a `!skb_is_gso(skb)` packet leaves
>       `skb->ip_summed == CHECKSUM_PARTIAL` at `inner_th` with nothing completing
>       the outer `uh->check` on transmit/forwarding (`validate_xmit_skb()` only
>       completes/offloads the single inner checksum, emitting a corrupt outer UDP
>       checksum). Even zeroing `uh->check` would be invalid over IPv6 unless the
>       receiver explicitly opted into RFC 6936 (`UDP_NO_CHECK6_RX`).

Indeed.

> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > -- 
> > MST
> > 
> 

