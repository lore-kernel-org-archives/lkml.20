Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F8C47DD5E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143306; cv=none; b=J5w26K70OILOEfM4JG9Yag3LoNN6cCRFoV+Nd1MhK5fa94yz90VEfHlxV3jiTGZhbSZgxEAQLnosYXBV1vi+KenF3k4a/wDB/yXUeVRJjDE/M34PmsqCBmeNuXM0O3ja3nC19x7A3A2dc/3DEQBCSzgfSKDuu9f20U6Mw+Pw89I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143306; c=relaxed/simple;
	bh=SvJnPD8Ri3yRLNc6nOQWvNaks4SnEcx2IgKY2ydlvYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eh6236+AxwDk8j4dtpm2bnFAxby490LfGuyRgFBBSHBykNLge1nEKRGEjI3XTFXN3cLsisL1xqMVM0U3EOAxL9SwcI8b0UFio91OJqu311PG2QFHfCC67IsKuRr2jg9xm1iB+oOYo0w0frE4B+YFsuFPN+WapOi81ZGbrlW7dQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NgTjrYj+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kd7AC9qB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NgTjrYj+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kd7AC9qB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792143303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=STGIBzF7IXCg0Dt5MH8LTKL1dPgHZxkNaGTLsOHq/7Y=;
	b=NgTjrYj+FrHNNOh6R/B0GiV5GS9kcmwybNRHbFqYCSRJZgV8Yt9sL5pIdP+BL/9nP92yzN
	ESfLc26qJdIAmCZ0CC+FSwDH6MJxRevAF2DUxau+SojQwvqC1tm48emJ0Npr5HZm4xvQSm
	e3qkN0q9PWdYKuQ3q1DL+a55BC+p7uI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-GFZAu3lnN0Osh5hz271DlA-1; Fri, 16 Oct 2026 09:34:55 +0000
X-MC-Unique: GFZAu3lnN0Osh5hz271DlA-1
X-Mimecast-MFC-AGG-ID: GFZAu3lnN0Osh5hz271DlA_1792143295
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a166a9ea21so52173735e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792143294; x=1792748094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STGIBzF7IXCg0Dt5MH8LTKL1dPgHZxkNaGTLsOHq/7Y=;
        b=Kd7AC9qBhrbclpcwNTX/G3+zAzWPWAceq/5lpii1j+LGfuRxebnbtuMIFH4TtRqCsl
         sdoGcezay5qZfj6CijA0qVLe9KAHH+1Q+dJfMkPfF/7BUXkOPPZa8YqmCvndoe90EQYW
         35MM/QnSa1n1IzKRRvtus1BthRTD3AS49+cJLWeSuHw742f3ZNe8hQpvAO3BLFC/WlFb
         et8b+CQvKPQXkqyBc5ypJNDv9HddUBm6PTt7QQ2Cj51FFoB5NsH7hl9DpUidwoOiYoYq
         vDD8RfavpOUJG9o3rblssoPXdP9JrWG/rs+XfXLHPZEnO7Rh3a1RZBXZPsUcdWttT8XZ
         r8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143294; x=1792748094;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STGIBzF7IXCg0Dt5MH8LTKL1dPgHZxkNaGTLsOHq/7Y=;
        b=Gzi8b+wJ0mRnYvbVi6M06kLk1bdLi/Ujdix3WuOnpGBKMa5zBmqzN8v9+U3KVc1OKE
         fp9XNV/6YfsmThWtBKnqWWs3hTPIVik2Nc/H8VJCZJ99mTmMPUYflXOylPf1oKGoUxQq
         35hgxT473LA6RGSKgA9idmsK8EXALCmCpmzMXCK2Ohkiy3MfePh2VMsAc4pOnmaLB/yr
         GD4fzESTy2yH+fjv75uYRxDns2KOvI+N5u7VkKIY+4+ItNXHxH2a16AqU3c8rsL2vnZM
         LApPoHp+h89yokJWlUpF4iyRAi4LnJCk3sNesCBeiqCGb+KH/G44nYldwvxS4+c4MdKQ
         Y0Yw==
X-Forwarded-Encrypted: i=1; AKwUvBzoOUl4pRn5OKJiVRYbA2Ax61SVDon35dvFzuQve/izL1Oe8zXGz+q0b0cbl2zcsh+e4zbN9jI6aWzC9L4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9n4rcszA2bKIOu7yy9i4VugFS4eOVP4/fX4/d52I+pVR5A1QD
	7Xa+7mqezG9BpeXMkAVEd/oWraggwXyaj0vCoWp/q1Ngav9Hh6kBaV21Xr9z4yOhpSy9ILY9x0U
	/gTNhl6Q0nD1cUQnLD00AZ6l8ELHhv8uVrxPy/V0rOK5lddLVM3PK+0C0iImSD90Tow==
X-Gm-Gg: AYBFou3KICWAJVkyAVcFExhZArMCYNY2qMTf6nsnDWnIU8nXOW9OqeB7g7/eOfVrOBh
	k5Uo+sAdqzYjPJWDJFszu4qBhTMAaUI7PSU+jcsIThsdHW1qvjcLkOq0pgGtWVKpJSOEgb97L2Y
	xfSqpIExMOECGj5QefaVI8BAil8he3xsDd/wLKADmmlvGff+M1FIkB7S8KIvmJEaezd3oprQ8kJ
	6F9DdHRZOnbdm/nMsUTzW4g5JVv14oP5ioTnmr3INRMG8OEncKqQztHm7+2LuRXwiHTkE7Iw6i2
	ZdaTOLvl7gNH6NFp50yOsq6ec+danYMfnGGfY8hTUBLnRf7JWr324tRswKI2ZM+kpqMFOw==
X-Received: by 2002:a05:600c:8b78:b0:4a0:25d5:e853 with SMTP id 5b1f17b1804b1-4a18e4ddd99mr445336135e9.35.1792143294516;
        Fri, 16 Oct 2026 02:34:54 -0700 (PDT)
X-Received: by 2002:a05:600c:8b78:b0:4a0:25d5:e853 with SMTP id 5b1f17b1804b1-4a18e4ddd99mr445335765e9.35.1792143293959;
        Fri, 16 Oct 2026 02:34:53 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510c78sm3761709f8f.57.2026.10.16.02.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:34:53 -0700 (PDT)
Date: Fri, 16 Oct 2026 05:34:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chris Arges <carges@cloudflare.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	linux-kernel@vger.kernel.org, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Rusty Russell <rusty@rustcorp.com.au>,
	Max Krasnyansky <maxk@qualcomm.com>,
	Paulos Yibelo <habte.yibelo@gmail.com>
Subject: Re: [PATCH net-next v2 4/7] net: resolve uncommon partial checksums
 at ingress
Message-ID: <20261016053324-mutt-send-email-mst@kernel.org>
References: <cover.1792067836.git.mst@redhat.com>
 <e66f7984fdeb8168e07fd7d0dad3deb8c30ead0a.1792067836.git.mst@redhat.com>
 <willemdebruijn.kernel.11ecc15463d9@gmail.com>
 <atEnABN9QePqsaIf@20HS2G4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atEnABN9QePqsaIf@20HS2G4>

On Thu, Oct 15, 2026 at 02:18:24PM -0500, Chris Arges wrote:
> On 2026-10-15 13:43:56, Willem de Bruijn wrote:
> > Michael S. Tsirkin wrote:
> > > As reported first by Paulos Yibelo <habte.yibelo@gmail.com> (after which
> > > others, credited below, found more ways the bug can affect users) a
> > > virtio net header can place CHECKSUM_PARTIAL at any in-packet offset.
> > > If that state is retained, later checksum completion can modify the
> > > packet after protocol processing has made decisions from it.
> > > 
> > > Let's fix that: let's validate csum_start and csum_offset and only keep
> > > CHECKSUM_PARTIAL when csum_start and csum_offset match a parsed TCP or
> > > UDP header, while handling VLAN headers, IPv4 options and IPv6 extension
> > > headers.  Complete other non-GSO checksums immediately, before any
> > > protocol processing runs.
> > > 
> > > We can't easily "complete the checksum" for GSO we don't recognize - GSO
> > > assumes knowledge of the protocol. We could segment ignoring the
> > > checksum then do whatever csum_start and csum_offset say, but that
> > > seems like an overkill for something that shouldn't happen.
> > > 
> > > There's some risk here:
> > > - non-gso packets which can't be parsed get checksum calculated in
> > >   software, adding performance overhead
> > > - gso packets which can't be parsed get dropped
> > > 
> > > To mitigate the risks, the following patch will add a sysctl knob to
> > > bypass the resolution. This is reasonable if the setup is such that
> > > there is no protocol processing at all.
> > > 
> > > UDP tunnel headers get the same handling on the inner header.
> > > 
> > > Packets without VIRTIO_NET_HDR_F_NEEDS_CSUM are unaffected.
> > > 
> > > Assisted-by: LLM
> > > Reported-by: Paulos Yibelo <habte.yibelo@gmail.com>
> > > Reported-by: Chris Arges <carges@cloudflare.com>
> > > Tested-by: Chris Arges <carges@cloudflare.com>
> > > Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
> > > Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  include/linux/virtio_net.h | 251 +++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 241 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
> > > index d6466f96cdd0..357115ff0ec2 100644
> > > --- a/include/linux/virtio_net.h
> > > +++ b/include/linux/virtio_net.h
> > > @@ -5,7 +5,11 @@
> > >  #include <linux/if_vlan.h>
> > >  #include <linux/ip.h>
> > >  #include <linux/ipv6.h>
> > > +#include <linux/netdevice.h>
> > >  #include <linux/udp.h>
> > > +#include <net/gso.h>
> > > +#include <net/ip.h>
> > > +#include <net/ipv6.h>
> > >  #include <net/tcp.h>
> > >  #include <uapi/linux/tcp.h>
> > >  #include <uapi/linux/virtio_net.h>
> > > @@ -48,6 +52,171 @@ static inline int virtio_net_hdr_set_proto(struct sk_buff *skb,
> > >  	return 0;
> > >  }
> > >  
> > > +/* TODO: nothing virtio specific here, move to ip.h */
> > > +
> > > +/*
> > > + * Pull and minimally validate the IPv4 header at @nhoff.
> > > + * Returns the header and stores the transport header offset in
> > > + * @thoff, or NULL if truncated or malformed.  Only the fixed header
> > > + * is guaranteed linear; callers that need the options or the
> > > + * transport header must pull further.
> > > + */
> > 
> > nit: comment basically describes the code (what), which is quite
> > self explanatory. I'd drop. Or else consider converting to kdoc fmt.
> > 
> > > +static inline struct iphdr *virtio_net_ip4_parse(struct sk_buff *skb,
> > > +						  unsigned int nhoff,
> > > +						  unsigned int *thoff)
> > > +{
> > > +	struct iphdr *iph;
> > > +
> > > +	if (!pskb_may_pull(skb, nhoff + sizeof(struct iphdr)))
> > > +		return NULL;
> > > +
> > > +	iph = (struct iphdr *)(skb->data + nhoff);
> > > +	if (iph->version != 4 ||
> > > +	    iph->ihl < sizeof(struct iphdr) / sizeof(u32))
> > > +		return NULL;
> > > +
> > > +	*thoff = nhoff + iph->ihl * sizeof(u32);
> > > +	return iph;
> > > +}
> > > +
> > > +/* Where does the L3 header start, and what protocol is it?
> > > + * Handles Ethernet and VLAN headers; other devices use the
> > > + * network header offset the caller set up.
> > > + */
> > > +static inline bool
> > > +virtio_net_l3_start(struct sk_buff *skb, int *nhoff, __be16 *proto)
> > > +{
> > > +	if (skb->dev->type == ARPHRD_ETHER) {
> > 
> > Only since recent commit 44378d02c5aa ("net: always dissect GSO
> > packets in __virtio_net_hdr_to_skb()") can skb->dev be relied on to be
> > non-zero.
> > 
> > We'll have to be careful that this does not get backported to stable
> > without that.
> > 
> > Perhaps an explicit precondition test and error return (and
> > DEBUG_NET_WARN_ON_ONCE) if a NULL skb->dev is encountered.
> > 
> > OTOH, it results in a hard crash so will be discoverd fast without
> > that too.
> > 
> > 
> > > +		if (!pskb_may_pull(skb, ETH_HLEN))
> > > +			return false;
> > > +		*nhoff = ETH_HLEN;
> > > +		*proto = eth_hdr(skb)->h_proto;
> > 
> > When called from virtio_net_hdr_tnl_to_skb, according to my LLM mac
> > header may not be set yet. Have not verified yet.
> > 
> > skb_reset_mac_header(skb) is called inside __virtio_net_hdr_to_skb,
> > which is then not called yet.
> > 
> 
> I am able to confirm this in my testing. I have KASAN enabled, and it
> triggered when testing leading me to this change.
> 
> Adding `skb_reset_mac_header(skb);` before calling virtio_net_tnl_offsets_ok
> mitigates this issue.
> 
> --chris

I was sure I run that test. Facepalm. Thanks a lot, I'll go over
this again.

> 
> > > +		if (eth_type_vlan(*proto)) {
> > > +			*proto = __vlan_get_protocol(skb, *proto, nhoff);
> > > +			if (!*proto)
> > > +				return false;
> > > +		}
> > > +	} else {
> > > +		*nhoff = skb_network_offset(skb);
> > 
> > The same is true for skb->network_header. Since an uninitialized/zero
> > value there causes more subtle issues, here an explicit check may be
> > more valuable (even) than for skb->dev.
> > 
> > > +		*proto = skb->protocol;
> > > +	}
> > > +	return true;
> > > +}
> > > +
> > 
> > >  
> > >  /* This function must be called after virtio_net_hdr_from_skb(). */
> > > @@ -282,6 +470,35 @@ static inline unsigned int virtio_l3min(bool is_ipv6)
> > >  	return is_ipv6 ? sizeof(struct ipv6hdr) : sizeof(struct iphdr);
> > >  }
> > >  
> > > +/* Do the tunnel offsets match the outer headers in the frame?
> > > + * The L3 header the tunnel claims must be the one the frame
> > > + * carries, with UDP following it at @outer_th.
> > > + */
> > > +static inline bool
> > > +virtio_net_tnl_offsets_ok(struct sk_buff *skb, bool outer_isv6,
> > > +			  unsigned int outer_th)
> > > +{
> > > +	int nhoff;
> > > +	__be16 proto;
> > > +	unsigned int thoff;
> > > +	int ip_proto;
> > > +
> > > +	if (!virtio_net_l3_start(skb, &nhoff, &proto))
> > > +		return false;
> > > +	if (outer_isv6 != (proto == htons(ETH_P_IPV6)))
> > > +		return false;
> > > +	if (!virtio_net_l4_start(skb, nhoff, proto, &thoff, &ip_proto))
> > > +		return false;
> > > +
> > > +	return ip_proto == IPPROTO_UDP && outer_th == thoff;
> > > +}
> > > +
> > > +/*
> > > + * Return value:
> > > + * 0 - success
> > > + * >0 - checksum was completed in software (slow path)
> > > + * <0 - failure
> > > + */
> > >  static inline int
> > >  virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> > >  			  const struct virtio_net_hdr_v1_hash_tunnel *vhdr,
> > > @@ -293,6 +510,7 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> > >  	unsigned int inner_nh, outer_th, inner_th;
> > >  	unsigned int inner_l3min, outer_l3min;
> > >  	u8 gso_inner_type, gso_tunnel_type;
> > > +	__be16 inner_proto;
> > >  	bool outer_isv6, inner_isv6;
> > >  	int ret;
> > >  
> > > @@ -332,10 +550,13 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> > >  	    inner_th < inner_nh + inner_l3min)
> > >  		return -EINVAL;
> > >  
> > > +	if (!virtio_net_tnl_offsets_ok(skb, outer_isv6, outer_th))
> > > +		return -EINVAL;
> > > +
> > >  	/* Let the basic parsing deal with plain GSO features. */
> > >  	ret = __virtio_net_hdr_to_skb(skb, hdr, true,
> > >  				      hdr->gso_type & ~gso_tunnel_type);
> > > -	if (ret)
> > > +	if (ret < 0)
> > >  		return ret;
> > >  
> > >  	/* In case of USO, the inner protocol is still unknown and
> > > @@ -353,7 +574,7 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> > >  	}
> > >  
> > >  	skb_set_inner_protocol(skb, inner_isv6 ? htons(ETH_P_IPV6) :
> > > -						 htons(ETH_P_IP));
> > > +			    htons(ETH_P_IP));
> > >  	if (hdr->flags & VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM) {
> > >  		if (!tnl_csum_negotiated)
> > >  			return -EINVAL;
> > > @@ -368,7 +589,17 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> > >  	skb->inner_mac_header = inner_nh + skb_headroom(skb);
> > >  	skb->transport_header = outer_th + skb_headroom(skb);
> > >  	skb->encapsulation = 1;
> > > -	return 0;
> > > +
> > > +	/*
> > > +	 * We know VIRTIO_NET_HDR_F_NEEDS_CSUM was set so __virtio_net_hdr_to_skb
> > > +	 * set CHECKSUM_PARTIAL.
> > > +	 */
> > > +	inner_proto = inner_isv6 ? htons(ETH_P_IPV6) : htons(ETH_P_IP);
> > > +	if (virtio_net_csum_partial_ok_at_offset(skb, gso_inner_type, inner_nh,
> > > +						 inner_proto))
> > > +		return 0;
> > > +
> > > +	return virtio_net_resolve_csum_partial_mismatch(skb);
> > >  }
> > >  
> > >  /* Checksum-related fields validation for the driver */
> > > -- 
> > > MST
> > > 
> > 
> > 

