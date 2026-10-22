Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792712341;
	b=QWZ5YLHdX8jE7cu1L492oOJtzIFokzMBSrPXPCCiCEHOKoc20vigaNNhdYZFcRL+VsOz
	 /NftMgLjMFRtWEO9LU1qbL0ngkO+hFfnZgZpV6yfg8BxKq73ZlbCfEip1Ad5obZk2Xobe
	 SJdZmEDsahCedzRTb7m72Bh+d+VVvPsQfmeNQaa4DdTbhuaxBsaE57Y+iAoRdd9L+yaZZ
	 7N9nHLF7bg1t5FSK0OcTADRvfOVvDXum81807xP3VOb9K0bix+60wb2K2dHA1Vji/e2y9
	 Hz16SRlW6PvQijVs87h7lhENFxW9l4mBDEb1mRWd60REReAR8r2glC+9mb+Bfn3H0rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792712341;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Nqaq+KGmgq+7t4ixqZSLUjFN4QjJmmGs/RCocqmgwTQ=;
	b=Gwfu32gGFOvgur99kBtjM1DmD7USP9srxxbsme2fS/TlKf/ZWDAlyYVI1pUuCeqTziX+
	 UdmfuP/IRp44wM6OsA24WYrNgOcDY4MJ6lr7o7kF/+FCbF51n/xeIdB0FgcmkGhYB7dRw
	 SyOifH7NdtWuIizR/GlVMeCTlFatVzEArI+AM0r3D15oZAZojKxKcRZiANULvDHW/JHrM
	 gLiHqA+69dFFe1vZ1MX5txYTrCbQurqDnjqvRHc2MiAaajwEEi7UUETg+gp8BowKQaOy4
	 W+i2JChMaGEY04btCB+hXEvgUs0InfW2lnSZ+EejYPJ8hD9MNfm/z6LEN0lfYAk1geg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fnqsRThz;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="h5T/yWrg";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E795D606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E795D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fnqsRThz;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=h5T/yWrg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792712340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nqaq+KGmgq+7t4ixqZSLUjFN4QjJmmGs/RCocqmgwTQ=;
	b=fnqsRThz9vxDV5ZsV6Ix4ml+uRyXI9Igbef+PSp/B8dHyIa0I0SzOjnhZIQ1D3JT+1SXu7
	zDnQlS+xSB6SvuMLMPDFlNEzQRfVWfKvblQQJ41r9dfhni+X4JknD0GsHZezpGfwMBssIQ
	3OZEOjd+l5mTr2AZfykPB9RG48V2YZo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-otVodghdOCWUoBX5nFFglA-1; Thu, 22 Oct 2026 19:38:58 -0400
X-MC-Unique: otVodghdOCWUoBX5nFFglA-1
X-Mimecast-MFC-AGG-ID: otVodghdOCWUoBX5nFFglA_1792712338
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49953abe51fso1888765e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792712337; x=1793317137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nqaq+KGmgq+7t4ixqZSLUjFN4QjJmmGs/RCocqmgwTQ=;
        b=h5T/yWrg0r0GPks25qnD0SyfNo3HEgZC79cvuuTP6lbU1oSmnbqekgfCsM8CsUnX+U
         8RwmK0Ckd/kHXT8P8WCHefOtaMbF4LWwyXoGhr9dr1prXxrQkKwc+07Q2VGcUtEAZhDo
         TpF+S6hF1iR3bNq6p6JxC+IJKdgwdyFAUtmSFDOrkFc6ngL7n7m1HmgF2sI+b7e/R9Yv
         uy4cbPFb8f2mh2vrfJNqgYeudUzHKnGX5oGxmB2TpqyzpEcGsT/DgZxCexxLN7uWkDxb
         pwNXlfITD4f6TfHZ8Npit2ywRDgwEiOgccypkowTuqifqrhU8GGTEf5bRBr/nGs4jTNO
         5vLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792712337; x=1793317137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nqaq+KGmgq+7t4ixqZSLUjFN4QjJmmGs/RCocqmgwTQ=;
        b=d620yRzmpgxGvdBXTavW4pdpqoGYFs+aOG50eIOLnS5G3bOmltUP/JyR4osWGVdqgS
         Vq7ilfnkeDPNFKH6B/PbbgJ5snEAclmN4KFZpODr+ujFthykRT8NesFd9/emIcYU5mMS
         Pa76D4p/kfTPgSv4R0j6raYV0x0vA++iw7H72LM0BUOkttWS4sQn7TvTMdI60yXDBcS6
         fBFmooSQHmtJcjRnBmSrmPI11CsKYKYHtyqjNmxN5J7h6IzXzvtYvxvepof4vPMTaIwk
         OFZ2wXRiwO4xaNdBBtLA63lw0x7HofoweIu+6KVe8p/g8tPOJDlyM2GVTXhHgkkwBK9X
         6KEA==
X-Forwarded-Encrypted: i=1; AKwUvBzneUaLeoAB+Nz7JIOFwp7OStkbDPjKpK2RMzEYvFXWhNO7rqEjdWhN3C/8yJOcOy7iGzkKofIN35aPlmk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1qW29F29v83/STHqkTSksF8Vr0jVGOY2+mG0H5OHb8juXuEOi
	RAVmCd5tyB283XY1Mn97KsEC0XWgWgSI3E7dIkvYwmxuiVy+WFpfiea36HL8x/KnoyOXI5ydfwA
	5bUmlhvFVijmj1DtgBVjgGQBOc4v/MsG4KtTO6Sfu3G7EZCIg8VZydKIZQRVEX2crZg==
X-Gm-Gg: AYBFou30qLLc+7g08C7f02h7kL8gEKWpX0I68ch6jt4CddfVER0S4k71HZ81QU74/p5
	v80eLFcW7L28BCozECtvC4JJAiqzXQNpx0PbPiVpcz7cMGdFzcwsN1IgtZTkVpMRA7omeFqA68L
	gw4x7phbDuOp0u2zfauBYq3Hwd+0St6AGYmfpCs7r1XVL6TFrZ8dcf6gb+427a4zOVXHJjJUGy9
	BSut5sKFzemwkaKDDY5LM9CKf6dMNZvRmaJSGZtxYVnOcf7zOrRD2Ky8l9WhCtMFPsWpmglRx7u
	6E6EaQUgx3Y43eyMyU4sEuW/3TYMEChmZh0KN6h54S/ajn6WMgcBKhJqggevf7W/UFCXQ6c=
X-Received: by 2002:a05:600c:350e:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4a211c7fb6bmr9087325e9.4.1792712337453;
        Thu, 22 Oct 2026 16:38:57 -0700 (PDT)
X-Received: by 2002:a05:600c:350e:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4a211c7fb6bmr9087035e9.4.1792712337018;
        Thu, 22 Oct 2026 16:38:57 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210473567sm30620015e9.12.2026.10.22.16.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 16:38:56 -0700 (PDT)
Date: Thu, 22 Oct 2026 19:38:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chris Arges <carges@cloudflare.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH net v5 4/7] net: resolve uncommon partial checksums at
 ingress
Message-ID: <20261022193052-mutt-send-email-mst@kernel.org>
References: <cover.v5.git.mst@redhat.com>
 <342bf5331e12b2e5b940510293233bb8bce46127.1792668082.git.mst@redhat.com>
 <willemdebruijn.kernel.2987fc5710162@gmail.com>
 <atpIiwcUlH5ttBb6@20HS2G4>
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
In-Reply-To: <atpIiwcUlH5ttBb6@20HS2G4>

On Thu, Oct 22, 2026 at 12:52:36PM -0500, Chris Arges wrote:
> > > @@ -335,9 +592,12 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> > >  	/* Let the basic parsing deal with plain GSO features. */
> > >  	ret = __virtio_net_hdr_to_skb(skb, hdr, true,
> > >  				      hdr->gso_type & ~gso_tunnel_type);
> > > -	if (ret)
> > > +	if (ret < 0)
> > >  		return ret;
> > >  
> 
> One other case I found in testing is that a producer can set gso_size
> larger than the remaining packet data. __virtio_net_hdr_to_skb() then
> succeeds, but intentionally does not install GSO state because the packet
> is too small to segment. NEEDS_CSUM has still left the skb with
> CHECKSUM_PARTIAL.

So why is this a problem? If checksum offset is correct we leave
packet as CHECKSUM_PARTIAL. That's intentional.
What does your test do that makes this a problem?

> The following check fixes my test case:
> 
> 	if (!virtio_net_hdr_validate_disabled(skb) &&
> 	    !skb_is_gso(skb))
> 		return -EINVAL;
> 
> A concern I have is this may reject valid packets, so maybe there's a better
> place for this.


Indeed, it's not uncommon to have small packets with !gso.

See also:
commit 7c6d2ecbda83150b2036a2b36b21381ad4667762
    net: be more gentle about silly gso requests coming from user
    


> 
> > > +	if (!virtio_net_tnl_offsets_ok(skb, outer_isv6, outer_th))
> > > +		return -EINVAL;
> > > +
> > >  	/* In case of USO, the inner protocol is still unknown and
> > >  	 * `inner_isv6` is just a guess, additional parsing is needed.
> > >  	 * The previous validation ensures that accessing an ipv4 inner
> > > @@ -353,7 +613,7 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> > >  	}
> > >  
> > >  	skb_set_inner_protocol(skb, inner_isv6 ? htons(ETH_P_IPV6) :
> > > -						 htons(ETH_P_IP));
> > > +			    htons(ETH_P_IP));
> > >  	if (hdr->flags & VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM) {
> > >  		if (!tnl_csum_negotiated)
> > >  			return -EINVAL;
> > > @@ -368,7 +628,22 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> > >  	skb->inner_mac_header = inner_nh + skb_headroom(skb);
> > >  	skb->transport_header = outer_th + skb_headroom(skb);
> > >  	skb->encapsulation = 1;
> > > -	return 0;
> > > +
> > > +	if (!skb_is_gso(skb))
> > > +		skb_shinfo(skb)->gso_type &= ~(SKB_GSO_UDP_TUNNEL_CSUM |
> > > +					       SKB_GSO_UDP_TUNNEL);
> > > +
> > > +	/*
> > > +	 * We know VIRTIO_NET_HDR_F_NEEDS_CSUM was set so __virtio_net_hdr_to_skb
> > > +	 * set CHECKSUM_PARTIAL.
> > > +	 */
> > > +	inner_proto = inner_isv6 ? htons(ETH_P_IPV6) : htons(ETH_P_IP);
> > 
> > on second thought, if having to respin, might as well fold the trivial
> > fix in patch 7 in here from the start.
> > 
> > > +	if (virtio_net_csum_partial_ok_at_offset(skb, gso_inner_type, inner_nh,
> > > +						 inner_proto))
> > > +		return 0;
> > > +
> > > +	/* A tunnel header implies GSO, so drop. */
> > 
> > no longer true for the above !skb_is_gso(skb) case
> >
> 
> virtio_net_csum_partial_ok_at_offset()

Sorry I don't get what you are saying.

>  
> > > +	return __virtio_net_resolve_csum_partial_mismatch(skb);
> > >  }
> > >  
> > >  /* Checksum-related fields validation for the driver */
> > > -- 
> > > MST
> > > 
> > 
> > 

