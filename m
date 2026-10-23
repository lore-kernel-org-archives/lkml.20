Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792719489;
	b=FT9Njr10EpbBTU3pjduyeiognxjLvrkuAGBnLbf8MfwBRs4Ue8aJBTk0ygfUdqgW5DDG
	 2PmJJktnhF2unV2Q0Q1PMYbU+PcSY3z0Lt0nAR3P7VPcnM12XvvQeEjRnX7aj1jpG3Bv9
	 50G8IGm7RQivkP9wOQKrXSZ01OX0V1U/Sp9Wyn1ntAZbPe4Eo6V/uxM3VLvgVMyOfOGjo
	 2K33+AMqEI+2N/ukGFa2hVNJvHkVmLWANLq2zLwPC9xBFeAI1n/rAHPCkamf/c5PGSBLX
	 68s6ecj/TNFkAtrBVbKP0yCVfD9yMqv+qJOy8Oibe9XK5Gk3ht7YSFllkapGnCieA3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792719489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VyS6G3Kx6WPq1nBIZXm3hw0RmZ6T3d+8BhWqtGP+Tt4=;
	b=lHFh31IhfDsiOxZeVpPGsQ86XnAL80IwvCQUYPEGqVE+SonCD6K5BKe7Nn9pFkWnZY4t
	 DyCHtWTQuhqEdzWiyIVORNyWUPF3rwU8MGFMrw5db/k69oW8jmwhj4XiVIEbxHSTSQ6XO
	 nF53anzqChR3vAM5ER8m7YxNCKzCDVnaFQGjA9ReMLjhFAXQUK6lkS4yiomhszhYOU/LV
	 bYoyWKa3pyMUS6k74F267zW6KOM9y8UbHCuF8j0DcMEhY58hi2rQtpreOLMpkPB06zHfw
	 ikEf3Maao3olMOaqF9XmI9dWLLtU6N3Bty0KwP0Sy9zXWJ6TjXqTcf6dhLEqA22bwKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=NS4IRFub;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610CB606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 610CB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=NS4IRFub
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8256106635eso192492a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1792719487; x=1793324287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VyS6G3Kx6WPq1nBIZXm3hw0RmZ6T3d+8BhWqtGP+Tt4=;
        b=NS4IRFubSNO2j9Y1WVfgO6Awpo3hnuCUulnPg4eByIxHDtOwxZOdWL4UoKe1Adbhp4
         xCnMZ5IuP/e9cEYfwwR5qi+85GwzSDYRfb7FHzEkqxC1SaasJk01AezXkpJCr0++wswi
         QsHVXluMi9q3rz+c0KuCyFS5VP4sFSUY/S/WaUDqGacY7dbnytqOIFRZ/O8WAa4En9Ez
         CwnxTZk9XNb2DV6ApTf+KT1MyysDlqIHsizc4zrngtmjpWuvPI2z0WP/1HFToV1qH+5v
         ml0Iq6VBpUD9Mp6+GsXfBJsq3NZkpQfVMg3h8O3J2wMpj4PHzcU1YR4pqPcy2QWu6qXy
         YqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792719487; x=1793324287;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VyS6G3Kx6WPq1nBIZXm3hw0RmZ6T3d+8BhWqtGP+Tt4=;
        b=mJL9g5MInfsN0Ohxtt651wAgPkb2rEBbOApL1ezEymP9bPOoCyk2R796Ec0l7/EfVu
         h/CWweMSRfPlD2HCzrwo7GM+2Td2i52yApbh9YQbG2vLq6iidU/l4KHWbxjQ88HWYiFx
         3ZWdG92SYCMzgQUPkf2YS2L2kxfvU+ZQsnMKI2zcTFraesdkjB/WdAIsgu3HEhBFcGz6
         9StR474yMvT8QMW20K9zTRZT9i1vYFTVyKmPKWw5oPmjtZNNiVhRGi7Wg/N71nxDv3K/
         BR/tshIsm2nWPcQU5Hu5bmtKj7e+adatHK9XoSZ8lcGIL341yM2lLQikhWLTIyoDVR8X
         3qTw==
X-Forwarded-Encrypted: i=1; AKwUvBzmMJGtSoVj329ReDcwn9L5kiFPTtnftC5b51k4o3J/3BiFncjQIjSbjATJhmxVYnqXr7segu1Zhe61eXw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKta9VRI//15H/mr4UQVUfG7CmDwQ6CmxIfZ3ahVwnmHa2arxgd
	JM2iCsiLIZAHgQIdSsGo0mccsL366TpWQno/slwxxvm5jrcTOnHE6Z65d89Eh327Wvs=
X-Gm-Gg: AYBFou1+e/z1QTGzgh5vPgNrS0k+Rt3yGEkXTK+G8JY12KJWbGHakv7NfpHDfla72oI
	otUAV1othZ9E2A9Ot2tz4CNuZZhuVk06m6YH+NeApRJSddUS/s6Se/SzgJVr7KY42rR/Z6SYwNM
	nn3A6bSQ23HbMDsiNNI/tpQ3OXVlBbwDhk0o0ENG8cGktADG7SmEj9XjlFX2yhMbuhM4FjJO8fE
	NFknlqpA+lDAnlnQ+7pMio+Hn7eHtXBL54n9q72j3fMjYxeVyJnVU9wnMNbIvMXKJVd1B5MsqKt
	cGCz7MMApePjwqXcehsWLNEGXNWUwO0EmSnKctkHu3b+oua2ap1HU0uN6M8cQLeytYGut6hltF/
	tic7fAQh622asMinyWmAToPcjrWQZFj943fBQv8+eOcUec3LhxBdlTddxf4Ey9m0HRzgVeIxY6w
	R+oGn099qIUxkR+JPxqMnGRR2GvOU5vQHEPXSNgNJT6pnfK8ZKpA3fuKzC6HXW0oIrpLCe/jsgX
	8p5VhpPd3rVHgDhNFSY4K5zri0XEzWnFtk=
X-Received: by 2002:a05:6830:4412:b0:7eb:9464:ac2e with SMTP id 46e09a7af769-84fb0d542femr668994a34.11.1792719487276;
        Thu, 22 Oct 2026 18:38:07 -0700 (PDT)
Received: from 20HS2G4 ([2a09:bac6:bf21:96::f:3b8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbdf59d82sm770666a34.15.2026.10.22.18.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 18:38:05 -0700 (PDT)
Date: Thu, 22 Oct 2026 20:38:03 -0500
From: Chris Arges <carges@cloudflare.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, virtualization@lists.linux.dev, 
	Max Krasnyansky <maxk@qualcomm.com>, Rusty Russell <rusty@rustcorp.com.au>, 
	Paulos Yibelo <habte.yibelo@gmail.com>
Subject: Re: [PATCH net v5 4/7] net: resolve uncommon partial checksums at
 ingress
Message-ID: <atq3hiJcsVi_1v0u@20HS2G4>
References: <cover.v5.git.mst@redhat.com>
 <342bf5331e12b2e5b940510293233bb8bce46127.1792668082.git.mst@redhat.com>
 <willemdebruijn.kernel.2987fc5710162@gmail.com>
 <atpIiwcUlH5ttBb6@20HS2G4>
 <20261022193052-mutt-send-email-mst@kernel.org>
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
In-Reply-To: <20261022193052-mutt-send-email-mst@kernel.org>

On 2026-10-22 19:38:53, Michael S. Tsirkin wrote:
> On Thu, Oct 22, 2026 at 12:52:36PM -0500, Chris Arges wrote:
> > > > @@ -335,9 +592,12 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> > > >  	/* Let the basic parsing deal with plain GSO features. */
> > > >  	ret = __virtio_net_hdr_to_skb(skb, hdr, true,
> > > >  				      hdr->gso_type & ~gso_tunnel_type);
> > > > -	if (ret)
> > > > +	if (ret < 0)
> > > >  		return ret;
> > > >  
> > 
> > One other case I found in testing is that a producer can set gso_size
> > larger than the remaining packet data. __virtio_net_hdr_to_skb() then
> > succeeds, but intentionally does not install GSO state because the packet
> > is too small to segment. NEEDS_CSUM has still left the skb with
> > CHECKSUM_PARTIAL.
> 
> So why is this a problem? If checksum offset is correct we leave
> packet as CHECKSUM_PARTIAL. That's intentional.
> What does your test do that makes this a problem?

The problem I saw used this case and setting inner_nh_offset incorrectly.
I'll dig more into this, and follow-up separately if this indeed is a
real problem.

> 
> > The following check fixes my test case:
> > 
> > 	if (!virtio_net_hdr_validate_disabled(skb) &&
> > 	    !skb_is_gso(skb))
> > 		return -EINVAL;
> > 
> > A concern I have is this may reject valid packets, so maybe there's a better
> > place for this.
> 
> 
> Indeed, it's not uncommon to have small packets with !gso.
> 
> See also:
> commit 7c6d2ecbda83150b2036a2b36b21381ad4667762
>     net: be more gentle about silly gso requests coming from user
>     

Ok this is helpful, I can see why that doesn't work.
Thanks

> 
> 
> > 
> > > > +	if (!virtio_net_tnl_offsets_ok(skb, outer_isv6, outer_th))
> > > > +		return -EINVAL;
> > > > +
> > > >  	/* In case of USO, the inner protocol is still unknown and
> > > >  	 * `inner_isv6` is just a guess, additional parsing is needed.
> > > >  	 * The previous validation ensures that accessing an ipv4 inner
> > > > @@ -353,7 +613,7 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> > > >  	}
> > > >  
> > > >  	skb_set_inner_protocol(skb, inner_isv6 ? htons(ETH_P_IPV6) :
> > > > -						 htons(ETH_P_IP));
> > > > +			    htons(ETH_P_IP));
> > > >  	if (hdr->flags & VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM) {
> > > >  		if (!tnl_csum_negotiated)
> > > >  			return -EINVAL;
> > > > @@ -368,7 +628,22 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> > > >  	skb->inner_mac_header = inner_nh + skb_headroom(skb);
> > > >  	skb->transport_header = outer_th + skb_headroom(skb);
> > > >  	skb->encapsulation = 1;
> > > > -	return 0;
> > > > +
> > > > +	if (!skb_is_gso(skb))
> > > > +		skb_shinfo(skb)->gso_type &= ~(SKB_GSO_UDP_TUNNEL_CSUM |
> > > > +					       SKB_GSO_UDP_TUNNEL);
> > > > +
> > > > +	/*
> > > > +	 * We know VIRTIO_NET_HDR_F_NEEDS_CSUM was set so __virtio_net_hdr_to_skb
> > > > +	 * set CHECKSUM_PARTIAL.
> > > > +	 */
> > > > +	inner_proto = inner_isv6 ? htons(ETH_P_IPV6) : htons(ETH_P_IP);
> > > 
> > > on second thought, if having to respin, might as well fold the trivial
> > > fix in patch 7 in here from the start.
> > > 
> > > > +	if (virtio_net_csum_partial_ok_at_offset(skb, gso_inner_type, inner_nh,
> > > > +						 inner_proto))
> > > > +		return 0;
> > > > +
> > > > +	/* A tunnel header implies GSO, so drop. */
> > > 
> > > no longer true for the above !skb_is_gso(skb) case
> > >
> > 
> > virtio_net_csum_partial_ok_at_offset()
> 
> Sorry I don't get what you are saying.
> 
> >  
> > > > +	return __virtio_net_resolve_csum_partial_mismatch(skb);
> > > >  }
> > > >  
> > > >  /* Checksum-related fields validation for the driver */
> > > > -- 
> > > > MST
> > > > 
> > > 
> > > 
> 
