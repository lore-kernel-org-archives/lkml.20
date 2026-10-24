Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792824348;
	b=0+loS6kltgNBPiXupgK67dKqnK8kjOQbo9f5hRv5ZusDfyE75Ue/lwkCG8HcsnCjy74p
	 T8qM8BKVURJqkHD8XBq5Q7XqREnBDR8/Z501NP/pqBJ7Bw0uzs+1glhzBi9UllJA6Xx/j
	 5q7BZ2k1Pmnv1pjdqCy8E11G2+ZGI9LueZ8DKJU+hLm8yfaBkYgS5IjHX2ibw6WBrS/ga
	 r7n/TM7PFEyKIno6P/ju6fUZ59F52wJJJRnOVcRaE763wyUxUK9SLCzMi7cp//dF2XYxk
	 7c6MdfXvObz8dog8MeEkBn0hvjVUA3GbkLMs7FSTwJNOacNoaBDw7mzGLFkM/hsmNww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792824348;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=VZkrS3h3QtN2lN0JtRWstJekBxv3Yb3xF/ujHnm2w/E=;
	b=tQN6T+T79VKbCJ1W/9J0QawYqFBjnK2xpBW9+Y2rks9Ob3JNjdGnaccDgiY9SuFUwRRa
	 6rgAdZ6RwgnllFiWHnDNWfaXicejYIMrtJcZBwC6hvdSJCO1yIijYVoa4HJwcWfMKE4qe
	 3WHNn8b6i/zayd2eWw/cZvdli65YNTxSTOlnxaQTVpOPBtAf5Ygt89N3UTPFcnWgK66TL
	 ZXCuHu6prE+shKSmFMDmXkjY0l5FCC0RWnmwakkNRN7Omor5Qnpdzkkd6HngMOo/tbnRb
	 7i71H/yypWLKXY1SVvuIyCppMa0fNryp4WpY1mMwXPsoTOsQU0qw4hXy62PzYHuuDRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d+lyTAKh;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qyWrtnwO;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0447606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0447606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d+lyTAKh;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qyWrtnwO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792824347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VZkrS3h3QtN2lN0JtRWstJekBxv3Yb3xF/ujHnm2w/E=;
	b=d+lyTAKhPmDtX12WWDap8CvgxibbWlmcCGY8fuWFqpk6/lVYMwQPD39whL9raMmoANV8BD
	TcLBv/416qOEH+39L94ceZvqzv14s7zPodrAsk6ewyR4RULJ6rEMixHpgUNLjcp35ixaMU
	UwNcU9zfuIiA54y6obX+aLvlivFiB2k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163--lUwVi68P4e9HXmzu4Y7dQ-1; Sat, 24 Oct 2026 02:45:44 -0400
X-MC-Unique: -lUwVi68P4e9HXmzu4Y7dQ-1
X-Mimecast-MFC-AGG-ID: -lUwVi68P4e9HXmzu4Y7dQ_1792824343
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1895ffc83so11060105e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792824343; x=1793429143; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZkrS3h3QtN2lN0JtRWstJekBxv3Yb3xF/ujHnm2w/E=;
        b=qyWrtnwOQ/VuuWPScSgijCP+M7VHXg8PK7QLyCGp0Y7D/rUTgjc/9RizDiVhlu7dPY
         laBdpxunQICvYpKnx8sKthxhHZJjOx0ApDSXbYDDAvydfZ5Pwtg9CQ2f2cibuL2to2tN
         geljcatw5qL/kWpevQqvu3+UEZSZWAvo8koK20y71iUcLo+oN1a+1q5+TF07rjzggsbp
         cIjbFzXMjS9g714qiKjnMiXHwl++CYOwSHiZCG24Gl+nTFDv5ISdRDcDbB+5qkXGu0xP
         KT1PUJpKc0ty5XGdjOI2QECEAZOdHl3vX6T1MOiyf4dl1f7QWKxKJnoeJhV7h47LCztD
         ZcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792824343; x=1793429143;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VZkrS3h3QtN2lN0JtRWstJekBxv3Yb3xF/ujHnm2w/E=;
        b=CoxNY0DxTTzakzmFX1wa4ExzwRaq8zjrnYaiowh3/ZOdXFke4Aik4D0Vp+WVN3ZD1T
         wmWRQ1o0AvSO2pG1MEXSiThqw4k17re4TvckMLpDDgxpWPSMI1h+vq7Wu6onmEHVDGjc
         P3q/SdhC6yEAU305xvBsBnP+6CkktK6RuJZgNApqQ9fkz3+8h5ZL3XxRJX4Jnwj/pzSC
         qwLPGFTQZivVO81sug3zvnCP99DS1x0kgn97MZviR0eeCZ7qzob+xKesxCAtWTMjHuzw
         S3W7LfnpGiJaBeAmdmF2bDt8EEs5EwNIr4iV+0jtVj247nt/u7cgrf0/ZibW8MrFLkg/
         ZMQw==
X-Forwarded-Encrypted: i=1; AKwUvBxgaMf3G3dwpaoBzONrV8VckF9HIbW43DWAWum1kzhG/lC8AsodSg1SiKAD/iIFUUqV1URPdqEZBNEL4WY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcCGERaDN7XWnqrkiu019znaAMWmnWo1SUQQmazXzwSlDmW23h
	MtjgKcpS07PZYILFC8TCJ1rbfr3gPIHm/kC6ApUDTLpslJDZFN5RyWlvz7J+ZOWITbSj+u7mr/9
	OGp6eBvGUHIE9FTR/jCbJTRLjRFZKs6P1SooJLMH1BwiCq5ZgX28/M2a9UYScBFl8ng==
X-Gm-Gg: AYBFou3RPIClsSaqshfsGFSVLhDYb9EkIuqp9NLUZ+RInigZZHC96cytJFVIkR3MjK7
	LT6++Edj836jEC+1RVYV1Fnk75IqR9fKiJlPLtWhnPVY3ROfaylhmlQbLp0n+55G3nR5nn2kdp/
	mktdhnITRUwD5yb7L4z0015CdVpcYRTc5bqG/+QHc69xP7auYnHahPON8n2M91FbQ5ZdsMkEImu
	fJ9LaBL63hwC7+aam04Un98j21GfhTmJBkJO+nD8BhmWqRwWlbXMtdLHmXOSag9VyNuo6DBtJEh
	Elq3XgWoS4++00sQf7E6GDXx3wHYkahZKkdtu9i4xv2SJQWBtn8QVTcf2F4JO9ZvHpgGGYE=
X-Received: by 2002:a05:600c:3487:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4a35ac8c231mr16890875e9.9.1792824343220;
        Fri, 23 Oct 2026 23:45:43 -0700 (PDT)
X-Received: by 2002:a05:600c:3487:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4a35ac8c231mr16890615e9.9.1792824342728;
        Fri, 23 Oct 2026 23:45:42 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f3e00asm63050615e9.0.2026.10.23.23.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:45:41 -0700 (PDT)
Date: Sat, 24 Oct 2026 02:45:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guikun Yang <yangguikun19@qq.com>
Cc: Jason Wang <jasowang@redhat.com>, Eugenio Perez <eperezma@redhat.com>,
	kvm@vger.kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vhost/net: initialize the whole negotiated RX vnet header
Message-ID: <20261024024028-mutt-send-email-mst@kernel.org>
References: <tencent_803981983647D9F9444561A4227F138C600A@qq.com>
 <20261023080824-mutt-send-email-mst@kernel.org>
 <tencent_E3543FCAC26722EA3D15F87B69C4C769D905@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_E3543FCAC26722EA3D15F87B69C4C769D905@qq.com>

On Sat, Oct 24, 2026 at 10:11:01AM +0800, Guikun Yang wrote:
> On Fri, Oct 23, 2026 at 08:13:22AM -0400, Michael S. Tsirkin wrote:
> > Which backend did you use? Sounds like you did not set
> > TUN_VNET_TNL_SIZE or did not set TUNSETOFFLOAD?
> > That's the issue then.
> 
> The backend is a tap device attached via the normal tun path:
> TUNSETIFF (IFF_TAP|IFF_NO_PI, no IFF_VNET_HDR),

Ah, no IFF_VNET_HDR *with* vhost. That's a weird combination.

> then
> VHOST_NET_SET_BACKEND on the RX vq.
> 
> I re-ran the repro with TUNSETOFFLOAD declared before attaching the
> backend, listing every offload bit the interface understands:
> 
> 	TUN_F_CSUM | TUN_F_TSO4 | TUN_F_TSO6 |
> 	TUN_F_USO4 | TUN_F_USO6 |
> 	TUN_F_UDP_TUNNEL_GSO | TUN_F_UDP_TUNNEL_GSO_CSUM
> 
> TUNSETOFFLOAD succeeds (0 is returned, so tun accepted all of them,
> including the UDP tunnel GSO bits).  The result is unchanged:
> 
> 	features[0] = 0x108000000, features[1] = 0xa   (tunnel bits on)
> 	VHOST_SET_FEATURES_ARRAY ok
> 	TUNSETOFFLOAD ok
> 	--- RX buffer first 32 bytes (initially all 0xAA) ---
> 	hdr: 00 00 00 00 00 00 00 00 00 00 01 00
> 	     aa aa aa aa aa aa aa aa aa aa aa aa     <-- offsets 12..23
> 	     33 33 00 00 ...
> 
> Offsets 12..23 still contain the stale 0xAA fill.
> 
> The reason is that vhost_net_set_features() computes vhost_hlen purely
> from the feature bits passed via VHOST_SET_FEATURES(_ARRAY):
> 
> 	hdr_len = ... sizeof(struct virtio_net_hdr_v1_hash_tunnel) when
> 	           HOST/GUEST_UDP_TUNNEL_GSO is set ...
> 	if (test_bit(VHOST_NET_F_VIRTIO_NET_HDR))
> 		vhost_hlen = hdr_len;
> 
> TUNSETOFFLOAD only updates tun->set_features and the tap device's
> wanted_features; it does not feed back into the vhost feature bits or
> into vhost_hlen.  handle_rx() then writes vhost_hlen bytes of the
> virtio-net header into the guest buffer while handle_tx() / the GSO
> path never touches those 12 bytes for a header vhost itself built.
> 
> I could not find TUN_VNET_TNL_SIZE anywhere in 7.3.0-rc7 or in

Apologies. TUN_VNET_TNL_SIZE is an internal macro that header size
is set it. TUNSETVNETHDRSZ is what I meant.

> linux-next (drivers/net/tun.c, drivers/vhost/net.c, include/uapi/linux/
> if_tun.h, include/uapi/linux/vhost.h) — is that an interface from a
> tree/series I'm missing?  If it is meant to gate vhost_hlen I'd be
> happy to re-test with it.
> 
> Meanwhile the stale 12 bytes are observable with a plain tun backend
> that has declared full tunnel offload support, so I believe the patch
> (Zero-initialize the largest header layout and copy vhost_hlen bytes)
> is still needed.  Happy to re-test under whatever backend setup you
> had in mind.
> 
> Best,
> Guikun Yang


I have in mind simply disabling this combo: vhost + !IFF_VNET_HDR)

I'll research a bit whether anything anywhere could reasonably
use it.

Can you reproduce any problem *with* IFF_VNET_HDR?

-- 
MST

